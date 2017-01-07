// Theia3.ck
// Nathan Villicana-Shaw

public class Theia3 extends SensorBot{
    // Brigid is 1-10 and 31-40
    // Homados is 10-20
    // Hermes is 21-30
    // Theia is 51-60

    // MIDI notes
    [0,1,2,3,4,5] @=> int scl[];

    rescale(scl);

    53 => int ID;
    "/theia3" => string address;
    IDCheck(ID, address) => int port;
    // <<<"theia 3 id check is : ", port>>>;
    // if a message comes in to the bot, return the distances
    if (port >= 0) {
        spork ~ oscrecv(port, address);
    }
}
