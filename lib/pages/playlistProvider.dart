import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'audio.dart';
import 'song.dart';

 class PlaylistProvider extends ChangeNotifier{
  final List<Song>_playlist=[


    
	   //Sura1
	   Song(
        suraName: "1_Al-Fatiha",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/1_Al-Fatiha.mp3",
       ),

	    //Sura2
	   Song(
        suraName: "2_Al-Baqara",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/2_Al-Baqara.mp3",
       ),

	   //Sura3
	   Song(
        suraName: "3_Aal-E-Imran",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/3_Aal-E-Imran.mp3",
       ),

	     //Sura4
	   Song(
        suraName: "4_An-Nisa",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/4_An-Nisa.mp3",
       ),
	   //Sura5
	   Song(
        suraName: "5_Al-Maeda",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/5_Al-Maeda.mp3",
       ),

	   //Sura6
	   Song(
        suraName: "6_Al-Anaam",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/6_Al-Anaam.mp3",
       ),

	   //Sura7
	   Song(
        suraName: "7_Al-Araf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/7_Al-Araf.mp3",
       ),

	   
	   //Sura8
	   Song(
        suraName: "8_Al-Anfal",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/8_Al-Anfal.mp3",
       ),

	   //Sura9
	   Song(
        suraName: "9_At-Tawba",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/9_At-Tawba.mp3",
       ),

	    //Sura10
	   Song(
        suraName: "10_Surat-Yunus",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/10_Surat-Yunus.mp3",
       ),

	    //Sura11
	   Song(
        suraName: "11_Surat-Hud",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/11_Surat-Hud.mp3",
       ),

	     //Sura12
	   Song(
        suraName: "12_Surat-Yusuf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/12_Surat-Yusuf.mp3",
       ),

	    //Sura13
	   Song(
        suraName: "13_Surat-Ar-Rad",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/13_Surat-Ar-Rad.mp3",
       ),

	   //Sura14
	   Song(
        suraName: "14_Surat-Ibrahim",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/14_Surat-Ibrahim.mp3",
       ),

	    //Sura15
	   Song(
        suraName: "15_Surat-Al-Hijr",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/15_Surat-Al-Hijr.mp3",
       ),

	   
	    //Sura16
	   Song(
        suraName: "16_Surat-An-Nahl",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/16_Surat-An-Nahl.mp3",
       ),

	    //Sura17
	   Song(
        suraName: "17_Surat-Al-Isra",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/17_Surat-Al-Isra.mp3",
       ),
	    //Sura18
	   Song(
        suraName: "18_Surat-AL-Kahf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/18_Surat-AL-Kahf.mp3",
       ),
	    //Sura19
	   Song(
        suraName: "19_Surat-Maryam",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/19_Surat-Maryam.mp3",
       ),

	    //Sura20
	   Song(
        suraName: "20_Surat-Ta-Ha",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/20_Surat-Ta-Ha.mp3",
       ),

	    //Sura21
	   Song(
        suraName: "21_Surat-Al-Anbiya",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/21_Surat-Al-Anbiya.mp3",
       ),

	      //Sura22
	   Song(
        suraName: "22_Surat-Al-Hajj",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/22_Surat-Al-Hajj.mp3",
       ),

	    //Sura23
	   Song(
        suraName: "23_Surat-Al-Mumenoon",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/23_Surat-Al-Mumenoon.mp3",
       ),

	     //Sura24
	   Song(
        suraName: "24_Surat-An-Noor",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/24_Surat-An-Noor.mp3",
       ),

	     //Sura25
	   Song(
        suraName: "25_Surat-Al-Furqan",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/25_Surat-Al-Furqan.mp3",
       ),

	     //Sura26
	   Song(
        suraName: "26_Surat-Ash-Shu'ara",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/26_Surat-Ash-Shu'ara.mp3",
       ),

	     //Sura27
	   Song(
        suraName: "27_Surat-An-Naml",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/27_Surat-An-Naml.mp3",
       ),

	     //Sura28
	   Song(
        suraName: "28_Surat-Al-Qasas",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/28_Surat-Al-Qasas.mp3",
       ),

	       //Sura29
	   Song(
        suraName: "29_Surat-Al-Ankaboot",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/29_Surat-Al-Ankaboot.mp3",
       ),
	      //Sura30
	   Song(
        suraName: "30_Surat-Ar-Room",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/30_Surat-Ar-Room.mp3",
       ),

	   //Sura31
	   Song(
        suraName: "31_Surat-Luqman",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/31_Surat-Luqman.mp3",
       ),
	    //Sura32
	   Song(
        suraName: "32_Surat-As-Sajda",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/32_Surat-As-Sajda.mp3",
       ),

	     //Sura33
	   Song(
        suraName: "33_Surat-Al-Ahzab",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/33_Surat-Al-Ahzab.mp3",
       ),

	    //Sura34
	   Song(
        suraName: "34_Surat-Saba",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/34_Surat-Saba.mp3",
       ),
	     //Sura35
	   Song(
        suraName: "35_Surat-Fatir",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/35_Surat-Fatir.mp3",
       ),

	    //Sura36
	   Song(
        suraName: "36_Surat-Ya-Seen",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/36_Surat-Ya-Seen.mp3",
       ),
	    //Sura37
	   Song(
        suraName: "37_Surat-As-Saaffat",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/37_Surat-As-Saaffat.mp3",
       ),
	      //Sura38
	   Song(
        suraName: "38_Surat-Sad",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/38_Surat-Sad.mp3",
       ),
	   //Sura39
	   Song(
        suraName: "39_Surat-Az-Zumar",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/39_Surat-Az-Zumar.mp3",
       ),
	     //Sura40
	   Song(
        suraName: "40_Surat-Al-Ghafir",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/40_Surat-Al-Ghafir.mp3",
       ),

	   //Sura41
	   Song(
        suraName: "41_Surat-Fussilat",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/41_Surat-Fussilat.mp3",
       ),
	   //Sura42
	   Song(
        suraName: "42_Surat-Ash-Shura",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/42_Surat-Ash-Shura.mp3",
       ),
	     //Sura43
	   Song(
        suraName: "43_Surat-Az-Zukhuf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/43_Surat-Az-Zukhuf.mp3",
       ),

	   //Sura44
	   Song(
        suraName: "44_Surat-Ad-Dukhan",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/44_Surat-Ad-Dukhan.mp3",
       ),

	    //Sura45
	   Song(
        suraName: "45_Surah-Al-jathiya",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/45_Surah-Al-jathiya.mp3",
       ),

	     //Sura46
	   Song(
        suraName: "46_Surat-Al-Ahqaf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/46_Surat-Al-Ahqaf.mp3",
       ),
	      //Sura47
	   Song(
        suraName: "47_Surat-Muhammad",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/47_Surat-Muhammad.mp3",
       ),

	         //Sura48
	   Song(
        suraName: "48_Surat-Al-Fath",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/48_Surat-Al-Fath.mp3",
       ),
	          //Sura49
	   Song(
        suraName: "49_Surat-Al-Hujraat",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/49_Surat-Al-Hujraat.mp3",
       ),

	            //Sura50
	   Song(
        suraName: "50_Surat-Qaf",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/50_Surat-Qaf.mp3",
       ),

             //Sura51
	   Song(
        suraName: "51_Surat-Adh-Dhariyat",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/51_Surat-Adh-Dhariyat.mp3",
       ),

               //Sura52
	   Song(
        suraName: "52_Surat-At-Tur",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/52_Surat-At-Tur.mp3",
       ),

                 //Sura53
	   Song(
        suraName: "53_Surat-An-Najm",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/53_Surat-An-Najm.mp3",
       ),

                   //Sura54
	   Song(
        suraName: "54_Surat-Al-Qamar",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/54_Surat-Al-Qamar.mp3",
       ),

                    //Sura55
	   Song(
        suraName: "55_Surat-Ar-Rahman",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/55_Surat-Ar-Rahman.mp3",
       ),

                         //Sura56
	   Song(
        suraName: "56_Surat-Al-Waqia",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/56_Surat-Al-Waqia.mp3",
       ),

                              //Sura57
	   Song(
        suraName: "57_Surat-Al-Hadid",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/57_Surat-Al-Hadid.mp3",
       ),
                                //Sura58
	   Song(
        suraName: "58_Surat-Al-Mujadila",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/58_Surat-Al-Mujadila.mp3",
       ),

                                    //Sura59
	   Song(
        suraName: "59_Surat-Al-Hashr",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/59_Surat-Al-Hashr.mp3",
       ),

                                       //Sura60
	   Song(
        suraName: "60_Surat-Al-Mumtahina",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/60_Surat-Al-Mumtahina.mp3",
       ),

                                          //Sura61
	   Song(
        suraName: "61_Surat-As-Saff",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/61_Surat-As-Saff.mp3",
       ),

                                            //Sura62
	   Song(
        suraName: "62_Surat-Al-Jumua - Copy",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/62_Surat-Al-Jumua - Copy.mp3",
       ),

                                       //Sura63
	   Song(
        suraName: "63_Surat-Al-Munafiqoon",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/63_Surat-Al-Munafiqoon.mp3",
       ),
                                           //Sura64
	   Song(
        suraName: "64_Surat-At-Taghabun",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/64_Surat-At-Taghabun.mp3",
       ),
	                                         //Sura65
	   Song(
        suraName: "65_Surat-At-Talaq",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/65_Surat-At-Talaq.mp3",
       ),

                                             //Sura66
	   Song(
        suraName: "66_Surat-At-Tahrim",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/66_Surat-At-Tahrim.mp3",
       ),
	                     //Sura67
	   Song(
        suraName: "67_Surat-Al-Mulk",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/67_Surat-Al-Mulk.mp3",
       ), 
                      //Sura68
	   Song(
        suraName: "68_Surat-Al-Qalam",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/68_Surat-Al-Qalam.mp3",
       ), 

                            //Sura69
	   Song(
        suraName: "69_Surat-Al-Haaqqa",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/69_Surat-Al-Haaqqa.mp3",
       ), 

                                //Sura70
	   Song(
        suraName: "70_Surat-Al-Maarji",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/70_Surat-Al-Maarji.mp3",
       ),

                                //Sura71
	   Song(
        suraName: "71_Surat-Nooh",
        artistname: "Mishary Rashid Alafasy",
        audioPath: "audio/71_Surat-Nooh.mp3",
       ),

       // Sura72
    Song(
     suraName: "72_Surat-Al-jinn",
      artistname: "Mishary Rashid Alafasy",
     audioPath: "audio/72_Surat-Al-jinn.mp3",
    ),

// Sura73
Song(
  suraName: "73_Surat-Al-Muzzammil",
   artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/73_Surat-Al-Muzzammil.mp3",
),

// Sura74
Song(
  suraName: "74_Surat-Al-Muddaththir",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/74_Surat-Al-Muddaththir.mp3",
),

// Sura75
Song(
  suraName: "75_Surat-Al-Qiyama",
   artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/75_Surat-Al-Qiyama.mp3",
),

// Sura76
Song(
  suraName: "76_Surat-Al-insan",
 artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/76_Surat-Al-insan.mp3",
),

// Sura77
Song(
  suraName: "77_Surat-Al-Mursalat",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/77_Surat-Al-Mursalat.mp3",
),


// Sura78
Song(
  suraName: "78_Surat-An-Naba",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/78_Surat-An-Naba.mp3",
),

// Sura79
Song(
  suraName: "79_Surat-An-Naziat",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/79_Surat-An-Naziat.mp3",
),

// Sura80
Song(
  suraName: "80_Surat-Abasa",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/80_Surat-Abasa.mp3",
),

// Sura81
Song(
  suraName: "81_Surat-At-Takwir",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/81_Surat-At-Takwir.mp3",
),

// Sura82
Song(
  suraName: "82_Surat-Al-Infitar",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/82_Surat-Al-Infitar.mp3",
),
// Sura83
Song(
  suraName: "83_Surat-Al-Mutaffin",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/83_Surat-Al-Mutaffin.mp3",
),

// Sura84
Song(
  suraName: "84_Surat-Al-Inshiqaq",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/84_Surat-Al-Inshiqaq.mp3",
),



// Sura85
Song(
  suraName: "85_Surat-Al-Burooj",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/85_Surat-Al-Burooj.mp3",
),

// Sura86
Song(
  suraName: "86_Surat-At-Tariq",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/87_Surat-At-Tariq.mp3",
),

// Sura87
Song(
  suraName: "87_Surat-Al-Ala",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/87_Surat-Al-Ala.mp3",
),
// Sura88
Song(
  suraName: "88_Surat-Al-Ghashiya",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/88_Surat-Al-Ghashiya.mp3",
),
// Sura89
Song(
  suraName: "89_Surat-Al-Fajr",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/89_Surat-Al-Fajr.mp3",
),
// Sura90
Song(
  suraName: "90_Surat-Al-Balad",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/90_Surat-Al-Balad.mp3",
),
// Sura91
Song(
  suraName: "91_Surat-Ash-Shams",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/91_Surat-Ash-Shams.mp3",
),

// Sura92
Song(
  suraName: "92_Surat-Al-Lail",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/92_Surat-Al-Lail.mp3",
),

// Sura93
Song(
  suraName: "93_Surat-Ad-Dhuha",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/93_Surat-Ad-Dhuha.mp3",
),

// Sura94
Song(
  suraName: "94_Surat-Al-Inshirah",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/94_Surat-Al-Inshirah.mp3",
),


// Sura95
Song(
  suraName: "95_Surat-At-Tin",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/95_Surat-At-Tin.mp3",
),

// Sura96
Song(
  suraName: "96_Surat-Al-Alaq",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/96_Surat-Al-Alaq.mp3",
),

// Sura97
Song(
  suraName: "97_Surat-Al-Qadr",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/97_Surat-Al-Qadr.mp3",
),

// Sura98
Song(
  suraName: "98_Surat-Al-Bayyina",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/98_Surat-Al-Bayyina.mp3",
),

// Sura99
Song(
  suraName: "99_Surat-Az-Zaizala",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/99_Surat-Az-Zaizala.mp3",
),
// Sura100
Song(
  suraName: "100_Surat-Al-Adiyat",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/100_Surat-Al-Adiyat.mp3",
),

// Sura101
Song(
  suraName: "101_Surat-Al-Qaria",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/101_Surat-Al-Qaria.mp3",
),
// Sura102
Song(
  suraName: "102_Surat-At-Takathur",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/102_Surat-At-Takathur.mp3",
),
// Sura103
Song(
  suraName: "103_Surat-Al-As",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/103_Surat-Al-As.mp3",
),
// Sura104
Song(
  suraName: "104_Surat-Al-Humaza",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/104_Surat-Al-Humaza.mp3",
),
// Sura105
Song(
  suraName: "105_Surat-Al-Fil",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/105_Surat-Al-Fil.mp3",
),
// Sura106
Song(
  suraName: "106_Surat-Quraish",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/106_Surat-Quraish.mp3",
),
// Sura107
Song(
  suraName: "107_Surat-Al-Maun",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/107_Surat-Al-Maun.mp3",
),
// Sura108
Song(
  suraName: "108_Surat-Al-Kauther",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/108_Surat-Al-Kauther.mp3",
),

// Sura109
Song(
  suraName: "109_Surat-Al-Kafiroon",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/109_Surat-Al-Kafiroon.mp3",
),
// Sura110
Song(
  suraName: "110_Surat-An-Nasr",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/110_Surat-An-Nasr.mp3",
),
// Sura111
Song(
  suraName: "111_Surat-Al-Masadd",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/111_Surat-Al-Masadd.mp3",
),

// Sura112
Song(
  suraName: "112_Surat-Al-Ikhlas",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/112_Surat-Al-Ikhlas.mp3",
),

// Sura113
Song(
  suraName: "113_Surat-Al-Falaq",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/113_Surat-Al-Falaq.mp3",
),

// Sura114
Song(
  suraName: "114_Surat-An-Nass",
  artistname: "Mishary Rashid Alafasy",
  audioPath: "audio/114_Surat-An-Nass.mp3",
),

  ];
  int ? _current1index;
    
  
   //audio players 
   final AudioPlayer _audioPlayer =AudioPlayer();



  //durations
          Duration _currentDuration = Duration.zero;
          Duration _totalDuration = Duration.zero;

  //constructor
   PlaylistProvider(){
    listenToDuartion();
   }
  ///initially not playing
     bool _isPlaying =false;


  ///play the current sura
    void play()async{
      final String path =_playlist[_current1index!].audioPath;
      await _audioPlayer.stop();//stop current sura
      ///errorrrrr
      
    await _audioPlayer.play(AssetSource(path));
      _isPlaying =true;
     notifyListeners();

    }
  ///pause current sura
    
    void pause()async{
      await _audioPlayer.pause();
      _isPlaying =false;
      notifyListeners();
    }

  ///resume playing
  void resume ()async{
    await _audioPlayer.resume();
    _isPlaying =true;
    notifyListeners();
  }
  ///pause or resume
    
    void pauseOrResume()async {
      if(_isPlaying){
        pause();
      }
      else{
       resume();

      }
      notifyListeners();
    }

  ///seek to specifiq position
   void seek(Duration position)async{
    await _audioPlayer.seek(position);
   }


  ///play next sora
  void playNextSong(){
    ///
    // eikhane amader vul hoar possibility ache
    //
    if(_current1index!=null){
       if(_current1index!<_playlist.length-1){
        //go to the next song if its not the last song
        currentSongIndex = _current1index!+1;

       }
       else{
        //if its the last song
        currentSongIndex=0;
       }
    }
  }
  ///play previous sora
  

  void playPreviousSong()async{
    //if more then 2 seconds have passed ,restart the current song
    if (_currentDuration.inSeconds>2){
          
       seek(Duration.zero);
    }
    //if its wuthn the 2 seconds
    else{
        if(_current1index!>0)
        {
          currentSongIndex = _current1index!-1;

        }else{
          //if its first song,loop back to last song
          currentSongIndex =_playlist.length-1;

        }

    }
  }
  /// listen to duration
      void listenToDuartion(){
        //listen for total duration
        _audioPlayer.onDurationChanged.listen((newDuration){
          _totalDuration = newDuration;
          notifyListeners();
        });
        //listen for current duration
         _audioPlayer.onPositionChanged.listen((newPosition) {
            _currentDuration =newPosition;
            notifyListeners();
          });

        //listen for song completion
        _audioPlayer.onPlayerComplete.listen((event){
          playNextSong();
        });
      }
  /// dispose audio player
  
  //ekhaner ta katbi

  //getters
   List<Song>get playlist=>_playlist;
   int ? get currentSongIndex => _current1index;
  bool get isPlaying =>_isPlaying;
  Duration get currentDuration =>_currentDuration;
  Duration get totalDuration=>_totalDuration;
   //seters
   set currentSongIndex(int ?newIndex){
    _current1index = newIndex;
    if(newIndex!=null){
      play();
    }

    notifyListeners();

   }

 }