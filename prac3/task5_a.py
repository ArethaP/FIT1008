the_list = [] #create empty list
size = int(input('Size: '))
the_list.append(size)

init = 1
while init <= size: #init list and set all values to default 0 
	the_list.append(0)
	init += 1

app = 1
while app <= size: #add items to the list, replacing 0 with user defined value
	item = input('Item: ')
	the_list[app] = int(item)
	app += 1

def findmax(templist):
	#find max value in the list
	size = templist[0]
	count = 1
	maximum = templist[1]
	while count <= size:
		if templist[count] > maximum:
			maximum = templist[count]
		count += 1
	return(maximum)

print(findmax(the_list))
