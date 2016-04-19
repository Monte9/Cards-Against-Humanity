##CSC 667 - Ruby on Rails project

Built for CSC 667- Cards against humanity game using Ruby on rails.

## Cards against humanity game

<div id=""></div>Team members

1. Monte 

2. Nate

3. Iain

4. Evan





##To set up postgres

```brew install postgres```

```initdb /usr/local/var/postgres/data```

```pg_ctl -D /usr/local/var/postgres/data -l logfile start```

```createuser --superuser postgres```

```createuser --createdb 667```

```createdb -O 667 --encoding=UNICODE cards-against-humanity```

```rake db:migrate```
