# Active Directory
Inspired by https://schneide.blog/2022/06/27/running-a-containerized-activedirectory-for-developers/

## Server
```bash
docker compose up --build activedirectory
```

## Client
```bash
#LDAPTLS_REQCERT=never ldapsearch -H ldaps://127.0.0.1 -D 'DEV-AD\Administrator' -w 'admin123!' -o ldif-wrap=no -b 'DC=ldap,DC=local' '(&(objectClass=user))' dn
ldapsearch -H ldap://127.0.0.1 -D 'DEV-AD\Administrator' -w 'admin123!' -o ldif-wrap=no -b 'DC=ldap,DC=local' '(&(objectClass=user))' dn
```
