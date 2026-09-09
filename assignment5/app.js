/**
 * QuickBite Technologies // Executive Research Dashboard Logic
 * Zero-dependency, high-performance vanilla ES6 controller
 * AI.135 Applied AI for Document & Linguistic Analysis
 *
 * Capabilities:
 * 1. Dark Mode Default & Dynamic Theme Switcher with localStorage persistence
 * 2. C-Suite Sensitivity Simulator Modal with live P&L deconstruction & state toggles
 * 3. In-App Interactive Tutorial & 1-Page Executive User Guide Modal
 * 4. Executive Persona Switcher (CSO / CEO / CFO)
 * 5. Panel & Scenario Filtering
 * 6. Platform Model Evaluation Benchmarks (ChatGPT / DeepSeek / Gemini)
 * 7. Real-Time SVG Unit Economic Gauges & Mathematical Simulation
 * 8. Dynamic Regulatory Weight Re-Ranking Engine
 * 9. Primary Authorities & Forensic Citations Drawer
 */

document.addEventListener('DOMContentLoaded', () => {
  initThemeToggle();
  initPersonaSwitcher();
  initNavTabs();
  initPlatformTabs();
  initSensitivitySimulator();
  initSimulatorModal();
  initTutorialModal();
  initRegulatoryWeights();
  initScenarioSwitcher();
  initModals();
  initTimelinePhases();
});

/* ==========================================================================
   1. Dark Mode & Theme Toggle Controller
   ========================================================================== */
function initThemeToggle() {
  const btnToggle = document.getElementById('btnToggleTheme');
  const themeIcon = document.getElementById('themeIcon');
  const themeLabel = document.getElementById('themeLabel');

  // Default is Dark Mode per C-Suite requirements
  const savedTheme = localStorage.getItem('quickbite_theme') || 'dark';
  applyTheme(savedTheme);

  if (btnToggle) {
    btnToggle.addEventListener('click', () => {
      const currentTheme = document.body.classList.contains('theme-light') ? 'light' : 'dark';
      const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
      applyTheme(newTheme);
      localStorage.setItem('quickbite_theme', newTheme);
    });
  }

  function applyTheme(theme) {
    if (theme === 'light') {
      document.body.classList.remove('theme-dark');
      document.body.classList.add('theme-light');
      if (themeIcon) themeIcon.textContent = '\u263E'; // Moon icon
      if (themeLabel) themeLabel.textContent = 'Dark Mode';
    } else {
      document.body.classList.remove('theme-light');
      document.body.classList.add('theme-dark');
      if (themeIcon) themeIcon.textContent = '\u2600'; // Sun icon
      if (themeLabel) themeLabel.textContent = 'Light Mode';
    }
  }
}

/* ==========================================================================
   2. Persona View Switcher (CSO / CEO / CFO)
   ========================================================================== */
function initPersonaSwitcher() {
  const buttons = document.querySelectorAll('.btn-persona');
  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      buttons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const persona = btn.dataset.persona;
      document.body.classList.remove('persona-ceo', 'persona-cfo', 'persona-cso');
      document.body.classList.add(`persona-${persona}`);

      const quickBar = document.getElementById('execQuickBar');
      if (persona === 'ceo' && quickBar) {
        quickBar.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
      } else if (persona === 'cfo') {
        const marketPanel = document.getElementById('panel-market');
        if (marketPanel) marketPanel.scrollIntoView({ behavior: 'smooth', block: 'start' });
      }
    });
  });
}

/* ==========================================================================
   3. Sub-Nav Filter Tabs (All vs Individual Panels)
   ========================================================================== */
function initNavTabs() {
  const tabs = document.querySelectorAll('.nav-tab');
  const panels = document.querySelectorAll('.dashboard-panel');

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      const target = tab.dataset.target;
      if (target === 'all') {
        panels.forEach(p => p.style.display = 'block');
      } else {
        panels.forEach(p => {
          if (p.id === target) {
            p.style.display = 'block';
            p.scrollIntoView({ behavior: 'smooth', block: 'start' });
          } else {
            p.style.display = 'none';
          }
        });
      }
    });
  });
}

