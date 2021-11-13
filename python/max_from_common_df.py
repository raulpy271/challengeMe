# Description: https://www.codewars.com/kata/5ea2a798f9632c0032659a75

import pandas as pd

def max_common(df_a, df_b):
    df = df_a.copy()
    commum_columns = set(df_a.columns) & set(df_b.columns)
    for column in commum_columns:
        for i in df_a.index:
            df.iloc[i][column] = max(df_a.iloc[i][column], df_b.iloc[i][column])
    return df
