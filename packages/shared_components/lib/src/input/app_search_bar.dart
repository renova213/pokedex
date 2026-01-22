import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_components/shared_components.dart';

class AppSearchBar extends StatefulWidget {
  final String initialValue;
  final String hintText;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final Widget? prefixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final EdgeInsets padding;
  final FontStyleSize fontSize;
  final AppFontStyle placeholderStyle;
  final AppFontStyle fontStyle;

  const AppSearchBar({
    super.key,
    this.initialValue = '',
    this.hintText = 'Search',
    this.onChanged,
    this.onClear,
    this.height = 48,
    this.borderColor = Colors.black,
    this.borderRadius = 32,
    this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.fontSize = .body2,
    this.fontStyle = .regular,
    this.placeholderStyle = .light,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: Border.all(color: widget.borderColor),
        ),
        height: widget.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            12.0.imHorizontalSpace(),

            widget.prefixIcon ?? const Icon(Icons.search),

            8.0.imHorizontalSpace(),

            Expanded(
              child: SizedBox(
                height: widget.height,
                child: TextField(
                  maxLines: 1,
                  controller: _controller,
                  style: TextStyleHelper.apply(
                    size: widget.fontSize,
                    style: widget.fontStyle,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: widget.hintText,
                    hintStyle: TextStyleHelper.apply(
                      size: widget.fontSize,
                      style: widget.placeholderStyle,
                    ),
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {});
                    widget.onChanged?.call(value);
                  },
                ),
              ),
            ),

            8.0.imHorizontalSpace(),

            _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                      size: 20,
                      color: AppColors.primaryRed,
                    ),
                    onPressed: () {
                      _controller.clear();
                      widget.onClear?.call();
                      setState(() {});
                    },
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
