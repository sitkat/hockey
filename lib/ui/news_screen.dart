import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hockey/theme/custom_app_bar.dart';

import '../theme/app_colors.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final List<Item> items = [
    Item(
      name:
          'WILL AN NHL TEAM GIVE COREY PERRY ANOTHER CHANCE AFTER CONTRACT TERMINATION?',
      description:
          'NHL veteran Corey Perry faced contract termination by the Chicago Blackhawks at the end of November due to unacceptable conduct violating internal policies. Following a meeting with league commissioner Gary Bettman, Perry is now eligible for a new contract with another team. Perry, 38, addressed his situation in November, acknowledging struggles with alcohol. While interest exists from various teams, potential contenders like Toronto and Edmonton may be in the mix, with mutual interest reported with the Maple Leafs. Perry, known for his gritty style, posted four goals and nine points in 16 games with Chicago this season. Despite potential risks, teams are exploring signing him, emphasizing his low-cost, veteran presence. Perry\'s performance will determine his continued presence in the league beyond this season.',
      url:
          'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAzNTYyMzY0ODc0Nzk0Njk5/usatsi_21913400_168400847_lowres.webp',
    ),
    Item(
      name: 'A Fiesty Win Against Manitoba| RECAP: MB @ LAV',
      description: 'The Laval Rocket secured a 5-2 victory against the Manitoba Moose in a weekend doubleheader at Place Bell, extending their streak to six games without a regulation loss. Coach Jean-Francois Houle welcomed two crucial additions to the roster, with Emil Heineman joining from the Montreal Canadiens\' AHL affiliate and Gabriel Bourque returning after an upper-body injury. Laval dominated the first period with three goals. Logan Mailloux initiated the scoring with a powerful shot from the blue line. Jan Mysak then doubled the lead, redirecting William Trudeau\'s shot, assisted by Jared Davidson. Arber Xhekaj set up Heineman for a one-timer during the first power play, further increasing Laval\'s lead.Manitoba responded with two power play goals in the second period, narrowing the gap. C.J. Suess capitalized on a puck dropped behind Jakub Dobes, and Brad Lambert exploited a small opening on top of the goalie\'s left shoulder. However, Lias Andersson quickly restored Laval\'s advantage.In the third period, Xavier Simoneau assisted Philippe Maillet, who skillfully maneuvered through open space for another goal, extending his point streak to six games with a total of 11 points. Facing a five-game losing streak, the Winnipeg Jets AHL affiliate struggled, unable to recover from Laval\'s early dominance. Joshua Roy, despite not scoring, showcased physicality, hit two posts, and drew a power play. Following the game, the 20-year-old Roy earned a call-up to the Montreal Canadiens.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAzNTkwNzM0NDc1OTYyMjMw/53460593979_08ca93a4d7_k.webp',
    ),
    Item(
      name: 'SIDNEY CROSBY SIGNS FIVE-YEAR CONTRACT EXTENSION WITH PITTSBURGH PENGUINS',
      description: 'Crosby, who turns 20 next month, became the NHL\'s youngest MVP since Wayne Gretzky when he was awarded the Hart Trophy last month.The three-year contract Crosby signed as a rookie lasts through the coming season. The team named Crosby the youngest captain in league history after last season, when he led the NHL with 120 points.',
      url: 'https://images.outbrainimg.com/transform/v3/eyJpdSI6IjE1MjE0NWNjMjdmNzAxNmM3NDkyNGZlN2YxMWU5NjQ1YjY5YmI4Y2Q4Zjg4NGE4MDU2N2VhMzkxMzNkYmFmZjAiLCJ3Ijo2NzUsImgiOjQ1MCwiZCI6MS41LCJjcyI6MCwiZiI6NH0.webp',
    ),
    Item(
      name: 'WHAT THE CANADIENS ARE GETTING IN JORDAN HARRIS',
      description: 'The Montreal Canadiens signed one of its top prospects, Jordan Harris, to an entry-level contract last weekend. What are the Habs getting in him? Ryan Kennedy breaks it down.',
      url: 'https://images.outbrainimg.com/transform/v3/eyJpdSI6ImE4ZTVhNzA1MTFlNjVlOWJmY2NkMjUwOTNkMjA5MGNlNDUwMDU0YjViN2ViMjc0YTNiMmM0MzJmNDdmOTg3ZmQiLCJ3Ijo2NzUsImgiOjQ1MCwiZCI6MS41LCJjcyI6MCwiZiI6NH0.webp',
    ),
    Item(
      name: 'THN ARCHIVE: ISLANDERS GOALIE TRIO OF SMITH, HRUDEY AND MELANSON WASN\'T WITHOUT ISSUES',
      description: 'The New York Islanders have a solid goaltending tandem this season in Ilya Sorokin and Semyon Varlamov. In this cover story from THN’s Jan. 13, 1984 edition (Vol. 37, Issue 15) – writer Tim Moriarty put the spotlight on the Isles’ three capable netminders: Kelly Hrudey, Billy Smith and Roland Melanson. (And this is your regular reminder – to secure full access to THN’s 76-year Archive, subscribe to the magazine by visiting THN.com/Free.) Twenty-two years old at the time of the story’s publication, Hrudey was the new kid on the block on Long Island. Melanson and Smith had already experienced success, winning the William Jennings Trophy in the 1982-83 season. Legendary Islanders coach Al Arbour had confidence in the arrangement, stating, “Why shouldn’t it work? A lot of it is psychological. If the three get it out of their minds that somebody’s making it hard for them, I don’t see why it can’t work." However, Melanson wasn’t thrilled with the three-goalie system, mentioning, “I still haven’t got the feel of things yet. There isn’t enough work for three of us and I figure a decision will have to be made soon. We can’t go into the playoffs (rotating) this way.” Hrudey, the youngest of the trio, was just happy to have an NHL job, understanding the situation his fellow goalies weren’t used to.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAzNTgzNzc2ODk3Mzc4MjM1/vol37iss15-thn-archive.webp',
    ),
    Item(
      name: 'CHICAGO BLACKHAWKS SIGN NICK FOLIGNO TO TWO-YEAR CONTRACT EXTENSION',
      description: 'The Chicago Blackhawks signed winger Nick Foligno to a two-year, \$4.5 million per year contract extension starting next season. Currently on a \$4 million one-year deal, the 36-year-old forward is sidelined with a fractured finger. Despite the injury, Foligno has contributed with eight goals, nine assists, and 17 points in 39 games this season. His increased ice time and leadership role make him a valuable asset for the team, which is in a rebuilding phase. Blackhawks GM Kyle Davidson praised Foligno\'s impact on and off the ice, emphasizing his work ethic and versatility. The team, with ample salary cap space, views Foligno as a key leadership piece.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAzNTgxMDAyMzQ4NTA1MDE5/usatsi_22229957_168400847_lowres.webp',
    ),
    Item(
      name: 'INSTANT REACTION: NHL CENTRAL SCOUTING MID-TERM DRAFT RANKINGS',
      description: 'The NHL\'s Central Scouting bureau has released its mid-term rankings, breaking up 2024 hopefuls into four categories: North American skaters and goalies and International skaters and goalies.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAxNzY5NTM1NzM1MzQyNzM1/celebrinimacklin2425.webp',
    ),
    Item(
      name: 'THE HOCKEY NEWS\' NHL TEAM VALUATIONS BY W. GRAEME ROUSTAN',
      description: 'In my recent NHL team valuations, drawing from my experience in the 2023 Ottawa Senators sale process, I emphasize that Forbes or Sportico valuation numbers are irrelevant in determining a franchise\'s sale price. The sale process relies on who is willing to pay the most, with no fixed financial formula like EBITDA multiples. The Ottawa Senators\' sale, led by Salvatore \'Sal\' Galatioto, involved a straightforward auction process, where the estate of Eugene Melnyk communicated a minimum acceptable price. Negotiation was absent, as multiple buyers were prepared to surpass the specified amount. Gary Bettman acknowledges the value of such valuations lies in recognizing the league\'s stature rather than predicting immediate franchise sales.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MTk5MDE3NTk1MDMzMTAyMDk3/usatsi_20310874.webp',
    ),
    Item(
      name: 'SHOULD THE CALGARY FLAMES ATTEMPT TO TRADE JACOB MARKSTROM?',
      description: 'Playoff contenders like the Hurricanes, Avalanche, Oilers, Kings, Devils, and Maple Leafs face goaltending concerns, leading to speculation about potential upgrades. Jacob Markstrom, despite struggles in 2022-23, has rebounded this season. The Flames, hovering around the wild-card spot, could capitalize on Markstrom\'s resurgence, aligning with their goalie succession plan by promoting Dustin Wolf. Sportsnet lists Markstrom as a trade candidate, citing challenges like his \$6-million cap hit and a full no-movement clause. Moving him before the March 8 deadline seems unlikely, but a post-season trade or an offseason move may be possible if cap constraints are eased.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAzNTc4MTgyNzAyNDc1MTk1/usatsi_22272653_168400847_lowres.webp',
    ),
    Item(
      name: 'THE HOCKEY NEWS ACTION SHOW: NHL BETTING FOR JAN. 11, 2023',
      description: 'The Hockey News Action Show with hosts Jacob Stoller and George Nassios. Jacob and George bring out the statistics and insights to consider ahead of placing bets on Thursday\'s games, including a game-by-game preview and player props. As always, please play responsibly and set limits.',
      url: 'https://thehockeynews.com/.image/c_limit%2Ccs_srgb%2Cq_auto:good%2Cw_700/MjAxMjU3NDkxMzQ0OTI1OTY3/usatsi_18159729_168400847_lowres.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, 'Actualités'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailsScreen(item: items[index]),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.surface2,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(items[index].url),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 90,
                            width: 90,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  items[index].name ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  items[index].description ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: AppColors.whiteWithOpacity,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NewsDetailsScreen extends StatelessWidget {
  final Item item;

  NewsDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: AppColors.accent,
          onPressed: () {
            Navigator.pop(context, 'NewsScreen');
          },
        ),
        title: Text(
          'All news',
          style: TextStyle(color: AppColors.accent, fontSize: 13.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(item.url),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 200,
              ),
              SizedBox(height: 35),
              Text(
                item.name ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 25),
              Text(
                item.description ?? '',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.whiteWithOpacity,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item {
  final String name;
  final String description;
  final String url;

  Item({
    required this.name,
    required this.description,
    required this.url,
  });
}
