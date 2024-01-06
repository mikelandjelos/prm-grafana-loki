#!/bin/bash

total_requests=50
requests_per_iteration=10
concurrency=5
url=http://127.0.1.1/
methods=("GET" "POST" "PUT" "DELETE")

iterations=$((total_requests / requests_per_iteration))

for ((i=0; i<$iterations; i++)); do
    for method in "${methods[@]}"; do
        echo "Sending $requests_per_iteration $method requests..."
        ab -n $requests_per_iteration -c $concurrency -m $method $url
        sleep 2  # Wait for 10 seconds before the next iteration
    done
done