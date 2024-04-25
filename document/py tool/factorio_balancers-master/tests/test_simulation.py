import random
from fractions import Fraction
from factorio_balancers.graph import Splitter, Belt
from factorio_balancers import Balancer


from tests.test_blueprint import TestBase


def random_priority(allow_off=False):
    choices = [Splitter.Priority.left.value, Splitter.Priority.right.value]
    if allow_off:
        choices.append(Splitter.Priority.off.value)
    return random.choice(choices)


def set_random_fraction(belt):
    belt.content = Fraction(belt.capacity, random.randint(1, 10))


def random_belt(capacity=None, allow_none=True):
    if allow_none:
        if random.choice([True, False]):
            return None
    if capacity is None:
        capacity = random.randint(1, 3)
    belt = Belt(capacity=capacity)
    set_random_fraction(belt)
    return belt


def total_contents(s):
    conns = [s.input_left, s.input_right, s.output_left, s.output_right]
    conns = [conn.content for conn in conns if conn]
    return sum(conns)


def random_splitter():
    splitter = Splitter(
        input_priority=random_priority(),
        output_priority=random_priority())
    splitter.input_left = random_belt()
    splitter.input_right = random_belt()
    splitter.output_left = random_belt()
    splitter.output_right = random_belt()
    return splitter


