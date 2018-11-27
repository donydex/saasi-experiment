# pycharm 设置默认的解释器
https://blog.csdn.net/qq_39516859/article/details/80068910

# Jupyter notebook设置问题
dead kernel问题:
https://blog.csdn.net/qq_21368481/article/details/80211624
把内核换了，换成对的内核

# 文件路径声明
path = r"\saasi-data\io_write_usage.csv"

# 获取该文件的绝对路径
```
import os
path = os.getcwd()+path
print(path)
```

# csv 文件转化为 xls文件
https://blog.csdn.net/qq_33689414/article/details/78307031
```
import pandas as pd

def csv_to_xlsx_pd(csvPath):
    xlsPath = csvPath.split('.csv')[0]+'.xls'
    print(xlsPath)
    csv = pd.read_csv(csvPath, encoding='utf-8')
    csv.to_excel(xlsPath, sheet_name='data')


# if __name__ == '__main__':
#     csv_to_xlsx_pd(path)
csv_to_xlsx_pd(path)
```

# pandas dataframe 按列选取
python选取特定列——pandas的iloc和loc以及icol使用（列切片及行切片）
dataFrame.iloc[:,[0,1]]
https://blog.csdn.net/chenKFKevin/article/details/62049060

# unix 时间戳和日期戳相互转化
https://www.cnblogs.com/codemo/archive/2012/10/24/UnixTime.html
```
import time
def timestamp_datetime(value):
    format = '%Y/%m/%d/%H:%M:%S'
    # value为传入的值为时间戳(整形)，如：1332888820
    value = time.localtime(value)
    ## 经过localtime转换后变成
    ## time.struct_time(tm_year=2012, tm_mon=3, tm_mday=28, tm_hour=6, tm_min=53, tm_sec=40, tm_wday=2, tm_yday=88, tm_isdst=0)
    # 最后再经过strftime函数转换为正常日期格式。
    dt = time.strftime(format, value)
    return dt
    
timestamp_datetime(num)
```

# Pandas对DataFrame单列/多列进行运算（map, apply, transform, agg）
https://blog.csdn.net/zwhooo/article/details/79696558
data['Time']=data['Time'].map(timestamp_datetime)



