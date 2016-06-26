using Toybox.System as Sys;
using Toybox.Sensor as Sen;
using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.UserProfile as User;
using Toybox.Math as Math;
using Toybox.Activity as act;
using Toybox.Time as Time;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Application as App;

class EDGE5View extends Ui.DataField {
	
	var prev = new [2];
	
	var prevV = new [5];
	var prevD = new [5];	
	var vzdalenost5s = 0;
	var vyska5s = 0;
	var maxspeed = 0;
	
	var watty3s = 0; 
	var pole1;
	var pole2;
	var pole3;
	var pole4;
	var pole5;
	var pole6;
	var pole7;
	var pole8;
	var pole9;
	var km = 0;	
	var vysledek;
	var vysledek7;
	var vysledek8;	
	var hodnota = 0;
	var prumer = 0;
	var maxrychl = 0;
	var stopky;
	var vzdalenost = 0;
	var options = 0;
	var vystup = 0;
	var sestup = 0;
	var vyska = 0;
	var srdce = 0;
	var avgsrdce = 0;
	var maxsrdce = 0;
	var kadence = 0;
	var kalorie = 0;
	var watty = 0;
	var avgwatty = 0;
	var maxwatty = 0;
	var efektivita = 0;
	var avgkadence = 0;
	var maxkadence = 0;

	var kadence1;
	var kadence2;
	
	var kadence7;
	var kadence8;
	var kadence9;
	
	var avgkadence1;
	var avgkadence2;
	var avgkadence3;
	var avgkadence4;

	var avgkadence7;
	var avgkadence8;
	var avgkadence9;
	var maxkadence1;
	var maxkadence2;
	var maxkadence3;
	var maxkadence4;

	var maxkadence7;
	var maxkadence8;
	var maxkadence9;

	var vzdalenost7;
	var vzdalenost8;
	var vzdalenost9;
	var srdce1;
	var srdce2;

	var srdce7;
	var srdce8;
	var srdce9;
	var avgsrdce1;
	var avgsrdce2;
	var avgsrdce3;
	var avgsrdce4;

	var avgsrdce7;
	var avgsrdce8;
	var avgsrdce9;
	var maxsrdce1;
	var maxsrdce2;
	var maxsrdce3;
	var maxsrdce4;

	var maxsrdce7;
	var maxsrdce8;
	var maxsrdce9;

	var climb7;
	var climb8;
	var climb9;	


	
	var vystup7;
	var vystup8;
	var vystup9;

	var sestup7;
	var sestup8;
	var sestup9;

	var vyska7;
	var vyska8;
	var vyska9;

	var kalorie7;
	var kalorie8;
	var kalorie9;
		
	var barva1 = Gfx.COLOR_BLACK;
	var barva2 = Gfx.COLOR_WHITE;
	var barva3 = Gfx.COLOR_LT_GRAY;
	var barva4 = Gfx.COLOR_DK_GRAY;
	var cira = Gfx.COLOR_TRANSPARENT;
	var gpsSignal = 0;
	
	var rozsah = 56;
	var rozsahleva = 100;
	var rozsahprava = 100;
	var minleva = 0;
	var minprava = 0;
	var maxleva = 100;
	var maxprava = 100; 
	var modra;
	var zluta;
	

