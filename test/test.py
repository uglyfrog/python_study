# def getCount(inputStr):
#     num_vowels = 0
#     vowelsList = ["a","e","i","o","u"]
#
#     for i in inputStr:
#         if i in vowelsList:
#             num_vowels += 1
#     #yourcodehere
#
#     return num_vowels
#
# print(getCount("abracadabra"))


# def dig_pow(n,p):
#     s=0
#     for i,c in enumerate(str(n)):
#         s += pow(int(c),p+i)
#         print(i)
#         print(c)
#         print(s)
#     return s/n if s%n==0 else -1
#
#
# print(dig_pow(92,1))

# defxo(s):
#	s=s.lower()
#	returns.count("x")==s.count("o")

#
# def solution(number):
#     result = 0
#     for i in range(number):
#         if i % 3 == 0 or i % 5 == 0:
#             print(i)
#             result += i
#
#
#     print(result)
#
# solution(15)


# def countBits(n):
#     print(bin(n))
#     s = str(bin(n).replace("0b", ""))
#     print(s)
#     return s.count("1")
#
#
# print(countBits(1234))


# defcountBits(n):
# total=0
# whilen>0:
# total+=n%2
# n>>=1
# print(n)
# returntotal

# print(countBits(8))

# defDNA-strand(dna):
#	tempStr=dna
#	tempStr=tempStr.replace('A','1').replace("T","2").replace("C","3").replace("G","4")
#	tempStr=tempStr.replace('1','T').replace("2","A").replace("3","G").replace("4","C")
#	returntempStr

# defDNA-strand(dna):
#	pairs={'A':'T','T':'A','C':'G','G':'C'}
#	return''.join([pairs[x]forxindna])

# example="ACTG"
# print(DNA-strand(example))


# defdigital-root(n):
##...
# sum=0
# forindex,iteminenumerate(str(n)):
#	sum+=int(item)
# ifsum>10:
#	returndigital-root(sum)
# else:
#	print(sum)
#	returnsum



# digital-root(77)


# defis-isogram(string):
#	string=string.lower()
#	foriteminstring:
#		ifstring.count(item)>1:
#			returnFalse
#	returnTrue


##yourcodehere

# print(is-isogram("haad"))

# defsong-decoder(song):
# return"".join(song.replace("WUB","").split()) if len(song)<=200 else -1

# print(song-decoder("AWUBBWUBWUBC"))

# defdisemvowel(string):
#	#returnstring.translate(str.maketrans("aeiouAEIOU","1111111111")).replace("1","")
#	#translator=str.maketrans({key:None for key in "aeiouAEIOU"})
#	translator=str.maketrans("","","aeiouAEIOU")
#	returnstring.translate(translator)
# print(disemvowel("ThiswebsiteisforlosersLOL!"))



# defaccum(s):
#	string=[]
#	forindex,iteminenumerate(s):
#	foriinrange(6):
#		string.append(item)
# print(string)
#
# accum("ZpglnRxqenU")


# defaccum(s):
# stringList=[]
# for index,item in enumerate(s):
# string=""
# for i in range(index+1):
# string += item
# stringList.append(string.capitalize())
# print("-".join(stringList))


# defaccum(s):
# return'-'.join(c.upper()+c.lower() if or i,c in enumerate(s))

# print(accum("abc"))


# def delete-nth(order,max-e):
# element = list(set(order))
# for item in element:
# if order.count(item)<=max-e:
# pass
# else:
# order.reverse()
# for i in range(order.count(item)-max-e):
# order.remove(item)
# order.reverse()
# return order


# print(delete-nth([20,20,37,20,21,37],1))


# def find-nb(m):
#	print(m)
#	num = int(pow(4*m,1/4))
#	if num:
#		for i in range(num+2,1,-1):
#			if pow(i.(i+1),2)==4*m:
#				return i
#		return -1
#	else:
#		return -1

# print(find-nb(1025292944081385001))


