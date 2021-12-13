// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:dino_mapa/models/model_museu.dart';
import 'package:dino_mapa/ui/screens/museus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class MuseuWidget extends StatefulWidget {
  const MuseuWidget({Key? key, required this.model}) : super(key: key);

  final MuseuModel model;

  @override
  _MuseuWidgetState createState() {
    return _MuseuWidgetState();
  }
}

class _MuseuWidgetState extends State<MuseuWidget> {
  @override
  Widget build(BuildContext context) {
    var value = paddingText(widget.model);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(widget.model.exteriorColor), Color(widget.model.interiorColor)],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.model.exterior),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            height: 120,
                            width: 162,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.model.interior),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 10, right: 10),
                      child: Text(
                        widget.model.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: value),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(widget.model.exteriorColor).withOpacity(0.75),
                              Color(widget.model.interiorColor).withOpacity(0.75)
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 100,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 8.0,
                                        left: 5.0,
                                      ),
                                      child: Container(
                                        height: 20,
                                        decoration:
                                            BoxDecoration(borderRadius: BorderRadius.circular(50), color: colorForHour(widget.model)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 4.0, right: 4.0, top: 1.0, bottom: 1.0),
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                widget.model.horarioCompacto,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 8.0,
                                      left: 6.0,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        _launchCaller(widget.model.numero);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white70,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 1.0,
                                            bottom: 1.0,
                                            left: 8.3,
                                            right: 8.3,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Contactar',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 3.5,
                                              ),
                                              Icon(
                                                Icons.call,
                                                size: 14.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 8.0,
                                      left: 6.0,
                                    ),
                                    child: GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: Colors.white70,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.8, right: 10.8, top: 1.0, bottom: 1.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Direções',
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              SizedBox(
                                                width: 3.5,
                                              ),
                                              Icon(
                                                Icons.map_outlined,
                                                size: 16.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Alert(
                                          context: context,
                                          title: 'Não foi possivel encontrar direções para a morada: ' + widget.model.morada,
                                          style: AlertStyle(
                                            titleStyle: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w300,
                                                fontStyle: FontStyle.normal),
                                            isCloseButton: true,
                                            isButtonVisible: false,
                                          ),
                                        ).show();
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 8.0,
                                    left: 6.0,
                                    right: 6.0,
                                  ),
                                  child: Container(
                                    height: 20,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white70,
                                    ),
                                    child: IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: Icon(
                                        widget.model.expanded ? Icons.expand_less : Icons.expand_more_outlined,
                                        color: Colors.black,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          widget.model.expandPressed();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (widget.model.expanded)
                              Center(
                                child: renderBottom(widget.model),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  renderBottom(MuseuModel modelo) {
    return Center(
      child: Column(
        children: [
          Center(
            child: Row(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 5.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 160,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Horário:',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Center(
                            child: SizedBox(
                              height: 2,
                            ),
                          ),
                          Center(
                            child: Text(
                              modelo.horario,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 15,
                            ),
                          ),
                          Center(
                            child: Text(
                              modelo.categorias,
                              style: TextStyle(
                                fontSize: 13,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 1,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 8.0, bottom: 5.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Morada:',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 2,
                        ),
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 160,
                        ),
                        child: Text(
                          modelo.morada,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          height: 15,
                        ),
                      ),
                      Center(
                        child: Text(
                          modelo.precos,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _launchCaller(number) async {
    Alert(
      context: context,
      title: 'Não foi possível ligar para ' + number,
      style: AlertStyle(
        isCloseButton: true,
        isButtonVisible: false,
        titleStyle: const TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.w300, fontStyle: FontStyle.normal),
      ),
    ).show();
  }

  colorForHour(MuseuModel model) {
    var now = DateTime.now();
    var formatter = DateFormat('HH:mm');
    var startHour1 = model.horarioEntradaManha == null ? null : formatter.parse(model.horarioEntradaManha!);
    var finishHour1 = model.horarioSaidaManha == null ? null : formatter.parse(model.horarioSaidaManha!);
    var startHour2 = model.horarioEntradaTarde == null ? null : formatter.parse(model.horarioEntradaTarde!);
    var finishHour2 = model.horarioSaidaTarde == null ? null : formatter.parse(model.horarioSaidaTarde!);
    if (model.weekdays.contains(now.weekday)) {
      if (startHour2 == null) {
        if (now.hour >= startHour1!.hour && now.hour < finishHour1!.subtract(Duration(minutes: 30)).hour) {
          return Colors.green;
        } else {
          if (finishHour1!.subtract(Duration(minutes: 30)).hour == now.hour) {
            if (now.minute < finishHour1.subtract(Duration(minutes: 30)).minute) {
              return Colors.green;
            } else {
              if (now.minute >= finishHour1.subtract(Duration(minutes: 30)).minute) {
                if (now.hour < finishHour1.hour) {
                  return Colors.yellow;
                } else {
                  if (now.minute < finishHour1.minute) {
                    return Colors.yellow;
                  } else {
                    return Colors.red;
                  }
                }
              } else {
                return Colors.red;
              }
            }
          } else {
            if (now.hour == finishHour1.hour) {
              if (now.minute < finishHour1.minute) {
                return Colors.yellow;
              } else {
                return Colors.red;
              }
            } else {
              return Colors.red;
            }
          }
        }
      } else {
        if (now.hour >= startHour1!.hour && now.hour <= finishHour1!.hour) {
          if (now.hour >= startHour1.hour && now.hour < finishHour1.subtract(Duration(minutes: 30)).hour) {
            return Colors.green;
          } else {
            if (finishHour1.subtract(Duration(minutes: 30)).hour == now.hour) {
              if (now.minute < finishHour1.subtract(Duration(minutes: 30)).minute) {
                return Colors.green;
              } else {
                if (now.minute >= finishHour1.subtract(Duration(minutes: 30)).minute) {
                  if (now.hour < finishHour1.hour) {
                    return Colors.yellow;
                  } else {
                    if (now.minute < finishHour1.minute) {
                      return Colors.yellow;
                    } else {
                      return Colors.red;
                    }
                  }
                } else {
                  return Colors.red;
                }
              }
            } else {
              if (now.hour == finishHour1.hour) {
                if (now.minute < finishHour1.minute) {
                  return Colors.yellow;
                } else {
                  return Colors.red;
                }
              } else {
                return Colors.red;
              }
            }
          }
        } else {
          if (now.hour >= startHour2.hour && now.hour <= finishHour2!.hour) {
            if (now.hour >= startHour2.hour && now.hour < finishHour2.subtract(Duration(minutes: 30)).hour) {
              return Colors.green;
            } else {
              if (finishHour2.subtract(Duration(minutes: 30)).hour == now.hour) {
                if (now.minute < finishHour2.subtract(Duration(minutes: 30)).minute) {
                  return Colors.green;
                } else {
                  if (now.minute >= finishHour2.subtract(Duration(minutes: 30)).minute) {
                    if (now.hour < finishHour2.hour) {
                      return Colors.yellow;
                    } else {
                      if (now.minute < finishHour2.minute) {
                        return Colors.yellow;
                      } else {
                        return Colors.red;
                      }
                    }
                  } else {
                    return Colors.red;
                  }
                }
              } else {
                if (now.hour == finishHour2.hour) {
                  if (now.minute < finishHour2.minute) {
                    return Colors.yellow;
                  } else {
                    return Colors.red;
                  }
                } else {
                  return Colors.red;
                }
              }
            }
          } else {
            return Colors.red;
          }
        }
      }
    } else {
      return Colors.red;
    }
  }

  paddingText(MuseuModel model) {
    if (model.name.length > 36) {
      return 197.0;
    } else {
      return 175.0;
    }
  }
}
