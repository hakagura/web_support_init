worker_processes 2

working_directory "/home/ubuntu/www/suporte.leilaodeseminovos.com.br/current"

listen "/home/ubuntu/www/suporte.leilaodeseminovos.com.br/current/tmp/.sock", :backlog => 64
listen 8045, :tcp_nopush => true

timeout 30

pid "/home/ubuntu/www/suporte.leilaodeseminovos.com.br/shared/pids/unicorn.pid"

stderr_path "/home/ubuntu/www/suporte.leilaodeseminovos.com.br/shared/log/unicorn.stderr.log"
stdout_path "/home/ubuntu/www/suporte.leilaodeseminovos.com.br/shared/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
