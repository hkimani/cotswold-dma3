import re

# DRF
from rest_framework import viewsets
from rest_framework.generics import GenericAPIView
from rest_framework.response import Response
from rest_framework.permissions import AllowAny, IsAuthenticated

# Models
from .models import Question, Choice, TransitFeedback, TriviaFeedback

# serializers
from .serializers import (
    QuestionSerializer,
    ChoiceSerializer,
    TransitSerializer,
    TriviaSerializer,
)

# Natural Language processing (NLP). NLTK: Natural language toolkit
from textblob import TextBlob  # type: ignore
from nltk.corpus import stopwords
import nltk

# ... ensure stopwords package is always installed
nltk.download("stopwords")


class QuestionViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all().order_by("id")
    serializer_class = QuestionSerializer

    # permission_classes = [permissions.IsAdminUser]
    # authentication_classes = [SessionAuthentication, TokenAuthentication]

    def list(self, request, pk=None):
        serializer = self.serializer_class(self.queryset, many=True)
        return Response({"count": self.queryset.count(), "result": serializer.data})


class SplitQuestionViewset(viewsets.ModelViewSet):
    queryset = Question.objects.all().order_by("id")
    serializer_class = QuestionSerializer

    def list(self, request, pk=None):
        # d_sh = disability and sexual harasment
        # sh = sexual harasment
        # d = disability

        dsh = self.queryset.filter(persona=21)
        sh = self.queryset.filter(persona=22)
        d = self.queryset.filter(persona=23)

        return Response(
            {
                "dsh": self.serializer_class(dsh, many=True).data,
                "sh": self.serializer_class(sh, many=True).data,
                "d": self.serializer_class(d, many=True).data,
            }
        )


class ChoiceViewSet(viewsets.ModelViewSet):
    queryset = Choice.objects.all().order_by("id")
    serializer_class = ChoiceSerializer


class RelatedChoiceViewSet(viewsets.ModelViewSet):
    queryset = Choice.objects.all().order_by("id")
    trivia_queryset = TriviaFeedback.objects.all().order_by("id")
    serializer_class = ChoiceSerializer
    trivia_serializer = TriviaSerializer

    def list(self, request, pk=None):

        # Check if query parameter exists
        try:
            qid = request.GET["qid"]
        except Exception as e:
            return Response(status=400, data="Invalid query")

        # Check if query parameter is valid
        if not qid.isnumeric():
            return Response(status=400, data="Invalid query")

        choice_queryset = self.queryset.filter(question=qid)

        # Get related results
        trivia_queryset = self.trivia_queryset.filter(question=qid).select_related(
            "choice"
        )
        trivia_serializer = self.trivia_serializer(trivia_queryset, many=True)

        serializer = self.serializer_class(choice_queryset, many=True)
        return Response(
            {
                "count": choice_queryset.count(),
                "choices": serializer.data,
                "trivia": trivia_serializer.data,
            }
        )


class TransitViewSet(viewsets.ModelViewSet):
    queryset = TransitFeedback.objects.all().order_by("id")
    serializer_class = TransitSerializer


class TriviaViewSet(viewsets.ModelViewSet):
    queryset = TriviaFeedback.objects.all().order_by("id")
    serializer_class = TriviaSerializer


class CustomTriviaViewSet(viewsets.ModelViewSet):
    queryset = TriviaFeedback.objects.all().order_by("id")
    serializer_class = TriviaSerializer

    def list(self, request, pk=None):
        data = self.serializer_class(self.queryset, many=True).data

        return Response(
            {
                "count": self.queryset.count(),
                "results": data,
            }
        )


class SummariesViewSet(viewsets.ModelViewSet):
    queryset = Question.objects.all().order_by("id")
    serializer_class = QuestionSerializer
    trivia_queryset = TriviaFeedback.objects.all().order_by("id")
    trivia_serializer = TriviaSerializer

    def list(self, request, pk=None):
        question_count = self.queryset.count()
        trivia_count = self.trivia_queryset.count()

        # Get number of responses by people who've experienced sexual harassment
        sh_questions = self.queryset.filter(persona=22)
        sh_responses = self.trivia_queryset.filter(question__in=sh_questions)
        sh_responses_count = sh_responses.count()

        # Get number of responses by people living with disability
        d_questions = self.queryset.filter(persona=23)
        d_responses = self.trivia_queryset.filter(question__in=d_questions)
        d_responses_count = d_responses.count()

        # Get number of responses from both people living with disabilities and have experienced sexual harassment
        dsh_questions = self.queryset.filter(persona=21)
        dsh_responses = self.trivia_queryset.filter(question__in=dsh_questions)
        dsh_responses_count = dsh_responses.count()

        # Choices related to age
        choice_queryset = Choice.objects.all().order_by("id").filter(question=1)
        choices = ChoiceSerializer(choice_queryset, many=True).data

        # persons with disability data (Age)
        d_trivia_data = self.trivia_serializer(d_responses, many=True).data

        # Sexual harassment data (Age)
        sh_trivia_data = self.trivia_serializer(sh_responses, many=True).data

        return Response(
            {
                "question_count": question_count,
                "trivia_count": trivia_count,
                "sh_count": sh_responses_count,
                "d_count": d_responses_count,
                "dsh_count": dsh_responses_count,
                "d_trivia_data": {"choices": choices, "trivia": d_trivia_data},
                "sh_trivia_data": {"choices": choices, "trivia": sh_trivia_data},
            }
        )


class SemanticAnalysis(GenericAPIView):
    permission_classes = [AllowAny]

    def post(self, request):
        """Polarity:  1 means positive statement and -1 means negative """
        """Subjectivity: 1 means highly subjective """

        # Extract comments
        comments = request.data["comments"]

        # A set of stopwords to remove
        stop_words = stopwords.words("english")

        # Remove stopwords from the sentence
        comments = [word for word in comments.split() if word not in stop_words]

        # Remove special characters from the token list
        token_list = [re.sub("[^a-zA-Z0-9]+", "", char) for char in comments]

        # join the array
        comments = " ".join(comments)

        # Process comments
        blob = TextBlob(comments)

        processed = []

        # Get result for each comment
        for sentence in blob.sentences:
            processed.append(
                {
                    "sentence": sentence.__str__(),
                    "polarity": sentence.sentiment.polarity,
                    "subjectivity": sentence.sentiment.subjectivity,
                }
            )

        return Response(
            {
                # "processed": processed,  # Sentences and corresponding sentiment analysis
                "tokens": token_list,
                "sentiment": {
                    "polarity": blob.sentiment.polarity,
                    "subjectivity": blob.sentiment.subjectivity,
                },
            }
        )
