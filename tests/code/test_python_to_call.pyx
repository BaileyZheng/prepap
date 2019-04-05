import numpy as np
from sklearn.externals import joblib
#import xgboost

mlp_clf=joblib.load('/home/zbl/prepap/detection/mlp190.m')
xgb_clf=joblib.load('/home/zbl/prepap/detection/xgb56.m')
dec_clf=joblib.load('/home/zbl/prepap/detection/dec49.m')

def add(list1,list2):
	return [a+b for a,b in zip(list1,list2)]

def compute_rates(data,column_num):
	lists=[]
	temp_row=[]
	for row in data:
		if len(temp_row)==0:
			temp_row=row
		elif len(temp_row)!=0:
			temp_row=add(temp_row,row)
		if column_num==5 and temp_row[3]>10 and temp_row[4]>10 and temp_row[1]>0:
			lists.append([1.0*temp_row[0]/temp_row[1],1.0*temp_row[1]/temp_row[4],1.0*temp_row[4]/temp_row[3],1.0*temp_row[0]/temp_row[3],1.0*temp_row[1]/temp_row[3],1.0*temp_row[2]/temp_row[3]])
			temp_row=[]
		elif column_num==4 and temp_row[2]>10 and temp_row[3]>10:
			if temp_row[1]==0:
				temp_row[0]=temp_row[0]+1
				temp_row[1]=1
			lists.append([1.0*temp_row[0]/temp_row[1],1.0*temp_row[0]/temp_row[2],1.0*temp_row[0]/temp_row[3],1.0*temp_row[1]/temp_row[2],1.0*temp_row[1]/temp_row[3],1.0*temp_row[3]/temp_row[2]])
			temp_row=[]
	return lists

def transpose_list(list_arr):
	return list(map(list,zip(*list_arr)))

def compute_features(arr):
	lists=[]
	for row in arr:
		lists.append(np.mean(row))
		lists.append(np.std(row))
		lists.append(np.max(row))
		lists.append(np.min(row))
		lists.append(np.ptp(row))
		lists.append(np.median(row))
	return lists

cdef public int test_function(const long long (*a)[4],int size,int length):
	lists=[]
	for i in np.arange(size):
		row=[]
		for j in np.arange(length):
			row.append(a[i][j])
		lists.append(row)
	features=compute_features(transpose_list(compute_rates(lists,4)))
	if len(features)==0:
		return 0
	features=np.asarray(features)
	predict_result=dec_clf.predict(features.reshape(1,-1))[0]+xgb_clf.predict(features.reshape(1,-1))[0]+mlp_clf.predict(features.reshape(1,-1))[0]
	return predict_result
