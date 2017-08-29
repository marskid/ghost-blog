## Ghost

[Ghost](https://ghost.org) blog using [ghost-github](https://github.com/ifvictr/ghost-github) custom storage module.

clone this repo.

edit the `config.production.json` to your config.

Create new repo and [get new token](https://github.com/settings/tokens/new).
Do not commit your token on github. GitHub will revoke your token.

user and repo follow the repo link format: `https://github.com/{user}/{repo}`

```
"storage": {
    "active": "ghost-github",
    "ghost-github": {
        "type": "token",
        "user": "...",
        "token": "...",
        "repo": "...",
    }
}
```

run commands after git clone

```
git submodule update --init

cd ghost-github && npm install --production && cd ..

docker build -t ghost:github-storage .
````
## Test
```
docker run -it --rm -p2368:2368 ghost:github-storage
```
Go to http://your-ip:2368/ghost/#/editor and upload images.

If you see "Bad credentials" on log please check your token. you create new  token if the token was used.