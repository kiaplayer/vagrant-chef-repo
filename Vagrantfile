Vagrant.configure("2") do |config|

    boxes = {
        "demo" => "10.2.2.10",
    }

    use_64bit_boxes = true

    boxes.each do |box_name, box_ip|
        config.vm.define box_name do |config|
            if use_64bit_boxes
                config.vm.box = "ubuntu-server-12.04.3-64bit"
                config.vm.box_url = "https://www.dropbox.com/s/19ealkh6pqwppaz/ubuntu-server-12.04.3-64bit.box?dl=1"
            else
                config.vm.box = "ubuntu-server-12.04.3-32bit"
                config.vm.box_url = "https://www.dropbox.com/s/q57n6n0azzpi9fa/ubuntu-server-12.04.3-32bit.box?dl=1"
            end
            config.vm.network :private_network, ip: box_ip
            config.vm.provision "chef_solo" do |chef|
                chef.log_level = "info"
                chef.environments_path = "environments"
                chef.environment = "development"
                chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
                chef.roles_path = "roles"
                chef.data_bags_path = "data_bags"
                chef.json.merge!(JSON.parse(IO.read("nodes/#{box_ip}.json")))
            end
        end
    end

end
