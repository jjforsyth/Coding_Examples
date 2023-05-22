import time
import os
import jcamp
import matplotlib.pyplot as plt

start_time = time.time()


data_name='ld_14'
dataset='validation'

num=0
files=os.listdir(r'/Users/jonathanforsyth/Documents/UMass/Machine_Learning/spectra/raw_jdx/' + dataset + '/' + data_name + '/')
for i in files:
    num+=1
    print(num,'/',len(files))
    jcamp_dict = jcamp.jcamp_readfile('./spectra/raw_jdx/' + dataset + '/' + data_name + '/' + i)
    name = i.replace('.jdx', '')

    x = jcamp_dict['x']
    y = jcamp_dict['y']

    fig, ax = plt.subplots()
    ax.plot(x, y, color='white')
    ax.set_facecolor('black')
    ax.set_xlim(0, 750)
    ax.set_ylim(0, 10200)

    fig.subplots_adjust(left=0, bottom=0, right=1, top=1, wspace=0, hspace=0)
    # px = 1 / plt.rcParams['figure.dpi']
    fig.set_size_inches(4, 4)

    fig.savefig('./spectra/images/' + dataset + '/' + data_name + '/' + name + '.jpg', dpi=56)
    plt.clf()

print("--- %s seconds ---" % (time.time() - start_time))
