# Robot_T11_Automation

This is a project created to study, better understand, and learn testing using the Robot Framework.

## Project Structure

```
robot_t11_automation/ 
│
├── backend/
│   ├── tests/
│   │   ├── board/
│   │   │   ├── create_board/
│   │   │   ├── list_board/
│   │   │   └── update_board/
│   │   ├── company/
│   │   │   ├── create_company/
│   │   │   ├── list_company/
│   │   │   ├── update_company/
│   │   │   └── delete_company/
│   │   ├── login/
│   │   └── user/
│   │       ├── create_user/
│   │       ├── list_user/
│   │       ├── update_user/
│   │       └── delete_user/
│   ├── utils/
│   │   ├── resources.robot
│   │   └── data/
│   │       └── dynamic_data.robot
│   └── config/
│       └── settings.yaml
│
├── frontend/
│   ├── tests/
│   └── config/
├── .gitignore
└── README.md
```


## Prerequisites

Make sure you have installed the following prerequisites before running the tests:

### Tools and Libraries

- [Python](https://www.python.org/) - Make sure you have Python installed.
- [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/) - Make sure you have Chromedriver installed to run UI tests using the Chrome browser.
- [Robot Framework](https://robotframework.org/) - Test automation framework.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) - Library for web testing automation.
- [RequestsLibrary](https://github.com/MarketSquare/robotframework-requests) - Library for making HTTP requests in API tests.
- [FakerLibrary](https://github.com/guykisel/robotframework-faker) - Library for generating fake data.

## How to Run the Tests

To execute the automated tests of this project, follow the instructions below:

Execution Steps:
Open the terminal or command prompt.
Navigate to the root directory of the project.
Run the following command to access the backend:

```bash
    robot -d backend/log backend/tests
```

Run the following command to access the frontend:

```bash
    robot -d frontend/log frontend/tests
```


## Contribution

This project is intended for studying and learning Robot Framework. Contributions are welcome, especially through comments that can help improve the code, fix errors, or add new features.

If you encounter any issues or have any suggestions to improve this project, feel free to leave a comment in the code or open a new issue.

Thank you for contributing to making this project better for everyone!

## Contact

You can reach me on LinkedIn: https://www.linkedin.com/in/luiz-eduardo-testa-38727b226/ for any questions, suggestions, or feedback related to this project. I'm always open to exchanging ideas and collaborating!
