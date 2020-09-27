import React, { useState } from 'react';
import * as Font from 'expo-font';
import { AppLoading } from 'expo';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import Navigator from './routes/homeStack'

const getFonts = () => {
  return Font.loadAsync({
    'nunito-regular': require('./assets/fonts/Nunito-Regular.ttf'),
    'nunito-bold': require('./assets/fonts/Nunito-Bold.ttf')
  })
}

export default function App() {
  const [fontsLoaded, setFontsLoaded] = useState(false);

  if(fontsLoaded){
    return (
      <Navigator />
    );
  } else {
    <AppLoading
    startAsync={getFonts}
    onFinish={()=> setFontsLoaded(true)}
    />
  }

  return (
      <NavigationContainer>
          <Navigator />
      </NavigationContainer>
  );
};
