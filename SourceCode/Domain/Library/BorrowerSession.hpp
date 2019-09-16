#pragma once

#include <memory>
#include <string>
#include <vector>

#include "Domain/Library/Session.hpp"


namespace Domain::Library
{
  class BorrowerSession : public Domain::Library::SessionHandler
  {
    public:
      using SessionHandler::SessionHandler;  // inherit constructors

      // Operations
      std::vector<std::string> getCommands() override;  // retrieves the list of actions (commands)


      // Destructor
      // Pure virtual destructor helps force the class to be abstract, but must still be implemented
     ~BorrowerSession() noexcept override;
  }; // class BorrowerSession





  /*****************************************************************************
  ** Inline implementations
  ******************************************************************************/
  inline BorrowerSession::~BorrowerSession() noexcept
  {}


  inline std::vector<std::string> BorrowerSession::getCommands()
  {
    return { "Return Book", "Checkout Book", "Pay Fines", "Help" };
  }

} // namespace Domain::Library
