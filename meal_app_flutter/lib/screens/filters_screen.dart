import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegeterian'];
    super.initState();

  }

  Widget _buildSwitchListTitle
    (
    String title, 
    String description, 
    bool currentValue, 
    Function updateValue
    ) 
  {
    return SwitchListTile(
      value: currentValue,
      title: Text(title), 
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan' : _vegan,
                'vegeterian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
              
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  'Gluten-free', 
                  'Only include gluten-free meals', 
                  _glutenFree, 
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      }
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Lactose-free', 
                  'Only include lactose-free meals', 
                  _lactoseFree, 
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      }
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegan', 
                  'Only include vegan meals', 
                  _vegan, 
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      }
                    );
                  },
                ),
                _buildSwitchListTitle(
                  'Vegeterian', 
                  'Only include vegeterian meals', 
                  _vegetarian, 
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      }
                    );
                  },
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}