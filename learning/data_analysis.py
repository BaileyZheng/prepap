#!/usr/bin/python
# -*- coding: UTF-8 -*-

from scipy.stats import spearmanr
import sys
sys.path.append('/home/zbl/prepap/mon/code/dataprocess')
import data_process as dp
import seaborn as sns
import numpy as np
import matplotlib.pyplot as plt
import csv

PREPAP_PATH='/home/zbl/prepap/'
NPY_DATA_PATH=PREPAP_PATH+'mon/data/npy_data/'
NPY_RAW_DATA_DIR=NPY_DATA_PATH+'raw/'
NPY_L22_DATA_DIR=NPY_DATA_PATH+'pro22/win_nooverlap/i100/'
NPY_L32_DATA_DIR=NPY_DATA_PATH+'pro32/win_nooverlap/i100.npy'

def compare_different_size_l3_cache_miss():
	f=open('/home/zbl/prepap/tests/data/swap_106.csv','r')
	reader=csv.reader(f)
	data106=[]
	for i in reader:
		data106.append(i)
	f.close()
	data224=[]
	f=open('/home/zbl/prepap/tests/data/swap_224.csv','r')
	reader=csv.reader(f)
	for j in reader:
		data224.append(j)
	f.close()
	data106=list(map(list,np.int64(data106)))
	data106=np.asarray(data106)
	data224=list(map(list,np.int64(data224)))
	data224=np.asarray(data224)
	print(data106.shape)
	print(data224.shape)
	print(np.mean(data106),np.std(data106))
	print(np.mean(data224),np.std(data224))

def identify_loop_analysis_v_0():
	path='/home/zbl/prepap/dataset/eventsdata/abnormal/spectre_0.txt'
	f=open('/home/zbl/prepap/dataset/eventsdata/abnormal/spectre_0.csv','r')
	reader=csv.reader(f)
	data=[]
	for msp,cn,prf,tlb,cyc,ins,ldm,tca in reader:
		if int(msp)==0 and int(cn)==0 and int(prf)==0 and int(tlb)==0 and int(cyc)==0 and int(ins)==0 and int(ldm)==0 and int(tca)==0:
			continue
		data.append([int(msp),int(cn),int(prf),int(tlb),int(cyc),int(ins),int(ldm),int(tca)])
		#print('%d'%int(tca))
	f.close()
	data=np.asarray(data)
	delta=data.max(0)-data.min(0)
	normalized_data=np.true_divide(data,delta)
	print(normalized_data[:,-1])
	#plt.plot(data[:,-1])
	plt.plot(normalized_data)
	plt.show()

def raw_data_feature_correlation_analysis():
	file_path_list=dp.get_all_file_path(NPY_RAW_DATA_DIR)
	first1=True
	first2=True
	first3=True
	first4=True
	arr1=[]
	arr2=[]
	arr3=[]
	arr4=[]
	for file_path in file_path_list:
		print(file_path)
		arr=np.load(file_path)
		if 'p0' in file_path:
			if first1:
				arr1=arr
				first1=False
			else:
				arr1=np.concatenate([arr1,arr])
		elif 'p1' in file_path:
			if first2:
				arr2=arr
				first2=False
			else:
				arr2=np.concatenate([arr2,arr])
		elif 'p2' in file_path:
			if first3:
				arr3=arr
				first3=False
			else:
				arr3=np.concatenate([arr3,arr])
		elif 'p3' in file_path:
			if first4:
				arr4=arr
				first4=False
			else:
				arr4=np.concatenate([arr4,arr])
	print("arr1",spearmanr(arr1))
	print("arr2",spearmanr(arr2))
	print("arr3",spearmanr(arr3))
	print("arr4",spearmanr(arr4))
	score_mat1=np.abs(spearmanr(arr1)[0])
	score_mat2=np.abs(spearmanr(arr2)[0])
	score_mat3=np.abs(spearmanr(arr3)[0])
	score_mat4=np.abs(spearmanr(arr4)[0])
	return score_mat1,score_mat2,score_mat3,score_mat4


def l22_data_feature_correlation_analysis():
	file_path_list=dp.get_all_file_path(NPY_L22_DATA_DIR)
	first1=True
	first2=True
	first3=True
	first4=True
	arr1=[]
	arr2=[]
	arr3=[]
	arr4=[]
	for file_path in file_path_list:
		print(file_path)
		arr=np.load(file_path)
		if 'p0' in file_path:
			if first1:
				arr1=arr
				first1=False
			else:
				arr1=np.concatenate([arr1,arr],axis=1)
		elif 'p1' in file_path:
			if first2:
				arr2=arr
				first2=False
			else:
				arr2=np.concatenate([arr2,arr],axis=1)
		elif 'p2' in file_path:
			if first3:
				arr3=arr
				first3=False
			else:
				arr3=np.concatenate([arr3,arr],axis=1)
		elif 'p3' in file_path:
			if first4:
				arr4=arr
				first4=False
			else:
				arr4=np.concatenate([arr4,arr],axis=1)
	print("arr1",spearmanr(arr1,axis=1))
	print("arr2",spearmanr(arr2,axis=1))
	print("arr3",spearmanr(arr3,axis=1))
	print("arr4",spearmanr(arr4,axis=1))
	score_mat1=np.abs(spearmanr(arr1,axis=1)[0])
	score_mat2=np.abs(spearmanr(arr2,axis=1)[0])
	score_mat3=np.abs(spearmanr(arr3,axis=1)[0])
	score_mat4=np.abs(spearmanr(arr4,axis=1)[0])
	return score_mat1,score_mat2,score_mat3,score_mat4

def l32_data_feature_correlation_analysis():
	arr=np.load(NPY_L32_DATA_DIR)
	#print("arr",spearmanr(arr))
	score_mat=np.abs(spearmanr(arr)[0])
	return score_mat








