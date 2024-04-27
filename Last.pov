#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"
#include "stones.inc"
#include "glass.inc" 
#include "F1.inc" 
#include "skies.inc"



camera {
//location <20.0, 20.0, -5>     //斜め前視点
//location <5.0, 5.0, 10>     //斜め奥視点
location <0.0, 3.5, -25>    //手前視点
//location <0.0, 5.0, 15>    //奥視点 
//location <20.0, 1,4 >     //横視点
//location <-25.0, 1,0 >     //横反対視点
//location <0.0, 15.0, -5>  //上視点
look_at <0.0, 0, -2>
angle 30
}

light_source {
//< 10, 20, -10>
<-200,300,-300>
color 0.2*White
//color rgb<1,1,1>
parallel point_at <0, 0, 10>
}

light_source {
//< -10, 20, -10>
<200,300,-300>
color 0.2*White 
//color rgb<0.5,0.5,0.5>
parallel point_at <0, 0, 10>
}    

light_source{
<0,200,700>
color 0.3*White
parallel point_at <0, 0, 10>
}

//object { Cylinder_X scale 0.02 pigment{color Red}}
//object { Cylinder_Y scale 0.02 pigment{color Green}}    
//object { Cylinder_Z scale 0.02 pigment{color Blue}}

//タイヤ
#declare tire = union{ 
        object{
                Sphere
                scale <0.4,1,1>
                pigment{color Gray10} 
                }
        object{
               Sphere
                scale <0.8,0.8,0.8>
                pigment{color Red}
                
                  
      }
}
//canon citizenの内側のところ      
#declare RoundNose2 = difference {		

        object{ RoundNose2 
                scale<1,3.35,3>//太さ.縦.横幅
	        translate <0,0.2,8.5>  
                rotate x*-20 
                pigment{color Black}
                }
        object{ 
              box{<2,0,-5><-5,-5,5>}
              rotate x*-20
              } 
}

//ハンドル
#declare handle = object{
                Disk_X
                scale <0.8,0.04,0.04>
                translate<0,1.7,2.72>
                pigment{color Black}
                }


//canon citizenの外側の所
#declare citizen =union{
        object{AeroNose3  
         rotate z*-90
                rotate x*-20
                 scale<2,2,3>
                translate<0.7,0,8>
                translate<-0.25,2.3,-0.2>
                rotate y*5
               
                       
        }
        pigment{color Red}

        }

//ガラス前アーチ
#declare arch = 
        object{
           RoundNose1
           rotate z*90
           translate<0,0.8,3>
           rotate x*-20
           scale<2.3,0,0>
           pigment{color Red}     
        }          

//ガラス     
#declare glass = difference{
        object{
           RoundNose1
           scale<2.3,2.4,2.8> 
           translate<0.5,0,7.9>
           rotate z*90
           rotate x*-15
           material{M_Glass3}
           }
                    object{
           RoundNose1
           scale<2.3,2.4,2.8> 
           translate<0.3,0,7.9>
           rotate z*90
           rotate x*-15
           material{M_Glass2} 
           }
         object{
                box{<2,0.86,-7><-5,-5,7>}
                rotate x*-15
                //pigment{color Green}
                }
 }
 
//ボード
#declare board = union{
        object{
                box{<0,0,0><1.4,0.2,1.2>}   
                rotate x*40
                translate<-0.7,0.4,1.8>
                
                pigment{color Red} 
                }
        object{
               box{<0,0,0><1.4,0.2,1.6>}
               rotate x*-20
               translate<-0.7,-0.35,2.65>
               
               pigment{color Red}
               }          
} 

//モニター
declare monitor = intersection{
                       object { Cube scale <2, 2, 1> }
                         object { Cube scale <2, 3, 1> rotate y*60 }
                         object { Cube scale <2, 3, 1> rotate y*120 }
                         rotate x*60 
                                scale <0.4,0.3,0.4>
                                translate<0,0.7,2.7>
                        pigment{color Red}
                        }
//モニター下
declare monitor2 = union{
                        object{
                               box{<0,0,0><0.5,1.5,0.5>} 
                               rotate x*70
                               translate<-0.25,0.25,2.3>
                               
                               pigment{color Red}
                               }
                   } 

//下部
declare under = union{
                        object{ 
                                BoxyNose1
                                pigment{color Red}
                                } 
                         object{
                                Disk_X
                                scale<0.45,0.28,0.28> 
                                translate<0,0,-1.9>
                                pigment{color Red}
                                }
                         object{
                                Disk_X
                                scale<0.5,0.18,0.18> 
                                translate<0,0,-1.9>
                                pigment{color Red}
                                }
                         object{
                                Disk_X
                                scale<0.51,0.17,0.17> 
                                translate<0,0,-1.9>
                                pigment{color Black}
                                }
                         object{
                                Disk_X
                                scale<0.52,0.16,0.16> 
                                translate<0,0,-1.9>
                                pigment{color Red}
                                }       
                         object{ 
                                BoxyNose1
                                scale <1,0.7,0.7>
                                translate<0,0,-0.7>
                                pigment{color Red}
                                } 
                         scale<2.5,1.8,1.8>
                         translate<0,0,8.6> 
                         pigment{color Red}
                       } 
                       
