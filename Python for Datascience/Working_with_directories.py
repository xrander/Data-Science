#to get current working directory
#types of paths in python: relative and absolute
#absolute-this is the same as the root directory '/'
#relative path is a specific location in a file system relative to the current working directory
#current working directory = cwd
#the os and path module is essential in working with directories in python.

#using os module
from importlib.resources import path
import os
os.getcwd()

#using Path module
from pathlib import Path
Path.cwd()
