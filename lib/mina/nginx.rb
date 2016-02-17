namespace :nginx do
  %w(restart).each do |action|
    action_name = action.capitalize
    desc "#{action_name} Nginx"
    task action.to_sym do
      queue %(echo "-----> #{action_name} Nginx")
      queue echo_cmd "sudo service nginx #{action}"
    end
  end
end

