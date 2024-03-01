#!/usr/bin/env python3
from pyspark.sql import SparkSession

# Crea una instancia de SparkSession
spark = SparkSession.builder.appName("MiApp").getOrCreate()

sc = spark.sparkContext

rdd = sc.parallelize([1,2,3,4,5])

print(rdd.collect())

