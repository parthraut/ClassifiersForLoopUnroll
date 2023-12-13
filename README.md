# COLOR: Classifiers fOr LOop unRolling 🔄

## Introduction 📚

COLOR is an innovative suite of classifiers designed to determine the optimal loop unrolling factors for loops in C programs. This project combines the power of supervised learning with a unique approach to dataset generation, which involves directly timing code for enhanced accuracy and efficiency.

### Quick Start 🚀

Ready to dive in? Here's how to get started:

#### 📁 Cloning the Repository

Begin by cloning the repository to your local machine:

\```bash
git clone https://github.com/parthraut/ClassifiersForLoopUnroll
\```

#### 🛠 Building the Dataset

1. **Prepare Your C Files:** Start by placing all your desired C files in the `dataset` folder.

2. **Generate the Dataset:** Run the following command:

   \```bash
   python3 make_dataset.py
   \```

   - **Monitoring Progress:** Updates and errors will be logged in `results.log`.

   - **Viewing Results:** The final dataset will be available in `results.json`.

#### 🧠 Training the Model

1. **Prepare Your Dataset:** Move your desired dataset (in JSON format) to `compiliers_training/datasets`.

2. **Launch Training:** Utilize the provided Jupyter notebooks in the repository to train your models.

   - **Customizable Models:** Feel free to tweak the models as per your project needs.
