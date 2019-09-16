#pragma once

namespace Domain::Library
{
  // Library Package within the Domain Layer Abstract class
  class MaintainBooksHandler
  {
    public:
      // Constructors
      MaintainBooksHandler()                                          = default;        // default ctor
      MaintainBooksHandler( const MaintainBooksHandler &  original )  = default;        // copy ctor
      MaintainBooksHandler(       MaintainBooksHandler && original )  = default;        // move ctor

      // Operations

      // Destructor
      // Pure virtual destructor helps force the class to be abstract, but must still be implemented
      virtual ~MaintainBooksHandler() noexcept = 0;

    protected:
      // Copy assignment operators, protected to prevent mix derived-type assignments
      MaintainBooksHandler & operator=( const MaintainBooksHandler &  rhs ) = default;  // copy assignment
      MaintainBooksHandler & operator=(       MaintainBooksHandler && rhs ) = default;  // move assignment

  };    // class MaintainBooksHandler





  /*****************************************************************************
  ** Inline implementations
  ******************************************************************************/
  inline MaintainBooksHandler::~MaintainBooksHandler() noexcept
  {}


} // namespace Domain::Library
