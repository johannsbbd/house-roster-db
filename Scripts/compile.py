### Postgres SQL tables, with their properties:
#
# Person(id, firstName, lastName, type, house_id, available)
# House(id, name)
# Room(id, name, house_id)
# Task(id, room_id, days)
# Work(id,  assigned_person, completed_person, task_id, due_date, done_date)
from pathlib import Path

outputFile = 'setupdb.sql'

def compileDump():    
    fileDirs = ['./Setup', './Functions', './Views', './StoredProc']
    with open(outputFile, 'w+') as outfile:
        for directory in fileDirs:
            for path in Path(directory).glob('**/*.sql'):
                with open(path) as infile:
                    outfile.write('\n')
                    for line in infile:
                        print(line)
                        outfile.write(line)

compileDump()