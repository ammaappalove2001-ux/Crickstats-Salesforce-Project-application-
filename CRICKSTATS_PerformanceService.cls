public with sharing class CRICKSTATS_PerformanceService {
    public static void validate(List<Match_Performance__c> records) {
        for (Match_Performance__c r : records) {
            Decimal overs = r.Overs_Bowled__c == null ? 0 : r.Overs_Bowled__c;
            Decimal wickets = r.Wickets_Taken__c == null ? 0 : r.Wickets_Taken__c;
            Decimal runs = r.Runs_Scored__c == null ? 0 : r.Runs_Scored__c;
            Decimal balls = r.Balls_Faced__c == null ? 0 : r.Balls_Faced__c;

            if (overs > 0 && wickets == 0 && r.Runs_Conceded__c == null) {
                r.Runs_Conceded__c = 0;
            }
            if (balls == 0 && runs > 0) {
                r.addError('Balls Faced must be greater than zero when Runs Scored is entered.');
            }
            if (wickets > 0 && overs == 0) {
                r.addError('Overs Bowled must be greater than zero when Wickets Taken is entered.');
            }
        }
    }
}
