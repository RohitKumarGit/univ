import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showFilters(BuildContext context, Widget child) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Text(
                'Filters',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            child,
          ],
        ),
      );
    },
  );
}

class FilterConf {
  const FilterConf({
    this.value,
    this.icon,
    this.title,
  });

  final Object value;
  final IconData icon;
  final String title;
}

class FiltersList extends StatelessWidget {
  const FiltersList({
    @required this.filters,
    @required this.selectedFilter,
    @required this.onTap,
  });

  final List<FilterConf> filters;
  final Object selectedFilter;
  final Function(Object) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: filters.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade100,
          ),
          child: GestureDetector(
            onTap: () => onTap(filters[i].value),
            child: ListTile(
              leading: FaIcon(filters[i].icon),
              title: Text(
                filters[i].title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Radio<Object>(
                value: filters[i].value,
                groupValue: selectedFilter,
                onChanged: onTap,
              ),
            ),
          ),
        );
      },
      padding: const EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
