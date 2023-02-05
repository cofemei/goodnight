# README

Setup development database

```bash
bin/setup
```

# API Document

## Clocks

```bash
# Return all clocked-in times
GET /api/v1/clocks?page=1
Accept: application/json

curl -H "Content-Type: application/json" -X GET "http://localhost:3000/api/v1/clocks?page=1"
```

```bash
# Clock In bedtime
POST /api/v1/clocks 
Accept: application/json
{"clock": {"is_bedtime": true}}

# Clock In wake-up
POST /api/v1/clocks
Accept: application/json
{"clock": {"is_bedtime": false}}

curl -d '{"clock":{"is_bedtime": true}}' -H "Content-Type: application/json" -X POST 'http://localhost:3000/api/v1/clocks'
```

## user follow

```bash
# all following users
GET /api/v1/follows
Accept: application/json

curl -d '{"clock":{"is_bedtime": true}}' -H "Content-Type: application/json" -X POST 'http://localhost:3000/api/v1/clocks'
```

```bash
# create follow
POST /api/v1/clocks
Accept: application/json

curl -d '{"clock":{"is_bedtime": true}}' -H "Content-Type: application/json" -X POST 'http://localhost:3000/api/v1/clocks'
```

```bash
# unfollow
POST /api/v1/clocks
Accept: application/json

curl -d '{"clock":{"is_bedtime": true}}' -H "Content-Type: application/json" -X DELETE 'http://localhost:3000/api/v1/clocks'
```

## user

```bash
# User Profile
GET /api/v1/users
Accept: application/json

curl -d '{"clock":{"is_bedtime": true}}' -H "Content-Type: application/json" -X POST 'http://localhost:3000/api/v1/clocks'
```

