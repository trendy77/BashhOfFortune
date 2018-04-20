DynamicForward = yes     # Specifies that a TCP port on the local machine be forwarded over the secure channel, and the application protocol is then used to determine where to connect to from the remote machine.
ExitOnForwardFailure = no       #Specifies whether ssh should terminate the connection if it cannot set up all requested dynamic, tunnel, local, and remote port forwardings.
ForwardAgent = yes    # Specifies whether the connection to the authentication agent will be forwarded to the remote machine.
ForwardX11 = yes    #Specifies whether X11 connections will be automatically redirected over the secure channel and DISPLAY set.
ForwardX11Trusted = yes       #If this option is set to yes, remote X11 clients will have full access to the original X11 display.
BatchMode = yes     # no pass on key auth needed
BindAddress = 10.0.77.78             # Specifies to use the specified address on the local machine as the source address of the connection.
Compression = yes
IdentitiesOnly = no    # Specifies that ssh should only use the identity keys configured in the ssh_config files, even if ssh-agent offers more identities.
HashKnownHosts = no     # Indicates that ssh should hash host names and addresses when they are added to ~/.ssh/known_hosts. These hashed names may be used normally by ssh and sshd, but they do not reveal identifying information should the file's contents be disclosed.
StrictHostKeyChecking = no   #Specifies if ssh should never automatically add host keys to the ~/.ssh/known_hosts file, and refuses to connect to hosts whose host key has changed.
TCPKeepAlive = yes    # Specifies whether to send TCP keepalives to the other side. These operate on the level of the TCP protocol. Sending keepalives helps properly close the socket when the network or server goes down. On the other hand, without it, the connection may stay alive and any windows open, even if the network is down for a while.
Tunnel = yes              # If yes, request tun device forwarding between the client and the server. This used for implementing a VPN over SSH.
PubkeyAuthentication = yes    #  Specifies whether to try public key authentication using SSH keys. Valid values are yes and no. When public key authentication is used in a production environment, a proper SSH key management system should also be put in place.
# AllowTCPForwarding = yes
GatewayPorts = yes        #  Specifies whether remote hosts are allowed to connect to local forwarded ports.




CertificateFile     # EITHER THIS OR WITH SSH-AGENT

# GlobalKnownHostsFile      # Specifies a file to use for the global host key database instead of /etc/ssh/ssh_known_hosts.
# GSSAPIAuthentication    #Specifies whether user authentication based on GSSAPI is allowed. GSSAPI is typically used for Kerberos authentication, e.g., with Active Directory.
# GSSAPIKeyExchange       #Specifies whether key exchange based on GSSAPI may be used.
# GSSAPIClientIdentity      # If set, specifies the GSSAPI client identity that ssh should use when connecting to the server.
# GSSAPIDelegateCredentials     # orward (delegate) credentials to the server.
# GSSAPIRenewalForcesRekey    # If set to yes then renewal of the client's GSSAPI credentials will force the rekeying of the ssh connection.
# GSSAPITrustDns        # Set to yes to indicate that the DNS is trusted to securely canonicalize the name of the host being connected to. If no, the hostname entered on the command line will be passed untouched to the GSSAPI library.
# ControlMaster = yes   # Enables the sharing of multiple sessions over a single network connection.
# ControlPath     # Specify the path to the control socket used for connection sharing as described in the ControlMaster section above or the string none to disable connection sharing.
HostbasedAuthentication   # Specifies whether to try rhosts based authentication with public key authentication, using the .rhosts or .shosts files in the user's home directory and /etc/hosts.equiv and /etc/shosts.equiv in global configuration.

