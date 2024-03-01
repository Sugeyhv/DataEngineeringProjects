#!/usr/bin/env python3

from pyspark.sql import SparkSession
spark = SparkSession.builder \
    .appName("Data_CSV") \
    .enableHiveSupport() \
    .getOrCreate()

ruta_archivo = "./CSV/film.csv"
hdfs_path = "/user/maria_dev/data/film_2"

df = spark.read \
    .format("csv") \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .load(ruta_archivo)
df.show()

df.write.mode("overwrite").saveAsTable("final_project.film_2", path=hdfs_path)
