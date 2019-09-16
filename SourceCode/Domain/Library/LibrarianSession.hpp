#pragma once

#include <memory>
#include <string>
#include <vector>


#include "Domain/Library/Session.hpp"


namespace Domain::Library
{
  class LibrarianSession : public Domain::Library::SessionHandler
  {
    public:
      using SessionHandler::SessionHandler;  // inherit constructors

      // Operations
      std::vector<std::string> getCommands() override;  // retrieves the list of actions (commands)


      // Destructor
      // Pure virtual destructor helps force the class to be abstract, but must still be implemented
     ~LibrarianSession() noexcept override;
  }; // class LibrarianSession





  /*****************************************************************************
  ** Inline implementations
  ******************************************************************************/
  inline LibrarianSession::~LibrarianSession() noexcept
  {}


  inline std::vector<std::string> LibrarianSession::getCommands()
  {
    return { "Open Archives", "Checkout Book", "Collect Fines", "Help" };
  }

} // namespace Domain::Library
