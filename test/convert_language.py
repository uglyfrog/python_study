# coding=utf-8
import sys
import xlrd

xls_name = "Language配置.xls"
# 换行信息4个空格
wrap_symbol = "    "

def ToString(value):
    return "\"%s\"" % value.encode('utf-8')

def BuildTableToLua(data_map):
    lua_text =  "{"
    lua_text += " key = %s, " %  ToString(data_map["key"])
    for key, value in data_map.items():
        if value == "":
            continue
        if key != "key":
            if type(value) == type(key):
                lua_text += " %s = %s, " % (key.encode('utf-8'), ToString(value))
            else:
                lua_text += " %s = %d, " % (key.encode('utf-8'), int(value))
    lua_text +=  "},\n"
    return lua_text

def BuildMapToLua(table_name, key_list, data_list):
    lua_text =  "strings.%s = {\n" % table_name
    lua_text += ""

    for index in xrange(1,len(key_list)):
        key = key_list[index]
        value = data_list[index]
        lua_text += "\n"
        if key != "":
            lua_text += wrap_symbol + "[%s] = %s," % ( ToString(key), ToString(value))
    lua_text += "\n}"
    return lua_text

def BuildEditerToLua(table_name, table_data):
    lua_text = "strings.%s = {\n" % table_name

    for key, value in table_data.items():
        lua_text += wrap_symbol + "[%s] = {\n" % ToString(key)
        sort_list = value["sort"]
        for key in sort_list:
            lua_text += wrap_symbol * 2 + BuildTableToLua(value[key])
        lua_text += wrap_symbol + "},\n"
    lua_text += "\n}"

    return lua_text

def DoConvertMap(table, table_name):
    data = {}
    total_row_num = table.nrows

    title_list = []
    for rownum in range(1, table.ncols):
        title_data = {}
        title_data["index"] = rownum
        title_data["name"] = table.cell_value(1, rownum)
        title_list.append(title_data)

    for info in title_list:
        key_list = []
        table_data = []
        for rownum in xrange(1,total_row_num):
            key_list.append(table.cell_value(rownum, 0))
            table_data.append(table.cell_value(rownum, info['index']))
        data[info['name']] = BuildMapToLua(table_name, key_list, table_data)
    return data

def DoConvertEditer(table, table_name):
    data = {}
    total_row_num = table.nrows

    title_list = []
    for rownum in range(3, table.ncols):
        title_data = {}
        title_data["index"] = rownum
        title_data["name"] = table.cell_value(1, rownum)
        title_list.append(title_data)

    for info in title_list:
        key_list = {}
        find_path_list = []
        oper_type_list = []
        table_data = {}

        for rownum in xrange(2,total_row_num):
            key = table.cell_value(rownum, 0)
            if key == "":
                continue
            # 获取节点下面的object_map<对象路径，<对象属性>>
            object_map = table_data.get(key)
            if object_map is None:
                object_map = {}
                object_map["sort"] = []
            path = table.cell_value(rownum, 1)
            object_info = object_map.get(path)
            if object_info is None:
                object_info = {}
                object_map["sort"].append(path)
            object_info["key"] = path
            oper_type = table.cell_value(rownum, 2)
            object_info[oper_type] = table.cell_value(rownum, info['index'])
            object_map[path] = object_info
            table_data[key] = object_map
        data[info['name']] = BuildEditerToLua(table_name, table_data)
    return data

# 打开工作薄
workbook = xlrd.open_workbook(xls_name)

lang_table = {}

# 文本配置
text_data = DoConvertMap(workbook.sheet_by_name(u'动态文本设置'), 'Text')
for lang, lua_text in text_data.items():
    lang_table[lang] = "local strings = {}\n"
    lang_table[lang] += lua_text

# 编辑器配置
edter_data = DoConvertEditer(workbook.sheet_by_name(u'编辑器配置'), 'EditerSetting')
for lang, lua_text in edter_data.items():
    lang_table[lang] += "\n" * 4
    lang_table[lang] += lua_text

for lang, lua_text in lang_table.items():
    lua_text += "\nreturn strings"
    f = open("../../src/locale/" + lang + ".lua", "w")
    f.write(lua_text)
    f.close()

