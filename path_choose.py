#!/usr/bin/python

import os
import sys
import time
import numpy as np
from argparse import ArgumentParser

path_len = [2, 1 ,3]

def parse_args():
	parser = ArgumentParser()
	parser.add_argument('index', help='index to decide path')
	arg = parser.parse_args()
	return arg

def path_choose(index):
	start = time.clock()

	if index == '0':
		print("Path unchanged, getting data from server")
		send()
	else:
		nm = path_len.index(min(path_len))
		filename = "update_sfc" + str(nm)
		print(os.system("./" + filename + ".sh"))
		print("Shortest path" + str(nm) + " chosen, getting data from server")
	#	send()
	end = time.clock()
	print(end-start)
	return(index, end-start)

def send():
	print("xixixixixixi")
	return

if __name__ == "__main__":
	args = parse_args()
	index = args.index
	path_choose(index)


