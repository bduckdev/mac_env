#!/usr/bin/env python3

import subprocess
import sys
import time


def metronome(bpm):
    pauze = 60 / bpm

    while True:
        time.sleep(pauze)
        subprocess.Popen(["ogg123", "/usr/share/sounds/Pop/stereo/action/bell.oga"])


def main():
    try:
        bpm = int(sys.argv[1])
        metronome(bpm)
    except KeyboardInterrupt:
        print("Goodbye!")

    except:
        print("you must enter a valid bpm")


main()
