// Hermes10.ck
// Nathan Villicana-Shaw
// CalArts Music Tech // MTIID4LIFE

public class Hermes10 extends SerialBot {
    // Brigid is 1-10
    // Homados is 10-20
    // Hermes are 21-30

    // MIDI notes
    [60,61,62,63,64,65] @=> int scl[];

    rescale(scl);

    30 => int ID;
    "/hermes10" => string address;
    IDCheck(ID, address) => int check;
    if (check >= 0) {
        spork ~ oscrecv(check, address);
    }
}