/* ==========================================================================
   4. AI Strategy Platform Tabs (ChatGPT / DeepSeek / Gemini)
   ========================================================================== */
function initPlatformTabs() {
  const tabs = document.querySelectorAll('.platform-tab');
  const views = document.querySelectorAll('.platform-detail-view');

  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      tabs.forEach(t => t.classList.remove('active'));
      tab.classList.add('active');

      const platform = tab.dataset.platform;
      views.forEach(v => {
        if (v.id === `view-${platform}`) {
          v.classList.add('active');
        } else {
          v.classList.remove('active');
        }
      });
    });
  });
}

/* ==========================================================================
   5. Live Unit Economic Sensitivity Simulator (Panel 2 Inline)
   ========================================================================== */
function initSensitivitySimulator() {
  const inputAov = document.getElementById('inputAov');
  const inputThroughput = document.getElementById('inputThroughput');
  const inputCommission = document.getElementById('inputCommission');

  const valAov = document.getElementById('valAov');
  const valThroughput = document.getElementById('valThroughput');
  const valCommission = document.getElementById('valCommission');

  const simOrderContribution = document.getElementById('simOrderContribution');
  const simProjectedArr = document.getElementById('simProjectedArr');
  const simGrossMargin = document.getElementById('simGrossMargin');
  const simCashRunway = document.getElementById('simCashRunway');

  const readoutMargin = document.getElementById('readoutMargin');
  const readoutTakeRate = document.getElementById('readoutTakeRate');
  const needleMargin = document.getElementById('needleMargin');
  const needleTakeRate = document.getElementById('needleTakeRate');
  const pathMarginGauge = document.getElementById('pathMarginGauge');
  const pathTakeRateGauge = document.getElementById('pathTakeRateGauge');

  function calculate() {
    if (!inputAov || !inputThroughput || !inputCommission) return;

    const aov = parseFloat(inputAov.value);
    const throughput = parseFloat(inputThroughput.value);
    const commissionPct = parseFloat(inputCommission.value) / 100.0;

    if (valAov) valAov.textContent = `$${aov.toFixed(2)}`;
    if (valThroughput) valThroughput.textContent = `${throughput.toFixed(1)}`;
    if (valCommission) valCommission.textContent = `${(commissionPct * 100).toFixed(1)}%`;

    // Fixed & Variable Cost Structure (Texas Benchmark)
    const customerDeliveryFee = 3.99;
    const grossPlatformRevenue = (aov * commissionPct) + customerDeliveryFee;

    // Driver Fulfillment Cost per drop: ($18.00 base courier hourly rate) / throughput
    const driverFulfillmentCost = 18.00 / throughput;

    // Payment Processing & Merchant gateway: 2.9% of (AOV + Fee) + $0.30
    const paymentGateway = 0.029 * (aov + customerDeliveryFee) + 0.30;

    // Direct contribution margin per delivery
    const netContribution = grossPlatformRevenue - driverFulfillmentCost - paymentGateway;

    // Net Take Rate: GAAP recognized revenue / Gross Merchandise Value (AOV)
    const netTakeRate = (grossPlatformRevenue / aov) * 100.0;

    // 12-Month Projected Run-rate ARR (1,680,000 annual orders in DFW expansion year 1)
    const annualOrders = 1680000;
    const projectedArr = (annualOrders * grossPlatformRevenue) / 1000000;

    // Gross Margin Percentage
    const grossMargin = (netContribution / grossPlatformRevenue) * 100.0;

    // Cash runway post $2.0M deployment
    const monthlyOrders = annualOrders / 12;
    const monthlyNetGross = monthlyOrders * netContribution;
    const netBurn = Math.max(25000, 140000 - monthlyNetGross);
    const runwayMonths = Math.min(36, Math.max(6, 2000000 / netBurn));

    // Update UI readouts
    if (simOrderContribution) {
      simOrderContribution.textContent = `${netContribution >= 0 ? '+' : ''}$${netContribution.toFixed(2)}`;
      simOrderContribution.className = `sim-box-val ${netContribution >= 0 ? 'positive' : 'negative'}`;
    }
    if (simProjectedArr) simProjectedArr.textContent = `$${projectedArr.toFixed(2)}M`;
    if (simGrossMargin) simGrossMargin.textContent = `${grossMargin.toFixed(1)}%`;
    if (simCashRunway) simCashRunway.textContent = `${runwayMonths.toFixed(1)} Mos`;

    if (readoutMargin) {
      readoutMargin.textContent = `${netContribution >= 0 ? '+' : ''}$${netContribution.toFixed(2)}`;
    }
    if (readoutTakeRate) {
      readoutTakeRate.textContent = `${netTakeRate.toFixed(1)}%`;
    }

    // Dynamic Gauge Needle Rotations
    const marginNorm = Math.min(1.0, Math.max(0.0, (netContribution + 2.0) / 10.0));
    updateNeedle(needleMargin, marginNorm);
    updateGaugeArc(pathMarginGauge, marginNorm);

    const takeRateNorm = Math.min(1.0, Math.max(0.0, (netTakeRate - 10.0) / 12.0));
    updateNeedle(needleTakeRate, takeRateNorm);
    updateGaugeArc(pathTakeRateGauge, takeRateNorm);
  }

  function updateNeedle(needleEl, normalizedVal) {
    if (!needleEl) return;
    const angleRad = Math.PI * (1.0 - normalizedVal);
    const radius = 65;
    const x2 = 100 - radius * Math.cos(angleRad);
    const y2 = 100 - radius * Math.sin(angleRad);
    needleEl.setAttribute('x2', x2.toFixed(1));
    needleEl.setAttribute('y2', y2.toFixed(1));
  }

  function updateGaugeArc(pathEl, normalizedVal) {
    if (!pathEl) return;
    const totalLength = 251.2;
    const offset = totalLength * (1.0 - normalizedVal);
    pathEl.style.strokeDashoffset = offset.toFixed(1);
  }

  if (inputAov && inputThroughput && inputCommission) {
    inputAov.addEventListener('input', calculate);
    inputThroughput.addEventListener('input', calculate);
    inputCommission.addEventListener('input', calculate);
    calculate();
  }
}

