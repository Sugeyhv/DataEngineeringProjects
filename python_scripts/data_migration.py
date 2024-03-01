#!/usr/bin/env python3

from pyspark.sql import SparkSession
spark = SparkSession.builder \
    .appName("Mover tablas a HDFS") \
    .getOrCreate()
url = 'jdbc:mysql://localhost:3306/sakila/'
relational_df = spark.read.format('jdbc').options(url=url, dbtable= 'film', user= 'root', password = 'hortonworks1').load()
