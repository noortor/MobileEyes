import 'package:meta/meta.dart';

class Item {
  int id;
  String name;
  String purpose;
  String description;
  String address;
  String distance;
  DateTime time;
  List tags;
  bool isGoing;

  Item({
    @required this.id,
    @required this.name,
    @required this.purpose,
    @required this.description,
    @required this.address,
    @required this.time,
    @required this.tags,
    @required this.isGoing,
    this.distance,
  });
}

List<Item> _itemList = [
  Item(
    id: 0,
    name: 'March For Justice (#blm)',
    address: '803 Mt Vernon Pl NW, D.C., 20010',
    purpose: 'Creating an equal world for all people.',
    description:
        """Black Lives Matter (BLM) is a decentralized movement advocating for non-violent civil disobedience in protest against incidents of police brutality and all racially motivated violence against Black people. While Black Lives Matter can primarily be understood as a decentralized social movement, an organization known simply as Black Lives Matter[a] exists as a decentralized network with about 16 chapters in the United States and Canada. The broader movement and its related organizations typically advocate against police violence towards black people, as well as for various other policy changes considered to be related to black liberation.""",
    distance: '0.2mi',
    time: DateTime.fromMillisecondsSinceEpoch(1597420800000),
    tags: ['blm', 'racialjustice'],
    isGoing: false,
  ),
  Item(
      id: 1,
      name: 'Climate Strike (#climatechange)',
      description:
          """Throughout the week, activists around the world will be tackling localized climate issues, such as protesting pipeline expansions and highlighting the political influence of the fossil fuel industry. Check out globalclimatestrike.net for more information and for a list of events across the world. Organizers are hoping that this could be the largest global climate demonstration ever.

This walk-out comes on the heels of mounting youth leadership in the climate change movement. The world is currently home to the largest generation of young people in history, and they’re standing up for their future by organizing collective action. The urgency they bring to the debate is targeted at big businesses and politicians, many of which are not only contributing to the problem, but are also hindering the solution.

Greta Thunberg, the 16-year-old Swedish activist who started demanding political action by skipping school and protesting at the Swedish parliament, has been one of the key faces of the sweeping, youth-oriented climate change movement. A demonstration in May spanned 2,300 schools in more than 150 countries. This Global Climate Strike is just the next step for mobilization in a growing movement for change.""",
      distance: '0.5mi',
      address: '1600 Pennsylvania Ave, D.C., 20500',
      purpose: 'Saving the planet for future generations.',
      time: DateTime.fromMillisecondsSinceEpoch(1597606200000),
      tags: ['climatechange', 'environment'],
      isGoing: false),
  Item(
    id: 2,
    name: 'AUHSD School District Protest (#equity)',
    address: '15 Shoreline Hwy, Bethesda, MD, 20588',
    description:
        """Most districts in Orange County are still deciding on how to reopen their schools for the fall semester. Some, like Tustin Unified, are offering parents the option to decide between fully online learning or a hybrid model that would combine some in-person instruction with distance learning. Others are waiting for further guidance from health officials.

Even without a final decision, some school districts on Tuesday said that even if campuses either fully or partially reopen, they won't return without requiring masks and social distancing, despite the Board's guidance""",
    purpose: 'Bring equity for all students.',
    distance: '1.1mi',
    time: DateTime.fromMillisecondsSinceEpoch(1597939200000),
    tags: ['equity', 'educationrights', 'history'],
    isGoing: false,
  ),
  Item(
      id: 3,
      name: 'Immigration Action Now! (#equalrights)',
      description:
          """The U.S Supreme Court (SCOTUS) has ruled on the Deferred Action for Childhood Arrivals (DACA) program. While SCOTUS allowed DACA to continue, the Administration can still attempt to end DACA at a later date. As a result, DACA immigrant youth are safe for now, but could be at risk for deportation in the future. We must not allow this to happen.

Most DACA recipients have spent the majority of their lives in the U.S., many have families, and all of them contribute to American society as taxpayers, consumers, and community members. Additionally, there are 62,000 DACA-eligible healthcare workers involved in the COVID-19 response.

The U.S. House of Representatives passed the American Dream and Promise Act, H.R. 6, one year ago. H.R. 6 would give a path to citizenship for Dreamers. Now, in the wake of SCOTUS’ ruling, the U.S. Senate must act in order to protect Dreamers from the risk of deportation and family separation. The USCCB supports the DREAM Act, which includes a path to citizenship, and sent a letter to each Senator asking that they the support S. 874, the DREAM Act of 2019. Additionally, USCCB supports efforts to introduce a Senate companion to H.R. 6 as well.""",
      purpose: 'Build bridges, not walls!',
      distance: '1.1mi',
      address: '2071 Wilson St, DC, 20511',
      time: DateTime.fromMillisecondsSinceEpoch(1598135400000),
      tags: ['equalrights', 'immigration'],
      isGoing: false),
];

List<Item> getItemList() {
  return _itemList;
}
