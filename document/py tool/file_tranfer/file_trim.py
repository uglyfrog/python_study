import os
import xlwt
import xlrd
import re


os.chdir('E:\WorkShop\Documents\浩瀚星辰\太空探索\lua\\test')
a = os.getcwd()
print(a)

#rb = xlrd.open_workbook('des_file.xls',formatting_info=True)
#wb = xl_copy(rb)
#Sheet1 = wb.add_sheet('new_recipes')
#wb.save('des_file.xls')

def wirte_recipes():
    is_file_exist = os.path.exists("nullius_recipe.xls")
    n = 1
    #if is_file_exist:
    #    rb = xlrd.open_workbook('des_file.xls',formatting_info=True)
    #    if('space_new_recipes' in rb.sheet_names()):
    #        pass
    #    else:
    #        workbook = xl_copy(rb)
    #        sheet1 = workbook.add_sheet('space_new_recipes', cell_overwrite_ok
    #        = True)
    workbook = xlwt.Workbook(encoding='utf-8',style_compression=0)
    sheet1 = workbook.add_sheet('nullius_recipes', cell_overwrite_ok = True)
    sheet1.write(0,0,'product')
    sheet1.write(0,1,'recipe group')
    sheet1.write(0,2,'product result')
    sheet1.write(0,3,'produce time')
    sheet1.write(0,4,'product catergory')
    name = ""

    with open('nullius_recipe.lua','r',encoding= 'utf-8') as origin_file, open('out.txt','w+',encoding = 'utf-8') as des_file:
        content = origin_file.read()
        content = content.replace(" amount =","")
        content = content.replace("type = \"fluid\",","") 
        content = content.replace("name=data_util.mod_prefix .. ","")
        content = content.replace("data_util.mod_prefix ..","")
        content = content.replace("data_util.mod_prefix..","")
        content = content.replace("amount=","")
        content = content.replace("type=\"fluid\",","")
        content = content.replace("type=\"item\", name=","")
        content = content.replace("type = \"fluid\",","")
        content = content.replace("type = \"item\",","")

        # nullius recipe
        content = content.replace("type=\"item\", ","")
        content = content.replace("name=","")

        # trim "icons"字段
        key_start = "  icons = {"
        key_end = "    },"
        pat = re.compile(key_start+'(.*?)'+key_end,re.S) 
        result = pat.sub("",content)
        key_start = "icon ="
        key_end = "   },"
        pat = re.compile(key_start+'(.*?)'+key_end,re.S) 
        result = pat.sub("",result)

        # trim "crafting_machine_tint"字段
        key_start = "  crafting_machine_tint = {"
        key_end = "    },"
        pat = re.compile(key_start+'(.*?)'+key_end,re.S) 
        result = pat.sub("",result)


        #筛选type名称
        type_start = "  type = "
        type_end = "  },"
        pat_type = re.compile(type_start + '(.*?)' + type_end, re.S)
        type_result = pat_type.findall(result)

        ### 直接筛选expensive的材料配方，并且替换掉S
        #key_start = ' expensive = {'
        #key_end = ' }'
        #pat = re.compile(key_start+'(.*?)'+key_end,re.S) #re.s使匹配包括换行在内的所有字符
        #result = pat.sub("",content)


        #截取太空探索的产出名称
        name_start1 = "  ingredients = {"
        name_end1 = "  },"
        name_start2 = "results ="
        name_end2 = "},"
        pat_name1 = re.compile(name_start1 + '(.*?)' + name_end1, re.S)
        name_result1 = pat_name1.sub("",result)

        #仅仅获得含results或result的部分
        type_result = pat_type.findall(name_result1)

        #=================================================================
        pat_name2 = re.compile(name_start2 + '(.*?)' + name_end2, re.S)
        name_result2 = pat_name2.sub("",name_result1)
        result_outcome = pat_name1.findall(name_result1)
        pat_name = re.compile(r'^\s*name =\s*(?:\w*\[\d*\]\s\.\. )*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE) #取配方名称
        product_name = pat_name.findall(name_result2)

        #截取太空探索的配方名称
        recipe_start = "  ingredients = {"
        recipe_end = "  },"
        pat_recipe1 = re.compile(recipe_start + '(.*?)' + recipe_end, re.S)
        result_recipe1 = pat_recipe1.findall(content)
        pat_recipe2 = re.compile(r'^\s*{\s*\s*\s*(?:name =)*(?:\s)*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",(?:\s)*(\d*)',re.MULTILINE)

        #截取太空探索的产出明细
        output_start = "  results = {"
        output_end = "  },"
        pat_output1 = re.compile(output_start + '(.*?)' + output_end, re.S)
        result_output1 = pat_output1.findall(content)
        pat_output2 = re.compile(r'{.*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",(?:\s)*(\d*)',re.MULTILINE)
        #筛选result = ***，
        pat_output3 = re.compile(r'^\s*result = "(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)
        #筛选result = ***
        pat_output4 = re.compile(r'^\s*result = "(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"',re.MULTILINE)
        #筛选result_count
        pat_output5 = re.compile(r'^\s*result_count = (\d*)',re.MULTILINE)

        #截取配方的生产时间
        time_output = re.compile(r'^\s*energy_required = (\d*)',re.MULTILINE)
        time_result = time_output.findall(content)
        for n in range(len(time_result)):
            sheet1.write(n + 1,3,time_result[n])

        #截取配方的类别
        catergory_output = re.compile(r'^\s*category = "(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"',re.MULTILINE)
        catergory_result = catergory_output.findall(content)
        for n in range(len(catergory_result)):
            sheet1.write(n + 1,4,catergory_result[n])


        #为所有截取结果添加结尾括号和逗号
        for n in range(len(type_result)):
            type_result[n] = type_result[n] + "     },\n"
      
        for n in range(len(type_result)):
            #获得配方名称
            product_name = pat_name.findall(type_result[n])
            if(product_name):
                sheet1.write(n + 1,0,product_name[0]) 
            

            #获得配方结果
            results_multiple = pat_output1.findall(type_result[n])
            result_single = pat_output4.findall(type_result[n])
            result_count = pat_output5.findall(type_result[n])
            if(results_multiple):
                for m in range(len(results_multiple)):
                    result_output2 = pat_output2.findall(results_multiple[m])
                    for i, val in enumerate(result_output2):
                       name = " : ".join(val) + ",  " + name 
                    sheet1.write(n + 1,2,name)
                    name = ""
            else:
                for i, val in enumerate(result_single):
                    if(result_count):
                        name = val +  " : " + result_count[0] 
                    else:
                        name = val +  " : " + "1"
                    sheet1.write(n + 1,2,name)
                    name = ""

        #获得配方具体明细
        for n in range(len(result_recipe1)):
            result_recipe2 = pat_recipe2.findall(result_recipe1[n])
            for i, val in enumerate(result_recipe2):
                name = " : ".join(val) + ",  " + name 
            sheet1.write(n + 1,1,name)
            name = ""


        #for n in range(len(type_result)):
        #    #获取产品名称
        #    product_name = pat_name.findall(type_result[n])
        #    if(product_name):
        #        sheet1.write(n + 1,0,product_name[0])  

        #    #获取配方名称、数量
        #    result_recipe2 = pat_recipe2.findall(result_recipe1[n])
        #    if(result_recipe2):
        #        for i, val in enumerate(result_recipe2):
        #           name = " : ".join(val) + ",  " + name 
        #        sheet1.write(n + 1,1,name)
        #        name = ""


        ##获取最终产品名称
        #for n in range(len(result_output1)):
        #    result_output2 = pat_output2.findall(result_output1[n])
        #    if(result_output2):
        #        for i, val in enumerate(result_output2):
        #            name = " : ".join(val) + ", " + name
        #            sheet1.write(n+1,2,name)
        #    else:
        #        name = 1
        #    sheet1.write(n+1,2,name)
        #    name = ""

        #result_output2 = pat_output3.findall(content)
        #for n, val in enumerate(result_output2):
        #     sheet1.write(n + 1,2,val)
        #print(pat_output2.findall(result2[0]))



        for item in type_result:
            des_file.write(item)
        #des_file.write(result)
        des_file.close()
    workbook.save('nullius_recipe.xls')


def technology_recipes():
    is_file_exist = os.path.exists("technology.xls")
    n = 1
    #if is_file_exist:
    #    rb = xlrd.open_workbook('des_file.xls',formatting_info=True)
    #    if('space_new_recipes' in rb.sheet_names()):
    #        pass
    #    else:
    #        workbook = xl_copy(rb)
    #        sheet1 = workbook.add_sheet('space_new_recipes', cell_overwrite_ok
    #        = True)
    workbook = xlwt.Workbook(encoding='utf-8',style_compression=0)
    sheet1 = workbook.add_sheet('technology_space', cell_overwrite_ok = True)
    sheet2 = workbook.add_sheet('technology_origin', cell_overwrite_ok = True)
    sheet3 = workbook.add_sheet('technology_nullius',cell_overwrite_ok = True)
    sheet1.write(0,0,'technology')
    sheet1.write(0,1,'prerequisites')
    sheet1.write(0,2,'recipe group')
    sheet1.write(0,3,'unlock')
    sheet1.write(0,4,'count')
    sheet1.write(0,5,'time')

    sheet2.write(0,0,'technology')
    sheet2.write(0,1,'prerequisites')
    sheet2.write(0,2,'recipe group')
    sheet2.write(0,3,'unlock')
    sheet2.write(0,4,'count')
    sheet2.write(0,5,'time')

    sheet3.write(0,0,'technology')
    sheet3.write(0,1,'prerequisites')
    sheet3.write(0,2,'recipe group')
    sheet3.write(0,3,'unlock')
    sheet3.write(0,4,'count')
    sheet3.write(0,5,'time')
    name = ""

    with open('technology_space.lua','r',encoding= 'utf-8') as origin_file, open('technology_output.txt','w+',encoding = 'utf-8') as des_file:
        content = origin_file.read()
        content = content.replace("data_util.mod_prefix ..","")
        content = content.replace("effect_description={","recipe = ")
        content = content.replace("type = \"unlock-recipe\",","")
        content = content.replace("data_util.mod_prefix..","")

        
        type_start = "type = \"technology\","
        type_end = "  },"
        pat_type = re.compile(type_start + '(.*?)' + type_end, re.S)
        type_result = pat_type.findall(content)

        #科技名称
        pat_name = re.compile(r'^\s*name =\s*(?:\w*\[\d*\]\s\.\. )*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)


        #科技配方名称
        recipe_start = "  ingredients = {"
        recipe_end = "  },"
        pat_recipe1 = re.compile(recipe_start + '(.*?)' + recipe_end, re.S)
        result_recipe1 = pat_recipe1.findall(content)
        pat_recipe2 = re.compile(r'^\s*{\s*\s*\s*(?:\s)*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",(?:\s)*(\d*)',re.MULTILINE)


        #科技的前置条件
        output_start = "  prerequisites = {"
        output_end = "  },"
        prerequisites_output1 = re.compile(output_start + '(.*?)' + output_end, re.S)
        prerequisites_output2 = prerequisites_output1.findall(content)
        prerequisites_output3 = re.compile(r'"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"\,*',re.MULTILINE)
        #pat_output3 = re.compile(r'^\s*result =
        #"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)

        #科技解锁的后续科技
        unlock_start = "  effects = {"
        unlock_end = "  },"
        unlock_output1 = re.compile(unlock_start + '(.*?)' + unlock_end, re.S)
        unlock_output2 = unlock_output1.findall(content)
        unlock_output3 = re.compile(r'recipe = \s*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"\,*')

        #科技需求数量
        name_start1 = "  ingredients = {"
        name_end1 = "  },"
        pat_name1 = re.compile(name_start1 + '(.*?)' + name_end1, re.S)
        name_result = pat_name1.sub("",content)


        unit_start = "  unit = {"
        unit_end = " },"
        unit_output1 = re.compile(unit_start + '(.*?)' + unit_end, re.S)
        unit_output2 = unit_output1.findall(name_result)

        count_output = re.compile(r'count = (\d*)|count_formula = "(.*?)"',re.MULTILINE)

        #科技需求时间
        time_output = re.compile(r'time = (\d*)',re.MULTILINE)

        for n in range(len(type_result)):
            #excel里填写科技名称
            product_name = pat_name.findall(type_result[n])
            if(product_name):
                sheet1.write(n + 1,0,product_name[0])  

            #excel里填写科技前置条件
            prerequisites_name = prerequisites_output3.findall(prerequisites_output2[n])
            if (prerequisites_name):
                for i, val in enumerate(prerequisites_name):
                    name = val + ",  " + name
                sheet1.write(n + 1,1,name)
                name = ""

            #excel里填写科技配方组
            result_recipe2 = pat_recipe2.findall(result_recipe1[n])
            if(result_recipe2):
                for i, val in enumerate(result_recipe2):
                   name = " : ".join(val) + ",  " + name 
                sheet1.write(n + 1,2,name)
                name = ""

            #excel里填写科技解锁配方组
            unlock_name = unlock_output3.findall(unlock_output2[n])
            if (unlock_name):
                for i, val in enumerate(unlock_name):
                    name = val + ",  " + name
                sheet1.write(n + 1,3,name)
                name = ""

            count_num = count_output.findall(unit_output2[n])
            if (count_num):
                for i, val in enumerate(count_num):
                    name = val
                sheet1.write(n + 1,4,name)
                name = ""

            time_num = time_output.findall(unit_output2[n])
            if (time_num):
                for i, val in enumerate(time_num):
                    name = val
                sheet1.write(n + 1,5,name)
                name = ""




        for item in type_result:
            des_file.write(item)
        des_file.close()

    with open('technology_origin.lua','r',encoding= 'utf-8') as origin_file, open('technology_output.txt','w+',encoding = 'utf-8') as des_file:
        content = origin_file.read()
        
        type_start = "type = \"technology\","
        type_end = "  order ="
        pat_type = re.compile(type_start + '(.*?)' + type_end, re.S)
        type_result = pat_type.findall(content)

        #科技名称
        pat_name = re.compile(r'^\s*name =\s*(?:\w*\[\d*\]\s\.\. )*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)


        #科技配方名称
        recipe_start = "  ingredients ="
        recipe_end = "  },"
        pat_recipe1 = re.compile(recipe_start + '(.*?)' + recipe_end, re.S)
        result_recipe1 = pat_recipe1.findall(content)
        pat_recipe2 = re.compile(r'^\s*{\s*\s*\s*(?:\s)*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",(?:\s)*(\d*)',re.MULTILINE)


        #科技的前置条件
        prerequisites_output3 = re.compile(r'prerequisites = {(".*")},',re.MULTILINE)

        #科技解锁的后续科技
        unlock_start = "  effects = {"
        unlock_end = "  },"
        unlock_output1 = re.compile(unlock_start + '(.*?)' + unlock_end, re.S)
        unlock_output2 = unlock_output1.findall(content)
        unlock_output3 = re.compile(r'recipe = \s*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"\,*')

        #科技需求数量
        name_start1 = "  ingredients = {"
        name_end1 = "  },"
        pat_name1 = re.compile(name_start1 + '(.*?)' + name_end1, re.S)
        name_result = pat_name1.sub("",content)


        unit_start = "  unit ="
        unit_end = "  order ="
        unit_output1 = re.compile(unit_start + '(.*?)' + unit_end, re.S)
        unit_output2 = unit_output1.findall(content)

        #科技要求数量
        count_output = re.compile(r'count = \"*(\d*\**\d*)\"*|count_formula = "(.*?)"',re.MULTILINE)

        #科技需求时间
        time_output = re.compile(r'time = (\d*)',re.MULTILINE)

        for n in range(len(type_result)):
            #excel里填写科技名称
            product_name = pat_name.findall(type_result[n])
            if(product_name):
                sheet2.write(n + 1,0,product_name[0])  

            #excel里填写科技前置条件
            prerequisites_name = prerequisites_output3.findall(type_result[n])
            if (prerequisites_name):
                for i, val in enumerate(prerequisites_name):
                    name = val + ",  " + name
                sheet2.write(n + 1,1,name)
                name = ""

            #excel里填写科技配方组
            result_recipe2 = pat_recipe2.findall(result_recipe1[n])
            if(result_recipe2):
                for i, val in enumerate(result_recipe2):
                   name = " : ".join(val) + ",  " + name 
                sheet2.write(n + 1,2,name)
                name = ""

            ##excel里填写科技解锁配方组
            #unlock_name = unlock_output3.findall(unlock_output2[n])
            #if (unlock_name):
            #    for i, val in enumerate(unlock_name):
            #        name = val + ", " + name
            #    sheet1.write(n+1,3,name)
            #    name = ""

            count_num = count_output.findall(unit_output2[n])
            if (count_num):
                for i, val in enumerate(count_num):
                    name = val
                sheet2.write(n + 1,4,name)
                name = ""

            time_num = time_output.findall(unit_output2[n])
            if (time_num):
                for i, val in enumerate(time_num):
                    name = val
                sheet2.write(n + 1,5,name)
                name = ""




        for item in type_result:
            des_file.write(item)
        des_file.close()

    with open('technology_nullius.lua','r',encoding= 'utf-8') as origin_file, open('technology_output.txt','w+',encoding = 'utf-8') as des_file:
        content = origin_file.read()
        content = content.replace("data_util.mod_prefix ..","")
        content = content.replace("effect_description={","recipe = ")
        content = content.replace("type = \"unlock-recipe\",","")
        content = content.replace("data_util.mod_prefix..","")

        # trim "icons"字段
        key_start = "  icons = {"
        key_end = "    },"
        pat = re.compile(key_start+'(.*?)'+key_end,re.S) 
        content_trim_icon = pat.sub("",content)
        key_start = "icon ="
        key_end = "   },"
        pat = re.compile(key_start+'(.*?)'+key_end,re.S) 
        content_trim_icon = pat.sub("",content_trim_icon)

        type_start = "type = \"technology\","
        type_end = "  },"
        pat_type = re.compile(type_start + '(.*?)' + type_end, re.S)
        type_result = pat_type.findall(content_trim_icon)

        #科技名称
        pat_name = re.compile(r'^\s*name =\s*(?:\w*\[\d*\]\s\.\. )*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)


        #科技配方名称
        recipe_start = "  ingredients = {"
        recipe_end = "  },"
        pat_recipe1 = re.compile(recipe_start + '(.*?)' + recipe_end, re.S)
        result_recipe1 = pat_recipe1.findall(content_trim_icon)
        pat_recipe2 = re.compile(r'^\s*{\s*\s*\s*(?:\s)*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",(?:\s)*(\d*)',re.MULTILINE)
        #pat_recipe2 = re.compile(r'ingredients = {({"-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*", \d*}(?:\,\s*)*)(?:}\,)$',re.MULTILINE)
        result_recipe2 = pat_recipe2.findall(content_trim_icon)

        #科技的前置条件
        output_start = "  prerequisites = {"
        output_end = "  },"
        prerequisites_output1 = re.compile(output_start + '(.*?)' + output_end, re.S)
        prerequisites_output2 = prerequisites_output1.findall(content_trim_icon)
        prerequisites_output3 = re.compile(r'"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"\,*',re.MULTILINE)
        #pat_output3 = re.compile(r'^\s*result =
        #"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)",$',re.MULTILINE)

        #科技解锁的后续科技
        unlock_start = "  effects = {"
        unlock_end = "unit ="
        unlock_output1 = re.compile(unlock_start + '(.*?)' + unlock_end, re.S)
        unlock_output2 = unlock_output1.findall(content)
        unlock_output3 = re.compile(r'recipe = \s*"(-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*-*\w*)"\,*|modifier = (\d*\.*\d*)',re.MULTILINE)

        #科技需求数量
        name_start1 = "  ingredients = {"
        name_end1 = "  },"
        pat_name1 = re.compile(name_start1 + '(.*?)' + name_end1, re.S)
        name_result = pat_name1.sub("",content_trim_icon)


        unit_start = "  unit = {"
        unit_end = " },"
        unit_output1 = re.compile(unit_start + '(.*?)' + unit_end, re.S)
        unit_output2 = unit_output1.findall(name_result)

        count_output = re.compile(r'count = (\d*)|count_formula = "(.*?)"',re.MULTILINE)

        #科技需求时间
        time_output = re.compile(r'time = (\d*)',re.MULTILINE)

        for n in range(len(type_result)):
            ##excel里填写科技名称
            product_name = pat_name.findall(type_result[n])
            if(product_name):
                sheet3.write(n + 1,0,product_name[0])  

            ##excel里填写科技前置条件
            prerequisites_name = prerequisites_output3.findall(prerequisites_output2[n])
            if (prerequisites_name):
                for i, val in enumerate(prerequisites_name):
                    name = val + ",  " + name
                sheet3.write(n + 1,1,name)
                name = ""

            #excel里填写科技配方组
            result_recipe2 = pat_recipe2.findall(result_recipe1[n])
            if(result_recipe2):
                for i, val in enumerate(result_recipe2):
                   name = " : ".join(val) + ",  " + name 
                sheet3.write(n + 1,2,name)
                name = ""

            ##excel里填写科技解锁配方组
            unlock_name = unlock_output3.findall(unlock_output2[n])
            if (unlock_name):
                for i, val in enumerate(unlock_name):
                    name = "".join(val) + ",  " + name 
                sheet3.write(n + 1,3,name)
                name = ""

            count_num = count_output.findall(unit_output2[n])
            if (count_num):
                for i, val in enumerate(count_num):
                    name = val
                sheet3.write(n + 1,4,name)
                name = ""

            time_num = time_output.findall(unit_output2[n])
            if (time_num):
                for i, val in enumerate(time_num):
                    name = val
                sheet3.write(n + 1,5,name)
                name = ""



        #for item in unlock_output2:
        #    item = item + "\n"
        #    des_file.write(item)
        des_file.write(content)
        des_file.close()

    workbook.save('technology.xls')

wirte_recipes()
#technology_recipes()

