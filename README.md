Hello Guys,

I just wanted to use the assignment opportunity to learn a js framework and angular looked good to play with.

Also I deployed to Heroku the first time. It was an interesting experience and had its own challenges.

If you have any feedbacks(positive/negative) I would love to hear.

Gokhan


Explanation of caching;
If you check out the BooksController  you will see
    caches_action :index, :cache_path =>Proc.new { |c| c.params.delete_if { |k,v| [:keywords, :page].include?(k) } }


----- Development machine Macbook Pro previous generation ------

$ ab -n 5000 -c 100 http://0.0.0.0:3000/api/v1/books

Server Software:        thin
Server Hostname:        0.0.0.0
Server Port:            3000

Document Path:          /api/v1/books
Document Length:        60705 bytes

Concurrency Level:      100
Time taken for tests:   21.754 seconds
Complete requests:      5000
Failed requests:        0
Write errors:           0
Total transferred:      305767200 bytes
HTML transferred:       303889200 bytes
Requests per second:    229.85 [#/sec] (mean)
Time per request:       435.074 [ms] (mean)
Time per request:       4.351 [ms] (mean, across all concurrent requests)
Transfer rate:          13726.44 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.5      0       5
Processing:   141  431  31.0    427     502
Waiting:       18  388  31.7    387     452
Total:        142  432  30.9    427     503

Percentage of the requests served within a certain time (ms)
  50%    427
  66%    437
  75%    444
  80%    450
  90%    467
  95%    482
  98%    490
  99%    493
 100%    503 (longest request)



--------- HEROKU ----------
$ ab -n 5000 -c 100 http://boiling-bayou-8348.herokuapp.com/api/v1/books


Server Software:        thin
Server Hostname:        boiling-bayou-8348.herokuapp.com
Server Port:            80

Document Path:          /api/v1/books
Document Length:        63521 bytes

Concurrency Level:      100
Time taken for tests:   339.591 seconds
Complete requests:      5000
Failed requests:        0
Write errors:           0
Total transferred:      320657044 bytes
HTML transferred:       318723174 bytes
Requests per second:    14.72 [#/sec] (mean)
Time per request:       6791.812 [ms] (mean)
Time per request:       67.918 [ms] (mean, across all concurrent requests)
Transfer rate:          922.12 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:      112 1412 1071.5   1124   11750
Processing:  1294 5312 1241.6   5231   17132
Waiting:      175 1245 544.8   1140    4844
Total:       1406 6725 1500.0   6305   18609

Percentage of the requests served within a certain time (ms)
  50%   6305
  66%   6743
  75%   7197
  80%   7542
  90%   8989
  95%   9435
  98%  10464
  99%  11533
 100%  18609 (longest request)
