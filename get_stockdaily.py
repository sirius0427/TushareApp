# coding:utf-8

import tushare as ts
import pymysql
import numpy as np
import datetime
import time

ts.set_token('ebd2f2ebc4253ccb29793268ad7b8a0c787c2b12982af27dc49efff3')

# data = ts.pro_bar(ts_code='000001.SZ', adj='qfq', start_date='20151225', end_date='20190617',
#                       ma=[5, 10, 20, 30, 60, 120, 250], factors=['tor', 'vr'])
# indexs = list(data[np.isnan(data['ma250'])].index)
# data = data.drop(indexs)
# dataset = np.array(data)
# datalist = dataset.tolist()
# print(dataset)



db = pymysql.connect(host='localhost', port=3306, user='root', passwd='Sirius@0427', db='tushare', charset='utf8mb4')
cursor = db.cursor()
sql = "select ts_code,list_date from stock_list where list_status='L' order by symbol"
cursor.execute(sql)
print("cursor.excute:",cursor.rowcount)
for each in cursor.fetchall():
    print('ts_code:'+ each[0] + '  list_date:' + datetime.datetime.strftime(each[1], "%Y-%m-%d")[0:4])
    if(int(datetime.datetime.strftime(each[1], "%Y-%m-%d")[0:4])<2017):
        data = ts.pro_bar(ts_code=each[0], adj='qfq', start_date='20000101', end_date='20161231',
                      ma=[5, 10, 20, 30, 60, 120, 250], factors=['tor', 'vr'])
        indexs = list(data[np.isnan(data['ma250'])].index)
        data = data.drop(indexs)
        data = data.fillna(0)
        dataset = np.array(data)
        datalist = dataset.tolist()
        sql = "insert into stock_daily(trade_date,ts_code,`open`,high,low,`close`,pre_close,`change`,pct_chg,vol,amount,turnover_rate,volume_ratio,ma5,ma_v_5,ma10,ma_v_10,ma20,ma_v_20,ma30,ma_v_30,ma60,ma_v_60,ma120,ma_v_120,ma250,ma_v_250) values ( %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s )"
        try:
            # 执行sql语句
            cursor.executemany(sql, datalist)
            # 提交到数据库执行
            db.commit()
        except Exception as e:
            print(e)
            # 如果发生错误则回滚
            db.rollback()
    data = ts.pro_bar(ts_code=each[0], adj='qfq', start_date='20151225', end_date='20190617',
                      ma=[5, 10, 20, 30, 60, 120, 250], factors=['tor', 'vr'])
    indexs = list(data[np.isnan(data['ma250'])].index)
    data = data.drop(indexs)
    data = data.fillna(0)
    dataset = np.array(data)
    datalist = dataset.tolist()
    sql = "insert into stock_daily(trade_date,ts_code,`open`,high,low,`close`,pre_close,`change`,pct_chg,vol,amount,turnover_rate,volume_ratio,ma5,ma_v_5,ma10,ma_v_10,ma20,ma_v_20,ma30,ma_v_30,ma60,ma_v_60,ma120,ma_v_120,ma250,ma_v_250) values ( %s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s )"
    try:
        # 执行sql语句
        cursor.executemany(sql, datalist)
        # 提交到数据库执行
        db.commit()
    except Exception as e:
        print(e)
        # 如果发生错误则回滚
        db.rollback()
# 关闭游标
cursor.close()
# 关闭数据库连接
db.close()

'''
#pro = ts.pro_api()
#data = ts.pro_bar(ts_code='000001.SZ', adj='qfq', start_date='20000101', end_date='20161231', ma=[5, 10, 20, 30, 60, 120, 250], factors=['tor', 'vr'] )
#print(data)

#print(data.dtypes)
#dataset = np.array(data)
#datalist = dataset.tolist()
'''

"""
# 打开数据库连接
db = pymysql.connect(host='localhost', port=3306, user='root', passwd='Sirius@0427', db='tushare', charset='utf8mb4')

# 使用cursor()方法获取操作游标
cursor = db.cursor()
sql = "delete from trade_cal"
try:
    # 执行sql语句
    cursor.execute(sql)
    # 提交到数据库执行
    db.commit()
except Exception as e:
    print(e)
    # 如果发生错误则回滚
    db.rollback()
# 关闭游标
cursor.close()

cursor = db.cursor()
# SQL 插入语句
#sql = "INSERT INTO stock_list ('ts_code', 'symbol', 'name', 'area', 'industry', 'fullname', 'enname', 'market', 'exchange', 'curr_type', 'list_status', 'list_date', 'delist_date', 'is_hs') VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
sql = "INSERT INTO trade_cal (cal_date,is_open,pretrade_date) VALUES (%s,%s,%s)"

try:
    # 执行sql语句
    cursor.executemany(sql, datalist)
    # 提交到数据库执行
    db.commit()
except Exception as e:
    print(e)
    # 如果发生错误则回滚
    db.rollback()
# 关闭游标
cursor.close()
# 关闭数据库连接
db.close()

"""