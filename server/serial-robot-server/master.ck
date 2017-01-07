// master.ck
// based on code written by Eric Heep
// CalArts Music Tech // MTIID4LIFE

// communication classes
Machine.add(me.dir() + "/Handshake.ck");
Machine.add(me.dir() + "/HandshakeID.ck");
Machine.add(me.dir() + "/SerialBot.ck");
Machine.add(me.dir() + "/SensorBot.ck");

// add robots here
Machine.add(me.dir() + "/Brigid1.ck");
Machine.add(me.dir() + "/Brigid2.ck");
Machine.add(me.dir() + "/Brigid3.ck");
Machine.add(me.dir() + "/Brigid4.ck");
Machine.add(me.dir() + "/Brigid5.ck");
Machine.add(me.dir() + "/Brigid6.ck");
Machine.add(me.dir() + "/Brigid7.ck");
Machine.add(me.dir() + "/Brigid8.ck");
Machine.add(me.dir() + "/Brigid9.ck");
Machine.add(me.dir() + "/Brigid10.ck");
//Machine.add(me.dir() + "/Homados1.ck");
//Machine.add(me.dir() + "/Homados2.ck");
//Machine.add(me.dir() + "/Hermes1.ck");
//Machine.add(me.dir() + "/Hermes2.ck");
//Machine.add(me.dir() + "/Hermes3.ck");
Machine.add(me.dir() + "/Theia1.ck");
//Machine.add(me.dir() + "/Theia2.ck");
//Machine.add(me.dir() + "/Theia3.ck");
//Machine.add(me.dir() + "/SnapperBots.ck");

// main program
Machine.add(me.dir() + "/main.ck");
7.0::second => now;
<<< "-", "" >>>;
