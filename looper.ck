125 => int tempo;
dur bit;
60.0/(tempo) => float SPB;
SPB::second => bit;

// Agrega la clase Drummer.ck
//Machine.add(me.dir()+"/Tech.ck");
//Machine.add(me.dir()+"/Mode.ck");
//Machine.add(me.dir()+"/MelodyGenerator.ck");


while( true )
{
        // Cambia dentro de las comillas el archivos que quieres que 
        // quede en loop, al salvar se actualiza con cada 16 beats.
	Machine.add(me.dir()+"/Conexion.ck") => int fileID;
	16*bit => now;
	Machine.remove( fileID );
}