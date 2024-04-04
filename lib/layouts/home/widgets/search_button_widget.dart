import 'package:flutter/material.dart';

class SearchButtonWidget extends StatefulWidget {
  const SearchButtonWidget({
    super.key,
    required this.width,
    required this.onSubmit,
  });

  final double width;
  final Function(String) onSubmit;
  @override
  State<SearchButtonWidget> createState() => _SearchButtonWidgetState();
}

class _SearchButtonWidgetState extends State<SearchButtonWidget> {
  bool _isFolded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: widget.width * 0.05,
            right: widget.width * 0.05,
            bottom: widget.width * 0.01),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _isFolded ? widget.width * 0.9 : null,
          decoration: BoxDecoration(
              color: _isFolded ? Colors.white : Colors.transparent,
              borderRadius: BorderRadius.circular(32)),
          child: _isFolded
              ? Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          onFieldSubmitted: widget.onSubmit,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: "Search Article",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.7),
                              ),
                              border: InputBorder.none,
                              enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent))),
                        ),
                      ),
                    ),
                    IconButton(
                      style: const ButtonStyle(
                        enableFeedback: false,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFolded = false;
                        });
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                )
              : IconButton(
                  style: const ButtonStyle(
                    enableFeedback: false,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFolded = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ));
  }
}
