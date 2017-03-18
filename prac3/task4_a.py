#read in the list
list_of_temps = [26, 18, 22, 20, 13, 22, 19, 22, 20, 27, 18, 24, 15, 28, 26, 27, 20, 21, 23, 24, 27, 26, 15, 23, 22, 20, 23, 17, 18, 18]
size = len(list_of_temps)
'''
size = int(input('How many temperatures would you like to enter? '))
init = 0
while init < size: #init list and set all values to default 0 
	list_of_temps.append(0)
	init += 1

app = 0
while app < size: #add items to the list, replacing 0 with user defined value
	item = input('Temperature: ')
	list_of_temps[app] = int(item)
	app += 1

'''

target = int(input('What is the target temperature? '))
count = 0
success = 0
while count < size:
	if list_of_temps[count] == target:
		success += 1
	count += 1

print(success)