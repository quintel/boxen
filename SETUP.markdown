# Set up a new user

### Prerequisites for your Mac

* X code installed (Full version)
* Download Command Line Tools from Preferences in XCode
* You should have **Git** (download and install from [here](http://git-scm.com/download/mac), 
  if the computer says 'no', you might need to change your Security settings.

### Steps

1. Get a [Github](http://github.com) account
2. Make sure that user is member of the [Quintel organization](https://github.com/organizations/quintel).
3. Run the following commands:
    
```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone https://github.com/quintel/boxen /opt/boxen/repo
cd /opt/boxen/repo
git remote rm origin
git remote add origin <the location of my new git repository>
git push -u origin master
```
