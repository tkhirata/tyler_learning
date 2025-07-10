import re
import os

'''
Example Files
Westworld.S01E01.2160p.UHD.BluRay.x265-DEPTH.mkv

Ideal output:
westworld-s01e01-2160p.mkv
'''


active = True
while active:
	episode_directory = input("Type in the directory your tv episodes reside in.\n")

	confirmation_prompt = "Confirm this is the correct directory (y/n):\n"
	confirmation_prompt = f"{confirmation_prompt}\t" + episode_directory

	confirmation = input(f"{confirmation_prompt}\n")

	if confirmation == 'n':
		print("==Exiting Script==")
		active = False

	elif confirmation == 'y':
		'''Returns a list of all the old episode names in directory'''
		original_episode_names = sorted(os.listdir(path=episode_directory))

		for episodes in original_episode_names:
			'''Splits the directory to the episodes using "/" as a delimiter'''
			show_name = episode_directory.split("/")
			show_name = show_name[4].lower()

			'''Using regex to retrieve season number'''
			season = re.findall(r"[sS][0-9]+", episodes)
			season = season[0]

			'''Using regex to retrieve episode number'''
			episode = re.findall(r"[eE][0-9]+", episodes)
			episode = episode[0]
				
			'''Using split to retrieve resolution'''
			resolution = episodes.split(".")
			resolution = resolution[2]

			converted_file_name = "%s-%s%s-%s.mkv" % (show_name,season.lower(),episode.lower(),resolution)

			'''This code is used for testing'''
			print(f"Converting {episodes} ---> {converted_file_name}")

			'''Write some code to take converted file name and actually rename files'''

		active = False

	else:
		print("Invalid input! Please only enter (y/n)")
