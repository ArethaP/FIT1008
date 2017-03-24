def quicksort(the_list):
	size = the_list[0]
	less = [0]
	equal = [0]
	greater = [0]
	if size > 1:
		pivot = the_list[-1]
		i = 1
		while i <= size:
			if the_list[i] < pivot:
				less.append(the_list[i])
				less[0] = less[0] + 1 
			elif the_list[i] == pivot:
				equal.append(the_list[i])
				equal[0] = equal[0] + 1
			elif the_list[i] > pivot:
				greater.append(the_list[i])
				greater[0] = greater[0] + 1
			i += 1
		return(quicksort(less) + equal[1:] + quicksort(greater))
	else:
		return (the_list[1:])


temp_list = [] #create empty list
size = int(input('Size: '))
temp_list.append(size)

init = 1
while init <= size: #init list and set all values to default 0 
	temp_list.append(0)
	init += 1

app = 1
while app <= size: #add items to the list, replacing 0 with user defined value
	item = input('Item: ')
	temp_list[app] = int(item)
	app += 1

sorted_list = quicksort(temp_list)


