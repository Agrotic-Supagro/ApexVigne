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
#### Response
```json
{
    "status": true,
    "message": "",
    "jwt": "",
    "data": {
        "id_utilisateur": "",
        "prenom": "",
        "nom": "",
        "email": "",
        "structure": ""
    }
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
#### Response
```Not tested yet```

### Reset password: `POST /reset_password.php`
#### Request body
```json
{
    "mot_de_passe": "",
    "email": ""
}
```
#### Response
```Not tested yet```

### Change password: `POST /change_password.php`
#### Request body
```json
{
    "mot_de_passe": "",
    "email": "",
    "idUser": 0
}
```
#### Response
```Not tested yet```

> ## Server
### Send a mail: `POST /contact.php`
#### Request body
```json
{
    "email": "",
    "corps_email": ""
}
```
#### Response
```Not tested yet```

### Send local data: `POST /send_data.php`
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
#### Response
```Not tested yet```

### Send all local data: `POST /send_all_data.php`
#### Request body
```json
{
    "user": "", // lastName
    "table": "", // loop tables: utilisateur_parcelle, parcelle, session, observation, device_info
    "data": [] // data rows item of table when SQL is executed
}
```
#### Response
```Not tested yet```

### Get User data: `POST /retrieve_data.php`
#### Request body
```json
{
    "table": "", // loop tables: utilisateur_parcelle, parcelle, session, commentaire, session_stadepheno
    "idUser": 0
}
```
#### Response
```json
{
    "status": true,
    "data": [],
    "idUser": null,
    "table": null
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
#### Response
```Not tested yet```

### Get shared parcel: `POST /sync_parcelle_shared.php`
#### Request body
```json
{
    "idUser": 0
}
```
#### Response
```json
{
    "status": true,
    "data": [],
    "idUser": null
}
```

### Get shared data: `POST /sync_data.php`
#### Request body
```json
{
    "table": "", // loop tables: utilisateur_parcelle, parcelle, session, observation, device_info, commentaire, session_stadepheno
    "data": [] // data rows item of table when SQL is executed
}
```
#### Response
```Not tested yet```

### Update stade pheno: `GET /update_stade_pheno.php`
#### Request body
```Nothing```
#### Response
```json
{
    "status": true,
    "data": [
        {
            "id_stade": "",
            "nom": "",
            "resume": "",
            "descriptif": "",
            "url_image": ""
        },
    ]
}
```
