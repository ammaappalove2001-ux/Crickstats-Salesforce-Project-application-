@IsTest
private class CRICKSTATS_PerformanceServiceTest {
    @IsTest static void testValidPerformance() {
        Player__c p = new Player__c(Name='Test Player', Player_Number__c='7', Role__c='All Rounder');
        insert p;
        Match_Performance__c m = new Match_Performance__c(
            Name='Match 1', Player__c=p.Id, Runs_Scored__c=75, Balls_Faced__c=60,
            Fours__c=6, Sixes__c=2, Overs_Bowled__c=4, Wickets_Taken__c=2,
            Runs_Conceded__c=25, Match_Result__c='WON'
        );
        Test.startTest(); insert m; Test.stopTest();
        System.assertEquals(75, [SELECT Runs_Scored__c FROM Match_Performance__c WHERE Id=:m.Id].Runs_Scored__c);
    }

    @IsTest static void testInvalidRunsWithoutBalls() {
        Player__c p = new Player__c(Name='Test Player 2', Player_Number__c='8');
        insert p;
        Match_Performance__c m = new Match_Performance__c(
            Name='Invalid Match', Player__c=p.Id, Runs_Scored__c=10, Balls_Faced__c=0
        );
        Test.startTest();
        Database.SaveResult sr = Database.insert(m, false);
        Test.stopTest();
        System.assertEquals(false, sr.isSuccess());
    }
}
