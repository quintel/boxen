# Set up a new user

### Prerequisites

* A Mac
* X code installed

### Steps

1. Get a [Github](http://github.com) account
2. Make sure that user is member of the [Quintel organization](https://github.com/organizations/quintel).
3. Run the following commands:
    
```
    sudo mkdir -p /opt/boxen
    sudo chown ${USER}:staff /opt/boxen
    git clone https://github.com/boxen/our-boxen /opt/boxen/repo
    cd /opt/boxen/repo
    git remote rm origin
    git remote add origin <the location of my new git repository>
    git push -u origin master
```
