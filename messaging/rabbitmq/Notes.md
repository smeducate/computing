#Notes

1. Installed RabbitMq in a docker container.

####Issues with docker-compose
1. Client server compatibility issues with the following error message
  ```
  docker-compose up leads to “client and server don't have same version (client : 1.14, server: 1.12)” 
  error but client and server have the same version
  ```
  Checkout the environment variable COMPOSE_API_VERSION.

  I was getting ERROR: client and server don't have same version (client : 1.19, server: 1.18), then I did export 
  COMPOSE_API_VERSION=1.18 and problem sovled!
     Resolution:  
     ```
     export COMPOSE_API_VERSION=1.18 
     ```
2. While running docker-compose, I got the following error
```
python stack trace was popping up.

Exception in thread Thread-1:
Traceback (most recent call last):
  File "/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/threading.py", line 810, in __bootstrap_inner
    self.run()
```
Resolution: start docker-compose with the following option in order to run it as a service in the background
docker-compose up -d
