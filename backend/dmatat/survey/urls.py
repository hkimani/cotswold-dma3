from django.urls import path, include
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register(r"questions", views.QuestionViewSet, basename="questions")
router.register(
    r"split/questions", views.SplitQuestionViewset, basename="split/questions"
)
router.register(r"choices", views.ChoiceViewSet, basename="choices")
router.register(
    r"related/choices", views.RelatedChoiceViewSet, basename="related/choices"
)
router.register(r"transit", views.TransitViewSet, basename="transit")
router.register(r"trivia", views.TriviaViewSet, basename="trivia")
router.register(r"all/trivia", views.CustomTriviaViewSet, basename="all/trivia")
router.register(r"summaries", views.SummariesViewSet, basename="summaries")

# Semantic anlysis
# router.register(r"trivia/analysis", views.SemanticAnalysis, basename="trivia/analysis")

urlpatterns = [
    path("trivia/analysis/", views.SemanticAnalysis.as_view(), name="analysis")
]
urlpatterns += router.urls
