public class V13Hop {
    public static Container c = new Container();
    public static boolean done = false;

    // Hvert tilvik af þessum klasa er ílát fyrir
    // eina heiltölu (int). Fleiri en einn þráður
    // getur notað ílátið án þess að spilla
    // því að ílátið sé í réttu ástandi.

    static class Producer extends Thread {

        public void run() {
            while (!done) {

                try {
                    int i;
                    for (i = 1; i <= 10000; i++) {
                        c.put(i);
                        if (done)
                            break;
                    }
                    System.out.printf("thread 1: %d%nthread 2: %d%n", i, 10000 - i);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } interrupt();
        }
    }

    static class Consumer extends Thread {
        public void run() {
            while (!done) {
                try {
                    long number = 0;
                    for (int i = 1; i <= 10000; i++) {
                        number += c.get();
                    }
                    done = true;
                    System.out.println("meðaltal: " + number / 10000);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } System.exit(0);
        }
    }

    static class Container {
        boolean isEmpty = true;
        int theValue;

        // Fastayrðing gagna:
        // Ílátið er tómt þþaa isEmpty sé true.
        // Ef ílátið er ekki tómt þá inniheldur
        // theValue gildið í ílátinu.
        // Notkun: Container c = new Container();
        // Fyrir: Ekkert.
        // Eftir: c vísar á nýjan tóman Container.
        // Ath.: Ekki þarf að forrita þennan smið,
        // hann verður sjálfkrafa til.
        // Notkun: c.put(x);
        // Eftir: Búið er að setja x í ílátið c.
        // Ef til vill þurfti að bíða eftir
        // að ílátið tæmdist áður en það
        // tókst.
        public synchronized void put(int x) throws InterruptedException {
            while (!isEmpty)
                // Fastayrðing gagna er sönn.
                // Þessi þráður hefur núll sinnum eða
                // oftar kallað á wait() til að reyna
                // að fá pláss til að setja gildið x
                // í hlutinn. Á undan sérhverju slíku
                // kalli var ekki pláss, þ.e. isEmpty
                // var ósatt.
                wait();
            isEmpty = false;
            theValue = x;
            notifyAll();
        }

        // Notkun: x = c.get();
        // Eftir: Búið er að sækja x úr ílátinu c.
        // Ef til vill þurfti að bíða eftir
        // að ílátið fylltist áður en það
        // tókst.
        public synchronized int get() throws InterruptedException {
            while (isEmpty)
                // Fastayrðing gagna er sönn.
                // Þessi þráður hefur núll sinnum eða
                // oftar kallað á wait() til að reyna
                // að gildi í hlutinn til að fjarlægja.
                // Á undan sérhverju slíku kalli var
                // ekki gildi í hlutnum, þ.e. isEmpty
                // var satt.
                wait();
            int x = theValue;
            isEmpty = true;
            notifyAll();
            return x;
        }
    }

    public static void main(String[] args) {
        Producer p1 = new Producer();
        Producer p2 = new Producer();
        Consumer c1 = new Consumer();
        p1.start();
        p2.start();
        c1.start();
    }

}