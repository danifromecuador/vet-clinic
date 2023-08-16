## Getting Started

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

<a name="readme-top"></a>

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)


# 📖 Vet Clinic <a name="about-project"></a>

**Vet Clinic** is a database created using SQL to manage the information of all the animals that are in a Vet Clinic.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>
<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://reactjs.org/">React.js</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://expressjs.com/">Express.js</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **The user will be able to add a new animal**
- **The user will be able to delete an existing animal**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🚀 Live Demo <a name="live-demo"></a>

This project doesn't have a live demo yet

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:


Install SQL, that depends about what OS you have:

[https://www.postgresql.org/download/](https://www.postgresql.org/download/)

Install Git:

[Download Git](https://git-scm.com/downloads)
### Setup

Clone this repository to your desired folder:

```sh
  cd my-folder
  git clone git@github.com:danifromecuador/vet-clinic.git
  cd vet-clinic
```


### Usage

To run the project, execute the following command:

```sh
  CREATE DATABASE vet_clinic;
```

```sh
  \c vet_clinic
```

```sh
  
vet_clinic=# CREATE TABLE animals (
    id serial PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Dani Morillo**

- GitHub: [danifromecuador](https://github.com/danifromecuador)
- Twitter: [@danifromecuador](https://twitter.com/danifromecuador)
- LinkedIn: [danifromecuador](https://linkedin.com/in/danifromecuador)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>


- **The user will be able to join other table**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/danifromecuador/vet-clinic/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project give me an star on [my GitHub repo](https://github.com/danifromecuador/vet-clinic)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank [Khan Academy](https://www.khanacademy.org/computing/hour-of-code/hour-of-code-lessons/hour-of-sql/v/welcome-to-sql) and [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/databases)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>