worker_processes 2
working_directory "/home/anime/history_library/current" #appと同じ階層を指定

timeout 3600


listen "/var/run/unicorn/history_library.sock"
pid "/var/run/unicorn/history_library.pid"


stderr_path "/home/anime/history_library/current/log/unicorn.log"
stdout_path "/home/anime/history_library/current/log/unicorn.log"


preload_app true