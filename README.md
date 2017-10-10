## Ghost

[Ghost](https://ghost.org) blog using [ghost-cloudinary-store](https://github.com/mmornati/ghost-cloudinary-store) custom storage module.

clone this repo.

edit the `config.production.json` to your config.

Create new [cloudinary](https://cloudinary.com) and [Get Account Details](https://cloudinary.com/console).

```
"storage": {
    "active": "ghost-cloudinary-store",
    "ghost-cloudinary-store": {
        "cloud_name": "yourCloudName",
        "api_key": "yourApiKey",
        "api_secret": "yourApiSecret"
    }
}
```

run commands after git clone

```
git submodule update --init

docker build -t ghost:cloudinary-store .
````
## Test
```
docker run -it --rm -p2368:2368 ghost:cloudinary-store
```
Go to http://your-ip:2368/ghost/#/editor and upload images.

If you see "Bad credentials" on log please check your token. you create new  token if the token was used.