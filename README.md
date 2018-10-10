# Vehicle Management API
- Management of vehicles and its owners
- Report data

## Prerequisites

* Ruby 2.5.1
* Rails 5.2.1
* PostgreSQL 9.x+

## Installation

Project configuration for development environment

Clone project:
```
git clone  https://github.com/camiloleal/vehicle-management.git
```

Run setup configurations
```bash
bin/setup
```

Run server:
```
bin/rails server
```


## Documentation

### **1 - People**
=============================

**Method** : `GET`
**URL** : `/api/v1/people`

**Response**

**Code** : `200 OK`

```json
[
    {
        "id": 4,
        "name": "Maria Lozano",
        "document_number": "123456789",
        "document_file": {
            "url": "/uploads/person/document_file/4/document_file.png"
        },
        "vehicles": []
    },
    {
        "id": 3,
        "name": "Pedro Soto ",
        "document_number": "123456777",
        "document_file": {
            "url": "/uploads/person/document_file/3/document_file.png"
        },
        "vehicles": []
    },
    {
        "id": 2,
        "name": "Carlos Flores ",
        "document_number": "123456888",
        "document_file": {
            "url": "/uploads/person/document_file/2/document_file.png"
        },
        "vehicles": [
            {
                "id": 3,
                "plate": "ZXH146",
                "branch": "Audi",
                "category": "SUV",
                "person_id": 2
            },
            {
                "id": 2,
                "plate": "ADT554",
                "branch": "Toyota",
                "category": "Sedan",
                "person_id": 2
            }
        ]
    }
]
```
=============================

**Method** : `GET`
**URL** : `/api/v1/people/2`

**Response**

**Code** : `200 OK`

```json
{
    "id": 2,
    "name": "Carlos Flores ",
    "document_number": "123456888",
    "document_file": {
        "url": "/uploads/person/document_file/2/document_file.png"
    },
    "vehicles": [
        {
            "id": 3,
            "plate": "ZXH146",
            "branch": "Audi",
            "category": "SUV",
            "person_id": 2
        },
        {
            "id": 2,
            "plate": "ADT554",
            "branch": "Toyota",
            "category": "Sedan",
            "person_id": 2
        }
    ]
}
```
=============================

**Method** : `POST`
**URL** : `/api/v1/people`
**Payload** :
```json
{
	"person": {
		"name": "Maria Lozano",
		"document_number": "123456789",
		"document_file": "data:image/png;base64,iVBORw0KG..."
	}
}
```

**Response**

**Code** : `200 OK`

```json
{
    "id": 4,
    "name": "Maria Lozano",
    "document_number": "123456789",
    "document_file": {
        "url": "/uploads/person/document_file/4/document_file.png"
    },
    "vehicles": []
}
```
=============================

**Method** : `PUT`
**URL** : `/api/v1/people/2`
**Payload** :
```json
{
	"person": {
		"name": "Carlos Flores ",
		"document_number": "123456888"
	}
}
```

**Response**

**Code** : `200 OK`

```json
{
    "id": 2,
    "name": "Carlos Flores ",
    "document_number": "123456888",
    "document_file": {
        "url": "/uploads/person/document_file/2/document_file.png"
    },
    "vehicles": [

    ]
}
```
=============================

**Method** : `DELETE`
**URL** : `/api/v1/people/1`

**Response**

**Code** : `204 No Content`


### **2 - Vehicles**
=============================

**Method** : `GET`
**URL** : `/api/v1/vehicles`

**Response**

**Code** : `200 OK`

```json
[
    {
        "id": 3,
        "plate": "ZXH146",
        "branch": "Audi",
        "category": "SUV",
        "person_id": 2
    },
    {
        "id": 2,
        "plate": "ADT554",
        "branch": "Toyota",
        "category": "Sedan",
        "person_id": 2
    }
]
```
=============================

**Method** : `GET`
**URL** : `/api/v1/vehicles/2`

**Response**

**Code** : `200 OK`

```json
{
    "id": 2,
    "plate": "ADT554",
    "branch": "Toyota",
    "category": "Sedan",
    "person_id": 2
}
```
=============================

**Method** : `POST`
**URL** : `/api/v1/vehicles`
**Payload** :
```json
{
	"vehicle": {
      "id": 3,
      "plate": "ZXH146",
      "branch": "Audi",
      "category": "SUV",
      "person_id": 2
	}
}
```

**Response**

**Code** : `200 OK`

```json
{
    "id": 3,
    "plate": "ZXH146",
    "branch": "Audi",
    "category": "SUV",
    "person_id": 2
}
```
=============================

**Method** : `PUT`
**URL** : `/api/v1/vehicles/2`
**Payload** :
```json
{
	"vehicle": {
		"plate": "ADT554",
		"branch": "Toyota",
		"category": "Sedan"
	}
}
```

**Response**

**Code** : `200 OK`

```json
{
    "id": 2,
    "plate": "ADT554",
    "branch": "Toyota",
    "category": "Sedan",
    "person_id": 2
}
```
=============================

**Method** : `DELETE`
**URL** : `/api/v1/vehicles/1`

**Response**

**Code** : `204 No Content`

### **3 - Reports**

| Parameter | Type | Required | options | Description |
| :--- | :--- | :--- | :--- | :--- |
| `format` | `string` | Si | `csv` `xls` | Formant to download report |
| `type` | `string` | Si | `vehicle` `vehicle_branches` `vehicle_branches_quantity` | Report types availables |

=============================

**Method** : `GET`
**URL** : `api/v1/reports/new?type=vehicles&format=csv`

**Response**

**Code** : `200 OK`

csv
```
Placa,Marca,Tipo
ZXH146,Audi,SUV
ADT554,Toyota,Sedan
```
=============================

**Method** : `GET`
**URL** : `api/v1/reports/new?type=vehicles_branches_quantity&format=csv`

**Response**

**Code** : `200 OK`

csv
```
Marca,Cantidad
Audi,1
Toyota,1
```
=============================

**Method** : `GET`
**URL** : `api/v1/reports/new?type=vehicles_branches&format=csv`

**Response**

**Code** : `200 OK`

csv
```
Marca,Placa,Tipo
Audi,ZXH146,SUV
Toyota,ADT554,Sedan
```
