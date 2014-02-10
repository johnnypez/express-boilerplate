# Boilerplate App

### Developing


Start up mongod: ```npm run db```

Start the app: ```nodemon web.coffee```


### Testing

Just run ```mocha```

Exporting mongo data as fixtures...

```mongoexport --db boilerplate --collection users --out test/fixtures/users.json```

### Deploy to Heroku

```bash
heroku create boilerplate --region eu
heroku addons:add mongolab
git push heroku master
```