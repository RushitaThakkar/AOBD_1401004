import json

with open('CandidateProfileData/abc.txt') as data_file:    
    data = json.load(data_file)

i = 0;
while 1:
	try:
		print(data[i]["Skills"])
		i+=1
	except:
		break
