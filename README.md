# Apex Vigne


## API

BaseURL: `https://www.agrotic.org/apexv3-sync`



> ## Authentication

### Login: `POST /login.php`
#### Request body
```json
{
    "email": "",
    "mot_de_passe": ""
}
```

### Create user: `POST /create_user.php`
#### Request body
```json
{
    "id_utilisateur": 0,
    "prenom": "",
    "nom": "",
    "email": "",
    "mot_de_passe": "",
    "structure": ""
}
```

### Reset password: `POST /reset_password.php`
#### Request body
```json
{
    "mot_de_passe": "",
    "email": ""
}
```

### Change password: `POST /change_password.php`
#### Request body
```json
{
    "mot_de_passe": "",
    "email": "",
    "idUser": 0
}
```

> ## Server
### Send a mail: `POST /contact.php`
#### Request body
```json
{
    "email": "",
    "corps_email": ""
}
```

### Send User data: `POST /send_data.php`
#### Request body
```json
{
    "email": "",
    "method": "", // parcelle, all
    "idParcelle": 0, // ONLY for method 'parcelle'
    "idUser": 0, // ONLY for method 'all'
    "userName": "" // lastName
}
```

### Send all data: `POST /send_all_data.php`
#### Request body
```json
{
    "user": "", // lastName
    "table": null, // loop tables: 'utilisateur_parcelle', 'parcelle', 'session', 'observation', 'device_info'
    "data": null // data rows item of table when SQL is executed
}
```

### Get User data: `POST /retrieve_data.php`
#### Request body
```json
{
    "table": null, // loop tables: 'utilisateur_parcelle', 'parcelle', 'session', 'commentaire','session_stadepheno'
    "idUser": 0
}
```

### Share a parcel: `POST /share_parcelle.php`
#### Request body
```json
{
    "idOwner": 0, // user ID
    "nomUser": "",
    "idParcelle": 0,
    "nomParcelle": "",
    "email": ""
}
```

### Get shared parcel: `POST /sync_parcelle_shared.php`
#### Request body
```json
{
    "idUser": 0
}
```

### Get shared data: `POST /sync_data.php`
#### Request body
```json
{
    "table": null, // loop tables: 'utilisateur_parcelle', 'parcelle', 'session', 'observation', 'device_info', 'commentaire', 'session_stadepheno'
    "data": null // data rows item of table when SQL is executed
}
```

### Update stade pheno: `POST /update_stade_pheno.php`
#### Request body
```Nothing```