class TestBalancerBase(TestBase):

    def assertOutputBalance(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        is_output_balanced = balancer.test_output_balance(**kwargs)
        if not is_output_balanced:
            raise AssertionError('Balancer is not output balanced')

    def assertNoOutputBalance(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        is_output_balanced = balancer.test_output_balance(**kwargs)
        if is_output_balanced:
            raise AssertionError('Balancer is output balanced')

    def assertInputBalance(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        is_input_balanced = balancer.test_input_balance(**kwargs)
        if not is_input_balanced:
            raise AssertionError('Balancer is not input balanced')

    def assertNoInputBalance(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        is_input_balanced = balancer.test_input_balance(**kwargs)
        if is_input_balanced:
            raise AssertionError('Balancer is input balanced')

    def assertFullThroughput(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        has_full_throughput, worst = balancer.test_throughput(**kwargs)
        if not has_full_throughput:
            raise AssertionError('Balancer does not have full throughput')

    def assertNoFullThroughput(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        has_full_throughput, worst = balancer.test_throughput(**kwargs)
        if has_full_throughput:
            raise AssertionError('Balancer has full throughput')

    def assertThroughputUnlimited(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        unlimited, worst = balancer.test_throughput_unlimited(**kwargs)
        if not unlimited:
            raise AssertionError('Balancer is throughput limited')

    def assertThroughputLimited(self, string, **kwargs):
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string, verbose=kwargs.get('verbose', False))
        unlimited, worst = balancer.test_throughput_unlimited(**kwargs)
        if unlimited:
            raise AssertionError('Balancer is throughput unlimited')


class TestGraphSplitter(TestBase):
    NR_CYCLES = 100

    def test_splitter_backup(self):
        for _ in range(self.NR_CYCLES):
            splitter = random_splitter()
            splitter.balance()
            if splitter.get_available_inputs():
                outputs = splitter.get_available_outputs()
                self.assertEqual(len(outputs), 0)

    def test_splitter_balance(self):
        for _ in range(self.NR_CYCLES):
            capacity = random.randint(1, 3)
            splitter = Splitter()
            splitter.output_left = Belt(capacity=capacity)
            splitter.output_right = Belt(capacity=capacity)
            splitter.input_left = random_belt()
            splitter.input_right = random_belt()
            splitter.balance()
            self.assertEqual(
                splitter.output_left.content,
                splitter.output_right.content)

        for _ in range(self.NR_CYCLES):
            splitter = Splitter()
            capacity = random.randint(1, 3)
            splitter.input_left = Belt(capacity=capacity)
            splitter.input_right = Belt(capacity=capacity)
            splitter.input_left.supply()
            splitter.input_right.supply()
            splitter.output_left = random_belt()
            splitter.output_right = random_belt()
            splitter.balance()
            self.assertEqual(
                splitter.input_left.content,
                splitter.input_right.content)

    def test_splitter_priority(self):
        for _ in range(self.NR_CYCLES):
            splitter = Splitter(
                input_priority=random_priority(allow_off=False),
                output_priority=random_priority(allow_off=False))
            capacity = random.randint(1, 3)
            splitter.input_left = Belt(capacity=capacity)
            splitter.input_right = Belt(capacity=capacity)
            splitter.input_left.supply()
            splitter.input_right.supply()
            splitter.output_left = random_belt()
            splitter.output_right = random_belt()
            splitter.balance()
            if splitter.input_priority == Splitter.Priority.left.value:
                self.assertTrue(
                    splitter.input_left.content < splitter.input_right.content
                    or splitter.input_left.empty and splitter.input_right.empty
                    or splitter.input_left.full and splitter.input_right.full)
            else:
                self.assertTrue(
                    splitter.input_left.content > splitter.input_right.content
                    or splitter.input_left.empty and splitter.input_right.empty
                    or splitter.input_left.full and splitter.input_right.full)

    def test_splitter_no_loss(self):
        for _ in range(self.NR_CYCLES):
            splitter = random_splitter()
            total = total_contents(splitter)
            splitter.balance()
            total2 = total_contents(splitter)
            self.assertEqual(total, total2)

    def test_nodes(self):
        splitter = Splitter()
        splitter.input_left = Belt(capacity=3)
        splitter.input_right = Belt()
        splitter.output_left = Belt()
        splitter.output_right = Belt()

        splitter.input_left.supply()
        splitter.input_right.supply(Fraction(1, 2))
        splitter.balance()


class TestBalancerSimulation(TestBalancerBase):
    NR_CYCLES = 100

    def test_import_4x4(self):
        string = 'blueprint_strings/4x4_balancer.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string, extensive=True)

    def test_import_4x4_limited(self):
        string = 'blueprint_strings/4x4_limited_balancer.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertNoFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_import_4x4_throughput_limited(self):
        string = 'blueprint_strings/4x4_balancer_throughput_limited.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_import_3x3_not_balanced(self):
        string = 'blueprint_strings/3x3_not_balanced.blueprint'
        self.assertNoOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_import_3x3(self):
        string = 'blueprint_strings/3x3_balancer.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_import_different_speeds(self):
        string = 'blueprint_strings/1x3_different_speeds.blueprint'
        self.assertOutputBalance(string)
        self.assertNoOutputBalance(string, trickle=True)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)
        string = 'blueprint_strings/3x1_different_speeds.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertNoInputBalance(string, trickle=True)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)

    def test_priority(self):
        string = 'blueprint_strings/splitter.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        string = 'blueprint_strings/splitter_output_priority.blueprint'
        self.assertNoOutputBalance(string)
        self.assertInputBalance(string)
        string = 'blueprint_strings/splitter_input_priority.blueprint'
        self.assertOutputBalance(string)
        self.assertNoInputBalance(string)

    def test_4x4_balancer_using_priority(self):
        string = 'blueprint_strings/4x4_balancer_using_priority.blueprint'
        self.assertOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_4x4_splitter_block(self):
        string = 'blueprint_strings/4x4_splitter_block.blueprint'
        self.assertNoOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)
        string = 'blueprint_strings/4x4_splitter_block_priority.blueprint'
        self.assertNoOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)

    def test_4x4_balancer_belt_weave(self):
        string = 'blueprint_strings/4x4_balancer_belt_weave.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

    def test_4x3_balancer_splitter_to_underground(self):
        string = 'blueprint_strings/4x3_balancer_splitter_underground.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)


class TestNetworkxGraph(TestBalancerBase):
    def test_4x4_balancer(self):
        string = 'blueprint_strings/4x4_balancer.blueprint'
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string)
        balancer.make_networkx_graph()

    def test_1x1_lane_balancer(self):
        string = 'blueprint_strings/1x1_lane_balancer_output.blueprint'
        with open(string) as f:
            string = f.read()
        balancer = Balancer(string=string)
        balancer.make_networkx_graph()


class TestLaneBalancerSimulation(TestBalancerBase):
    def test_1x1_lane_balancer_output(self):
        string = 'blueprint_strings/1x1_lane_balancer_output.blueprint'
        self.assertOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)

    def test_1x1_lane_balancer_output_false_inputs(self):
        string = 'blueprint_strings/1x1_lane_balancer_false_inputs.blueprint'
        self.assertOutputBalance(string)
        self.assertNoInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)

    def test_1x1_lane_balancer_input(self):
        string = 'blueprint_strings/1x1_lane_balancer_input.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputUnlimited(string)

    def test_4x4_lane_balancer_input(self):
        string = 'blueprint_strings/4x4_lane_balancer_input.blueprint'
        self.assertOutputBalance(string)
        self.assertInputBalance(string)
        self.assertFullThroughput(string)
        self.assertThroughputLimited(string)

