Time startup of different units

The code in this repo helps with timing and logging the startup of a linux distro. Type `make` to build and install the timing utility. This installs a `/usr/local/bin/startup-log` utility, which takes one argument and logs the current tsc value and the argument to `/var/startup-log`.

So you want to add the logging of *every* systemd service in the system as `StartExecPost=` argument. If you are brave run `make enable`. This will most probably destroy your system for good, and make your toaster explode. Better take a snapshot of your vm (you are running this in a VM, right?) before. But if you are lucky, the startup of every service will be timestamped and logged. Similarly `make disable` will remove the logging from every service file in your system (or maybe just trash all of them).