# HostKeyAlgorithms   # Specifies the protocol version 2 host key algorithms that the client wants to use in order of preference. The following values are supported in OpenSSH 6.7: ssh-ed25519 ssh-ed25519-cert-v01@openssh.com ssh-rsa ssh-dss ecdsa-sha2-nistp256 ecdsa-sha2-nistp384 ecdsa-sha2-nistp521 ssh-rsa-cert-v01@openssh.com ssh-dss-cert-v01@openssh.com ecdsa-sha2-nistp256-cert-v01@openssh.com ecdsa-sha2-nistp384-cert-v01@openssh.com ecdsa-sha2-nistp521-cert-v01@openssh.com ssh-rsa-cert-v00@openssh.com ssh-dss-cert-v00@openssh.com
# HostKeyAlias    #Specifies an alias that should be used instead of the real host name when looking up or saving the host key in the host key database files.
# HostName    # Specifies the real host name to log into. This can be used to specify nicknames or abbreviations for hosts. The default is the name given on the command line. Numeric IP addresses are also permitted (both on the command line and in HostName specifications).
IdentityFile    # Specifies a file from which the user's identity key is read when using public key authentication. The default for protocol version 1 is ~/.ssh/identity; and ~/.ssh/id_rsa or ~/.ssh/id_dsa for protocol version 2.
KbdInteractiveAuthentication    #Specifies whether to use keyboard-interactive authentication. This is a common method for password authentication, one-time passwords, and multi-factor authentication.
KbdInteractiveDevices   #Specifies the list of methods to use in keyboard-interactive authentication.
# LocalCommand        # Specifies a command to execute on the local machine after successfully connecting to the server.
# LocalForward        # Specifies that a TCP port on the local machine be forwarded over the secure channel to the specified host and port from the remote machine. The first argument must be [bind_address:]port and the second argument must be host:port.
# MACs      #Specifies the MAC (message authentication code) algorithms in order of preference.
# The ssh -Q mac command can be used to query supported MAC algorithms. The following list is supported in OpenSSH 6.7: hmac-sha1 hmac-sha1-96 hmac-sha2-256 hmac-sha2-512 hmac-md5 hmac-md5-96 hmac-ripemd160 hmac-ripemd160@openssh.com umac-64@openssh.com umac-128@openssh.com hmac-sha1-etm@openssh.com hmac-sha1-96-etm@openssh.com hmac-sha2-256-etm@openssh.com hmac-sha2-512-etm@openssh.com hmac-md5-etm@openssh.com hmac-md5-96-etm@openssh.com hmac-ripemd160-etm@openssh.com umac-64-etm@openssh.com umac-128-etm@openssh.com NoHostAuthenticationForLocalhost
PreferredAuthentications    # Specifies the order in which the client should try protocol 2 authentication methods.
Protocol      # Specifies the protocol versions in order of preference. The possible values are '1' and '2'. Multiple versions must be comma-separated. Use of protocol version 1 is NOT RECOMMENDED for security reasons. There is reason to believe it may be susceptible to man-in-the-middle attacks.
ProxyCommand      #Specifies the command to use to connect to the server. The SSH client communicates with the proxy command using its standard input and standard output, and the proxy command should pass the communication to an SSH server.
SendEnv   # Specifies what environment variables should be sent to the server.
ServerAliveCountMax   #Sets the number of keepalive messages that may be sent by the client without the client receiving any messages back from the server. When this threshold is reached the client will terminate the session.
ServerAliveInterval   # Specifies interval for sending keepalive messages to the server. The messages are sent through the encrypted channel, and serve to detect if the server has crashed or the network has gone down.
SmartcardDevice       # Specifies which smartcard device to use.
UserKnownHostsFile    Specifies a file to use for per-user known host key database instead of the default ~/.ssh/known_hosts.
VerifyHostKeyDNS    # Specifies whether to verify the remote key using DNS and SSHFP resource records.
VisualHostKey     # Specifies whether an ASCII art representation of the remote host key fingerprint is printed in addition to the hex fingerprint string at login and for unknown host keys.




TunnelDevice              # Specifies the tun devices to open on the client (local_tun) and the server (remote_tun).
UsePrivilegedPort = yes       # Specifies whether or not to use a privileged port for outgoing connections. The client must run as root to use a privileged port. A privileged port is required for host-based authentication.
RemoteForward = [10.0.77.78:]22 host:port     # Specifies that a TCP port on the remote machine be forwarded over the secure channel to the specified host and port from the local machine. The first argument must be: [bind_address:]port and the second argument must be host:port. SSH tunneling is a powerful tool, but see security considerations on SSH tunneling.







##ssh-keygen and ssh-copy-id.

Each SSH key pair includes two keys:
--A public key that is copied to the SSH server(s). Anyone with a copy of the public key can encrypt data which can then only be read by the person who holds the corresponding private key. 
Once an SSH server receives a public key from a user and considers the key trustworthy, the server marks the key as authorized in its authorized_keys file. Such keys are called authorized keys.
--A private key that remains (only) with the user. The possession of this key is proof of the user's identity. Only a user in possession of a private key that corresponds to the public key at the server will be able to authenticate successfully. The private keys need to be stored and handled carefully, and no copies of the private key should be distributed. The private keys used for user authentication are called identity keys.

SETTING UP PUBLIC KEY AUTHENTICATION FOR SSH
Key pair is created (typically by the user). This is typically done with ssh-keygen.
Private key stays with the user (and only there), while the public key is sent to the server. Typically with the ssh-copy-id utility.
Server stores the public key (and marks it as authorized).
Server will now allow access to anyone who can prove they have the corresponding private key.

When a private key is needed the user is asked to supply the passphrase so that the private key can be decrypted. The handling of passphrases can be automated with an SSH agent.
In most automated use cases (scripts, applications, etc) the private keys are not protected and careful planning and key management practises need to be excercised to remain secure and compliant with regulatory mandates.

FROM CHAOS TO ORDER - SSH KEY MANAGEMENT
In environments where users are free to self-provision authentication keys it is common that over the years the numbers of provisioned and deployed keys grow very large. Since there is no way to find out who owns or has originally provisioned a given public key found on a server, and since these keys never expire, the true state of access control in large unmanaged environments can be very unclear or outright chaotic.
Managing and controlling access to servers and other IT infrastructure is a legal requirement for any enterprise that operates on regulated markets such as finance, energy, healthcare, or commerce. These enterprises need to employ solutions for SSH key management to control the access granted by SSH keys.