/* ==========================================================================
   6. Dedicated C-Suite Sensitivity Simulator Modal Controller
   ========================================================================== */
function initSimulatorModal() {
  const modal = document.getElementById('modalSimulator');
  const btnOpen = document.getElementById('btnOpenSimulator');
  const btnClose = document.getElementById('btnCloseSimulator');
  const btnCloseBottom = document.getElementById('btnCloseSimulatorBottom');
  const btnScrollToMarket = document.getElementById('btnScrollToMarketPanel');

  const stateButtons = document.querySelectorAll('.btn-sim-state');
  const inputAov = document.getElementById('modalInputAov');
  const inputThroughput = document.getElementById('modalInputThroughput');
  const inputCommission = document.getElementById('modalInputCommission');
  const inputFee = document.getElementById('modalInputFee');

  const valAov = document.getElementById('modalValAov');
  const valThroughput = document.getElementById('modalValThroughput');
  const valCommission = document.getElementById('modalValCommission');
  const valFee = document.getElementById('modalValFee');

  const simContribution = document.getElementById('modalSimContribution');
  const simContribNote = document.getElementById('modalSimContribNote');
  const simArr = document.getElementById('modalSimArr');
  const simGross = document.getElementById('modalSimGross');
  const simRunway = document.getElementById('modalSimRunway');

  const pnlAov = document.getElementById('pnlAov');
  const pnlCommission = document.getElementById('pnlCommission');
  const pnlFee = document.getElementById('pnlFee');
  const pnlRevenue = document.getElementById('pnlRevenue');
  const pnlDriver = document.getElementById('pnlDriver');
  const pnlGateway = document.getElementById('pnlGateway');
  const pnlTotal = document.getElementById('pnlTotal');

  // Baseline driver fulfillment rates by state:
  // Texas: $4.85 baseline (clean 1099, Tex. Lab. Code § 201.041)
  // Florida: $5.40 baseline (Fla. Stat. § 443.036(19))
  // California: $7.95 baseline (Prop 22 120% min wage + $0.35/mi auto + health stipend)
  const stateFulfillmentBases = {
    tx: 4.85,
    fl: 5.40,
    ca: 7.95
  };

  let currentState = 'tx';

  function openModal() {
    if (!modal) return;
    modal.classList.add('open');
    modal.setAttribute('aria-hidden', 'false');

    // Sync modal sliders from main panel if available
    const mainAov = document.getElementById('inputAov');
    const mainThroughput = document.getElementById('inputThroughput');
    const mainCommission = document.getElementById('inputCommission');

    if (mainAov && inputAov) inputAov.value = mainAov.value;
    if (mainThroughput && inputThroughput) inputThroughput.value = mainThroughput.value;
    if (mainCommission && inputCommission) inputCommission.value = mainCommission.value;

    recalculate();
  }

  function closeModal() {
    if (!modal) return;
    modal.classList.remove('open');
    modal.setAttribute('aria-hidden', 'true');

    // Sync back to main dashboard sliders and trigger recalculation
    const mainAov = document.getElementById('inputAov');
    const mainThroughput = document.getElementById('inputThroughput');
    const mainCommission = document.getElementById('inputCommission');

    if (mainAov && inputAov) mainAov.value = inputAov.value;
    if (mainThroughput && inputThroughput) mainThroughput.value = inputThroughput.value;
    if (mainCommission && inputCommission) mainCommission.value = inputCommission.value;

    if (mainAov) mainAov.dispatchEvent(new Event('input'));
  }

  function recalculate() {
    if (!inputAov || !inputThroughput || !inputCommission || !inputFee) return;

    const aov = parseFloat(inputAov.value);
    const throughput = parseFloat(inputThroughput.value);
    const commissionPct = parseFloat(inputCommission.value) / 100.0;
    const fee = parseFloat(inputFee.value);

    if (valAov) valAov.textContent = `$${aov.toFixed(2)}`;
    if (valThroughput) valThroughput.textContent = `${throughput.toFixed(1)}`;
    if (valCommission) valCommission.textContent = `${(commissionPct * 100).toFixed(1)}%`;
    if (valFee) valFee.textContent = `$${fee.toFixed(2)}`;

    // P&L Component Math
    const commissionRevenue = aov * commissionPct;
    const grossPlatformRevenue = commissionRevenue + fee;

    // Driver fulfillment adjusts inversely with throughput from baseline (2.1 drops/hr)
    const baseFulfillment = stateFulfillmentBases[currentState];
    const driverFulfillment = (baseFulfillment * 2.1) / throughput;

    // Merchant payment gateway processing: 2.9% of (AOV + fee) + $0.30
    const paymentGateway = (0.029 * (aov + fee)) + 0.30;

    // Direct contribution profit per delivery
    const netContribution = grossPlatformRevenue - driverFulfillment - paymentGateway;

    // Projected 12-Month Run-rate ARR
    const annualOrders = 1680000;
    const projectedArr = (annualOrders * grossPlatformRevenue) / 1000000;

    // Gross Margin %
    const grossMargin = (netContribution / grossPlatformRevenue) * 100.0;

    // Cash Runway post $2.0M deployment
    const monthlyOrders = annualOrders / 12;
    const monthlyNetGross = monthlyOrders * netContribution;
    const netBurn = Math.max(25000, 140000 - monthlyNetGross);
    const runwayMonths = Math.min(36, Math.max(6, 2000000 / netBurn));

    // Update Scoreboard Cards
    if (simContribution) {
      simContribution.textContent = `${netContribution >= 0 ? '+' : ''}$${netContribution.toFixed(2)}`;
      simContribution.className = `score-value ${netContribution >= 0 ? 'positive' : 'negative'}`;
    }
    if (simContribNote) {
      if (netContribution > 3.0) {
        simContribNote.textContent = 'High Margin Advantage (Texas Sanctuary)';
        simContribNote.style.color = '#34d399';
      } else if (netContribution >= 0) {
        simContribNote.textContent = 'Moderate Margin (Selective Profitability)';
        simContribNote.style.color = '#fbbf24';
      } else {
        simContribNote.textContent = 'Negative Unit Economics (Regulatory Drag)';
        simContribNote.style.color = '#fb7185';
      }
    }

    if (simArr) simArr.textContent = `$${projectedArr.toFixed(2)}M`;
    if (simGross) simGross.textContent = `${grossMargin.toFixed(1)}%`;
    if (simRunway) {
      simRunway.textContent = `${runwayMonths.toFixed(1)} Mos`;
      simRunway.className = `score-value ${runwayMonths >= 18 ? 'positive' : 'negative'}`;
    }

    // Update P&L Deconstruction Table
    if (pnlAov) pnlAov.textContent = `$${aov.toFixed(2)}`;
    if (pnlCommission) pnlCommission.textContent = `$${commissionRevenue.toFixed(2)}`;
    if (pnlFee) pnlFee.textContent = `$${fee.toFixed(2)}`;
    if (pnlRevenue) pnlRevenue.textContent = `$${grossPlatformRevenue.toFixed(2)}`;
    if (pnlDriver) pnlDriver.textContent = `-$${driverFulfillment.toFixed(2)}`;
    if (pnlGateway) pnlGateway.textContent = `-$${paymentGateway.toFixed(2)}`;
    if (pnlTotal) {
      pnlTotal.textContent = `${netContribution >= 0 ? '+' : ''}$${netContribution.toFixed(2)}`;
      pnlTotal.style.color = netContribution >= 0 ? 'var(--accent-emerald)' : 'var(--accent-rose)';
    }
  }

  // Bind State Selector Buttons
  stateButtons.forEach(btn => {
    btn.addEventListener('click', () => {
      stateButtons.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      currentState = btn.dataset.state || 'tx';
      recalculate();
    });
  });

  // Bind Slider Inputs
  if (inputAov) inputAov.addEventListener('input', recalculate);
  if (inputThroughput) inputThroughput.addEventListener('input', recalculate);
  if (inputCommission) inputCommission.addEventListener('input', recalculate);
  if (inputFee) inputFee.addEventListener('input', recalculate);

  // Open / Close Bindings
  if (btnOpen) btnOpen.addEventListener('click', openModal);
  if (btnClose) btnClose.addEventListener('click', closeModal);
  if (btnCloseBottom) btnCloseBottom.addEventListener('click', closeModal);

  if (btnScrollToMarket) {
    btnScrollToMarket.addEventListener('click', () => {
      closeModal();
      const marketPanel = document.getElementById('panel-market');
      if (marketPanel) {
        marketPanel.scrollIntoView({ behavior: 'smooth', block: 'start' });
        marketPanel.classList.add('panel-highlight-pulse');
        setTimeout(() => marketPanel.classList.remove('panel-highlight-pulse'), 1500);
      }
    });
  }
}

