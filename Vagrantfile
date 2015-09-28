nodes = [
  { :hostname => 'nimbus', :ip => '192.168.1.100',
    :box => 'precise32', :ram => 512 },
  { :hostname => 'node1',  :ip => '192.168.1.101',
    :box => 'precise32', :ram => 512 },
  { :hostname => 'node2',  :ip => '192.168.1.102',
    :box => 'precise32', :ram => 512 }
]

API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|
  nodes.each do |node|
    config.vm.define node[:hostname] do |nodeconfig|
      nodeconfig.vm.box = node[:box]
      nodeconfig.vm.hostname = node[:hostname] + ".local"
      nodeconfig.vm.network :public_network, ip: node[:ip]

      memory = node[:ram] ? node[:ram] : 256;
      nodeconfig.vm.provider :virtualbox do |vb|
        vb.customize [
          "modifyvm", :id,
          "--cpuexecutioncap", "75",
          "--memory", memory.to_s,
        ]
      end
    end
    nodeconfig.vm.provision "shell", path: "provision.sh"
    config.vm.provision "file", source: "storm.yaml",
      destination: "/opt/storm/apache-storm-0.9.5/conf/storm.yaml"
  end
end
