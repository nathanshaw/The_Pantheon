/* 
homados_test.ck
*/

// StringThing.ck
OscOut out;

// ("chuckServer.local", 50000) => out.dest;
("localhost", 50000) => out.dest;
fun void hSend1(int note, int vel){
    out.start("/homados1");
    out.add(note);
    out.add(vel);
    out.send();
}

fun void hPlay1(int note, int vel, int msDelay){
    spork ~ hSend1(note, vel);
    msDelay::ms => now;
    spork ~ hSend1(note, 0);
}

while(true) {
    for (1000 => int fact; fact > 500; fact - 20 => fact) {
        for(60 => int i; i < 75; i++){
            Math.random2(10, 1000) => int vel;
            //fact => int vel;
            500 => int msDur;
            <<< "Homados :", i, " - ", vel >>>;
            spork ~ hPlay1(i, vel, msDur);
            msDur::ms => now;
        }
    }
}

