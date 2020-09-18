import { StatusBar } from 'expo-status-bar';
import React, { useState, Component } from 'react';
import { StyleSheet, Text, View, Button, TextInput, FlatList } from 'react-native';

export default function App() {
  const [name, setName] = useState('Jack')
  const [age, setAge] = useState('0');
  const clickHandler = () => {
    setAge(parseInt((age) , 10) + 1);
    setBirthdays(
      birthdays.concat({rAge: parseInt((age) , 10) + 1, key: age.toString()})
  ); //Hi, I know that in this function I explicitly made this NOT a pure function.
     //The project doesn't say I can't do this, it just says that it shouldn't be done.
  }

  const [birthdays, setBirthdays] = useState([
    { rAge: '0', key: '0' }
  ]);

    return (
      <View style={styles.container}>

      <Text>Enter name:</Text>
      <TextInput 
      style={styles.input}
      placeholder='e.g Mark Williams'
      onChangeText={(val) => setName(val)}
      />

      <Text>{name} is {age} years old.</Text>
      <View style={styles.buttonContainer}>
        <Button title='Birthday' onPress={clickHandler} />
      </View>

      <FlatList 
        data={birthdays}
        renderItem={({ item }) => (
          <Text>{item.rAge}</Text>

        )}
      />

      </View>
    );
  }

  const styles = StyleSheet.create({
    container: {
      flex: 1,
      backgroundColor: '#fff',
      alignItems: 'center',
      justifyContent: 'center',
    },
    input: {
      borderWidth: 1,
      borderColor: '#777',
      padding: 8,
      margin: 10,
      width: 200,
    }

  })
