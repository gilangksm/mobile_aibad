import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build (
      token: '<API>',
      baseOption: HttpSetup (
      receiveTimeout: const Duration (seconds: 20),
      connectTimeout: const Duration (seconds: 20)),
      isLog: true);

  Future<String?> getResponse(String message) async {
    try {
      final request = ChatCompleteText (
          messages: [
            {"role": "system", "content": 'Halo, aku AIBAD, senang bisa bertemu denganmu '},
            {"role": "system", "content": 'Ada yang bisa aku bantu?'},
      ], maxToken: 200, model: ChatModel.gptTurbo0301);

      final response = await openAI.onChatCompletion(request: request);
      if (response != null) {
        return response.choices[0].message?.content.trim();
      }

      return 'Some thing went wrong';
    } catch (e) {
      return "Maaf Kita Lagi Offline :')";
    }
  }

  void dispose() {
    openAI.close();
  }
}