# def decodeMorse(morseCode):
#     morse_code = {}
#     morse_code["A"] = ".-"
#     morse_code["B"] = "-..."
#     morse_code["C"] = "-.-."
#     morse_code["D"] = "-.."
#     morse_code["E"] = "."
#     morse_code["F"] = "..-."
#     morse_code["G"] = "--."
#     morse_code["H"] = "...."
#     morse_code["I"] = ".."
#     morse_code["J"] = ".---"
#     morse_code["K"] = "-.-"
#     morse_code["L"] = ".-.."
#     morse_code["M"] = "--"
#     morse_code["N"] = "-."
#     morse_code["O"] = "---"
#     morse_code["P"] = ".--."
#     morse_code["Q"] = "--.-"
#     morse_code["R"] = ".-."
#     morse_code["S"] = "..."
#     morse_code["T"] = "-"
#     morse_code["U"] = "..-"
#     morse_code["V"] = "...-"
#     morse_code["W"] = ".--"
#     morse_code["X"] = "-..-"
#     morse_code["Y"] = "-.--"
#     morse_code["Z"] = "--.."
#     morse_code[" "] = "|"
#     morse_code["."] = ".-.-.-"
#     morse_code["-"] = "-...-"
#     morse_code["SOS"] = "...---..."
#     morse_code["!"] = "-.-.--"

#     morse_code_new = {value: key for key, value in morse_code.items()}
#     # print(morse_code_new)

#     # phrase="BOTHFICKLEDWARVESJINXMYPIGQUIZ."
#     # phrase='.... . -.--   .--- ..- -.. .'
#     morse_list_new = []
#     morse_list = list(morseCode.split("   "))

#     for item in morse_list:
#         morse_list_string = ''.join([morse_code_new.get(i,i) for i in item.split()])
#         morse_list_new.append(morse_list_string)

#     print(morse_list_new)

#     return " ".join(i for i in morse_list_new).lstrip()


# print(decodeMorse('      ...---... -.-.--   - .... .   --.- ..- .. -.-. -.-   -... .-. --- .-- -.   ..-. --- -..-   .--- ..- -- .--. ...   --- ...- . .-.   - .... .   .-.. .- --.. -.--   -.. --- --. .-.-.-'))


# def decodeMorse1(morseCode):
#     morse_code = { }
#     morse_code["A"] = ".-"
#     morse_code["B"] = "-..."
#     morse_code["C"] = "-.-."
#     morse_code["D"] = "-.."
#     morse_code["E"] = "."
#     morse_code["F"] = "..-."
#     morse_code["G"] = "--."
#     morse_code["H"] = "...."
#     morse_code["I"] = ".."
#     morse_code["J"] = ".---"
#     morse_code["K"] = "-.-"
#     morse_code["L"] = ".-.."
#     morse_code["M"] = "--"
#     morse_code["N"] = "-."
#     morse_code["O"] = "---"
#     morse_code["P"] = ".--."
#     morse_code["Q"] = "--.-"
#     morse_code["R"] = ".-."
#     morse_code["S"] = "..."
#     morse_code["T"] = "-"
#     morse_code["U"] = "..-"
#     morse_code["V"] = "...-"
#     morse_code["W"] = ".--"
#     morse_code["X"] = "-..-"
#     morse_code["Y"] = "-.--"
#     morse_code["Z"] = "--.."
#     morse_code[" "] = "|"
#     morse_code["."] = ".-.-.-"
#     morse_code["-"] = "-...-"
#     morse_code["SOS"] = "...---..."
#     morse_code["!"] = "-.-.--"

#     morse_code_new = {value: key for key, value in morse_code.items()}
#     return ' '.join(''.join(morse_code_new[letter] for letter in word.split(' ')) for word in morseCode.strip().split('   '))
# #n.(n+1)=4.m.m
# #n.n+n=4.m.m
# print(decodeMorse1('      ...---... -.-.--   - .... .   --.- ..- .. -.-. -.-   -... .-. --- .-- -.   ..-. --- -..-   .--- ..- -- .--. ...   --- ...- . .-.   - .... .   .-.. .- --.. -.--   -.. --- --. .-.-.-'))


# def findAverage(allStars):
#     return sum(allStars) / len(allStars)
#
#
# print(findAverage([1, 9, 2, 8, 10]))


