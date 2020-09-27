import React, { useState } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, Button } from 'react-native';
import { globalStyles } from '../styles/global';

export default function Home({ navigation }) {
    const [reviews, setReviews] = useState([{title: 'Generic', rating: 5, body: 'lorem ipsum', key: '1'},]);


    return (
        <View style={globalStyles.container}>
            <FlatList data={reviews} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Text style={globalStyles.titleText}>{ item.title }</Text>
                    
                </TouchableOpacity>
            )} />
        </View>
    );
}
