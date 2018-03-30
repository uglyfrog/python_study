import xlrd

excel_name = "dungeon.xlsx"

def open_excel(file= 'dungeon1.xlsx'):
    try:
        data = xlrd.open_workbook(file)
        print(data.sheet_names())
        return data
    except Exception as e:
        print("ops! error " + str(e))



data = open_excel(excel_name)
table = data.sheet_by_name("Sheet1")
table = data.sheet_by_index(0)
print(table.name,table.nrows,table.ncols)

nrows = table.nrows
ncols = table.ncols

row = table.row_values(1)
colomn = table.col_values(3)
print(row)
print(colomn)
print("first element value: " + table.cell(0,0).value)
print("first element type: %d" % table.cell(0,0).ctype)

for i in range(0,nrows):
    print(table.row_values(i))


