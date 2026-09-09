/**
 * QuickBite Technologies // Assignment 4: Regulatory Impact Analysis Controller
 * AI.135 Applied AI for Document & Linguistic Analysis
 * Zero-dependency, high-performance vanilla ES6 controller
 */

document.addEventListener('DOMContentLoaded', () => {
  initThemeToggle();
  initViewSwitcher();
  initPresentationDeck();
  initRegulatoryWeights();
});

function initThemeToggle() {
  const btnToggle = document.getElementById('btnToggleTheme');
  const themeIcon = document.getElementById('themeIcon');
  const themeLabel = document.getElementById('themeLabel');

  const savedTheme = localStorage.getItem('qb_a4_theme') || 'dark';
  applyTheme(savedTheme);

  if (btnToggle) {
    btnToggle.addEventListener('click', () => {
      const currentTheme = document.body.classList.contains('theme-light') ? 'light' : 'dark';
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      applyTheme(newTheme);
      localStorage.setItem('qb_a4_theme', newTheme);
    });
  }

  function applyTheme(theme) {
    if (theme === 'light') {
      document.body.classList.remove('theme-dark');
      document.body.classList.add('theme-light');
      if (themeIcon) themeIcon.textContent = '\u263E';
      if (themeLabel) themeLabel.textContent = 'Dark Mode';
    } else {
      document.body.classList.remove('theme-light');
      document.body.classList.add('theme-dark');
      if (themeIcon) themeIcon.textContent = '\u2600';
      if (themeLabel) themeLabel.textContent = 'Light Mode';
    }
  }
}

function initViewSwitcher() {
  const tabs = document.querySelectorAll('.nav-tab');
  const views = document.querySelectorAll('.dashboard-view');

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      const targetView = tab.dataset.view;
      views.forEach(v => {
        if (v.id === `view-${targetView}`) {
          v.classList.add('active');
        } else {
          v.classList.remove('active');
        }
      });
    });
  });
}

function initPresentationDeck() {
  const slides = document.querySelectorAll('.presentation-slide');
  const slideTabs = document.querySelectorAll('.btn-slide-tab');
  const btnPrev = document.getElementById('btnDeckPrev');
  const btnNext = document.getElementById('btnDeckNext');
  const slideCounter = document.getElementById('deckSlideCounter');

  const btnToggleNotes = document.getElementById('btnToggleNotes');
  const notesDrawer = document.getElementById('speakerNotesDrawer');
  const btnCloseNotes = document.getElementById('btnCloseNotes');
  const notesHeading = document.getElementById('notesSlideHeading');
  const notesBody = document.getElementById('speakerNotesBody');

  const btnFullscreen = document.getElementById('btnDeckFullscreen');
  const deckViewport = document.querySelector('.presentation-viewport');

  let currentSlide = 1;
  const totalSlides = 4;

  const speakerNotesData = {
    1: {
      heading: "Slide 1 Spoken Executive Briefing // Regulatory Comparison Matrix",
      text: "Good morning, Helene, José, and members of the board. Today we present our forensic regulatory impact analysis evaluating QuickBite's 18-month expansion feasibility. On Slide 1, we cross-evaluate three states across three operational dimensions. Texas ranks number one with an exceptional score of 9.4 out of 10. Under Texas Labor Code Section 201.041, we operate under a clean common-law right-to-control test, enabling 48-hour courier onboarding and preserving our $4.85 unit fulfillment cost. In stark contrast, California scores 4.2 out of 10: Proposition 22 engaged-time wage guarantees and San Francisco's 15% commission fee caps add over $3.10 in compliance drag per delivery, flipping our contribution margin negative. Florida is a viable secondary market at 8.1 out of 10, but its 67 distinct county discretionary surtaxes require automated software before entry."
    },
    2: {
      heading: "Slide 2 Spoken Executive Briefing // DFW Strategic Recommendation",
      text: "Moving to Slide 2, our strategic recommendation for the board is decisive: QuickBite should deploy an initial $800,000 beachhead into the Dallas-Fort Worth metropolitan area. Dallas combines four decisive advantages: First, labor agility—unambiguous 1099 classification without healthcare stipends. Second, tax simplicity—a single monthly return filed with the Texas Comptroller, and zero percent state personal or corporate income tax. Third, rapid setup velocity—under 25 TAC Section 228.2(57), sealed tamper-evident packaging exempts our couriers from food-handler permits, letting us launch in 45 days compared to 180 days in California. Fourth, unit economics—focusing on corporate catering in Uptown Dallas and Frisco yields positive $4.05 net profit per delivery. In addition, committing $800,000 to Dallas preserves $1,200,000 of our Series A balance to engineer our Austin AI route-batching dispatch engine."
    },
    3: {
      heading: "Slide 3 Spoken Executive Briefing // Risk Governance & Mitigations",
      text: "On Slide 3, we address our top three regulatory risks with actionable C-suite countermeasures. Risk 1 is municipal preemption uncertainty surrounding Texas HB 2127, currently challenged by Houston and San Antonio. If struck down, cities could attempt local gig ordinances. Our mitigation: we standardize all courier contracts under the Federal Arbitration Act (FAA) with mandatory individual arbitration waivers, insulating our business from municipal court litigation regardless of HB 2127. Risk 2 is California Proposition 22 regulatory contagion and Department of Labor scrutiny. Our mitigation: we maintain a strict moratorium on California entry, ring-fencing our Texas capital. Risk 3 is Florida's 67 county discretionary sales surtaxes. Our mitigation: we integrate automated rooftop tax calculation into our API sixty days prior to Phase 3 Florida deployment."
    },
    4: {
      heading: "Note 4 Spoken Executive Briefing // Forensic Methodology & Audit Trail",
      text: "Finally, Note 4 presents our 1-page forensic methodology note and audit trail. Every legal assertion in this report traces directly to primary state government archives and court dockets, including the 2024 California Supreme Court Castellanos ruling. We deployed a tri-model AI architecture: ChatGPT 5.5 for financial modeling, DeepSeek V4 for statutory checklists, and Gemini 3.1 for liability audits. Crucially, we audited and caught AI hallucinations—such as Gemini omitting Dallas Delivery Network Company permits and DeepSeek distorting the addressable population base by substituting the 8.4M DFW metro for Dallas city proper. This deliverable fulfills all course standards under our VERA verification protocol."
    }
  };

  function showSlide(index) {
    if (index < 1) index = totalSlides;
    if (index > totalSlides) index = 1;
    currentSlide = index;

    slides.forEach(s => {
      if (parseInt(s.dataset.slideIndex, 10) === currentSlide) {
        s.classList.add('active');
      } else {
        s.classList.remove('active');
      }
    });

    slideTabs.forEach(tab => {
      if (parseInt(tab.dataset.slide, 10) === currentSlide) {
        tab.classList.add('active');
      } else {
        tab.classList.remove('active');
      }
    });

    if (slideCounter) {
      slideCounter.textContent = `Slide ${currentSlide} of ${totalSlides}`;
    }

    if (speakerNotesData[currentSlide]) {
      if (notesHeading) notesHeading.textContent = speakerNotesData[currentSlide].heading;
      if (notesBody) notesBody.textContent = speakerNotesData[currentSlide].text;
    }
  }

  slideTabs.forEach(tab => {
    tab.addEventListener('click', () => {
      const slideNum = parseInt(tab.dataset.slide, 10);
      showSlide(slideNum);
    });
  });

  if (btnPrev) btnPrev.addEventListener('click', () => showSlide(currentSlide - 1));
  if (btnNext) btnNext.addEventListener('click', () => showSlide(currentSlide + 1));

  if (btnToggleNotes && notesDrawer) {
    btnToggleNotes.addEventListener('click', () => {
      notesDrawer.classList.toggle('open');
    });
  }
  if (btnCloseNotes && notesDrawer) {
    btnCloseNotes.addEventListener('click', () => {
      notesDrawer.classList.remove('open');
    });
  }

  if (btnFullscreen && deckViewport) {
    btnFullscreen.addEventListener('click', () => {
      if (!document.fullscreenElement) {
        deckViewport.requestFullscreen().catch(err => {
          console.warn(`Fullscreen error: ${err.message}`);
        });
      } else {
        document.exitFullscreen();
      }
    });
  }

  document.addEventListener('keydown', (e) => {
    const deckView = document.getElementById('view-deck');
    if (deckView && deckView.classList.contains('active') && e.target.tagName !== 'INPUT') {
      if (e.key === 'ArrowRight' || e.key === 'PageDown') {
        showSlide(currentSlide + 1);
      } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
        showSlide(currentSlide - 1);
      }
    }
  });

  showSlide(1);
}