    function compute(info) {

	if(info.altitude != null) { 

        if (prevV[0] != null && prevV[1] != null && prevV[2] != null && prevV[3] != null) 
        {vyska5s = (info.altitude - prevV[3]);}
	    else 
	    {vyska5s = 0;}

        if (prevV[0] == null) {
    		prevV[0] = info.altitude;
    	}
    	else if (prevV[1] == null) {
    			 prevV[1] = info.altitude;
    	}
    	else if (prevV[2] == null) {
    			 prevV[2] = info.altitude;
    	}
    	else if (prevV[3] == null) {
    			 prevV[3] = info.altitude;
    	}    	
    	else {
    	prevV[3] = prevV[2];
    	prevV[2] = prevV[1];
    	prevV[1] = prevV[0];
    	prevV[0] = info.altitude;
    	}
	}
	    	
	if(info.elapsedDistance != null) { 

        if (prevD[0] != null && prevD[1] != null && prevD[2] != null && prevD[3] != null) 
        {vzdalenost5s = (info.elapsedDistance - prevD[3]);}
	    else 
	    {vzdalenost5s = 0;}

        if (prevD[0] == null) {
    		prevD[0] = info.elapsedDistance;
    	}
    	else if (prevD[1] == null) {
    			 prevD[1] = info.elapsedDistance;
    	}
    	else if (prevD[2] == null) {
    			 prevD[2] = info.elapsedDistance;
    	}
    	else if (prevD[3] == null) {
    			 prevD[3] = info.elapsedDistance;
    	}    	
    	else {
    	prevD[3] = prevD[2];
    	prevD[2] = prevD[1];
    	prevD[1] = prevD[0];
    	prevD[0] = info.elapsedDistance;
    	}    	    	
    }
    
    gpsSignal = info.currentLocationAccuracy;  	


	if(info.currentSpeed!=null) {    	
	if(Sys.getDeviceSettings().distanceUnits == Sys.UNIT_METRIC)
	{
		km = info.currentSpeed * 3.6; 
		hodnota = info.currentSpeed * 3.6;
   		}
	else
	{
		km = info.currentSpeed * 2.2369362920544; 
		hodnota = info.currentSpeed * 2.2369362920544;
    	
	}
	}

	if(info.averageSpeed != null) {    	
	if(Sys.getDeviceSettings().distanceUnits == Sys.UNIT_METRIC)
	{
		prumer = info.averageSpeed * 3.6;
    	
		}
	else
	{
		prumer = info.averageSpeed * 2.2369362920544;
    	
	}
	}

	

            
        if( info.timerTime != null )
            {options = (info.timerTime / 1000);}            
            

        if( info.currentHeartRate != null )
            {srdce = info.currentHeartRate;}
            
        if( info.averageHeartRate != null )
            {avgsrdce = info.averageHeartRate;}
            
        if( info.maxHeartRate != null )
            {maxsrdce = info.maxHeartRate;}        
            
        if( info.currentCadence != null )
            {kadence = info.currentCadence;}
            
        if( info.averageCadence != null )
            {avgkadence = info.averageCadence;}
            
        if( info.maxCadence != null )
            {maxkadence = info.maxCadence;}                        
                
        if( info.calories != null )
            {kalorie = info.calories;} 
 /*
        if( Sen.getInfo().temperature != null )
            {temp = Sen.getInfo().temperature;}  
*/

		if (info.maxSpeed != null )
			{maxspeed = info.maxSpeed;}
       
                                           

if(Sys.getDeviceSettings().distanceUnits == Sys.UNIT_METRIC)
			{            
        if( info.elapsedDistance != null )
            {vzdalenost = info.elapsedDistance / 1000;}
        
        if( info.altitude != null )
            {vyska = info.altitude;}   
        
        if( info.totalDescent != null )
            {sestup = info.totalDescent;}
            
        if( info.totalAscent != null )
            {vystup = info.totalAscent;}            		
}
else
{
		if( info.elapsedDistance != null )
            {vzdalenost = info.elapsedDistance / 1609.34;}
            
        if( info.altitude != null )
            {vyska = info.altitude * 3.2808399;}    
        
        if( info.totalDescent != null )
            {sestup = info.totalDescent * 3.2808399;} 
            
        if( info.totalAscent != null )
            {vystup = info.totalAscent * 3.2808399;}                       
}            				
	return;
    }


