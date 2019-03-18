import numpy as np
from sklearn.externals import joblib

mlp_clf=joblib.load('/home/zbl/prepap/learning/mlp190.m')
xgb_clf=joblib.load('/home/zbl/prepap/learning/xgb53.m')
dec_clf=joblib.load('/home/zbl/prepap/learning/dec49.m')

def compute_features(data):
	lists=[]
	temp_row=[]
	for row in data:
		if len(temp_row)==0:
			temp_row=row
		elif len(temp_row)!=0:
			temp_row=[a+b for a,b in zip(temp_row,row)]
		if temp_row[2]>10 and temp_row[3]>10:
			if temp_row[1]==0:
				temp_row[0]=temp_row[0]+1
				temp_row[1]=1
			lists.append([1.0*temp_row[0]/temp_row[1],1.0*temp_row[0]/temp_row[2],1.0*temp_row[0]/temp_row[3],1.0*temp_row[1]/temp_row[2],1.0*temp_row[1]/temp_row[3],1.0*temp_row[3]/temp_row[2]])
			temp_row=[]
	if len(lists)<15:
		return []
	arr=list(map(list,zip(*lists)))
	lists=[]
	for row in arr:
		lists.append(np.mean(row))
		lists.append(np.std(row))
		lists.append(np.max(row))
		lists.append(np.min(row))
		lists.append(np.ptp(row))
		lists.append(np.median(row))
	return lists

cdef public int detection(int size,int length,long long **a):
	lists=[]
	count=0
	for i in np.arange(size):
		row=[]
		is_zero=True
		for j in np.arange(length):
			x=a[i][j]
			if x!=0:
				is_zero=False
			row.append(x)
		if not is_zero:
			lists.append(row)
			count=count+1
	if size<20 and count<20:
		return -1
	features=compute_features(lists)
	if len(features)==0:
		return -1
	features=np.asarray(features)
	predict_result=dec_clf.predict(features.reshape(1,-1))[0]
	if predict_result==1:
		predict_result=predict_result+xgb_clf.predict(features.reshape(1,-1))[0]+mlp_clf.predict(features.reshape(1,-1))[0]
	return predict_result