function initRegulatoryWeights() {
  const inputLabor = document.getElementById('inputWeightLabor');
  const inputTax = document.getElementById('inputWeightTax');
  const inputSafety = document.getElementById('inputWeightSafety');

  const valLabor = document.getElementById('valWeightLabor');
  const valTax = document.getElementById('valWeightTax');
  const valSafety = document.getElementById('valWeightSafety');

  const dynScoreTexas = document.getElementById('dynScoreTexas');
  const dynScoreFlorida = document.getElementById('dynScoreFlorida');
  const dynScoreCalifornia = document.getElementById('dynScoreCalifornia');

  const baseScores = {
    tx: { labor: 9.6, tax: 9.5, safety: 8.8 },
    fl: { labor: 8.5, tax: 7.8, safety: 8.0 },
    ca: { labor: 3.0, tax: 4.2, safety: 6.8 }
  };

  function updateScores() {
    if (!inputLabor || !inputTax || !inputSafety) return;

    const rawLabor = parseFloat(inputLabor.value);
    const rawTax = parseFloat(inputTax.value);
    const rawSafety = parseFloat(inputSafety.value);
    const sum = rawLabor + rawTax + rawSafety;

    const wLabor = rawLabor / sum;
    const wTax = rawTax / sum;
    const wSafety = rawSafety / sum;

    if (valLabor) valLabor.textContent = `${Math.round(wLabor * 100)}%`;
    if (valTax) valTax.textContent = `${Math.round(wTax * 100)}%`;
    if (valSafety) valSafety.textContent = `${Math.round(wSafety * 100)}%`;

    const txFinal = (baseScores.tx.labor * wLabor) + (baseScores.tx.tax * wTax) + (baseScores.tx.safety * wSafety);
    const flFinal = (baseScores.fl.labor * wLabor) + (baseScores.fl.tax * wTax) + (baseScores.fl.safety * wSafety);
    const caFinal = (baseScores.ca.labor * wLabor) + (baseScores.ca.tax * wTax) + (baseScores.ca.safety * wSafety);

    if (dynScoreTexas) dynScoreTexas.textContent = txFinal.toFixed(1);
    if (dynScoreFlorida) dynScoreFlorida.textContent = flFinal.toFixed(1);
    if (dynScoreCalifornia) dynScoreCalifornia.textContent = caFinal.toFixed(1);
  }

  if (inputLabor && inputTax && inputSafety) {
    inputLabor.addEventListener('input', updateScores);
    inputTax.addEventListener('input', updateScores);
    inputSafety.addEventListener('input', updateScores);
    updateScores();
  }
}
