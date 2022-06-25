
import { Alert,Button,Text,StyleSheet,View,StatusBar } from "react-native";
import { Image } from "react-native";
import React, {useState,useEffect,} from 'react';
export default function Instruction({ navigation,route}) {
    const { IDToBeSent } = route.params;
    //const [sound, setSound] = useState();
    var InstructionContent =[
        {img:require("../../../../assets/instru6.png")},
        {img:require("../../../../assets/instru7.png")},
    ];
    const [instructionsPage,setInstructionsPage]=useState(1);
    function Content(){
if(InstructionContent[instructionsPage-1].img!='null'){
        return(
            <View style={styles.insideContainer}>
                <Image style={{height:775,width:400,padding:50}} source={InstructionContent[instructionsPage-1].img}/>
            </View>
        )
    }
}
    function instructionsPageCtrl(goTo){
        if(goTo=="Previous"){
            let prevPage=instructionsPage-1;
            if(instructionsPage>1){setInstructionsPage(prevPage)}
        }
        else{
            let nextPage=instructionsPage+1;
            if(instructionsPage<InstructionContent.length){setInstructionsPage(nextPage)}
            else {navigation.navigate('Game__',{IDToBeSent})}
        }
    }
      return (
        <View style={styles.container}>
            <View style={styles.InstructionContainer}>
                <View style={styles.insiderContainer}>
                    {Content()}
                    <View style={{ flexDirection: 'row', justifyContent: 'space-between' }}>
                  <View style={styles.PreButtonStyle}>   
                     <Button title='السابق' onPress={()=>{instructionsPageCtrl("Previous");}} color='white'></Button>
                     </View>
                        <Text style={{fontSize:13 , padding:3, color:'#979797', top:'158%' }}>{instructionsPage}/{InstructionContent.length}</Text>
                        <View style={styles.nextButtonStyle}> 
                        <Button title='التالي' onPress={()=>{instructionsPageCtrl("Next");}} color='white'></Button>
                        </View>
                        {/*ende of Button Container*/}
                        </View>
                        <View style={styles.skip}>
                        <Button title="تخطي" onPress={()=>{navigation.navigate('Game__',{IDToBeSent})} } color='#979797' style={{fontSize:4, top:'15%' }}></Button>
                        </View>
                        {/*ende of insideInstructionContainer*/}
                        </View>
                        {/*ende of instructionContainer*/}
                        </View>
                        <StatusBar style="auto" />
                        {/*ende of container*/}
                        </View>
                        );
                    }
                    const styles = StyleSheet.create({
                        container: {
                            flex: 1,
                            backgroundColor: 'rgba(1,1,1,0.1)',
                            alignItems: 'center',
                            justifyContent: 'center',
                        },
                        InstructionContainer:{ //العنوان 
                          position:'absolute',
                            alignItems: 'center',
                            backgroundColor:'white',
                            fontWeight:'bold',
                            color:'#4C5784',
                            width:'100%',
                            height:'94.3%',
                            top:30
                        },
                        insiderContainer:{//حق البوتنز
                            alignItems: 'center',
                            backgroundColor:'white',
                            top:10,
                            width:'100%',
                            height:205
                          },
                          skip:{
                            top:'279.5%',
                          },
                            insideContainer:{
                                alignItems: 'center',
                                backgroundColor:'white',
                                height:'70%',
                                
                                width:'100%',
                                padding:1,
                            },
                          InstructionContentStyle:{
                            textAlign:'center',
                            color:'#4C5784',
                          padding:5,
                          top:39,
                          width:'100%',
                          height:'40%',

                          },
                          PreButtonStyle:{
                            borderColor:'#6F97B1',
                            borderRadius:50,
                            backgroundColor:'#6F97B1',
                            margin:3,
                            top:'154%',
                            width:90,
                            right:20,
                            
                          },
                          nextButtonStyle:{
                            borderColor:'#6F97B1',
                            borderRadius:50,
                            backgroundColor:'#6F97B1',
                            margin:3,
                            top:'154%',
                            width:90,
                            left:20,
                            
                          }
                        });