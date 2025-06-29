**IMPORTANT:** This is under active development and is not ready to use yet. Please be patient - I expect to have a stable release ready in July 2025.

[JuicePassProxy](https://github.com/JuiceRescue/juicepassproxy) as a Home Assistant add-on.

This project is **NOT** affiliated with JuicePassProxy or the JuiceRescue Organization - this is an unofficial add-on.

# How to Use

To start, read [the JuicePassProxy README](https://github.com/JuiceRescue/juicepassproxy) to learn more about the project and what it's capable of. JuicePassProxy provides three different modes of operation - while the UDPC mode is easiest to set up, it should only be used as a last resort because it's significantly less reliable than the other options. It is strongly recommended that you use either DNS spoofing or NAT since those modes are more reliable.

Most JuicePassProxy options are exposed in this add-on's configuration page. If you need more information about what an option does, please check [the JuicePassProxy README](https://github.com/JuiceRescue/juicepassproxy).

If you are using DNS spoofing or NAT to redirect traffic then the following configuration is recommended:

* Ignore EnelX: True
* Update UDPC: False
* Juicebox ID: The serial number of your Juicebox. If you don't know the serial number you can telnet into your Juicebox on port 2000 and run the command `get email.name_address` to retrieve it. Yes, really - `get email.name_address` is how you get the serial number.

No matter which mode you use, you will also need to configure the MQTT options so that JuicePassProxy can send data to Home Assistant.

# Setting up NAT redirection

Instructions for setting up NAT redirection for different router platforms are below. Feel free to send PRs to add instructions for your router platform.

**All instructions below use 192.168.1.111 as the IP of the JuiceBox and 192.168.1.222 as the IP of Home Assistant (where this add-on is running). You will need to change these to match your actual JuiceBox and Home Assistant IPs.**

## OPNSense

* Go to Firewall > NAT > Port Forward, and create a new rule as follows:
  ![port forward](https://raw.githubusercontent.com/jaydeethree/hassio-juicepassproxy/refs/heads/main/images/opnsense1.png)
* Now go to Firewall > NAT > Outbound, and create a new rule as follows:
  ![outbound](https://raw.githubusercontent.com/jaydeethree/hassio-juicepassproxy/refs/heads/main/images/opnsense2.png)

Don't forget to apply the changes!