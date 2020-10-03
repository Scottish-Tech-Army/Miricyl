# Mirical web app

## Setup

### database

#### MySQL docker setup

for development run the stack.yml file using
'''docker-compose -f stack.yml up'''

You will need docker installed for this to work

#### Database initialize

from the database folder import the files in the following order from the root of the database tree

1. DBCreateScript - Creates the schema, tables and view.
2. RefDataInsert - Inserts Reference data for Needs, personalisation, type, country and gender
3. OrganisationTestData - Test data for Organisation (only 2 records)
4. OrgServiceTestData - Test data for Services provided by Organisations (3 records)

### Frontend

1. `cd client`
2. ` npm install`

### server

1. `cd server`
2. ` npm install`

## API calls

The Api calls are structures into the following

- `http://localhost:3000/api/needs` This returns the lists of Needs and user options used for the Needs question on the frontend
- `http://localhost:3000/api/charities` This returns the full list of charities in the database. This is used when the user skips the first question
- `http://localhost:3000/api/charities?tags=Parenting,Alcohol` This query is built up from the user selection of the needs question. It used the NeedsDesc from the options selected

## Local running

To run this app locally run these services in order

1. start the database either by the docker command or using the dashboard
2. cd into the server directory anr run `npm start dev`
3. cd int the client directory and run `npm start` at both the frontend and server run on port 3000 you will be asked if you want to change the port, select y and the frontend will run on port 3001