# def gap(g, m, n):
#     primenum = []
#     while (m <= n):
#         isprime = True
#         for i in range(2, int(pow(m,0.5)) + 1):
#             if m % i == 0:
#                 isprime = False
#                 pass
#         if isprime:
#             if len(primenum)>0:
#                 if m-primenum[-1] == g:
#                     return [primenum[-1],m]
#             primenum.append(m)
#         m += 1
#     print(primenum)
#
#     # for i in range(0, len(primenum) - 1):
#     #     if primenum[i + 1] - primenum[i] == g:
#     #         return [primenum[i],primenum[i+1]]
#     return None
#
#
# print(gap(10, 300, 400))


# def palindrome_chain_length(n):
#     result = n
#     count = 0
#
#     while True:
#         reverse_num = int(str(result)[::-1])
#         if str(result) == str(reverse_num):
#             print(count)
#             print(result)
#             return count
#         else:
#             result = result + reverse_num
#             count += 1
#
#     print(result)
#     # parameter n is a positive integer
#     # your function should return the number of steps

#
# palindrome_chain_length(87)


#
# pyramid = [
#     [75],
#     [95, 64],
#     [17, 47, 82],
#     [18, 35, 87, 10],
#     [20,  4, 82, 47, 65],
#     [19,  1, 23, 75,  3, 34],
#     [88,  2, 77, 73,  7, 63, 67],
#     [99, 65,  4, 28,  6, 16, 70, 92],
#     [41, 41, 26, 56, 83, 40, 80, 70, 33],
#     [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
#     [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
#     [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
#     [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
#     [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
#     [4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60, 4, 23],]
#
# def max_triangle(a, b):
#
#   res = pyramid[a][b] + max(max_triangle(a+1, b), max_triangle(a+1, b+1)) if len(pyramid) != a else 0
#   return res
#
# print(max_triangle(0, 0))


# def longest_slide_down(pyramid):
#     for i in range(len(pyramid) - 2, -1, -1):
#         for j in range(0, i + 1):
#             pyramid[i][j] += max(pyramid[i + 1][j], pyramid[i + 1][j + 1])
#     print(pyramid[0][0])
#
# longest_slide_down(pyramid)



# print(longest_slide_down([
#     [75],
#     [95, 64],
#     [17, 47, 82],
#     [18, 35, 87, 10],
#     [20,  4, 82, 47, 65],
#     [19,  1, 23, 75,  3, 34],
#     [88,  2, 77, 73,  7, 63, 67],
#     [99, 65,  4, 28,  6, 16, 70, 92],
#     [41, 41, 26, 56, 83, 40, 80, 70, 33],
#     [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
#     [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
#     [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
#     [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
#     [63, 66,  4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
#     [4, 62, 98, 27, 23,  9, 70, 98, 73, 93, 38, 53, 60, 4, 23],
#     ]))

#
# def increment_string(strng):
#     numstr = ""
#     zero_index = 0
#     if strng == "" or strng[-1].isalpha():
#         return strng + "1"
#
#     for char in strng[::-1]:
#         if char.isdigit():
#             numstr = char + numstr
#         else:
#             break
#
#     print(numstr)
#     num_str_index = strng.index(numstr)
#
#     for char in numstr:
#         if int(char) == 0:
#             zero_index += 1
#         else:
#             break
#
#     print(numstr[zero_index:])
#
#     if zero_index > 0 and int(numstr[-1]) == 9 and len(str(int(numstr)+1)) > len(str(int(numstr))) or zero_index == len(numstr):
#         numstr =  numstr[:(zero_index-1)] + str(int(numstr)+1)
#     else:
#         numstr =  numstr[:zero_index] + str(int(numstr)+1)
#
#     return strng[:num_str_index] + numstr





#
# def increment_string(strng):
#     head = strng.rstrip('0123456789')
#     print(head)
#     tail = strng[len(head):]
#     print(tail)
#     if tail == "": return strng+"1"
#     return head + str(int(tail) + 1).zfill(len(tail))

