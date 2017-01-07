OscOut out;
("chuckServer.local", 50000) => out.dest;

// Trimpspin MIDI notes
[60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
 70, 71, 72, 73, 74, 75, 76, 77, 78, 79] @=> int tsScl[];

fun void tsSend(int note, int vel){
    out.start("/trimpspin");
    out.add(note);
    out.add(vel);
    out.send();
}

fun void tsPlay(int note, int vel, int msDelay){
    tsSend(note, vel);
    msDelay::ms => now;
    tsSend(note, 0);
}

// Trimpbeat MIDI notes
[60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
 70, 71, 72, 73, 74, 75, 76, 77, 78, 79] @=> int tbScl[];

fun void tbSend(int note, int vel){
    out.start("/trimpbeat");
    out.add(note);
    out.add(vel);
    out.send();
}

fun void tbPlay(int note, int vel, int msDelay){
    tbSend(note, vel);
    msDelay::ms => now;
    tbSend(note, 0);
}

while(true) {
    // Trimpspin test
    // They are not really 'tuned' but the
    // lower the note the lower pitch 
    // 
    
    for(0 => int i; i<tsScl.size(); i++){
        100 => int vel;
        <<< "tscScl:", tsScl[i], " - ", vel >>>;
        spork ~ tsPlay(tsScl[i], vel, 1000);
        200::ms => now;
    }
    
    // Trimpbeat test
    // 60 (0)  is the backboard beater
    // 79 (19) is the woodblock beater
    // 61 - 68 are notes 
    
    // C, G, B, C, F#, G, B, C, E, F, G,  B,  C,  E,  G,  C,  G,  C
    // 1, 2, 3, 4, 5,  6, 7, 8, 9, 10 11, 12, 13, 14, 15, 16, 17, 18
    for(0 => int i; i<tbScl.size(); i++){
        100 => int vel;
        <<< "tbScl:", tbScl[i], " - ", vel >>>;
        tbPlay(tbScl[i], vel, 100);
    } 
}

