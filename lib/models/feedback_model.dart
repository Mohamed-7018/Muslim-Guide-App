class FeedbackForm {

  String _feedback;
  String _rate;


  FeedbackForm(this._rate, this._feedback);

  // Method to make GET parameters.
  String toParams() =>
      "?rate=$_rate&feedback=$_feedback";


}