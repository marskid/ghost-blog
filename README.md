##Ghost

[Ghost](https://ghost.org) blog using [ghost-github](https://github.com/ifvictr/ghost-github) custom storage module.

change the `config.production.json`
```
"storage": {
    "active": "ghost-github",
    "ghost-github": {
        "type": "token",
        "user": "...",
        "token": "...",
        "repo": "...",
        "branch": "..."
    }
}
```

*run commands after git clone*

```
git submodule init

cd ghost-github && npm install --production && cd ..

docker build -t ghost:github-storage .
````