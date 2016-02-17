namespace :unicorn do
  %w(start stop restart reload force-stop shutdown-workers increment-worker decrement-worker logrotate).each do |action|
    action_name = action.tr('-', ' ').capitalize
    desc "#{action_name} Unicorn!"
    task action.to_sym do
      queue %(echo "-----> #{action_name} Unicorn!")
      queue echo_cmd "/etc/init.d/unicorn #{action}"
    end
  end
end

