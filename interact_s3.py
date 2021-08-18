import re, os
import boto3
s3 = boto3.client('s3')
pattern = r'[\w-]+\.CSV$'
regex = re.compile(pattern, re.IGNORECASE)
base = './data'

for root, dirs, files in os.walk(base):
    for file in files:
        archivos=os.path.join(root,file)
        if regex.search(archivos):
            s3.upload_file(archivos, BUCKET_NAME,'raw-data/'+file)