// 股下
declare inseam = union{
                        object{
                                box{<0,0,0><1.4,0.5,1>}
                                rotate x*-30
                                translate<-0.7,0.3,3.8>
                                pigment{color Red}
                               }
                        difference{
                                object{
                                        box{<0,0,0><1.4,1.2,2>}
                                        rotate x*-60  
                                        translate<-0.7,-0.35,4.9>
                                        pigment{color Red}
                                //rotate x*60
                                        }
                                object{
                                        box{<-2,0,0><2,3,2>}
                                        rotate x*-75  
                                        translate<-0.7,-0.4,8>
                                        pigment{color Red} 
                                        }
                               } 
                       }

//バックライト                       
declare backnose = difference {
                                object{
                                       RoundNose1
                                       rotate z*90
                                       pigment{color Red}
                                       }
                                object{
                                       box{<-3,0,-5><3,-5,5>} 
                                       rotate x*15
                                       translate<0,-0.2,-2>
                                       pigment{color Red}
                                       }       
                                 
                                 object{ 
                                        Disk_Z
                                        scale 0.05
                                        pigment{color Yellow}
                                        translate<0.17,0.3,-2.3>
                                        }
                                 object{
                                        Disk_Z
                                        scale 0.05
                                        pigment{color Yellow}
                                        translate<-0.17,0.3,-2.3>
                                        }
                                rotate y*180
                                translate<0,2,1.2>
                                scale<3,1.3,1.5> 
                                rotate x*10      
                               }   

//タイヤ後ろ
#declare tireback = difference{
                          object{
                                tire
                                translate<0,0,7>
                                } 
                          object{
                                box{<0.5,5,10><5,-5,0>}
                                pigment {color Red}
                                }
                           translate<0,0,0>          
                           }
                           
//椅子後ろ
#declare seatback = union{
                          object{
                                BoxyNoseN2
                                
                                scale <2.2,1.8,1.3>
                                translate<0,3.25,7.2>
                                rotate x*25
                                pigment{color Red}
                                }
                          object{
                                BoxyNose2 
                                rotate z*-90
                                scale<0.6,0.8,1.6>
                                translate<-0.1,3.2,9>
                                pigment{color Red}
                                rotate x*25
                                rotate y*5
                                }
                          object{
                                Disk_X
                                scale<0.2,0.35,0.35>
                                translate<0.5,0.29,6.9>
                                pigment{color Red}
                          
                                }
                           object{
                                Disk_X
                                scale<0.2,0.27,0.27>
                                translate<0.51,0.29,6.9>
                                pigment{color Black}
                               
                                }
                           object{
                                Disk_X
                                scale<0.2,0.25,0.25>
                                translate<0.52,0.29,6.9>
                                pigment{color Red}
                                }
                          }
                          
//シート
#declare ushiro = union{
        object{board}
        object {monitor}
        object{monitor2}
        object{under}
        object{inseam} 
        object{seatback}
        object{backnose}
 
        object{tireback}
       
        
}
                       
//バイク前半分作成
#declare maehanbun =     
union{
object{ RoundNose2} 
object{tire }  
object {citizen}
object {citizen
        scale -1*x
        }
object{arch}
object{glass}
object{handle}

} 

//バイク後ろ半分作成
#declare ushirohanbun =
difference{
      object{ushiro}
      object{
                        box{<0,0,0><1,2,0.7>}
                        translate<-0.5,1.3,3.8>
                        rotate x*10
                        pigment{color Gray30}
                        }
      object{
             box{<0,0,0><0.9,0.5,1>}
                        translate<-0.45,1.37,3.2>
                        rotate x*10
                        pigment{color Gray30}
                        }
        }

//バイク作成
#declare KanedaBike = union{
                        object{
                                maehanbun
                                }
                        object{
                                ushirohanbun
                               }
                           }
 
// 
object {KanedaBike
        rotate y*90
        rotate x*-25
         translate<-3,1,clock*35+(-20)>
}
//
 
object { //Ground 
       Plane_XZ
       pigment{color Gray30}
       translate<0,0,0>
 }
object {
        box{<-0.2,0,-500><0.2,0.01,500>}
        pigment{color White} 
        }
object {
        box{<-7.4,0,-500><-7,0.01,500>}
        pigment{color White} 
        }
object {
        box{<7,0,-500><7.4,0.01,500>}
        pigment{color White} 
        }
        
object{
        box{<-20,0,-100><-18,4,600>}
        pigment{color 1*White}
         }
object{
        box{<18,0,-100><20,4,600>}
        pigment{color 1*White}
         }
#declare bill = union {
                 object{
                       box{<0,0,600><10,30,610>}
                       pigment{color Gray30}
                       }
                object{
                       box{<2,10,599><5,12,610>}
                       pigment{color Yellow}
                       }
                object{
                       box{<2,18,599><5,20,610>}
                       pigment{color Yellow}
                       }
                object{
                       box{<2,26,599><5,28,610>}
                       pigment{color Yellow}
                       }       
                }       



                        
object{bill}
object{bill translate<-20,0,0>} 
object{bill translate<-10,0,100>}
object{bill translate<15,0,100>}


                        
sky_sphere{ S_Cloud4}
//background{color White}


    
 