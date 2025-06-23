### 2. Differential Alternative Splicing (AS) Analysis

* **Quantification:**

  * Reads aligned and quantified using [Salmon](https://salmon.readthedocs.io/en/latest/) (v1.9.0)

* **AS Event Detection:**

  * Conducted with [SUPPA2](https://github.com/comprna/SUPPA) (v2.3) following the [official tutorial](https://github.com/comprna/SUPPA/wiki/SUPPA2-tutorial)

* **Splicing Metrics:**

  * PSI (Percent Spliced-In) values computed for each AS event
  * Differential splicing evaluated by:

    * ΔPSI (mean PSI difference)
    * P-values from independent t-tests comparing PSI between groups
