import time
import pandas as pd
import os
import requests

start_time = time.time()

# labelled_data_df=pd.read_csv(r'~/Documents/UMass/Machine_Learning/labelled_data_df1.csv')
# labelled_data_df.shape[0]

data_name='ld_2'
labelled_data_df = pd.read_csv(r'/Users/jonathanforsyth/Documents/UMass/Machine_Learning/labelled_data/'+data_name+'.csv')
dataset='validation'

#Removed this block because I ended up reducing input of lower-value chemicals to even out the dataset weight toward 15
# if dataset == 'train':
#    num_chem = int(labelled_data_df.shape[0]*.7)
# elif dataset == 'validation':
#    num_chem = (int(labelled_data_df.shape[0] * .7)), (labelled_data_df.shape[0])


for i in range(20, 26):
    print(i, "/", labelled_data_df.shape[0], ": ", labelled_data_df.iloc[i, 3])
    name = str(labelled_data_df.iloc[i, 0])
    filename = name + '.jdx'
    file_path = os.path.join(r'/Users/jonathanforsyth/Documents/UMass/Machine_Learning/spectra/raw_jdx/'+dataset+'/'+data_name+'/', filename)
    myurl = str(labelled_data_df.iloc[i, 3])
    r = requests.get(url=myurl, allow_redirects=True)
    open(file_path, 'wb', ).write(r.content)

print("--- %s seconds ---" % (time.time() - start_time))
