<p align="center">
   <img width="573" alt="image" src="https://github.com/izafati/Advanced-Exception-Handling-Framework/assets/105428157/3937f775-843e-4271-a2d7-f106c7d6626c">
</p>


## Overview

The Advanced Exception Handling Framework is a robust and extensible solution for managing exceptions in Salesforce applications and render a generic LWC dialog. This framework aims to provide developers with a systematic and organized approach to handle exceptions, display them on the front-end, manage retries, and gracefully manage unexpected scenarios.

### What can we do with this Framework?

The framework contains two Apex components used to build a custom Exception Apex class and render it using a Lightning Web Component.

The custom exception class can hold the following informations : 

- `header`              -> Used as a header message in the rendered dialog.
- `message`             -> Holds a summary message under the header.
- `operationName`       -> Contains the operation name that will be called by your service. _This information is useful for the retry mechanism._
- `detailedErrors`      -> Can be used to hold the detailed Exception informations.
- `additionalDetails`   -> Holds the additional details. _This must be used for the most refined and detailed informations._

In addition, the framework offers a retry mechanism. This is done by firing a native Custom Event called `retry`, that will send the operation name of the failed service.
You can handle this event and do any custom logic needed, recall the service or any other further processing of your choice as a developer.

## Components

### Apex Classes

- **EnrichedException.cls**: Apex Custom Exception class, used to wrap the different exception information that will be rendered in the frontend.

- **EnrichedExceptionBuilder.cls**: Apex builder class, used to build an instance of `EnrichedException` object, respecting the builder design pattern.

### Lightning Web Component

- **enrichedExceptionDialog**: Custom Lightning Web Component used to render the `EnrichedException` thrown in the backend. This LWC contains sections to render the different `EnrichedException` attributes.

## Hands-On Example
This repository contains two additional components used as a sample for the implementation of the framework.
In our example we are using: 

- **SampleController.cls**: A sample controller containing two mock methods used to simulate a third party payment service integration that will result in a failure.

- **SampleLwc**: A sample LWC component to integrate the `enrichedExceptionDialog` and call the `SampleController` methods. This component also demonstrates how to use the retry mechanism included in this framework.  




https://github.com/izafati/Advanced-Exception-Handling-Framework/assets/105428157/b3dc56fc-0925-48b3-a6a6-5c251337282f



## Getting Started

1. Clone the repository:

   ```bash
   git clone git@github.com:izafati/Advanced-Exception-Handling-Framework.git

## License

This project is licensed under the MIT License.

```MIT License

Copyright (c) 2024 Imad Eddine ZAFATI & Zakaria SEMRI

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
