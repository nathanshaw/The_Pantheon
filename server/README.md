divine-console-robot-server
=====
This repo is built off of the hard work of
Ness Morris, Bruce Lott, Ajay Kapur, Owen Vallis, Dimitri Diakopoulos and many others
from the MTIID department @ CalArts

To connect using ChucK via OSC:

    OscOut oout:
    // fibonacci port number
    ("chuckServer.local",11235) => oout.dest;

Then to send to a robot: 
    oout.start("/Address")
    oout.add(note)
    oout.add(velocity)
    oout.send();

To connect using MIDI, check out the [midi-robot-client](https://github.com/MTIID/midi-robot-client) repo.
