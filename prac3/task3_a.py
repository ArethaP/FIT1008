the_list = [] #create empty list
size = int(input('What is the size of this list? '))

init = 0
while init < size: #init list and set all values to default 0 
	the_list.append(0)
	init += 1

app = 0
while app < size: #add items to the list, replacing 0 with user defined value
	item = input('Item: ')
	the_list[app] = int(item)
	app += 1

#find min value in the list
count = 0
small = the_list[0]
while count < size:
	if the_list[count] < small:
		small = the_list[count]
	count += 1

count = 0
large = the_list[0]
while count < size:
	if the_list[count] > large:
		large = the_list[count]
	count += 1

print('range = ' + str(large - small))