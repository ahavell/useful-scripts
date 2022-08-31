#!/usr/bin/python

import subprocess

#written by Alex Havell 31/08/2022
#tested with Networker 19
#gets a list of all the backup workflows and shows the start times and other useful info for netwoker
#Works if you have a policy named "Backup" - change this part in the variable to the name of the policy you want

def get_info():
	policies = (subprocess.check_output(["nsrpolicy", "workflow", "list", "-p", "Backup"]))
	workflows = policies.split("\n")
	workflows = filter(None, workflows)
	values = ['workflowName', 'abtDestinationPool', 'abRetentionPeriod', 'workflowEnabled', 'workflowStarttime', 'workflowComment']
	facts = []

# uses the nsrpolicy command to retrieve the data of the values in the above list before appending them to a list and printing

	for w in workflows:
		info = (subprocess.check_output(["nsrpolicy", "workflow", "display", "-p", "Backup", "-w", w]))
		for line in info.split("\n"):
			for v in values:
				if v in line:
					facts.append(line.strip())
		print (('\n'.join(map(str, facts))) +" \n ----- \n")
		del facts[:]


if __name__ == "__main__":
    get_info()
    