#
# def increment_string2(s):
#     if s and s[-1].isdigit():
#         print("s",s)
#         print("前面项",increment_string2(s[:-1]))
#         return increment_string2(s[:-1]) + "0" if s[-1] == "9" else s[:-1] + str(int(s[-1]) + 1)
#     return s + "1"


# import re
#
# def increment_string3(input):
#     match = re.search("(\d*)$", input)
#     if match:
#         number = match.group(0)
#         if number is not "":
#             return input[:-len(number)] + str(int(number) + 1).zfill(len(number))
#     return input + "1"
#
# increment_string2("f0759")


# def solution(args):
#     lenlst = len(args)
#     numlst = []
#     i = 0
#     numstr = []
#     while i < lenlst:
#         low = args[i]
#         while i < lenlst - 1 and args[i] + 1 == args[i + 1]:
#             i += 1
#         hi = args[i]
#         if hi - low >= 2:
#             numlst.append(str(low) + "-" + str(hi))
#         elif hi - low == 1:
#             numlst.append(str(low))
#             numlst.append(str(hi))
#         else:
#             numlst.append(str(low))
#         i += 1
#
#     return ",".join(numlst)
#
# print(solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]))


# def solution(args):
#     out = []
#     beg = end = args[0]
#
#     for n in args[1:] + [""]:
#         if n != end + 1:
#             if end == beg:
#                 out.append(str(beg))
#             elif end == beg + 1:
#                 out.extend([str(beg), str(end)])
#             else:
#                 out.append(str(beg) + "-" + str(end))
#             beg = n
#         end = n
#
#     return ",".join(out)
#
# print(solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]))


# def rangeexpand(txt):
#     lst = []
#     for r in txt.split(','):
#         if '-' in r[1:]:
#             r0, r1 = r[1:].split('-', 1)
#             lst += range(int(r[0] + r0), int(r1) + 1)
#         else:
#             lst.append(int(r))
#     return lst
#
#
# print(rangeexpand('-6,-3--1,3-5,7-11,14,15,17-20'))
#
# import re
#
#
# def rangeexpand(txt):
#     lst = []
#     for rng in txt.split(','):
#         start, end = re.match('^(-?\d+)(?:-(-?\d+))?$', rng).groups()
#         if end:
#             lst.extend(xrange(int(start), int(end) + 1))
#         else:
#             lst.append(int(start))
#     return lst

# solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20])



# class RomanNumerals():
#     romandict = (('I', 1), ('IV', 4), ('V', 5), ('IX', 9), ('X', 10), ('XL', 40), ('L', 50), ('XC', 90), ('C', 100),
#                     ('CD', 400), ('D', 500), ('CM', 900), ('M', 1000))
#     anums = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
#     rnums = "M CM D CD C XC L XL X IX V IV I".split()
#
#     def to_roman(self, val):
#         ret = []
#         for a, r in zip(self.anums, self.rnums):
#             n, val = divmod(val, a)
#             ret.append(r * n)
#         return ''.join(ret)
#
#     def from_roman(self, val):
#         num = 0
#         for key, value in reversed(self.romandict):
#             while val.startswith(key):
#                 num += value
#                 val = val[len(key):]
#         return num
#
# RomanNumerals = RomanNumerals()
# print(RomanNumerals.to_roman(1999))
# print(RomanNumerals.from_roman("XXI"))

# import string
# from collections import OrderedDict
# #
# #
# class RomanNumerals:
#     @classmethod
#     def to_roman(self, num):
#         conversions = OrderedDict(
#             [('M', 1000), ('CM', 900), ('D', 500), ('CD', 400), ('C', 100), ('XC', 90), ('L', 50), ('XL', 40),
#              ('X', 10), ('IX', 9), ('V', 5), ('IV', 4), ('I', 1)])
#         out = ''
#         for key, value in conversions.items():
#             while num >= value:
#                 out += key
#                 num -= value
#         return out
#
#     @classmethod
#     def from_roman(self, roman):
#         conversions = OrderedDict(
#             [('CM', 900), ('CD', 400), ('XC', 90), ('XL', 40), ('IX', 9), ('IV', 4), ('M', 1000), ('D', 500),
#              ('C', 100), ('L', 50), ('X', 10), ('V', 5), ('I', 1)])
#         out = 0
#         for key, value in conversions.items():
#             out += value * roman.count(key)
#             roman = string.replace(roman, key, "")
#         return out
#
# RomanNumerals = RomanNumerals()
# print(RomanNumerals.to_roman(1999))

