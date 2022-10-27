import csv

with open('logs.txt', 'r') as in_file:
    stripped = (line.strip() for line in in_file)
    lines = (line.split(",") for line in stripped if line)
    with open('logs.csv', 'w') as out_file:
        writer = csv.writer(out_file)
        writer.writerows(('test1', 'test2'))
        writer.writerows(lines)
