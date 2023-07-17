import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity/InternetBlock/InternetBlock.dart';
import 'package:internet_connectivity/InternetBlock/InternetState.dart';
import 'package:internet_connectivity/cubits/internet_qubuts.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: BlocConsumer<InternetCubit, InternetStates>(
        builder: (BuildContext context, state) {
          if (state == InternetStates.Gain) {
            return const Center(
              child: Text("Intent Connect"),
            );
          } else if (state == InternetStates.Lost) {
            return const Center(
              child: Text("Internet Lost"),
            );
          } else {
            return const Center(
              child: Text("Loading...."),
            );
          }
        },
        listener: (BuildContext context, state) {
          if (state is InternetLossState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Internet Loss"),
              backgroundColor: Colors.red,
            ));
          } else if (state is InternetGainState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Loading.... "),
              backgroundColor: Colors.green,
            ));
          }
        },
      ))

          // BlocBuilder<InternetBlock, InternetState>(
          //   builder: (BuildContext context, state) {
          //     // const Center(
          //     //     child: Text("Loading...."),
          //     //   );
          //     if (state is InternetGainState) {
          //       return const Center(
          //         child: Text("Intent Connect"),
          //       );
          //     } else if (state is InternetLossState) {
          //       return const Center(
          //         child: Text("Internet Loss"),
          //       );
          //     } else {
          //       return const Center(
          //         child: Text("Loading...."),
          //       );
          //     }
          //   },
          // )
          // Center(
          //   child: Text("Loading...."),
          // ),
          ),
    );
  }
}
