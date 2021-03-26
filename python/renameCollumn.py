import pandas as pd

def rename_columns(df, names):  
    newDf = df.copy()
    newDf.columns = names
    return newDf