/* ==========================================================================
   7. In-App Interactive Tutorial & 1-Page User Guide Modal Controller
   ========================================================================== */
function initTutorialModal() {
  const modal = document.getElementById('modalTutorial');
  const btnOpen = document.getElementById('btnOpenTutorial');
  const btnClose = document.getElementById('btnCloseTutorial');
  const btnCloseBottom = document.getElementById('btnCloseTutorialBottom');
  const chkDontShow = document.getElementById('chkDontShowTutorial');

  const tabButtons = document.querySelectorAll('.btn-tut-tab');
  const tutViewTour = document.getElementById('tutViewTour');
  const tutViewDoc = document.getElementById('tutViewDoc');

  const stepIndicators = document.querySelectorAll('.tour-step-indicator');
  const stepCards = document.querySelectorAll('.tour-step-card');
  const btnPrevList = document.querySelectorAll('.btn-prev-step');
  const btnNextList = document.querySelectorAll('.btn-next-step');
  const btnFinishTourList = document.querySelectorAll('.btn-finish-tour');
  const btnJumpPanelList = document.querySelectorAll('.btn-jump-panel');

  let currentStep = 1;
  const totalSteps = 5;

  function showStep(stepNum) {
    if (stepNum < 1) stepNum = 1;
    if (stepNum > totalSteps) stepNum = totalSteps;
    currentStep = stepNum;

    stepIndicators.forEach(ind => {
      const s = parseInt(ind.dataset.step);
      if (s === currentStep) {
        ind.classList.add('active');
      } else {
        ind.classList.remove('active');
      }
    });

    stepCards.forEach(card => {
      const s = parseInt(card.dataset.step);
      if (s === currentStep) {
        card.classList.add('active');
      } else {
        card.classList.remove('active');
      }
    });
  }

  function openTutorial() {
    if (!modal) return;
    modal.classList.add('open');
    modal.setAttribute('aria-hidden', 'false');
    showStep(1);
  }

  function closeTutorial() {
    if (!modal) return;
    modal.classList.remove('open');
    modal.setAttribute('aria-hidden', 'true');

    if (chkDontShow && chkDontShow.checked) {
      localStorage.setItem('quickbite_tutorial_dismissed', 'true');
    }
  }

  if (btnOpen) btnOpen.addEventListener('click', openTutorial);
  if (btnClose) btnClose.addEventListener('click', closeTutorial);
  if (btnCloseBottom) btnCloseBottom.addEventListener('click', closeTutorial);

  // Tab switcher (Walkthrough vs 1-Page APA Guide Document)
  tabButtons.forEach(tabBtn => {
    tabBtn.addEventListener('click', () => {
      tabButtons.forEach(b => b.classList.remove('active'));
      tabBtn.classList.add('active');

      const tabTarget = tabBtn.dataset.tab;
      if (tabTarget === 'tour') {
        if (tutViewTour) tutViewTour.classList.add('active');
        if (tutViewDoc) tutViewDoc.classList.remove('active');
      } else {
        if (tutViewTour) tutViewTour.classList.remove('active');
        if (tutViewDoc) tutViewDoc.classList.add('active');
      }
    });
  });

  // Step Indicators Click
  stepIndicators.forEach(ind => {
    ind.addEventListener('click', () => {
      showStep(parseInt(ind.dataset.step));
    });
  });

  // Stepper Buttons
  btnNextList.forEach(btn => {
    btn.addEventListener('click', () => showStep(currentStep + 1));
  });

  btnPrevList.forEach(btn => {
    btn.addEventListener('click', () => showStep(currentStep - 1));
  });

  btnFinishTourList.forEach(btn => {
    btn.addEventListener('click', closeTutorial);
  });

  // Jump to Panel Buttons
  btnJumpPanelList.forEach(btn => {
    btn.addEventListener('click', () => {
      const targetId = btn.dataset.jump;
      closeTutorial();

      if (targetId) {
        const el = document.getElementById(targetId);
        if (el) {
          el.scrollIntoView({ behavior: 'smooth', block: 'start' });
          el.classList.add('panel-highlight-pulse');
          setTimeout(() => el.classList.remove('panel-highlight-pulse'), 1500);
        }
      }
    });
  });

  // Don't show checkbox preference handling
  if (chkDontShow) {
    const isDismissed = localStorage.getItem('quickbite_tutorial_dismissed') === 'true';
    chkDontShow.checked = isDismissed;

    chkDontShow.addEventListener('change', () => {
      if (chkDontShow.checked) {
        localStorage.setItem('quickbite_tutorial_dismissed', 'true');
      } else {
        localStorage.removeItem('quickbite_tutorial_dismissed');
      }
    });

    // Auto-prompt tutorial like in games/apps for first-time visitors
    if (!isDismissed) {
      setTimeout(() => {
        openTutorial();
      }, 350);
    }
  }
}

