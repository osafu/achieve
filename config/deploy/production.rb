server '52.198.62.164', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/osafune/.ssh/id_rsa'
