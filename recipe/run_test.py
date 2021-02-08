import subprocess
from os.path import isfile

command = 'patch'
testfile = 'testfile.patch'

subprocess.check_call([command, '--help'])

if isfile(testfile):
    subprocess.check_call([command, '-i', "testfile.patch"])
    with open("testfile") as f1:
        testfile1 = f1.read()
    with open("testfile2") as f2:
        testfile2 = f2.read()

    assert testfile1 == testfile2
