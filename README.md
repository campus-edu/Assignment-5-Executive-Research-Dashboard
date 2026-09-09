# QuickBite Technologies // Master Executive Portals

> **AI.135 Applied AI for Document & Linguistic Analysis**  
> *Author*: Jason Orozco Zarco (Head of Legal & Compliance / Chief Strategy Officer)  
> *Ready for GitHub Pages Deployment*  

---

## Directory Structure

This repository contains two distinct, specialized executive dashboards:

```
ready_to_upload_github_pages/
├── index.html                                 # Master Portal Hub (Links to both dashboards)
├── .nojekyll                                  # Bypasses Jekyll on GitHub Pages
├── .github/workflows/deploy.yml               # GitHub Actions automatic deployment
├── assignment4/                               # DISTINCT DASHBOARD 1 (Assignment 4)
│   ├── index.html                             # C-Suite Presentation Deck (Slides 1–4) & Matrix
│   ├── styles.css                             # Dedicated Assignment 4 Styles
│   ├── app.js                                 # Presentation Controls, Weights & Keyboard Arrows
│   ├── Complete_Assignment_4_Regulatory_Impact_Analysis.pdf
│   ├── AI.135_Assignment4_Jason_Orozco_Zarco.pptx
│   └── README.md
└── assignment5/                               # DISTINCT DASHBOARD 2 (Assignment 5)
    ├── index.html                             # 4-Panel Executive Research Dashboard & Simulator
    ├── styles.css                             # Dedicated Assignment 5 Styles
    ├── app.js                                 # Sensitivity Engine & SEC 10-K Visualizations
    ├── Complete_Assignment_5_Executive_Dashboard_User_Guide.pdf
    ├── Complete_Assignment_5_Executive_Dashboard_User_Guide.docx
    └── README.md
```

---

## How to Deploy to GitHub Pages

1. Push this folder to your GitHub repository:
   ```bash
   cd ready_to_upload_github_pages
   git add .
   git commit -m "Deploy dual distinct dashboards for Assignment 4 and 5"
   git remote add origin https://github.com/<USERNAME>/<REPO_NAME>.git
   git push -u origin main
   ```
2. In GitHub, go to **Settings** > **Pages**.
3. Under **Source**, choose **Deploy from a branch** > `main` > `/ (root)`.
4. Your live site will deploy at:
   * **Master Portal**: `https://<USERNAME>.github.io/<REPO_NAME>/`
   * **Assignment 4 Dashboard**: `https://<USERNAME>.github.io/<REPO_NAME>/assignment4/`
   * **Assignment 5 Dashboard**: `https://<USERNAME>.github.io/<REPO_NAME>/assignment5/`
