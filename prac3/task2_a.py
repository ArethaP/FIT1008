the_list = [] #create empty list
size = int(input('What is the size of this list? '))

init = 0
while init < size: #init list and set all values to default 0 
	the_list.append(0)
	init += 1

app = 0
while app < size: #add items to the list
	item = input('Item: ')
	the_list[app] = item
	app += 1

pr = 0
while pr < size: #print every other item in the list
	print(the_list[pr])
	pr += 2
#print(the_list)