/* ==========================================================================
   8. Dynamic Jurisdictional Weight Re-Ranking Engine
   ========================================================================== */
function initRegulatoryWeights() {
  const inputLabor = document.getElementById('inputWeightLabor');
  const inputTax = document.getElementById('inputWeightTax');
  const inputSafety = document.getElementById('inputWeightSafety');

  const valLabor = document.getElementById('valWeightLabor');
  const valTax = document.getElementById('valWeightTax');
  const valSafety = document.getElementById('valWeightSafety');

  const scoreTexas = document.getElementById('scoreTexas');
  const scoreFlorida = document.getElementById('scoreFlorida');
  const scoreCalifornia = document.getElementById('scoreCalifornia');

  // Baseline Jurisdictional Category Sub-Scores (out of 10)
  // Texas: Labor 9.6, Tax 9.5, Safety 8.8
  // Florida: Labor 8.5, Tax 7.8, Safety 8.0
  // California: Labor 3.0, Tax 4.2, Safety 6.8
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

    if (scoreTexas) scoreTexas.textContent = txFinal.toFixed(1);
    if (scoreFlorida) scoreFlorida.textContent = flFinal.toFixed(1);
    if (scoreCalifornia) scoreCalifornia.textContent = caFinal.toFixed(1);
  }

  if (inputLabor && inputTax && inputSafety) {
    inputLabor.addEventListener('input', updateScores);
    inputTax.addEventListener('input', updateScores);
    inputSafety.addEventListener('input', updateScores);
    updateScores();
  }
}

