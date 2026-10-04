* ENM-407 Uretim Planlama ve Kontrol - Odev 2
* Toplu Uretim Planlamasi (Tek Urun, 6 Donem)

Sets
    t        "donemler (aylar)" /1*6/
    t1(t)    "ilk donem"        /1/
    t2(t)    "2-6. donemler"    /2*6/;

Parameters
    Ft(t)    "t donemi talep tahmini (adet)"
    kN       "normal kapasite (adet/isc i/donem)"
    kF       "fazla mesai kapasite (adet/isc i/donem)"
    cN       "normal uretim birim maliyeti"
    cF       "fazla mesai uretim birim maliyeti"
    cS       "stok tasima birim maliyeti"
    cH       "ise alma maliyeti (kisi basina)"
    cL       "isten cikarma maliyeti (kisi basina)"
    S0       "baslangic stogu (adet)"
    W0       "baslangic isgucu (kisi)"
    Smin6    "6. donem minimum bitis stogu (adet)";

Ft('1') = 800;
Ft('2') = 900;
Ft('3') = 1100;
Ft('4') = 1000;
Ft('5') = 1200;
Ft('6') = 950;

kN   = 100;
kF   = 20;

cN   = 50;
cF   = 70;
cS   = 5;
cH   = 1200;
cL   = 1800;

S0   = 200;
W0   = 10;
Smin6 = 150;

Positive Variables
    PN(t)    "t doneminde normal uretim (adet)"
    PF(t)    "t doneminde fazla mesai uretimi (adet)"
    S(t)     "t donemi sonu stok (adet)";

Integer Variables
    W(t)     "t doneminde isgucu seviyesi (kisi)"
    H(t)     "t doneminde ise alinan (kisi)"
    L(t)     "t doneminde isten cikarilan (kisi)";

Variable
    TC       "toplam maliyet";

W.lo(t) = 0;  H.lo(t) = 0;  L.lo(t) = 0;

Equations
    Obj        "amac fonksiyonu"
    Stok1      "ilk donem stok dengesi"
    Stok2(t)   "diger donemler stok dengesi"
    KapN(t)    "normal uretim kapasitesi"
    KapF(t)    "fazla mesai kapasitesi"
    Isgucu1    "ilk donem isgucu dengesi"
    Isgucu2(t) "diger donemler isgucu dengesi"
    BitisStok  "6. donem minimum stok";

Obj..
    TC =e= sum(t, cN*PN(t) + cF*PF(t) + cS*S(t) + cH*H(t) + cL*L(t));

Stok1..
    S('1') =e= S0 + PN('1') + PF('1') - Ft('1');

Stok2(t2)..
    S(t2) =e= S(t2-1) + PN(t2) + PF(t2) - Ft(t2);

KapN(t)..
    PN(t) =l= kN*W(t);

KapF(t)..
    PF(t) =l= kF*W(t);

Isgucu1..
    W('1') =e= W0 + H('1') - L('1');

Isgucu2(t2)..
    W(t2) =e= W(t2-1) + H(t2) - L(t2);

BitisStok..
    S('6') =g= Smin6;

Model TopluPlan /Obj, Stok1, Stok2, KapN, KapF, Isgucu1, Isgucu2, BitisStok/;

Solve TopluPlan using MIP minimizing TC;

Display TC.l, PN.l, PF.l, S.l, W.l, H.l, L.l;