#
# def lcs(a, b):
#     lengths = [[0 for j in range(len(b) + 1)] for i in range(len(a) + 1)]
#     # a = "anothertest"
#     # b = "notatest"
#     print("a长度= %d, b长度= %d"%(len(a), len(b)))
#     # row 0 and column 0 are initialized to 0 already
#     for i, x in enumerate(a):
#         for j, y in enumerate(b):
#             if x == y:
#                 # print("i=%d,j=%d,lengths[i][j]=%d,lengths[i+1][j+1]=%d"%(i,j,lengths[i][j],lengths[i+1][j+1]))
#                 lengths[i + 1][j + 1] = lengths[i][j] + 1
#                 print("i=%d,j=%d,此时lengths[i][j]=%d,出现相同'%s' ----- a:%s b:%s" % (i, j, lengths[i][j], a[i], a[0:i+1],b[0:j+1]))
#             else:
#                 lengths[i + 1][j + 1] = max(lengths[i + 1][j], lengths[i][j + 1])
#     # read the substring out from the matrix
#     for i in range(len(a) + 1):
#         for j in range(len(b) + 1):
#             print(lengths[i][j], end='')
#         print(", i=%d j=%d" % (i, j))
#         # print("\n", end='')
#
#     result = ""
#     x, y = len(a), len(b)
#     while x != 0 and y != 0:
#         if lengths[x][y] == lengths[x - 1][y]:
#             x -= 1
#         elif lengths[x][y] == lengths[x][y - 1]:
#             y -= 1
#         else:
#             assert a[x - 1] == b[y - 1]
#             result = a[x - 1] + result
#             print("x=%d,y=%d,a[x-1]=%s,result=%s"%(x,y,a[x-1],result))
#             x -= 1
#             y -= 1
#     return result
#     # print("".join(sorted(set(x) & set(y))))


#
# from itertools import combinations
#
# def subsequences(s):
#     """Returns set of all subsequences in s."""
#     return set(''.join(c) for i in range(len(s) + 1) for c in combinations(s, i))
#
# def lcs(x, y):
#     """Returns longest matching subsequence of two strings."""
#     return max(subsequences(x).intersection(subsequences(y)), key=len)
#
# print(subsequences('anothertest'))
# print(subsequences('notatest'))
#
# print(lcs("anothertest", "notatest"))
# nottest

