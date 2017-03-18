def is_leap_year(year):
	if year % 4 == 0:
		if year % 100 != 0:
			return True
		elif year % 400 == 0:
			return True
		else:
			return False
	else:
		return False


#y = int(input('What year is it? '))
y = 1900
print(is_leap_year(y))

