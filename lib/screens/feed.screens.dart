import 'dart:convert';
import 'dart:io';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:untitled/apis/miscAPI.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/passenger/passenger.dart';
import 'package:untitled/models/passenger/passengerData.dart';

class FeedScreen extends HookWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // State value
    final pageValue = useState<int>(1);
    final isLoading = useState<bool>(false);
    final scrollController = useScrollController();
    final passengers = useState<List<Passenger>>([]);

    /** API Call
     *  @Function():- fetchFeedListHandler()
     *  Returns a memoized callback function
     */
    final fetchFeedListHandler = useCallback(() async {
      if (!isLoading.value) {
        MiscAPI miscAPI = MiscAPI();
        isLoading.value = true;
        var response = await miscAPI.fetchAdventure(pageValue.value);
        if (response["statusCode"] == HttpStatus.ok) {
          response = json.decode(response["responseBody"]);
          response = PassengersData.fromJson(response);
          passengers.value.addAll(response.data);
          pageValue.value = pageValue.value + 1;
        }
        isLoading.value = false;
      }
    }, [isLoading.value, pageValue.value]);

    useEffect(() {
      fetchFeedListHandler();
      return () {
        scrollController.dispose();
      };
    }, []);

    useEffect(() {
      // To check the scrollController is at the end of the screen
      scrollController.addListener(() {
        if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            !isLoading.value) {
          fetchFeedListHandler();
        }
      });
    }, [fetchFeedListHandler]);

    /*
     * @Function() Loader
     * @Return() a circularLodingIndicator
     */
    Widget buildLoader() {
      return isLoading.value
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : const SizedBox.shrink();
    }

    return SafeArea(
      child: ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < passengers.value.length) {
            final passenger = passengers.value[index];
            return SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Card(
                margin: const EdgeInsets.all(5.0),
                child: ListTile(
                  title: Text(passenger.name),
                  subtitle: Text(
                    passenger.airline[0].country,
                    style: TextStyle(color: Colors.red.shade400),
                  ),
                  trailing: Text(
                    passenger.airline[0].name,
                    style: TextStyle(color: Colors.green.shade400),
                  ),
                ),
              ),
            );
          } else if (index == passengers.value.length) {
            return buildLoader();
          }
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 0,
        ),
        itemCount: passengers.value.length + 1,
      ),
    );
  }
}
