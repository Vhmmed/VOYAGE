import 'package:flutter/material.dart';
import 'package:voyga/core/constants/app_theme.dart';
import 'package:voyga/features/trip_planner/data/trip_planner_data.dart';

class LuminaAssistantCard extends StatelessWidget {
  const LuminaAssistantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Lumina Assistant',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    'ALWAYS READY',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          ...chatMessages.map((msg) {
            final bool isUser = msg.role == 'user';
            return Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                left: isUser ? 40 : 0,
                right: isUser ? 0 : 40,
              ),
              child: Align(
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: isUser
                        ? AppTheme.primaryBlue
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16).copyWith(
                      bottomLeft: isUser
                          ? const Radius.circular(16)
                          : Radius.zero,
                      bottomRight: isUser
                          ? Radius.zero
                          : const Radius.circular(16),
                    ),
                    boxShadow: isUser
                        ? []
                        : AppTheme.cardShadow,
                  ),
                  child: _buildMessageText(msg.text, isUser),
                ),
              ),
            );
          }),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ask about flights...',
                      hintStyle:
                          TextStyle(fontSize: 13, color: AppTheme.greyText),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(
                    color: AppTheme.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageText(String text, bool isUser) {
    if (isUser) {
      return Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      );
    }

    final style = const TextStyle(
      fontSize: 13,
      color: AppTheme.darkText,
    );
    final boldStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: AppTheme.primaryBlue,
    );

    final regex = RegExp(r'(\d{1,3}(?:,\d{3})* EGP)');
    final spans = <InlineSpan>[];
    int lastEnd = 0;

    for (final match in regex.allMatches(text)) {
      if (match.start > lastEnd) {
        spans.add(TextSpan(
            text: text.substring(lastEnd, match.start), style: style));
      }
      spans.add(TextSpan(text: match.group(0), style: boldStyle));
      lastEnd = match.end;
    }
    if (lastEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastEnd), style: style));
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}
