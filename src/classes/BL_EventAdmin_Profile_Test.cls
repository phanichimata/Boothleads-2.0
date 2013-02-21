Public class BL_EventAdmin_Profile_Test{
static testmethod void BL_EventAdmin_Profile_Test(){

BL_EventAdmin_ProfileCon TestCon = new BL_EventAdmin_ProfileCon();
    TestCon.Profileupdatepage();
    TestCon.BoothAction();
    TestCon.DashboardAction();
    TestCon.Reportsaction();
    TestCon.AttendeesAction();
    TestCon.EventAction();
    TestCon.checkUserId();
    TestCon.ProfileSave();
}

}