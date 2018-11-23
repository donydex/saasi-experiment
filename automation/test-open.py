import os

#file = open('~/saasi-data/users-10-req-300-17041857-eval2/data.json','w') 
#file = open('~/data.json','a') 
#file.close()
def mkdir(path):
	from ipdb import set_trace;set_trace() 
	path = os.getcwd()+'/'+path; 
	folder = os.path.exists(path)
 
	if not folder:                   #判断是否存在文件夹如果不存在则创建为文件夹
		os.makedirs(path)            #makedirs 创建文件时如果路径不存在会创建这个路径
		print("---  new folder...  ---")
		print("---  OK  ---")
 
	else:
		print("---  There is this folder!  ---")
mkdir("test")
f = open('test/test.ini', 'w') # open for 'w'riting 
f.write('[test]\n') # write text to file 
f.write('testet\n') # write text to file 
f.close() # close the file
