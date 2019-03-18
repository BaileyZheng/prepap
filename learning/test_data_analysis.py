#!/usr/bin/python
# -*- coding: UTF-8 -*-

from __future__ import print_function
import sys
import numpy as np
sys.path.append('/home/zbl/prepap/mon/code/analysis')
import data_analysis as da
import matplotlib.pyplot as plt
import seaborn as sns

def test_compare_different_size_l3_cache_miss():
	da.compare_different_size_l3_cache_miss()

def test_raw_data_feature_correlation_analysis():
	score1,score2,score3,score4=da.raw_data_feature_correlation_analysis()
	sns.set(style='white')
	sns.heatmap(score1,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score2,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score3,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score4,annot=True,center=0)
	plt.show()

def test_l22_data_feature_correlation_analysis():
	score1,score2,score3,score4=da.l22_data_feature_correlation_analysis()
	sns.set(style='white')
	sns.heatmap(score1,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score2,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score3,annot=True,center=0)
	plt.show()
	sns.set(style='white')
	sns.heatmap(score4,annot=True,center=0)
	plt.show()

def test_l32_data_feature_correlation_analysis():
	score=da.l32_data_feature_correlation_analysis()
	sns.set(style='white')
	sns.heatmap(score[0:10,0:10],annot=True,center=0)
	plt.show()
	for i in np.arange(score.shape[0]):
		line=score[i]
		for j in np.arange(line.shape[0]):
			if line[j]>0.95 and i<j:
				print(i,j,line[j])

def test_identify_loop_analysis_v_0():
	da.identify_loop_analysis_v_0()

if __name__=='__main__':
	test_compare_different_size_l3_cache_miss()
#	test_identify_loop_analysis_v_0()
#	test_l32_data_feature_correlation_analysis()
#	test_l22_data_feature_correlation_analysis()
#	test_raw_data_feature_correlation_analysis()