    function onUpdate(dc) {    
        var width = dc.getWidth();
        var height = dc.getHeight();
        var clockTime = Sys.getClockTime();
   		var stats = Sys.getSystemStats();
		var batteryPercentage = Lang.format("$1$%", [stats.battery.format("%2d")]);

		var now = Time.now();
        var info = Calendar.info(now, Time.FORMAT_LONG);
		var hour = info.hour;
		var ampm = "";
		if (!Sys.getDeviceSettings().is24Hour) {
			ampm = hour >= 12 ? "p" : "a";
    		hour = hour % 12;
    		if (hour == 0) {
    			hour = 12;
    		}
    	}
    	var cas = Lang.format("$1$:$2$$3$", [hour, info.min.format("%02d"), ampm]);		
		
		

		
        var test = (Math.PI * 2);
		vysledek = km.format( "%.01f" );
		
		var climb = 0;

		if (vzdalenost5s != 0 && vyska5s != 0){
		climb = (100 * vyska5s) / vzdalenost5s;
		}
		else{
		climb = 0;}
				
		var hodiny = options/3600;
		var minuty = (options - hodiny*3600)/60;
		var vteriny = (options - hodiny*3600 - minuty*60);  
		stopky = Lang.format("$1$:$2$:$3$", [hodiny.format("%02d"), minuty.format("%02d"), vteriny.format("%02d") ]);  

        if (getBackgroundColor() == Gfx.COLOR_BLACK) {
		barva1 = Gfx.COLOR_BLACK;
		barva2 = Gfx.COLOR_WHITE;
		barva3 = Gfx.COLOR_LT_GRAY;
		barva4 = Gfx.COLOR_DK_GRAY;
        } else {
		barva1 = Gfx.COLOR_WHITE;
		barva2 = Gfx.COLOR_BLACK;
		barva3 = Gfx.COLOR_DK_GRAY;
		barva4 = Gfx.COLOR_LT_GRAY;
        }

// pozadi
        dc.setColor(barva1, Gfx.COLOR_BLACK);  
        dc.fillRectangle(0, 0, width, height);

//rozvrzeni
          
        dc.setColor(barva3, Gfx.COLOR_BLACK);
        dc.drawLine(width/2, 100, width/2, 178);
        dc.drawLine(0, height - 80, width, height - 80);

		

//hlavni hodnoty
		dc.setColor(barva2, Gfx.COLOR_TRANSPARENT);	
		dc.drawText(width/2, 10, 8, vysledek, Gfx.TEXT_JUSTIFY_CENTER); //rychlost
		dc.drawText(width/2, 60, 4, stopky, Gfx.TEXT_JUSTIFY_CENTER);	//stopky	
		dc.drawText(width/2, height-77, 6, prumer.format( "%.01f" ), Gfx.TEXT_JUSTIFY_CENTER);  //avs
		dc.drawText(5,height-66, 3, vyska.format( "%01d" ), Gfx.TEXT_JUSTIFY_LEFT); //nadmoøská výška		
		dc.drawText(width-5, height-66, 3, climb.format( "%01d" ) + "%", Gfx.TEXT_JUSTIFY_RIGHT); //sklon
		dc.drawText(5, height-30, 3, maxspeed.format( "%.01f" ) , Gfx.TEXT_JUSTIFY_LEFT);  //maxspeed
		dc.drawText(width-5, height-30, 3, vystup.format( "%01d" ) , Gfx.TEXT_JUSTIFY_RIGHT);  //nastoupáno
  		dc.drawText(width/2, height-30, 3, vzdalenost.format( "%.02f" ), Gfx.TEXT_JUSTIFY_CENTER);	//vzdálenost				
		dc.drawText(5, 0, 2, batteryPercentage , Gfx.TEXT_JUSTIFY_LEFT); //baterie
		dc.drawText(width - 5, 0, 2, cas, Gfx.TEXT_JUSTIFY_RIGHT); //hodiny					

//popisky       
		dc.setColor(barva3, Gfx.COLOR_TRANSPARENT);
		dc.drawText(width/2,0, 0, "BAZINAC speed!" , Gfx.TEXT_JUSTIFY_CENTER); //rychlost
		dc.drawText(width/2, height-46, 0, "avs (km/h)" , Gfx.TEXT_JUSTIFY_CENTER); //avs 
		dc.drawText(2, height-46, 0, "altitude (m)" , Gfx.TEXT_JUSTIFY_LEFT); //nadmoøská výška
		dc.drawText(width-4, height-46, 0, "gradient" , Gfx.TEXT_JUSTIFY_RIGHT); //sklon
		dc.drawText(width/2, height-12, 0, "distance (km)" , Gfx.TEXT_JUSTIFY_CENTER); //vzdálenost
		dc.drawText(2, height-12, 0, "max speed" , Gfx.TEXT_JUSTIFY_LEFT); //maxspeed
		dc.drawText(width-2, height-12, 0, "ascent (m)" , Gfx.TEXT_JUSTIFY_RIGHT); //nastoupáno
		dc.drawText(5, 15, 0, "battery" , Gfx.TEXT_JUSTIFY_LEFT); //baterie
		dc.drawText(width - 5, 15, 0, "time", Gfx.TEXT_JUSTIFY_RIGHT); //hodiny
	

//pole1
        	dc.setColor(barva2, cira);       
        	dc.drawText(width/4, 108, 7, srdce.format( "%01d" ), Gfx.TEXT_JUSTIFY_CENTER); 
        	dc.setColor(barva3, cira); 
        	dc.drawText(width/4, 97, 0, "HR (bpm)", Gfx.TEXT_JUSTIFY_CENTER);	    	 									
//pole2
        	dc.setColor(barva2, cira);        
        	dc.drawText(3*(width/4), 108, 7, kadence.format( "%01d" ), Gfx.TEXT_JUSTIFY_CENTER);
        	dc.setColor(barva3, cira); 
        	dc.drawText(3*(width/4), 97, 0, "cadence", Gfx.TEXT_JUSTIFY_CENTER);	 										

//pole4
        	dc.setColor(barva2, cira);         
        	dc.drawText((width/4), 150, 2, avgsrdce.format( "%01d" )+"/", Gfx.TEXT_JUSTIFY_RIGHT);
        	dc.drawText((width/4)+1, 150, 2, maxsrdce.format( "%01d" ), Gfx.TEXT_JUSTIFY_LEFT);	//pridane max za avg
        	dc.setColor(barva3, cira); 
        	dc.drawText(width/4, 165, 0, "avg / max", Gfx.TEXT_JUSTIFY_CENTER);									

//pole6
/*        	dc.setColor(barva2, cira);        
        	dc.drawText((3*(width/4)), 150, 2, avgwatty.format( "%01d")+"/", Gfx.TEXT_JUSTIFY_RIGHT);
        	dc.drawText((3*(width/4))+1, 150, 2, maxwatty.format( "%01d" ), Gfx.TEXT_JUSTIFY_LEFT); //pridane max za avg
        	dc.setColor(barva3, cira); 
        	dc.drawText(3*(width/4), 165, 0, "avg / max", Gfx.TEXT_JUSTIFY_CENTER);	       	 									
*/										
}

}
