# Course Outline

This is the proposal that is being presented to Packet Pushers for creating a
video/screen cast course about using Ansible for Network Engineers. Each video
will consist of lessons to complete with real life examples to be leveraged.  

I will be setting up an EVE-NG or GNS3 lab to accomplish this. In the end I wish
to have some linux servers in the mix and am working to determine the best
methodology to do so.  

There will be a DC location with a couple of NXOS switches to show working with
various Cisco platforms. I will also build 2 remote sites that will have a linux
host at each. With this setup I can also work to add an ASA in on a future
lesson to show the usage with ASA firewalls.  
 
## Lesson Plan

### Ansible Fundamentals

This are pieces about Ansible that are good to get started, not pertinent to
just network engineers. Applicable across all parts.

- Playbook Structure
    - Tasks
    - Plays
    - Playbooks
    - Modules
    - Parameters
    - Documentation
- Debug
- Special variables
    - ansible_user
    - ansible_password
    - ansible_become_pass
- Review the Github page
    - Report issues
    - Look at the code if wishing to look into yourself

### Data Gathering

This should be the start of any Network Automation journey to getting the feet
wet. Gathering information off of devices and working with that information.  

Building off the first Lesson I will examine how to read output from devices.
This will include several debugs and how to look into the information gathered.
The complex piece will be using Regex to gather data out of a show command
issued to a single device. Introduction to Regex101.com.

### Idempotent Configuration

This is going to be a short but important lesson. This will show that using
a configuration with `ip access-l` is different than `ip access-list` and
similarly `int gig0/0` vs `interface GigabitEthernet0/0`; `no shut` &
`no shutdown` differ with automation and the need for completing the whole line.  

This will show several examples of idempotent changes. 

### Working with Ansible vars folders

This will be a deeper dive on inheritance. Here we will tell the story about
setting up NTP servers for various device types and locations.

- Review of all.yml file
- Review group_vars folder and host_vars

### Advanced Fundamentals

This was a big hurdle for me. Once I got the Ansible-Vault portion figured out I
was off to the races with the Ansible network automation journey. I moved the
various include items into this section as that is how I include the variables
needed.

- Ansible Vault
- include items
    - vars
    - task files
    - with together
- Loops

### Jinja Templates

This section is a good go to section for leveraging Ansible. I have found it
much easier to build out configurations from Jinja templates leveraging Ansible
over that of Python. Python was a challenge for me to getting going with
templates after how easy it was to do with Ansible

- Generate a configuration template for interfaces
- Loop over the interfaces (built off of the first lesson)
- Generate interface configurations 

### Working with Netbox and other APIs

This will be an API focused session. I will be demonstrating Netbox environments
and how to get information out of the API, and into the API using Ansible
modules.

- Ansible URI Module
    - GET
    - POST
    - PATCH
    - DELETE
- Explore the new Ansible Netbox module

### Custom Filters

This was a scary topic originally, but is something that extends the
capabilities of Ansible significantly. Will explore writing your own custom
Python filter at a basic level.

### Putting everything together

Here is where I am going to put the pieces together. I'll take a multi-play
playbook down the path of looking at QoS on a setup. Starting with no QoS and
having the Linux servers at the branch offices pulling data off of a web server
at the DC. The traffic will start off being shown not being queued anywhere.
Then changes will be made to the edge routers (or maybe even to the switches,
but I am not that good at LAN queuing, maybe I'll take a look at the Ignition
lesson there). This will then show the traffic will be moved into a queue and
show the output of the service policies.

### Additional Module - Gathering Data On Meraki Networks

- Using Ansible to gather data from Meraki network environments, leveraging
the Meraki specific modules and alternatives with the URI module.