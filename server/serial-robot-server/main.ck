// main.ck
// CalArts Music Tech // MTIID4LIFE

// give it some time to breathe
HandshakeID talk;
0.5::second => now;

// initial handshake between ChucK and Arduinos
talk.talk.init();
1::second => now;

<<< "Handshakes done" >>>;
// bring on the bots
Brigid1 b1;
Brigid2 b2;
Brigid3 b3;
Brigid4 b4;
Brigid5 b5;
Brigid6 b6;
Brigid7 b7;
Brigid8 b8;
//Brigid9 b9;
//Brigid10 b10;

Theia1 t1;
//Theia2 t2;
//Theia3 t3;

//Hermes1 hermes1;

while (true) {
    1::second => now;
}
