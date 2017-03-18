"""
Tests is leap year
"""

# Author: Julian Garcia, based on code by Brendon Taylor


from task1_a import is_leap_year


def test_is_leap_year():
    """
    Tests is_leap_year, using known data
    :raises: AssertionError, if a year is missclasified
    """
    test_data_true = [1600, 2000, 2012]
    test_data_false = [1582, 1700, 1800, 1900, 2003, 2100]

    for year in test_data_true:
        assert is_leap_year(year), "{} should be classified a leap year".format(year)

    for year in test_data_false:
        assert not is_leap_year(year), "{} should not be classified a leap year".format(year)

if __name__ == '__main__':
    test_is_leap_year()