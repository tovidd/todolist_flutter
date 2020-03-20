import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/countries.dart';

class InputPhoneScreen extends StatefulWidget {
  static const routeName = '/input_phone';

  @override
  _InputPhoneScreenState createState() => _InputPhoneScreenState();
}

class _InputPhoneScreenState extends State<InputPhoneScreen> {
  Country _selectedCountry = CountryPickerUtils.getCountryByPhoneCode('62');
  bool isOnChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          SizedBox(height: 300, width: 10),
          flag(context),
          SizedBox(width: 20),
          Expanded(
            child: textField('Masukkan nomor Mums', '0'),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  flag(BuildContext context) {
    void show() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (_) => _bottomSheet(context, 'Hari Perkiraan Lahir'),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: GestureDetector(
//        onTap: _openMyCountryPickerDialog,
        onTap: () => show(),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: _buildMyDialogItem(_selectedCountry),
        ),
      ),
    );
  }

  void _openMyCountryPickerDialog() {
    showDialog(
      context: context,
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: CountryPickerDialog(
          titlePadding: EdgeInsets.all(8.0),
          searchCursorColor: Colors.pinkAccent,
          searchInputDecoration: InputDecoration(hintText: 'Search...'),
          isSearchable: true,
          title: Text('Select your phone code'),
          onValuePicked: (Country country) =>
              setState(() => _selectedCountry = country),
          itemBuilder: _buildDialogItem,
          priorityList: [
            CountryPickerUtils.getCountryByIsoCode('TR'),
            CountryPickerUtils.getCountryByIsoCode('US'),
          ],
        ),
      ),
    );
  }

  Widget _buildMyDialogItem(Country country) {
    return Container(
      width: 70,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: CountryPickerUtils.getDefaultFlagImage(country),
          ),
          SizedBox(width: 8.0),
          Text('+${country.phoneCode}'),
        ],
      ),
    );
  }

  Widget _buildDialogItem(Country country) {
    return Row(
      children: <Widget>[
        CountryPickerUtils.getDefaultFlagImage(country),
        SizedBox(width: 8.0),
        Text("+${country.phoneCode}"),
        SizedBox(width: 8.0),
        Flexible(child: Text(country.name))
      ],
    );
  }

  Widget textField(String hintText, String prefixText) {
    return TextField(
      enableSuggestions: false,
      onChanged: (value) {
        setState(() {
          if (value.length <= 0 || value == null) isOnChange = false;
          isOnChange = true;
        });
      },
      style: TextStyle(fontSize: 13),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10, right: 10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey),
        hintText: isOnChange ? '' : hintText,
        fillColor: Colors.white,
        prefixText: !isOnChange ? '' : prefixText,
      ),
      inputFormatters: [],
    );
  }

  _buildSearchField() {
    return TextField(
      cursorColor: Colors.pinkAccent,
      decoration: InputDecoration(hintText: 'Cari'),
      onChanged: (String value) {
//        setState(() {
//          _filteredCountries = _allCountries
//              .where((Country country) =>
//          country.name.toLowerCase().startsWith(value.toLowerCase()) ||
//              country.phoneCode.startsWith(value) ||
//              country.isoCode.toLowerCase().startsWith(value.toLowerCase()))
//              .toList();
//        });
        print(value);
      },
    );
  }

  Widget _bottomSheet(BuildContext context, String title) {
    Widget ruler(double width) {
      return Center(
        child: Container(
          width: width,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    _buildDefaultItem(Country country) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CountryPickerUtils?.getDefaultFlagImage(country),
            SizedBox(width: 8.0, height: 40),
            Flexible(child: Text('${country?.name}  (+${country?.phoneCode})')),
          ],
        ),
      );
    }

    List<Widget> country(List<Country> countries) {
      List<Widget> list = new List<Widget>();

      for (var i = 0; i < countries.length; i++) {
        list.add(_buildDefaultItem(countries[i]));
      }
      return list;
    }

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              ruler(60),
              SizedBox(height: 3),
              ruler(40),
              SizedBox(height: 10),
              Text(
                'Pilih Negara',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildSearchField(),
              SizedBox(height: 10),
            ],
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior(),
              child: ListView(
                children: country(countryList),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
