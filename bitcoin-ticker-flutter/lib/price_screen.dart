import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  double coinLastPrice = 0.0; 

  androidDropdown() {
    List<DropdownMenuItem<String>> dropdownList = [];

    for (String currency in currenciesList) {
      var getCoincureency = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownList.add(getCoincureency);
    }

    return DropdownButton(
      value: selectedCurrency,
      hint: Text(selectedCurrency),
      items: dropdownList,
      onChanged: (value) {
        setState(() {});
        selectedCurrency = value;
      },
    );
  }

  iOSPickerItem() {
    List<Text> pickerItem = [];
    for (String currency in currenciesList) {
      pickerItem.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 40.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          CoinData().getCoinPrice().then((value) async{ 
            // coinLastPrice = value['last'];
            print(value);
          });
        });
      },
      children: pickerItem,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CoinButton(
                coinPrice: '1 BTC = $coinLastPrice $selectedCurrency',
              ),
              CoinButton(
                coinPrice: '1 ETH = ? $selectedCurrency',
              ),
              CoinButton(
                coinPrice: '1 LTC = ? $selectedCurrency',
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid ? androidDropdown() : iOSPickerItem(),
          ),
        ],
      ),
    );
  }
}

class CoinButton extends StatelessWidget {
  String coinPrice;

  CoinButton({Key key, this.coinPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            coinPrice,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
