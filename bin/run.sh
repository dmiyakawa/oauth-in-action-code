#!/bin/bash

(
    trap "kill 0" SIGINT
    # TCP 9000
    (node client.js) &
    # TCP 9001
    (node authorizationServer.js) &
    # TCP 9002
    (node protectedResource.js) &
    wait
)