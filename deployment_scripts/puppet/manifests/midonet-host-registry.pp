$fuel_settings = parseyaml($astute_settings_yaml)
$api_ip = $::fuel_settings['management_vip']

$tz_type = $::fuel_settings['midonet']['tunnel_type']
$username = $fuel_settings['access']['user']
$password = $fuel_settings['access']['password']
$tenant_name = $fuel_settings['access']['tenant']


midonet_host_registry {$::fqdn:
  midonet_api_url     => "http://${api_ip}:8081",
  username            => $username,
  password            => $password,
  tenant_name         => $tenant_name,
  underlay_ip_address => $::ipaddress_br_mesh,
  tunnelzone_type     => $tz_type,
  tunnelzone_name     => 'tzonefuel',
  ensure              => present
}
