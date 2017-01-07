// hub.ck
// Nathan Villicana-Shaw
// Divine Console

// wired in
OscIn in;
OscMsg msg;

50000 => in.port;
in.listenAll();

// localhost out for serial-bots 
OscOut s_out;
("localhost", 50001) => s_out.dest;

// localhost out for sensor-bots 
OscOut sensor_out;
("localhost", 50002) => sensor_out.dest;

// addresses for serial-bots
[ "/snapperbots", "/snapperbot1", "/snapperbot2", "/snapperbot3", 
 "/snapperbot4", "/snapperbot5", "/snapperbot6",
 "/hermes1", "/hermes2", "/hermes3", "hermes4",
 "/hermes5", "/hermes6", "/hermes7", "hermes8",
 "/hermes9", "/hermes10",
 "/homados1", "/homados2", "/homados3", "/homados4",
 "/homados5", "/homados6", "/homados7", "/homados8",
 "/homados9", "/homados10",
 "/brigid1", "/brigid2", "/brigid3", "/brigid4", 
 "/brigid5", "/brigid6", "/brigid7", "/brigid8", 
 "/brigid9", "/brigid10" 
 ]@=> string serials[];

 ["/theia1", "/theia2", "/theia3"
 ] @=> string sensors[];


// checks for serial-bot message
fun int serialsCheck(string m) {
    for (int i; i < serials.cap(); i++) {
        if (m == serials[i]) {
            return 1;
        }
    }
    return 0;
}

// checks for sensor-bot message
fun int sensorsCheck(string m) {
    for (int i; i < sensors.cap(); i++) {
        if (m == sensors[i]) {
            return 1;
        }
    }
    return 0;
}
// recieves wireless osc messages and 
// sends them through the local host
while (true) {
    in => now;
    while (in.recv(msg)) { 
        if (serialsCheck(msg.address)) {
            s_out.start(msg.address);
            s_out.add(msg.getInt(0));
            s_out.add(msg.getInt(1));
            s_out.send();
            //<<<"forwarding message to bots : ", msg.address, msg.getInt(0),
            //   msg.getInt(1)>>>;
        }
        if (sensorsCheck(msg.address)) {
            sensor_out.start(msg.address);
            sensor_out.add(msg.getInt(0));
            sensor_out.add(msg.getInt(1));
            sensor_out.send();
            //<<<"sending message to sensor server : ", 
            //   msg.address, msg.getInt(0), msg.getInt(1)>>>;
        }
    }
}
