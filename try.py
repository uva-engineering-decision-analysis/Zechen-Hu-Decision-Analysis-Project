import pandas as pd

dataList = []
startList = ['150,2752']
endList = ['1803,2761']

for day in range(23,30):#30
    f = open("/Users/huzechen/CourseProject/bml/final project/KSCC_201503%d_Incheon.csv"%day)
    data = pd.read_csv(f)
    data = data[data["Last_stop"]!='.']
    data = data[data["First_stop"]!='.']
    dataArr = data.values
    column = data.columns.values.tolist()
    num = 1
    print("day %d begin"%day)
    newseries = pd.Series()
    for usrData in dataArr:
        #print(str(usrData[column.index("First_stop")]))
        if str(usrData[column.index("First_stop")]) in startList:
            if str(usrData[column.index("Last_stop")]) in endList:
                newseries.append(pd.DataFrame(usrData))
        if num % 100000 == 0:
            print(num)
        num += 1
        print("day %d finished" % day)
    dataList = newseries
    dataList.to_csv("/Users/huzechen/CourseProject/bml/final project/result.csv")

