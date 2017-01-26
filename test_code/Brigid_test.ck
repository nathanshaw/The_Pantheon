// Brigid_test.ck
OscOut out;

// ("chuckServer.local", 50000) => out.dest;
("localhost", 50000) => out.dest;
fun void bSend(int note, int vel){
    out.start("/brigid1");
    out.add(note);
    out.add(vel);
    out.send();
}

fun void bPlay(int note, int vel, int msDelay){
    spork ~ bSend(note, vel);
    msDelay::ms => now;
    spork ~ bSend(note, 0);
}

while(true) {
    for (1000 => int fact; fact > 500; fact - 20 => fact) {
    for(60 => int i; i < 66; i++){
        100 => int vel;
        //fact => int vel;
        500 => int msDur;
        <<< "Brigid 1 :", i, " - ", vel >>>;
        spork ~ bPlay(i, vel, msDur);
        500::ms => now;
    }
    1500::ms => now;
}
}