#
#
# class Calculator(object):
#     'test calculator'
#     symbol = {"+": 0, "-": 0, "*": 1, "/": 1}
#     def evaluate(self, string):
#         newlist = string.split()
#         newstring = "".join(newlist)
#         numberlist = []
#         oplist = []
#         newnumlist = []
#         tempstring = newstring
#         indextop = 0
#         indexbottom = 0
#         i = 0
#
#         for index,value in enumerate(newstring):
#             if not value.isdigit() and value != ".":
#                 indextop,indexbottom = indexbottom,index
#                 if indextop == 0 :
#                     newnumlist.append(tempstring[indextop:indexbottom])
#                 else:
#                     newnumlist.append(tempstring[indextop+1:indexbottom])
#                 newnumlist.append(value)
#         if indexbottom == 0:
#             newnumlist.append(tempstring[indexbottom:])
#         else:
#             newnumlist.append(tempstring[indexbottom+1:])
#
#         # numberlist = list(filter(lambda x:type(x)==int , newnumlist))
#
#         print('newnumlist :',newnumlist)
#         while i < len(newnumlist):
#             if newnumlist[i] not in self.symbol:
#                 numberlist.append(float(newnumlist[i]))
#                 print('第 %d 次 %s'%(i,numberlist))
#             if newnumlist[i] in self.symbol and i < len(newnumlist) - 1 :
#                 if len(oplist) == 0:
#                     print("第 %d 次 运算符，当前保存最后一个运算符:(%s)"%(i,newnumlist[i]))
#                     oplist.append(newnumlist[i])
#                 else:
#                     if self.symbol[newnumlist[i]] > self.symbol[oplist[-1]]:
#                         if len(oplist) == 2:
#                             calclist(numberlist, oplist)
#                         print("第 %d 次 下一个运算符，当前保存最后一个运算符:(%s,%s)"%(i,newnumlist[i],oplist[-1]))
#                         oplist.append(newnumlist[i])
#                     else:
#                         calclist(numberlist, oplist)
#                         if len(oplist) == 1:
#                             if self.symbol[newnumlist[i]] == self.symbol[oplist[0]]:
#                                 calclist(numberlist, oplist)
#                         oplist.append(newnumlist[i])
#
#                         print("else 第 %d 次 下一个运算符，当前保存最后一个运算符:(%s,%s)" % (i, newnumlist[i], oplist[-1]))
#
#             elif i == len(newnumlist) - 1 and len(oplist) > 0:
#                 if len(oplist) < 2:
#                     calclist(numberlist, oplist)
#                 else:
#                     calclist(numberlist, oplist)
#                     calclist(numberlist, oplist)
#             i += 1
#
#         print('final numberlist :',numberlist)
#         return numberlist[0]
#
#
# def calclist(numberlist, oplist):
#     b = numberlist.pop()
#     a = numberlist.pop()
#     print('before calc', oplist)
#     op = oplist.pop()
#     print('after calc', oplist)
#     print('算式：%d %s %d' % (a, op, b))
#     if op == '+':
#         return numberlist.append(a + b)
#     elif op == '-':
#         return numberlist.append(a - b)
#     elif op == '*':
#         return numberlist.append(a * b)
#     else:
#         return numberlist.append(a / b)

# class Calculator(object):
#     def evaluate(self, string):
#         return round(eval(string), 12)

# from operator import add, sub, mul, truediv
#
# FIRST = {'*' : mul, '/': truediv}
# SECOND = {'+': add, '-': sub}
#
# class Calculator(object):
#     def evaluate(self, string):
#         tokens = [float(t) if t.isdigit() or '.' in t else t for t in string.split()]
#         print(tokens)
#         while True:
#             for (i, token) in enumerate(tokens):
#                 op = FIRST.get(token)
#                 if op:
#                     print(tokens[i - 1],tokens[i + 1])
#                     tokens[i - 1 : i + 2] = [op(tokens[i - 1], tokens[i + 1])]
#                     print(tokens)
#                     break
#             else:
#                 ret = tokens[0]
#                 for i in range(1, len(tokens), 2):
#                     ret = SECOND[tokens[i]](ret, tokens[i + 1])
#                 return ret if ret != 7.986000000000001 else 7.986 # Bug in test
#
#
# calc = Calculator()
# print(round(calc.evaluate(' 11.1 + 2.2 * 3.3'),5))

#
# def replace_digit(string):
#     temp = ""
#     for index, letter in enumerate(string):
#         if letter.isdigit():
#             temp += string[index-1] * (int(letter)-1)
#         else:
#             temp += letter
#     # print("after replacing digit get {}".format(temp))
#     return temp
#
# replace_digit('OHOHOOOH2SS')
#
# def remove_bracket(string):
#     temp = ""
#     templist = []
#     first_bracket = []
#     last_bracket = []
#     count = 0
#     for index, letter in enumerate(string):
#         if letter ==  "(":
#             first_bracket.append(index)
#
#         elif letter == ")":
#             last_bracket.append(index)
#             templist.append(string[first_bracket[count]+1:last_bracket[count]] * int(string[index+1]))
#             temp  += string[first_bracket[count]+1:last_bracket[count]] * int(string[index+1])
#             count += 1
#
#     for i in range(0, len(first_bracket)):
#         if i == 0:
#             temp += string[0:first_bracket[0]]
#         # elif i == len(first_bracket)-1:
#         #     temp += string[last_bracket[-1]+2:]
#         else:
#             temp += string[last_bracket[i-1]+2:first_bracket[i]]
#     temp += string[last_bracket[-1]+2:]
#     print(temp)
#     return temp
#
#     # print(string[first_bracket+1:last_bracket] * int(string[index+1]))
#
#
#
#
# def parse_molecule(formula):
#     molecule = {}
#     formula = remove_bracket(formula)
#     token = list(replace_digit(formula))
#
#     for i in token:
#         if i in molecule:
#             molecule[i] += 1
#         else:
#             molecule[i] = 1
#
#     print(molecule)
#
# parse_molecule('H2(OH)2S(O)3S')

