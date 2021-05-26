from django.urls import path, include

from rest_framework import serializers

# Models
from survey.models import Question, Choice, TransitFeedback, TriviaFeedback


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ("id", "question_text", "persona")


class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = ("id", "choice_text", "question_id")


class TransitSerializer(serializers.ModelSerializer):
    class Meta:
        model = TransitFeedback
        fields = ("id", "stop")


class TriviaSerializer(serializers.ModelSerializer):
    class Meta:
        model = TriviaFeedback
        fields = (
            "id",
            "choice_id",
            "question_id",
            "user_id",
            "longitude",
            "latitude",
            "other",
            "choice_text",
        )
