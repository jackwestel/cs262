import React, { useState, useEffect } from 'react';
import { StyleSheet, View, Text, TouchableOpacity, FlatList, ActivityIndicator } from 'react-native';
import { globalStyles } from '../styles/global';
import Card from '../shared/card';

export default function Home({ navigation }) {
    // const [reviews, setReviews] = useState([
    //     { title: 'Zelda, Breath of Fresh Air', rating: 5, body: 'lorem ipsum', key: '1' },
    //     { title: 'Gotta Catch Them All (again)', rating: 4, body: 'lorem ipsum', key: '2' },
    //     { title: 'Not So "Final" Fantasy', rating: 3, body: 'lorem ipsum', key: '3' },
    // ]);

const [isLoading, setLoading] = useState(true);
const [data, setData] = useState([]);

  useEffect(() => {
    fetch('https://scary-demon-02863.herokuapp.com/rjq')
        .then((response) => response.json())
        .then((json) => setData(json))
        .catch((error) => console.error(error))
        .finally(() => setLoading(false));
  });

    return (
        <View style={globalStyles.container}>
            <FlatList data={data} renderItem={({ item }) => (
                <TouchableOpacity onPress={() => navigation.navigate('ReviewDetails', item)}>
                    <Card>
                        <Text style={globalStyles.titleText}>{ item.name }</Text>
                    </Card>
                </TouchableOpacity>
            )} />
        </View>
    );
            };