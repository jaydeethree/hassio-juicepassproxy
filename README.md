[JuicePassProxy](https://github.com/JuiceRescue/juicepassproxy) as a Home Assistant ~~add-on~~ app.

This project is **NOT** affiliated with JuicePassProxy or the JuiceRescue Organization - this is an unofficial ~~add-on~~ app.

-------------------

# AI Disclosure

Starting in October 2026 I will begin using AI to help me maintain my open-source projects. I know a lot of people have strong feelings about AI so I want to be open about this decision and why I made it.

Over the last few years I've watched AI models mature significantly - while early models were mostly just slop generators, the current models are genuinely very good. I've spent decades working in tech and building up my skills, but at this point the current models are often better at my job than I am (not hyperbole - I'm serious). I have a lot of feelings about the fact that a skillset I've spent so much time on is rapidly losing its value, but this is reality now.

I've been using AI in my job for awhile and have found that while human oversight is still important, the current models can handle most of the tedious work and then I can make adjustments as necessary. I've also found it difficult to keep up with my open-source projects due to other life demands (parenting, my job, and so much more) and AI can help take some of the load off of me.

To be very clear: **any AI-generated code that gets committed to my open-source projects will be thoroughly reviewed by me, a human.** I'm not vibe-coding or letting AIs run wild in my repositories, I'm using AI as a tool to help me work more efficiently. If you disagree with this you are always welcome to fork my projects and build non-AI versions of them.

Also for what it's worth: 100% of this disclosure was written by a human without any AI involvement :)

-------------------

# Installing the app

You will need to add this repository to Home Assistant to install this app. Here's how to do that:

* Go to Settings > Apps > Install App in Home Assistant
* Open the menu (three dots in the upper-right) and choose "Repositories"
* Enter `https://github.com/jaydeethree/hassio-juicepassproxy` into the text box and click the Add button
* Close the "Repositories" window and install the JuicePassProxy app.

# Using the app

To start, read [the JuicePassProxy README](https://github.com/JuiceRescue/juicepassproxy) to learn more about the project and what it's capable of. JuicePassProxy provides three different modes of operation - while the UDPC mode is easiest to set up, it should only be used as a last resort because it's significantly less reliable than the other options. It is strongly recommended that you use either DNS spoofing or NAT since those modes are more reliable.

Most JuicePassProxy options are exposed in this app's configuration page. If you need more information about what an option does, please check [the JuicePassProxy README](https://github.com/JuiceRescue/juicepassproxy).

If you are using DNS spoofing or NAT to redirect traffic then the following configuration is recommended:

* Ignore EnelX: True
* Update UDPC: False
* Juicebox ID: The serial number of your Juicebox. If you don't know the serial number you can telnet into your Juicebox on port 2000 and run the command `get email.name_address` to retrieve it. Yes, really - `get email.name_address` is how you get the serial number.
  * Note: Home Assistant hides this option by default, so you need to enable "Show unused optional configuration options" to see it.

No matter which mode you use, you will also need to configure the MQTT options so that JuicePassProxy can send data to Home Assistant.

# Setting up NAT redirection

Instructions for setting up NAT redirection for different router platforms are below. Feel free to send PRs to add instructions for your router platform.

**All instructions below use 192.168.2.111 as the IP of the JuiceBox and 192.168.1.222 as the IP of Home Assistant (where this app is running). You will need to change these to match your actual JuiceBox and Home Assistant IPs.**

## OPNSense

* Go to Firewall > NAT > Destination NAT and create a new rule. **"Interface" should be the network interface that your JuiceBox is connected to.** The rest of the options should be configured like this:
  ![port forward](https://raw.githubusercontent.com/jaydeethree/hassio-juicepassproxy/refs/heads/main/images/opnsense1.png)
* Now go to Firewall > NAT > Source NAT and create a new rule. **"Interface" should be the network interface that your JuiceBox is connected to.** The rest of the options should be configured like this:
  ![outbound](https://raw.githubusercontent.com/jaydeethree/hassio-juicepassproxy/refs/heads/main/images/opnsense2.png)

Don't forget to apply the changes!