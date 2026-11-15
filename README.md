# GraphQL API with Rails

A **GraphQL** API built on **Rails 7**, **graphql-ruby** and **PostgreSQL**, with a GraphiQL explorer for development.

![Ruby](https://img.shields.io/badge/Ruby-3.0.2-CC342D?logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-7.1-CC0000?logo=rubyonrails&logoColor=white)
![GraphQL](https://img.shields.io/badge/GraphQL-E10098?logo=graphql&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)

## Highlights

- Typed schema with `ItemType` and `ArtistType` (an item belongs to an artist)
- Query for items with nested artist data in one round trip
- Mutations: `createItem`, `updateItem`, `deleteItem`
- GraphiQL IDE mounted at `/graphiql` in development

## Schema overview

```graphql
type Item {
  id: ID!
  title: String
  description: String
  imageUrl: String
  artistId: Int!
  artist: Artist!
}

type Artist {
  id: ID!
  firstName: String
  lastName: String
  email: String
}
```

### Example query

```graphql
query {
  items {
    id
    title
    artist { firstName lastName }
  }
}
```

## Getting started

```bash
git clone https://github.com/chanchal-ch0udhary/GraphQl_api_app.git
cd GraphQl_api_app
bundle install
bin/rails db:create db:migrate
bin/rails server
```

Open `http://localhost:3000/graphiql` to explore the API. The endpoint is `POST /graphql`.
