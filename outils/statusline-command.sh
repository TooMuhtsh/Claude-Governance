#!/usr/bin/env bash
# Claude Code statusLine:
# [barre] pct% Tkn | Branche (ou Modele si pas de repo git)
# [barre] pct% 5H  | temps avant reset
# [barre] pct% 7D  | temps avant reset (jours seuls si > 24h)
# Texte en blanc, barres en vert/orange/rouge selon le niveau.

node -e '
const { execSync } = require("child_process");

let input = "";
process.stdin.on("data", d => input += d);
process.stdin.on("end", () => {
  let data;
  try { data = JSON.parse(input); } catch { data = {}; }

  const RESET = "\x1b[0m";
  const DIM = "\x1b[2m";
  const WHITE = "\x1b[97m";
  const GREEN = "\x1b[32m";
  const YELLOW = "\x1b[33m";
  const RED = "\x1b[31m";

  const now = Math.floor(Date.now() / 1000);

  function pctColor(pct) {
    if (pct >= 80) return RED;
    if (pct >= 50) return YELLOW;
    return GREEN;
  }

  function bar(pct, width = 10) {
    const filled = Math.max(0, Math.min(width, Math.round((pct / 100) * width)));
    const empty = width - filled;
    return `${pctColor(pct)}${"█".repeat(filled)}${DIM}${"░".repeat(empty)}${RESET}`;
  }

  function fmtTime(resetsAt, allowDaysOnly) {
    let diff = resetsAt - now;
    if (diff < 0) diff = 0;
    if (allowDaysOnly && diff > 86400) {
      const days = Math.floor(diff / 86400);
      return `${days}j`;
    }
    const hours = Math.floor(diff / 3600);
    const minutes = Math.floor((diff % 3600) / 60);
    return `${String(hours).padStart(2, "0")}h ${String(minutes).padStart(2, "0")}m`;
  }

  function gitBranch(cwd) {
    if (!cwd) return null;
    try {
      return execSync("git branch --show-current", { cwd, stdio: ["ignore", "pipe", "ignore"] })
        .toString()
        .trim() || null;
    } catch {
      return null;
    }
  }

  const model = (data.model && data.model.display_name) || "?";
  const cwd = data.workspace && data.workspace.current_dir;
  const branch = gitBranch(cwd);
  const rightLabel = branch ? `${model} ${DIM}·${RESET}${WHITE} ${branch}` : model;

  const ctx = data.context_window || {};
  const ctxPct = typeof ctx.used_percentage === "number" ? Math.round(ctx.used_percentage) : null;

  function row(pct, label, rightText) {
    const pctStr = String(Math.round(pct)).padStart(3);
    return `${WHITE}[${bar(pct)}]${RESET} ${WHITE}${pctStr}% ${label}${RESET} ${WHITE}|${RESET} ${WHITE}${rightText}${RESET}`;
  }

  const line1 = ctxPct === null
    ? `${WHITE}${rightLabel}${RESET}`
    : row(ctxPct, "Tkn", rightLabel);

  const rl = data.rate_limits || {};

  function usageRow(label, entry, allowDaysOnly) {
    if (!entry || typeof entry.used_percentage !== "number") return null;
    const pct = Math.round(entry.used_percentage);
    const time = typeof entry.resets_at === "number" ? fmtTime(entry.resets_at, allowDaysOnly) : "--";
    return row(pct, label, time);
  }

  const lines = [
    line1,
    usageRow("5H ", rl.five_hour, false),
    usageRow("7D ", rl.seven_day, true),
  ].filter(Boolean);

  process.stdout.write(lines.join("\n"));
});
'
