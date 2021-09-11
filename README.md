# api-db-poc
Simple API and DB POC

# Instructions
from the root dir  
`docker-compose up`

## API
if running locally, the default url is
http://localhost:5000/
### site
`/site/<site name>`  
returns one json per instrument for the provided site name
### instruments
`/instrument/<instrument id>`  
returns a json of instrument information.   
If the instrument is a computer the _mac_ field is populated.
If the instrument is a freezer the _container_ fields are populated.  
### container
`/container/<container uuid>`