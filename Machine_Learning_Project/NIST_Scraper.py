import pandas as pd
import requests
from bs4 import BeautifulSoup
import time

start_time = time.time()

# Read in the pickle object for compounds w/ labelled MA
obj = pd.read_pickle(
    r'~/Documents/UMass/Machine_Learning/41467_2021_23258_MOESM2_ESM/molecular-complexity-data/molecular-complexity'
    r'-data/Figure 2- MA in Chemical Space/computed_ma.pickle')

# List of compounds in NIST database
nist = pd.read_table(r'~/Desktop/species.txt')

# Filtered w/ by their Acession number
filtered_nist = nist.loc[-nist.iloc[:, 2].isnull(), ]


def scraper(compound_ID):
    URL = "https://webbook.nist.gov/cgi/cbook.cgi?ID=" + str(compound_ID) + "&Units=SI&cMS=on#Mass-Spec"
    # print(URL)
    page = requests.get(URL)
    soup = BeautifulSoup(page.content, "html.parser")
    label = soup.find("h1", id='Top')
    if label is None:
        pass
    else:
        label = soup.find("h1", id='Top').text
    InChI = soup.find('span', clss='inchi-text')
    if InChI is None:
        pass
    else:
        InChI = soup.find('span', clss='inchi-text').text
    indented_nist = soup.find("div", class_='indented')

    if indented_nist is None:
        pass
    else:
        links = indented_nist.findAll('a')
        if len(links) > 0:
            for i in links:
                if i.text == 'spectrum':
                    # print(compound_ID,':', i.attrs['href'])
                    compound_link = 'https://webbook.nist.gov' + i.attrs['href']
                    compound = ([compound_ID, label, InChI, compound_link])
                    return compound
                else:
                    pass


compound_df = pd.DataFrame(columns=['Compound_ID', 'Compound_Name', 'inchi', 'link'])
n = 0
for val in filtered_nist.iloc[0:44656, 2]:
    if n%1000==0:
        print(n, '/', filtered_nist.shape[0])
    if scraper(val) is None:
        pass
    else:
        val2 = scraper(val)
        compound_df.loc[len(compound_df)] = val2
        n += 1

labelled_data_df = pd.merge(compound_df, obj, how='inner', on='inchi')
labelled_data_df = labelled_data_df.drop_duplicates('Compound_ID')
labelled_data_df.to_csv('labelled_data_df16.csv', index=False)

print("--- %s seconds ---" % (time.time() - start_time))

dist = []
for i in range(1,24):
    path = '/Users/jonathanforsyth/Documents/UMass/Machine_Learning/spectra/raw_jdx/train/ld_'+str(i)
    num=len(os.listdir(path))
    dist.append(num)

dist_df=pd.DataFrame({'MA':range(1,24),
             'Count': dist})
