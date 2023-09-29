## ownCloud 8

Server version: `owncloud 8`

### Start the server

```bash
docker compose up
```

Server avaliable at `http://localhost:8080`

### Add to trusted domains

From the host machine, login to `http://localhost:8080` and navigate to link `http://localhost:8080/index.php/settings/admin?trustDomain=<other-domain>`

### Stop the server

```bash
docker compose down -v
```
