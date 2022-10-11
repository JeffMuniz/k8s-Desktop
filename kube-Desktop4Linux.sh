
#Download the latest release with the command: - & Validate the kubectl binary against the checksum file - If valid, the output is: OK - If the check fails, sha256 exits with nonzero status and prints output similar to:kubectl: FAILED sha256sum: WARNING: 1 computed checksum did NOT match
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#Note: If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
kubectl version --client
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo apt-get install -y apt-transport-https
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
#Add the Kubernetes apt repository:
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
snap install kubectl --classic
kubectl version --client
#To install the latest minikube stable release on x86-64 Linux using binary download:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
#To install the latest minikube stable release on x86-64 Linux using Debian package:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
#To install the latest minikube stable release on x86-64 Linux using RPM package:
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
sudo rpm -Uvh minikube-latest.x86_64.rpm
minikube start
kubectl get pod -A
minikube kubectl -- get pod -A
#You can also make your life easier by adding the following to your shell config:
alias kubectl="minikube kubectl --"
#Initially, some services such as the storage-provisioner, may not yet be in a Running state. This is a normal condition during cluster bring-up, and will resolve itself momentarily. For additional insight into your cluster state, minikube bundles the Kubernetes Dashboard, allowing you to get easily acclimated to your new environment:
minikube dashboard
#Create a sample deployment and expose it on port 80:
kubectl create deployment hello-minikube --image=docker.io/nginx:1.23
kubectl expose deployment hello-minikube --type=NodePort --port=80
#It may take a moment, but your deployment will soon show up when you run:
kubectl get services hello-minikube
#The easiest way to access this service is to let minikube launch a web browser for you:
minikube service hello-minikube
#Alternatively, use kubectl to forward the port:
kubectl port-forward service/hello-minikube 7080:80
#Tada! Your application is now available at http://localhost:7080/.
#You should be able to see the request metadata from nginx such as the CLIENT VALUES, SERVER VALUES, HEADERS RECEIVED and the BODY in the application output. Try changing the path of the request and observe the changes in the CLIENT VALUES. Similarly, you can do a POST request to the same and observe the body show up in BODY section of the output.
#LoadBalancer deployments
#To access a LoadBalancer deployment, use the “minikube tunnel” command. Here is an example deployment:
kubectl create deployment balanced --image=docker.io/nginx:1.23
kubectl expose deployment balanced --type=LoadBalancer --port=80
#In another window, start the tunnel to create a routable IP for the ‘balanced’ deployment:
nohup minikube tunnel &&
#To find the routable IP, run this command and examine the EXTERNAL-IP column:
kubectl get services balanced
#our deployment is now available at <EXTERNAL-IP>:80
kubectl cluster-info