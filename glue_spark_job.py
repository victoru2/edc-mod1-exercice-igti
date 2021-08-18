import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

## @params: [JOB_NAME]
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

# Ler os dados do censo 2020
censo = (
    spark
    .read
    .format("csv")
    .option("header", True)
    .option("inferSchema", True)
    .option("delimiter", "|")
    .load("s3://datalake-victorurquiola-451395640202/raw-data/")
)



(
    censo
    .write
    .mode("overwrite")
    .format("parquet")
    .partitionBy("NU_ANO_CENSO")
    .save("s3://datalake-victorurquiola-451395640202/silver-data/")
)