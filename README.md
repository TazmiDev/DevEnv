# Welcome to DevEnv

## Introduction

This is a project designed to help you quickly install various programming language packages on your machine. By following a few simple commands, you can have the necessary packages installed and ready to use in no time.

## Installation

Before installing any packages, be sure to run the following command to update your system's package list:

Once your package list is up-to-date, you can run the `install.sh` script included in this project to install the packages you need. To do so, navigate to the root directory of the project and run the following command:
```linux
cd DevEnv
chmod +x ./*
./install.sh
```

After the installation is complete, you can start the development environment by running the following command:
```linux
# You can run 'devenv -h' to see how to use it
devenv -h
# run command
devenv
```

## Supported Languages

This project currently supports the following programming languages:

- Python3
- Java
- Node.js
- Ruby
- C

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request with your changes. All contributions are welcome!

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
