// Brigid.ck
// Nathan Villicana-Shaw
// CalArts Music Tech // MTIID4LIFE

public class Brigid9 extends SerialBot {
    // Brigid is 1-10
    // Homados is 11-20

    // MIDI notes
    [60,61,62,63,64,65] @=> int scl[];

    rescale(scl);

    9 => int ID;
    "/brigid9" => string address;
    IDCheck(ID, address) => int check;
    if (check >= 0) {
        spork ~ oscrecv(check, address);
    }
}
