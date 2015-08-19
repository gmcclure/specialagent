import multiprocessing

bind    = "127.0.0.1:8000"
logfile = "/srv/www/specialagent/logs/gunicorn.log"
workers = multiprocessing.cpu_count() * 2 + 1
