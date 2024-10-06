Los privilegios a un usuario creado, como "c##jesus" se le darían de la siguiente forma:
```sql
CREATE USER c##jesus;

GRANT ALL PRIVILEGES TO c##jesus;
```

Si hubiese algún error, también aplicaríamos lo siguiente:
```sql
GRANT CONNECT, RESOURCE TO c##jesus;
```