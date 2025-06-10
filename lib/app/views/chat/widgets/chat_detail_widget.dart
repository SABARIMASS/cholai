import 'package:cholai/app/app_services/chat_service.dart';
import 'package:cholai/app/core/helpers/enums.dart';
import 'package:cholai/app/core/helpers/message_status_helpers.dart';
import 'package:cholai/app/views/chat/api_data/chat_detail_api_data.dart';
import 'package:cholai/app/views/chat/api_data/send_message_api_data.dart';
import 'package:cholai/shared/app_style.dart';
import 'package:cholai/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatMessageBubble extends StatefulWidget {
  final String? message;
  final String? timestamp;
  final bool isMe;
  final MessageStatus status;
  final ChatMessage messageData;
  final Function(ChatMessage updatedMessage) updatedMessage;
  const ChatMessageBubble({
    super.key,
    required this.message,
    required this.timestamp,
    required this.isMe,
    required this.status,
    required this.messageData,
    required this.updatedMessage,
  });

  @override
  State<ChatMessageBubble> createState() => _ChatMessageBubbleState();
}

class _ChatMessageBubbleState extends State<ChatMessageBubble> {
  @override
  void initState() {
    _sendNewMessage();

    super.initState();
  }

  void _sendNewMessage() {
    if (widget.messageData.status != 'request') {
      return;
    } else {
      ChatService.sendMessageApi(
            SendMessageRequestData(
              message: widget.message,
              senderId: widget.messageData.senderId,
              receiverId: widget.messageData.receiverId,
            ),
          )
          .then((response) {
            if (response.status == 1) {
              final updatedMessage = widget.messageData.copyWith(
                status: response.data?.status ?? widget.messageData.status,
                messageId:
                    response.data?.messageId ?? widget.messageData.messageId,
              );
              widget.updatedMessage(updatedMessage);
            } else if (response.status == -1) {
            } else {
              _sendNewMessage();
            }
          })
          .onError((error, stackTrace) {
            _sendNewMessage();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    final alignment =
        widget.isMe ? Alignment.centerRight : Alignment.centerLeft;
    final color = widget.isMe ? Colors.green[300] : Colors.grey[300];
    final textColor =
        widget.isMe
            ? Theme.of(context).appTheme.kWhiteColor
            : Theme.of(context).appTheme.kBlack;

    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
            bottomLeft: Radius.circular(widget.isMe ? 8.r : 0),
            bottomRight: Radius.circular(widget.isMe ? 0 : 8.r),
          ),
        ),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth:
                      MediaQuery.of(context).size.width * 0.8, // upper limit
                ),
                child: Text(
                  widget.message ?? "",
                  style: TextStyle(
                    fontWeight: AppFontWeight.medium.value,
                    color: textColor,
                    fontSize: AppFontSize.small.value,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.timestamp ?? '',
                    style: TextStyle(
                      fontWeight: AppFontWeight.normal.value,
                      color: textColor,
                      fontSize: AppFontSize.extraSmall.value,
                    ),
                  ),
                  !widget.isMe
                      ? SizedBox.shrink()
                      : Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Icon(
                          MessageStatusHelper.getStatusIcon(widget.status),
                          size: 14.r,
                          color: MessageStatusHelper.getChatDetailStatusColor(
                            widget.status,
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
