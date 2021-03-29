import pandas as pd
import glob
import os

# source script with edit_pres function
exec(open('edit_pres.py').read())

# load in data files
path = "data/"
data_files = glob.glob(os.path.join(path, "*.csv"))
dataframes = dict()
for i in data_files:
    path = os.path.basename(i)
    name = path.split('.')[0]
    dataframes[name] = pd.read_csv("data/" + name + ".csv")

# create outputs directory if it doesn't exist
if not os.path.isdir("outputs"):
  os.mkdir("outputs")

# generate a ppt for each group
for group in dataframes['chart_df'].group.values:
  tables_data = dataframes['table_' + group]
  edit_pres(group, dataframes['chart_df'], tables_data, 
  'templates/ppt-template.pptx', 'outputs/results_group_' + group + '.pptx')
  
