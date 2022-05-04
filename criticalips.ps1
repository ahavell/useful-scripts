# this will take a txt file list of servers and return the IP for each one in a file called criticallist.txt 
# remember to put the txt file location in the get-content 

$servers = get-content " "

foreach ($i in $servers )
{ Resolve-DnsName $i | select -first 1 | ft Name, IPAddress -HideTableHeaders | out-file -Append \Documents\criticallist.txt
}