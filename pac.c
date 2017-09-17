#include <stdio.h>
#include "irslinger1.h"

int main(int argc, char *argv[])
{
	uint32_t outPin = 22;            // The Broadcom pin number the signal will be sent on
	int frequency = 38000;           // The frequency of the IR signal in Hz
	double dutyCycle = 0.5;          // The duty cycle of the IR signal. 0.5 means for every cycle,
	                                 // the LED will turn on for half the cycle time, and off the other half
	int leadingPulseDuration = 3500; // The duration of the beginning pulse in microseconds
	int leadingGapDuration = 1690;   // The duration of the gap in microseconds after the leading pulse
	int onePulse = 475;              // The duration of a pulse in microseconds when sending a logical 1
	int zeroPulse = 475;             // The duration of a pulse in microseconds when sending a logical 0
	int oneGap = 1260;               // The duration of the gap in microseconds when sending a logical 1
	int zeroGap = 400;               // The duration of the gap in microseconds when sending a logical 0
	int trailingGapDuration = 9900;// The duration of the pulse in microseconds for trailing pusle

	if (argc < 2) {
		printf("Incorrect number of arguments.\n");
		return(1);
	}

	int result = irSling(
		outPin,
		frequency,
		dutyCycle,
		leadingPulseDuration,
		leadingGapDuration,
		onePulse,
		zeroPulse,
		oneGap,
		zeroGap,
		trailingGapDuration,
		argv[1]);

//		"01000001101101100101100010100111");
	
	return result;
}
