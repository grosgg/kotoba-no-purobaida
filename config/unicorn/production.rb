app_path = "/home/deploy/kotoba-no-purobaida"
current_path = "#{app_path}/current"
shared_path = "#{app_path}/shared"

worker_processes 1

listen "#{shared_path}/tmp/sockets/unicorn.sock", :backlog => 64

timeout 60

pid "#{shared_path}/tmp/pids/unicorn.pid"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end