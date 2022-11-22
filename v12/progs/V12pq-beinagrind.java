import java.util.TreeMap;

// Hlutir af tagi V12pq eru forgangsbiðraðir þar sem forgangsröð
// gilda af tagi V hefur lykla af tagi K.  Gildin af tagi K verða
// að vera samanburðarhæf hvort við annað með hinu hefðbundna
// compareTo boði.

public class V12pq<K extends Comparable<? super K>, V>
{
    // ... tilviksbreytur ...

    // Fastayrðing gagna: ...

    // Notkun: V12pq<K,V> pq = new V12pq<K,V>(...);
    // Fyrir:  ...
    // Eftir:  ...

    public V12pq(...)
    {
        // ...
    }    

    // Notkun: pq.put(k,v);
    // Fyrir:  ...
    // Eftir:  ...

    public void put( K k, V v )
    {
        // ...
    }

    // Notkun: V v = pq.get();
    // Fyrir:  ...
    // Eftir:  ...

    public V get()
    {
        // ...
    }

    // Notkun: boolean b = pq.isEmpty();
    // Fyrir:  ...
    // Eftir:  ...

    public boolean isEmpty()
    {
        // ...
    }

    // ... e.t.v. meira, ef þörf krefur eða hæfa þykir

    // Notkun: V12pq.main(args);
    // Fyrir:  Ekkert
    // Eftir:  Búið er að prófa V12pq klasann með því að prófa
    //         allar aðgerðir í klasanum og með því að raða
    //         fylki af String og öðru fylki af Double.
    //         Ef röðunin kom rétt út í báðum tilvikum og engin
    //         önnur villa fannst var skrifuð ein lína á aðalúttak
    //         (stdout):
    //           Allt í fína
    //         Annars, ef önnur röðunin gaf ranga niðurstöðu eða
    //         önnur villa fannst, þá skrifaðist
    //           Villa í V12pq<String,String>
    //         eða
    //           Villa í röðun V12pq<Double,Double>
    public static void main( String[] args )
    {
        V12pq<String,String> pqs = new V12pq<String,String>();
        V12pq<Double,Double> pqd = new V12pq<Double,Double>();
        String[] as = {"a","x","b","y","c","z","z","z","z","a","a","a"};
        Double[] ad = {1.0,9.0,2.0,8.0,3.0,7.0,4.0,6.0,5.0,1.0,1.0,1.0,9.0,9.0,9.0};
        // Röðum strengjum:
        for( int i=0 ; i!=as.length ; i++ )
            // pqs inniheldur pörin (as[0],as[0]),...,(as[i-1],as[i-1]).
            pqs.put(as[i],as[i]);
        for( int i=0 ; i!=as.length ; i++ )
            // as[0..i-1] inniheldur i minnstu gildin úr upphaflega as,
            // hin gildin eru í pqs.
        {
            if( pqs.isEmpty() )
            {
                System.out.println("Villa í V12pq<String,String>");
                return;
            }
            as[i] = pqs.get();
        }
        if( !pqs.isEmpty() )
        {
            System.out.println("Villa í V12pq<String,String>");
            return;
        }
        for( int i=1 ; i<as.length ; i++ )
            // Búið er að staðfesta að as[0..i-1] er í vaxandi röð.
        {
            if( as[i].compareTo(as[i-1])<0 )
            {
                System.out.println("Villa í V12pq<String,String>");
                return;
            }
        }
        // Röðum fleytitölum:
        for( int i=0 ; i!=ad.length ; i++ )
            // pqd inniheldur pörin (ad[0],ad[0]),...,(ad[i-1],ad[i-1]).
            pqd.put(ad[i],ad[i]);
        for( int i=0 ; i!=ad.length ; i++ )
            // ad[0..i-1] inniheldur i minnstu gildin úr upphaflega ad,
            // hin gildin eru í pqd.
        {
            if( pqd.isEmpty() )
            {
                System.out.println("Villa í V12pq<Double,Double>");
                return;
            }
            ad[i] = pqd.get();
        }
        if( !pqd.isEmpty() )
        {
            System.out.println("Villa í V12pq<Double,Double>");
            return;
        }
        for( int i=1 ; i<ad.length ; i++ )
            // Búið er að staðfesta að ad[0..i-1] er í vaxandi röð.
        {
            if( ad[i].compareTo(ad[i-1])<0 )
            {
                System.out.println("Villa í V12pq<Double,Double>");
                return;
            }
        }
        System.out.println("Allt í fína");
    }
}
