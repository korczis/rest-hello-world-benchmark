## REST Hello World Benchmark

### Specification of test

Application MUST implement following endpoint `/api/hello-world

| Path | Response |
|------|----------|
| `/api/hello-world`| `{"message":"Hello World!"}`|
### Hardware used

| Parameter | Value                             |
|-----------|-----------------------------------|
| Model     | MacBook Pro (15-inch, 2017)       |
| Processor | 2,9 GHz Quad-Core Intel Core i7   |
| Memory    | 16 GB 2133 MHz LPDDR3             |

### Methodology

apache benchmark - 10,000 requests using 100 parallel connections to endpoint will be used for test

`ab -c 100 -n 10000 http://127.0.0.1:4000/api/hello-world`

### Elixir - Phoenix

#### Build & Run

```bash
cd elixir-phoenix

# build
MIX_ENV=prod  mix do deps.get, deps.compile, compile, phx.digest

# run
MIX_ENV=prod iex -S mix phx.server
```

#### Result

```
$ ab -c 100 -n 10000 http://127.0.0.1:4000/api/hello-world
This is ApacheBench, Version 2.3 <$Revision: 1879490 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:        Cowboy
Server Hostname:        127.0.0.1
Server Port:            4000

Document Path:          /api/hello-world
Document Length:        26 bytes

Concurrency Level:      100
Time taken for tests:   0.898 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2720000 bytes
HTML transferred:       260000 bytes
Requests per second:    11140.30 [#/sec] (mean)
Time per request:       8.976 [ms] (mean)
Time per request:       0.090 [ms] (mean, across all concurrent requests)
Transfer rate:          2959.14 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    2   1.1      2       9
Processing:     1    7   2.7      7      19
Waiting:        1    6   2.6      6      19
Total:          3    9   2.5      9      21

Percentage of the requests served within a certain time (ms)
  50%      9
  66%     10
  75%     10
  80%     11
  90%     12
  95%     13
  98%     15
  99%     16
 100%     21 (longest request)
```