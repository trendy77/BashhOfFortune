
#identification saved in /home/trendypublishingau/.ssh/google_compute_engine.
#public key has been saved in /home/trendypublishingau/.ssh/google_compute_engine.pub.
#key fingerprint is: SHA256:3jci5xEiW8uR/yWyXYlpf/IjISj0RPldMotho3mz61E trendypublishingau@kali-us-east1



#Host ubuntu-kali-us-1.us-east1-b.kali-via-cloud
 #   HostName 35.196.239.255
  #  IdentityFile C:\Users\\trend\.ssh\\google_compute_engine
##### CREATE AN SSH TUNNEL TO CLOUD INSTANCE....
function newTunnel(){
gcloud compute instances create --zone us-west1-a tunnel

# Start SSH tunnel on local port 5000, that connects to a GCE instance on its SSH port 22
gcloud compute ssh --zone us-west1-a tunnel -- -f -N -p 22 -D localhost:5000

#	THEN
ssh -N -L 5000:127.0.0.1:22 -i KEYFILE.pem bitnami@SERVER-IP
}

# use one of the following to check your IP location....
curl https://api.ip2geo.pl/json/
curl --proxy socks5://localhost:5000 https://api.ip2geo.pl/json/

function killIt(){
	#	 ONCE YOU'RE FINISHED WITH IT....
	# clean-up
gcloud compute instances delete --zone us-west1-a tunnel
}