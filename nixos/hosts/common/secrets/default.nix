{
  # Network passwords
  network-passwords = {
    file = ./network-passwords.age;
    owner = "root";
    group = "root";
  };

  # OpenVPN credentials, certs, and keys 
  openvpn-auth = {
    file = ./openvpn-auth.age;
    owner = "root";
    group = "root";
  };

  openvpn-ca = {
    file = ./openvpn-ca.age;
    owner = "root";
    group = "root";
  };

  openvpn-tls = {
    file = ./openvpn-tls.age;
    owner = "root";
    group = "root";
  };

  # User passwords
  noahg-password = {
    file = ./noahg-password.age;
    owner = "root";
    group = "root";
  };
}