/* ==========================================================================
   9. Scenario Switcher (Bear / Base / Bull)
   ========================================================================== */
function initScenarioSwitcher() {
  const scenarioBtns = document.querySelectorAll('.btn-scenario');
  const inputAov = document.getElementById('inputAov');
  const inputThroughput = document.getElementById('inputThroughput');
  const inputCommission = document.getElementById('inputCommission');

  const scenarios = {
    bear: { aov: 24.0, throughput: 1.7, commission: 13.0 },
    base: { aov: 28.5, throughput: 2.1, commission: 15.0 },
    bull: { aov: 34.0, throughput: 2.5, commission: 17.0 }
  };

  scenarioBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      scenarioBtns.forEach(b => b.classList.remove('active'));
      btn.classList.add('active');

      const sc = scenarios[btn.dataset.scenario];
      if (sc && inputAov && inputThroughput && inputCommission) {
        inputAov.value = sc.aov;
        inputThroughput.value = sc.throughput;
        inputCommission.value = sc.commission;
        inputAov.dispatchEvent(new Event('input'));
      }
    });
  });
}

/* ==========================================================================
   10. Modals: Primary Authorities & Citations Drawer + Backdrop Handling
   ========================================================================== */
function initModals() {
  const modalCitations = document.getElementById('modalCitations');
  const btnOpenCitations = document.getElementById('btnOpenCitations');
  const btnCloseCitations = document.getElementById('btnCloseCitations');
  const btnCloseCitationsBottom = document.getElementById('btnCloseCitationsBottom');

  function openCitations() {
    if (!modalCitations) return;
    modalCitations.classList.add('open');
    modalCitations.setAttribute('aria-hidden', 'false');
  }

  function closeCitations() {
    if (!modalCitations) return;
    modalCitations.classList.remove('open');
    modalCitations.setAttribute('aria-hidden', 'true');
  }

  if (btnOpenCitations) btnOpenCitations.addEventListener('click', openCitations);
  if (btnCloseCitations) btnCloseCitations.addEventListener('click', closeCitations);
  if (btnCloseCitationsBottom) btnCloseCitationsBottom.addEventListener('click', closeCitations);

  // Close modals on outside backdrop click
  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal-backdrop')) {
      e.target.classList.remove('open');
      e.target.setAttribute('aria-hidden', 'true');
    }
  });

  // Close modals on Escape key
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      const openModals = document.querySelectorAll('.modal-backdrop.open');
      openModals.forEach(m => {
        m.classList.remove('open');
        m.setAttribute('aria-hidden', 'true');
      });
    }
  });
}

/* ==========================================================================
   11. Interactive 18-Month Timeline Node Clicks
   ========================================================================== */
function initTimelinePhases() {
  const phases = document.querySelectorAll('.timeline-phase');
  phases.forEach(phase => {
    phase.addEventListener('click', () => {
      phases.forEach(p => p.classList.remove('active'));
      phase.classList.add('active');
    });
  });
}
