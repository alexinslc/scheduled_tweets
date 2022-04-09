# The Model View Controller (MVC) Pattern

GET /about HTTP/1.1
Host: 127.0.0.1

## Routes

Matchers for the URL that is requested

GET for "/about" 

I see you requested "/about", we'll give that to the AboutController to handle

## Models

Database wrapper

User
* Query for records
* Wrap individual records (things like validation)
* 

## Views

Your response body content.
* HTML
* CSS
* PDF
* XML
* JSON

This is what gets sent back to the browser and displayed

## Controllers

Decided how to process a request and define a response