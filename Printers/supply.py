
import subprocess

# this marks the start of a simple project to get approx ink levels of the default printer (canon pixma)
# and eventually send this info automatically somewhere useful   

colours = ['Magenta', 'Black', 'Yellow', 'BlackPGBK', 'Cyan']


def get_supply_info():
	info = (subprocess.check_output(["./printlev.sh"]))
	info_pre = (info.decode())
	info_str = info_pre.rstrip()
	info_split = info_str.split(",")
	percent_val = map(( lambda x: x + '%'), info_split)
	
	dict_from_list = dict(zip(colours, percent_val))
	for key, value in dict_from_list.items():
		print(key, ' : ', value)





if __name__ == "__main__":
    get_supply_info()
