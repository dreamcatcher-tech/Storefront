const state = { data: null, selectedId: null, filters: { search: '', role: 'all', ownership: 'all', price: 'all' } };

const $ = (id) => document.getElementById(id);
const escapeHtml = (value) => String(value ?? '').replace(/[&<>"]/g, ch => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;'}[ch]));
const list = (items) => `<ul>${items.map(item => `<li>${escapeHtml(item)}</li>`).join('')}</ul>`;
const pill = (value) => `<span class="pill">${escapeHtml(value)}</span>`;

async function loadData() {
  const response = await fetch('./assets/storefront-data.json', { cache: 'no-cache' });
  if (!response.ok) throw new Error(`Unable to load storefront data: ${response.status}`);
  state.data = await response.json();
  state.selectedId = state.data.listings[0].id;
  render();
}

function render() {
  $('listingCount').textContent = state.data.listings.length;
  renderRoles();
  setupFilters();
  renderListings();
  renderApiRoutes();
  renderCleanRoomModes();
  renderReceipts();
  renderDemand();
  renderCoverage();
  selectListing(state.selectedId);
}

function renderRoles() {
  $('roleGrid').innerHTML = state.data.rolePaths.map(role => `
    <article class="role-card" data-role="${escapeHtml(role.id)}">
      <span class="role-icon" aria-hidden="true">${escapeHtml(role.icon)}</span>
      <h3>${escapeHtml(role.label)}</h3>
      <p><strong>For:</strong> ${escapeHtml(role.who)}</p>
      <p>${escapeHtml(role.promise)}</p>
      <p><strong>Authority:</strong> ${escapeHtml(role.authority)}</p>
    </article>
  `).join('');
}

function setupFilters() {
  const roleOptions = state.data.rolePaths.map(r => `<option value="${escapeHtml(r.id)}">${escapeHtml(r.label)}</option>`).join('');
  const ownerships = [...new Set(state.data.listings.map(card => card.ownership))].sort();
  const prices = [...new Set(state.data.listings.map(card => card.priceModel))].sort();
  $('roleFilter').innerHTML = '<option value="all">All paths</option>' + roleOptions;
  $('ownershipFilter').innerHTML = '<option value="all">All ownership</option>' + ownerships.map(o => `<option value="${escapeHtml(o)}">${escapeHtml(o)}</option>`).join('');
  $('priceFilter').innerHTML = '<option value="all">All prices</option>' + prices.map(p => `<option value="${escapeHtml(p)}">${escapeHtml(p)}</option>`).join('');
  $('searchInput').addEventListener('input', event => { state.filters.search = event.target.value.toLowerCase(); renderListings(); });
  $('roleFilter').addEventListener('change', event => { state.filters.role = event.target.value; renderListings(); });
  $('ownershipFilter').addEventListener('change', event => { state.filters.ownership = event.target.value; renderListings(); });
  $('priceFilter').addEventListener('change', event => { state.filters.price = event.target.value; renderListings(); });
  $('navToggle').addEventListener('click', () => {
    const nav = document.querySelector('.nav');
    const open = nav.classList.toggle('open');
    $('navToggle').setAttribute('aria-expanded', String(open));
  });
}

function filteredListings() {
  return state.data.listings.filter(card => {
    const haystack = JSON.stringify(card).toLowerCase();
    return (!state.filters.search || haystack.includes(state.filters.search))
      && (state.filters.role === 'all' || card.role === state.filters.role)
      && (state.filters.ownership === 'all' || card.ownership === state.filters.ownership)
      && (state.filters.price === 'all' || card.priceModel === state.filters.price);
  });
}

function renderListings() {
  const cards = filteredListings();
  $('listingGrid').innerHTML = cards.map(card => `
    <button class="listing-card ${card.id === state.selectedId ? 'active' : ''}" type="button" data-id="${escapeHtml(card.id)}">
      <div class="card-title-line"><strong>${escapeHtml(card.title)}</strong><span class="tag">${escapeHtml(card.type)}</span></div>
      <p>${escapeHtml(card.summary)}</p>
      <div class="card-meta">
        ${pill(card.ownership)}${pill(card.maturity)}${pill(card.certification)}${pill(card.priceModel)}
      </div>
      <p><strong>Outcome:</strong> ${escapeHtml(card.outcome)}</p>
    </button>
  `).join('') || '<p>No cards match the filters.</p>';
  document.querySelectorAll('.listing-card').forEach(button => button.addEventListener('click', () => selectListing(button.dataset.id)));
}

function selectedCard() {
  return state.data.listings.find(card => card.id === state.selectedId) || state.data.listings[0];
}

function selectListing(id) {
  state.selectedId = id;
  document.querySelectorAll('.listing-card').forEach(el => el.classList.toggle('active', el.dataset.id === id));
  const card = selectedCard();
  renderDetail(card);
  renderJsonPreview(card);
  renderAudit(card);
  renderBurn(card);
}

function renderDetail(card) {
  $('cardDetail').innerHTML = `
    <h3>${escapeHtml(card.title)}</h3>
    <p>${escapeHtml(card.summary)}</p>
    <div class="card-meta">${[card.ownership, card.sponsorship, card.maturity, card.certification, card.priceModel, card.price].map(pill).join('')}</div>
    <div class="detail-section"><strong>Success definition</strong><p>${escapeHtml(card.successDefinition)}</p></div>
    <div class="detail-section"><strong>Good for</strong>${list(card.goodFor)}</div>
    <div class="detail-section"><strong>Not good for</strong>${list(card.notGoodFor)}</div>
    <div class="detail-section"><strong>Fulfillment path</strong><p>${card.fulfillmentModes.map(pill).join('')}</p><p>Provider: ${escapeHtml(card.provider)}</p></div>
    <div class="detail-section"><strong>Authority and Conscience gates</strong>${list(card.authority)}</div>
    <div class="detail-section"><strong>Evidence</strong>${list(card.evidence)}</div>
    <div class="detail-section"><strong>Alternatives</strong>${list(card.alternatives)}</div>
    <div class="detail-section"><strong>Risks and exclusions</strong>${list(card.risks)}</div>
    <div class="detail-section"><strong>Exit / renewal / downgrade</strong><p>${escapeHtml(card.exit)}</p></div>
    <div class="detail-section"><strong>Provenance and attribution</strong><p>Dreamcatcher role: ${escapeHtml(card.dreamcatcherRole)}. Contribution depth: ${escapeHtml(card.contributionDepth)}.</p>${card.sharedSubstrate ? `<p>Shared substrate disclosed: ${escapeHtml(card.sharedSubstrate)}</p>` : ''}</div>
  `;
}

function renderJsonPreview(card) {
  const contract = {
    agent_storefront_card: {
      card_id: card.id,
      title: card.title,
      outcome_claim: { principal_outcome: card.outcome, success_definition: card.successDefinition },
      labels: { ownership: card.ownership, sponsorship: card.sponsorship, maturity: card.maturity, certification: card.certification },
      capability_path: { fulfillment_modes: card.fulfillmentModes, provider: card.provider },
      authority: { gates: card.authority },
      economics: { price_model: card.priceModel, price: card.price, recommendation: card.recommendation },
      evidence: { claims: card.evidence, burn_receipt_ref: card.burnReceipt || null },
      alternatives: card.alternatives,
      risks: card.risks,
      receipts: card.receiptRefs,
      links: card.api
    }
  };
  $('jsonPreview').textContent = JSON.stringify(contract, null, 2);
}

function renderApiRoutes() {
  $('apiRoutes').innerHTML = state.data.apiRoutes.map(route => `
    <div class="route-item"><code>${escapeHtml(route.route)}</code><p>${escapeHtml(route.purpose)}</p></div>
  `).join('');
}

function recommendationScore(card) {
  let score = 45;
  if (['measured','proven-for-segment'].includes(card.maturity)) score += 15;
  if (card.certification.includes('certified') || card.certification.includes('tested') || card.certification.includes('sealed')) score += 12;
  if (card.evidence.length >= 3) score += 10;
  if (card.alternatives.length >= 3) score += 8;
  if (card.sponsorship !== 'none') score -= 8;
  if (card.maturity === 'idea' || card.certification === 'insufficient evidence') score -= 18;
  return Math.max(10, Math.min(92, score));
}

function renderAudit(card) {
  const score = recommendationScore(card);
  const action = score >= 78 ? 'pay or renew if authority is present' : score >= 62 ? 'inspect or request quote' : score >= 48 ? 'compare alternatives / negotiate' : 'monitor or reject until evidence improves';
  $('auditCard').innerHTML = `
    <div class="audit-score">
      <div class="score-ring" style="--score:${score}%"><span>${score}</span></div>
      <div><h3>${escapeHtml(card.title)}</h3><p><strong>Mock buyer-agent decision:</strong> ${escapeHtml(action)}</p><p>${escapeHtml(card.rankReason)}</p></div>
    </div>
    <div class="detail-section"><strong>Checks performed</strong>${list(['principal relevance', 'authority and approval needs', 'price/runway impact', 'evidence and maturity', 'alternatives and cheaper paths', 'risk and exit terms'])}</div>
    <div class="detail-section"><strong>Safe rejection feedback if not selected</strong>${list(['missing evidence is captured without private context', 'better alternative is named when safe', 'price concern can become demand signal', 'provider receives actionable non-defamatory reasons'])}</div>
  `;
}

function renderBurn(card) {
  const receipt = card.burnReceipt ? state.data.burnReceipts.find(b => b.id === card.burnReceipt) : state.data.burnReceipts[0];
  $('burnPanel').innerHTML = `
    <div><h3>${escapeHtml(receipt.module)}</h3><p>Source visibility: ${escapeHtml(receipt.sourceVisibility)} · ${escapeHtml(receipt.fairPriceAnchor)}</p></div>
    <div class="burn-grid">
      <div><strong>Lifetime burn</strong><span>${escapeHtml(receipt.windows.lifetime)}</span></div>
      <div><strong>Last 30 days</strong><span>${escapeHtml(receipt.windows.last_30_days)}</span></div>
      <div><strong>Last 7 days</strong><span>${escapeHtml(receipt.windows.last_7_days)}</span></div>
    </div>
    <div class="detail-section"><strong>Model/tool/test/human-review breakdown</strong>${list(receipt.modelBreakdown)}</div>
    <div class="detail-section"><strong>Artifact digests</strong>${list(receipt.artifactDigests)}</div>
    <div class="detail-section"><strong>Recreate estimate</strong><p>${escapeHtml(receipt.recreateEstimate)}</p></div>
    <div class="detail-section"><strong>Anti-inflation and privacy safeguards</strong>${list(receipt.antiInflation)}</div>
    <div class="detail-section"><strong>Clean-room availability</strong><p>${escapeHtml(receipt.cleanRoom)}</p></div>
  `;
}

function renderCleanRoomModes() {
  $('cleanRoomModes').innerHTML = state.data.cleanRoomModes.map(item => `
    <article class="mode-card"><h3>${escapeHtml(item.mode)}</h3><p><strong>Allowed output:</strong> ${escapeHtml(item.output)}</p><p>${escapeHtml(item.policy)}</p></article>
  `).join('');
}

function renderReceipts() {
  $('receiptTimeline').innerHTML = state.data.receipts.map(receipt => `
    <article class="receipt-item"><div><span class="tag">${escapeHtml(receipt.type)}</span><h3>${escapeHtml(receipt.id)}</h3></div><div><p>Card: <code>${escapeHtml(receipt.card)}</code></p>${list(receipt.contains)}</div></article>
  `).join('');
}

function renderDemand() {
  $('demandGrid').innerHTML = state.data.demandItems.map(item => `
    <article class="demand-card"><span class="tag">${escapeHtml(item.visibility)}</span><h3>${escapeHtml(item.title)}</h3><p><strong>Origin:</strong> ${escapeHtml(item.origin)} · <strong>Status:</strong> ${escapeHtml(item.status)}</p><p><strong>Independent evidence:</strong> ${item.votes} unique authorized principal signals</p><p><strong>Safe output:</strong> ${escapeHtml(item.safeOutput)}</p></article>
  `).join('');
}

function renderCoverage() {
  $('coverageList').innerHTML = state.data.coverage.map(feature => `
    <details class="coverage-card" open data-coverage-file="${escapeHtml(feature.file)}">
      <summary><span class="tag">${escapeHtml(feature.file)}</span><span>${escapeHtml(feature.feature)}</span><a href="#${escapeHtml(feature.section)}">section: ${escapeHtml(feature.section)}</a></summary>
      <ul>${feature.scenarios.map(s => `<li>${escapeHtml(s)}</li>`).join('')}</ul>
    </details>
  `).join('');
}

loadData().catch(error => {
  console.error(error);
  document.body.insertAdjacentHTML('afterbegin', `<div class="callout" role="alert">Storefront mock data failed to load: ${escapeHtml(error.message)}</div>`);
});
