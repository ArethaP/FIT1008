def quicksort(the_list):
	quicksort_aux(the_list, 0, len(the_list)-1)

def quicksort_aux(the_list, low, high):
	#print('new call', str(the_list), str(low), str(high))
	#print('')
	if low < high: #if the array isn't length 1
		s = splitlist(the_list, low, high)
		#print('border', s)
		quicksort_aux(the_list, low, s-1)
		quicksort_aux(the_list, s+1, high)

def splitlist(the_list, low, high):
	pivot_index = low
	pivot_value = the_list[pivot_index]
	border = low 

	i = low + 1
	while i <= high :
		if the_list[i] < pivot_value:
			border += 1
			swap(the_list, border, i)

		i += 1
	
	swap(the_list, border, pivot_index)
	return border

def swap(the_list, index1, index2):
	temp1 = the_list[index1]
	temp2 = the_list[index2]
	the_list[index2] = temp1
	the_list[index1] = temp2

my_list = [100, 2, 6, 1, 459, 32, 43, 98, 34, 67, 23, 43, 43, 43, 12, 5, 34,7,23,4436,343]
quicksort(my_list)
print(my_list)