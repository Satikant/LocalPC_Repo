Feature: Verify required fields
Background: 
  * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  # * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }
  # * call read 'SignUpDatas.json'
  # * call read 'SignUpLocators.json'
  * call read ('../Jsonfiles/SignUpDatas.json')
  * call read ('../Jsonfiles/SignUpLocators.json')
@ResponseData
Scenario: Verify Email should not pre-registered.
  Given driver 'https://webordering-sp-stg.qubeyond.com/364/signup'
  Then waitForUrl('https://webordering-sp-stg.qubeyond.com/364/signup')
  # And driver.dimensions = { x: 0, y: 0, width: 1600, height: 1200 }
  And delay(20000)
  And input(SignUpscreen.Editboxfields.Firstname,SignUp.Fields.FirstName)
  And input(SignUpscreen.Editboxfields.Lastname,SignUp.Fields.LastName)
  And input(SignUpscreen.Editboxfields.email,SignUp.Fields.ExistingEmailid)
  And input(SignUpscreen.Editboxfields.password,SignUp.Fields.Password)
  And input(SignUpscreen.Editboxfields.Mobilenum,SignUp.Fields.MobileNumber)
  When click(SignUpscreen.buttons.Create)
  And delay(20000)
  * print text(SignUpscreen.RequiredFields.PopUpText)
  And delay(10000)
  When click(SignUpscreen.buttons.popup_close)
  And delay(10000)
  
