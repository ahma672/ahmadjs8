import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user_profile.dart';
import '../models/template.dart';
import '../models/bio_link_project.dart';
import '../models/ai_assistant.dart';

// ============================================================================
// AUTH STATE NOTIFIER
// ============================================================================

class AuthStateNotifier extends StateNotifier<UserProfile?> {
  AuthStateNotifier() : super(null);

  void login(UserProfile user) {
    state = user;
  }

  void logout() {
    state = null;
  }

  void updateProfile(UserProfile user) {
    state = user;
  }

  void setAdminStatus(bool isAdmin) {
    if (state != null) {
      state = state!.copyWith(isAdmin: isAdmin);
    }
  }

  void setPremiumStatus(bool isPremium) {
    if (state != null) {
      state = state!.copyWith(isPremium: isPremium);
    }
  }

  void setPaymentStatus(String status) {
    if (state != null) {
      state = state!.copyWith(paymentStatus: status);
    }
  }
}

// ============================================================================
// TEMPLATE STATE NOTIFIER
// ============================================================================

class TemplateStateNotifier extends StateNotifier<List<Template>> {
  TemplateStateNotifier() : super(predefinedTemplates);

  void addCustomTemplate(Template template) {
    state = [...state, template];
  }

  void removeTemplate(String templateId) {
    state = state.where((t) => t.id != templateId).toList();
  }

  void updateTemplate(Template template) {
    state = [
      for (final t in state)
        if (t.id == template.id) template else t
    ];
  }
}

// ============================================================================
// SELECTED TEMPLATE NOTIFIER
// ============================================================================

class SelectedTemplateNotifier extends StateNotifier<Template?> {
  SelectedTemplateNotifier() : super(null);

  void selectTemplate(Template template) {
    state = template;
  }

  void clearSelection() {
    state = null;
  }
}

// ============================================================================
// SELECTED CATEGORY NOTIFIER
// ============================================================================

class SelectedCategoryNotifier
    extends StateNotifier<TemplateCategory?> {
  SelectedCategoryNotifier() : super(null);

  void selectCategory(TemplateCategory category) {
    state = category;
  }

  void clearCategory() {
    state = null;
  }
}

// ============================================================================
// PROJECT STATE NOTIFIER
// ============================================================================

class ProjectStateNotifier extends StateNotifier<BioLinkProject?> {
  ProjectStateNotifier() : super(null);

  void createProject(BioLinkProject project) {
    state = project;
  }

  void updateProject(BioLinkProject project) {
    state = project;
  }

  void updateSocialLinks(List<SocialLink> socialLinks) {
    if (state != null) {
      state = state!.copyWith(socialLinks: socialLinks);
    }
  }

  void updateElementStyle(UIElementStyle style) {
    if (state != null) {
      state = state!.copyWith(elementStyle: style);
    }
  }

  void updateBackground(CanvasBackground background) {
    if (state != null) {
      state = state!.copyWith(background: background);
    }
  }

  void publishProject() {
    if (state != null) {
      state = state!.copyWith(
        isPublished: true,
        updatedAt: DateTime.now(),
      );
    }
  }

  void clearProject() {
    state = null;
  }
}

// ============================================================================
// USER PROJECTS LIST NOTIFIER
// ============================================================================

class UserProjectsNotifier extends StateNotifier<List<BioLinkProject>> {
  UserProjectsNotifier() : super([]);

  void addProject(BioLinkProject project) {
    state = [...state, project];
  }

  void removeProject(String projectId) {
    state = state.where((p) => p.id != projectId).toList();
  }

  void updateProject(BioLinkProject project) {
    state = [
      for (final p in state)
        if (p.id == project.id) project else p
    ];
  }

  void setProjects(List<BioLinkProject> projects) {
    state = projects;
  }
}

// ============================================================================
// AI ASSISTANT STATE NOTIFIER
// ============================================================================

class AIAssistantNotifier extends StateNotifier<AIAssistantState> {
  AIAssistantNotifier() : super(const AIAssistantState());

  void addMessage(AIMessage message) {
    state = state.copyWith(
      messages: [...state.messages, message],
    );
  }

  void clearMessages() {
    state = state.copyWith(messages: []);
  }

  void setAudioState(AudioProcessingState audioState) {
    state = state.copyWith(audioState: audioState);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setErrorMessage(String? error) {
    state = state.copyWith(errorMessage: error);
  }

  void updateAudioAmplitude(double amplitude) {
    state = state.copyWith(currentAudioAmplitude: amplitude);
  }

  void resetState() {
    state = const AIAssistantState();
  }
}

// ============================================================================
// RIVERPOD PROVIDERS
// ============================================================================

/// Current authenticated user
final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, UserProfile?>((ref) {
  return AuthStateNotifier();
});

/// All available templates (predefined + custom)
final templateListProvider =
    StateNotifierProvider<TemplateStateNotifier, List<Template>>((ref) {
  return TemplateStateNotifier();
});

/// Currently selected template
final selectedTemplateProvider =
    StateNotifierProvider<SelectedTemplateNotifier, Template?>((ref) {
  return SelectedTemplateNotifier();
});

/// Currently selected template category for filtering
final selectedCategoryProvider =
    StateNotifierProvider<SelectedCategoryNotifier, TemplateCategory?>((ref) {
  return SelectedCategoryNotifier();
});

/// Filtered templates based on selected category
final filteredTemplatesProvider = Provider<List<Template>>((ref) {
  final allTemplates = ref.watch(templateListProvider);
  final selectedCategory = ref.watch(selectedCategoryProvider);

  if (selectedCategory == null) {
    return allTemplates;
  }

  return allTemplates
      .where((template) => template.category == selectedCategory)
      .toList();
});

/// Current project being edited
final currentProjectProvider =
    StateNotifierProvider<ProjectStateNotifier, BioLinkProject?>((ref) {
  return ProjectStateNotifier();
});

/// List of all user's projects
final userProjectsProvider =
    StateNotifierProvider<UserProjectsNotifier, List<BioLinkProject>>((ref) {
  return UserProjectsNotifier();
});

/// AI Assistant conversation state
final aiAssistantProvider =
    StateNotifierProvider<AIAssistantNotifier, AIAssistantState>((ref) {
  return AIAssistantNotifier();
});

/// Computed provider: Current user's premium status
final isPremiumUserProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateProvider);
  return user?.isPremium ?? false;
});

/// Computed provider: Current user's admin status
final isAdminUserProvider = Provider<bool>((ref) {
  final user = ref.watch(authStateProvider);
  return user?.isAdmin ?? false;
});

/// Computed provider: Current project's social links
final currentProjectSocialLinksProvider = Provider<List<SocialLink>>((ref) {
  final project = ref.watch(currentProjectProvider);
  return project?.socialLinks ?? [];
});
