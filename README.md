# Universe Database

A relational database built with PostgreSQL as part of the [freeCodeCamp Relational Databases certification](https://www.freecodecamp.org/learn/relational-databases-v9/).

## Description

This database models the universe with astronomical data about galaxies, stars, planets, moons, and constellations. All data is based on real astronomical measurements where possible.

## Tables

- **galaxy** — 11 galaxies including the Milky Way, Andromeda, and Magellanic Clouds
- **star** — 20 stars with spectral classification, temperature, and mass data
- **planet** — 22 planets including the Solar System and famous exoplanets
- **moon** — 20 moons primarily from the Solar System
- **constellation** — 20 constellations with positional and observational data

## How to rebuild the database

```bash
psql -U postgres < universe.sql
```

## Technologies

- PostgreSQL 12
- psql CLI

## Author
Implemented by Giulia Trentarossi
