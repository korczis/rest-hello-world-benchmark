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

```text
$ ab -c 100 -n 10000 http://127.0.0.1:4000/api/hello-world

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

### Go - Fiber

#### Build & Run

```bash
cd go-fiber

# build
make

# run
./bin/go-fiber
```

#### Result

```text
$ ab -c 100 -n 10000 http://127.0.0.1:4000/api/hello-world

Server Software:
Server Hostname:        127.0.0.1
Server Port:            4000

Document Path:          /api/hello-world
Document Length:        26 bytes

Concurrency Level:      100
Time taken for tests:   0.857 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1620000 bytes
HTML transferred:       260000 bytes
Requests per second:    11669.05 [#/sec] (mean)
Time per request:       8.570 [ms] (mean)
Time per request:       0.086 [ms] (mean, across all concurrent requests)
Transfer rate:          1846.08 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    5   6.0      4      75
Processing:     1    4   3.6      4      75
Waiting:        0    4   3.4      4      75
Total:          5    8   7.0      8      78

Percentage of the requests served within a certain time (ms)
  50%      8
  66%      8
  75%      8
  80%      8
  90%      9
  95%     10
  98%     10
  99%     76
 100%     78 (longest request)
```

#### Note

Percentiles are too volatile.

##### Run #1

```
Percentage of the requests served within a certain time (ms)
  50%      8
  66%      8
  75%      9
  80%      9
  90%      9
  95%     10
  98%     11
  99%    137
 100%    139 (longest request)
```

##### Run #2

```
Percentage of the requests served within a certain time (ms)
  50%      6
  66%      6
  75%      7
  80%      7
  90%      8
  95%      9
  98%     10
  99%   7032
 100%  13745 (longest request)
```

##### Run #3

```
Percentage of the requests served within a certain time (ms)
  50%      5
  66%      5
  75%      6
  80%      6
  90%      6
  95%      7
  98%      7
  99%      9
 100%     19 (longest request)
```

##### Run #4

```
Percentage of the requests served within a certain time (ms)
  50%      4
  66%      5
  75%      5
  80%      5
  90%      6
  95%      7
  98%      7
  99%      8
 100%   6712 (longest request)
```

##### Run #5
```
Percentage of the requests served within a certain time (ms)
  50%      5
  66%      5
  75%      6
  80%      6
  90%      6
  95%      7
  98%      7
  99%      7
 100%      9 (longest request)
```