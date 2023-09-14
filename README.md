# docker-json-server

Source code for [nilsjorgen/json-server](https://hub.docker.com/r/nilsjorgen/json-server), a Docker image for running [json-server](https://github.com/typicode/json-server).

## Defaults

```sh
VOLUME /data
ENV DB_FILE="db.json"
EXPOSE 3000
```

## Usage

Run `json-server` using the provided `db.json`:

```sh
docker run -d -P -v $(pwd)/db.json:/data/db.json --name json-server nilsjorgen/json-server:17-alpine
```

Runs `json-server` using a custom data file:

```sh
docker run -d -P -e DATA_FILE=books.json -v $(pwd)/books.json:/data/books.json --name json-server nilsjorgen/json-server:1
```

The file served by `json-server` must wrap the content in named objects. The names will make up the REST paths to use to issue queries.

The `books.json` file:

```json
{
  "books": [
    {
      "id": 1,
      "title": "Crime and Punishment",
      "author": "Fjodor Dostojevskij"
    },
    {
      "id": 2,
      "title": "Anna Karenina",
      "author": "Leo Tolstoy"
    },
    {
      "id": 3,
      "title": "Karius og Baktus",
      "author": "Thorbjørn Egner"
    }
  ]
}
```

Can be queried with `curl localhost:3000/books`, which will return the unwrapped JSON array:

```json
[
    {
      "id": 1,
      "title": "Crime and Punishment",
      "author": "Fjodor Dostojevskij"
    },
    {
      "id": 2,
      "title": "Anna Karenina",
      "author": "Leo Tolstoy"
    },
    {
      "id": 3,
      "title": "Karius og Baktus",
      "author": "Thorbjørn Egner"
    }
  ]
```

The query `$PATH_TO_SERVER/books/2` returns the book with id `2`:

```json
{
  "id": 2,
  "title": "Anna Karenina",
  "author": "Leo Tolstoy"
}
```
