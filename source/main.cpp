// run main from test

#include "testInc.h"
#include <iostream>
#include <iostream>
#include <quickfix/Application.h>
#include <quickfix/FileStore.h>
#include <quickfix/FileLog.h>
#include <quickfix/SocketInitiator.h>
#include <quickfix/SessionSettings.h>


int someNumber  {123};
int someNumber1 {-123};


class MyQuickfixApp : public FIX::Application {
    // Implement the interface methods here
    //void onCreate(const FIX::SessionID&) override {}
    //void onLogon(const FIX::SessionID&) override {}
    //void onLogout(const FIX::SessionID&) override {}
    //void toAdmin(FIX::Message&, const FIX::SessionID&) override {}
    //void fromAdmin(const FIX::Message&, const FIX::SessionID&)
        //throw(FIX::FieldNotFound, FIX::IncorrectDataFormat, FIX::IncorrectTagValue, FIX::RejectLogon) {}
    //void toApp(FIX::Message&, const FIX::SessionID&) throw(FIX::DoNotSend) {}
    //void fromApp(const FIX::Message&, const FIX::SessionID&)
        //throw(FIX::FieldNotFound, FIX::IncorrectDataFormat, FIX::IncorrectTagValue, FIX::UnsupportedMessageType) {}
};
int main()
{
    std::shared_ptr<test> lObj;
    lObj->foo();
    lObj->reverseNumber(someNumber);    // positive number
    lObj->reverseNumber(someNumber1);   // negative 

    try {
    // You will also need a configuration file (e.g., config.ini)
    FIX::SessionSettings settings("config.ini");
    //MyQuickfixApp application;
    //FIX::FileStoreFactory storeFactory(settings);
    //FIX::FileLogFactory logFactory(settings);
    //FIX::SocketInitiator initiator(application, storeFactory, settings, logFactory);
    //initiator.start();
    std::cout << "QuickFIX application started. Press any key to stop." << std::endl;
    //std::cin.get();
    //initiator.stop();
    return (0);
    }
    catch (const std::exception& e) {
        std::cerr << "Exception: " << e.what() << std::endl;
        return 1;
    }
}
