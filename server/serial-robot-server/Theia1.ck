// Theia.ck
// Nathan Villicana-Shaw

public class Theia1 extends SensorBot{
    // Brigid is 1-10 and 31-40
    // Homados is 10-20
    // Hermes is 21-30
    // Theia is 51-60

    // MIDI notes
    [0,1,2,3,4,5] @=> int scl[];

    rescale(scl);

    51 => int ID;
    "/theia1" => string address;
    IDCheck(ID, address) => int check;
    // if a message comes in to the bot, return the distances
    int distance;
    if (check >= 0) {
        spork ~ oscrecv(check, address);
    }
}
