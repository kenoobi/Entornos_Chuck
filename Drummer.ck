public class Press{
    
        //Master
        Gain master => dac;
        Gain Melodia2 => dac;
        Gain Bajo => dac;
        Gain melodia1 => dac;
    
        // Sonidos
        SndBuf Kick => master;
        SndBuf Clap => master;
        Impulse imp => ResonZ filtRes => master;

    
        //Vol

        1 => master.gain;
        0.8 => Bajo.gain;
        0.4 => melodia1.gain;
        0.02 => Melodia2.gain;
    
        //Variables Divinas
        float yisus;
        float godbpm;
        float jose;
    
        // EL DIOS DEL BPM
    
        fun dur god (float bpm)
        {
            60.0/bpm => yisus;
            yisus/4 => godbpm;
            yisus/2 => jose;
        }
        
        
        // direction of .Wav
        me.dir() + "/Audios/Kick.wav" => Kick.read;
        me.dir() + "/Audios/Clap.wav" => Clap.read;
    
        //Inicio
        Kick.samples() => Kick.pos;   
        Clap.samples() => Clap.pos;

        
        //Funcion Para Baterias
        fun void perc_1 (int K[], int Cl[], int Cod[])
            {
        while (true)
        {                       //Kick          Clap           Codigo
            for(0 => int i; i < K.cap() && i < Cl.cap() && i < Cod.cap(); i++)
            {
                if (K[i] == 1)
                {
                    0 => Kick.pos;
                }
                if (Cl[i] == 1)
                {
                    0 => Clap.pos;
                }
                if (Cod[i] == 1)
                {
                    20 => filtRes.Q;
                    2 => imp.gain;
                    500 => imp.next;
                    50 => filtRes.freq;
                }
                else
                {
                    <<< "Posicionde Kick =", K[i] >>>;
                    <<< "Posicionde Clap =", Cl[i] >>>;
                    <<< "Posicionde Codigo =", Cod[i] >>>;
                }
                            yisus ::second => now;
            }

        }
    }
    
            //Sound Chain
            SndBuf HiHat => master;
    
            // direction of .Wav
            me.dir() + "/Audios/HiHat.wav" => HiHat.read;
    
            //Inicio
            HiHat.samples() => HiHat.pos;
    
    
    //Funcion Para el Hit Hat a Corchea
    //                   HiHat
        fun void HiH (int Hi[])
            {
        while (true)
        {
            for(0 => int i; i < Hi.cap(); i++)
            {
                if (Hi[i] == 1)
                {
                    0 => HiHat.pos;
                }
                else
                {
                    <<< "Posicion de HiHat =", Hi[i] >>>;

                }
                            jose ::second => now;
            }

        }
    }
    // Sonido para Efecto
            Noise noise => BPF bpf => master;
            int r;
    //Funcion para Efecto
 fun void Fx(int fx[])
    {
        while(true)
        {
            for(0 => int i; i < fx.cap(); i++)
                        {
                            if (fx[i] == 0)
                    {
                        (0,0) => bpf.set;
                        godbpm::ms => now;
                    }
                 if (fx[i] == 1)
                    {
        for (50 => float s; s < 5000; 0.1 + s => s)
                {
        (s,20) => bpf.set;
            <<< "go", s>>>;
             0.155::ms => now;
                }
                    }
                    
                    if (fx[i] == 2)
                    {
        for (5000 => float s; s < 5001; s - 0.1 => s)
                {
        (s,20) => bpf.set;
            <<<"go" ,s>>>;
                if (s < 0.1)
                    {
                    5002 => s;
                    }
            0.155::ms => now;
                    }
                }
               if (fx[i] == 3)
               {
                   for (0 => int s; s < 500; s++)
                   {
                     Math.random2(100,400) => r;
                     (r,20) => bpf.set;
                      0.155::ms => now; 
                   }
               } 
            }
        }
    }
    
        //Sonido de la Melodia Principal
        SinOsc melodi1 => ADSR adsrmel => NRev revermel => melodia1;
    
            //Attack , decay , sustain , release
            adsrmel.set(120::ms,50::ms,0.9,50::ms);
            0.02 => revermel.mix;
    
    //Funcion para Melodia principal
   fun void melodi (int b[])
            {
        while (true)
        {
            for(0 => int i; i < b.cap(); i++)
              {
                    if (b[i] == 0)
                        {
                    0 => melodi1.freq;
                            
                    godbpm::second => now;
                        }       
                                                 //Melodia Cygnus
                                    if (b[i] == 1)
                                    {
                    [54,0,52,0,55,0,52,52,0,54,0,0,54,0,0,52,54,0,52,0,55,0,52,0,0,54,0,0,54,0,0,0] @=> int melodia[];

                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                            
                                    
                                    
                                                 //Melodia Antares
                                    if (b[i] == 2)
                                    {
                    [47,47,0,49,49,0,50,50,0,50,50,0,49,49,0,0,47,47,0,49,49,0,50,50,0,50,50,0,49,49,0,0,47,47,0,49,49,0,50,50,0,50,50,0,49,49,0,0,47,47,0,49,49,0,50,50,0,52,52,0,54,54,0,0] @=> int melodia[];

                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                     0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                                    
                                    
                                                 //Melodia Selena
                                    if (b[i] == 3)
                                    {
                    [63,63,63,59,59,59,58,58,0,58,58,0,58,58,0,0,58,58,59,59,58,0,58,58,0,56,56,0,56,56,0,56] @=> int melodia[];

                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                                   
                                    
                                                 //Melodia Novva
                                    if (b[i] == 4)
                                    {
                    [65,0,72,0,68,0,0,67,0,0,67,0,0,67,0,0,67,0,0,0,68,0,0,67,0,0,65,0,0,65,0,0] @=> int melodianov[];
                    [53,0,60,0,56,0,0,55,0,0,55,0,0,55,0,0,55,0,0,0,56,0,0,55,0,0,53,0,0,53,0,0] @=> int melodianovv[];
                  
   for(0 => int c ; c < melodianov.cap() && c < melodianovv.cap();c++)
                            {
                                if ((melodianov[c] == 0) && (melodianovv[c] == 0))
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodianov[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                                                 //MINTAKA
                                    if (b[i] == 5)
                                    {
                    [0,67,0,0,67,0,0,67,0,63,0,0,63,0,0,0,60,0,0,60,0,0,60,0,0,63,0,0,63,0,0,0] @=> int melodia[];

                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                        
                        //BELLATRIX
                        if (b[i] == 6)
                                    {
                  [0,69,69,72,72,72,71,71,71,74,74,74,74,74,74,74,71,71,71,74,74,74,76,76,76,76,76,76,76,76,76,0,0,69,69,72,72,72,71,71,71,74,74,74,74,74,74,74,76,76,76,72,72,72,69,69,69,69,69,69,69,69,69,0] @=> int melodia[];

                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }
                        
                                                 //BENETNASCH
                                    if (b[i] == 9)
                                    {
                  [0,0,0,70,0,0,70,0,0,71,0,0,74,0,0,71,0,0,0,70,0,0,70,0,0,66,0,0,63,0,0,66]@=> int melodia[];
                  
   for(0 => int c ; c < melodia.cap();c++)
                            {
                                if (melodia[c] == 0)
                                {
                                    0 => melodi1.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melodia[c]) => melodi1.freq;
    adsrmel.keyOn();
    godbpm::second => now;
    adsrmel.keyOff();
                                }
                            }
                        }                        
                    }
                }
            }
                        
     
     //Sonido para el Bajo # 1
                  SinOsc bassmid1 => SawOsc bassmid2 => ADSR adsrmid => NRev revermid => Melodia2;
     
            10 => bassmid2.gain;
            //peso onda
            10 => bassmid1.gain;
            //mdos posibles 0 , 1 , 2
            2 => bassmid2.sync;
            10 => bassmid1.freq;
            10 => bassmid2.freq;
            //Attack , decay , sustain , release
            adsrmid.set(0::ms,0.1::ms,0.30,1::ms);
            0.0 => revermid.mix;
    
     //Funcion Para el Bajo # 1
   fun void bajo_1 (int ba[])
            {
        while (true)
        {
            for(0 => int i; i < ba.cap(); i++)
              {
                if (ba[i] == 0)
                        {
                    0 => bassmid1.freq;
                    0 => bassmid2.freq;
                    godbpm::second => now;
                        }
                        
                                                  // SECUNDARIO Antares
                                    if (ba[i] == 2)
                                    {
                    [66,0,0,64,0,0,62,0,0,61,0,0,59,0,59,0,66,0,0,64,0,0,62,0,0,61,0,0,59,0,59,0,66,0,0,64,0,0,62,0,0,61,0,0,59,0,59,0,66,0,0,64,0,0,66,0,0,69,0,0,66,0,66,0] @=> int melbass[];
                    for(0 => int c ; c < melbass.cap();c++)
                           { 
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                        }
                    }
                
       
                                    
                                    
                                                  // SECUNDARIO Selena
                                    if (ba[i] == 3)
                                    {
                    [0,0,0,83,0,0,87,0,0,0,0,0,87,0,0,0,0,0,0,82,0,0,80,0,0,0,0,0,80,0,0,0] @=> int melbass[];

                  
   for(0 => int c ; c < melbass.cap();c++)

                            {
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                            }
                        }
                        
                                                  // SECUNDARIO MINTAKA
                                    if (ba[i] == 5)
                                    {
                    [0,0,63,0,0,0,62,0,0,0,60,0,0,0,0,0,60,0,0,60,0,0,60,0,0,0,62,0,62,0,0,0] @=> int melbass[];

                  
   for(0 => int c ; c < melbass.cap();c++)

                            {
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                        }
                    }
                                                  //LACAILLE
                                    if (ba[i] == 7)
                                    {
                    [0,0,72,0,79,0,0,75,0,0,74,0,0,0,0,72,0,0,79,0,0,75,0,0,74,0,0,0,0,0,0,0,0,0,72,0,79,0,0,75,0,0,74,0,0,0,0,72,0,0,79,0,0,75,0,0,74,0,75,0,74,0,72,0] @=> int melbass[];

                  
   for(0 => int c ; c < melbass.cap();c++)

                            {
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                        }
                    }
                    
                                                  //LALANDE
                                    if (ba[i] == 8)
                                    {
                    [77,77,0,77,77,0,76,76,76,76,76,76,76,76,0,83,83,0,83,83,0,83,83,76,76,0,76,76,0,76,0,0] @=> int melbass[];

                  
   for(0 => int c ; c < melbass.cap();c++)

                            {
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                        }
                    }
                    
                                                  //BENETNASCH
                                    if (ba[i] == 9)
                                    {
                    [58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,58,54,54,54,54,54,54,54,54]@=> int melbass[];

                  
   for(0 => int c ; c < melbass.cap();c++)

                            {
                               if(melbass[c] == 0)
                               {
                                   0 => bassmid1.freq;
                                   0 => bassmid2.freq;
                                   godbpm::second => now;
                               }
                               else
                               {
    Std.mtof(melbass[c]) => bassmid1.freq;
    Std.mtof(melbass[c]) => bassmid2.freq;                        
    adsrmid.keyOn();
    godbpm::second => now;
    adsrmid.keyOff();
                            }
                        }
                    }
                }
            }
        } 
     
     //Sonido para el Bajo # 2
     SinOsc bass2 => TriOsc bass3 => ADSR adsr => NRev rever =>  LPF bpfbass =>  Bajo;
            
            1 => bass3.gain;
            //peso onda
            1 => bass2.gain;
            //mdos posibles 0 , 1 , 2
            2 => bass3.sync;
            1000 => bass2.freq;
            5 => bass3.freq;
            //low filter
            (80,1) => bpfbass.set;
            //Attack , decay , sustain , release
            adsr.set(0::ms,10::ms,0.9,9::ms);
            0.0 => rever.mix;

     //Funcion para el Bajo # 2 
   fun void bajo_2 (int bas[])
            {
        while (true)
        {
            for(0 => int i; i < bas.cap(); i++)
              {
                if (bas[i] == 0)
                        {
                    0 => bass2.freq;
                    0 => bass3.freq;
                    godbpm::second => now;
                        }
                                                   //Melodia Cygnus
                                    if (bas[i] == 1)
                                    {
                    [54,54,54,54,54,0,52,52,0,54,54,0,54,0,0,52,54,0,52,0,55,0,52,52,0,54,0,0,54,0,0,0] @=> int melbass2[];
                    [42,42,42,42,42,0,40,40,0,42,42,0,42,0,0,40,42,0,40,0,43,0,40,40,0,42,0,0,42,0,0,0] @=> int melbass3[];                  
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
    
                                }
       
                              }
                           }
                        
                                                   //Melodia Antares                 
                                    if (bas[i] == 2)
                                    {
                    [47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,47,47,47,50,50,50,0] @=> int melbass2[];
                    [47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,50,50,0,49,49,49,0,47,47,47,49,49,49,50,50,50,47,47,47,50,50,50,0] @=> int melbass3[];

                  
  for(0 => int c ; c < melbass2.cap();c++)

                            {
                                if (melbass2[c] == 0)
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass2[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }          
                                          
                                                   // Melodia Selena
                                    if (bas[i] == 3)
                                    {
                    [56,56,56,52,52,52,51,51,0,51,51,0,51,51,0,0,51,51,52,52,51,0,51,51,0,49,49,0,49,49,0,49] @=> int melbass2[];
                    [44,44,44,40,40,40,39,39,0,39,39,0,39,39,0,0,39,39,40,40,39,0,39,39,0,37,37,0,37,37,0,37] @=> int melbass3[];
                  
  for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
       
                                    }
                                }
                                    
                                                   // Melodia Novva    
                                    if (bas[i] == 4)
                                    {
                    [41,0,48,0,44,0,0,43,43,0,43,43,0,43,43,0,43,0,0,0,44,0,0,48,0,0,41,41,0,41,41,0] @=> int melbass2[];
                    [41,0,48,0,44,0,0,43,43,0,43,43,0,43,43,0,43,0,0,0,44,0,0,48,0,0,41,41,0,41,41,0] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                                }
       
                              }

                           }
                           
                                                   //MINTAKA
                                    if (bas[i] == 5)
                                    {
                    [0,60,0,0,60,0,0,60,0,55,0,0,55,0,0,0,51,0,0,51,0,0,51,0,0,53,0,0,53,0,0,53] @=> int melbass2[];
                    [0,48,0,0,48,0,0,48,0,43,0,0,43,0,0,0,39,0,0,39,0,0,39,0,0,41,0,0,41,0,0,41] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }
                                                   //BELLATRIX
                                    if (bas[i] == 6)
                                    {
                    [0,57,57,60,60,0,59,59,0,57,57,0,57,0,0,0,57,57,0,55,55,0,57,57,0,57,57,0,57,57,0,57] @=> int melbass2[];
                    [0,45,45,48,48,0,47,47,0,45,45,0,45,0,0,0,45,45,0,43,43,0,45,45,0,45,45,0,45,45,0,45] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }
                    
                                                   //LACAILLE
                                    if (bas[i] == 7)
                                    {
                    [60,60,0,60,60,0,60,60,0,60,60,60,0,63,63,0,61,61,0,60,60,61,61,0,61,0,61,61,61,61,0,0,61,60,60,0,60,60,0,60,60,0,60,60,0,63,63,0,61,61,0,60,60,61,61,0,61,61,0,60,60,60,60,60,60] @=> int melbass2[];
                    [60,60,0,60,60,0,60,60,0,60,60,60,0,63,63,0,61,61,0,60,60,61,61,0,61,0,61,61,61,61,0,0,61,60,60,0,60,60,0,60,60,0,60,60,0,63,63,0,61,61,0,60,60,61,61,0,61,61,0,60,60,60,60,60,60] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }
                                                   //LALANDE
                                    if (bas[i] == 8)
                                    {
                    [62,62,62,0,60,60,0,59,59,0,64,64,0,0,0,0,65,65,0,59,59,0,64,64,0,57,57,60,0,60,0,60] @=> int melbass2[];
                    [62,62,62,0,60,60,0,59,59,0,64,64,0,0,0,0,65,65,0,59,59,0,64,64,0,57,57,60,0,60,0,60] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }
                    
                                                   //BENETNASCH
                                    if (bas[i] == 9)
                                    {
                    [0,0,0,70,0,0,70,0,0,71,0,0,0,0,0,0,0,0,0,70,0,0,70,0,0,66,0,0,63,0,0,0] @=> int melbass2[];
                    [0,0,0,58,0,0,58,0,0,59,0,0,0,0,0,0,0,0,0,58,0,0,58,0,0,54,0,0,51,0,0,0] @=> int melbass3[];

                                        
   for(0 => int c ; c < melbass2.cap() && c < melbass3.cap();c++)

                            {
                                if ((melbass2[c] == 0) && (melbass3[c] == 0))
                                {
                                    0 => bass2.freq;
                                    0 => bass3.freq;
                                    
                                    godbpm::second => now;
                                }
                                else
                                {
    Std.mtof(melbass2[c]) => bass2.freq;
    Std.mtof(melbass3[c]) => bass3.freq;
    adsr.keyOn();
    godbpm::second => now;
    adsr.keyOff();
                            }
                        }
                    }
                }
            }
        }
    }
                            
                                
     






        
            




