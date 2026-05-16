import 'package:flutter/foundation.dart';

enum AudioProcessingState { idle, listening, thinking, speaking }

@immutable
class AIMessage {
  final String id;
  final String role; // 'user', 'assistant', 'system'
  final String content;
  final DateTime timestamp;
  final bool isStreaming;
  final String? audioUrl; // URL to audio response if voice enabled

  const AIMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.timestamp,
    this.isStreaming = false,
    this.audioUrl,
  });

  AIMessage copyWith({
    String? id,
    String? role,
    String? content,
    DateTime? timestamp,
    bool? isStreaming,
    String? audioUrl,
  }) {
    return AIMessage(
      id: id ?? this.id,
      role: role ?? this.role,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      isStreaming: isStreaming ?? this.isStreaming,
      audioUrl: audioUrl ?? this.audioUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isStreaming': isStreaming,
      'audioUrl': audioUrl,
    };
  }

  factory AIMessage.fromMap(Map<String, dynamic> map) {
    return AIMessage(
      id: map['id'] ?? '',
      role: map['role'] ?? 'assistant',
      content: map['content'] ?? '',
      timestamp: map['timestamp'] != null
          ? DateTime.parse(map['timestamp'] as String)
          : DateTime.now(),
      isStreaming: map['isStreaming'] ?? false,
      audioUrl: map['audioUrl'],
    );
  }

  @override
  String toString() => 'AIMessage(role: $role, content: $content)';
}

@immutable
class AIAssistantState {
  final List<AIMessage> messages;
  final AudioProcessingState audioState;
  final bool isLoading;
  final String? errorMessage;
  final double currentAudioAmplitude; // For visualizer animations
  final bool isListening;
  final bool isSpeaking;

  const AIAssistantState({
    this.messages = const [],
    this.audioState = AudioProcessingState.idle,
    this.isLoading = false,
    this.errorMessage,
    this.currentAudioAmplitude = 0.0,
    this.isListening = false,
    this.isSpeaking = false,
  });

  AIAssistantState copyWith({
    List<AIMessage>? messages,
    AudioProcessingState? audioState,
    bool? isLoading,
    String? errorMessage,
    double? currentAudioAmplitude,
    bool? isListening,
    bool? isSpeaking,
  }) {
    return AIAssistantState(
      messages: messages ?? this.messages,
      audioState: audioState ?? this.audioState,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      currentAudioAmplitude: currentAudioAmplitude ?? this.currentAudioAmplitude,
      isListening: isListening ?? this.isListening,
      isSpeaking: isSpeaking ?? this.isSpeaking,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messages': messages.map((m) => m.toMap()).toList(),
      'audioState': audioState.toString().split('.').last,
      'isLoading': isLoading,
      'errorMessage': errorMessage,
      'currentAudioAmplitude': currentAudioAmplitude,
      'isListening': isListening,
      'isSpeaking': isSpeaking,
    };
  }

  factory AIAssistantState.fromMap(Map<String, dynamic> map) {
    return AIAssistantState(
      messages: (map['messages'] as List<dynamic>?)
              ?.map((m) => AIMessage.fromMap(m as Map<String, dynamic>))
              .toList() ??
          [],
      audioState: _parseAudioState(map['audioState']),
      isLoading: map['isLoading'] ?? false,
      errorMessage: map['errorMessage'],
      currentAudioAmplitude: (map['currentAudioAmplitude'] ?? 0.0).toDouble(),
      isListening: map['isListening'] ?? false,
      isSpeaking: map['isSpeaking'] ?? false,
    );
  }

  static AudioProcessingState _parseAudioState(String? value) {
    switch (value) {
      case 'idle':
        return AudioProcessingState.idle;
      case 'listening':
        return AudioProcessingState.listening;
      case 'thinking':
        return AudioProcessingState.thinking;
      case 'speaking':
        return AudioProcessingState.speaking;
      default:
        return AudioProcessingState.idle;
    }
  }

  @override
  String toString() =>
      'AIAssistantState(messages: ${messages.length}, audioState: $audioState)';
}
