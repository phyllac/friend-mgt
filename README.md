# Friend-Mgt

A RESTful Web API application built on Ruby on Rails to simulate a common social networking function - **Friend Management**.

## Specifications

The Web API consists of the following functionalities:
1. Add connection
2. Get friends list
3. Get common friends list
4. Subscribe to a friend/user
5. Block a friend/user
6. Get recipients

All API methods accept inputs and outputs in JSON format.
For the full specifications, please refer to [Full Stack Engineer](https://gist.github.com/winston/51d26e4587b5e0bbf03fcad558111c08).

## Running/Testing the app

A working instance is deployed on [Heroku](https://www.heroku.com/) cloud platform. To test, a HTTP Request composer (i.e [Postman](https://www.getpostman.com)) is required. The succeeding sections will specify the URL's and demonstrate the usage of each methods. Postman was used on all tests.

#### NOTE before testing
Make sure the request headers of POST requests are properly setup with at least the following configuration:
```
Content-Type: application/json
```
And populate the body with JSON-only text. For example:
```
{
  "friends":
    [
      "andy@example.com",
      "pete@example.com"
    ]
}
```
And now let's proceed...

### 1. Add connection

URL: https://friend-mgt.herokuapp.com/api/v1/connections

Sample input:
```
{
  "friends":
    [
      "andy@example.com",
      "pete@example.com"
    ]
}
```
Sample output:
```
{
    "success": true
}
```

### 2. Get friends list

URL: https://friend-mgt.herokuapp.com/api/v1/friends

Sample input:
```
{
  "email": "andy@example.com"
}
```
Sample output:
```
{
    "success": true,
    "friends": [
        "pete@example.com"
    ],
    "count": 1
}
```

### 3. Get common friends list
URL: https://friend-mgt.herokuapp.com/api/v1/common_friends

Sample input:
```
{
  "friends":
    [
      "tess@example.com",
      "may@example.com"
    ]
}
```
Sample output:
```
{
    "success": true,
    "friends": [
        "john@example.com"
    ],
    "count": 1
}
```

### 4. Subscribe to a friend/user
URL: https://friend-mgt.herokuapp.com/api/v1/subscriptions

Sample input:
```
{
  "requestor": "red@example.com",
  "target": "fes@example.com"
}
```
Sample output:
```
{
    "success": true
}
```

### 5. Block a friend/user
URL: https://friend-mgt.herokuapp.com/api/v1/blocks

Sample input:
```
{
  "requestor": "wes@example.com",
  "target": "cad@example.com"
}
```
Sample output:
```
{
    "success": true
}
```

### 6. Get recipients
URL: https://friend-mgt.herokuapp.com/api/v1/recipients

Sample input:
```
{
  "sender":  "andy@example.com",
  "text": "Hello World! kate@example.com mark@example.com"
}
```
Sample output:
```
{
    "success": true,
    "recipients": [
        "pete@example.com",
        "kate@example.com",
        "mark@example.com"
    ]
}
```

## Built With

* [Ruby on Rails 5.1.5](http://rubyonrails.org) - Ruby 2.3.3 for the Language and Rails 5.0.5 for the Framework
* [Heroku](https://www.heroku.com/) - cloud hosting platform
* [Postman](https://www.getpostman.com/) - testing tool

## Authors

* **Phil Mark G Lacerna** - *Initial work* - [THIS](https://github.com/phyllac/friend-mgt)

