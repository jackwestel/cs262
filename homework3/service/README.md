# CS 262 Monopoly Webservice

This is the data service application for homework 3 
and it is deployed here:
          
<https://scary-demon-02863.herokuapp.com/>

Questions:

1. /, /players, /rjq, /players/:id

2. PUT, GET, DELETE are idempotent. The end points implement these actions. GET requests are Nullipotent because they change the data structure, meaning they're all capable of being nullipotent.

3. Yes, this is RESTful. It's Restful because it has a client-server architecture where the client queuries the server. On top of that, it's stateless because the client doesn't store anything on the server, and the interface is uniform while allowing the client and server to grow independently.

4. The data can be accessed by the client without any errors. This means there is no impedance mismatch.