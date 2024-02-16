import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final Widget? prefix;
  final Widget? suffix;
  final String? title;
  final String? hintText;
  final Function? onSubmitted;
  final bool? obscureText;
  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  const TextFieldWidget({super.key, this.onSubmitted, this.prefix, this.suffix, this.title, this.hintText, this.textEditingController, this.obscureText = false, this.textInputType});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

             Text(
              widget.title??' ',
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.grey4,
              ),
            ),

            TextField(
              controller: widget.textEditingController ?? TextEditingController(),
              style: const TextStyle(fontSize: 20),
              obscureText: widget.obscureText?? false,
              decoration: InputDecoration(
                  prefix: widget.prefix?? const SizedBox(),
                  suffix: widget.suffix?? const SizedBox(),
                  hintText: widget.hintText ?? ' ',
                  hintStyle: TextStyle(color: Colors.grey.shade600)),
              textInputAction: TextInputAction.next,
              keyboardType: widget.textInputType?? TextInputType.text,
              onSubmitted: (value){
                if (widget.onSubmitted != null)
                  {
                    widget.onSubmitted!();
                  }
              },
            ),
          ],
        ),
      );
    }
}