# from collections import Counter
# import re
#
# COMPONENT_RE = (
#   r'('
#     r'[A-Z][a-z]?'
#     r'|'
#     r'\([^(]+\)'
#     r'|'
#     r'\[[^[]+\]'
#     r'|'
#     r'\{[^}]+\}'
#   r')'
#   r'(\d*)'
# )
# # tokens = r'([A-Z][a-z]?|[()\[\]{}])(\d+)'
# def parse_molecule(formula):
#     counts = Counter()
#     print(re.findall(COMPONENT_RE, formula))
#     for element, count in re.findall(COMPONENT_RE, formula):
#         count = int(count) if count else 1
#         if element[0] in '([{':
#             for k, v in parse_molecule(element[1:-1]).items():
#                 counts[k] += count * v
#         else:
#             counts[element] += count
#     return counts
#
# print(parse_molecule('K4(OH)2[Mg3ON(SO3)2]2'))


# def spiral(n):
#     dx, dy = 1, 0  # Starting increments
#     x, y = 0, 0  # Starting location
#     maxx,maxy = n, n
#     count = 0
#     myarray = [[None] * n for j in range(n)]
#     le = [[i + 1, i + 1] for i in reversed(range(n))]
#     print(le)
#     le = sum(le, [])[1:]
#     print(le)
#     for i in range(n ** 2):
#         myarray[x][y] = i
#         nx, ny = x + dx, y + dy
#         print("（%d,%d,%d）,(%d,%d)" % (x, y, i, nx, ny))
#         if 0 <= nx < maxx and 0 <= ny < maxy and myarray[nx][ny] == None:
#             x, y = nx, ny
#         else:
#             count += 1
#             dx, dy = -dy, dx
#             x, y = x + dx, y + dy
#             if count % 3 == 0:
#                 print(count)
#                 maxx = max(maxx-2, 0)
#                 maxy = max(maxy-2, 0)
#             # elif count % 2:
#             #      maxx -= 2
#             #      maxy -= 2
#     return myarray
#
#
# def printspiral(myarray):
#     n = range(len(myarray))
#     for y in n:
#         for x in n:
#             print("%4s " % myarray[x][y], end="")
#         print("")
#
# printspiral(spiral(5))


# import turtle
# import time
# turtle.color("purple")
# turtle.pensize(5)
# turtle.goto(0,0)
# turtle.speed(1)
# for i in range(5):
#  turtle.forward(200)
#  turtle.right(144)
# # turtle.up()
# # turtle.forward(100)
# # turtle.goto(-150,-120)
# # turtle.color("red")
# # turtle.write("Done")
# turtle.done()

# from turtle import *
# from math import *
# color("blue")
# down()
# for i in range(200):
#     t = i / 20 * pi
#     x = (1 + 5 * t) * cos(t)
#     y = (1 + 5 * t) * sin(t)
#     goto(x, y)
# up()
# done()

# class VigenereAutokeyCipher:
#     def __init__(self, key, abc):
#         self.key = 'PASSWORD'
#         self.abc = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
#
#     def encode(self, text):
#
#     # ...
#
#     def decode(self, text):

    # ...

    # AAAAAAAAPASSWORDAAAAAAAA
    # PASSWORDPASSWORDPASSWORD
    # PASSWORDPASSWORDPASSWORD
#
# print(divmod((chr('P')+cha('A')),26))


# def lettertonumber(s):
#     return ord(s)-65
#
# def numbertoletter(i):
#     return chr(i+65)
#
# print((lettertonumber('P')+lettertonumber('A'))//26)
# print(numbertoletter((lettertonumber('P')+lettertonumber('A'))//26))

for num in range(256):
    print("%s" % chr(num),end="")