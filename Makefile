BIN=/usr/local/bin/startup-log

all: ${BIN}

rdtsc: rdtsc.c
	gcc -O2 rdtsc.c -o rdtsc

${BIN}: rdtsc
	sudo cp rdtsc ${BIN}
	sudo chown root ${BIN}
	sudo chmod +s ${BIN}

clean:
	sudo rm -f rdtsc ${BIN}

clean-log:
	sudo rm -f /var/startup-log

enable:
	sh add-logging.sh

disable:
	sh remove-logging.sh
