from django.contrib.gis.db import models
from django.contrib.auth import get_user_model
from django.utils import timezone

User = get_user_model()


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    attachment = models.FileField(upload_to="questions/", null=True)
    pub_date = models.DateTimeField("date published")
    persona = models.IntegerField()

    class Meta:
        managed = False
        db_table = "questions_question"

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    points = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = "questions_choice"

    def __str__(self):
        return self.choice_text


class TriviaFeedback(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    date_added = models.DateTimeField(default=timezone.now, blank=True)
    latitude = models.CharField(default="null", max_length=200, null=True)
    longitude = models.CharField(default="null", max_length=200, null=True)
    other = models.CharField(default="null", max_length=200, null=True)
    choice_text = models.CharField(default="null", max_length=200, null=True)

    class Meta:
        verbose_name = "Trivia feedback"
        verbose_name_plural = "Trivia feedback"
        managed = False
        db_table = "questions_triviafeedback"

    def __str__(self):
        return "{} {}".format(self.question, self.choice)


TRANSIT_FEEDBACK_CHOICES = (("0", "Skip"), ("1", "Correct"), ("2", "False"))


class TransitFeedback(models.Model):
    stop = models.CharField(max_length=255)
    point = models.PointField(
        help_text="WGS 84 latitude/longitude where stop was placed"
    )
    position_correct = models.CharField(
        max_length=1,
        blank=True,
        choices=TRANSIT_FEEDBACK_CHOICES,
        help_text="Is this position accurate??",
    )
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    date_added = models.DateTimeField(default=timezone.now, blank=True)

    class Meta:
        verbose_name = "Transit feedback"
        verbose_name_plural = "Transit feedback"
        managed = False
        db_table = "questions_transitfeedback"

    def __str__(self):
        return "{} {}".format(self.stop, self.get_position_correct_display())


class LeaderBoard(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    trivia_points = models.IntegerField(default=0)
    transit_points = models.IntegerField(default=0)
    date_modified = models.DateTimeField(default=timezone.now, blank=True)

    class Meta:
        verbose_name = "Leaderboard"
        verbose_name_plural = "Leaderboards"
        managed = False
        db_table = "questions_leaderboard"