local CONFIG = {
    version = "18.65.6-public-auto-trader-v33-teleport-handoff-fix",
    Enabled = true,
    JsonUrl = "https://raw.githubusercontent.com/zzourn/supreme-values/main/supremevalues_output.json",
    LinkedImagesUrl = "https://raw.githubusercontent.com/zzourn/supreme-values/main/linked_images.json",
    RefreshSeconds = 60,
    LinkedImagesRefreshSeconds = 20,
    LinkedImagesMaxRefreshSeconds = 300,
    PlayerValuesRefreshSeconds = 8,
    PlayerSweepSeconds = 2,
    InventoryRefreshSeconds = 5,
    InventoryDiscoverySeconds = 20,
    ProfileRefreshSeconds = 5,
    TradeRefreshSeconds = 2,
    RemoteTimeoutSeconds = 5,
    -- v32: separate caps by payload class. The real Supreme database is larger than
    -- the original 6 MiB v31 guess; schema/catalog validation remains the trust gate.
    SupremeJsonMaxBytes = 32 * 1024 * 1024,
    LinkedImagesJsonMaxBytes = 8 * 1024 * 1024,
    ServerListJsonMaxBytes = 8 * 1024 * 1024,
    DecisionDataMaxAgeSeconds = 1800,
    RemoteStaleSeconds = 24,
    MinimumCatalogItems = 200,
    TradeHelperDefault = true,
    ShouldTradeScore = 8,
    MaxOfferSlots = 4,
    ValueBadgeOnInventory = true,
    ValueBadgeOnTrade = true,
    ValueBadgeOnProfile = true,
    StatsButtons = true,
    TradePanel = true,
    AutoTraderActiveDefault = false,
    AutoTraderIgnoreFriendsDefault = true,
    AutoTraderOpeningAnchorDefault = true,
    AutoTraderPreferDuplicatesDefault = true,
    AutoTraderUnknownTheirZeroDefault = true,
    AutoTraderCooldownSeconds = 120,
    AutoTraderRepeatRequestSeconds = 20,
    AutoTraderRequestSpacingSeconds = 1.25,
    -- v27: outgoing requests are single-flight. After asking MM2 to cancel, wait
    -- for its native pending UI to disappear and remain quiet before another request.
    AutoTraderRequestCancelQuietSeconds = 1.0,
    AutoTraderRequestCancelConfirmTimeoutSeconds = 3.0,
    AutoTraderRequestNativeGoneGraceSeconds = 0.75,
    AutoTraderTradeDeclineConfirmTimeoutSeconds = 3.0,
    AutoTraderTradeDeclineQuietSeconds = 0.5,
    AutoTraderStableSeconds = 0.9,
    AutoTraderTradeWarmupSeconds = 0.6,
    AutoTraderActionTimeoutSeconds = 1.8,
    AutoTraderAcceptDelaySeconds = 6.15,
    AutoTraderAcceptRetryCheckSeconds = 0.35,
    AutoTraderSuccessNotificationSeconds = 15,
    AutoTraderPostTradeAuditTimeoutSeconds = 12,
    -- v30: once both sides are accepted, never teleport just because the completion
    -- event is a little late. Reconcile authoritative trade state and, if the trade
    -- has actually vanished, recover the owned transaction through its inventory audit.
    AutoTraderAcceptedSettlementProbeSeconds = 2.5,
    AutoTraderAcceptedSettlementGoneQuietSeconds = 0.75,
    AutoTraderAcceptedSettlementPollSeconds = 1.0,
    AutoTraderFriendTradeResolveSeconds = 4.0,
    AutoTraderTradePartnerResolveSeconds = 4.0,
    AutoTraderActiveInventoryResolveSeconds = 6.0,
    AutoTraderFriendLookupMaxWaitSeconds = 8.0,
    AutoTraderRetryWaitMaxSeconds = 3.0,
    AutoTraderPendingRequestTimeoutSeconds = 12,
    AutoTraderFirstOfferTimeoutSeconds = 18,
    AutoTraderTradeIdleTimeoutSeconds = 26,
    AutoTraderAnchorMaxValue = 100,
    -- Profit-throughput optimizer. The dynamic minimum win remains the hard
    -- safety floor; these margins are negotiation targets above that floor.
    AutoTraderNegotiationStage1Margin = 0.18,
    AutoTraderNegotiationStage2Margin = 0.11,
    AutoTraderNegotiationStage3Margin = 0.06,
    AutoTraderNegotiationStage2Seconds = 3.5,
    AutoTraderNegotiationStage3Seconds = 7.0,
    AutoTraderNegotiationFinalSeconds = 11.0,
    AutoTraderTargetOpportunityFloor = 0.014,
    AutoTraderEconomicSkipGraceSeconds = 12,
    -- Stay-vs-hop economics. The learned hop benchmark is intentionally
    -- discounted because teleport/discovery has real overhead and uncertainty.
    AutoTraderHopOpportunityDefault = 0.020,
    AutoTraderHopOpportunityRetentionFactor = 0.82,
    AutoTraderHopOpportunityMax = 0.12,
    AutoTraderBeamWidth = 3200,
    AutoTraderExactStateLimit = 10000,
    AutoTraderExactQuantityLimit = 80,
    AutoTraderMinWinPercent = 0.015,
    AutoTraderRecedingRiskPercent = 0.010,
    AutoTraderUnderpaidRiskPercent = 0.0075,
    AutoTraderFluctuatingRiskPercent = 0.003,
    AutoTraderRejectUntradable = true,
    AutoTraderMaxRecedingShare = 0.40,
    AutoTraderMaxUnderpaidShare = 0.55,
    AutoTraderMaxDemandDrop = 1.50,
    AutoTraderMaxFlipDrop = 1.25,
    AutoTraderMaxStabilityDrop = 1.50,
    AutoTraderTargetStatsDecayPerDay = 0.985,
    AutoTraderTargetStatsMaxPlayers = 1500,
    AutoTraderTargetStatsTtlDays = 30,
    AutoTraderServerHopEnabled = true,
    AutoTraderUnresolvedMaxWaitSeconds = 22,
    AutoTraderDiscoveryRetrySeconds = 4,
    AutoTraderDiscoveryRetryLimit = 3,
    AutoTraderServerHopGraceSeconds = 2.5,
    AutoTraderServerHopRetrySeconds = 5,
    AutoTraderServerRescanDelaySeconds = 2.0,
    AutoTraderServerRateLimitMaxBackoffSeconds = 16,
    AutoTraderServerRateLimitBlindHopAfterScans = 2,
    AutoTraderServerHopTotalTimeoutSeconds = 45,
    AutoTraderServerTeleportAttemptTimeoutSeconds = 8,
    AutoTraderServerListPages = 2,
    AutoTraderServerCandidateLimit = 180,
    AutoTraderServerQueueLimit = 30,
    -- v27: successful scans feed a cross-teleport candidate pool. Entries are
    -- deliberately short-lived: after three minutes the instance may be gone or
    -- its population may have changed enough that the old preview is not useful.
    AutoTraderServerCandidateCacheTtlSeconds = 180,
    AutoTraderServerCandidateCacheLimit = 30,
    AutoTraderServerFirstPageUsableTarget = 30,
    AutoTraderRecentServerFallbackMinAgeSeconds = 90,
    AutoTraderServerPreferredMinOccupancy = 0.60,
    AutoTraderServerPreferredMaxOccupancy = 0.96,
    AutoTraderOutgoingNativeConfirmSeconds = 1.35,
    AutoTraderRequestInvokeTimeoutSeconds = 3.25,
    AutoTraderHttpTimeoutSeconds = 7.5,
    AutoTraderIncomingResolveSeconds = 5.5,
    AutoTraderIncomingUnresolvedTimeoutSeconds = 7,
    AutoTraderIncomingStuckTimeoutSeconds = 14,
    AutoTraderStaleTradeGuiTimeoutSeconds = 12,
    AutoTraderAbsoluteTradeTimeoutSeconds = 90,
    AutoTraderServerHopHardTimeoutSeconds = 35,
    AutoTraderTeleportStartedHardTimeoutSeconds = 22,
    AutoTraderOperationalRecoveryDelaySeconds = 2.5,
    AutoTraderRecoveryRetrySeconds = 4,
    AutoTraderNoEligibleWorkTimeoutSeconds = 45,
    AutoTraderServerNoProgressTimeoutSeconds = 75,
    AutoTraderPostTradeAuditSupervisorSeconds = 18,
    AutoTraderStartupPlayerGuiTimeoutSeconds = 20,
    AutoTraderExecutorFileTimeoutSeconds = 2.5,
    AutoTraderExecutorDecompileTimeoutSeconds = 8,
    AutoTraderRemoteInvokeHungRecoverySeconds = 1.5,
    AutoTraderRemoteInvokeMaxLive = 1,
    AutoTraderBootstrapBotDbMaxIcons = 300,
    AutoTraderBootstrapBotDbJobsPerIcon = 12,
    AutoTraderBootstrapMaxAttempts = 8,
    AutoTraderBootstrapInitialRetrySeconds = 2,
    AutoTraderBootstrapMaxRetrySeconds = 30,
    AutoTraderBootstrapHttpAttemptTimeoutSeconds = 10,
    AutoTraderBootstrapExecutionTimeoutSeconds = 75,
    AutoTraderPlannerBucketFrontier = 10000,
    AutoTraderPlannerYieldBudgetMs = 4,
    AutoTraderRecoverySameReasonCooldownSeconds = 8,
    AutoTraderDiskLogMaxBytes = 524288,
    AutoTraderDiskLogFlushEveryEvents = 12,
    AutoTraderIncomingActionTimeoutSeconds = 2.5,
    AutoTraderThumbnailBatchSize = 100,
    -- v27 bot architecture: bot learning, current-server hop decisions, and
    -- pre-join server selection are deliberately independent systems. Only a
    -- physically certified all-bot server may add hashes to the strict database.
    -- Server-list GETs prefer game:HttpGet and validate token-bearing rows before
    -- falling back to executor HTTP; unavailable previews are UNKNOWN, not blocked. Bot certification uses persistent per-player evidence across deaths, respawns, and membership changes.
    -- Bot certification uses only replicated remote Humanoid.MoveDirection plus
    -- RootPart movement/facing. Animation tracks and inventory/value behavior are
    -- completely excluded from bot learning.
    AutoTraderBotCurrentPreviewRetrySeconds = 5,
    AutoTraderGoldBotMinPreviewSamples = 5,
    AutoTraderGoldBotRejectRatio = 0.50,
    AutoTraderGoldBotWarnRatio = 0.30,
    AutoTraderGoldBotObservedMinJobs = 1,
    AutoTraderGoldBotKnownMinJobs = 2,
    AutoTraderGoldBotConfirmMinJobs = 3,
    -- v27: 10s is now a hard cap/cold-start default, not an unconditional hold.
    -- Once human servers have been observed, the bot hold becomes
    -- min(10s, longest persisted human-detection latency + 1s).
    AutoTraderGoldObserveSeconds = 10,
    AutoTraderGoldAdaptiveObservePaddingSeconds = 1,
    AutoTraderGoldHumanTimingSampleLimit = 100,
    AutoTraderGoldSampleSeconds = 0.05,
    AutoTraderGoldMoveDirectionEpsilon = 0.05,
    -- v27: transient remote movement is telemetry, not a whole-server verdict.
    -- After a short character settle period, only a sustained/repeated nonzero
    -- MoveDirection burst can permanently classify the JobId as regular.
    AutoTraderGoldCharacterSettleSeconds = 1.5,
    AutoTraderGoldMoveDirectionViolationMinSamples = 10,
    AutoTraderGoldMoveDirectionViolationMinSpanSeconds = 0.45,
    AutoTraderGoldMoveDirectionViolationGapSeconds = 0.35,
    AutoTraderGoldOrientationFuzzDegrees = 7,
    AutoTraderGoldMovementStepStuds = 0.35,
    AutoTraderGoldMinTotalDistanceStuds = 8,
    AutoTraderGoldMinMaxDisplacementStuds = 4,
    AutoTraderGoldMinMovingSamples = 6,
    AutoTraderGoldMinMovementSpanSeconds = 2.5,
    AutoTraderGoldMinRemotePlayers = 5,
    AutoTraderGoldThumbnailRetrySeconds = 2,
    AutoTraderGoldCertificationHistoryLimit = 5,
    AutoTraderBotDatabaseMaxIcons = 1200,
    AutoTraderBotDatabaseJobsPerIcon = 64,
    AutoTraderRecentServerTtlSeconds = 1200,
    AutoTraderRecentServerLimit = 30,
    AutoTraderMovementWatchdogEnabled = true,
    AutoTraderMovementTimeoutSeconds = 20,
    AutoTraderMovementJoinGraceSeconds = 25,
    AutoTraderMovementThresholdStuds = 0.15,
    AutoTraderSameServerRecoveryCooldownSeconds = 45,
    AutoTraderTeleportScriptUrl = "https://raw.githubusercontent.com/zzourn/supreme-values/main/script.lua",
    PreferNativeIdentity = true,
    LinkedImagesFallback = true,
    ConservativeResolution = true,
    ProfileRequireTrustedMatches = true,
    UseDecompiledSyncFallback = true,
    SafeColor = Color3.fromRGB(83, 218, 142),
    BestColor = Color3.fromRGB(255, 210, 74),
    Weights = {
        valuePerPercent = 1.5,
        valueCap = 60,
        demandPerPoint = 4,
        demandCap = 20,
        flipPerPoint = 5,
        flipCap = 15,
        stabilityPerPoint = 2.5,
        stabilityCap = 10,
        trendPerPercent = 0.75,
        trendCap = 10,
        rarityPerPoint = 1.25,
        rarityCap = 5,
        itemCountPerItem = 2,
        itemCountCap = 5,
    },
}
local CONTROLLER_VERSION = CONFIG.version
local HARDEN = {
    supportFormat = "SV_AUTO_TRADER_SUPPORT_V33",
    distributionNormalizedSha256 = "9c8fd7d717a21d1350432f53d2de21d48bc7829268619f4630e9beb650c70c35",
    readyGlobalCurrent = "__SV_AUTO_TRADER_V31_READY",
    readyGlobalLegacy = "__SV_AUTO_TRADER_V14_READY",
    subsystemHealth = {},
    guiDiscovery = {mainCalls=0,tradeCalls=0,tradeCacheHits=0,tradeSuccess=0,inventoryScans=0,totalTradeSeconds=0,maxTradeSeconds=0,totalInventorySeconds=0,maxInventorySeconds=0},
}
local function validateConfigRelationships()
    local errors = {}
    local function need(condition, message) if not condition then table.insert(errors, message) end end
    need(CONFIG.AutoTraderNegotiationStage2Seconds > 0, "negotiation stage 2 must be positive")
    need(CONFIG.AutoTraderNegotiationStage3Seconds > CONFIG.AutoTraderNegotiationStage2Seconds, "stage 3 must follow stage 2")
    need(CONFIG.AutoTraderNegotiationFinalSeconds > CONFIG.AutoTraderNegotiationStage3Seconds, "final stage must follow stage 3")
    need(CONFIG.AutoTraderServerPreferredMinOccupancy >= 0 and CONFIG.AutoTraderServerPreferredMinOccupancy < CONFIG.AutoTraderServerPreferredMaxOccupancy, "server occupancy min/max are invalid")
    need(CONFIG.AutoTraderServerPreferredMaxOccupancy <= 1, "server occupancy max must be <= 1")
    need(CONFIG.AutoTraderBeamWidth > 0 and CONFIG.AutoTraderBeamWidth <= CONFIG.AutoTraderExactStateLimit, "beam width must be positive and <= exact state limit")
    need(CONFIG.AutoTraderExactQuantityLimit > 0, "exact quantity limit must be positive")
    need(CONFIG.AutoTraderPlannerBucketFrontier >= 2, "planner bucket frontier must preserve at least two states")
    need(CONFIG.AutoTraderGoldSampleSeconds > 0 and CONFIG.AutoTraderGoldMoveDirectionViolationGapSeconds >= CONFIG.AutoTraderGoldSampleSeconds, "gold detector timing is inconsistent")
    need(CONFIG.AutoTraderMinWinPercent >= 0 and CONFIG.AutoTraderMinWinPercent <= 1, "minimum-win percentage is invalid")
    need(CONFIG.AutoTraderGoldBotRejectRatio >= 0 and CONFIG.AutoTraderGoldBotRejectRatio <= 1, "bot reject ratio is invalid")
    need(CONFIG.AutoTraderGoldBotWarnRatio >= 0 and CONFIG.AutoTraderGoldBotWarnRatio <= CONFIG.AutoTraderGoldBotRejectRatio, "bot warn/reject ratios are invalid")
    need(CONFIG.RemoteTimeoutSeconds > 0 and CONFIG.AutoTraderHttpTimeoutSeconds > 0, "remote/http timeouts must be positive")
    need(CONFIG.AutoTraderBootstrapMaxAttempts > 0 and CONFIG.AutoTraderBootstrapInitialRetrySeconds > 0, "bootstrap retry policy is invalid")
    need(CONFIG.AutoTraderBootstrapHttpAttemptTimeoutSeconds > 0 and CONFIG.AutoTraderBootstrapExecutionTimeoutSeconds > 0, "bootstrap operation timeouts must be positive")
    if #errors > 0 then error("Invalid Supreme Values configuration: " .. table.concat(errors, "; ")) end
end
if not CONFIG.Enabled then
    return
end
validateConfigRelationships()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = nil
pcall(function()
    VirtualInputManager = game:GetService("VirtualInputManager")
end)
local VirtualUser = nil
pcall(function()
    VirtualUser = game:GetService("VirtualUser")
end)
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    -- Direct execution can still happen before Roblox has published Players.LocalPlayer.
    -- The teleport bootstrap now gates on game:IsLoaded()/LocalPlayer/PlayerGui first,
    -- but keep this bounded fallback for executor-specific startup ordering.
    local deadline = os.clock() + math.max(1, tonumber(CONFIG.AutoTraderStartupPlayerGuiTimeoutSeconds) or 20)
    while not LocalPlayer and os.clock() < deadline do
        task.wait(0.05)
        LocalPlayer = Players.LocalPlayer
    end
end
if not LocalPlayer then
    error("SupremeValues_PC_PublicHelper could not obtain LocalPlayer inside the bounded startup window.")
end
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    or LocalPlayer:WaitForChild("PlayerGui", CONFIG.AutoTraderStartupPlayerGuiTimeoutSeconds)
if not PlayerGui then
    error("SupremeValues_PC_PublicHelper could not obtain PlayerGui inside the bounded startup window.")
end
local function earlyExecutorEnvironment()
    local getter = rawget(_G, "getgenv")
    if type(getter) == "function" then
        local ok, env = pcall(getter)
        if ok and type(env) == "table" then return env end
    end
    return _G
end
local EarlyExecutorEnvironment = earlyExecutorEnvironment()
local function pickExecutorRequest()
    local candidates = {}
    local function add(value)
        if type(value) == "function" then table.insert(candidates, value) end
    end
    pcall(function() add(request) end)
    pcall(function() add(http_request) end)
    pcall(function() if type(syn) == "table" then add(syn.request) end end)
    pcall(function() if type(http) == "table" then add(http.request) end end)
    pcall(function() if type(fluxus) == "table" then add(fluxus.request) end end)
    pcall(function() if type(krnl) == "table" then add(krnl.request) end end)
    for _, name in ipairs({"request", "http_request", "httprequest"}) do add(rawget(EarlyExecutorEnvironment, name)) end
    for _, tableName in ipairs({"syn", "http", "fluxus", "krnl"}) do
        local t = rawget(EarlyExecutorEnvironment, tableName)
        if type(t) == "table" then add(t.request) end
    end
    return candidates[1]
end
local httpRequest = pickExecutorRequest()
if type(httpRequest) ~= "function" then
    warn("[SV Public] No compatible request(options) HTTP function is available; game:HttpGet fallbacks will be used where possible.")
end
-- Executor calls cannot generally be cancelled. This helper bounds only how long
-- *we wait* for an operation. Timed-out operations remain tracked until their
-- spawned callback actually returns, so diagnostics never confuse a deadline with
-- cancellation and non-idempotent callers can avoid unsafe retries.
HARDEN.externalOperations = {nextId = 0, live = {}, timedOut = 0, lateCompletions = 0}
local function waitForExternalWithDeadline(label, timeoutSeconds, callback)
    HARDEN.externalOperations.nextId += 1
    local request = {
        id = HARDEN.externalOperations.nextId,
        label = tostring(label or "external call"),
        startedAt = os.clock(),
        done = false, ok = false, result = nil, timedOut = false, finishedAt = nil,
    }
    HARDEN.externalOperations.live[request.id] = request
    task.spawn(function()
        local ok, result = pcall(callback)
        request.ok = ok
        request.result = result
        request.done = true
        request.finishedAt = os.clock()
        HARDEN.externalOperations.live[request.id] = nil
        if request.timedOut then
            HARDEN.externalOperations.lateCompletions += 1
        end
    end)
    local deadline = os.clock() + math.max(0.25, tonumber(timeoutSeconds) or 5)
    while not request.done and os.clock() < deadline do
        task.wait(0.03)
    end
    if not request.done then
        request.timedOut = true
        HARDEN.externalOperations.timedOut += 1
        return false, request.label .. " timed out while the underlying operation may still be running", request
    end
    return request.ok, request.result, request
end
local function externalOperationHealth()
    local live, hung = 0, 0
    local oldestHung = 0
    local now = os.clock()
    for _, op in pairs(HARDEN.externalOperations.live) do
        live += 1
        if op.timedOut then
            hung += 1
            oldestHung = math.max(oldestHung, now - (op.startedAt or now))
        end
    end
    return {
        live = live, hung = hung, oldestHungSeconds = oldestHung,
        totalTimedOut = HARDEN.externalOperations.timedOut,
        lateCompletions = HARDEN.externalOperations.lateCompletions,
    }
end
HARDEN.sha256K = {
    0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
    0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
    0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
    0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
    0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
    0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2,
}
local function sha256Hex(message, cooperative)
    -- Large Supreme payloads are hashed cooperatively so pure-Luau SHA does not
    -- monopolize the VM for many seconds. Small integrity checks stay synchronous.
    if type(message) ~= "string" or type(bit32) ~= "table" then return nil, 0, 0 end
    local startedAt = os.clock()
    local yieldEnabled = cooperative == true and #message >= 1048576 and RunService ~= nil
    local yieldStartedAt = startedAt
    local blocksSinceYield = 0
    local yieldCount = 0
    local band, bxor, bnot, rshift, rrotate = bit32.band, bit32.bxor, bit32.bnot, bit32.rshift, bit32.rrotate
    local h0,h1,h2,h3,h4,h5,h6,h7 = 0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19
    local function maybeYield()
        if not yieldEnabled then return end
        blocksSinceYield += 1
        if blocksSinceYield >= 64 and os.clock() - yieldStartedAt >= 0.003 then
            blocksSinceYield = 0
            yieldCount += 1
            RunService.Heartbeat:Wait()
            yieldStartedAt = os.clock()
        end
    end
    local function processBlock(source, offset)
        local w = {}
        for i = 0, 15 do
            local j = offset + i * 4
            local b1,b2,b3,b4 = string.byte(source, j, j + 3)
            if b4 == nil then return false end
            w[i] = b1 * 16777216 + b2 * 65536 + b3 * 256 + b4
        end
        for i = 16, 63 do
            local s0 = bxor(rrotate(w[i - 15], 7), rrotate(w[i - 15], 18), rshift(w[i - 15], 3))
            local s1 = bxor(rrotate(w[i - 2], 17), rrotate(w[i - 2], 19), rshift(w[i - 2], 10))
            w[i] = band(w[i - 16] + s0 + w[i - 7] + s1, 0xffffffff)
        end
        local a,b,c,d,e,f,g,h = h0,h1,h2,h3,h4,h5,h6,h7
        for i = 0, 63 do
            local S1 = bxor(rrotate(e, 6), rrotate(e, 11), rrotate(e, 25))
            local ch = bxor(band(e, f), band(bnot(e), g))
            local t1 = band(h + S1 + ch + HARDEN.sha256K[i + 1] + w[i], 0xffffffff)
            local S0 = bxor(rrotate(a, 2), rrotate(a, 13), rrotate(a, 22))
            local maj = bxor(band(a, b), band(a, c), band(b, c))
            local t2 = band(S0 + maj, 0xffffffff)
            h,g,f,e,d,c,b,a = g,f,e,band(d + t1, 0xffffffff),c,b,a,band(t1 + t2, 0xffffffff)
        end
        h0,h1,h2,h3,h4,h5,h6,h7 = band(h0+a,0xffffffff),band(h1+b,0xffffffff),band(h2+c,0xffffffff),band(h3+d,0xffffffff),band(h4+e,0xffffffff),band(h5+f,0xffffffff),band(h6+g,0xffffffff),band(h7+h,0xffffffff)
        maybeYield()
        return true
    end
    local byteLength = #message
    local fullBytes = byteLength - (byteLength % 64)
    for offset = 1, fullBytes, 64 do
        if not processBlock(message, offset) then return nil, yieldCount, (os.clock() - startedAt) * 1000 end
    end
    local bitLength = byteLength * 8
    local high = math.floor(bitLength / 4294967296)
    local low = bitLength % 4294967296
    local function u32be(value)
        return string.char(
            band(rshift(value, 24), 0xff), band(rshift(value, 16), 0xff),
            band(rshift(value, 8), 0xff), band(value, 0xff)
        )
    end
    local tail = string.sub(message, fullBytes + 1) .. string.char(0x80)
    tail = tail .. string.rep("\0", (56 - (#tail % 64)) % 64) .. u32be(high) .. u32be(low)
    for offset = 1, #tail, 64 do
        if not processBlock(tail, offset) then return nil, yieldCount, (os.clock() - startedAt) * 1000 end
    end
    return string.format("%08x%08x%08x%08x%08x%08x%08x%08x", h0,h1,h2,h3,h4,h5,h6,h7), yieldCount, (os.clock() - startedAt) * 1000
end
local function normalizeDistributionSourceForHash(source)
    if type(source) ~= "string" then return nil end
    local normalized, count = source:gsub(
        'distributionNormalizedSha256 = "[^"]+"',
        'distributionNormalizedSha256 = "__BUILD_SHA256_PLACEHOLDER__"',
        1
    )
    if count ~= 1 then return nil end
    return normalized
end
local function verifyDistributionSource(source)
    if type(source) ~= "string" or #source < 1000 then return false, "source missing/too small" end
    if not source:find(CONTROLLER_VERSION, 1, true) then return false, "controller version marker mismatch" end
    local normalized = normalizeDistributionSourceForHash(source)
    if not normalized then return false, "distribution hash field missing" end
    local digest = sha256Hex(normalized)
    if not digest then return false, "SHA-256 unavailable" end
    if string.lower(digest) ~= string.lower(HARDEN.distributionNormalizedSha256) then
        return false, "distribution SHA-256 mismatch"
    end
    return true, digest
end
local function boundedHttpRequest(options, timeoutSeconds)
    if type(httpRequest) ~= "function" then
        return false, "request(options) unavailable"
    end
    return waitForExternalWithDeadline("HTTP request", timeoutSeconds or 7.5, function()
        return httpRequest(options)
    end)
end
local function boundedGameHttpGet(url, timeoutSeconds)
    return waitForExternalWithDeadline("game:HttpGet", timeoutSeconds or 7.5, function()
        return game:HttpGet(url)
    end)
end
local function normalizeHttpResponse(response)
    if type(response) == "string" then
        return {
            Success = true,
            StatusCode = 200,
            StatusMessage = "OK",
            Body = response,
            Headers = {},
        }
    end
    if type(response) ~= "table" then
        return nil
    end
    local statusCode = tonumber(
        response.StatusCode
        or response.statusCode
        or response.Status
        or response.status
        or response.status_code
    )
    local success = response.Success
    if success == nil then success = response.success end
    if success == nil and statusCode then
        success = statusCode >= 200 and statusCode < 400
    end
    local body = response.Body
        or response.body
        or response.ResponseBody
        or response.responseBody
        or response.response_body
    local headers = response.Headers or response.headers or {}
    return {
        Success = success == true,
        StatusCode = statusCode,
        StatusMessage = response.StatusMessage
            or response.statusMessage
            or response.status_message
            or response.Message
            or response.message,
        Body = body,
        Headers = type(headers) == "table" and headers or {},
    }
end
local function fetchStaticTextCompat(url, headers, timeoutSeconds)
    local requestError = nil
    if type(httpRequest) == "function" then
        local ok, rawResponse = boundedHttpRequest({
            Url = url,
            URL = url,
            Method = "GET",
            Headers = headers or {},
        }, timeoutSeconds or 7.5)
        if ok then
            local normalized = normalizeHttpResponse(rawResponse)
            if normalized and (normalized.StatusCode == 304 or normalized.Success) then
                return true, normalized, "request"
            end
            if normalized then
                requestError = "HTTP " .. tostring(normalized.StatusCode or "?")
            else
                requestError = "request returned an unsupported response shape"
            end
        else
            requestError = tostring(rawResponse)
        end
    else
        requestError = "request(options) unavailable"
    end

    local okGet, body = boundedGameHttpGet(url, timeoutSeconds or 7.5)
    if okGet and type(body) == "string" and body ~= "" then
        return true, {
            Success = true,
            StatusCode = 200,
            StatusMessage = "OK",
            Body = body,
            Headers = {},
        }, "game:HttpGet"
    end
    return false, tostring(requestError or "request failed")
        .. "; game:HttpGet fallback: "
        .. tostring(body), nil
end
local GLOBAL_KEY = "__SUPREME_VALUES_PC_PUBLIC_HELPER"
do
    local old = rawget(_G, GLOBAL_KEY)
    if type(old) == "table" and type(old.Destroy) == "function" then
        pcall(old.Destroy)
    end
end
local THEME = {
    -- v30: compact Windows 7 / Frutiger Aero palette. Light neutral surfaces
    -- and dark text are intentionally used for legibility at small UI sizes.
    bg = Color3.fromRGB(214, 232, 242),
    panel = Color3.fromRGB(242, 248, 252),
    panel2 = Color3.fromRGB(232, 242, 248),
    panel3 = Color3.fromRGB(214, 232, 243),
    border = Color3.fromRGB(116, 157, 181),
    text = Color3.fromRGB(24, 43, 54),
    muted = Color3.fromRGB(58, 82, 96),
    faint = Color3.fromRGB(91, 113, 124),
    green = Color3.fromRGB(45, 128, 43),
    yellow = Color3.fromRGB(173, 111, 0),
    red = Color3.fromRGB(183, 49, 57),
    blue = Color3.fromRGB(28, 104, 164),
    purple = Color3.fromRGB(103, 78, 157),
    orange = Color3.fromRGB(184, 91, 17),
}
local Connections = {}
local Destroyed = false
HARDEN.destroying = false
local State = {
    UnresolvedCards = setmetatable({}, {__mode = "k"}),
    PendingCardDecorations = setmetatable({}, {__mode = "k"}),
    LastGameDatabase = nil,
    TradeWeaponRoot = nil,
    TradePetRoot = nil,
    TradeInventoryConnections = {},
    TradeHelperGeneration = 0,
    TradeInventoryRoots = {},
    TradeDiscoveryCandidates = {},
    LastTradeHelperStats = {
        cards = 0,
        numeric = 0,
        offerable = 0,
        evaluable = 0,
        safe = 0,
    },
    TradeInventoryRefreshGeneration = 0,
    TradeHelperRetryGeneration = 0,
    TradeHelperRetryCount = 0,
    Profile = {
        root = nil,
        weaponItems = nil,
        petItems = nil,
        connections = {},
        scanGeneration = 0,
        currentUsername = nil,
        totalsByName = {},
        remoteCardHintsByUserId = {},
        leaderboardBadges = setmetatable({}, {__mode = "k"}),
        visibleRemoteGeneration = 0,
        summaryDisplay = {
            username = nil,
            total = 0,
            partial = true,
            source = nil,
            breakdownValues = {},
        },
        remoteTotals = {
            running = false,
            generation = 0,
            pendingSweep = false,
            forceSweep = false,
            pendingNativeResweep = false,
            rawByUserId = {},
            lastSuccessByUserId = {},
            failureCountByUserId = {},
            retryAfterByUserId = {},
            inFlightByUserId = {},
            hungByUserId = {},
            liveInvokeCount = 0,
            invokeLatencies = {},
            requestSerial = 0,
            circuitOpen = false,
            circuitOpenedAt = 0,
        },
    },
}
local UI = {}
local function connect(signal, callback)
    local connection = signal:Connect(callback)
    table.insert(Connections, connection)
    return connection
end
local function safeDisconnectAll()
    for _, connection in ipairs(Connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    table.clear(Connections)
end
local function clamp(n, a, b)
    return math.max(a, math.min(b, n))
end
local function trim(value)
    return tostring(value or ""):match("^%s*(.-)%s*$")
end
local function normalize(value)
    local s = string.lower(trim(value))
    s = s:gsub("[’`]", "'")
    s = s:gsub("%s+", " ")
    return s
end
local function canonicalName(value)
    local s = normalize(value)
    s = s:gsub("^chroma%s+", "")
    s = s:gsub("^c%.%s*", "")
    s = s:gsub("%s*%(knife%)%s*$", " knife")
    s = s:gsub("%s*%(gun%)%s*$", " gun")
    s = s:gsub("[^%w%s]", "")
    s = s:gsub("%s+", " ")
    return trim(s)
end
local function tonumberSafe(value)
    if type(value) == "number" then
        return value
    end
    if type(value) == "string" then
        return tonumber(value)
    end
    return nil
end
local function parsePercent(value)
    if type(value) ~= "string" then
        return nil
    end
    local numberText = value:match("([+-]?[%d%.]+)%%")
    return numberText and tonumber(numberText) or nil
end
local function numericValue(item)
    if type(item) ~= "table" then
        return nil
    end
    if type(item.raw_value) == "number" then
        return item.raw_value
    end
    if type(item.value) == "number" then
        return item.value
    end
    if type(item.value) == "string" then
        local cleaned = item.value:gsub(",", ""):gsub("%s+", "")
        if cleaned:match("^%d+%.?%d*$") then
            return tonumber(cleaned)
        end
    end
    return nil
end
local function formatNumber(value)
    if value == nil then
        return "?"
    end
    local rounded
    if math.abs(value - math.floor(value)) < 0.000001 then
        rounded = tostring(math.floor(value))
    else
        rounded = string.format("%.2f", value):gsub("0+$", ""):gsub("%.$", "")
    end
    local sign, whole, fraction = rounded:match("^(-?)(%d+)(%.?%d*)$")
    if not whole then
        return rounded
    end
    whole = whole:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    return sign .. whole .. fraction
end
local function formatCompact(value)
    if value == nil then
        return "?"
    end
    local absValue = math.abs(value)
    if absValue >= 1000000 then
        local n = value / 1000000
        return (math.abs(n) >= 100 and string.format("%.0fM", n)
            or math.abs(n) >= 10 and string.format("%.1fM", n)
            or string.format("%.2fM", n)):gsub("%.0M", "M")
    end
    if absValue >= 1000 then
        local n = value / 1000
        return (math.abs(n) >= 100 and string.format("%.0fk", n)
            or math.abs(n) >= 10 and string.format("%.1fk", n)
            or string.format("%.2fk", n))
            :gsub("%.0k", "k")
            :gsub("(%..-)0k$", "%1k")
    end
    return formatNumber(value)
end
HARDEN.formatDuration = function(seconds)
    local value = math.max(0, tonumber(seconds) or 0)
    if value < 60 then return string.format(value < 10 and "%.1fs" or "%.0fs", value) end
    if value < 3600 then return string.format("%dm %02ds", math.floor(value / 60), math.floor(value % 60)) end
    return string.format("%dh %02dm", math.floor(value / 3600), math.floor((value % 3600) / 60))
end
local function formatPercent(value, includePlus)
    if value == nil then
        return "?"
    end
    local prefix = includePlus and value > 0 and "+" or ""
    return prefix .. string.format("%.1f%%", value)
end
local function getTextFromItemName(frame)
    if not frame then
        return nil
    end
    local itemName = frame:FindFirstChild("ItemName")
    if itemName then
        if itemName:IsA("TextLabel") or itemName:IsA("TextButton") then
            local text = trim(itemName.Text)
            if text ~= "" then
                return text
            end
        end
        local label = itemName:FindFirstChild("Label")
        if label and (label:IsA("TextLabel") or label:IsA("TextButton")) then
            local text = trim(label.Text)
            if text ~= "" then
                return text
            end
        end
    end
    return nil
end
local function getAmountFromCard(frame)
    local container = frame and frame:FindFirstChild("Container")
    local amountObject = container and container:FindFirstChild("Amount")
    if amountObject and (amountObject:IsA("TextLabel") or amountObject:IsA("TextButton")) then
        local n = tostring(amountObject.Text):match("(%d+)")
        if n then
            return tonumber(n)
        end
    end
    return nil
end
local function hasAncestorNamed(instance, name)
    local current = instance
    while current do
        if current.Name == name then
            return true
        end
        current = current.Parent
    end
    return false
end
local function findFirstDescendantByName(root, targetName)
    if not root then
        return nil
    end
    for _, descendant in ipairs(root:GetDescendants()) do
        if descendant.Name == targetName then
            return descendant
        end
    end
    return nil
end
local function safeFindPath(root, names)
    local current = root
    for _, name in ipairs(names) do
        if not current then
            return nil
        end
        current = current:FindFirstChild(name)
    end
    return current
end
local function create(className, properties, parent)
    local object = Instance.new(className)
    for key, value in pairs(properties or {}) do
        object[key] = value
    end
    if parent then
        object.Parent = parent
    end
    return object
end
local function addCorner(parent, radius)
    return create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8),
    }, parent)
end
local function addStroke(parent, color, thickness, transparency)
    return create("UIStroke", {
        Color = color or THEME.border,
        Thickness = thickness or 1,
        Transparency = transparency or 0,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
    }, parent)
end
local function makeLabel(parent, text, textSize, color, font)
    return create("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = text or "",
        TextColor3 = color or THEME.text,
        TextSize = math.max(10, tonumber(textSize) or 13),
        Font = font or Enum.Font.Arial,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
    }, parent)
end
local function makeButton(parent, text, size, color)
    local button = create("TextButton", {
        Size = size,
        BackgroundColor3 = color or THEME.panel3,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Text = text or "",
        TextColor3 = THEME.text,
        TextSize = 12,
        Font = Enum.Font.Arial,
    }, parent)
    addCorner(button, 4)
    return button
end
local function setButtonHover(button, normalColor, hoverColor)
    connect(button.MouseEnter, function()
        if button.Parent then
            TweenService:Create(button, TweenInfo.new(0.12), {
                BackgroundColor3 = hoverColor,
            }):Play()
        end
    end)
    connect(button.MouseLeave, function()
        if button.Parent then
            TweenService:Create(button, TweenInfo.new(0.12), {
                BackgroundColor3 = normalColor,
            }):Play()
        end
    end)
end
local function listText(values)
    if #values == 0 then
        return ""
    elseif #values == 1 then
        return tostring(values[1])
    elseif #values == 2 then
        return tostring(values[1]) .. " and " .. tostring(values[2])
    end
    local first = {}
    for i = 1, #values - 1 do
        table.insert(first, tostring(values[i]))
    end
    return table.concat(first, ", ") .. ", and " .. tostring(values[#values])
end
local LinkedImages = {}
local LastLinkedImagesBody = nil
local LastSupremeBody = nil
local HttpState = {
    linkedETag = nil, supremeETag = nil,
    linkedLastModified = nil, supremeLastModified = nil,
    linkedUnchanged = 0, supremeUnchanged = 0,
    requestCount = 0, gameHttpGetCount = 0, notModifiedCount = 0, fullDownloadCount = 0,
    downloadedBytes = 0, errorCount = 0,
}
HARDEN.supremeLkgFile = "SV_AutoTrader_SupremeValues_LKG_v2.body"
HARDEN.supremeLkgMetaFile = "SV_AutoTrader_SupremeValues_LKG_v2.meta.json"
HARDEN.supremeLkgLegacyFile = "SV_AutoTrader_SupremeValues_LKG_v1.json"
HARDEN.mappingsLkgFile = "SV_AutoTrader_LinkedImages_LKG_v1.json"
State.Mapping = {
    ItemLinks = {},
    Revision = 0,
}
State.Mapping.MakeItemKey = function(itemType, itemId)
    local normalizedType =
        normalize(itemType or "")
    local prefix =
        normalizedType:find(
            "pet",
            1,
            true
        )
        and "Pets"
        or "Weapons"
    return prefix
        .. "|"
        .. tostring(
            itemId or ""
        )
end
State.Mapping.Touch = function()
    State.Mapping.Revision =
        State.Mapping.Revision + 1
end
local requestFullUiRefresh = function() end
local function numericAssetId(value)
    if value == nil then
        return nil
    end
    if type(value) == "number" then
        if value <= 0 then
            return nil
        end
        return tostring(math.floor(value))
    end
    if type(value) ~= "string" then
        return nil
    end
    local s = trim(value)
    if s == "" then
        return nil
    end
    local id =
        s:match("rbxassetid://(%d+)")
        or s:match("rbxthumb://.-[?&][Ii][Dd]=(%d+)")
        or s:match("[?&][Ii][Dd]=(%d+)")
        or s:match("[?&][Aa]sset[Ii][Dd]=(%d+)")
        or s:match("[Aa]sset[Ii][Dd][:=/]+(%d+)")
        or s:match("/(%d+)[^%d]*$")
        or s:match("^%s*(%d+)%s*$")
    if not id then
        return nil
    end
    id = id:gsub("^0+", "")
    if id == "" or tonumber(id) == 0 then
        return nil
    end
    return id
end
local function verdictColor(verdict)
    verdict = tostring(verdict or "")
    if verdict:find("WIN", 1, true) then
        return THEME.green
    end
    if verdict:find("LOSS", 1, true) or verdict == "QUESTIONABLE" then
        return THEME.red
    end
    if verdict == "FAIR" or verdict == "EVEN" then
        return THEME.yellow
    end
    return THEME.muted
end
local SupremeDatabase = nil
local LastDatabaseLoad = 0
local DatabaseStatus = "Loading..."
local IndexExact = {}
local IndexCanonical = {}
local Catalog = {}
HARDEN.supremeFastIndex = {byRecordKey = {}, bySourceKey = {}, byNameYear = {}}
HARDEN.supremeIndexDiagnostics = {canonicalCollisions = {}, categoryCounts = {}, invalidRecords = {}}
HARDEN.supremeDataRevision = 0
HARDEN.supremeDataHash = nil
HARDEN.lastDatabaseSource = "none"
HARDEN.lastDatabaseVerifiedAt = 0
HARDEN.lastMappingLoad = 0
HARDEN.lastMappingSource = "none"
HARDEN.lastMappingVerifiedAt = 0
local CATEGORY_ALIAS = {
    ancient = "ancients",
    ancients = "ancients",
    classic = "vintages",
    vintage = "vintages",
    vintages = "vintages",
    chroma = "chromas",
    chromas = "chromas",
    godly = "godlies",
    godlies = "godlies",
    legendary = "legendaries",
    legendaries = "legendaries",
    rare = "rares",
    rares = "rares",
    uncommon = "uncommons",
    uncommons = "uncommons",
    common = "commons",
    commons = "commons",
    pet = "pets",
    pets = "pets",
    misc = "misc",
}
local function normalizeCategory(value)
    if value == nil then
        return nil
    end
    local n = normalize(value)
    return CATEGORY_ALIAS[n] or n
end
local function addRecordToIndex(index, key, record)
    key = normalize(key)
    if key == "" or key == "n/a" then
        return
    end
    index[key] = index[key] or {}
    for _, existing in ipairs(index[key]) do
        if existing.category == record.category
            and tostring(existing.key or "")
                == tostring(record.key or "") then
            return
        end
    end
    table.insert(index[key], record)
end
local function buildSupremeIndex(database)
    local exactIndex = {}
    local canonicalIndex = {}
    local catalog = {}
    local fast = {byRecordKey = {}, bySourceKey = {}, byNameYear = {}, byToken = {}}
    local diagnostics = {canonicalCollisions = {}, categoryCounts = {}, invalidRecords = {}}
    if type(database) ~= "table" then
        return exactIndex, canonicalIndex, catalog, fast, diagnostics
    end
    local function fastPut(bucket, key, record)
        if type(key) ~= "string" or key == "" then return end
        local existing = bucket[key]
        if existing == nil then bucket[key] = record
        elseif existing ~= record then bucket[key] = false end -- ambiguous on purpose
    end
    local function ingestRecord(category, sourceKey, itemData, variantIndex)
        if type(itemData) ~= "table" then return end
        local normalizedCategory = normalizeCategory(category)
        local recordKey = itemData.record_key or itemData.recordKey
        if type(recordKey) ~= "string" or recordKey == "" then
            recordKey = tostring(sourceKey)
            if variantIndex then recordKey = recordKey .. "#" .. tostring(variantIndex) end
        end
        local displayName = tostring(itemData.name or sourceKey)
        local normalizedName = normalize(displayName)
        local canonical = canonicalName(displayName)
        local record = {
            key = recordKey,
            sourceKey = tostring(sourceKey),
            name = displayName,
            normalizedName = normalizedName,
            canonicalName = canonical,
            category = category,
            normalizedCategory = normalizedCategory,
            data = itemData,
            variantIndex = variantIndex,
        }
        table.insert(catalog, record)
        diagnostics.categoryCounts[normalizedCategory] = (diagnostics.categoryCounts[normalizedCategory] or 0) + 1
        addRecordToIndex(exactIndex, record.name, record)
        addRecordToIndex(canonicalIndex, canonical, record)
        if normalize(record.sourceKey) ~= normalizedName then
            addRecordToIndex(exactIndex, record.sourceKey, record)
            addRecordToIndex(canonicalIndex, canonicalName(record.sourceKey), record)
        end
        if type(itemData.aliases) == "string" and normalize(itemData.aliases) ~= "n/a" then
            for alias in itemData.aliases:gmatch("([^,]+)") do
                alias = trim(alias)
                if alias ~= "" then
                    addRecordToIndex(exactIndex, alias, record)
                    addRecordToIndex(canonicalIndex, canonicalName(alias), record)
                end
            end
        end
        local categoryPrefix = tostring(normalizedCategory or "") .. "|"
        fastPut(fast.byRecordKey, categoryPrefix .. tostring(record.key or ""), record)
        fastPut(fast.bySourceKey, categoryPrefix .. tostring(record.sourceKey or ""), record)
        local year = tonumber(itemData.year)
        if normalizedName ~= "" then
            fastPut(fast.byNameYear, categoryPrefix .. normalizedName .. "|" .. tostring(year or ""), record)
            fastPut(fast.byNameYear, categoryPrefix .. normalizedName .. "|*", record)
        end
        local seenToken = {}
        for token in canonical:gmatch("[%w]+") do
            if #token >= 3 and not seenToken[token] then
                seenToken[token] = true
                fast.byToken[token] = fast.byToken[token] or {}
                table.insert(fast.byToken[token], record)
            end
        end
    end
    for category, categoryData in pairs(database) do
        if category ~= "_metadata" and type(categoryData) == "table" then
            for itemKey, itemData in pairs(categoryData) do
                if type(itemData) == "table" then
                    if type(itemData[1]) == "table" then
                        for variantIndex, variantData in ipairs(itemData) do ingestRecord(category, itemKey, variantData, variantIndex) end
                    else
                        ingestRecord(category, itemKey, itemData, nil)
                    end
                end
            end
        end
    end
    for key, rows in pairs(canonicalIndex) do
        if type(rows) == "table" and #rows > 1 then
            diagnostics.canonicalCollisions[key] = #rows
        end
    end
    return exactIndex, canonicalIndex, catalog, fast, diagnostics
end
local function getSupremeRecord(category, name, supremeKey, year)
    if not SupremeDatabase then return nil end
    local wantedCategory = normalizeCategory(category)
    local wantedName = normalize(name)
    local wantedKey = supremeKey and tostring(supremeKey) or nil
    local wantedYear = tonumber(year)
    local prefix = tostring(wantedCategory or "") .. "|"
    if wantedKey then
        local byRecord = HARDEN.supremeFastIndex.byRecordKey[prefix .. wantedKey]
        if byRecord and byRecord ~= false then return byRecord end
        local bySource = HARDEN.supremeFastIndex.bySourceKey[prefix .. wantedKey]
        if bySource and bySource ~= false then return bySource end
    end
    if wantedName ~= "" then
        if wantedYear then
            local byYear = HARDEN.supremeFastIndex.byNameYear[prefix .. wantedName .. "|" .. tostring(wantedYear)]
            if byYear and byYear ~= false then return byYear end
        end
        local byName = HARDEN.supremeFastIndex.byNameYear[prefix .. wantedName .. "|*"]
        if byName and byName ~= false then return byName end
    end
    -- Ambiguous fast-index keys deliberately fall back to the exact catalog rules.
    local nameMatches, yearMatches = {}, {}
    for _, record in ipairs(Catalog) do
        if record.normalizedCategory == wantedCategory then
            if wantedKey and (tostring(record.key or "") == wantedKey or tostring(record.sourceKey or "") == wantedKey) then
                if tostring(record.key or "") == wantedKey then return record end
            end
            if wantedName ~= "" and record.normalizedName == wantedName then
                table.insert(nameMatches, record)
                local recordYear = tonumber(record.data and record.data.year)
                if wantedYear and recordYear == wantedYear then table.insert(yearMatches, record) end
            end
        end
    end
    if #yearMatches == 1 then return yearMatches[1] end
    if #nameMatches == 1 then return nameMatches[1] end
    return nil
end
State.Mapping.ResolveLinkRecord = function(link)
    if type(link) ~= "table" then
        return nil
    end
    return getSupremeRecord(
        link.category,
        link.name,
        link.supreme_key,
        link.year
    )
end
local function rebuildManualLinkIndexes()
    for assetId, link in pairs(
        LinkedImages
    ) do
        if type(link) == "table" then
            local numericId =
                numericAssetId(assetId)
            if numericId then
                link.asset_id =
                    numericId
            end
        end
    end
    State.Mapping.Touch()
end
local function normalizeLinkedImagesDocument(decoded)
    local imageResult = {}
    local itemResult = {}
    if type(decoded) ~= "table" then
        return imageResult, itemResult
    end
    local imageSource = decoded.links or decoded
    for assetId, link in pairs(imageSource) do
        if assetId ~= "_metadata"
            and assetId ~= "item_links"
            and assetId ~= "links"
            and type(link) == "table"
            and type(link.name) == "string"
            and type(link.category) == "string" then
            local numericId =
                numericAssetId(assetId)
                or numericAssetId(link.asset_id)
            if numericId then
                imageResult[numericId] = {
                    name = trim(link.name),
                    category = normalizeCategory(link.category),
                    supreme_key = type(link.supreme_key) == "string" and trim(link.supreme_key) or link.supreme_key,
                    year = tonumber(link.year) or link.year,
                    image_uri = link.image_uri,
                    game_item_id = link.game_item_id,
                    item_type = link.item_type,
                    display_name = link.display_name,
                }
            end
        end
    end
    local itemSource = decoded.item_links
    if type(itemSource) == "table" then
        for itemKey, link in pairs(itemSource) do
            if type(itemKey) == "string"
                and itemKey ~= ""
                and type(link) == "table"
                and type(link.name) == "string"
                and type(link.category) == "string" then
                itemResult[itemKey] = {
                    name = trim(link.name),
                    category = normalizeCategory(link.category),
                    supreme_key = type(link.supreme_key) == "string" and trim(link.supreme_key) or link.supreme_key,
                    year = tonumber(link.year) or link.year,
                    display_name = link.display_name,
                }
            end
        end
    end
    return imageResult, itemResult
end
local function getResponseHeader(response, wantedName)
    if type(response) ~= "table" or type(response.Headers) ~= "table" then
        return nil
    end
    local wanted = string.lower(tostring(wantedName or ""))
    for key, value in pairs(response.Headers) do
        if string.lower(tostring(key)) == wanted then
            return tostring(value)
        end
    end
    return nil
end
local function mappingEntryCount(imageLinks, itemLinks)
    local count = 0
    for _ in pairs(imageLinks or {}) do
        count = count + 1
    end
    for _ in pairs(itemLinks or {}) do
        count = count + 1
    end
    return count
end
HARDEN.mappingDiagnostics = {badCategory = 0, badAssetId = 0, missingName = 0, missingCategory = 0, malformed = 0}
local function loadLinkedImagesFromBody(body, sourceLabel, verifiedAtUnix)
    if type(body) ~= "string" or body == "" or #body > CONFIG.LinkedImagesJsonMaxBytes then
        return false, "linked_images body missing/too large", false
    end
    if LastLinkedImagesBody == body then
        HARDEN.lastMappingLoad = os.time()
        HARDEN.lastMappingVerifiedAt = tonumber(verifiedAtUnix) or HARDEN.lastMappingVerifiedAt or 0
        HARDEN.lastMappingSource = sourceLabel or HARDEN.lastMappingSource
        HttpState.linkedUnchanged += 1
        return true, nil, false
    end
    local decodeOK, decoded = pcall(function() return HttpService:JSONDecode(body) end)
    if not decodeOK or type(decoded) ~= "table" then return false, "linked_images.json could not be decoded; keeping last-known-good mappings.", false end
    HARDEN.mappingDiagnostics = {badCategory = 0, badAssetId = 0, missingName = 0, missingCategory = 0, malformed = 0}
    local imageSource = decoded.links or decoded
    for assetId, link in pairs(type(imageSource) == "table" and imageSource or {}) do
        if assetId ~= "_metadata" and assetId ~= "item_links" and assetId ~= "links" then
            if type(link) ~= "table" then HARDEN.mappingDiagnostics.malformed += 1
            else
                if type(link.name) ~= "string" or trim(link.name) == "" then HARDEN.mappingDiagnostics.missingName += 1 end
                if type(link.category) ~= "string" or trim(link.category) == "" then HARDEN.mappingDiagnostics.missingCategory += 1 end
                if not numericAssetId(assetId) and not numericAssetId(link.asset_id) then HARDEN.mappingDiagnostics.badAssetId += 1 end
                if type(link.category) == "string" and normalizeCategory(link.category) == "" then HARDEN.mappingDiagnostics.badCategory += 1 end
            end
        end
    end
    local normalizeOK, nextImages, nextItems = pcall(normalizeLinkedImagesDocument, decoded)
    if not normalizeOK then return false, "linked_images.json normalization failed; keeping last-known-good mappings.", false end
    local oldCount = mappingEntryCount(LinkedImages, State.Mapping.ItemLinks)
    local newCount = mappingEntryCount(nextImages, nextItems)
    if oldCount > 0 and newCount == 0 then return false, "linked_images.json became unexpectedly empty; keeping last-known-good mappings.", false end
    LinkedImages = nextImages
    State.Mapping.ItemLinks = nextItems
    LastLinkedImagesBody = body
    HARDEN.lastMappingLoad = os.time()
    HARDEN.lastMappingVerifiedAt = tonumber(verifiedAtUnix) or os.time()
    HARDEN.lastMappingSource = sourceLabel or "live"
    rebuildManualLinkIndexes()
    return true, nil, true
end
local function loadLinkedImages()
    local function tryDiskLkg(liveError)
        if mappingEntryCount(LinkedImages, State.Mapping.ItemLinks) > 0 then
            return false, liveError, false
        end
        local cached = HARDEN.readLkgEnvelope and HARDEN.readLkgEnvelope(HARDEN.mappingsLkgFile) or nil
        if cached and type(cached.body) == "string" then
            local loaded, err, changed = loadLinkedImagesFromBody(cached.body, "disk_lkg", cached.savedAtUnix)
            if loaded then return loaded, err, changed end
            return false, tostring(liveError) .. "; disk LKG rejected: " .. tostring(err), false
        end
        return false, liveError, false
    end

    local headers = {["Accept"] = "application/json", ["Cache-Control"] = "no-cache"}
    if HttpState.linkedETag then headers["If-None-Match"] = HttpState.linkedETag
    elseif HttpState.linkedLastModified then headers["If-Modified-Since"] = HttpState.linkedLastModified end
    local ok, response, source = fetchStaticTextCompat(CONFIG.LinkedImagesUrl, headers, CONFIG.AutoTraderHttpTimeoutSeconds)
    if not ok then
        HttpState.errorCount += 1
        return tryDiskLkg(tostring(response))
    end
    if source == "request" then HttpState.requestCount += 1 elseif source == "game:HttpGet" then HttpState.gameHttpGetCount += 1 end
    if tonumber(response.StatusCode) == 304 then
        HttpState.notModifiedCount += 1
        if mappingEntryCount(LinkedImages, State.Mapping.ItemLinks) > 0 then
            HttpState.linkedUnchanged += 1
            HARDEN.lastMappingLoad = os.time()
            HARDEN.lastMappingVerifiedAt = os.time()
            return true, nil, false
        end
        return tryDiskLkg("HTTP 304 received before an accepted mapping load")
    end
    if tonumber(response.StatusCode) == 404 then return tryDiskLkg("linked_images.json returned HTTP 404; keeping last-known-good mappings.") end
    if response.Success ~= true then return tryDiskLkg("HTTP " .. tostring(response.StatusCode or "?")) end
    local body = response.Body or ""
    if #body > CONFIG.LinkedImagesJsonMaxBytes then return tryDiskLkg("linked_images.json exceeded the configured body-size limit") end
    HttpState.fullDownloadCount += 1
    HttpState.downloadedBytes += #body
    local candidateETag = getResponseHeader(response, "etag")
    local candidateLastModified = getResponseHeader(response, "last-modified")
    local loaded, err, changed = loadLinkedImagesFromBody(body, "live_" .. tostring(source or "http"), os.time())
    if not loaded then return tryDiskLkg(err) end
    -- Validators belong to the accepted body, never merely to a received candidate.
    HttpState.linkedETag = candidateETag
    HttpState.linkedLastModified = candidateLastModified
    if changed and HARDEN.writeLkgEnvelope then HARDEN.writeLkgEnvelope(HARDEN.mappingsLkgFile, body) end
    return true, err, changed
end
local function validateSupremeCandidate(decoded, candidateCatalog, candidateDiagnostics)
    if type(decoded) ~= "table" or type(decoded._metadata) ~= "table" then return false, "The JSON is not the expected Supreme Values database." end
    if decoded._metadata.complete == false then return false, "The latest JSON says the scrape is incomplete." end
    local candidateCount = #candidateCatalog
    if candidateCount < CONFIG.MinimumCatalogItems then return false, "The candidate database is suspiciously small (" .. tostring(candidateCount) .. " items)." end
    local seenKeys, invalid = {}, 0
    local categoryCounts = {}
    for _, record in ipairs(candidateCatalog) do
        local category = record.normalizedCategory or normalizeCategory(record.category)
        categoryCounts[category] = (categoryCounts[category] or 0) + 1
        local unique = tostring(category) .. "|" .. tostring(record.key or "")
        if seenKeys[unique] then return false, "The candidate database contains duplicate record key " .. unique .. "." end
        seenKeys[unique] = true
        local data = record.data
        if type(record.name) ~= "string" or trim(record.name) == "" or type(data) ~= "table" then invalid += 1
        else
            local rawValue = data.value
            if rawValue ~= nil and type(rawValue) ~= "number" and type(rawValue) ~= "string" then invalid += 1 end
            if data.year ~= nil and tonumber(data.year) == nil and normalize(data.year) ~= "n/a" then invalid += 1 end
            if data.demand ~= nil and tonumberSafe(data.demand) == nil and normalize(data.demand) ~= "n/a" then invalid += 1 end
            if data.flippability ~= nil and type(data.flippability) ~= "string" then invalid += 1 end
            if data.stability ~= nil and type(data.stability) ~= "string" then invalid += 1 end
        end
    end
    if invalid > math.max(3, math.floor(candidateCount * 0.01)) then return false, "The candidate database has too many semantically malformed records (" .. tostring(invalid) .. ")." end
    local previousCount = #Catalog
    if previousCount > 0 then
        local minimumRelative = math.max(CONFIG.MinimumCatalogItems, math.floor(previousCount * 0.65))
        if candidateCount < minimumRelative then return false, "The candidate database dropped from " .. tostring(previousCount) .. " to " .. tostring(candidateCount) .. " items." end
        for category, oldCount in pairs((HARDEN.supremeIndexDiagnostics and HARDEN.supremeIndexDiagnostics.categoryCounts) or {}) do
            if oldCount >= 5 then
                local newCount = categoryCounts[category] or 0
                if newCount < math.max(1, math.floor(oldCount * 0.50)) then
                    return false, "The candidate database lost too much of category " .. tostring(category) .. " (" .. tostring(oldCount) .. " -> " .. tostring(newCount) .. ")."
                end
            end
        end
    elseif (function() local n=0 for _,count in pairs(categoryCounts) do if count > 0 then n += 1 end end return n end)() < 4 then
        return false, "The initial candidate database contains too few non-empty categories."
    end
    local metadataCount = tonumber(decoded._metadata.total_items)
    if metadataCount and metadataCount > 0 and candidateCount < math.floor(metadataCount * 0.80) then return false, "The candidate database indexed fewer items than its metadata claims." end
    return true
end
local function loadSupremeFromBody(body, sourceLabel, verifiedAtUnix, verifiedDigest)
    if type(body) ~= "string" or body == "" then return false, "empty Supreme Values body", false, nil end
    if #body > CONFIG.SupremeJsonMaxBytes then return false, "Supreme Values JSON exceeded the configured body-size limit", false, nil end
    if LastSupremeBody == body and SupremeDatabase then
        LastDatabaseLoad = os.time(); HARDEN.lastDatabaseVerifiedAt = tonumber(verifiedAtUnix) or HARDEN.lastDatabaseVerifiedAt or 0; DatabaseStatus = "Ready"; HARDEN.lastDatabaseSource = sourceLabel or HARDEN.lastDatabaseSource; HttpState.supremeUnchanged += 1
        return true, nil, false, HARDEN.supremeDataHash
    end
    local decodeOK, decoded = pcall(function() return HttpService:JSONDecode(body) end)
    if not decodeOK then return false, "JSON decode failed: " .. tostring(decoded), false, nil end
    local indexOK, candidateExact, candidateCanonical, candidateCatalog, candidateFast, candidateDiagnostics = pcall(buildSupremeIndex, decoded)
    if not indexOK then return false, "The candidate database could not be indexed; keeping last-known-good values.", false, nil end
    local valid, validationError = validateSupremeCandidate(decoded, candidateCatalog, candidateDiagnostics)
    if not valid then return false, validationError, false, nil end
    local digest = type(verifiedDigest) == "string" and verifiedDigest or nil
    if not digest then
        local hashYields, hashMilliseconds
        digest, hashYields, hashMilliseconds = sha256Hex(body, true)
        HARDEN.lastSupremeHashYields = tonumber(hashYields) or 0
        HARDEN.lastSupremeHashMilliseconds = tonumber(hashMilliseconds) or 0
    else
        HARDEN.lastSupremeHashYields = 0
        HARDEN.lastSupremeHashMilliseconds = 0
    end
    if not digest then return false, "SHA-256 unavailable for Supreme Values body", false, nil end
    SupremeDatabase = decoded
    IndexExact, IndexCanonical, Catalog = candidateExact, candidateCanonical, candidateCatalog
    HARDEN.supremeFastIndex, HARDEN.supremeIndexDiagnostics = candidateFast, candidateDiagnostics
    LastSupremeBody = body
    HARDEN.supremeDataRevision += 1
    HARDEN.supremeDataHash = digest
    LastDatabaseLoad = os.time()
    HARDEN.lastDatabaseVerifiedAt = tonumber(verifiedAtUnix) or os.time()
    HARDEN.lastDatabaseSource = sourceLabel or "live"
    DatabaseStatus = "Ready"
    return true, nil, true, digest
end
local function fetchSupremeDatabase()
    local function tryDiskLkg(liveError)
        if SupremeDatabase then return false, liveError, false end
        local cached = HARDEN.readLkgEnvelope and HARDEN.readLkgEnvelope(HARDEN.supremeLkgFile) or nil
        if cached and type(cached.body) == "string" then
            local loaded, err, changed = loadSupremeFromBody(cached.body, "disk_lkg", cached.savedAtUnix, cached.sha256)
            if loaded then return loaded, err, changed end
            return false, tostring(liveError) .. "; disk LKG rejected: " .. tostring(err), false
        end
        return false, liveError, false
    end

    local headers = {["Accept"] = "application/json", ["Cache-Control"] = "no-cache"}
    if HttpState.supremeETag then headers["If-None-Match"] = HttpState.supremeETag
    elseif HttpState.supremeLastModified then headers["If-Modified-Since"] = HttpState.supremeLastModified end
    local requestOK, response, source = fetchStaticTextCompat(CONFIG.JsonUrl, headers, CONFIG.AutoTraderHttpTimeoutSeconds)
    if not requestOK then
        HttpState.errorCount += 1
        return tryDiskLkg("HTTP error: " .. tostring(response))
    end
    if source == "request" then HttpState.requestCount += 1 elseif source == "game:HttpGet" then HttpState.gameHttpGetCount += 1 end
    if tonumber(response.StatusCode) == 304 then
        HttpState.notModifiedCount += 1
        if SupremeDatabase then
            HttpState.supremeUnchanged += 1
            LastDatabaseLoad = os.time()
            HARDEN.lastDatabaseVerifiedAt = os.time()
            DatabaseStatus = "Ready"
            return true, nil, false
        end
        local loaded, err, changed = tryDiskLkg("HTTP 304 received before an initial database load.")
        if loaded then return loaded, err, changed end
        DatabaseStatus = "Unavailable"
        return false, err, false
    end
    if response.Success ~= true then
        return tryDiskLkg(string.format("HTTP %s %s", tostring(response.StatusCode or "?"), tostring(response.StatusMessage or "request failed")))
    end
    local body = response.Body
    if type(body) ~= "string" or body == "" then return tryDiskLkg("GitHub returned an empty response body; keeping last-known-good values.") end
    if #body > CONFIG.SupremeJsonMaxBytes then return tryDiskLkg("Supreme Values JSON exceeded the configured body-size limit") end
    HttpState.fullDownloadCount += 1
    HttpState.downloadedBytes += #body
    local candidateETag = getResponseHeader(response, "etag")
    local candidateLastModified = getResponseHeader(response, "last-modified")
    local loaded, err, changed, digest = loadSupremeFromBody(body, "live_" .. tostring(source or "http"), os.time())
    if not loaded then return tryDiskLkg(err) end
    -- Commit validators only after the exact body they describe passed all trust gates.
    HttpState.supremeETag = candidateETag
    HttpState.supremeLastModified = candidateLastModified
    if changed and HARDEN.writeLkgEnvelope then
        task.spawn(function()
            if not Destroyed then
                local okWrite, writeErr = HARDEN.writeLkgEnvelope(HARDEN.supremeLkgFile, body, digest)
                if not okWrite then warn("[SV Public] Supreme LKG write failed:", writeErr) end
            end
        end)
    end
    return true, err, changed
end
local function ensureSupremeDatabase(force)
    if not force
        and SupremeDatabase
        and os.time() - LastDatabaseLoad < CONFIG.RefreshSeconds then
        return true, nil, false
    end
    DatabaseStatus = "Refreshing..."
    local ok, err, changed = fetchSupremeDatabase()
    if ok then
        return true, nil, changed
    end
    if SupremeDatabase then
        DatabaseStatus = "Cached"
        warn("[SV Public] Refresh failed; using cached data:", err)
        return true, err, false
    end
    DatabaseStatus = "Unavailable"
    warn("[SV Public] Could not load values:", err)
    return false, err, false
end
local ResolveCache = {}
State.ResolveMetaCache =
    State.ResolveMetaCache
    or {}
State.GameSyncDatabase =
    State.GameSyncDatabase
    or nil
State.GameSyncDatabaseAttempted =
    State.GameSyncDatabaseAttempted
    or false
State.GameSyncDatabaseAttempts =
    State.GameSyncDatabaseAttempts
    or 0
State.GameSyncDatabaseNextAttempt =
    State.GameSyncDatabaseNextAttempt
    or 0
State.GameSyncDatabaseLoading =
    State.GameSyncDatabaseLoading
    or false
State.GameSyncDatabaseReadyAt =
    State.GameSyncDatabaseReadyAt
    or nil
State.GameDatabaseSource =
    State.GameDatabaseSource
    or nil
State.GameDataRevision = tonumber(State.GameDataRevision) or 0
HARDEN.resolveTelemetry = HARDEN.resolveTelemetry or {cacheHits=0, cacheMisses=0, negativeHits=0, fuzzyFallbacks=0, fullCatalogScans=0}
State.GameDataAliasIndex =
    State.GameDataAliasIndex
    or {
        Weapons = {},
        Pets = {},
    }
State.RebuildGameDataAliasIndex = function(
    database
)
    State.GameDataRevision = (tonumber(State.GameDataRevision) or 0) + 1
    State.GameDataAliasIndex = {
        Weapons = {},
        Pets = {},
    }
    if type(database) ~= "table" then
        return
    end
    local function indexBucket(
        bucketName,
        bucket
    )
        if type(bucket) ~= "table" then
            return
        end
        local index =
            State.GameDataAliasIndex[
                bucketName
            ]
        local function addAlias(
            alias,
            record
        )
            if type(alias) ~= "string"
                and type(alias) ~= "number" then
                return
            end
            local raw =
                tostring(alias)
            if raw == "" then
                return
            end
            for _, key in ipairs({
                raw,
                normalize(raw),
            }) do
                if key ~= "" then
                    local existing =
                        index[key]
                    if existing == nil then
                        index[key] =
                            record
                    elseif existing
                        ~= record then
                        index[key] =
                            false
                    end
                end
            end
        end
        for internalId, record in pairs(
            bucket
        ) do
            if type(record) == "table" then
                addAlias(
                    internalId,
                    record
                )
                for _, field in ipairs({
                    "DataID",
                    "DataId",
                    "ItemID",
                    "ItemId",
                    "ID",
                    "Id",
                    "InternalID",
                    "InternalId",
                }) do
                    addAlias(
                        record[field],
                        record
                    )
                end
            end
        end
    end
    indexBucket(
        "Weapons",
        database.Weapons
            or database.weapons
            or database.Item
    )
    indexBucket(
        "Pets",
        database.Pets
            or database.pets
    )
end
State.TryGetExecutorGlobal = function(name)
    local okDirect, direct =
        pcall(function()
            if name == "decompile" then
                return decompile
            elseif name == "loadstring" then
                return loadstring
            elseif name == "getgenv" then
                return getgenv
            elseif name == "getfenv" then
                return getfenv
            elseif name == "setfenv" then
                return setfenv
            elseif name == "Database" then
                return Database
            end
            return nil
        end)
    if okDirect
        and direct ~= nil then
        return direct
    end
    local okGetgenv, getgenvFunction =
        pcall(function()
            return getgenv
        end)
    if not okGetgenv
        or type(getgenvFunction)
            ~= "function" then
        getgenvFunction =
            rawget(_G, "getgenv")
    end
    if type(getgenvFunction)
        == "function" then
        local okEnv, env =
            pcall(getgenvFunction)
        if okEnv
            and type(env) == "table" then
            local value =
                rawget(env, name)
            if value ~= nil then
                return value
            end
        end
    end
    local okGetfenv, getfenvFunction =
        pcall(function()
            return getfenv
        end)
    if okGetfenv
        and type(getfenvFunction)
            == "function" then
        local okEnv, env =
            pcall(
                getfenvFunction,
                0
            )
        if okEnv
            and type(env) == "table" then
            local value =
                rawget(env, name)
            if value ~= nil then
                return value
            end
        end
    end
    local aliasMap = {
        readfile = {"read_file"},
        writefile = {"write_file"},
        isfile = {"is_file"},
        setclipboard = {"toclipboard", "set_clipboard"},
        queue_on_teleport = {"queueonteleport", "queue_on_tp", "queueteleport"},
    }
    local directGlobal = rawget(_G, name)
    if directGlobal ~= nil then return directGlobal end
    for _, alias in ipairs(aliasMap[name] or {}) do
        local value = rawget(_G, alias) or rawget(EarlyExecutorEnvironment or {}, alias)
        if value ~= nil then return value end
    end
    return nil
end
State.ValidateDecompiledDataTable = function(result, moduleScript)
    if type(result) ~= "table" then return false, "result was not a table" end
    local total, tableRows = 0, 0
    for key, value in pairs(result) do
        total += 1
        if total > 100000 then return false, "decompiled data table exceeded 100000 top-level records" end
        if type(key) ~= "string" and type(key) ~= "number" then return false, "decompiled data table used an unsupported key type" end
        if type(value) == "table" then tableRows += 1 end
    end
    if total <= 0 then return false, "decompiled data table was empty" end
    if tableRows < math.max(1, math.floor(total * 0.80)) then
        return false, "decompiled data table did not resemble MM2 item records"
    end
    if moduleScript and (not moduleScript:IsDescendantOf(ReplicatedStorage) or not moduleScript.Parent or moduleScript.Parent.Name ~= "Sync") then
        return false, "decompiled module identity/path was unexpected"
    end
    return true
end
State.TryDecompileDataModule = function(
    moduleScript
)
    if not CONFIG.UseDecompiledSyncFallback
        or not moduleScript
        or not moduleScript:IsA("ModuleScript")
        or not moduleScript:IsDescendantOf(ReplicatedStorage)
        or not moduleScript.Parent
        or moduleScript.Parent.Name ~= "Sync" then
        return nil,
            "disabled-or-missing"
    end
    local decompileFunction =
        State.TryGetExecutorGlobal(
            "decompile"
        )
    local loadstringFunction =
        State.TryGetExecutorGlobal(
            "loadstring"
        )
        or rawget(_G, "loadstring")
    if type(decompileFunction)
            ~= "function"
        or type(loadstringFunction)
            ~= "function" then
        return nil,
            "decompile/loadstring unavailable"
    end
    local okSource, source = waitForExternalWithDeadline(
        "executor decompile",
        CONFIG.AutoTraderExecutorDecompileTimeoutSeconds,
        function() return decompileFunction(moduleScript) end
    )
    if not okSource
        or type(source) ~= "string"
        or source == ""
        or #source > 8000000 then
        return nil,
            "decompile failed"
    end
    local lowered =
        string.lower(source)
    for _, forbidden in ipairs({
        ":fireserver",
        ":invokeserver",
        "httpget",
        "httppost",
        "request(",
        "loadstring(",
        "setclipboard",
        "writefile",
        "delfile",
    }) do
        if string.find(
            lowered,
            forbidden,
            1,
            true
        ) then
            return nil,
                "active code rejected: "
                .. forbidden
        end
    end
    local okChunk, chunkOrError =
        pcall(
            loadstringFunction,
            source
        )
    if not okChunk
        or type(chunkOrError)
            ~= "function" then
        return nil,
            "loadstring failed"
    end
    local setfenvFunction =
        State.TryGetExecutorGlobal(
            "setfenv"
        )
    if type(setfenvFunction)
        ~= "function" then
        return nil,
            "setfenv unavailable; refusing to execute decompiled module"
    end
    local sandbox = {
        Color3 = Color3,
        Vector2 = Vector2,
        Vector3 = Vector3,
        CFrame = CFrame,
        UDim = UDim,
        UDim2 = UDim2,
        NumberRange = NumberRange,
        NumberSequence =
            NumberSequence,
        NumberSequenceKeypoint =
            NumberSequenceKeypoint,
        ColorSequence =
            ColorSequence,
        ColorSequenceKeypoint =
            ColorSequenceKeypoint,
        BrickColor = BrickColor,
        Enum = Enum,
        math = math,
        string = string,
        table = table,
        tonumber = tonumber,
        tostring = tostring,
        pairs = pairs,
        ipairs = ipairs,
        next = next,
        type = type,
        typeof = typeof,
        select = select,
        unpack =
            table.unpack
            or unpack,
    }
    local sandboxOK, sandboxError =
        pcall(
            setfenvFunction,
            chunkOrError,
            sandbox
        )
    if not sandboxOK then
        return nil,
            "sandbox installation failed: "
            .. tostring(sandboxError)
    end
    local okResult, result =
        pcall(
            chunkOrError
        )
    if not okResult or type(result) ~= "table" then
        return nil, "decompiled module execution failed"
    end
    local shapeOK, shapeReason = State.ValidateDecompiledDataTable(result, moduleScript)
    if not shapeOK then return nil, "decompiled module schema rejected: " .. tostring(shapeReason) end
    return result
end
State.TryBuildDecompiledSync = function()
    local databaseFolder =
        ReplicatedStorage:FindFirstChild(
            "Database"
        )
    local syncContainer =
        databaseFolder
        and databaseFolder:FindFirstChild(
            "Sync"
        )
    if not syncContainer then
        return nil
    end
    local itemModule =
        syncContainer:FindFirstChild(
            "Item"
        )
    local petsModule =
        syncContainer:FindFirstChild(
            "Pets"
        )
    local itemTable, itemError =
        State.TryDecompileDataModule(
            itemModule
        )
    local petsTable, petsError =
        State.TryDecompileDataModule(
            petsModule
        )
    if type(itemTable) ~= "table"
        and type(petsTable)
            ~= "table" then
        return nil
    end
    local database = {
        Weapons =
            type(itemTable) == "table"
            and itemTable
            or {},
        Item =
            type(itemTable) == "table"
            and itemTable
            or {},
        Pets =
            type(petsTable) == "table"
            and petsTable
            or {},
    }
    local weaponCount = 0
    local petCount = 0
    for _ in pairs(
        database.Weapons
    ) do
        weaponCount += 1
    end
    for _ in pairs(
        database.Pets
    ) do
        petCount += 1
    end
    return database
end
local function getGameDatabase()
    if type(State.GameSyncDatabase)
        == "table" then
        return State.GameSyncDatabase
    end
    local fallback =
        rawget(_G, "Database")
    if type(fallback) == "table" then
        State.GameSyncDatabase =
            fallback
        State.GameDatabaseSource =
            "_G.Database"
        State.RebuildGameDataAliasIndex(
            fallback
        )
        return fallback
    end
    local executorDatabase =
        State.TryGetExecutorGlobal(
            "Database"
        )
    if type(executorDatabase)
        == "table" then
        State.GameSyncDatabase =
            executorDatabase
        State.GameDatabaseSource =
            "executor Database"
        State.RebuildGameDataAliasIndex(
            executorDatabase
        )
        return executorDatabase
    end
    local now =
        os.clock()
    if State.GameSyncDatabaseLoading then
        return nil
    end
    if State.GameSyncDatabaseAttempts < 4
        and now
            >= State.GameSyncDatabaseNextAttempt then
        State.GameSyncDatabaseAttempted =
            true
        State.GameSyncDatabaseLoading =
            true
        State.GameSyncDatabaseAttempts =
            State.GameSyncDatabaseAttempts
            + 1
        local attempt =
            State.GameSyncDatabaseAttempts
        local decompiled =
            State.TryBuildDecompiledSync()
        State.GameSyncDatabaseLoading =
            false
        if type(decompiled)
            == "table" then
            State.GameSyncDatabase =
                decompiled
            State.GameSyncDatabaseReadyAt =
                os.clock()
            State.GameDatabaseSource =
                "decompiled Sync.Item/Pets"
            State.RebuildGameDataAliasIndex(
                decompiled
            )
            return decompiled
        end
        local retryDelays = {
            0.20,
            0.60,
            1.20,
            2.00,
        }
        State.GameSyncDatabaseNextAttempt =
            now
            + (
                retryDelays[
                    math.min(
                        attempt,
                        #retryDelays
                    )
                ]
                or 2
            )
    end
    if State.GameSyncDatabaseAttempts
        >= 4 then
        State.GameDatabaseSource =
            "Unavailable after retries"
    else
        State.GameDatabaseSource =
            "Waiting for executor native loader"
    end
    return nil
end
local function getGameItemData(itemType, itemId)
    local database = getGameDatabase()
    if type(database) ~= "table" then
        return nil
    end
    local normalizedType = normalize(itemType or "")
    local firstKeys = {}
    if normalizedType:find("pet", 1, true) then
        firstKeys = {"Pets", "pets"}
    elseif normalizedType:find("weapon", 1, true)
        or normalizedType:find("knife", 1, true)
        or normalizedType:find("gun", 1, true) then
        firstKeys = {"Weapons", "weapons"}
    else
        firstKeys = {"Weapons", "Pets", "weapons", "pets"}
    end
    for _, key in ipairs(firstKeys) do
        local bucket =
            database[key]
        if type(bucket) == "table" then
            local record =
                bucket[itemId]
            if type(record) ~= "table" then
                local numericId =
                    tonumber(itemId)
                if numericId then
                    record =
                        bucket[numericId]
                end
            end
            if type(record) == "table" then
                return record, key
            end
        end
    end
    local aliasBucketName =
        normalizedType:find(
            "pet",
            1,
            true
        )
        and "Pets"
        or "Weapons"
    local aliasBucket =
        State.GameDataAliasIndex
        and State.GameDataAliasIndex[
            aliasBucketName
        ]
    if type(aliasBucket)
        == "table" then
        local aliasRecord =
            aliasBucket[
                tostring(itemId)
            ]
            or aliasBucket[
                normalize(itemId)
            ]
        if type(aliasRecord)
            == "table" then
            return aliasRecord,
                aliasBucketName
                    .. "Alias"
        end
    end
    return nil
end
local function getGameDisplayName(
    gameData,
    fallback
)
    if type(gameData) ~= "table" then
        return fallback
    end
    local candidates = {
        gameData.ItemName,
        gameData.DisplayName,
        gameData.Name,
        gameData.Item,
    }
    for _, candidate in ipairs(
        candidates
    ) do
        if type(candidate) == "string"
            and trim(candidate) ~= "" then
            return candidate
        end
    end
    return fallback
end
State.GetNativeIdentityEvidence = function(
    gameData,
    itemId
)
    local evidence = {
        names = {},
        years = {},
        events = {},
        nameSources = {},
        yearSources = {},
    }
    local seenNames = {}
    local seenYears = {}
    local seenEvents = {}
    local function addName(
        value,
        source
    )
        if type(value) ~= "string" then
            return
        end
        for part in value:gmatch(
            "([^,;|]+)"
        ) do
            part = trim(part)
            local key =
                normalize(part)
            if key ~= ""
                and key ~= "n/a"
                and not seenNames[key] then
                seenNames[key] = true
                table.insert(
                    evidence.names,
                    part
                )
                evidence.nameSources[
                    part
                ] = source
            end
        end
    end
    local function addYear(
        value,
        source
    )
        local year = nil
        if type(value) == "number" then
            year =
                math.floor(value)
        elseif type(value) == "string" then
            year =
                tonumber(
                    value:match(
                        "(20%d%d)"
                    )
                    or value:match(
                        "(19%d%d)"
                    )
                )
        end
        if year
            and year >= 2015
            and year <= 2035
            and not seenYears[year] then
            seenYears[year] = true
            table.insert(
                evidence.years,
                year
            )
            evidence.yearSources[
                tostring(year)
            ] = source
        end
    end
    local function addEvent(
        value,
        source
    )
        if type(value) ~= "string" then
            return
        end
        local cleaned = trim(value)
        local key =
            normalize(cleaned)
        if key ~= ""
            and key ~= "n/a"
            and not seenEvents[key] then
            seenEvents[key] = true
            table.insert(
                evidence.events,
                cleaned
            )
        end
        addYear(
            value,
            source
        )
    end
    addName(
        tostring(itemId or ""),
        "remote/internal id"
    )
    local rawId =
        tostring(itemId or "")
    local spacedId =
        rawId
            :gsub(
                "(%l)(%u)",
                "%1 %2"
            )
            :gsub(
                "_",
                " "
            )
    spacedId =
        trim(
            spacedId:gsub(
                "%s+",
                " "
            )
        )
    if normalize(spacedId)
        ~= normalize(rawId) then
        addName(
            spacedId,
            "camel/internal id"
        )
        local words = {}
        for word in spacedId:gmatch(
            "%S+"
        ) do
            table.insert(
                words,
                word
            )
        end
        if #words == 2
            and words[1]:match("^%a+$")
            and words[2]:match("^%a+$") then
            addName(
                words[2]
                    .. " "
                    .. words[1],
                "reversed camel id"
            )
        end
    end
    if type(gameData) == "table" then
        for _, field in ipairs({
            "ItemName",
            "DisplayName",
            "Name",
            "Item",
            "Title",
            "Alias",
            "Aliases",
            "DataName",
            "InternalName",
            "DataID",
            "DataId",
            "ItemID",
            "ItemId",
            "ID",
            "Id",
            "InternalID",
            "InternalId",
        }) do
            addName(
                gameData[field],
                "gameData." .. field
            )
        end
        for key, value in pairs(
            gameData
        ) do
            local keyName =
                normalize(
                    tostring(key)
                )
            if keyName:find(
                "year",
                1,
                true
            ) then
                addYear(
                    value,
                    "gameData."
                        .. tostring(key)
                )
            end
            if keyName == "event"
                or keyName == "origin"
                or keyName == "season"
                or keyName == "holiday"
                or keyName == "release"
                or keyName == "released" then
                addEvent(
                    value,
                    "gameData."
                        .. tostring(key)
                )
            end
        end
        evidence.rarity =
            gameData.Rarity
            or gameData.rarity
            or gameData.Tier
        evidence.image =
            gameData.Image
            or gameData.image
            or gameData.Icon
            or gameData.icon
        evidence.chroma =
            gameData.Chroma
    end
    if #evidence.years == 1 then
        evidence.year =
            evidence.years[1]
    end
    if #evidence.events == 1 then
        evidence.event =
            evidence.events[1]
    end
    return evidence
end
State.SummarizeScoredCandidates = function(
    scored,
    limit
)
    local output = {}
    limit = limit or 6
    for index = 1,
        math.min(
            #scored,
            limit
        ) do
        local candidate =
            scored[index]
        local record =
            candidate.record
        table.insert(
            output,
            {
                key =
                    record
                    and record.key
                    or nil,
                name =
                    record
                    and record.name
                    or nil,
                category =
                    record
                    and record.category
                    or nil,
                score =
                    candidate.score,
                year =
                    record
                    and record.data
                    and record.data.year
                    or nil,
                aliases =
                    record
                    and record.data
                    and record.data.aliases
                    or nil,
                origin =
                    record
                    and record.data
                    and record.data.origin
                    or nil,
                rarity =
                    record
                    and record.data
                    and record.data.rarity
                    or nil,
            }
        )
    end
    return output
end
State.GameResolverRawImageIndex =
    State.GameResolverRawImageIndex
    or {}
State.GameRarityColorCache =
    State.GameRarityColorCache
    or nil
State.GetGameRarityColors = function()
    if State.GameRarityColorCache then
        return State.GameRarityColorCache
    end
    local colors = {
        Common =
            Color3.fromRGB(
                255,
                255,
                255
            ),
        Uncommon =
            Color3.fromRGB(
                0,
                255,
                255
            ),
        Rare =
            Color3.fromRGB(
                0,
                255,
                0
            ),
        Legendary =
            Color3.fromRGB(
                255,
                0,
                0
            ),
        Godly =
            Color3.fromRGB(
                255,
                0,
                255
            ),
        Ancient =
            Color3.fromRGB(
                100,
                10,
                255
            ),
        Classic =
            Color3.fromRGB(
                255,
                255,
                0
            ),
        Victim =
            Color3.fromRGB(
                255,
                140,
                0
            ),
        Unique =
            Color3.fromRGB(
                255,
                140,
                0
            ),
        Christmas =
            Color3.fromRGB(
                30,
                214,
                205
            ),
        Halloween =
            Color3.fromRGB(
                221,
                86,
                2
            ),
    }
    State.GameRarityColorCache =
        colors
    return colors
end
State.GameRarityToSupremeCategory = function(
    rarity
)
    local n = normalize(rarity or "")
    local map = {
        common = "commons",
        uncommon = "uncommons",
        rare = "rares",
        legendary = "legendaries",
        godly = "godlies",
        ancient = "ancients",
        classic = "vintages",
    }
    return map[n]
end
State.GetCardRarityHint = function(frame)
    if not frame then
        return nil
    end
    local itemName =
        frame:FindFirstChild("ItemName")
    if not itemName then
        return nil
    end
    local observed = nil
    if itemName:IsA("GuiObject") then
        observed =
            itemName.BackgroundColor3
    end
    if not observed then
        local rarityBar =
            itemName:FindFirstChild(
                "RarityBar"
            )
        if rarityBar
            and rarityBar:IsA("GuiObject") then
            observed =
                rarityBar.BackgroundColor3
        end
    end
    if not observed then
        return nil
    end
    local bestName = nil
    local bestDistance = math.huge
    for rarityName, color in pairs(
        State.GetGameRarityColors()
    ) do
        if typeof(color) == "Color3" then
            local dr =
                (
                    observed.R
                    - color.R
                ) * 255
            local dg =
                (
                    observed.G
                    - color.G
                ) * 255
            local db =
                (
                    observed.B
                    - color.B
                ) * 255
            local distance =
                dr * dr
                + dg * dg
                + db * db
            if distance < bestDistance then
                bestDistance = distance
                bestName = rarityName
            end
        end
    end
    if bestName
        and bestDistance <= 36 then
        return tostring(bestName)
    end
    return nil
end
State.NormalizeGameImageKey = function(value)
    if type(value) ~= "string" then
        return nil
    end
    local key = trim(value)
    if key == "" then
        return nil
    end
    key =
        key:gsub(
            "[&?]bust=%d+$",
            ""
        )
    return string.lower(key)
end
State.GetCardDisplayedImage = function(frame)
    if not frame then
        return nil
    end
    local container =
        frame:FindFirstChild(
            "Container"
        )
    local icon =
        container
        and container:FindFirstChild(
            "Icon"
        )
    if not icon then
        icon =
            frame:FindFirstChild(
                "Icon",
                true
            )
    end
    if icon
        and (
            icon:IsA("ImageLabel")
            or icon:IsA("ImageButton")
        ) then
        return icon.Image
    end
    if icon then
        for _, descendant in ipairs(
            icon:GetDescendants()
        ) do
            if descendant:IsA(
                    "ImageLabel"
                )
                or descendant:IsA(
                    "ImageButton"
                ) then
                return descendant.Image
            end
        end
    end
    return nil
end
State.GetCardRawImageKey = function(frame)
    return State.NormalizeGameImageKey(
        State.GetCardDisplayedImage(
            frame
        )
    )
end
local GameResolverDatabase = nil
local GameResolverLastBuild = 0
local GameNameIndex = {}
local GameCanonicalIndex = {}
local GameIconIndex = {}
local function normalizeAssetId(value)
    return numericAssetId(value)
end
local function assetNameScore(name)
    local n = normalize(name or "")
    local score = 0
    if n == "icon" then
        score = score + 95
    elseif n:find("icon", 1, true) then
        score = score + 70
    end
    if n:find("item", 1, true) then
        score = score + 25
    end
    if n:find("weapon", 1, true)
        or n:find("knife", 1, true)
        or n:find("gun", 1, true)
        or n:find("pet", 1, true) then
        score = score + 20
    end
    if n:find("rarity", 1, true)
        or n:find("tag", 1, true)
        or n:find("background", 1, true)
        or n:find("frame", 1, true) then
        score = score - 50
    end
    return score
end
local function getInstanceAssetCandidates(frame)
    local candidates = {}
    local byId = {}
    local function add(value, score, source)
        local id = normalizeAssetId(value)
        if not id then
            return
        end
        local existing = byId[id]
        if existing then
            if score > existing.score then
                existing.score = score
                existing.source = source
            end
            return
        end
        local entry = {
            id = id,
            score = score,
            source = source,
        }
        byId[id] = entry
        table.insert(candidates, entry)
    end
    local function inspect(instance)
        local nameBonus = assetNameScore(instance.Name)
        local containerBonus =
            hasAncestorNamed(instance, "Container") and 12 or 0
        if instance:IsA("ImageLabel")
            or instance:IsA("ImageButton") then
            add(
                instance.Image,
                105 + nameBonus + containerBonus,
                instance:GetFullName() .. ".Image"
            )
        elseif instance:IsA("Decal") then
            add(
                instance.Texture,
                78 + nameBonus,
                instance:GetFullName() .. ".Texture"
            )
        elseif instance:IsA("Texture") then
            add(
                instance.Texture,
                74 + nameBonus,
                instance:GetFullName() .. ".Texture"
            )
        elseif instance:IsA("MeshPart") then
            add(
                instance.TextureID,
                70 + nameBonus,
                instance:GetFullName() .. ".TextureID"
            )
            add(
                instance.MeshId,
                30 + nameBonus,
                instance:GetFullName() .. ".MeshId"
            )
        elseif instance:IsA("SpecialMesh") then
            add(
                instance.TextureId,
                68 + nameBonus,
                instance:GetFullName() .. ".TextureId"
            )
            add(
                instance.MeshId,
                28 + nameBonus,
                instance:GetFullName() .. ".MeshId"
            )
        elseif instance:IsA("SurfaceAppearance") then
            add(
                instance.ColorMap,
                64 + nameBonus,
                instance:GetFullName() .. ".ColorMap"
            )
            add(
                instance.NormalMap,
                18 + nameBonus,
                instance:GetFullName() .. ".NormalMap"
            )
        end
        for attributeName, attributeValue in pairs(instance:GetAttributes()) do
            local n = normalize(attributeName)
            if n:find("image", 1, true)
                or n:find("icon", 1, true)
                or n:find("asset", 1, true)
                or n:find("texture", 1, true)
                or n:find("decal", 1, true)
                or n:find("thumbnail", 1, true) then
                add(
                    attributeValue,
                    60 + assetNameScore(attributeName) + nameBonus,
                    instance:GetFullName() .. " attribute " .. attributeName
                )
            end
        end
        if instance:IsA("StringValue")
            or instance:IsA("IntValue")
            or instance:IsA("NumberValue") then
            local n = normalize(instance.Name)
            if n:find("image", 1, true)
                or n:find("icon", 1, true)
                or n:find("asset", 1, true)
                or n:find("texture", 1, true)
                or n:find("decal", 1, true) then
                add(
                    instance.Value,
                    56 + nameBonus,
                    instance:GetFullName() .. ".Value"
                )
            end
        end
    end
    inspect(frame)
    for _, descendant in ipairs(frame:GetDescendants()) do
        inspect(descendant)
    end
    table.sort(candidates, function(a, b)
        if a.score == b.score then
            return tonumber(a.id) > tonumber(b.id)
        end
        return a.score > b.score
    end)
    return candidates
end
local function getCardIconAssetId(frame)
    if not frame then
        return nil
    end
    local function extractFromIconNode(iconNode)
        if not iconNode then
            return nil
        end
        if iconNode:IsA("ImageLabel")
            or iconNode:IsA("ImageButton") then
            local direct = numericAssetId(iconNode.Image)
            if direct then
                return direct
            end
        end
        for _, descendant in ipairs(iconNode:GetDescendants()) do
            if descendant:IsA("ImageLabel")
                or descendant:IsA("ImageButton") then
                local id = numericAssetId(descendant.Image)
                if id then
                    return id
                end
            end
        end
        return nil
    end
    local container = frame:FindFirstChild("Container")
    local explicitIcon =
        container and container:FindFirstChild("Icon")
    local id = extractFromIconNode(explicitIcon)
    if id then
        return id
    end
    local namedIcon = frame:FindFirstChild("Icon", true)
    id = extractFromIconNode(namedIcon)
    if id then
        return id
    end
    local candidates = getInstanceAssetCandidates(frame)
    return candidates[1] and numericAssetId(candidates[1].id) or nil
end
local function collectGameImageIds(value, output, seen, depth)
    if depth > 3 then
        return
    end
    local valueType = type(value)
    if valueType == "string" or valueType == "number" then
        local id = normalizeAssetId(value)
        if id then
            output[id] = true
        end
        return
    end
    if valueType ~= "table" then
        return
    end
    if seen[value] then
        return
    end
    seen[value] = true
    for key, child in pairs(value) do
        local keyText = normalize(tostring(key))
        if type(child) == "string" or type(child) == "number" then
            if keyText:find("image", 1, true)
                or keyText:find("icon", 1, true)
                or keyText:find("decal", 1, true)
                or keyText:find("texture", 1, true) then
                local id = normalizeAssetId(child)
                if id then
                    output[id] = true
                end
            end
        elseif type(child) == "table" then
            collectGameImageIds(child, output, seen, depth + 1)
        end
    end
end
local function getBestGameDataAssetId(gameData)
    if type(gameData) ~= "table" then
        return nil
    end
    local candidates = {}
    local byId = {}
    local function add(value, score)
        local id = normalizeAssetId(value)
        if not id then
            return
        end
        if byId[id] and byId[id] >= score then
            return
        end
        byId[id] = score
        table.insert(candidates, {
            id = id,
            score = score,
        })
    end
    local function walk(value, depth, seen, keyName)
        if depth > 5 then
            return
        end
        if typeof(value) == "Instance" then
            local instanceCandidates =
                getInstanceAssetCandidates(value)
            for index, candidate in ipairs(instanceCandidates) do
                add(
                    candidate.id,
                    math.max(25, 82 - (index - 1) * 4)
                )
            end
            return
        end
        local valueType = type(value)
        if valueType == "string"
            or valueType == "number" then
            local key = normalize(keyName or "")
            local score = nil
            if key:find("icon", 1, true) then
                score = 110
            elseif key:find("image", 1, true)
                or key:find("thumbnail", 1, true) then
                score = 100
            elseif key:find("texture", 1, true)
                or key:find("decal", 1, true) then
                score = 84
            elseif key:find("asset", 1, true) then
                score = 58
            elseif key:find("mesh", 1, true) then
                score = 22
            end
            if score then
                add(value, score)
            end
            return
        end
        if valueType ~= "table"
            or seen[value] then
            return
        end
        seen[value] = true
        for key, child in pairs(value) do
            walk(child, depth + 1, seen, tostring(key))
        end
    end
    walk(gameData, 0, {}, "")
    table.sort(candidates, function(a, b)
        return a.score > b.score
    end)
    return candidates[1] and candidates[1].id or nil
end
local function addGameIndex(index, key, entry)
    if not key or key == "" then
        return
    end
    index[key] = index[key] or {}
    table.insert(index[key], entry)
end
local function rebuildGameResolverIndexes()
    table.clear(GameNameIndex)
    table.clear(GameCanonicalIndex)
    table.clear(GameIconIndex)
    State.GameResolverRawImageIndex =
        State.GameResolverRawImageIndex
        or {}
    table.clear(
        State.GameResolverRawImageIndex
    )
    local database = getGameDatabase()
    GameResolverDatabase = database
    GameResolverLastBuild = os.clock()
    if type(database) ~= "table" then
        return
    end
    local buckets = {
        {"Weapons", database.Weapons or database.weapons},
        {"Pets", database.Pets or database.pets},
    }
    for _, pair in ipairs(buckets) do
        local bucketName = pair[1]
        local bucket = pair[2]
        if type(bucket) == "table" then
            for internalId, gameData in pairs(bucket) do
                if type(gameData) == "table" then
                    local displayName =
                        getGameDisplayName(gameData, tostring(internalId))
                    local entry = {
                        id = tostring(internalId),
                        data = gameData,
                        bucket = bucketName,
                        displayName = displayName,
                    }
                    addGameIndex(
                        GameNameIndex,
                        normalize(displayName),
                        entry
                    )
                    addGameIndex(
                        GameCanonicalIndex,
                        canonicalName(displayName),
                        entry
                    )
                    addGameIndex(
                        GameNameIndex,
                        normalize(tostring(internalId)),
                        entry
                    )
                    addGameIndex(
                        GameCanonicalIndex,
                        canonicalName(tostring(internalId)),
                        entry
                    )
                    local rawImage =
                        gameData.Image
                        or gameData.image
                        or gameData.Icon
                        or gameData.icon
                    local rawImageKey =
                        State.NormalizeGameImageKey(
                            rawImage
                        )
                    if rawImageKey then
                        addGameIndex(
                            State.GameResolverRawImageIndex,
                            rawImageKey,
                            entry
                        )
                    end
                    local imageIds = {}
                    collectGameImageIds(
                        gameData,
                        imageIds,
                        {},
                        0
                    )
                    for imageId in pairs(imageIds) do
                        addGameIndex(
                            GameIconIndex,
                            imageId,
                            entry
                        )
                    end
                end
            end
        end
    end
end
local function ensureGameResolverIndexes()
    local database = getGameDatabase()
    if database ~= GameResolverDatabase
        or GameResolverLastBuild == 0 then
        rebuildGameResolverIndexes()
    end
end
State.QueueNativeDatabaseWarmup = function()
    for _, delaySeconds in ipairs({
        0,
        0.25,
        0.75,
        1.50,
        2.50,
    }) do
        task.delay(
            delaySeconds,
            function()
                if Destroyed
                    or type(
                        State.GameSyncDatabase
                    ) == "table" then
                    return
                end
                local database =
                    getGameDatabase()
                if type(database)
                    == "table" then
                    table.clear(
                        ResolveCache
                    )
                    table.clear(
                        State.ResolveMetaCache
                    )
                    GameResolverDatabase =
                        nil
                    GameResolverLastBuild =
                        0
                    rebuildGameResolverIndexes()
                    if State.Profile
                        and type(
                            State.Profile.QueueScan
                        ) == "function" then
                        State.Profile.QueueScan()
                    end
                    if State.Profile
                        and type(
                            State.Profile
                                .QueueRemoteLeaderboardSweep
                        ) == "function" then
                        State.Profile
                            .QueueRemoteLeaderboardSweep()
                    elseif State.Profile
                        and State.Profile.remoteTotals then
                        State.Profile.remoteTotals
                            .pendingNativeResweep =
                            true
                    end
                end
            end
        )
    end
end
local function gameBucketMatches(entry, itemType)
    local normalizedType = normalize(itemType or "")
    if normalizedType:find("pet", 1, true) then
        return entry.bucket == "Pets"
    end
    return entry.bucket == "Weapons"
end
local function findInternalGameItemId(
    displayName,
    itemType,
    iconAssetId,
    rarityHint,
    rawImageKey
)
    ensureGameResolverIndexes()
    local wantedNormal = normalize(displayName or "")
    local wantedCanonical = canonicalName(displayName or "")
    local wantedIcon = normalizeAssetId(iconAssetId)
    local wantedRarity =
        normalize(rarityHint or "")
    local wantedRawImage =
        State.NormalizeGameImageKey(
            rawImageKey
        )
    local candidates = {}
    local seen = {}
    local function addCandidates(entries)
        for _, entry in ipairs(entries or {}) do
            if gameBucketMatches(entry, itemType) then
                local key = entry.bucket .. "\0" .. entry.id
                if not seen[key] then
                    seen[key] = true
                    table.insert(candidates, entry)
                end
            end
        end
    end
    if wantedRawImage then
        addCandidates(
            State.GameResolverRawImageIndex[
                wantedRawImage
            ]
        )
    end
    if wantedIcon then
        addCandidates(GameIconIndex[wantedIcon])
    end
    if wantedNormal ~= "" then
        addCandidates(GameNameIndex[wantedNormal])
    end
    if wantedCanonical ~= "" then
        addCandidates(GameCanonicalIndex[wantedCanonical])
    end
    if #candidates == 0 then
        return nil
    end
    local best = nil
    local bestScore = -math.huge
    local secondScore = -math.huge
    for _, entry in ipairs(candidates) do
        local score = 0
        local displayNormal = normalize(entry.displayName)
        local displayCanonical = canonicalName(entry.displayName)
        local idNormal = normalize(entry.id)
        local idCanonical = canonicalName(entry.id)
        if wantedRawImage
            and State.GameResolverRawImageIndex[
                wantedRawImage
            ] then
            for _, imageEntry in ipairs(
                State.GameResolverRawImageIndex[
                    wantedRawImage
                ]
            ) do
                if imageEntry == entry then
                    score = score + 190
                    break
                end
            end
        end
        if wantedIcon and GameIconIndex[wantedIcon] then
            for _, iconEntry in ipairs(GameIconIndex[wantedIcon]) do
                if iconEntry == entry then
                    score = score + 150
                    break
                end
            end
        end
        if wantedRarity ~= "" then
            local entryRarity =
                normalize(
                    entry.data
                    and (
                        entry.data.Rarity
                        or entry.data.Tier
                    )
                    or ""
                )
            if entryRarity ~= "" then
                if entryRarity
                    == wantedRarity then
                    score = score + 48
                else
                    score = score - 24
                end
            end
        end
        if wantedNormal ~= "" then
            if displayNormal == wantedNormal then
                score = score + 100
            elseif idNormal == wantedNormal then
                score = score + 95
            end
        end
        if wantedCanonical ~= "" then
            if displayCanonical == wantedCanonical then
                score = score + 82
            elseif idCanonical == wantedCanonical then
                score = score + 76
            end
        end
        if score > bestScore then
            secondScore = bestScore
            bestScore = score
            best = entry
        elseif score > secondScore then
            secondScore = score
        end
    end
    local minimum =
        wantedRawImage and 150
        or wantedIcon and 120
        or 75
    if not best or bestScore < minimum then
        return nil
    end
    if secondScore > -math.huge
        and math.abs(bestScore - secondScore) <= 3 then
        return nil
    end
    return best.id
end
local function inferPreferredCategory(itemType, gameData)
    local normalizedType = normalize(itemType or "")
    if normalizedType:find("pet", 1, true) then
        return "pets"
    end
    if type(gameData) ~= "table" then
        return nil
    end
    if gameData.Chroma == true
        or normalize(gameData.Chroma) == "true"
        or normalize(gameData.Rarity) == "chroma" then
        return "chromas"
    end
    local rarity = normalize(gameData.Rarity or gameData.Tier or "")
    if CATEGORY_ALIAS[rarity] then
        return CATEGORY_ALIAS[rarity]
    end
    if rarity == "ancient" then
        return "ancients"
    elseif rarity == "classic" then
        return "vintages"
    end
    return nil
end
local function parseInternalItemIdHints(itemId)
    local raw = tostring(itemId or "")
    local upper = string.upper(raw)
    local kind = nil
    if upper:match("_G_%d%d%d%d$")
        or upper:match("_G$")
        or upper:find("_G_", 1, true) then
        kind = "gun"
    elseif upper:match("_K_%d%d%d%d$")
        or upper:match("_K$")
        or upper:find("_K_", 1, true) then
        kind = "knife"
    end
    local year =
        tonumber(
            raw:match(
                "_(%d%d%d%d)$"
            )
        )
    local compactTerminalYear = false
    if not year then
        local candidateYear =
            tonumber(
                raw:match(
                    "(%d%d%d%d)$"
                )
            )
        if candidateYear
            and candidateYear >= 2015
            and candidateYear <= 2035 then
            year = candidateYear
            compactTerminalYear = true
        end
    end
    local base = raw
    base =
        base:gsub(
            "_[GgKk]_%d%d%d%d$",
            ""
        )
    base =
        base:gsub(
            "_[GgKk]$",
            ""
        )
    base =
        base:gsub(
            "_%d%d%d%d$",
            ""
        )
    if compactTerminalYear then
        base =
            base:gsub(
                "%d%d%d%d$",
                ""
            )
    end
    base =
        base:gsub(
            "_",
            " "
        )
    base = trim(base)
    return base,
        kind,
        year,
        compactTerminalYear
end
local function inferWeaponKind(itemType, gameData)
    local candidates = {
        itemType,
        type(gameData) == "table" and gameData.ItemType or nil,
        type(gameData) == "table" and gameData.WeaponType or nil,
        type(gameData) == "table" and gameData.Type or nil,
    }
    for _, candidate in ipairs(candidates) do
        local n = normalize(candidate or "")
        if n:find("knife", 1, true) then
            return "knife"
        elseif n:find("gun", 1, true) then
            return "gun"
        end
    end
    return nil
end
local function candidateScore(record, searchNames, preferredCategory, weaponKind, chromaExpected, expectedYear, expectedEvent)
    local score = 0
    local recordName = normalize(record.name)
    local recordCanonical = canonicalName(record.name)
    local recordCategory = normalizeCategory(record.category)
    for _, sourceName in ipairs(searchNames) do
        local n = normalize(sourceName)
        local c = canonicalName(sourceName)
        if n ~= "" then
            local aliasExact = false
            local aliasCanonical =
                false
            local aliases =
                record.data
                and record.data.aliases
            if type(aliases)
                == "string"
                and normalize(aliases)
                    ~= "n/a" then
                for alias in aliases:gmatch(
                    "([^,]+)"
                ) do
                    alias = trim(alias)
                    if normalize(alias)
                        == n then
                        aliasExact = true
                        break
                    end
                    if c ~= ""
                        and canonicalName(
                            alias
                        ) == c then
                        aliasCanonical =
                            true
                    end
                end
            end
            if aliasExact then
                score =
                    math.max(
                        score,
                        150
                    )
            elseif recordName == n then
                score = math.max(score, 130)
            elseif aliasCanonical then
                score =
                    math.max(
                        score,
                        112
                    )
            elseif recordCanonical == c
                and c ~= "" then
                score = math.max(score, 95)
            elseif recordName:find(n, 1, true)
                or n:find(
                    recordName,
                    1,
                    true
                ) then
                score = math.max(score, 72)
            end
        end
    end
    if preferredCategory and recordCategory == preferredCategory then
        score = score + 38
    elseif preferredCategory then
        score = score - 25
    end
    if chromaExpected == true then
        if recordCategory == "chromas" then
            score = score + 28
        else
            score = score - 35
        end
    elseif chromaExpected == false and recordCategory == "chromas" then
        score = score - 20
    end
    if weaponKind then
        local lowerName = normalize(record.name)
        local lowerOrigin = normalize(record.data.origin or "")
        if lowerName:find("(" .. weaponKind .. ")", 1, true)
            or lowerOrigin:find(weaponKind, 1, true) then
            score = score + 12
        elseif lowerName:find("(knife)", 1, true)
            or lowerName:find("(gun)", 1, true) then
            score = score - 8
        end
    end
    if expectedYear then
        local recordYear =
            tonumber(
                record.data.year
            )
        if recordYear
            == expectedYear then
            score = score + 18
        elseif recordYear then
            score = score - 5
        end
    end
    if expectedEvent
        and expectedEvent ~= "" then
        local origin =
            normalize(
                record.data.origin
                or ""
            )
        local event =
            normalize(
                expectedEvent
            )
        if origin ~= ""
            and event ~= ""
            and (
                origin:find(
                    event,
                    1,
                    true
                )
                or event:find(
                    origin,
                    1,
                    true
                )
            ) then
            score = score + 8
        end
    end
    return score
end
State.AssessCandidateEvidence = function(
    record,
    directNames,
    syntheticNames,
    preferredCategory,
    weaponKind,
    chromaExpected,
    expectedYear,
    expectedEvent
)
    local evidence = {
        directExact = false,
        directCanonical = false,
        syntheticExact = false,
        syntheticCanonical = false,
        exactName = false,
        exactAlias = false,
        yearMatch = false,
        yearConflict = false,
        categoryMatch = false,
        categoryConflict = false,
        kindMatch = false,
        kindConflict = false,
        chromaMatch = false,
        chromaConflict = false,
        eventMatch = false,
        hardConflict = false,
    }
    if type(record) ~= "table" then
        evidence.hardConflict = true
        return evidence
    end
    local recordName =
        normalize(
            record.name
            or ""
        )
    local recordCanonical =
        canonicalName(
            record.name
            or ""
        )
    local aliases = {}
    if record.data
        and type(
            record.data.aliases
        ) == "string"
        and normalize(
            record.data.aliases
        ) ~= "n/a" then
        for alias in record.data.aliases:gmatch(
            "([^,]+)"
        ) do
            alias = trim(alias)
            if alias ~= "" then
                table.insert(
                    aliases,
                    alias
                )
            end
        end
    end
    local function inspectNames(
        names,
        direct
    )
        for _, candidateName in ipairs(
            names
            or {}
        ) do
            local normalizedCandidate =
                normalize(
                    candidateName
                )
            local canonicalCandidate =
                canonicalName(
                    candidateName
                )
            local exactName =
                normalizedCandidate ~= ""
                and normalizedCandidate
                    == recordName
            local canonicalNameMatch =
                canonicalCandidate ~= ""
                and canonicalCandidate
                    == recordCanonical
            local exactAlias = false
            local canonicalAlias =
                false
            for _, alias in ipairs(
                aliases
            ) do
                if normalize(alias)
                    == normalizedCandidate then
                    exactAlias = true
                    break
                end
                if canonicalCandidate ~= ""
                    and canonicalName(
                        alias
                    ) == canonicalCandidate then
                    canonicalAlias =
                        true
                end
            end
            if direct then
                if exactName
                    or exactAlias then
                    evidence.directExact =
                        true
                end
                if canonicalNameMatch
                    or canonicalAlias then
                    evidence.directCanonical =
                        true
                end
            else
                if exactName
                    or exactAlias then
                    evidence.syntheticExact =
                        true
                end
                if canonicalNameMatch
                    or canonicalAlias then
                    evidence.syntheticCanonical =
                        true
                end
            end
            if exactName then
                evidence.exactName =
                    true
            end
            if exactAlias then
                evidence.exactAlias =
                    true
            end
        end
    end
    inspectNames(
        directNames,
        true
    )
    inspectNames(
        syntheticNames,
        false
    )
    local recordCategory =
        normalizeCategory(
            record.category
            or ""
        )
    if preferredCategory then
        if recordCategory
            == preferredCategory then
            evidence.categoryMatch =
                true
        else
            evidence.categoryConflict =
                true
        end
    end
    local recordYear =
        tonumber(
            record.data
            and record.data.year
        )
    if expectedYear then
        if recordYear
            == expectedYear then
            evidence.yearMatch =
                true
        elseif recordYear then
            evidence.yearConflict =
                true
        end
    end
    if chromaExpected == true then
        if recordCategory
            == "chromas" then
            evidence.chromaMatch =
                true
        else
            evidence.chromaConflict =
                true
        end
    elseif chromaExpected == false
        and recordCategory
            == "chromas" then
        evidence.chromaConflict =
            true
    end
    if weaponKind then
        local lowerName =
            normalize(
                record.name
                or ""
            )
        local lowerOrigin =
            normalize(
                record.data
                and record.data.origin
                or ""
            )
        local explicitKnife =
            lowerName:find(
                "(knife)",
                1,
                true
            )
            or lowerOrigin:find(
                "knife",
                1,
                true
            )
        local explicitGun =
            lowerName:find(
                "(gun)",
                1,
                true
            )
            or lowerOrigin:find(
                "gun",
                1,
                true
            )
        if weaponKind == "knife" then
            if explicitKnife then
                evidence.kindMatch =
                    true
            elseif explicitGun then
                evidence.kindConflict =
                    true
            end
        elseif weaponKind == "gun" then
            if explicitGun then
                evidence.kindMatch =
                    true
            elseif explicitKnife then
                evidence.kindConflict =
                    true
            end
        end
    end
    if expectedEvent
        and expectedEvent ~= "" then
        local origin =
            normalize(
                record.data
                and record.data.origin
                or ""
            )
        local event =
            normalize(
                expectedEvent
            )
        if origin ~= ""
            and event ~= ""
            and (
                origin:find(
                    event,
                    1,
                    true
                )
                or event:find(
                    origin,
                    1,
                    true
                )
            ) then
            evidence.eventMatch =
                true
        end
    end
    evidence.hardConflict =
        evidence.yearConflict
        or evidence.categoryConflict
        or evidence.kindConflict
        or evidence.chromaConflict
    evidence.corrobatorCount =
        (
            evidence.yearMatch
            and 1
            or 0
        )
        + (
            evidence.categoryMatch
            and 1
            or 0
        )
        + (
            evidence.kindMatch
            and 1
            or 0
        )
        + (
            evidence.chromaMatch
            and 1
            or 0
        )
        + (
            evidence.eventMatch
            and 1
            or 0
        )
    return evidence
end
local function gatherCandidatesByNames(searchNames)
    local seen = {}
    local candidates = {}
    local function add(record)
        local key = record.category .. "\0" .. record.name
        if not seen[key] then
            seen[key] = true
            table.insert(candidates, record)
        end
    end
    for _, searchName in ipairs(searchNames) do
        local exact = IndexExact[normalize(searchName)]
        if exact then
            for _, record in ipairs(exact) do
                add(record)
            end
        end
        local canonical = IndexCanonical[canonicalName(searchName)]
        if canonical then
            for _, record in ipairs(canonical) do
                add(record)
            end
        end
    end
    if #candidates == 0 then
        HARDEN.resolveTelemetry.fuzzyFallbacks += 1
        local wantedCanonical = {}
        for _, searchName in ipairs(searchNames) do
            local c = canonicalName(searchName)
            if c ~= "" then
                wantedCanonical[c] = true
            end
        end
        local candidatePool = nil
        local bestToken = nil
        for wanted in pairs(wantedCanonical) do
            for token in wanted:gmatch("[%w]+") do
                if #token >= 3 and (not bestToken or #token > #bestToken) then bestToken = token end
            end
        end
        if bestToken and HARDEN.supremeFastIndex.byToken and HARDEN.supremeFastIndex.byToken[bestToken] then
            candidatePool = HARDEN.supremeFastIndex.byToken[bestToken]
        else
            HARDEN.resolveTelemetry.fullCatalogScans += 1
            candidatePool = Catalog
        end
        for _, record in ipairs(candidatePool) do
            local rc = record.canonicalName or canonicalName(record.name)
            for wanted in pairs(wantedCanonical) do
                if rc == wanted or rc:find(wanted, 1, true) or wanted:find(rc, 1, true) then add(record); break end
            end
        end
    end
    return candidates
end
local function resolveGameItem(itemId, itemType, displayName)
    if not SupremeDatabase then
        return nil, "NO_DATABASE", {
            trusted = false,
            reason = "NO_DATABASE",
        }
    end
    itemId = tostring(itemId or "")
    itemType = tostring(itemType or "")
    local gameData, gameBucket =
        getGameItemData(
            itemType,
            itemId
        )
    local gameDisplay =
        getGameDisplayName(
            gameData,
            displayName or itemId
        )
    local nativeEvidence =
        State.GetNativeIdentityEvidence(
            gameData,
            itemId
        )
    local manualItemKey =
        State.Mapping.MakeItemKey(
            itemType,
            itemId
        )
    local manualItemLink =
        State.Mapping.ItemLinks[
            manualItemKey
        ]
    if type(manualItemLink) == "table" then
        local manualRecord =
            State.Mapping.ResolveLinkRecord(
                manualItemLink
            )
        if manualRecord then
            return manualRecord,
                "MANUAL_ITEM_LINK",
                {
                    trusted = true,
                    level = "manual-item-link",
                    reason = "MANUAL_ITEM_LINK",
                    source = "linked_images.json item_links",
                    itemId = itemId,
                    itemType = itemType,
                    manualItemKey = manualItemKey,
                    suggestedName = manualRecord.name,
                    suggestedCategory = manualRecord.category,
                }
        end
    end
    local cacheKey =
        tostring(
            State.GameDatabaseSource
            or "unknown-source"
        )
        .. "\0"
        .. tostring(gameBucket or itemType)
        .. "\0"
        .. itemId
        .. "\0"
        .. tostring(gameDisplay)
        .. "\0"
        .. tostring(
            type(gameData) == "table"
            and gameData.Image
            or ""
        )
        .. "\0"
        .. tostring(
            type(gameData) == "table"
            and gameData.Rarity
            or ""
        )
        .. "\0"
        .. tostring(
            nativeEvidence.year
            or ""
        )
        .. "\0maprev="
        .. tostring(State.Mapping.Revision)
        .. "\0gamedbrev="
        .. tostring(State.GameDataRevision or 0)
        .. "\0suprev="
        .. tostring(HARDEN.supremeDataRevision or 0)
    if ResolveCache[cacheKey] ~= nil then
        HARDEN.resolveTelemetry.cacheHits += 1
        local cached =
            ResolveCache[cacheKey]
        local meta =
            State.ResolveMetaCache[
                cacheKey
            ]
        if cached == false then
            HARDEN.resolveTelemetry.negativeHits += 1
            return nil,
                meta
                    and meta.reason
                    or "UNRESOLVED",
                meta
        end
        return cached,
            "RESOLVED",
            meta
    end
    HARDEN.resolveTelemetry.cacheMisses += 1
    local preferredCategory =
        inferPreferredCategory(
            itemType,
            gameData
        )
    local internalBase,
        internalKind,
        internalYear,
        compactTerminalYear =
        parseInternalItemIdHints(
            itemId
        )
    local weaponKind =
        inferWeaponKind(
            itemType,
            gameData
        )
        or internalKind
    local nativeYear =
        nativeEvidence.year
    local yearConflict =
        internalYear
        and nativeYear
        and internalYear
            ~= nativeYear
        or false
    local expectedYear = nil
    if not yearConflict then
        expectedYear =
            internalYear
            or nativeYear
    end
    local expectedEvent =
        nativeEvidence.event
    local chromaExpected = nil
    if type(gameData) == "table" then
        if gameData.Chroma == true
            or normalize(
                gameData.Rarity
            ) == "chroma" then
            chromaExpected = true
        elseif gameData.Chroma == false then
            chromaExpected = false
        end
    end
    local searchNames = {}
    local directSearchNames = {}
    local syntheticSearchNames = {}
    local function addUniqueName(
        target,
        value
    )
        if type(value) ~= "string"
            or trim(value) == "" then
            return false
        end
        local n =
            normalize(value)
        for _, existing in ipairs(
            target
        ) do
            if normalize(existing)
                == n then
                return false
            end
        end
        table.insert(
            target,
            value
        )
        return true
    end
    local function addSearchName(
        value,
        direct
    )
        if type(value) ~= "string"
            or trim(value) == "" then
            return
        end
        addUniqueName(
            searchNames,
            value
        )
        addUniqueName(
            direct
            and directSearchNames
            or syntheticSearchNames,
            value
        )
    end
    addSearchName(
        gameDisplay,
        true
    )
    addSearchName(
        displayName,
        true
    )
    addSearchName(
        itemId,
        true
    )
    for _, nativeName in ipairs(
        nativeEvidence.names
        or {}
    ) do
        local source =
            nativeEvidence.nameSources
            and nativeEvidence.nameSources[
                nativeName
            ]
            or ""
        local direct =
            source ~= "camel/internal id"
            and source
                ~= "reversed camel id"
        addSearchName(
            nativeName,
            direct
        )
    end
    if internalBase
        and internalBase ~= "" then
        addSearchName(
            internalBase,
            false
        )
        if weaponKind then
            addSearchName(
                internalBase
                .. " ("
                .. (
                    weaponKind == "knife"
                    and "Knife"
                    or "Gun"
                )
                .. ")",
                false
            )
        end
    end
    if weaponKind and gameDisplay then
        addSearchName(
            gameDisplay
            .. " ("
            .. (
                weaponKind == "knife"
                and "Knife"
                or "Gun"
            )
            .. ")",
            false
        )
    end
    if chromaExpected == true
        and type(gameDisplay)
            == "string" then
        if not normalize(
            gameDisplay
        ):find(
            "chroma",
            1,
            true
        ) then
            addSearchName(
                "Chroma "
                .. gameDisplay,
                false
            )
            addSearchName(
                "C. "
                .. gameDisplay,
                false
            )
        end
    end
    local candidates =
        gatherCandidatesByNames(
            searchNames
        )
    local candidateCountBeforeYearNarrow =
        #candidates
    local yearNarrowed = false
    if expectedYear
        and #candidates > 1 then
        local exactYearCandidates = {}
        for _, record in ipairs(
            candidates
        ) do
            local recordYear =
                tonumber(
                    record.data
                    and record.data.year
                )
            if recordYear
                == expectedYear then
                table.insert(
                    exactYearCandidates,
                    record
                )
            end
        end
        if #exactYearCandidates > 0
            and #exactYearCandidates
                < #candidates then
            candidates =
                exactYearCandidates
            yearNarrowed = true
        end
    end
    local exactYearLabelNarrowed =
        false
    if compactTerminalYear
        and internalYear
        and #candidates > 1 then
        local wantedYearLabel =
            normalize(
                tostring(
                    internalBase
                    or ""
                )
                .. " ("
                .. tostring(
                    internalYear
                )
                .. ")"
            )
        local exactLabelCandidates = {}
        for _, record in ipairs(
            candidates
        ) do
            if normalize(
                record.name
                or ""
            ) == wantedYearLabel then
                table.insert(
                    exactLabelCandidates,
                    record
                )
            end
        end
        if #exactLabelCandidates == 1 then
            candidates =
                exactLabelCandidates
            exactYearLabelNarrowed =
                true
        end
    end
    if #candidates == 0 then
        local meta = {
            trusted = false,
            level = "none",
            reason = "MISSING",
            itemId = itemId,
            itemType = itemType,
            gameDisplay = gameDisplay,
            hasExactGameData =
                type(gameData)
                == "table",
            candidateCount = 0,
            candidateCountBeforeYearNarrow =
                candidateCountBeforeYearNarrow,
            yearNarrowed =
                yearNarrowed,
            compactTerminalYear =
                compactTerminalYear,
            exactYearLabelNarrowed =
                exactYearLabelNarrowed,
            nativeEvidence =
                nativeEvidence,
            expectedYear =
                expectedYear,
            yearConflict =
                yearConflict,
        }
        ResolveCache[cacheKey] =
            false
        State.ResolveMetaCache[
            cacheKey
        ] = meta
        return nil, "MISSING", meta
    end
    local scored = {}
    for _, record in ipairs(
        candidates
    ) do
        local score =
            candidateScore(
                record,
                searchNames,
                preferredCategory,
                weaponKind,
                chromaExpected,
                expectedYear,
                expectedEvent
            )
        table.insert(
            scored,
            {
                record = record,
                score = score,
            }
        )
    end
    table.sort(
        scored,
        function(a, b)
            if a.score == b.score then
                local av =
                    numericValue(
                        a.record.data
                    )
                    or -1
                local bv =
                    numericValue(
                        b.record.data
                    )
                    or -1
                if av == bv then
                    return a.record.name
                        < b.record.name
                end
                return av > bv
            end
            return a.score > b.score
        end
    )
    local best = scored[1]
    if not best
        or best.score < 60 then
        local meta = {
            trusted = false,
            level = "weak",
            reason =
                "LOW_CONFIDENCE",
            itemId = itemId,
            itemType = itemType,
            gameDisplay = gameDisplay,
            hasExactGameData =
                type(gameData)
                == "table",
            candidateCount =
                #candidates,
            candidateCountBeforeYearNarrow =
                candidateCountBeforeYearNarrow,
            yearNarrowed =
                yearNarrowed,
            compactTerminalYear =
                compactTerminalYear,
            exactYearLabelNarrowed =
                exactYearLabelNarrowed,
            bestScore =
                best and best.score
                or nil,
            nativeEvidence =
                nativeEvidence,
            expectedYear =
                expectedYear,
            yearConflict =
                yearConflict,
            candidateSummary =
                State.SummarizeScoredCandidates(
                    scored
                ),
        }
        ResolveCache[cacheKey] =
            false
        State.ResolveMetaCache[
            cacheKey
        ] = meta
        return nil,
            "LOW_CONFIDENCE",
            meta
    end
    local second = scored[2]
    local margin =
        second
        and (
            best.score
            - second.score
        )
        or math.huge
    if second
        and math.abs(
            best.score
            - second.score
        ) <= 3
        and (
            best.record.name
                ~= second.record.name
            or best.record.category
                ~= second.record.category
        ) then
        local meta = {
            trusted = false,
            level = "ambiguous",
            reason = "AMBIGUOUS",
            itemId = itemId,
            itemType = itemType,
            gameDisplay = gameDisplay,
            hasExactGameData =
                type(gameData)
                == "table",
            candidateCount =
                #candidates,
            candidateCountBeforeYearNarrow =
                candidateCountBeforeYearNarrow,
            yearNarrowed =
                yearNarrowed,
            compactTerminalYear =
                compactTerminalYear,
            exactYearLabelNarrowed =
                exactYearLabelNarrowed,
            bestScore = best.score,
            secondScore =
                second.score,
            margin = margin,
            suggestedName =
                best.record.name,
            suggestedCategory =
                best.record.category,
            nativeEvidence =
                nativeEvidence,
            expectedYear =
                expectedYear,
            yearConflict =
                yearConflict,
            candidateSummary =
                State.SummarizeScoredCandidates(
                    scored
                ),
        }
        ResolveCache[cacheKey] =
            false
        State.ResolveMetaCache[
            cacheKey
        ] = meta
        return nil,
            "AMBIGUOUS",
            meta
    end
    local hasExactGameData =
        type(gameData) == "table"
    local bestEvidence =
        State.AssessCandidateEvidence(
            best.record,
            directSearchNames,
            syntheticSearchNames,
            preferredCategory,
            weaponKind,
            chromaExpected,
            expectedYear,
            expectedEvent
        )
    local secondEvidence =
        second
        and State.AssessCandidateEvidence(
            second.record,
            directSearchNames,
            syntheticSearchNames,
            preferredCategory,
            weaponKind,
            chromaExpected,
            expectedYear,
            expectedEvent
        )
        or nil
    local trusted = false
    local level = "weak"
    local structuredYearExact =
        internalYear ~= nil
        and #candidates == 1
        and tonumber(
            best.record.data
            and best.record.data.year
        ) == internalYear
    local structuredTypedId =
        internalKind == "knife"
        or internalKind == "gun"
    local deterministicYearId =
        structuredYearExact
        and (
            structuredTypedId
            or compactTerminalYear
        )
    if CONFIG.ConservativeResolution then
        local directExactUnique =
            bestEvidence.directExact
            and not bestEvidence.hardConflict
            and (
                not second
                or not (
                    secondEvidence
                    and secondEvidence
                        .directExact
                )
            )
        local directCorroborated =
            (
                bestEvidence.directExact
                or bestEvidence
                    .directCanonical
            )
            and not bestEvidence.hardConflict
            and bestEvidence
                .corrobatorCount >= 1
            and (
                not second
                or (
                    secondEvidence
                    and (
                        bestEvidence.yearMatch
                            and not secondEvidence
                                .yearMatch
                        or bestEvidence.categoryMatch
                            and secondEvidence
                                .categoryConflict
                        or bestEvidence.kindMatch
                            and secondEvidence
                                .kindConflict
                        or bestEvidence.chromaMatch
                            and secondEvidence
                                .chromaConflict
                        or bestEvidence.eventMatch
                            and not secondEvidence
                                .eventMatch
                    )
                )
            )
        local syntheticCorroborated =
            (
                bestEvidence.syntheticExact
                or bestEvidence
                    .syntheticCanonical
            )
            and not bestEvidence.hardConflict
            and bestEvidence.yearMatch
            and bestEvidence
                .corrobatorCount >= 2
            and (
                not second
                or not (
                    secondEvidence
                    and secondEvidence
                        .yearMatch
                )
            )
        if deterministicYearId
            and #candidates == 1
            and not bestEvidence
                .hardConflict then
            trusted = true
            level =
                compactTerminalYear
                and "legacy-year-id"
                or "structured-id"
        elseif directExactUnique then
            trusted = true
            level = "exact-evidence"
        elseif directCorroborated
            or syntheticCorroborated then
            trusted = true
            level =
                directCorroborated
                and "corroborated-evidence"
                or "synthetic-year-corroborated"
        end
    else
        if hasExactGameData
            and best.score >= 120
            and (
                not second
                or margin >= 8
            ) then
            trusted = true
            level = "strong"
        elseif hasExactGameData
            and #candidates == 1
            and best.score >= 90 then
            trusted = true
            level = "strong-single"
        elseif hasExactGameData
            and best.score >= 105
            and (
                not second
                or margin >= 18
            ) then
            trusted = true
            level = "medium"
        elseif not hasExactGameData
            and best.score >= 145
            and (
                not second
                or margin >= 18
            ) then
            trusted = true
            level = "metadata"
        elseif not hasExactGameData
            and deterministicYearId
            and #candidates == 1 then
            trusted = true
            level =
                compactTerminalYear
                and "legacy-year-id"
                or "structured-id"
        end
    end
    local meta = {
        trusted = trusted,
        level = level,
        reason = "RESOLVED",
        itemId = itemId,
        itemType = itemType,
        gameDisplay = gameDisplay,
        gameRarity =
            type(gameData) == "table"
            and gameData.Rarity
            or nil,
        gameImage =
            type(gameData) == "table"
            and gameData.Image
            or nil,
        hasExactGameData =
            hasExactGameData,
        candidateCount =
            #candidates,
        candidateCountBeforeYearNarrow =
            candidateCountBeforeYearNarrow,
        yearNarrowed =
            yearNarrowed,
        compactTerminalYear =
            compactTerminalYear,
        exactYearLabelNarrowed =
            exactYearLabelNarrowed,
        bestScore = best.score,
        secondScore =
            second
            and second.score
            or nil,
        margin =
            margin == math.huge
            and nil
            or margin,
        preferredCategory =
            preferredCategory,
        weaponKind =
            weaponKind,
        expectedYear =
            expectedYear,
        nativeYear =
            nativeYear,
        yearConflict =
            yearConflict,
        nativeEvent =
            expectedEvent,
        nativeEvidence =
            nativeEvidence,
        structuredYearExact =
            structuredYearExact,
        structuredTypedId =
            structuredTypedId,
        deterministicYearId =
            deterministicYearId,
        conservativeResolution =
            CONFIG.ConservativeResolution,
        bestEvidence =
            bestEvidence,
        secondEvidence =
            secondEvidence,
        directSearchNames =
            directSearchNames,
        syntheticSearchNames =
            syntheticSearchNames,
        candidateSummary =
            State.SummarizeScoredCandidates(
                scored,
                10
            ),
        suggestedName =
            best.record.name,
        suggestedCategory =
            best.record.category,
    }
    if CONFIG.ConservativeResolution
        and not trusted then
        meta.reason =
            "INSUFFICIENT_EVIDENCE"
        ResolveCache[cacheKey] =
            false
        State.ResolveMetaCache[
            cacheKey
        ] = meta
        return nil,
            "INSUFFICIENT_EVIDENCE",
            meta
    end
    ResolveCache[cacheKey] =
        best.record
    State.ResolveMetaCache[
        cacheKey
    ] = meta
    return best.record,
        "RESOLVED",
        meta
end
local STABILITY_SCORE = {
    ["Overpaid For"] = 2.5,
    ["Improving"] = 2,
    ["Doing Well"] = 1.5,
    ["Stable"] = 0,
    ["Fluctuating"] = -1.25,
    ["Underpaid For"] = -1.75,
    ["Receding"] = -2,
    ["Untradable"] = -4,
}
local FLIP_SCORE = {
    ["Highly Flippable"] = 2,
    ["Flippable"] = 1,
    ["Rarely Flippable"] = -1,
}
local function weightedMetric(resolvedEntries, getter)
    local weightedSum = 0
    local coveredValue = 0
    local totalValue = 0
    for _, entry in ipairs(resolvedEntries) do
        local value = entry.unitValue
        local quantity = entry.quantity or 1
        if value and value > 0 then
            local weightedValue = value * quantity
            totalValue = totalValue + weightedValue
            local metric = getter(entry.record.data)
            if metric ~= nil then
                weightedSum = weightedSum + metric * weightedValue
                coveredValue = coveredValue + weightedValue
            end
        end
    end
    if coveredValue == 0 then
        return nil, 0
    end
    return weightedSum / coveredValue, totalValue > 0 and coveredValue / totalValue or 0
end
local function summarizeResolvedOffer(entries)
    local summary = {
        entries = {},
        items = {},
        totalValue = 0,
        slotCount = 0,
        unitCount = 0,
        unresolved = {},
        nonNumeric = {},
        stabilityShares = {},
    }
    for _, entry in ipairs(entries or {}) do
        local quantity = math.max(1, tonumber(entry.quantity) or 1)
        local record = entry.record
        summary.slotCount = summary.slotCount + 1
        summary.unitCount = summary.unitCount + quantity
        if not record then
            table.insert(summary.unresolved, tostring(entry.itemId or entry.name or "Unknown item"))
        else
            local item = record.data
            local unitValue = numericValue(item)
            local resolvedEntry = {
                record = record,
                itemId = entry.itemId,
                itemType = entry.itemType,
                quantity = quantity,
                unitValue = unitValue,
            }
            table.insert(summary.entries, resolvedEntry)
            table.insert(summary.items, {
                name = record.name,
                category = record.category,
                quantity = quantity,
                value = item.value,
                rawValue = unitValue,
                demand = tonumberSafe(item.demand),
                rarity = tonumberSafe(item.rarity),
                stability = item.stability,
                flippability = item.flippability,
                changePercent =
                    parsePercent(item.change_pct)
                    or parsePercent(item.change_in_value),
            })
            if not unitValue then
                table.insert(
                    summary.nonNumeric,
                    record.name .. " (" .. tostring(item.value or "N/A") .. ")"
                )
            else
                local weightedValue = unitValue * quantity
                summary.totalValue = summary.totalValue + weightedValue
                if item.stability then
                    summary.stabilityShares[item.stability] =
                        (summary.stabilityShares[item.stability] or 0) + weightedValue
                end
            end
        end
    end
    if summary.totalValue > 0 then
        for key, value in pairs(summary.stabilityShares) do
            summary.stabilityShares[key] = value / summary.totalValue
        end
    end
    summary.demand, summary.demandCoverage =
        weightedMetric(summary.entries, function(item)
            return tonumberSafe(item.demand)
        end)
    summary.rarity, summary.rarityCoverage =
        weightedMetric(summary.entries, function(item)
            return tonumberSafe(item.rarity)
        end)
    summary.flip, summary.flipCoverage =
        weightedMetric(summary.entries, function(item)
            return item.flippability and FLIP_SCORE[item.flippability] or nil
        end)
    summary.stability, summary.stabilityCoverage =
        weightedMetric(summary.entries, function(item)
            return item.stability and STABILITY_SCORE[item.stability] or nil
        end)
    summary.trend, summary.trendCoverage =
        weightedMetric(summary.entries, function(item)
            return
                parsePercent(item.change_pct)
                or parsePercent(item.change_in_value)
        end)
    return summary
end
local function comparableCoverage(a, b)
    return (a or 0) >= 0.5 and (b or 0) >= 0.5
end
local function differenceVerdict(difference, slight, strong)
    if difference == nil then
        return "UNKNOWN"
    elseif difference >= strong then
        return "WIN"
    elseif difference >= slight then
        return "SLIGHT WIN"
    elseif difference <= -strong then
        return "LOSS"
    elseif difference <= -slight then
        return "SLIGHT LOSS"
    else
        return "EVEN"
    end
end
local function scoreVerdict(score)
    if score >= 35 then
        return "HUGE WIN"
    elseif score >= 15 then
        return "WIN"
    elseif score >= CONFIG.ShouldTradeScore then
        return "SLIGHT WIN"
    elseif score > -8 then
        return "FAIR"
    elseif score > -15 then
        return "QUESTIONABLE"
    elseif score > -35 then
        return "LOSS"
    end
    return "BIG LOSS"
end
local function wording(amount, noticeable, substantial)
    amount = math.abs(amount)
    if amount >= substantial then
        return "substantially"
    elseif amount >= noticeable then
        return "noticeably"
    end
    return "slightly"
end
local function addNote(notes, text)
    if type(text) == "string" and text ~= "" then
        table.insert(notes, text)
    end
end
local function strongestComponent(components, wantPositive)
    local best = nil
    for _, component in ipairs(components) do
        local valid =
            wantPositive and component.score > 0
            or (not wantPositive and component.score < 0)
        if valid
            and (
                not best
                or math.abs(component.score) > math.abs(best.score)
            ) then
            best = component
        end
    end
    return best
end
local function unknownTradeResult(localSummary, otherSummary, notes)
    return {
        shouldTrade = false,
        evaluable = false,
        verdict = "UNKNOWN",
        score = 0,
        confidence = 0,
        confidenceLabel = "LOW",
        tradeType = "UNKNOWN",
        localOffer = localSummary,
        otherOffer = otherSummary,
        comparisons = {},
        scoreBreakdown = {},
        notes = notes or {},
    }
end
local function evaluateResolvedTrade(localEntries, otherEntries)
    local give = summarizeResolvedOffer(localEntries)
    local receive = summarizeResolvedOffer(otherEntries)
    local notes = {}
    if #give.unresolved > 0 then
        addNote(
            notes,
            "I could not confidently match "
                .. listText(give.unresolved)
                .. " from your offer to Supreme Values."
        )
    end
    if #receive.unresolved > 0 then
        addNote(
            notes,
            "I could not confidently match "
                .. listText(receive.unresolved)
                .. " from the other offer to Supreme Values."
        )
    end
    if #give.nonNumeric > 0 then
        addNote(
            notes,
            "Your offer contains nonnumeric value entries: "
                .. listText(give.nonNumeric)
                .. "."
        )
    end
    if #receive.nonNumeric > 0 then
        addNote(
            notes,
            "The other offer contains nonnumeric value entries: "
                .. listText(receive.nonNumeric)
                .. "."
        )
    end
    if #give.unresolved > 0
        or #receive.unresolved > 0
        or #give.nonNumeric > 0
        or #receive.nonNumeric > 0 then
        addNote(
            notes,
            "The helper will not guess around missing, Priceless, or relative-value items, so the recommendation is disabled."
        )
        return unknownTradeResult(give, receive, notes)
    end
    if give.slotCount == 0 and receive.slotCount == 0 then
        addNote(notes, "Both offers are empty.")
        return unknownTradeResult(give, receive, notes)
    end
    local weights = CONFIG.Weights
    local valueDifference = receive.totalValue - give.totalValue
    local valuePercent
    if give.totalValue > 0 then
        valuePercent = valueDifference / give.totalValue * 100
    elseif receive.totalValue > 0 then
        valuePercent = 100
    else
        valuePercent = 0
    end
    local valueScore =
        clamp(
            valuePercent * weights.valuePerPercent,
            -weights.valueCap,
            weights.valueCap
        )
    local demandDifference = nil
    local demandScore = 0
    if comparableCoverage(give.demandCoverage, receive.demandCoverage) then
        demandDifference = receive.demand - give.demand
        demandScore =
            clamp(
                demandDifference * weights.demandPerPoint,
                -weights.demandCap,
                weights.demandCap
            )
    end
    local flipDifference = nil
    local flipScore = 0
    if comparableCoverage(give.flipCoverage, receive.flipCoverage) then
        flipDifference = receive.flip - give.flip
        flipScore =
            clamp(
                flipDifference * weights.flipPerPoint,
                -weights.flipCap,
                weights.flipCap
            )
    end
    local stabilityDifference = nil
    local stabilityScore = 0
    if comparableCoverage(give.stabilityCoverage, receive.stabilityCoverage) then
        stabilityDifference = receive.stability - give.stability
        stabilityScore =
            clamp(
                stabilityDifference * weights.stabilityPerPoint,
                -weights.stabilityCap,
                weights.stabilityCap
            )
    end
    local trendDifference = nil
    local trendScore = 0
    if comparableCoverage(give.trendCoverage, receive.trendCoverage) then
        trendDifference = receive.trend - give.trend
        trendScore =
            clamp(
                trendDifference * weights.trendPerPercent,
                -weights.trendCap,
                weights.trendCap
            )
    end
    local rarityDifference = nil
    local rarityScore = 0
    if comparableCoverage(give.rarityCoverage, receive.rarityCoverage) then
        rarityDifference = receive.rarity - give.rarity
        rarityScore =
            clamp(
                rarityDifference * weights.rarityPerPoint,
                -weights.rarityCap,
                weights.rarityCap
            )
    end
    local itemCountDifference = give.slotCount - receive.slotCount
    local itemCountScore =
        clamp(
            itemCountDifference * weights.itemCountPerItem,
            -weights.itemCountCap,
            weights.itemCountCap
        )
    local tradeType =
        itemCountDifference > 0 and "UPGRADE"
        or itemCountDifference < 0 and "DOWNGRADE"
        or "SIDEGRADE"
    local score =
        valueScore
        + demandScore
        + flipScore
        + stabilityScore
        + trendScore
        + rarityScore
        + itemCountScore
    score = math.floor(score * 10 + 0.5) / 10
    local shouldTrade = score >= CONFIG.ShouldTradeScore
    local coverage =
        math.min(give.demandCoverage or 0, receive.demandCoverage or 0) * 0.25
        + math.min(give.flipCoverage or 0, receive.flipCoverage or 0) * 0.20
        + math.min(give.stabilityCoverage or 0, receive.stabilityCoverage or 0) * 0.20
        + math.min(give.trendCoverage or 0, receive.trendCoverage or 0) * 0.20
        + math.min(give.rarityCoverage or 0, receive.rarityCoverage or 0) * 0.15
    local risk =
        (receive.stabilityShares["Fluctuating"] or 0) * 0.5
        + (receive.stabilityShares["Receding"] or 0) * 0.75
        + (receive.stabilityShares["Underpaid For"] or 0) * 0.6
        + (receive.stabilityShares["Untradable"] or 0)
    local confidence =
        clamp(
            0.55 + coverage * 0.4 - risk * 0.2,
            0.25,
            0.98
        )
    confidence = math.floor(confidence * 100 + 0.5) / 100
    local confidenceLabel =
        confidence >= 0.85 and "HIGH"
        or confidence >= 0.65 and "MEDIUM"
        or "LOW"
    if valueDifference > 0 then
        addNote(
            notes,
            "You receive "
                .. formatNumber(valueDifference)
                .. " more listed value ("
                .. formatPercent(valuePercent, true)
                .. ")."
        )
    elseif valueDifference < 0 then
        addNote(
            notes,
            "You give "
                .. formatNumber(math.abs(valueDifference))
                .. " more listed value ("
                .. formatPercent(valuePercent, false)
                .. " from your side)."
        )
    else
        addNote(notes, "Both sides have the same total listed value.")
    end
    if demandDifference and math.abs(demandDifference) >= 0.35 then
        if demandDifference > 0 then
            addNote(
                notes,
                "The incoming offer has "
                    .. wording(demandDifference, 1, 2)
                    .. " higher demand overall."
            )
        else
            addNote(
                notes,
                "The incoming offer has "
                    .. wording(demandDifference, 1, 2)
                    .. " lower demand overall, which makes its listed value less attractive."
            )
        end
    end
    if flipDifference and math.abs(flipDifference) >= 0.25 then
        if flipDifference > 0 then
            addNote(
                notes,
                "The incoming offer has "
                    .. wording(flipDifference, 0.75, 1.5)
                    .. " stronger flippability, so it should generally be easier to move later."
            )
        else
            addNote(
                notes,
                "The incoming offer has "
                    .. wording(flipDifference, 0.75, 1.5)
                    .. " weaker flippability, so it may be harder to trade away."
            )
        end
    end
    local untradable = receive.stabilityShares["Untradable"] or 0
    local receding = receive.stabilityShares["Receding"] or 0
    local underpaid = receive.stabilityShares["Underpaid For"] or 0
    local fluctuating = receive.stabilityShares["Fluctuating"] or 0
    local strongCondition =
        (receive.stabilityShares["Doing Well"] or 0)
        + (receive.stabilityShares["Improving"] or 0)
        + (receive.stabilityShares["Overpaid For"] or 0)
    if untradable > 0 then
        addNote(
            notes,
            formatPercent(untradable * 100, false)
                .. " of the incoming listed value is marked Untradable, which is a major warning sign."
        )
    elseif receding >= 0.20 then
        addNote(
            notes,
            formatPercent(receding * 100, false)
                .. " of the incoming listed value is marked Receding, so the current advantage carries extra risk."
        )
    elseif underpaid >= 0.20 then
        addNote(
            notes,
            formatPercent(underpaid * 100, false)
                .. " of the incoming listed value is marked Underpaid For."
        )
    elseif fluctuating >= 0.25 then
        addNote(
            notes,
            formatPercent(fluctuating * 100, false)
                .. " of the incoming listed value is marked Fluctuating, so the recommendation is less certain."
        )
    elseif strongCondition >= 0.35 then
        addNote(
            notes,
            "A large share of the incoming value is marked Doing Well, Improving, or Overpaid For."
        )
    elseif stabilityDifference and math.abs(stabilityDifference) >= 0.35 then
        addNote(
            notes,
            stabilityDifference > 0
                and "The incoming offer has a healthier stability/market-condition profile."
                or "The incoming offer has a weaker stability/market-condition profile."
        )
    end
    if trendDifference and math.abs(trendDifference) >= 1 then
        if trendDifference > 0 then
            addNote(
                notes,
                "Recent listed-value changes favor the incoming offer ("
                    .. formatPercent(receive.trend, true)
                    .. " weighted versus "
                    .. formatPercent(give.trend, true)
                    .. ")."
            )
        else
            addNote(
                notes,
                "Recent listed-value changes favor the items you are giving ("
                    .. formatPercent(give.trend, true)
                    .. " weighted versus "
                    .. formatPercent(receive.trend, true)
                    .. ")."
            )
        end
    end
    if rarityDifference and math.abs(rarityDifference) >= 0.5 then
        addNote(
            notes,
            rarityDifference > 0
                and "The incoming offer is rarer overall; rarity is treated as a small positive rather than a deciding factor."
                or "The incoming offer is less rare overall; rarity only has a small weight."
        )
    end
    if tradeType == "UPGRADE" then
        addNote(
            notes,
            "This consolidates "
                .. tostring(give.slotCount)
                .. " offer slots into "
                .. tostring(receive.slotCount)
                .. ", so it receives a small upgrade bonus."
        )
    elseif tradeType == "DOWNGRADE" then
        addNote(
            notes,
            "This spreads the trade from "
                .. tostring(give.slotCount)
                .. " offer slot(s) into "
                .. tostring(receive.slotCount)
                .. ", so it receives a small downgrade penalty."
        )
    end
    local components = {
        {label = "listed value", score = valueScore},
        {label = "demand", score = demandScore},
        {label = "flippability", score = flipScore},
        {label = "stability and market condition", score = stabilityScore},
        {label = "recent value movement", score = trendScore},
        {label = "rarity", score = rarityScore},
        {label = "item consolidation", score = itemCountScore},
    }
    local positive = strongestComponent(components, true)
    local negative = strongestComponent(components, false)
    if shouldTrade then
        if positive and negative then
            addNote(
                notes,
                "Overall, the advantage in "
                    .. positive.label
                    .. " outweighs the weakness in "
                    .. negative.label
                    .. ", so I would take the trade."
            )
        else
            addNote(
                notes,
                "Overall, the measured signals favor the incoming offer strongly enough that I would take the trade."
            )
        end
    else
        if valueDifference > 0 and negative then
            addNote(
                notes,
                "Although you gain listed value, the weakness in "
                    .. negative.label
                    .. " keeps the trade below the recommendation threshold, so I would pass."
            )
        elseif score > -8 then
            addNote(
                notes,
                "The measured advantage is too small to count as a meaningful win, so I would pass rather than make a marginal trade."
            )
        elseif negative then
            addNote(
                notes,
                "Overall, "
                    .. negative.label
                    .. " works strongly enough against the incoming offer that I would pass."
            )
        else
            addNote(notes, "Overall, I would pass on this trade.")
        end
    end
    return {
        shouldTrade = shouldTrade,
        evaluable = true,
        verdict = scoreVerdict(score),
        score = score,
        confidence = confidence,
        confidenceLabel = confidenceLabel,
        tradeType = tradeType,
        value = {
            giving = give.totalValue,
            receiving = receive.totalValue,
            difference = valueDifference,
            percentage = valuePercent,
        },
        comparisons = {
            value = differenceVerdict(valuePercent, 2, 8),
            demand = differenceVerdict(demandDifference, 0.35, 1),
            flippability = differenceVerdict(flipDifference, 0.25, 0.75),
            stability = differenceVerdict(stabilityDifference, 0.35, 1),
            trend = differenceVerdict(trendDifference, 1, 3),
            rarity = differenceVerdict(rarityDifference, 0.5, 1.5),
        },
        scoreBreakdown = {
            value = valueScore,
            demand = demandScore,
            flippability = flipScore,
            stability = stabilityScore,
            trend = trendScore,
            rarity = rarityScore,
            itemCount = itemCountScore,
        },
        localOffer = give,
        otherOffer = receive,
        notes = notes,
    }
end
State.CurrentTrade = nil
State.LastEvaluation = nil
State.TradeHelperEnabled = CONFIG.TradeHelperDefault
local function sideMatchesLocalPlayer(side)
    if type(side) ~= "table" then
        return false
    end
    local player = side.Player or side.player
    if player == LocalPlayer then
        return true
    end
    if typeof(player) == "Instance" and player:IsA("Player") then
        return player == LocalPlayer
    end
    if type(player) == "string" then
        return player == LocalPlayer.Name
    end
    if type(player) == "number" then
        return player == LocalPlayer.UserId
    end
    if type(player) == "table" then
        local id = player.UserId or player.userId
        local name = player.Name or player.name
        return id == LocalPlayer.UserId or name == LocalPlayer.Name
    end
    return false
end
local function getTradeSides(trade)
    if type(trade) ~= "table" then
        return nil, nil
    end
    local player1 = trade.Player1 or trade.player1
    local player2 = trade.Player2 or trade.player2
    if sideMatchesLocalPlayer(player1) then
        return player1, player2
    end
    if sideMatchesLocalPlayer(player2) then
        return player2, player1
    end
    return player1, player2
end
local function parseOfferEntry(rawEntry)
    if type(rawEntry) ~= "table" then
        return nil
    end
    local itemId =
        rawEntry[1]
        or rawEntry.ItemID
        or rawEntry.ItemId
        or rawEntry.itemID
        or rawEntry.itemId
        or rawEntry.Item
        or rawEntry.item
    local quantity =
        rawEntry[2]
        or rawEntry.Quantity
        or rawEntry.quantity
        or rawEntry.Amount
        or rawEntry.amount
        or 1
    local itemType =
        rawEntry[3]
        or rawEntry.ItemType
        or rawEntry.itemType
        or rawEntry.Category
        or rawEntry.category
        or "Weapons"
    if itemId == nil then
        return nil
    end
    return {
        itemId = tostring(itemId),
        itemType = tostring(itemType),
        quantity = math.max(1, tonumber(quantity) or 1),
        raw = rawEntry,
    }
end
local function resolveTradeOffer(side)
    local result = {}
    if type(side) ~= "table" then
        return result
    end
    local offer = side.Offer or side.offer
    if type(offer) ~= "table" then
        return result
    end
    for _, rawEntry in ipairs(offer) do
        local parsed = parseOfferEntry(rawEntry)
        if parsed then
            local gameData = getGameItemData(parsed.itemType, parsed.itemId)
            local displayName = getGameDisplayName(gameData, parsed.itemId)
            parsed.record =
                select(
                    1,
                    resolveGameItem(
                        parsed.itemId,
                        parsed.itemType,
                        displayName
                    )
                )
            table.insert(result, parsed)
        end
    end
    return result
end
local function cloneOfferEntries(entries)
    local copy = {}
    for _, entry in ipairs(entries or {}) do
        table.insert(copy, {
            itemId = entry.itemId,
            itemType = entry.itemType,
            quantity = entry.quantity,
            record = entry.record,
        })
    end
    return copy
end
local function normalizeTradeItemType(itemType)
    local n = normalize(itemType or "")
    if n:find("pet", 1, true) then
        return "pets"
    end
    return "weapons"
end
local function offerKey(itemId, itemType)
    return normalizeTradeItemType(itemType) .. "\0" .. tostring(itemId)
end
local function findOfferEntry(entries, itemId, itemType)
    local wanted = offerKey(itemId, itemType)
    for index, entry in ipairs(entries) do
        if offerKey(entry.itemId, entry.itemType) == wanted then
            return entry, index
        end
    end
    return nil
end
local ExistingRoot = PlayerGui:FindFirstChild("SV_PC_PublicHelper")
if ExistingRoot then
    ExistingRoot:Destroy()
end
UI.RootGui = create("ScreenGui", {
    Name = "SV_PC_PublicHelper",
    ResetOnSpawn = false,
    IgnoreGuiInset = false,
    DisplayOrder = 999,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, PlayerGui)
UI.DetailsBackdrop = create("TextButton", {
    Name = "SV_DetailsBackdrop",
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BackgroundTransparency = 0.45,
    BorderSizePixel = 0,
    Text = "",
    AutoButtonColor = false,
    Visible = false,
    ZIndex = 2000,
}, UI.RootGui)
UI.Details = create("Frame", {
    Name = "SV_DetailsPopup",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(410, 510),
    BackgroundColor3 = THEME.bg,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 2001,
}, UI.RootGui)
addCorner(UI.Details, 6)
addStroke(UI.Details, THEME.border, 1, 0.1)
create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(23, 103, 153)),
        ColorSequenceKeypoint.new(0.16, Color3.fromRGB(10, 66, 102)),
        ColorSequenceKeypoint.new(1, THEME.bg),
    }),
    Rotation = 90,
}, UI.Details)
UI.DetailsTitle = makeLabel(
    UI.Details,
    "Item",
    20,
    THEME.text,
    Enum.Font.ArialBold
)
UI.DetailsTitle.Position = UDim2.fromOffset(18, 15)
UI.DetailsTitle.Size = UDim2.new(1, -72, 0, 28)
UI.DetailsTitle.ZIndex = 2002
UI.DetailsSubtitle = makeLabel(
    UI.Details,
    "",
    11,
    THEME.muted,
    Enum.Font.Arial
)
UI.DetailsSubtitle.Position = UDim2.fromOffset(18, 43)
UI.DetailsSubtitle.Size = UDim2.new(1, -72, 0, 20)
UI.DetailsSubtitle.ZIndex = 2002
UI.DetailsClose = makeButton(
    UI.Details,
    "X",
    UDim2.fromOffset(34, 34),
    Color3.fromRGB(55, 34, 40)
)
UI.DetailsClose.Position = UDim2.new(1, -49, 0, 14)
UI.DetailsClose.TextColor3 = THEME.red
UI.DetailsClose.ZIndex = 2003
setButtonHover(
    UI.DetailsClose,
    Color3.fromRGB(55, 34, 40),
    Color3.fromRGB(78, 42, 50)
)
UI.DetailsAction = makeButton(
    UI.Details,
    "Identify / Update Listing",
    UDim2.new(1, -28, 0, 38),
    THEME.panel3
)
UI.DetailsAction.Position = UDim2.new(0, 14, 1, -52)
UI.DetailsAction.ZIndex = 2003
UI.DetailsAction.Visible = false
UI.DetailsScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(14, 75),
    Size = UDim2.new(1, -28, 1, -139),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 4,
    ScrollBarImageColor3 = THEME.border,
    ZIndex = 2002,
}, UI.Details)
UI.DetailsContent = create("Frame", {
    Size = UDim2.new(1, -5, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 2002,
}, UI.DetailsScroll)
UI.DetailsList = create("UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 8),
}, UI.DetailsContent)
local function clearDetailsRows()
    for _, child in ipairs(UI.DetailsContent:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
end
local function addDetailRow(labelText, valueText, valueColor)
    local row = create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = THEME.panel,
        BorderSizePixel = 0,
        ZIndex = 2002,
    }, UI.DetailsContent)
    addCorner(row, 8)
    local left = makeLabel(
        row,
        labelText,
        10,
        THEME.muted,
        Enum.Font.Arial
    )
    left.Position = UDim2.fromOffset(11, 4)
    left.Size = UDim2.new(1, -22, 0, 15)
    left.ZIndex = 2003
    local right = makeLabel(
        row,
        valueText,
        13,
        valueColor or THEME.text,
        Enum.Font.Arial
    )
    right.Position = UDim2.fromOffset(11, 19)
    right.Size = UDim2.new(1, -22, 0, 18)
    right.TextWrapped = true
    right.ZIndex = 2003
    return row
end
local function closeDetails()
    UI.Details.Visible = false
    UI.DetailsBackdrop.Visible = false
end
connect(UI.DetailsClose.MouseButton1Click, closeDetails)
connect(UI.DetailsBackdrop.MouseButton1Click, closeDetails)
local function showItemDetails(
    record,
    context
)
    clearDetailsRows()
    context =
        context
        or {}
    if record
        and type(record.data)
            == "table" then
        local item =
            record.data
        UI.DetailsTitle.Text =
            record.name
        UI.DetailsSubtitle.Text =
            tostring(
                record.category
            )
        addDetailRow(
            "VALUE",
            tostring(
                item.value
                or "N/A"
            )
        )
        addDetailRow(
            "DEMAND",
            item.demand
                and (
                    tostring(
                        item.demand
                    )
                    .. " / 10"
                )
                or "N/A"
        )
        addDetailRow(
            "RARITY",
            item.rarity
                and (
                    tostring(
                        item.rarity
                    )
                    .. " / 10"
                )
                or "N/A"
        )
        addDetailRow(
            "STABILITY",
            tostring(
                item.stability
                or "N/A"
            )
        )
        addDetailRow(
            "FLIPPABILITY",
            tostring(
                item.flippability
                or "N/A"
            )
        )
        local trend =
            parsePercent(
                item.change_pct
            )
            or parsePercent(
                item.change_in_value
            )
        local trendColor =
            trend
            and trend > 0
            and THEME.green
            or trend
            and trend < 0
            and THEME.red
            or THEME.muted
        addDetailRow(
            "RECENT CHANGE",
            item.change_in_value
                or item.change_pct
                or "No recent change listed",
            trendColor
        )
        addDetailRow(
            "TIER",
            tostring(
                item.tier
                or "N/A"
            )
        )
        addDetailRow(
            "ORIGIN",
            tostring(
                item.origin
                or "N/A"
            )
        )
        addDetailRow(
            "EVENT",
            tostring(
                item.event
                or "N/A"
            )
        )
        addDetailRow(
            "YEAR",
            tostring(
                item.year
                or "N/A"
            )
        )
        addDetailRow(
            "ALIASES",
            tostring(
                item.aliases
                or "N/A"
            )
        )
    else
        UI.DetailsTitle.Text =
            tostring(
                context.displayName
                or context.itemId
                or "Unknown Item"
            )
        UI.DetailsSubtitle.Text =
            "No verified Supreme match"
        addDetailRow(
            "VALUE",
            "Unknown",
            THEME.yellow
        )
        addDetailRow(
            "STATUS",
            "This item is not confidently mapped yet.",
            THEME.yellow
        )
        if context.gameRarity then
            addDetailRow(
                "GAME RARITY",
                tostring(
                    context.gameRarity
                ),
                THEME.muted
            )
        end
    end
    UI.DetailsAction.Visible =
        false
    State.ActiveDetailsContext =
        context
    UI.DetailsScroll.CanvasPosition =
        Vector2.new(
            0,
            0
        )
    UI.DetailsBackdrop.Visible =
        true
    UI.Details.Visible =
        true
end
State.DecoratedCards = setmetatable({}, {__mode = "k"})
local function looksLikeItemCard(frame)
    if not frame or not frame:IsA("GuiObject") then
        return false
    end
    if frame.Name:sub(1, 3) == "SV_" then
        return false
    end
    local container = frame:FindFirstChild("Container")
    if not container then
        return false
    end
    local icon = container:FindFirstChild("Icon")
    if not icon then
        return false
    end
    local itemName = frame:FindFirstChild("ItemName")
    return itemName ~= nil or frame.Name:match("^NewItem%d+$") ~= nil
end
local function inferCardItemType(frame)
    if hasAncestorNamed(frame, "Pets") then
        return "Pets"
    end
    if hasAncestorNamed(frame, "Weapons") then
        return "Weapons"
    end
    return nil
end
local function inferCardItemId(frame, forcedId)
    if forcedId then
        return tostring(forcedId)
    end
    local attributes = {
        "ItemID",
        "ItemId",
        "ID",
        "Item",
    }
    for _, attribute in ipairs(attributes) do
        local value = frame:GetAttribute(attribute)
        if value ~= nil and tostring(value) ~= "" then
            return tostring(value)
        end
    end
    local display = getTextFromItemName(frame)
    if frame.Name ~= "Item"
        and not frame.Name:match("^NewItem%d+$")
        and frame.Name ~= "NewItem" then
        return frame.Name
    end
    return display
end
local function getLooseCardDisplayName(frame)
    local normal = getTextFromItemName(frame)
    if normal and trim(normal) ~= "" then
        return normal
    end
    local bestText = nil
    local bestScore = -math.huge
    for _, descendant in ipairs(frame:GetDescendants()) do
        if descendant:IsA("TextLabel")
            or descendant:IsA("TextButton") then
            local candidate = trim(descendant.Text)
            if candidate ~= ""
                and candidate ~= "i"
                and candidate ~= "?"
                and not candidate:match("^x?%d+$") then
                local score = 0
                local n = normalize(descendant.Name)
                if n:find("item", 1, true) then
                    score = score + 50
                end
                if n:find("name", 1, true)
                    or n == "label" then
                    score = score + 35
                end
                if candidate == "Weapons"
                    or candidate == "Pets"
                    or candidate == "Search"
                    or candidate == "Accept"
                    or candidate == "Decline" then
                    score = score - 100
                end
                score = score - math.max(0, #candidate - 24)
                if score > bestScore then
                    bestScore = score
                    bestText = candidate
                end
            end
        end
    end
    if bestText then
        return bestText
    end
    if frame.Name ~= "Item"
        and frame.Name ~= "NewItem"
        and not frame.Name:match("^NewItem%d+$")
        and frame.Name:sub(1, 3) ~= "SV_" then
        return frame.Name
    end
    return nil
end
local function looksLikeTradeInventoryCardLoose(frame)
    if not frame
        or not frame:IsA("GuiObject")
        or frame.Name:sub(1, 3) == "SV_" then
        return false
    end
    if looksLikeItemCard(frame) then
        return true
    end
    local iconId = getCardIconAssetId(frame)
    if not iconId then
        return false
    end
    local displayName = getLooseCardDisplayName(frame)
    return displayName ~= nil
        and trim(displayName) ~= ""
end
local function tradeCardIsInsideOffers(frame)
    return (
        State.TradeOffer1
        and frame:IsDescendantOf(State.TradeOffer1)
    ) or (
        State.TradeOffer2
        and frame:IsDescendantOf(State.TradeOffer2)
    )
end
local function classifyTradeCard(frame, preferredType)
    local displayName = getLooseCardDisplayName(frame)
    local iconAssetId = getCardIconAssetId(frame)
    if preferredType then
        local id =
            findInternalGameItemId(
                displayName or "",
                preferredType,
                iconAssetId
            )
        if id then
            return preferredType, id, displayName, iconAssetId
        end
    end
    local weaponId =
        findInternalGameItemId(
            displayName or "",
            "Weapons",
            iconAssetId
        )
    local petId =
        findInternalGameItemId(
            displayName or "",
            "Pets",
            iconAssetId
        )
    if weaponId and not petId then
        return "Weapons", weaponId, displayName, iconAssetId
    end
    if petId and not weaponId then
        return "Pets", petId, displayName, iconAssetId
    end
    if preferredType then
        return preferredType, nil, displayName, iconAssetId
    end
    return nil, nil, displayName, iconAssetId
end
local function removeCardDecoration(frame)
    if not frame then
        return
    end
    for _, name in ipairs({
        "SV_ValueBadge",
        "SV_InfoButton",
        "SV_TradeHighlight",
        "SV_TradeMeta",
    }) do
        local child = frame:FindFirstChild(name)
        if child then
            child:Destroy()
        end
    end
    State.DecoratedCards[frame] = nil
    State.UnresolvedCards[frame] = nil
end
local function formatBadgeValue(record)
    local itemValue = numericValue(record.data)
    if itemValue then
        return formatCompact(itemValue), THEME.text, false
    end
    local rawText = tostring(record.data.value or "?")
    rawText = rawText:gsub("^x(%d+)%s+", "%1x ")
    rawText = rawText:gsub("Legendaries$", "Leg.")
    rawText = rawText:gsub("Uncommons$", "Unc.")
    rawText = rawText:gsub("Commons$", "Com.")
    rawText = rawText:gsub("Rares$", "Rare")
    return rawText, THEME.yellow, true
end
local function addUnknownValueBadge(frame, compactMode)
    local existing = frame:FindFirstChild("SV_ValueBadge")
    if existing then
        existing:Destroy()
    end
    local badge = create("TextLabel", {
        Name = "SV_ValueBadge",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 4),
        Size = compactMode
            and UDim2.new(0.76, 0, 0, 19)
            or UDim2.new(0.84, 0, 0, 22),
        BackgroundColor3 = Color3.fromRGB(36, 18, 21),
        BackgroundTransparency = 0.02,
        BorderSizePixel = 0,
        Text = "?",
        TextColor3 = THEME.red,
        TextSize = compactMode and 14 or 16,
        Font = Enum.Font.ArialBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 95,
        Active = false,
    }, frame)
    addCorner(badge, 6)
    addStroke(badge, THEME.red, 1, 0.08)
end
local function addValueBadge(frame, record, compactMode)
    local existing = frame:FindFirstChild("SV_ValueBadge")
    if existing then
        existing:Destroy()
    end
    local text, textColor, longText = formatBadgeValue(record)
    local badge = create("TextLabel", {
        Name = "SV_ValueBadge",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 4),
        Size = compactMode
            and UDim2.new(0.76, 0, 0, 19)
            or UDim2.new(0.84, 0, 0, 22),
        BackgroundColor3 = Color3.fromRGB(10, 12, 16),
        BackgroundTransparency = 0.03,
        BorderSizePixel = 0,
        Text = text,
        TextColor3 = textColor,
        TextSize = longText
            and (compactMode and 10 or 11)
            or (compactMode and 13 or 15),
        TextScaled = false,
        TextWrapped = false,
        Font = Enum.Font.ArialBold,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 95,
        Active = false,
    }, frame)
    addCorner(badge, 6)
    addStroke(
        badge,
        textColor == THEME.yellow
            and Color3.fromRGB(167, 137, 47)
            or Color3.fromRGB(86, 95, 112),
        1,
        0.12
    )
    badge:SetAttribute("SV_RecordName", record.name)
    badge:SetAttribute("SV_Category", record.category)
end
local function addInfoButton(frame, record, compactMode, context)
    if not CONFIG.StatsButtons then
        return
    end
    local existing = frame:FindFirstChild("SV_InfoButton")
    if existing then
        existing:Destroy()
    end
    local resolved = record ~= nil
    local buttonColor =
        resolved
        and Color3.fromRGB(19, 23, 30)
        or Color3.fromRGB(105, 35, 43)
    local accent =
        resolved and THEME.blue or THEME.red
    local button = create("TextButton", {
        Name = "SV_InfoButton",
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(
            0.5,
            compactMode and 25 or 31,
            0,
            compactMode and 26 or 29
        ),
        Size = compactMode
            and UDim2.fromOffset(17, 17)
            or UDim2.fromOffset(19, 19),
        BackgroundColor3 = buttonColor,
        BackgroundTransparency = 0.02,
        BorderSizePixel = 0,
        Text = resolved and "i" or "?",
        TextColor3 = accent,
        TextSize = compactMode and 10 or 11,
        Font = Enum.Font.ArialBold,
        AutoButtonColor = false,
        ZIndex = 100,
    }, frame)
    addCorner(button, 99)
    addStroke(button, accent, resolved and 1 or 2, 0.12)
    connect(button.MouseButton1Click, function()
        showItemDetails(record, context)
    end)
end
local function decorateCard(frame, options)
    options = options or {}
    if not frame
        or not frame.Parent then
        return nil
    end
    if not looksLikeItemCard(frame)
        and not (
            options.allowLooseCard
            and looksLikeTradeInventoryCardLoose(
                frame
            )
        ) then
        return nil
    end
    local itemType =
        options.itemType
        or inferCardItemType(frame)
    if not itemType then
        removeCardDecoration(frame)
        return nil
    end
    local itemId =
        inferCardItemId(
            frame,
            options.itemId
        )
    local displayName =
        options.displayName
        or getTextFromItemName(frame)
    local iconAssetId =
        getCardIconAssetId(frame)
    local rarityHint =
        options.rarityHint
        or State.GetCardRarityHint(
            frame
        )
    local rawImageKey =
        options.rawImageKey
        or State.GetCardRawImageKey(
            frame
        )
    local directGameData =
        itemId
        and select(
            1,
            getGameItemData(
                itemType,
                itemId
            )
        )
        or nil
    local identitySource = nil
    if directGameData then
        identitySource =
            "Exact DataID -> Sync"
    end
    if not iconAssetId
        and directGameData then
        iconAssetId =
            getBestGameDataAssetId(
                directGameData
            )
    end
    if not rarityHint
        and type(directGameData)
            == "table"
        and directGameData.Rarity then
        rarityHint =
            tostring(
                directGameData.Rarity
            )
    end
    if displayName
        and (
            not itemId
            or not directGameData
            or itemId == "Item"
            or itemId == "NewItem"
            or tostring(itemId):match(
                "^NewItem%d+$"
            )
        ) then
        local discoveredId =
            findInternalGameItemId(
                displayName,
                itemType,
                iconAssetId,
                rarityHint,
                rawImageKey
            )
        if discoveredId then
            itemId = discoveredId
            directGameData =
                select(
                    1,
                    getGameItemData(
                        itemType,
                        itemId
                    )
                )
                or directGameData
            identitySource =
                "GUI image/rarity -> Sync"
        end
        if itemId then
            if not iconAssetId
                and directGameData then
                iconAssetId =
                    getBestGameDataAssetId(
                        directGameData
                    )
            end
            if not rarityHint
                and type(directGameData)
                    == "table"
                and directGameData.Rarity then
                rarityHint =
                    tostring(
                        directGameData.Rarity
                    )
            end
        end
    end
    if not itemId
        and not displayName then
        return nil
    end
    local record =
        options.record
    local resolutionMeta = nil
    local manualImageLink = nil
    if record then
        resolutionMeta = {
            trusted = true,
            level = "provided",
            source = "provided_record",
        }
    end
    if not record
        and CONFIG.PreferNativeIdentity
        and directGameData then
        local nativeRecord,
            _,
            nativeMeta =
            resolveGameItem(
                itemId or displayName,
                itemType,
                displayName
            )
        if nativeRecord then
            record = nativeRecord
            resolutionMeta =
                nativeMeta
        end
    end
    if not record
        and CONFIG.LinkedImagesFallback
        and iconAssetId then
        manualImageLink =
            LinkedImages[
                numericAssetId(
                    iconAssetId
                )
            ]
        if manualImageLink then
            record =
                State.Mapping.ResolveLinkRecord(
                    manualImageLink
                )
            if record then
                resolutionMeta = {
                    trusted = true,
                    level =
                        "manual-fallback",
                    source =
                        "linked_images.json",
                }
                identitySource =
                    identitySource
                    or "Manual image fallback"
            end
        end
    end
    if not record then
        local fallbackRecord,
            _,
            fallbackMeta =
            resolveGameItem(
                itemId or displayName,
                itemType,
                displayName
            )
        record = fallbackRecord
        resolutionMeta =
            fallbackMeta
            or resolutionMeta
    end
    local suggestedRecord = nil
    if record
        and options.requireTrustedResolution
        and resolutionMeta
        and resolutionMeta.trusted
            == false then
        suggestedRecord = record
        record = nil
    end
    local context = {
        frame = frame,
        assetId = iconAssetId,
        itemId = itemId,
        itemType = itemType,
        displayName = displayName,
        gameRarity = rarityHint,
        rawImageKey = rawImageKey,
        gameDatabaseSource =
            State.GameDatabaseSource,
        identitySource =
            identitySource
            or (
                resolutionMeta
                and resolutionMeta.source
            )
            or "Supreme name fallback",
        resolutionMeta =
            resolutionMeta,
        suggestedRecord =
            suggestedRecord,
        capturedItem =
            captured
            and {
                DataID =
                    captured.DataID,
                DataType =
                    captured.DataType,
                ItemName =
                    captured.ItemName
                    or captured.Name,
                Image =
                    captured.Image,
                Rarity =
                    captured.Rarity,
                Event =
                    captured.Event,
                Year =
                    captured.Year,
                Chroma =
                    captured.Chroma,
            }
            or nil,
    }
    if not record then
        removeCardDecoration(frame)
        State.UnresolvedCards[
            frame
        ] = context
        if options.showValue
            ~= false then
            addUnknownValueBadge(
                frame,
                options.compactMode
                    == true
            )
        end
        if options.showInfo
            ~= false then
            addInfoButton(
                frame,
                nil,
                options.compactMode
                    == true,
                context
            )
        end
        return nil, context
    end
    State.UnresolvedCards[
        frame
    ] = nil
    local previous =
        State.DecoratedCards[
            frame
        ]
    local hasRequiredValue =
        options.showValue == false
        or frame:FindFirstChild(
            "SV_ValueBadge"
        ) ~= nil
    local hasRequiredInfo =
        options.showInfo == false
        or frame:FindFirstChild(
            "SV_InfoButton"
        ) ~= nil
    if previous
        and previous.record
            == record
        and previous.itemId
            == itemId
        and previous.itemType
            == itemType
        and hasRequiredValue
        and hasRequiredInfo then
        return record,
            previous.context
            or context
    end
    State.DecoratedCards[
        frame
    ] = {
        itemId = itemId,
        itemType = itemType,
        record = record,
        displayName = displayName,
        showValue =
            options.showValue,
        showInfo =
            options.showInfo,
        compactMode =
            options.compactMode
            == true,
        context = context,
        resolutionMeta =
            resolutionMeta,
    }
    if options.showValue
        ~= false then
        addValueBadge(
            frame,
            record,
            options.compactMode
                == true
        )
    end
    if options.showInfo
        ~= false then
        addInfoButton(
            frame,
            record,
            options.compactMode
                == true,
            context
        )
    end
    return record, context
end
State.HighlightedCards = setmetatable({}, {__mode = "k"})
local function clearTradeHighlight(frame)
    local existing = frame and frame:FindFirstChild("SV_TradeHighlight")
    if existing then
        existing:Destroy()
    end
    State.HighlightedCards[frame] = nil
end
local function setTradeHighlight(frame, mode, result)
    if not frame or not frame.Parent then
        return
    end
    clearTradeHighlight(frame)
    if not mode then
        return
    end
    local color = mode == "BEST" and CONFIG.BestColor or CONFIG.SafeColor
    local overlay = create("Frame", {
        Name = "SV_TradeHighlight",
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = color,
        BackgroundTransparency =
            mode == "BEST" and 0.68 or 0.78,
        BorderSizePixel = 0,
        Active = false,
        ZIndex = 85,
    }, frame)
    addCorner(overlay, 7)
    local stroke = addStroke(
        overlay,
        color,
        mode == "BEST" and 3 or 2,
        0
    )
    stroke.Name = "Stroke"
    local pill = create("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 4),
        Size = mode == "BEST"
            and UDim2.fromOffset(76, 19)
            or UDim2.fromOffset(48, 19),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        Text = mode == "BEST" and "BEST ADD" or "SAFE",
        TextColor3 = Color3.fromRGB(20, 22, 27),
        TextSize = 9,
        Font = Enum.Font.ArialBold,
        ZIndex = 86,
        Active = false,
    }, overlay)
    addCorner(pill, 99)
    if result and result.value then
        overlay:SetAttribute("SV_ResultScore", result.score)
        overlay:SetAttribute("SV_ResultDifference", result.value.difference)
    end
    State.HighlightedCards[frame] = true
end
local function clearAllTradeHighlights()
    for frame in pairs(State.HighlightedCards) do
        if frame and frame.Parent then
            clearTradeHighlight(frame)
        end
    end
end
local TradePanel = create("Frame", {
    Name = "SV_TradePanel",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -282, 0.5, 0),
    Size = UDim2.fromOffset(310, 490),
    BackgroundColor3 = THEME.bg,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 1000,
}, UI.RootGui)
addCorner(TradePanel, 6)
addStroke(TradePanel, THEME.border, 1, 0.1)
create("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 105, 154)),
        ColorSequenceKeypoint.new(0.18, Color3.fromRGB(11, 68, 104)),
        ColorSequenceKeypoint.new(1, THEME.bg),
    }),
    Rotation = 90,
}, TradePanel)
UI.TradePanelScale = create("UIScale", {
    Scale = 1,
}, TradePanel)
UI.DetailsScale = create("UIScale", {
    Scale = 1,
}, UI.Details)
local clampAutoTraderPanelPosition = function() end
local function updatePublicUiScale()
    local camera = workspace.CurrentCamera
    local viewport =
        camera
        and camera.ViewportSize
        or Vector2.new(1366, 768)
    local scale =
        clamp(
            math.min(
                viewport.X / 1366,
                viewport.Y / 768
            ),
            0.78,
            1
        )
    if UI.TradePanelScale
        and UI.TradePanelScale.Parent then
        UI.TradePanelScale.Scale =
            scale
    end
    if UI.DetailsScale
        and UI.DetailsScale.Parent then
        UI.DetailsScale.Scale =
            scale
    end
    if UI.AutoTraderScale
        and UI.AutoTraderScale.Parent then
        UI.AutoTraderScale.Scale =
            scale
    end
    if UI.AutoTraderLauncherScale
        and UI.AutoTraderLauncherScale.Parent then
        UI.AutoTraderLauncherScale.Scale = scale
    end
    task.defer(function() if not Destroyed then clampAutoTraderPanelPosition(false) end end)
end
updatePublicUiScale()
UI.TradePanelTitle = makeLabel(
    TradePanel,
    "TRADE ANALYSIS",
    11,
    THEME.faint,
    Enum.Font.ArialBold
)
UI.TradePanelTitle.Position = UDim2.fromOffset(14, 10)
UI.TradePanelTitle.Size = UDim2.new(1, -28, 0, 18)
UI.TradePanelTitle.ZIndex = 1001
UI.TradePanelStatus = makeLabel(
    TradePanel,
    "Waiting for trade...",
    18,
    THEME.text,
    Enum.Font.ArialBold
)
UI.TradePanelStatus.Position = UDim2.fromOffset(14, 31)
UI.TradePanelStatus.Size = UDim2.new(1, -28, 0, 28)
UI.TradePanelStatus.ZIndex = 1001
UI.TradePanelScore = makeLabel(
    TradePanel,
    "",
    10,
    THEME.muted,
    Enum.Font.Arial
)
UI.TradePanelScore.Position = UDim2.fromOffset(14, 59)
UI.TradePanelScore.Size = UDim2.new(1, -28, 0, 18)
UI.TradePanelScore.ZIndex = 1001
UI.ToggleHelper = makeButton(
    TradePanel,
    "",
    UDim2.new(1, -28, 0, 34),
    Color3.fromRGB(30, 45, 39)
)
UI.ToggleHelper.Position = UDim2.fromOffset(14, 84)
UI.ToggleHelper.ZIndex = 1001
local function refreshToggleText()
    if State.TradeHelperEnabled then
        UI.ToggleHelper.Text = "Trade Helper: ON"
        UI.ToggleHelper.BackgroundColor3 = Color3.fromRGB(30, 55, 43)
        UI.ToggleHelper.TextColor3 = THEME.green
    else
        UI.ToggleHelper.Text = "Trade Helper: OFF"
        UI.ToggleHelper.BackgroundColor3 = THEME.panel2
        UI.ToggleHelper.TextColor3 = THEME.muted
    end
end
refreshToggleText()
local isTradeVisible
local scheduleTradeRefresh
local reconnectGuiWatchers
State.AutoTrader = {
    PreferencesKey = "__SV_AUTO_TRADER_PREFS_V3",
    PreferencesFile = "SV_AutoTrader_Preferences_v3.json",
    DebugLogFile = "SV_AutoTrader_DebugLog_v1.jsonl",
    TeleportScriptLkgFile = "SV_AutoTrader_LastKnownGoodScript_v1.lua",
    TargetStatsKey = "__SV_AUTO_TRADER_TARGET_STATS_V2",
    TargetStatsFile = "SV_AutoTrader_TargetStats_v2.json",
    TargetStatsLegacyFile = "SV_AutoTrader_TargetStats_v1.json",
    RecentJobsKey = "__SV_AUTO_TRADER_RECENT_JOBS_V1",
    RecentJobsFile = "SV_AutoTrader_RecentJobs_v1.json",
    ServerCandidateCacheKey = "__SV_AUTO_TRADER_SERVER_CANDIDATE_CACHE_V1",
    ServerCandidateCacheFile = "SV_AutoTrader_ServerCandidateCache_v1.json",
    BotIconDbKey = "__SV_AUTO_TRADER_BOT_HASHES_V2",
    BotIconDbFile = "SV_AutoTrader_BotHashes_v2.json",
    HumanTimingKey = "__SV_AUTO_TRADER_HUMAN_TIMING_V1",
    HumanTimingFile = "SV_AutoTrader_HumanDetectionTiming_v1.json",
    TeleportBootstrapKey = "__SV_AUTO_TRADER_TELEPORT_BOOTSTRAP_V1",
    FriendCache = {},
    FriendCacheMeta = {},
    FriendPending = {},
    Cooldowns = {},
    RequestHistory = {},
    TargetStats = {version = 2, players = {}, strategy = {}},
    TargetProfileCache = {},
    FirstOfferAt = 0,
    InventoryCache = nil,
    InventoryCacheAt = 0,
    InventoryCacheStamp = nil,
    PlanGeneration = 0,
    ActionGeneration = 0,
    ActionSerial = 0,
    ActionInFlight = nil,
    SessionFrozen = nil,
    LastOtherHash = nil,
    OtherStableSince = 0,
    LastTradePartner = nil,
    ManagedPartnerUserId = nil,
    PendingRequest = nil,
    SelectedTarget = nil,
    NextRequestAt = os.clock() + 1.5,
    TradeBeganAt = 0,

    LastCalculationSignature = nil,
    LastManagedLocalHash = nil,
    Status = "IDLE",
    StatusDetail = "Full Auto Trading is off. Planner remains available.",
    Plan = nil,
    Safety = nil,
    Anchor = nil,
    Desired = nil,
    OtherSummary = nil,
    ProtectedSearch = "",
    DebugLog = {},
    LastPlannerReason = nil,
    LastMarketGate = nil,
    LastEffectiveMinimumWin = nil,
    LastAuditDetail = nil,
    TargetStatsSaveGeneration = 0,
    LocalDeclineAt = 0,
    LocalDeclineButton = nil,
    RequestCancelButton = nil,
    RequestConfirmGeneration = 0,
    LastRequestGate = nil,
    LastRequestAttempt = nil,
    IncomingRequestFrame = nil,
    IncomingRequestUsernameObject = nil,
    IncomingRequestGeneration = 0,
    IncomingRequestDecision = nil,
    IncomingRequestResolvingSignature = nil,
    IncomingRequestLastSignature = nil,
    IncomingRequestLastHandledAt = 0,
    IncomingRequestFirstSeenSignature = nil,
    IncomingRequestFirstSeenAt = 0,
    ManualAcceptHold = false,
    AutoAcceptGeneration = 0,
    AutoAcceptScheduledKey = nil,
    AutoAcceptSentKey = nil,
    AutoAcceptSentAt = 0,
    AutoAcceptTradeUpdateAt = 0,
    OtherAcceptedAt = 0,
    LastTradeUpdateAt = 0,
    LastTradeActivityAt = 0,
    BackgroundSuppressed = false,
    BackgroundRestore = {},
    BackgroundRestoreIndex = setmetatable({}, {__mode = "k"}),
    NotificationSerial = 0,
    PostTradeAuditPending = false,
    PostTradeAuditGeneration = 0,
    PostTradeAuditStartedAt = 0,
    PostTradeAuditOwner = nil,
    LastAcceptAudit = nil,
    PendingAutoTransaction = nil,
    AutoTransactionGeneration = 0,
    SettlementStartedAt = 0,
    SettlementGoneSince = 0,
    SettlementLastProbeAt = 0,
    SettlementEndedProbeCount = 0,
    FriendTradeCheckStartedAt = 0,
    UnresolvedTradePartnerSince = 0,
    ActiveTradeInventoryWaitSince = 0,
    LastEligibilitySnapshot = nil,
    ServerPlayers = {},
    ServerJoinedAt = os.clock(),
    LastServerDisposition = nil,
    LastServerDispositionAt = 0,
    ServerExhaustedSince = 0,
    LastDiscoveryKickAt = 0,
    ServerHopInProgress = false,
    LastServerHopAttemptAt = 0,
    ServerHopQueue = {},
    ServerHopQueueIndex = 0,
    ServerHopQueueGeneration = 0,
    ServerHopCurrentCandidate = nil,
    ServerHopCurrentDisposition = nil,
    ServerHopAttemptGeneration = 0,
    ServerHopTeleportStarted = false,
    ServerHopStartedAt = 0,
    ServerHopLastProgressAt = 0,
    EmptyServerScanCount = 0,
    RecentJobs = {},
    ServerCandidateCache = {version = 1, entries = {}},
    ServerCandidateCacheSaveGeneration = 0,
    LastServerCandidateCacheUse = nil,
    BotIconDb = {version = 4, icons = {}},
    BotIconDbSaveGeneration = 0,
    BotLearningDoneJobId = nil,
    BotLearningLastAttemptAt = 0,
    LastBotLearning = nil,
    GoldBotCertification = {
        jobId = game.JobId, status = "waiting", reason = "Waiting for persistent per-player MoveDirection + RootPart evidence.",
        windowStartedAt = 0, membershipKey = nil, players = {}, sampleCount = 0, attempts = 0,
        certifiedAt = 0, lastHashAttemptAt = 0, learnedHashes = 0, certifiedUserIds = nil,
        moveDirectionViolation = nil, maxObservedMoveDirection = 0,
        candidateFingerprintByUserId = nil, candidateImageByUserId = nil, candidatePreparedAt = 0,
        currentRemoteCount = 0, passedRemoteCount = 0, pendingRemoteCount = 0, trackableRemoteCount = 0,
    },
    GoldCertificationHistory = {},
    HumanDetectionTiming = {version = 1, count = 0, totalSeconds = 0, maxSeconds = 0, samples = {}},
    HumanTimingSaveGeneration = 0,
    ServerRateLimitBackoffSeconds = 0,
    ServerRateLimitConsecutiveScans = 0,
    LastServerScan = nil,
    CurrentServerAvatarScreen = nil,
    CurrentServerAvatarScreenAt = 0,
    CurrentServerAvatarScreenInFlight = false,
    CurrentServerAvatarScreenJobId = nil,
    FastBotHopActive = false,
    FastBotHopReason = nil,
    PlayerBotRiskByUserId = {},
    LastOpportunityDecision = nil,
    AuditedTradesThisServer = 0,
    TeleportQueued = false,
    TeleportQueueOutcome = nil,
    TeleportBootstrapSerial = 0,
    LastTeleportBootstrapId = nil,
    TeleportScriptLkgVerifiedAt = 0,
    TeleportScriptIntegrity = "unknown",
    TeleportInProgress = false,
    TeleportAttemptStartedAt = 0,
    TeleportAttemptOriginJobId = nil,
    LastTeleportReason = nil,
    RecoveryTeleportRequired = false,
    RecoveryTeleportReason = nil,
    RecoveryTeleportLastAttemptAt = 0,
    StaleTradeGuiSince = 0,
    RequestLifecycle = "idle",
    OrphanRequestCancelStartedAt = 0,
    OrphanRequestQuietSince = 0,
    TradeDeclinePending = false,
    TradeDeclineStartedAt = 0,
    TradeDeclineQuietSince = 0,
    TradeDeclinePartnerUserId = nil,
    TradeDeclineOutcome = nil,
    TradeRequestStartedAt = 0,
    TradeCorrelationId = nil,
    NoEligibleWorkSince = 0,
    ServerMeaningfulProgressAt = os.clock(),
    ServerNoProgressRecoveries = 0,
    RemoteInvokeTimeoutsThisServer = 0,
    HungRemoteInvokes = 0,
    RemoteInvokeCircuitOpen = false,
    RemoteInvokeCircuitOpenedAt = 0,
    RemoteInvokeLive = 0,
    LastRemoteInvokeLatency = 0,
    MaxRemoteInvokeLatency = 0,
    OperationalFreezeAt = 0,
    OperationalFreezeReason = nil,
    FatalIntegrityStop = false,
    MovementSamples = {},
    LastAnyMovementAt = os.clock(),
    MovementWatchdogArmedAt = os.clock() + CONFIG.AutoTraderMovementJoinGraceSeconds,
    LastSameServerRecoveryAt = 0,
    UiSession = {
        startedAt = os.clock(),
        requests = 0, responses = 0, trades = 0, successes = 0,
        declines = 0, tradeDeclines = 0, ignored = 0, idle = 0,
        profit = 0,
    },
    ActiveTab = "HOME",
    LastRenderedAt = 0,
    RenderQueued = false,
    RenderCount = 0,
    RenderWindowStartedAt = os.clock(),
    LastPlayerDashboardBuildAt = 0,
    LastServerDashboardBuildAt = 0,
    LastBotDashboardBuildAt = 0,
    DebugSequence = 0,
    DiskLogPending = 0,
    LastRecoveryReason = nil,
    AutomaticRecoveryCount = 0,
    RecoveryReasonLastAt = {},
    ControllerEpoch = tostring(os.time()) .. "-" .. tostring(math.random(100000,999999)),
    DataDegradedReason = nil,
    LastSafetyEvent = nil,
    LastDecisionEvent = nil,
    LastReplayFixture = nil,
    SelfTest = nil,
}
local function getExecutorEnvironment()
    local getter = rawget(_G, "getgenv")
    if type(getter) == "function" then
        local ok, env = pcall(getter)
        if ok and type(env) == "table" then
            return env
        end
    end
    return _G
end
local ExecutorEnvironment = getExecutorEnvironment()
HARDEN.persistenceHealth = {files = {}, lastError = nil, lastSaveUnix = 0}
local function notePersistence(fileName, ok, action, err)
    local row = HARDEN.persistenceHealth.files[fileName] or {}
    row.lastAction = action
    row.lastAtUnix = os.time()
    row.ok = ok == true
    row.error = ok and nil or tostring(err or "unknown persistence error")
    HARDEN.persistenceHealth.files[fileName] = row
    if ok then HARDEN.persistenceHealth.lastSaveUnix = os.time() else HARDEN.persistenceHealth.lastError = row.error end
end
HARDEN.readTextFileBestEffort = function(fileName)
    local isfileFunction = State.TryGetExecutorGlobal("isfile")
    local readfileFunction = State.TryGetExecutorGlobal("readfile")
    if type(isfileFunction) ~= "function" or type(readfileFunction) ~= "function" then
        notePersistence(fileName, false, "read", "file API unavailable")
        return nil, "file API unavailable"
    end
    local function tryName(name)
        local okExists, exists = waitForExternalWithDeadline("isfile " .. name, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return isfileFunction(name) end)
        if not okExists or not exists then return nil, okExists and "missing" or tostring(exists) end
        local okRead, body = waitForExternalWithDeadline("readfile " .. name, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return readfileFunction(name) end)
        if okRead and type(body) == "string" then return body end
        return nil, tostring(body)
    end
    local body, err = tryName(fileName)
    if type(body) == "string" then notePersistence(fileName, true, "read"); return body, nil, "primary" end
    local backup, backupErr = tryName(fileName .. ".bak")
    if type(backup) == "string" then
        notePersistence(fileName, true, "read_backup")
        return backup, nil, "backup"
    end
    notePersistence(fileName, false, "read", err or backupErr)
    return nil, tostring(err or backupErr)
end
HARDEN.readJsonFileBestEffort = function(fileName)
    local body, err, source = HARDEN.readTextFileBestEffort(fileName)
    local function decode(text)
        if type(text) ~= "string" or text == "" then return nil end
        local ok, decoded = pcall(function() return HttpService:JSONDecode(text) end)
        return ok and type(decoded) == "table" and decoded or nil
    end
    local decoded = decode(body)
    if decoded then return decoded, nil, source end
    if source == "primary" then
        local backup = HARDEN.readTextFileBestEffort(fileName .. ".bak")
        decoded = decode(backup)
        if decoded then
            notePersistence(fileName, true, "read_backup_after_invalid_primary")
            return decoded, nil, "backup"
        end
    end
    return nil, err or "invalid JSON persistence document", source
end
HARDEN.fileWriteState = HARDEN.fileWriteState or {nextSerial = 0, byFile = {}}
HARDEN.atomicWriteTextFileBestEffort = function(fileName, body)
    local writefileFunction = State.TryGetExecutorGlobal("writefile")
    local readfileFunction = State.TryGetExecutorGlobal("readfile")
    local isfileFunction = State.TryGetExecutorGlobal("isfile")
    local delfileFunction = State.TryGetExecutorGlobal("delfile")
    if type(writefileFunction) ~= "function" or type(body) ~= "string" then
        notePersistence(fileName, false, "write", "writefile unavailable")
        return false, "writefile unavailable"
    end

    local existingLock = HARDEN.fileWriteState.byFile[fileName]
    if existingLock and existingLock.busy then
        return false, existingLock.uncertain and "previous file write is still unresolved" or "file write already in progress"
    end
    HARDEN.fileWriteState.nextSerial += 1
    local serial = HARDEN.fileWriteState.nextSerial
    local lock = {busy = true, uncertain = false, serial = serial, startedAt = os.clock()}
    HARDEN.fileWriteState.byFile[fileName] = lock
    local function release()
        if HARDEN.fileWriteState.byFile[fileName] == lock then HARDEN.fileWriteState.byFile[fileName] = nil end
        lock.busy = false
    end
    local function holdUntilResolved(request)
        lock.uncertain = true
        if request then
            task.spawn(function()
                while not request.done and not Destroyed do task.wait(0.1) end
                release()
            end)
        end
    end
    local function fail(reason, request)
        notePersistence(fileName, false, "write", reason)
        if request and request.timedOut and not request.done then holdUntilResolved(request) else release() end
        return false, reason
    end

    local oldBody = nil
    if type(isfileFunction) == "function" and type(readfileFunction) == "function" then
        local okExists, exists, existsRequest = waitForExternalWithDeadline("isfile " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return isfileFunction(fileName) end)
        if not okExists and existsRequest and existsRequest.timedOut then return fail(tostring(exists), existsRequest) end
        if okExists and exists then
            local okOld, prior, readRequest = waitForExternalWithDeadline("readfile " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return readfileFunction(fileName) end)
            if not okOld and readRequest and readRequest.timedOut then return fail(tostring(prior), readRequest) end
            if okOld and type(prior) == "string" then oldBody = prior end
        end
    end
    if oldBody then
        local okBackup, backupErr, backupRequest = waitForExternalWithDeadline("writefile backup " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return writefileFunction(fileName .. ".bak", oldBody) end)
        if not okBackup and backupRequest and backupRequest.timedOut then return fail(tostring(backupErr), backupRequest) end
    end

    local tempName = fileName .. ".tmp." .. tostring(serial)
    local okTemp, tempErr, tempRequest = waitForExternalWithDeadline("writefile temp " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return writefileFunction(tempName, body) end)
    if not okTemp then return fail(tostring(tempErr), tempRequest) end
    if type(readfileFunction) == "function" then
        local okVerify, verifyBody, verifyRequest = waitForExternalWithDeadline("verify temp " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return readfileFunction(tempName) end)
        if not okVerify then return fail(tostring(verifyBody), verifyRequest) end
        if verifyBody ~= body then return fail("temporary file verification failed") end
    end

    -- Direct replacement is safer across executor APIs than delete-then-rename: a timed-out
    -- delete could otherwise execute late and remove the newly committed file. Never retry a
    -- timed-out final write; keep this filename locked until the underlying callback resolves.
    local okFinal, finalErr, finalRequest = waitForExternalWithDeadline("writefile final " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return writefileFunction(fileName, body) end)
    if not okFinal then return fail(tostring(finalErr), finalRequest) end
    if type(readfileFunction) == "function" then
        local okVerify, verifyBody, verifyRequest = waitForExternalWithDeadline("verify final " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return readfileFunction(fileName) end)
        if not okVerify then return fail(tostring(verifyBody), verifyRequest) end
        if verifyBody ~= body then return fail("final file verification failed") end
    end
    if type(delfileFunction) == "function" and not HARDEN.tempCleanupDisabled then
        local okDelete, _, deleteRequest = waitForExternalWithDeadline("delete temp " .. fileName, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return delfileFunction(tempName) end)
        if not okDelete and deleteRequest and deleteRequest.timedOut then HARDEN.tempCleanupDisabled = true end
    end
    notePersistence(fileName, true, "write")
    release()
    return true
end
HARDEN.readLkgEnvelope = function(fileName)
    local function saneSavedAt(value)
        local now = os.time()
        local savedAt = tonumber(value)
        if not savedAt or savedAt < 946684800 or savedAt > now + 300 then return nil end
        return math.min(savedAt, now)
    end
    local function validateV1(decoded, cooperativeHash)
        if type(decoded) ~= "table" or tonumber(decoded.version) ~= 1 or type(decoded.body) ~= "string" then
            return nil, "invalid LKG envelope"
        end
        local savedAt = saneSavedAt(decoded.savedAtUnix)
        if not savedAt then return nil, "LKG savedAtUnix is invalid or implausibly in the future" end
        local digest = sha256Hex(decoded.body, cooperativeHash == true)
        if type(decoded.sha256) ~= "string" or not digest or string.lower(digest) ~= string.lower(decoded.sha256) then
            return nil, "LKG body hash mismatch"
        end
        decoded.savedAtUnix = savedAt
        decoded.sha256 = digest
        return decoded
    end
    if fileName == HARDEN.supremeLkgFile then
        local readfileFunction = State.TryGetExecutorGlobal("readfile")
        local isfileFunction = State.TryGetExecutorGlobal("isfile")
        local function readExact(name)
            if type(readfileFunction) ~= "function" or type(isfileFunction) ~= "function" then return nil end
            local okExists, exists = waitForExternalWithDeadline("isfile " .. name, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return isfileFunction(name) end)
            if not okExists or not exists then return nil end
            local okRead, value = waitForExternalWithDeadline("readfile " .. name, CONFIG.AutoTraderExecutorFileTimeoutSeconds, function() return readfileFunction(name) end)
            return okRead and type(value) == "string" and value or nil
        end
        local function decodeMeta(text)
            if type(text) ~= "string" then return nil end
            local ok, decoded = pcall(function() return HttpService:JSONDecode(text) end)
            return ok and type(decoded) == "table" and decoded or nil
        end
        local bodyPrimary = readExact(HARDEN.supremeLkgFile)
        local bodyBackup = readExact(HARDEN.supremeLkgFile .. ".bak")
        local metaPrimary = decodeMeta(readExact(HARDEN.supremeLkgMetaFile))
        local metaBackup = decodeMeta(readExact(HARDEN.supremeLkgMetaFile .. ".bak"))
        local metas = {metaPrimary, metaBackup}
        local bodies = {bodyPrimary, bodyBackup}
        for _, body in pairs(bodies) do
            if type(body) == "string" and body ~= "" then
                local digest, hashYields, hashMilliseconds = sha256Hex(body, true)
                HARDEN.lastSupremeLkgHashYields = tonumber(hashYields) or 0
                HARDEN.lastSupremeLkgHashMilliseconds = tonumber(hashMilliseconds) or 0
                if digest then
                    for _, meta in pairs(metas) do
                        local savedAt = meta and tonumber(meta.version) == 2 and saneSavedAt(meta.savedAtUnix) or nil
                        if savedAt and type(meta.sha256) == "string" and string.lower(meta.sha256) == string.lower(digest) then
                            notePersistence(fileName, true, "read_verified_raw_lkg")
                            return {version=2, savedAtUnix=savedAt, sha256=digest, body=body, controllerVersion=meta.controllerVersion}
                        end
                    end
                end
            end
        end
        -- One-release migration path: accept the old giant JSON envelope when v2 is absent.
        local legacy = HARDEN.readJsonFileBestEffort(HARDEN.supremeLkgLegacyFile)
        local validLegacy, legacyError = validateV1(legacy, true)
        if validLegacy then
            notePersistence(fileName, true, "read_verified_legacy_lkg")
            return validLegacy
        end
        return nil, legacyError or "no valid Supreme Values LKG"
    end
    local decoded, readError, source = HARDEN.readJsonFileBestEffort(fileName)
    local valid, validationError = validateV1(decoded, false)
    if valid then return valid end
    if source == "primary" then
        local backup = HARDEN.readJsonFileBestEffort(fileName .. ".bak")
        valid = validateV1(backup, false)
        if valid then
            notePersistence(fileName, true, "read_verified_backup")
            return valid
        end
    end
    return nil, validationError or readError or "invalid LKG envelope"
end
HARDEN.writeLkgEnvelope = function(fileName, body, knownDigest)
    if type(body) ~= "string" then return false, "invalid LKG body" end
    local digest = type(knownDigest) == "string" and knownDigest or nil
    if not digest then digest = sha256Hex(body, fileName == HARDEN.supremeLkgFile) end
    if not digest then return false, "SHA-256 unavailable for LKG write" end
    if fileName == HARDEN.supremeLkgFile then
        -- Store the huge Supreme JSON as raw bytes and keep only tiny integrity metadata in JSON.
        -- Body first, metadata second: metadata is the commit point, and the reader can pair backups
        -- by digest if a shutdown interrupts between the two writes.
        local bodyOK, bodyErr = HARDEN.atomicWriteTextFileBestEffort(HARDEN.supremeLkgFile, body)
        if not bodyOK then return false, bodyErr end
        local okMeta, encodedMeta = pcall(function() return HttpService:JSONEncode({
            version = 2, savedAtUnix = os.time(), sha256 = digest, controllerVersion = CONTROLLER_VERSION,
        }) end)
        if not okMeta then return false, encodedMeta end
        return HARDEN.atomicWriteTextFileBestEffort(HARDEN.supremeLkgMetaFile, encodedMeta)
    end
    local ok, encoded = pcall(function() return HttpService:JSONEncode({
        version = 1, savedAtUnix = os.time(), sha256 = digest, body = body, controllerVersion = CONTROLLER_VERSION,
    }) end)
    if not ok then return false, encoded end
    return HARDEN.atomicWriteTextFileBestEffort(fileName, encoded)
end
State.AutoTrader.TeleportBootstrap = rawget(ExecutorEnvironment, State.AutoTrader.TeleportBootstrapKey)
    or rawget(_G, State.AutoTrader.TeleportBootstrapKey)
local function defaultPreferences()
    return {
        automation = CONFIG.AutoTraderActiveDefault,
        ignoreFriends = CONFIG.AutoTraderIgnoreFriendsDefault,
        openingAnchor = CONFIG.AutoTraderOpeningAnchorDefault,
        preferDuplicates = CONFIG.AutoTraderPreferDuplicatesDefault,
        unknownTheirZero = CONFIG.AutoTraderUnknownTheirZeroDefault,
        winPreset = 2,
        reserves = {},
        panelPosition = nil,
    }
end
local function normalizePreferences(value)
    local defaults = defaultPreferences()
    local source = type(value) == "table" and value or {}
    local out = {}
    for _, key in ipairs({"automation","ignoreFriends","openingAnchor","preferDuplicates","unknownTheirZero"}) do
        out[key] = type(source[key]) == "boolean" and source[key] or defaults[key]
    end
    local preset = math.floor(tonumber(source.winPreset) or defaults.winPreset)
    out.winPreset = math.max(1, math.min(4, preset))
    out.reserves = {}
    if type(source.reserves) == "table" then
        for key, amount in pairs(source.reserves) do
            local n = tonumber(amount)
            if type(key) == "string" then
                local prefix, itemId = key:match("^([^|]+)|(.+)$")
                if (prefix == "Weapons" or prefix == "Pets") and type(itemId) == "string" and itemId ~= ""
                    and n and n == n and n >= 0 and n <= 9999 then
                    n = math.floor(n)
                    if n > 0 then out.reserves[prefix .. "|" .. itemId] = n end
                end
            end
        end
    end
    if type(source.panelPosition) == "table" then
        local xs,ys = tonumber(source.panelPosition.xs), tonumber(source.panelPosition.ys)
        local xo,yo = tonumber(source.panelPosition.xo), tonumber(source.panelPosition.yo)
        if xs and ys and xo and yo and xs == xs and ys == ys and xo == xo and yo == yo then
            out.panelPosition = {
                xs = math.max(0, math.min(1, xs)), ys = math.max(0, math.min(1, ys)),
                xo = math.max(-2000, math.min(2000, xo)), yo = math.max(-2000, math.min(2000, yo)),
            }
        end
    end
    return out
end
local loadedPreferences = rawget(_G, State.AutoTrader.PreferencesKey)
if type(loadedPreferences) ~= "table" then
    local decoded = HARDEN.readJsonFileBestEffort(State.AutoTrader.PreferencesFile)
    if type(decoded) == "table" then loadedPreferences = decoded.preferences or decoded end
end
State.AutoTrader.Preferences = normalizePreferences(loadedPreferences)
local AutoPrefs = State.AutoTrader.Preferences
do
    local bootstrap = State.AutoTrader.TeleportBootstrap
    if type(bootstrap) == "table" and type(bootstrap.preferences) == "table" then
        local merged = {}
        for k,v in pairs(AutoPrefs) do merged[k] = v end
        for _, key in ipairs({"automation", "ignoreFriends", "openingAnchor", "preferDuplicates", "unknownTheirZero", "winPreset", "reserves", "panelPosition"}) do
            if bootstrap.preferences[key] ~= nil then merged[key] = bootstrap.preferences[key] end
        end
        State.AutoTrader.Preferences = normalizePreferences(merged)
        AutoPrefs = State.AutoTrader.Preferences
    end
    rawset(ExecutorEnvironment, State.AutoTrader.TeleportBootstrapKey, nil)
    rawset(_G, State.AutoTrader.TeleportBootstrapKey, nil)
end
rawset(_G, State.AutoTrader.PreferencesKey, State.AutoTrader.Preferences)
local STRATEGY_SCHEMA_VERSION = 2
local function currentStrategyConfigSnapshot()
    return {
        schemaVersion = STRATEGY_SCHEMA_VERSION,
        minWinPercent = CONFIG.AutoTraderMinWinPercent,
        hopRetention = CONFIG.AutoTraderHopOpportunityRetentionFactor,
        targetFloor = CONFIG.AutoTraderTargetOpportunityFloor,
        negotiationMargins = {
            CONFIG.AutoTraderNegotiationStage1Margin,
            CONFIG.AutoTraderNegotiationStage2Margin,
            CONFIG.AutoTraderNegotiationStage3Margin,
        },
        maxDemandDrop = CONFIG.AutoTraderMaxDemandDrop,
        maxFlipDrop = CONFIG.AutoTraderMaxFlipDrop,
        maxStabilityDrop = CONFIG.AutoTraderMaxStabilityDrop,
        controllerVersion = CONTROLLER_VERSION,
    }
end
local function currentStrategyConfigSignature()
    local c = currentStrategyConfigSnapshot()
    return table.concat({
        tostring(c.schemaVersion), tostring(c.minWinPercent), tostring(c.hopRetention), tostring(c.targetFloor),
        tostring(c.negotiationMargins[1]), tostring(c.negotiationMargins[2]), tostring(c.negotiationMargins[3]),
        tostring(c.maxDemandDrop), tostring(c.maxFlipDrop), tostring(c.maxStabilityDrop),
    }, "|")
end
local function normalizeTargetStatsDocument(loaded)
    if type(loaded) == "table" and tonumber(loaded.version) == 2 and type(loaded.players) == "table" then
        loaded.strategy = type(loaded.strategy) == "table" and loaded.strategy or {}
        loaded.strategySchemaVersion = tonumber(loaded.strategySchemaVersion) or STRATEGY_SCHEMA_VERSION
        loaded.configSignature = tostring(loaded.configSignature or "")
        if loaded.strategySchemaVersion ~= STRATEGY_SCHEMA_VERSION or loaded.configSignature ~= currentStrategyConfigSignature() then
            loaded.legacyStrategy = loaded.strategy
            loaded.strategy = {}
            loaded.strategySchemaVersion = STRATEGY_SCHEMA_VERSION
            loaded.configSignature = currentStrategyConfigSignature()
            loaded.configSnapshot = currentStrategyConfigSnapshot()
        end
        return loaded
    end
    local migrated = {
        version = 2,
        players = {},
        strategy = {}, -- v31 deliberately does not mix old strategy-v1 semantics into the new controller economics.
        strategySchemaVersion = STRATEGY_SCHEMA_VERSION,
        configSignature = currentStrategyConfigSignature(),
        configSnapshot = currentStrategyConfigSnapshot(),
        migratedAtUnix = os.time(),
    }
    if type(loaded) == "table" then
        for key, value in pairs(loaded) do
            if tostring(key) ~= "__strategy_v1" and type(value) == "table" then
                migrated.players[tostring(key)] = value
            elseif tostring(key) == "__strategy_v1" and type(value) == "table" then
                migrated.legacyStrategyV1 = value
            end
        end
    end
    return migrated
end
State.AutoTrader.LoadTargetStats = function()
    local loaded = rawget(_G, State.AutoTrader.TargetStatsKey)
    if type(loaded) ~= "table" then
        for _, fileName in ipairs({State.AutoTrader.TargetStatsFile, State.AutoTrader.TargetStatsLegacyFile}) do
            local decoded = HARDEN.readJsonFileBestEffort(fileName)
            if type(decoded) == "table" then loaded = decoded; break end
        end
    end
    loaded = normalizeTargetStatsDocument(loaded)
    State.AutoTrader.TargetStats = loaded
    rawset(_G, State.AutoTrader.TargetStatsKey, loaded)
end
State.AutoTrader.PruneTargetStats = function()
    local document = State.AutoTrader.TargetStats
    local stats = type(document) == "table" and document.players or nil
    if type(stats) ~= "table" then return end
    local now = os.time()
    local ttl = math.max(1, tonumber(CONFIG.AutoTraderTargetStatsTtlDays) or 30) * 86400
    local maxPlayers = math.max(100, math.floor(tonumber(CONFIG.AutoTraderTargetStatsMaxPlayers) or 1500))
    local rows = {}
    for key, value in pairs(stats) do
        if type(value) == "table" then
            local last = tonumber(value.lastEventUnix) or 0
            if last > 0 and now - last > ttl then stats[key] = nil
            else table.insert(rows, {key = key, last = last}) end
        else
            stats[key] = nil
        end
    end
    if #rows > maxPlayers then
        table.sort(rows, function(a,b) if a.last ~= b.last then return a.last < b.last end return tostring(a.key) < tostring(b.key) end)
        for index = 1, #rows - maxPlayers do stats[rows[index].key] = nil end
    end
end
State.AutoTrader.SaveTargetStats = function()
    rawset(_G, State.AutoTrader.TargetStatsKey, State.AutoTrader.TargetStats)
    State.AutoTrader.TargetStatsSaveGeneration += 1
    local generation = State.AutoTrader.TargetStatsSaveGeneration
    task.delay(0.6, function()
        if Destroyed or generation ~= State.AutoTrader.TargetStatsSaveGeneration then return end
        State.AutoTrader.FlushTargetStats()
    end)
end
State.AutoTrader.FlushTargetStats = function()
    State.AutoTrader.PruneTargetStats()
    local document = State.AutoTrader.TargetStats
    document.version = 2
    document.strategySchemaVersion = STRATEGY_SCHEMA_VERSION
    document.configSignature = currentStrategyConfigSignature()
    document.configSnapshot = currentStrategyConfigSnapshot()
    rawset(_G, State.AutoTrader.TargetStatsKey, document)
    local okEncode, encoded = pcall(function() return HttpService:JSONEncode(document) end)
    if not okEncode or type(encoded) ~= "string" then notePersistence(State.AutoTrader.TargetStatsFile, false, "encode", encoded); return false end
    return HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.TargetStatsFile, encoded)
end
State.AutoTrader.LoadTargetStats()
State.AutoTrader.WinPresets = {1, 2, 3, 5}
State.AutoTrader.SavePreferences = function()
    State.AutoTrader.Preferences = normalizePreferences(State.AutoTrader.Preferences)
    AutoPrefs = State.AutoTrader.Preferences
    rawset(_G, State.AutoTrader.PreferencesKey, State.AutoTrader.Preferences)
    local ok, encoded = pcall(function()
        return HttpService:JSONEncode({version = 1, controllerVersion = CONTROLLER_VERSION, preferences = State.AutoTrader.Preferences})
    end)
    if not ok or type(encoded) ~= "string" then
        notePersistence(State.AutoTrader.PreferencesFile, false, "encode", encoded)
        return false
    end
    return HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.PreferencesFile, encoded)
end
local function compactDebugValue(value, depth, seen)
    depth = depth or 0
    seen = seen or {}
    local kind = typeof(value)
    if kind == "string" then return #value > 700 and (string.sub(value, 1, 700) .. "…") or value end
    if kind == "number" or kind == "boolean" or kind == "nil" then return value end
    if kind ~= "table" then return tostring(value) end
    if seen[value] then return "<cycle>" end
    if depth >= 4 then return "<depth-limit>" end
    seen[value] = true
    local out, count = {}, 0
    for k,v in pairs(value) do
        count += 1
        if count > 30 then out.__truncated = true; break end
        out[tostring(k)] = compactDebugValue(v, depth + 1, seen)
    end
    seen[value] = nil
    return out
end
HARDEN.supportJsonValue = function(value, depth, seen)
    depth = depth or 0
    seen = seen or {}
    local kind = typeof(value)
    if kind == "nil" or kind == "boolean" then return value end
    if kind == "number" then
        if value ~= value or value == math.huge or value == -math.huge then return tostring(value) end
        return value
    end
    if kind == "string" then return #value > 5000 and (string.sub(value, 1, 5000) .. "…") or value end
    if kind == "Instance" then
        local name, className = "?", "Instance"
        pcall(function() name = value.Name end)
        pcall(function() className = value.ClassName end)
        return {__type = "Instance", class = tostring(className), name = tostring(name)}
    end
    if kind ~= "table" then return tostring(value) end
    if seen[value] then return "<cycle>" end
    if depth >= 8 then return "<depth-limit>" end
    seen[value] = true
    local out, count = {}, 0
    for k,v in pairs(value) do
        count += 1
        if count > 200 then out.__truncated = true; break end
        out[tostring(k)] = HARDEN.supportJsonValue(v, depth + 1, seen)
    end
    seen[value] = nil
    return out
end
State.AutoTrader.DebugLogBuffer = {}
State.AutoTrader.DiskLogFlushInFlight = false
State.AutoTrader.FlushDiskDebugLog = function()
    local waitDeadline = os.clock() + CONFIG.AutoTraderExecutorFileTimeoutSeconds
    while State.AutoTrader.DiskLogFlushInFlight and os.clock() < waitDeadline do task.wait(0.03) end
    if State.AutoTrader.DiskLogFlushInFlight then return false, "debug log flush already in progress" end
    if #State.AutoTrader.DebugLogBuffer == 0 then State.AutoTrader.DiskLogPending = 0; return true end
    State.AutoTrader.DiskLogFlushInFlight = true
    local snapshotCount = #State.AutoTrader.DebugLogBuffer
    local lines = {}
    for index = 1, snapshotCount do
        local event = State.AutoTrader.DebugLogBuffer[index]
        local ok, encoded = pcall(function() return HttpService:JSONEncode(event) end)
        if ok and type(encoded) == "string" then table.insert(lines, encoded) end
    end
    if #lines == 0 then
        State.AutoTrader.DiskLogFlushInFlight = false
        return false, "no debug events could be encoded"
    end
    local existing = HARDEN.readTextFileBestEffort(State.AutoTrader.DebugLogFile)
    if type(existing) ~= "string" then
        local ok, header = pcall(function() return HttpService:JSONEncode({
            type = "header", controllerVersion = CONTROLLER_VERSION, jobId = game.JobId,
            startedAtUnix = os.time(), strategySchema = STRATEGY_SCHEMA_VERSION,
        }) end)
        existing = ok and (header .. "\n") or ""
    end
    local nextBody = existing .. table.concat(lines, "\n") .. "\n"
    local maxBytes = math.max(65536, tonumber(CONFIG.AutoTraderDiskLogMaxBytes) or 524288)
    if #nextBody > maxBytes then
        nextBody = string.sub(nextBody, #nextBody - maxBytes + 1)
        local firstNewline = string.find(nextBody, "\n", 1, true)
        if firstNewline then nextBody = string.sub(nextBody, firstNewline + 1) end
        local ok, header = pcall(function() return HttpService:JSONEncode({type="header", controllerVersion=CONTROLLER_VERSION, jobId=game.JobId, rotatedAtUnix=os.time()}) end)
        if ok then nextBody = header .. "\n" .. nextBody end
    end
    local okWrite, writeErr = HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.DebugLogFile, nextBody)
    if okWrite then
        for _ = 1, math.min(snapshotCount, #State.AutoTrader.DebugLogBuffer) do table.remove(State.AutoTrader.DebugLogBuffer, 1) end
    end
    State.AutoTrader.DiskLogPending = #State.AutoTrader.DebugLogBuffer
    State.AutoTrader.DiskLogFlushInFlight = false
    return okWrite, writeErr
end
State.AutoTrader.Log = function(kind, data)
    State.AutoTrader.DebugSequence += 1
    local event = {
        seq = State.AutoTrader.DebugSequence,
        t = os.clock(),
        unix = os.time(),
        kind = tostring(kind or "event"),
        data = compactDebugValue(data),
    }
    local log = State.AutoTrader.DebugLog
    table.insert(log, event)
    while #log > 120 do table.remove(log, 1) end
    table.insert(State.AutoTrader.DebugLogBuffer, event)
    State.AutoTrader.DiskLogPending = #State.AutoTrader.DebugLogBuffer
    if #State.AutoTrader.DebugLogBuffer >= CONFIG.AutoTraderDiskLogFlushEveryEvents and not State.AutoTrader.DiskLogFlushInFlight then
        task.defer(function()
            if not Destroyed then
                local ok, err = State.AutoTrader.FlushDiskDebugLog()
                if not ok then warn("[SV Public] debug disk log flush failed:", err) end
            end
        end)
    end
end
State.AutoTrader.GetMinimumWin = function()
    local index = clamp(
        math.floor(tonumber(State.AutoTrader.Preferences.winPreset) or 2),
        1,
        #State.AutoTrader.WinPresets
    )
    State.AutoTrader.Preferences.winPreset = index
    return State.AutoTrader.WinPresets[index]
end
State.AutoTrader.RunSelfTests = function()
    local tests = {}
    local function record(name, ok, detail)
        table.insert(tests, {name=name, ok=ok == true, detail=ok and nil or tostring(detail or "failed")})
    end
    local function run(name, callback)
        local ok, passed, detail = pcall(callback)
        if not ok then record(name, false, "self-test error: " .. tostring(passed))
        else record(name, passed == true, detail) end
    end

    run("sha256-known-vector", function()
        return sha256Hex("abc") == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", "SHA-256 implementation mismatch"
    end)
    run("sha256-large-message", function()
        return sha256Hex(string.rep("v32-sha-block-test|", 8192)) == "65ac5f87ceb19a7558a8de73a27d71829e50c8b1e503d2175ec1a206998660b2", "large-message SHA-256 mismatch"
    end)
    run("preference-normalization", function()
        local prefs = normalizePreferences({automation="false",ignoreFriends=1,winPreset=999,reserves={['Weapons|Knife']=2.9,['Bad|Thing']=7,['Pets|']=4,['Pets|Dog']=-1},panelPosition={xs=9,ys=-3,xo=99999,yo=-99999}})
        local ok = type(prefs.automation)=="boolean" and type(prefs.ignoreFriends)=="boolean"
            and prefs.winPreset==4
            and prefs.reserves['Weapons|Knife']==2 and prefs.reserves['Bad|Thing']==nil and prefs.reserves['Pets|']==nil and prefs.reserves['Pets|Dog']==nil
            and prefs.panelPosition and prefs.panelPosition.xs==1 and prefs.panelPosition.ys==0 and prefs.panelPosition.xo==2000 and prefs.panelPosition.yo==-2000
        return ok, "preference normalization mismatch"
    end)
    run("player-presence-generation", function()
        local userId = -2147483001
        local first = {UserId=userId, Name="__SV_PRESENCE_SELFTEST_A"}
        local second = {UserId=userId, Name="__SV_PRESENCE_SELFTEST_B"}
        local a = State.AutoTrader.EnsureServerPlayer(first)
        if a then a.outcome="declined"; a.outcomeAt=os.clock() end
        State.AutoTrader.EndServerPlayerPresence(first)
        local b = State.AutoTrader.EnsureServerPlayer(second)
        local passed = b and b.presenceGeneration==2 and b.outcome==nil and b.present==true
        State.AutoTrader.ServerPlayers[userId]=nil; State.AutoTrader.Cooldowns[userId]=nil; State.AutoTrader.RequestHistory[userId]=nil; State.AutoTrader.MovementSamples[userId]=nil
        return passed, "same-UserId rejoin retained stale per-presence state"
    end)
    run("planner-market-pareto", function()
        local generation = State.AutoTrader.PlanGeneration
        local incoming = {knownFloor=20,totalValue=20,unknownCount=0,demand=5,demandCoverage=1,flip=nil,flipCoverage=0,stability=nil,stabilityCoverage=0,stabilityShares={}}
        local high = {key="selftest-high",itemId="selftest-high",itemType="Weapons",name="high-market",unitValue=10,maxQuantity=1,quantity=1,demand=10,reserve=0,record={name="high-market",data={value=10,demand=10}}}
        local safe = {key="selftest-safe",itemId="selftest-safe",itemType="Weapons",name="safe-market",unitValue=10,maxQuantity=1,quantity=1,demand=4,reserve=0,record={name="safe-market",data={value=10,demand=4}}}
        local plan = State.AutoTrader.FindPlan(incoming, {high,safe}, generation, {stage=1,margin=0.18,targetProfit=3.6,final=false})
        return plan and plan.items and plan.items[1] and plan.items[1].name=="safe-market", "equal-value market-safe planner state was lost during dominance pruning"
    end)
    if SupremeDatabase and #Catalog > 0 then
        run("supreme-index-roundtrip", function()
            local indexChecked, indexFailures = 0, 0
            for i=1,math.min(40,#Catalog) do
                local record=Catalog[i]
                local resolved=getSupremeRecord(record.category, record.name, record.key, record.data and record.data.year or nil)
                indexChecked += 1
                if resolved ~= record then indexFailures += 1 end
            end
            return indexFailures==0, tostring(indexFailures).."/"..tostring(indexChecked).." sampled records did not round-trip"
        end)
    end
    run("linked-mapping-shape", function()
        local mappingChecked, mappingFailures = 0, 0
        for _, link in pairs(State.Mapping.ItemLinks or {}) do
            if mappingChecked >= 50 then break end
            mappingChecked += 1
            if type(link)~="table" or type(link.name)~="string" or type(link.category)~="string" then mappingFailures += 1 end
        end
        for _, link in pairs(LinkedImages or {}) do
            if mappingChecked >= 100 then break end
            mappingChecked += 1
            if type(link)~="table" or type(link.name)~="string" or type(link.category)~="string" then mappingFailures += 1 end
        end
        return mappingChecked == 0 or mappingFailures==0, tostring(mappingFailures).." malformed sampled mappings"
    end)

    local passed = 0
    for _, row in ipairs(tests) do if row.ok then passed += 1 end end
    local result = {passed=passed, total=#tests, ok=passed==#tests, tests=tests, atUnix=os.time(), controllerVersion=CONTROLLER_VERSION}
    State.AutoTrader.SelfTest=result
    State.AutoTrader.Log("self_test", {passed=passed,total=#tests,ok=result.ok,tests=tests})
    return result
end
State.AutoTrader.GetPlayerStats = function(player)
    if not player then
        return nil
    end
    local key = tostring(player.UserId)
    local playersStats = State.AutoTrader.TargetStats.players
    local stats = playersStats[key]
        or playersStats[player.UserId]
    if not stats then
        stats = {
            requests = 0,
            incomingRequests = 0,
            incomingAccepted = 0,
            responses = 0,
            declines = 0,
            tradeDeclines = 0,
            ignored = 0,
            trades = 0,
            successes = 0,
            auditFailures = 0,
            totalProfit = 0,
            totalResponseSeconds = 0,
            totalTradeSeconds = 0,
            lastRequestedAt = 0,
            lastDecayUnix = os.time(),
            lastEventUnix = os.time(),
        }
    end
    playersStats[player.UserId] = nil
    playersStats[key] = stats
    stats.auditFailures = tonumber(stats.auditFailures) or 0
    stats.tradeDeclines = tonumber(stats.tradeDeclines) or 0
    stats.lastDecayUnix = tonumber(stats.lastDecayUnix) or os.time()
    stats.lastEventUnix = tonumber(stats.lastEventUnix) or os.time()
    local nowUnix = os.time()
    local elapsedDays = math.max(0, (nowUnix - stats.lastDecayUnix) / 86400)
    if elapsedDays >= 0.25 then
        local factor = CONFIG.AutoTraderTargetStatsDecayPerDay ^ elapsedDays
        for _, field in ipairs({
            "requests",
            "incomingRequests",
            "incomingAccepted",
            "responses",
            "declines",
            "tradeDeclines",
            "ignored",
            "trades",
            "successes",
            "auditFailures",
            "totalProfit",
            "totalResponseSeconds",
            "totalTradeSeconds",
        }) do
            stats[field] = (tonumber(stats[field]) or 0) * factor
        end
        stats.lastDecayUnix = nowUnix
    end
    return stats
end
-- Generalized learning lives inside the existing target-stats persistence file so
-- it survives teleports/executor restarts without adding another fragile file.
State.AutoTrader.GetStrategyStats = function()
    local root = State.AutoTrader.TargetStats.strategy
    if type(root) ~= "table" then
        root = {version = STRATEGY_SCHEMA_VERSION, global = {}, bands = {}, marginStages = {}}
        State.AutoTrader.TargetStats.strategy = root
    end
    root.version = STRATEGY_SCHEMA_VERSION
    root.global = type(root.global) == "table" and root.global or {}
    root.bands = type(root.bands) == "table" and root.bands or {}
    root.marginStages = type(root.marginStages) == "table" and root.marginStages or {}
    return root
end
State.AutoTrader.GetValueBand = function(total)
    total = math.max(0, tonumber(total) or 0)
    if total < 100 then return "lt100" end
    if total < 500 then return "100_499" end
    if total < 2000 then return "500_1999" end
    return "2000_plus"
end
State.AutoTrader.NormalizeStrategyBucket = function(bucket)
    bucket = type(bucket) == "table" and bucket or {}
    for _, field in ipairs({
        "requests", "responses", "trades", "successes", "declines",
        "tradeDeclines", "ignored", "idle", "terminalOutcomes", "totalProfit",
        "totalResponseSeconds", "totalTradeSeconds", "terminalSeconds",
    }) do
        bucket[field] = math.max(0, tonumber(bucket[field]) or 0)
    end
    bucket.lastEventUnix = tonumber(bucket.lastEventUnix) or 0
    return bucket
end
State.AutoTrader.GetStrategyBucket = function(total, create)
    local root = State.AutoTrader.GetStrategyStats()
    local key = State.AutoTrader.GetValueBand(total)
    local bucket = root.bands[key]
    if type(bucket) ~= "table" and create ~= false then
        bucket = {}
        root.bands[key] = bucket
    end
    return bucket and State.AutoTrader.NormalizeStrategyBucket(bucket) or nil, key
end
State.AutoTrader.GetStrategyPriors = function(total)
    local root = State.AutoTrader.GetStrategyStats()
    local global = State.AutoTrader.NormalizeStrategyBucket(root.global)
    root.global = global
    local band = State.AutoTrader.GetStrategyBucket(total, false)
    band = band and State.AutoTrader.NormalizeStrategyBucket(band) or nil
    local function empirical(bucket, num, den, fallback)
        if not bucket then return fallback end
        local denominator = math.max(0, tonumber(bucket[den]) or 0)
        local numerator = math.max(0, tonumber(bucket[num]) or 0)
        local priorStrength = 6
        return clamp((numerator + fallback * priorStrength) / (denominator + priorStrength), 0.01, 0.99)
    end
    local globalResponse = empirical(global, "responses", "requests", 0.62)
    local globalTrade = empirical(global, "trades", "responses", 0.52)
    local globalSuccess = empirical(global, "successes", "trades", 0.27)
    local bandWeight = band and clamp((band.requests or 0) / 14, 0, 0.72) or 0
    local response = globalResponse
    local trade = globalTrade
    local success = globalSuccess
    if band then
        response = response * (1 - bandWeight) + empirical(band, "responses", "requests", response) * bandWeight
        trade = trade * (1 - bandWeight) + empirical(band, "trades", "responses", trade) * bandWeight
        success = success * (1 - bandWeight) + empirical(band, "successes", "trades", success) * bandWeight
    end
    local function blendedAverage(fieldTotal, fieldCount, fallback)
        local gCount = tonumber(global[fieldCount]) or 0
        local g = gCount > 0 and (tonumber(global[fieldTotal]) or 0) / gCount or fallback
        if band then
            local bCount = tonumber(band[fieldCount]) or 0
            if bCount > 0 then
                local b = (tonumber(band[fieldTotal]) or 0) / bCount
                return g * (1 - bandWeight) + b * bandWeight
            end
        end
        return g
    end
    local avgResponse = blendedAverage("totalResponseSeconds", "responses", 5)
    local avgTrade = blendedAverage("totalTradeSeconds", "successes", 16)
    local avgProfit = nil
    local gSuccess = tonumber(global.successes) or 0
    if gSuccess > 0 then avgProfit = (tonumber(global.totalProfit) or 0) / gSuccess end
    if band and (tonumber(band.successes) or 0) > 0 then
        local b = (tonumber(band.totalProfit) or 0) / math.max(1, tonumber(band.successes) or 0)
        avgProfit = avgProfit and (avgProfit * (1 - bandWeight) + b * bandWeight) or b
    end
    return {
        responseRate = clamp(response, 0.08, 0.96),
        tradeRate = clamp(trade, 0.08, 0.92),
        successRate = clamp(success, 0.05, 0.80),
        avgResponse = clamp(avgResponse, 1.5, 12),
        avgTrade = clamp(avgTrade, 4, 40),
        avgProfit = avgProfit and math.max(0, avgProfit) or nil,
        band = State.AutoTrader.GetValueBand(total),
        bandSamples = band and (tonumber(band.requests) or 0) or 0,
        globalSamples = tonumber(global.requests) or 0,
    }
end
State.AutoTrader.GetHopOpportunityRate = function()
    local root = State.AutoTrader.GetStrategyStats()
    local global = State.AutoTrader.NormalizeStrategyBucket(root.global)
    root.global = global
    local outcomes = tonumber(global.terminalOutcomes) or 0
    local seconds = tonumber(global.terminalSeconds) or 0
    local learnedInteraction = nil
    if outcomes >= 5 and seconds >= 30 then
        learnedInteraction = (tonumber(global.totalProfit) or 0) / math.max(1, seconds)
    end
    local weight = learnedInteraction and clamp(outcomes / 24, 0, 0.82) or 0
    local blended = CONFIG.AutoTraderHopOpportunityDefault * (1 - weight)
        + math.min(CONFIG.AutoTraderHopOpportunityMax, math.max(0, learnedInteraction or 0)) * weight

    -- v30: the older benchmark measured only terminal interaction time and could
    -- therefore overstate the value of leaving a server. Cap it by observed
    -- wall-clock session throughput once enough runtime exists, which naturally
    -- includes discovery/request/trade/audit overhead instead of assuming hops are free.
    local session = State.AutoTrader.UiSession
    if type(session) == "table" then
        local elapsed = os.clock() - (tonumber(session.startedAt) or os.clock())
        if elapsed >= 30 then
            local wallClockRate = math.max(0, tonumber(session.profit) or 0) / math.max(1, elapsed)
            local successes = tonumber(session.successes) or 0
            if successes > 0 or elapsed >= 90 then
                blended = math.min(blended, math.max(CONFIG.AutoTraderTargetOpportunityFloor, wallClockRate * 1.15))
            end
        end
    end
    -- If the server-list path is presently rate-limited, hopping is objectively
    -- less attractive than the interaction-only model suggests. Cached hops can
    -- still proceed immediately; this only prevents economic skipping from being
    -- driven by an optimistic benchmark while refreshes are constrained.
    if (tonumber(State.AutoTrader.ServerRateLimitBackoffSeconds) or 0) > 0 then
        blended *= 0.55
    end
    return math.max(CONFIG.AutoTraderTargetOpportunityFloor, math.min(CONFIG.AutoTraderHopOpportunityMax, blended))
end
State.AutoTrader.RecordStrategyEvent = function(player, kind, data)
    data = data or {}
    local session = State.AutoTrader.UiSession
    if type(session) == "table" then
        if kind == "request" then session.requests = (tonumber(session.requests) or 0) + 1
        elseif kind == "response" then session.responses = (tonumber(session.responses) or 0) + 1
        elseif kind == "trade" then session.trades = (tonumber(session.trades) or 0) + 1
        elseif kind == "success" then
            session.successes = (tonumber(session.successes) or 0) + 1
            session.profit = (tonumber(session.profit) or 0) + math.max(0, tonumber(data.profit) or 0)
        elseif kind == "decline" then session.declines = (tonumber(session.declines) or 0) + 1
        elseif kind == "tradeDecline" then session.tradeDeclines = (tonumber(session.tradeDeclines) or 0) + 1
        elseif kind == "ignored" then session.ignored = (tonumber(session.ignored) or 0) + 1
        elseif kind == "idle" then session.idle = (tonumber(session.idle) or 0) + 1 end
    end
    local total = tonumber(data.verifiedTotal)
    if total == nil and player then
        local value, verified = State.AutoTrader.GetVerifiedPlayerValue(player)
        if verified then total = tonumber(value) end
    end
    total = math.max(0, total or 0)
    local root = State.AutoTrader.GetStrategyStats()
    root.global = State.AutoTrader.NormalizeStrategyBucket(root.global)
    local band = State.AutoTrader.GetStrategyBucket(total, true)
    local buckets = {root.global, band}
    for _, bucket in ipairs(buckets) do
        if kind == "request" then bucket.requests += 1
        elseif kind == "response" then
            bucket.responses += 1
            local seconds = tonumber(data.seconds)
            if seconds and seconds >= 0 then bucket.totalResponseSeconds += seconds end
        elseif kind == "trade" then bucket.trades += 1
        elseif kind == "success" then
            bucket.successes += 1
            bucket.totalProfit += math.max(0, tonumber(data.profit) or 0)
            local seconds = tonumber(data.seconds)
            if seconds and seconds >= 0 then bucket.totalTradeSeconds += seconds end
            bucket.terminalOutcomes += 1
            bucket.terminalSeconds += math.max(1, tonumber(data.totalSeconds) or seconds or 12)
        elseif kind == "decline" then
            bucket.declines += 1
            bucket.terminalOutcomes += 1
            bucket.terminalSeconds += math.max(1, tonumber(data.seconds) or 5)
        elseif kind == "tradeDecline" then
            bucket.tradeDeclines += 1
            bucket.terminalOutcomes += 1
            bucket.terminalSeconds += math.max(1, tonumber(data.totalSeconds) or tonumber(data.seconds) or 10)
        elseif kind == "ignored" then
            bucket.ignored += 1
            bucket.terminalOutcomes += 1
            bucket.terminalSeconds += math.max(1, tonumber(data.seconds) or CONFIG.AutoTraderPendingRequestTimeoutSeconds)
        elseif kind == "idle" then
            bucket.idle += 1
            bucket.terminalOutcomes += 1
            bucket.terminalSeconds += math.max(1, tonumber(data.totalSeconds) or tonumber(data.seconds) or CONFIG.AutoTraderTradeIdleTimeoutSeconds)
        end
        bucket.lastEventUnix = os.time()
    end
    local stage = tonumber(data.negotiationStage)
    if stage and stage >= 1 and stage <= 4 and (kind == "success" or kind == "tradeDecline" or kind == "idle") then
        local key = tostring(math.floor(stage))
        local m = type(root.marginStages[key]) == "table" and root.marginStages[key] or {}
        m.shownOutcomes = math.max(0, tonumber(m.shownOutcomes) or 0) + 1
        m.successes = math.max(0, tonumber(m.successes) or 0) + (kind == "success" and 1 or 0)
        m.declines = math.max(0, tonumber(m.declines) or 0) + (kind ~= "success" and 1 or 0)
        m.totalProfit = math.max(0, tonumber(m.totalProfit) or 0) + (kind == "success" and math.max(0, tonumber(data.profit) or 0) or 0)
        m.totalSeconds = math.max(0, tonumber(m.totalSeconds) or 0) + math.max(1, tonumber(data.seconds) or 1)
        m.lastMargin = tonumber(data.negotiationMargin)
        m.lastEventUnix = os.time()
        root.marginStages[key] = m
    end
end

State.AutoTrader.RecordTargetEvent = function(player, kind, data)
    if not player then
        return
    end
    local stats = State.AutoTrader.GetPlayerStats(player)
    data = data or {}
    if kind == "request" then
        stats.requests += 1
        stats.lastRequestedAt = os.time()
    elseif kind == "incomingRequest" then
        stats.incomingRequests = (tonumber(stats.incomingRequests) or 0) + 1
    elseif kind == "incomingAccepted" then
        stats.incomingAccepted = (tonumber(stats.incomingAccepted) or 0) + 1
    elseif kind == "response" then
        stats.responses += 1
        local seconds = tonumber(data.seconds)
        if seconds and seconds >= 0 then
            stats.totalResponseSeconds += seconds
        end
    elseif kind == "decline" then
        stats.declines += 1
    elseif kind == "tradeDecline" then
        stats.tradeDeclines = (tonumber(stats.tradeDeclines) or 0) + 1
    elseif kind == "ignored" then
        stats.ignored += 1
    elseif kind == "trade" then
        stats.trades += 1
    elseif kind == "success" then
        stats.successes += 1
        stats.totalProfit += tonumber(data.profit) or 0
        local seconds = tonumber(data.seconds)
        if seconds and seconds >= 0 then
            stats.totalTradeSeconds += seconds
        end
    elseif kind == "auditFailure" then
        stats.auditFailures += 1
    end
    stats.lastEventUnix = os.time()
    State.AutoTrader.RecordStrategyEvent(player, kind, data)
    -- v27 bot identity is intentionally isolated from all trade/inventory behavior.
    State.AutoTrader.SaveTargetStats()
end
State.AutoTrader.GetTargetProfile = function(player)
    if not player then
        return nil
    end
    local remoteState = State.Profile.remoteTotals
    local raw = remoteState and remoteState.rawByUserId[player.UserId] or nil
    local stamp = remoteState and remoteState.lastSuccessByUserId[player.UserId] or nil
    if type(raw) ~= "table" or not stamp then
        return nil
    end
    local cached = State.AutoTrader.TargetProfileCache[player.UserId]
    if cached
        and cached.stamp == stamp
        and cached.mappingRevision == State.Mapping.Revision
        and cached.databaseRevision == HARDEN.supremeDataRevision and cached.databaseHash == HARDEN.supremeDataHash then
        return cached
    end
    if type(State.Profile.CalculateRemoteInventory) ~= "function" then
        return nil
    end
    local calculated = State.Profile.CalculateRemoteInventory(raw)
    if not calculated then
        return nil
    end
    local entries = {}
    local numericUnits = 0
    local nonNumericUnits = 0
    local unresolvedUnits = 0
    local distinctNumeric = 0
    local usefulTypes = 0
    local total = tonumber(calculated.total) or 0
    local usefulCeiling = math.max(100, total * 0.20)
    local function ingest(section)
        for _, hint in ipairs(section and section.cardHints or {}) do
            local quantity = math.max(1, tonumber(hint.quantity) or 1)
            local record = hint.record
            local unitValue = record and record.data and numericValue(record.data) or nil
            if record and unitValue and unitValue > 0 then
                numericUnits += quantity
                distinctNumeric += 1
                if unitValue <= usefulCeiling then
                    usefulTypes += 1
                end
                table.insert(entries, {
                    itemId = hint.itemId,
                    itemType = hint.itemType,
                    quantity = quantity,
                    record = record,
                })
            else
                nonNumericUnits += quantity
            end
        end
        for _, miss in ipairs(section and section.unresolvedAll or {}) do
            unresolvedUnits += math.max(1, tonumber(miss.quantity) or 1)
        end
    end
    ingest(calculated.weapons)
    ingest(calculated.pets)
    local summary = summarizeResolvedOffer(entries)
    local observedUnits = numericUnits + nonNumericUnits + unresolvedUnits
    local numericCoverage = observedUnits > 0 and numericUnits / observedUnits or 0
    local demandNorm = summary.demand and clamp(summary.demand / 10, 0, 1) or 0.45
    local flipNorm = summary.flip and clamp((summary.flip + 1) / 3, 0, 1) or 0.45
    local stabilityNorm = summary.stability and clamp((summary.stability + 4) / 6.5, 0, 1) or 0.45
    local denominationScore = clamp(usefulTypes / 8, 0, 1)
    local untradableShare = summary.stabilityShares["Untradable"] or 0
    local recedingShare = summary.stabilityShares["Receding"] or 0
    local underpaidShare = summary.stabilityShares["Underpaid For"] or 0
    local riskPenalty = untradableShare * 0.45
        + recedingShare * 0.22
        + underpaidShare * 0.14
    local multiplier = clamp(
        0.48
            + numericCoverage * 0.42
            + demandNorm * 0.14
            + flipNorm * 0.10
            + stabilityNorm * 0.08
            + denominationScore * 0.12
            - riskPenalty,
        0.35,
        1.35
    )
    local profile = {
        stamp = stamp,
        mappingRevision = State.Mapping.Revision,
        databaseRevision = HARDEN.supremeDataRevision,
        databaseHash = HARDEN.supremeDataHash,
        total = total,
        partial = calculated.partial == true,
        numericCoverage = numericCoverage,
        numericUnits = numericUnits,
        nonNumericUnits = nonNumericUnits,
        unresolvedUnits = unresolvedUnits,
        distinctNumeric = distinctNumeric,
        usefulTypes = usefulTypes,
        demand = summary.demand,
        flip = summary.flip,
        stability = summary.stability,
        stabilityShares = summary.stabilityShares,
        multiplier = multiplier,
    }
    State.AutoTrader.TargetProfileCache[player.UserId] = profile
    return profile
end
State.AutoTrader.GetVerifiedPlayerValue = function(player)
    if not player then return nil, false, "player unavailable", nil end
    local info = State.Profile.totalsByName[player.Name]
    local verified = type(info) == "table"
        and info.source == "GetFullInventoryVerified"
        and not info.stale
    if not verified then return nil, false, "inventory unresolved", info end
    local total = tonumber(info.total)
    if total == nil then return nil, false, "inventory total missing", info end
    if total > 0 then return total, true, "verified positive", info end

    -- A successful GetFullInventory call is not automatically a verified zero.
    -- If the returned inventory contains items that the value resolver could not
    -- identify, the UI correctly shows '?'; keep that player UNKNOWN instead of
    -- converting an unresolved inventory into a fake zero-value bot signal.
    local unresolvedUnits = tonumber(info.unresolvedUnits)
    local nonNumericUnits = tonumber(info.nonNumericUnits)
    if unresolvedUnits == nil or nonNumericUnits == nil then
        local profile = State.AutoTrader.GetTargetProfile(player)
        unresolvedUnits = profile and tonumber(profile.unresolvedUnits) or unresolvedUnits
        nonNumericUnits = profile and tonumber(profile.nonNumericUnits) or nonNumericUnits
    end
    unresolvedUnits = math.max(0, unresolvedUnits or 0)
    nonNumericUnits = math.max(0, nonNumericUnits or 0)
    if unresolvedUnits > 0 or nonNumericUnits > 0 then
        return nil, false, "inventory has unresolved/non-numeric units", info
    end
    return 0, true, "verified zero", info
end
State.AutoTrader.GetTargetScore = function(player, verifiedTotal)
    local total = tonumber(verifiedTotal) or 0
    if total <= 0 then
        return -math.huge
    end
    local stats = State.AutoTrader.GetPlayerStats(player)
    local requests = math.max(0, tonumber(stats.requests) or 0)
    local responses = math.max(0, tonumber(stats.responses) or 0)
    local trades = math.max(0, tonumber(stats.trades) or 0)
    local successes = math.max(0, tonumber(stats.successes) or 0)

    -- Per-user observations are blended with generalized value-band learning.
    -- That lets every stranger teach the bot something useful about future strangers.
    local priors = State.AutoTrader.GetStrategyPriors(total)
    local responseRate = clamp((responses + priors.responseRate * 3.2) / (requests + 3.2), 0.08, 0.96)
    local tradeRate = clamp((trades + priors.tradeRate * 2.8) / (responses + 2.8), 0.08, 0.92)
    local successRate = clamp((successes + priors.successRate * 3.2) / (trades + 3.2), 0.05, 0.80)

    local avgResponse = responses > 0
        and ((tonumber(stats.totalResponseSeconds) or 0) / responses)
        or priors.avgResponse
    local avgTrade = successes > 0
        and ((tonumber(stats.totalTradeSeconds) or 0) / successes)
        or priors.avgTrade
    local expectedSeconds = math.max(4, avgResponse + avgTrade)

    local profile = State.AutoTrader.GetTargetProfile(player)
    local compositionMultiplier = profile and profile.multiplier or 0.70
    local usefulTypes = profile and math.max(0, tonumber(profile.usefulTypes) or 0) or 0
    local distinctNumeric = profile and math.max(0, tonumber(profile.distinctNumeric) or 0) or 0
    local denominationMultiplier = 0.82
        + clamp(usefulTypes / 8, 0, 1) * 0.24
        + clamp(distinctNumeric / 12, 0, 1) * 0.10

    -- Unlike v14's sqrt(total) estimate capped at 20, this keeps meaningful
    -- separation between medium and large inventories while still preventing a
    -- single huge inventory from dominating every decision.
    local priorProfit = math.max(1, math.min(150, math.sqrt(total) * 2.0))
    local generalizedWeight = priors.avgProfit and clamp(
        ((tonumber(priors.bandSamples) or 0) + (tonumber(priors.globalSamples) or 0) * 0.15) / 18,
        0,
        0.65
    ) or 0
    local generalizedProfit = priorProfit * (1 - generalizedWeight)
        + math.max(1, tonumber(priors.avgProfit) or priorProfit) * generalizedWeight
    local learnedProfit = generalizedProfit
    if successes > 0 then
        local userProfit = math.max(1, (tonumber(stats.totalProfit) or 0) / successes)
        local userWeight = clamp(successes / 4, 0, 0.80)
        learnedProfit = generalizedProfit * (1 - userWeight) + userProfit * userWeight
    end
    local expectedProfit = learnedProfit * compositionMultiplier * denominationMultiplier

    local freshBonus = requests < 0.25 and 1.08 or 1
    local incomingBonus = 1 + math.min(0.20, (tonumber(stats.incomingRequests) or 0) * 0.035)
    local auditPenalty = 1 / (1 + (tonumber(stats.auditFailures) or 0) * 0.45)
    local declinePenalty = 1 / (1 + (tonumber(stats.declines) or 0) * 0.10)

    -- v27: avatar/bot knowledge intentionally has ZERO influence on current-server
    -- target economics. The bot database is only a pre-join server filter.
    return (
        expectedProfit
        * responseRate
        * tradeRate
        * successRate
        * freshBonus
        * incomingBonus
        * auditPenalty
        * declinePenalty
        / expectedSeconds
    ) + math.log(total + 1) * 0.00008
end

State.AutoTrader.GetMinimumTradableUnitValue = function()
    local tradable = State.AutoTrader.GetTradableInventory()
    if type(tradable) ~= "table" then return nil end
    local minimum = nil
    for _, entry in ipairs(tradable) do
        local value = tonumber(entry.unitValue)
        if value and value > 0 and (tonumber(entry.maxQuantity) or 0) > 0 then
            minimum = not minimum and value or math.min(minimum, value)
        end
    end
    return minimum
end

State.AutoTrader.TargetHasEconomicPath = function(verifiedTotal)
    local total = tonumber(verifiedTotal) or 0
    if total <= 0 then return false end
    local minimumLocal = State.AutoTrader.GetMinimumTradableUnitValue()
    if not minimumLocal then return true end -- don't skip merely because local inventory is refreshing
    local conservativeMinWin = math.max(State.AutoTrader.GetMinimumWin(), total * CONFIG.AutoTraderMinWinPercent)
    return total - conservativeMinWin >= minimumLocal - 0.000001
end
State.AutoTrader.GetReserve = function(itemType, itemId)
    local key = State.Mapping.MakeItemKey(itemType, itemId)
    return math.max(0, math.floor(tonumber(State.AutoTrader.Preferences.reserves[key]) or 0))
end
State.AutoTrader.ReserveTypeCount = function()
    local count = 0
    for _, amount in pairs(State.AutoTrader.Preferences.reserves) do
        if tonumber(amount) and tonumber(amount) > 0 then
            count += 1
        end
    end
    return count
end
State.AutoTrader.SetReserve = function(itemType, itemId, amount, owned)
    local key = State.Mapping.MakeItemKey(itemType, itemId)
    local maximum = math.max(0, math.floor(tonumber(owned) or 0))
    local wanted = clamp(math.floor(tonumber(amount) or 0), 0, maximum)
    if wanted > 0 then
        State.AutoTrader.Preferences.reserves[key] = wanted
    else
        State.AutoTrader.Preferences.reserves[key] = nil
    end
    State.AutoTrader.SavePreferences()
    State.AutoTrader.InventoryCache = nil
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.Log("reserve_changed", {
        key = key,
        reserve = wanted,
        owned = maximum,
    })
    if State.AutoTrader.RebuildReserveList then
        State.AutoTrader.RebuildReserveList()
    end
    if State.AutoTrader.Render then
        State.AutoTrader.Render()
    end
    scheduleTradeRefresh(0)
end
State.AutoTrader.GetPlayerFromSide = function(side)
    if type(side) ~= "table" then
        return nil
    end
    local player = side.Player or side.player
    if typeof(player) == "Instance" and player:IsA("Player") then
        return player
    end
    if type(player) == "string" then
        return Players:FindFirstChild(player)
    end
    if type(player) == "number" then
        return Players:GetPlayerByUserId(player)
    end
    if type(player) == "table" then
        local userId = tonumber(player.UserId or player.userId)
        if userId then
            return Players:GetPlayerByUserId(userId)
        end
        local name = player.Name or player.name
        if type(name) == "string" then
            return Players:FindFirstChild(name)
        end
    end
    return nil
end
State.AutoTrader.RequestFriendStatus = function(player, force)
    if not player or player == LocalPlayer or not player.Parent then
        return
    end
    local userId = player.UserId
    local meta = State.AutoTrader.FriendCacheMeta[userId]
    local cached = State.AutoTrader.FriendCache[userId]
    local pendingAt = State.AutoTrader.FriendPending[userId]
    if pendingAt then
        if os.clock() - (tonumber(pendingAt) or os.clock()) < 3 then
            return
        end
        State.AutoTrader.FriendPending[userId] = nil
        State.AutoTrader.FriendCache[userId] = nil
        State.AutoTrader.FriendCacheMeta[userId] = {checkedAt = os.clock(), fallback = true, error = "friend lookup timed out"}
    end
    if not force and cached ~= nil and not (meta and meta.fallback and os.clock() - (meta.checkedAt or 0) >= 10) then
        return
    end
    State.AutoTrader.FriendPending[userId] = os.clock()
    task.spawn(function()
        local ok, isFriend = pcall(function()
            return LocalPlayer:IsFriendsWith(userId)
        end)
        State.AutoTrader.FriendPending[userId] = nil
        if Destroyed or not player.Parent then
            return
        end
        if ok then
            State.AutoTrader.FriendCache[userId] = isFriend == true
            State.AutoTrader.FriendCacheMeta[userId] = {checkedAt = os.clock(), fallback = false}
        else
            -- v27: Ignore Friends must not fail open. A failed lookup leaves only this
            -- player unresolved/retryable; other verified non-friends can still trade.
            State.AutoTrader.FriendCache[userId] = nil
            State.AutoTrader.FriendCacheMeta[userId] = {checkedAt = os.clock(), fallback = true, error = tostring(isFriend)}
            State.AutoTrader.Log("friend_lookup_failed_unknown", {userId = userId, name = player.Name, error = tostring(isFriend)})
        end
        if scheduleTradeRefresh then
            scheduleTradeRefresh(0)
        end
        if State.AutoTrader.Render then
            State.AutoTrader.Render()
        end
    end)
end
State.AutoTrader.GetFriendStatus = function(player)
    if not player or player == LocalPlayer then
        return false
    end
    local value = State.AutoTrader.FriendCache[player.UserId]
    local meta = State.AutoTrader.FriendCacheMeta[player.UserId]
    if value == nil then
        local pendingAt = State.AutoTrader.FriendPending[player.UserId]
        if pendingAt and os.clock() - (tonumber(pendingAt) or os.clock()) >= 3 then
            State.AutoTrader.FriendPending[player.UserId] = nil
            State.AutoTrader.FriendCache[player.UserId] = nil
            State.AutoTrader.FriendCacheMeta[player.UserId] = {checkedAt = os.clock(), fallback = true, error = "friend lookup timed out"}
            State.AutoTrader.RequestFriendStatus(player, true)
            return nil
        end
        State.AutoTrader.RequestFriendStatus(player)
        return nil
    end
    if meta and meta.fallback and os.clock() - (meta.checkedAt or 0) >= 10 then
        State.AutoTrader.RequestFriendStatus(player, true)
    end
    return value == true
end
State.AutoTrader.EnsureServerPlayer = function(player)
    if not player or player == LocalPlayer then return nil end
    if typeof(player) == "Instance" and player:IsA("Player") and player.Parent ~= Players then return nil end
    local entry = State.AutoTrader.ServerPlayers[player.UserId]
    local newPresence = not entry or entry.present ~= true or entry.playerInstance ~= player
    if not entry then
        entry = {userId=player.UserId, name=player.Name, presenceGeneration=0, history={}}
        State.AutoTrader.ServerPlayers[player.UserId] = entry
    end
    if newPresence then
        if entry.presenceGeneration > 0 and (entry.outcome or entry.leftAt) then
            entry.history = type(entry.history) == "table" and entry.history or {}
            table.insert(entry.history, {
                generation=entry.presenceGeneration, joinedAt=entry.joinedAt, leftAt=entry.leftAt,
                outcome=entry.outcome, outcomeAt=entry.outcomeAt, reason=entry.reason,
            })
            while #entry.history > 6 do table.remove(entry.history, 1) end
        end
        entry.presenceGeneration = (tonumber(entry.presenceGeneration) or 0) + 1
        entry.playerInstance = player
        entry.present = true
        entry.joinedAt = os.clock()
        entry.firstSeenAt = entry.joinedAt
        entry.leftAt = nil
        entry.outcome = nil
        entry.outcomeAt = 0
        entry.reason = nil
        entry.discoveryRetries = 0
        entry.lastDiscoveryRetryAt = 0
        entry.lastVerifiedTotal = nil
        entry.lastVerifiedAt = 0
        State.AutoTrader.Cooldowns[player.UserId] = nil
        State.AutoTrader.RequestHistory[player.UserId] = nil
        State.AutoTrader.ServerExhaustedSince = 0
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.Log("server_player_presence_started", {userId=player.UserId,name=player.Name,generation=entry.presenceGeneration})
    else
        entry.name = player.Name
    end
    return entry
end
State.AutoTrader.EndServerPlayerPresence = function(player)
    if not player or player == LocalPlayer then return end
    local entry = State.AutoTrader.ServerPlayers[player.UserId]
    if entry and entry.present then
        entry.present = false
        entry.leftAt = os.clock()
        entry.playerInstance = nil
        State.AutoTrader.Log("server_player_presence_ended", {userId=player.UserId,name=player.Name,generation=entry.presenceGeneration,outcome=entry.outcome})
    end
    State.AutoTrader.Cooldowns[player.UserId] = nil
    State.AutoTrader.RequestHistory[player.UserId] = nil
    State.AutoTrader.MovementSamples[player.UserId] = nil
    State.AutoTrader.ServerExhaustedSince = 0
end
State.AutoTrader.MarkServerPlayerOutcome = function(player, outcome, reason)
    local entry = State.AutoTrader.EnsureServerPlayer(player)
    if not entry then
        return
    end
    entry.outcome = tostring(outcome or "unknown")
    entry.outcomeAt = os.clock()
    entry.reason = reason and tostring(reason) or nil
    State.AutoTrader.ServerExhaustedSince = 0
    State.AutoTrader.Log("server_player_outcome", {
        userId = player.UserId,
        name = player.Name,
        outcome = entry.outcome,
        reason = entry.reason,
    })
end
State.AutoTrader.IsTerminalServerOutcome = function(outcome)
    return outcome == "declined"
        or outcome == "no_response"
        or outcome == "traded"
        or outcome == "unavailable"
        or outcome == "trade_unavailable"
        or outcome == "trade_declined"
        or outcome == "idle"
        or outcome == "manual_skip"
end
State.AutoTrader.GetServerPlayerClassification = function(player)
    local state = State.AutoTrader.EnsureServerPlayer(player)
    if not state then
        return "ineligible", nil, state
    end
    if State.AutoTrader.Preferences.ignoreFriends then
        local friend = State.AutoTrader.GetFriendStatus(player)
        if friend == nil then
            return "unknown", nil, state
        elseif friend == true then
            return "friend", nil, state
        end
    end
    local total, verified = State.AutoTrader.GetVerifiedPlayerValue(player)
    if verified and total ~= nil then
        state.lastVerifiedTotal = total
        state.lastVerifiedAt = os.clock()
        if total <= 0 then
            return "zero", total, state
        end
        if State.AutoTrader.IsTerminalServerOutcome(state.outcome) then
            return state.outcome, total, state
        end
        if state.outcome == "request_pending" then
            return "request_pending", total, state
        elseif state.outcome == "trading" then
            return "trading", total, state
        end
        return "valued", total, state
    end
    local age = os.clock() - (state.firstSeenAt or State.AutoTrader.ServerJoinedAt)
    if age >= CONFIG.AutoTraderUnresolvedMaxWaitSeconds then
        return "unresolvable", nil, state
    end
    return "unknown", nil, state
end
State.AutoTrader.GetServerDispositionLegacyClassification = function()
    local counts = {
        total = 0, valued = 0, zero = 0, unknown = 0, unresolvable = 0,
        friend = 0, exhausted = 0, active = 0,
        verifiedPositive = 0, verifiedZero = 0, verifiedCount = 0,
    }
    if not State.AutoTrader.Preferences.automation then return "OFF", counts end
    if State.AutoTrader.SessionFrozen then return "FROZEN", counts end
    if State.AutoTrader.PostTradeAuditPending or State.AutoTrader.PendingRequest
        or State.AutoTrader.IsAnyNativeOutgoingPending()
        or State.AutoTrader.RequestLifecycle ~= "idle"
        or State.AutoTrader.TradeDeclinePending
        or State.CurrentTrade or (isTradeVisible and isTradeVisible()) then
        return "ACTIVE", counts
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            counts.total += 1
            local class, total = State.AutoTrader.GetServerPlayerClassification(player)
            if total ~= nil then
                counts.verifiedCount += 1
                if total > 0 then
                    counts.verifiedPositive += 1
                else
                    counts.verifiedZero += 1
                end
            end
            if class == "valued" then
                counts.valued += 1
            elseif class == "zero" then
                counts.zero += 1
            elseif class == "unknown" then
                counts.unknown += 1
            elseif class == "unresolvable" then
                counts.unresolvable += 1
            elseif class == "friend" then
                counts.friend += 1
            elseif class == "request_pending" or class == "trading" then
                counts.active += 1
            elseif State.AutoTrader.IsTerminalServerOutcome(class) then
                counts.exhausted += 1
            end
        end
    end
    if counts.valued > 0 or counts.active > 0 then return "ACTIVE", counts end
    if counts.unknown > 0 then return "WAITING_FOR_DISCOVERY", counts end
    if counts.total == 0 or counts.friend == counts.total then return "EXHAUSTED_NO_ELIGIBLE_PLAYERS", counts end
    if counts.exhausted > 0 then return "EXHAUSTED_ALL_ATTEMPTED", counts end
    if counts.unresolvable > 0 then return "EXHAUSTED_UNRESOLVABLE", counts end
    return "EXHAUSTED_NO_VALUE", counts
end
State.AutoTrader.KickServerDiscovery = function()
    if os.clock() - (State.AutoTrader.LastDiscoveryKickAt or 0) < CONFIG.AutoTraderDiscoveryRetrySeconds then
        return
    end
    State.AutoTrader.LastDiscoveryKickAt = os.clock()
    local remoteState = State.Profile.remoteTotals
    local kicked = false
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            local class, _, entry = State.AutoTrader.GetServerPlayerClassification(player)
            if class == "unknown" and entry
                and entry.discoveryRetries < CONFIG.AutoTraderDiscoveryRetryLimit
                and os.clock() - (entry.lastDiscoveryRetryAt or 0) >= CONFIG.AutoTraderDiscoveryRetrySeconds then
                entry.discoveryRetries += 1
                entry.lastDiscoveryRetryAt = os.clock()
                if remoteState then
                    remoteState.retryAfterByUserId[player.UserId] = nil
                end
                kicked = true
            end
        end
    end
    if kicked then
        State.Profile.QueueRemoteLeaderboardSweep(true)
        State.AutoTrader.Log("server_discovery_retry", {})
    end
end
State.AutoTrader.PruneRecentJobs = function()
    local now = os.time()
    local rows = {}
    for jobId, stamp in pairs(State.AutoTrader.RecentJobs or {}) do
        stamp = tonumber(stamp)
        if type(jobId)=="string" and jobId~="" and stamp and stamp==stamp and stamp>0 and stamp<=now+60 and now-stamp<=CONFIG.AutoTraderRecentServerTtlSeconds then
            table.insert(rows,{jobId=jobId,stamp=stamp})
        end
    end
    table.sort(rows,function(a,b)return a.stamp>b.stamp end)
    State.AutoTrader.RecentJobs={}
    for index,row in ipairs(rows) do if index>CONFIG.AutoTraderRecentServerLimit then break end; State.AutoTrader.RecentJobs[row.jobId]=row.stamp end
end
State.AutoTrader.SaveRecentJobs = function()
    State.AutoTrader.PruneRecentJobs()
    rawset(_G,State.AutoTrader.RecentJobsKey,State.AutoTrader.RecentJobs)
    rawset(ExecutorEnvironment,State.AutoTrader.RecentJobsKey,State.AutoTrader.RecentJobs)
    local payload={version=2,savedAtUnix=os.time(),jobs=State.AutoTrader.RecentJobs}
    local ok,body=pcall(function()return HttpService:JSONEncode(payload)end)
    if not ok then notePersistence(State.AutoTrader.RecentJobsFile,false,"encode",body); return false end
    return HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.RecentJobsFile,body)
end
State.AutoTrader.LoadRecentJobs = function()
    local merged={}
    local now=os.time()
    local function merge(value)
        if type(value)~="table" then return end
        local jobs=type(value.jobs)=="table" and value.jobs or value
        for jobId,stamp in pairs(jobs) do
            local n=tonumber(stamp)
            if type(jobId)=="string" and jobId~="" and n and n==n and n>0 and n<=now+60 then
                merged[jobId]=math.max(tonumber(merged[jobId]) or 0,n)
            end
        end
    end
    merge(rawget(_G,State.AutoTrader.RecentJobsKey)); merge(rawget(ExecutorEnvironment,State.AutoTrader.RecentJobsKey))
    local bootstrap=State.AutoTrader.TeleportBootstrap; if type(bootstrap)=="table" then merge(bootstrap.recentJobs) end
    local decoded=HARDEN.readJsonFileBestEffort(State.AutoTrader.RecentJobsFile)
    if type(decoded)=="table" then merge(decoded) end
    State.AutoTrader.RecentJobs=merged
    if type(game.JobId)=="string" and game.JobId~="" then State.AutoTrader.RecentJobs[game.JobId]=now end
    State.AutoTrader.PruneRecentJobs()
    rawset(_G,State.AutoTrader.RecentJobsKey,State.AutoTrader.RecentJobs)
    rawset(ExecutorEnvironment,State.AutoTrader.RecentJobsKey,State.AutoTrader.RecentJobs)
end
State.AutoTrader.LoadRecentJobs()
State.AutoTrader.NormalizeServerCandidateCacheEntry = function(entry)
    if type(entry) ~= "table" then return nil end
    local jobId = entry.id or entry.jobId
    local scannedAt = tonumber(entry.scannedAt) or 0
    local playing = tonumber(entry.playing)
    local maxPlayers = tonumber(entry.maxPlayers)
    if type(jobId) ~= "string" or jobId == "" or scannedAt <= 0
        or not playing or not maxPlayers or maxPlayers <= 0 then
        return nil
    end
    local fingerprints, seen = {}, {}
    for _, raw in ipairs(entry.previewFingerprints or entry.hashes or {}) do
        local fingerprint = State.AutoTrader.ExtractAvatarHeadshotHash(raw) or raw
        if type(fingerprint) == "string" and fingerprint ~= "" and not seen[fingerprint] then
            seen[fingerprint] = true
            table.insert(fingerprints, fingerprint)
            if #fingerprints >= 10 then break end
        end
    end
    return {
        id = jobId,
        scannedAt = scannedAt,
        playing = math.max(0, playing),
        maxPlayers = math.max(1, maxPlayers),
        occupancy = tonumber(entry.occupancy) or (playing / math.max(1, maxPlayers)),
        ping = tonumber(entry.ping),
        fps = tonumber(entry.fps),
        previewFingerprints = fingerprints,
        previewTrustedAtScan = entry.previewTrustedAtScan == true,
    }
end
State.AutoTrader.PruneServerCandidateCache = function()
    local nowUnix = os.time()
    local ttl = math.max(1, tonumber(CONFIG.AutoTraderServerCandidateCacheTtlSeconds) or 180)
    local rows, seen = {}, {}
    local cache = State.AutoTrader.ServerCandidateCache
    for _, raw in ipairs(type(cache) == "table" and cache.entries or {}) do
        local entry = State.AutoTrader.NormalizeServerCandidateCacheEntry(raw)
        if entry and not seen[entry.id] then
            local age = nowUnix - entry.scannedAt
            local recentAt = tonumber(State.AutoTrader.RecentJobs and State.AutoTrader.RecentJobs[entry.id])
            local recentlyAttempted = recentAt and nowUnix - recentAt < ttl
            if age >= 0 and age < ttl
                and entry.id ~= game.JobId
                and not recentlyAttempted
                and entry.playing < entry.maxPlayers then
                seen[entry.id] = true
                table.insert(rows, entry)
            end
        end
    end
    table.sort(rows, function(a, b)
        if a.scannedAt ~= b.scannedAt then return a.scannedAt > b.scannedAt end
        if a.playing ~= b.playing then return a.playing > b.playing end
        return a.id < b.id
    end)
    while #rows > CONFIG.AutoTraderServerCandidateCacheLimit do table.remove(rows) end
    State.AutoTrader.ServerCandidateCache = {version = 1, entries = rows}
    return rows
end
State.AutoTrader.SaveServerCandidateCache = function()
    local rows = State.AutoTrader.PruneServerCandidateCache()
    local payload = {version = 1, savedAt = os.time(), entries = rows}
    rawset(_G, State.AutoTrader.ServerCandidateCacheKey, payload)
    rawset(ExecutorEnvironment, State.AutoTrader.ServerCandidateCacheKey, payload)
    local okEncode, body = pcall(function() return HttpService:JSONEncode(payload) end)
    if okEncode and type(body) == "string" then HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.ServerCandidateCacheFile, body) end
    return #rows
end
State.AutoTrader.LoadServerCandidateCache = function()
    local merged, byId = {}, {}
    local function merge(value)
        local entries = type(value) == "table" and (value.entries or value) or nil
        if type(entries) ~= "table" then return end
        for _, raw in ipairs(entries) do
            local entry = State.AutoTrader.NormalizeServerCandidateCacheEntry(raw)
            if entry then
                local previous = byId[entry.id]
                if not previous or entry.scannedAt > previous.scannedAt then byId[entry.id] = entry end
            end
        end
    end
    merge(rawget(_G, State.AutoTrader.ServerCandidateCacheKey))
    merge(rawget(ExecutorEnvironment, State.AutoTrader.ServerCandidateCacheKey))
    local decodedCache = HARDEN.readJsonFileBestEffort(State.AutoTrader.ServerCandidateCacheFile)
    if type(decodedCache) == "table" then merge(decodedCache) end
    for _, entry in pairs(byId) do table.insert(merged, entry) end
    State.AutoTrader.ServerCandidateCache = {version = 1, entries = merged}
    State.AutoTrader.SaveServerCandidateCache()
    return #State.AutoTrader.ServerCandidateCache.entries
end
State.AutoTrader.MergeServerCandidateCache = function(servers)
    local byId = {}
    for _, entry in ipairs(State.AutoTrader.PruneServerCandidateCache()) do byId[entry.id] = entry end
    local nowUnix = os.time()
    for _, server in ipairs(servers or {}) do
        if type(server) == "table" and type(server.id) == "string" and server.id ~= ""
            and server.id ~= game.JobId and (tonumber(server.playing) or 0) < (tonumber(server.maxPlayers) or 0) then
            local preview = server.botPreview or State.AutoTrader.ClassifyServerPreview(server)
            -- Store only candidates that are currently clear/unknown. Hard rejects are
            -- intentionally omitted; cached fingerprints will be reclassified again later.
            if preview and preview.safeEnough then
                byId[server.id] = {
                    id = server.id, scannedAt = nowUnix,
                    playing = tonumber(server.playing) or 0, maxPlayers = tonumber(server.maxPlayers) or 1,
                    occupancy = tonumber(server.occupancy), ping = tonumber(server.ping), fps = tonumber(server.fps),
                    previewFingerprints = table.clone(server.previewFingerprints or {}),
                    previewTrustedAtScan = preview.previewTrusted == true,
                }
            end
        end
    end
    local rows = {}
    for _, entry in pairs(byId) do table.insert(rows, entry) end
    State.AutoTrader.ServerCandidateCache = {version = 1, entries = rows}
    return State.AutoTrader.SaveServerCandidateCache()
end

State.AutoTrader.ExtractAvatarHeadshotHash = function(value)
    if type(value) ~= "string" or value == "" then return nil end
    local lower = string.lower(value)
    -- Roblox CDN avatar headshots look like:
    -- 30DAY-AvatarHeadshot-381484BEA53B76DD0024B4B9001FB552-Png/...
    -- The 32-hex middle component is stable across format/size/path changes and,
    -- importantly, can be shared by different users rendering the exact avatar.
    local hash = lower:match("avatarheadshot%-([0-9a-f]+)%-")
    if hash and #hash == 32 then return hash end
    -- Backward compatibility with already-canonical v10 keys.
    if lower:match("^[0-9a-f]+$") and #lower == 32 then return lower end
    return nil
end
State.AutoTrader.NormalizeBotIconDb = function(value)
    if type(value) ~= "table" then value = {} end
    if type(value.icons) ~= "table" then value.icons = {} end
    local merged = {}
    local function mergeJobs(target, source)
        for jobId, stamp in pairs(type(source) == "table" and source or {}) do
            if type(jobId) == "string" and jobId ~= "" then
                target[jobId] = math.max(tonumber(target[jobId]) or 0, tonumber(stamp) or 0)
            end
        end
    end
    for oldKey, oldRecord in pairs(value.icons) do
        if type(oldKey) == "string" and type(oldRecord) == "table" then
            local key = State.AutoTrader.ExtractAvatarHeadshotHash(oldKey) or string.lower(oldKey)
            local record = merged[key]
            if not record then
                record = {
                    -- Legacy fields are retained only so existing local files remain readable.
                    botEvidence = 0, humanEvidence = 0, botJobs = {}, humanJobs = {},
                    botPlayerSightings = 0, humanPlayerSightings = 0,
                    -- v19/v20-era gold fields are preserved as legacy history only. v26 server
                    -- filtering uses ONLY strictGoldBotJobs, written only after the
                    -- strict MoveDirection + fixed-facing departure commit is validated.
                    goldBotJobs = {}, goldBotSightings = 0,
                    strictGoldBotJobs = {}, strictGoldBotSightings = 0,
                    sampleUserId = tonumber(oldRecord.sampleUserId), sampleName = oldRecord.sampleName,
                    firstSeen = tonumber(oldRecord.firstSeen) or tonumber(oldRecord.lastSeen) or os.time(),
                    lastSeen = 0,
                }
                merged[key] = record
            end
            record.botEvidence += math.max(0, tonumber(oldRecord.botEvidence) or 0)
            record.humanEvidence += math.max(0, tonumber(oldRecord.humanEvidence) or 0)
            record.botPlayerSightings += math.max(0, tonumber(oldRecord.botPlayerSightings) or 0)
            record.humanPlayerSightings += math.max(0, tonumber(oldRecord.humanPlayerSightings) or 0)
            record.goldBotSightings += math.max(0, tonumber(oldRecord.goldBotSightings) or 0)
            record.strictGoldBotSightings += math.max(0, tonumber(oldRecord.strictGoldBotSightings) or 0)
            record.lastSeen = math.max(record.lastSeen or 0, tonumber(oldRecord.lastSeen) or 0)
            if not record.sampleUserId then record.sampleUserId = tonumber(oldRecord.sampleUserId) end
            if (not record.sampleName or record.sampleName == "") and type(oldRecord.sampleName) == "string" then
                record.sampleName = oldRecord.sampleName
            end
            mergeJobs(record.botJobs, oldRecord.botJobs)
            mergeJobs(record.humanJobs, oldRecord.humanJobs)
            mergeJobs(record.goldBotJobs, oldRecord.goldBotJobs)
            mergeJobs(record.strictGoldBotJobs, oldRecord.strictGoldBotJobs)
        end
    end
    value.icons = merged
    value.version = 4
    return value
end
State.AutoTrader.LoadBotIconDb = function()
    local loaded = rawget(_G, State.AutoTrader.BotIconDbKey)
        or rawget(ExecutorEnvironment, State.AutoTrader.BotIconDbKey)
    local bootstrap = State.AutoTrader.TeleportBootstrap
    if type(loaded) ~= "table" and type(bootstrap) == "table" and type(bootstrap.botDb) == "table" then
        loaded = bootstrap.botDb
    end
    if type(loaded) ~= "table" then
        local decoded = HARDEN.readJsonFileBestEffort(State.AutoTrader.BotIconDbFile)
        if type(decoded) == "table" then loaded = decoded end
        -- One-time migration path from v9's full-CDN-path database.
        if type(loaded) ~= "table" then
            local legacy = HARDEN.readJsonFileBestEffort("SV_AutoTrader_BotIcons_v1.json")
            if type(legacy) == "table" then loaded = legacy end
        end
    end
    State.AutoTrader.BotIconDb = State.AutoTrader.NormalizeBotIconDb(loaded)
    rawset(_G, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
    rawset(ExecutorEnvironment, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
end
State.AutoTrader.PruneBotIconDb = function()
    local rows = {}
    local icons = State.AutoTrader.BotIconDb and State.AutoTrader.BotIconDb.icons or {}
    local function pruneJobs(jobTable)
        local jobs = {}
        for jobId, stamp in pairs(type(jobTable) == "table" and jobTable or {}) do
            if type(jobId) == "string" then table.insert(jobs, {jobId = jobId, stamp = tonumber(stamp) or 0}) end
        end
        table.sort(jobs, function(a, b) return a.stamp > b.stamp end)
        local nextJobs = {}
        for index, row in ipairs(jobs) do
            if index > CONFIG.AutoTraderBotDatabaseJobsPerIcon then break end
            nextJobs[row.jobId] = row.stamp
        end
        return nextJobs
    end
    for fingerprint, record in pairs(icons) do
        if type(fingerprint) == "string" and type(record) == "table" then
            record.botEvidence = tonumber(record.botEvidence) or 0
            record.humanEvidence = tonumber(record.humanEvidence) or 0
            record.botPlayerSightings = tonumber(record.botPlayerSightings) or 0
            record.humanPlayerSightings = tonumber(record.humanPlayerSightings) or 0
            record.goldBotSightings = tonumber(record.goldBotSightings) or 0
            record.strictGoldBotSightings = tonumber(record.strictGoldBotSightings) or 0
            record.firstSeen = tonumber(record.firstSeen) or tonumber(record.lastSeen) or os.time()
            record.lastSeen = tonumber(record.lastSeen) or 0
            record.botJobs = pruneJobs(record.botJobs)
            record.humanJobs = pruneJobs(record.humanJobs)
            record.goldBotJobs = pruneJobs(record.goldBotJobs)
            record.strictGoldBotJobs = pruneJobs(record.strictGoldBotJobs)
            table.insert(rows, {fingerprint = fingerprint, record = record})
        end
    end
    table.sort(rows, function(a, b)
        local ag = State.AutoTrader.BotIconJobCount and State.AutoTrader.BotIconJobCount(a.record.strictGoldBotJobs) or 0
        local bg = State.AutoTrader.BotIconJobCount and State.AutoTrader.BotIconJobCount(b.record.strictGoldBotJobs) or 0
        if ag ~= bg then return ag > bg end
        if (a.record.strictGoldBotSightings or 0) ~= (b.record.strictGoldBotSightings or 0) then
            return (a.record.strictGoldBotSightings or 0) > (b.record.strictGoldBotSightings or 0)
        end
        return (a.record.lastSeen or 0) > (b.record.lastSeen or 0)
    end)
    local nextIcons = {}
    for index, row in ipairs(rows) do
        if index > CONFIG.AutoTraderBotDatabaseMaxIcons then break end
        nextIcons[row.fingerprint] = row.record
    end
    State.AutoTrader.BotIconDb.icons = nextIcons
end
State.AutoTrader.FlushBotIconDb = function()
    State.AutoTrader.PruneBotIconDb()
    rawset(_G, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
    rawset(ExecutorEnvironment, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
    local okEncode, body = pcall(function() return HttpService:JSONEncode(State.AutoTrader.BotIconDb) end)
    if not okEncode then return false end
    return HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.BotIconDbFile, body)
end
State.AutoTrader.SaveBotIconDb = function(immediate)
    rawset(_G, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
    rawset(ExecutorEnvironment, State.AutoTrader.BotIconDbKey, State.AutoTrader.BotIconDb)
    State.AutoTrader.BotIconDbSaveGeneration += 1
    local generation = State.AutoTrader.BotIconDbSaveGeneration
    if immediate then return State.AutoTrader.FlushBotIconDb() end
    task.delay(0.75, function()
        if Destroyed or generation ~= State.AutoTrader.BotIconDbSaveGeneration then return end
        State.AutoTrader.FlushBotIconDb()
    end)
    return true
end
State.AutoTrader.BotIconJobCount = function(jobTable)
    local count = 0
    for _ in pairs(type(jobTable) == "table" and jobTable or {}) do count += 1 end
    return count
end
State.AutoTrader.GetBotIconDbCount = function()
    local count = 0
    for _ in pairs(State.AutoTrader.BotIconDb.icons or {}) do count += 1 end
    return count
end
State.AutoTrader.GetBotIconRecord = function(fingerprint, create)
    fingerprint = State.AutoTrader.ExtractAvatarHeadshotHash(fingerprint) or (type(fingerprint) == "string" and string.lower(fingerprint) or nil)
    if type(fingerprint) ~= "string" or fingerprint == "" then return nil end
    local icons = State.AutoTrader.BotIconDb.icons
    local record = icons[fingerprint]
    if not record and create then
        record = {
            botEvidence = 0, humanEvidence = 0, botJobs = {}, humanJobs = {},
            botPlayerSightings = 0, humanPlayerSightings = 0,
            goldBotJobs = {}, goldBotSightings = 0,
            strictGoldBotJobs = {}, strictGoldBotSightings = 0,
            sampleUserId = nil, sampleName = nil,
            firstSeen = os.time(), lastSeen = os.time(),
        }
        icons[fingerprint] = record
    end
    if record then
        record.botEvidence = tonumber(record.botEvidence) or 0
        record.humanEvidence = tonumber(record.humanEvidence) or 0
        record.botJobs = type(record.botJobs) == "table" and record.botJobs or {}
        record.humanJobs = type(record.humanJobs) == "table" and record.humanJobs or {}
        record.botPlayerSightings = tonumber(record.botPlayerSightings) or 0
        record.humanPlayerSightings = tonumber(record.humanPlayerSightings) or 0
        record.goldBotJobs = type(record.goldBotJobs) == "table" and record.goldBotJobs or {}
        record.goldBotSightings = tonumber(record.goldBotSightings) or 0
        record.strictGoldBotJobs = type(record.strictGoldBotJobs) == "table" and record.strictGoldBotJobs or {}
        record.strictGoldBotSightings = tonumber(record.strictGoldBotSightings) or 0
        record.sampleUserId = tonumber(record.sampleUserId)
        record.sampleName = type(record.sampleName) == "string" and record.sampleName or nil
        record.firstSeen = tonumber(record.firstSeen) or os.time()
        record.lastSeen = tonumber(record.lastSeen) or 0
    end
    return record
end
State.AutoTrader.GetBotIconClass = function(fingerprint)
    local record = State.AutoTrader.GetBotIconRecord(fingerprint, false)
    if not record then return "unknown", 0, nil end
    -- v26 intentionally ignores legacy v19 goldBotJobs. Only strictGoldBotJobs that
    -- passed remote MoveDirection + fixed-facing certification participate.
    local goldJobs = State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs)
    if goldJobs >= CONFIG.AutoTraderGoldBotConfirmMinJobs then return "confirmed_bot", 0.99, record end
    if goldJobs >= CONFIG.AutoTraderGoldBotKnownMinJobs then return "known_bot", 0.93, record end
    if goldJobs >= CONFIG.AutoTraderGoldBotObservedMinJobs then return "observed_bot", 0.80, record end
    return "unknown", 0, record
end
State.AutoTrader.GetGoldBotIconDbCount = function()
    local count = 0
    for _, record in pairs(State.AutoTrader.BotIconDb.icons or {}) do
        if State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs) >= CONFIG.AutoTraderGoldBotObservedMinJobs then count += 1 end
    end
    return count
end
State.AutoTrader.AddStrictGoldBotIconEvidence = function(fingerprint, jobId, playerSightings, sampleUserId, sampleName)
    fingerprint = State.AutoTrader.ExtractAvatarHeadshotHash(fingerprint) or fingerprint
    local record = State.AutoTrader.GetBotIconRecord(fingerprint, true)
    if not record then return false end
    local now = os.time()
    playerSightings = math.max(1, tonumber(playerSightings) or 1)
    local newJob = type(jobId) == "string" and jobId ~= "" and record.strictGoldBotJobs[jobId] == nil
    if type(jobId) == "string" and jobId ~= "" then record.strictGoldBotJobs[jobId] = now end
    if newJob or not jobId then record.strictGoldBotSightings += playerSightings end
    if not record.sampleUserId then record.sampleUserId = tonumber(sampleUserId) end
    if (not record.sampleName or record.sampleName == "") and type(sampleName) == "string" then record.sampleName = sampleName end
    record.lastSeen = now
    return true
end
-- Compatibility shim: legacy reputation writers are disabled in v26. The strict
-- writer above is called only by ImportStrictGoldTeleportCommit from a validated departure payload.
State.AutoTrader.AddBotIconEvidence = function()
    return false
end
State.AutoTrader.LoadBotIconDb()

-- v27: learn how quickly real human-controlled MoveDirection exposes a regular server.
-- This timing model is deliberately separate from bot identity. It only shortens the
-- final "all bot-like players have passed" hold; it never causes a current server hop.
State.AutoTrader.NormalizeHumanDetectionTiming = function(value)
    if type(value) ~= "table" then value = {} end
    value.version = 1
    value.count = math.max(0, math.floor(tonumber(value.count) or 0))
    value.totalSeconds = math.max(0, tonumber(value.totalSeconds) or 0)
    value.maxSeconds = math.max(0, tonumber(value.maxSeconds) or 0)
    if type(value.samples) ~= "table" then value.samples = {} end
    local clean = {}
    for _, row in ipairs(value.samples) do
        if type(row) == "table" then
            local seconds = tonumber(row.seconds)
            if seconds and seconds >= 0 then
                table.insert(clean, {
                    seconds = seconds, jobId = type(row.jobId) == "string" and row.jobId or nil,
                    userId = tonumber(row.userId), name = type(row.name) == "string" and row.name or nil,
                    atUnix = tonumber(row.atUnix) or 0,
                })
            end
        end
    end
    while #clean > CONFIG.AutoTraderGoldHumanTimingSampleLimit do table.remove(clean, 1) end
    value.samples = clean
    return value
end
State.AutoTrader.LoadHumanDetectionTiming = function()
    local loaded = rawget(_G, State.AutoTrader.HumanTimingKey)
        or rawget(ExecutorEnvironment, State.AutoTrader.HumanTimingKey)
    if type(loaded) ~= "table" then
        local decoded = HARDEN.readJsonFileBestEffort(State.AutoTrader.HumanTimingFile)
        if type(decoded) == "table" then loaded = decoded end
    end
    State.AutoTrader.HumanDetectionTiming = State.AutoTrader.NormalizeHumanDetectionTiming(loaded)
    rawset(_G, State.AutoTrader.HumanTimingKey, State.AutoTrader.HumanDetectionTiming)
    rawset(ExecutorEnvironment, State.AutoTrader.HumanTimingKey, State.AutoTrader.HumanDetectionTiming)
end
State.AutoTrader.FlushHumanDetectionTiming = function()
    local model = State.AutoTrader.NormalizeHumanDetectionTiming(State.AutoTrader.HumanDetectionTiming)
    State.AutoTrader.HumanDetectionTiming = model
    rawset(_G, State.AutoTrader.HumanTimingKey, model)
    rawset(ExecutorEnvironment, State.AutoTrader.HumanTimingKey, model)
    local okEncode, body = pcall(function() return HttpService:JSONEncode(model) end)
    if not okEncode or type(body) ~= "string" then return false end
    return HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.HumanTimingFile, body)
end
State.AutoTrader.SaveHumanDetectionTiming = function(immediate)
    local model = State.AutoTrader.HumanDetectionTiming
    rawset(_G, State.AutoTrader.HumanTimingKey, model)
    rawset(ExecutorEnvironment, State.AutoTrader.HumanTimingKey, model)
    State.AutoTrader.HumanTimingSaveGeneration += 1
    local generation = State.AutoTrader.HumanTimingSaveGeneration
    if immediate then return State.AutoTrader.FlushHumanDetectionTiming() end
    task.delay(0.5, function()
        if Destroyed or generation ~= State.AutoTrader.HumanTimingSaveGeneration then return end
        State.AutoTrader.FlushHumanDetectionTiming()
    end)
    return true
end
State.AutoTrader.GetGoldAdaptiveObserveSeconds = function()
    local cap = math.max(0, tonumber(CONFIG.AutoTraderGoldObserveSeconds) or 10)
    local model = State.AutoTrader.HumanDetectionTiming or {}
    local count = math.max(0, tonumber(model.count) or 0)
    local longest = math.max(0, tonumber(model.maxSeconds) or 0)
    if count <= 0 or longest <= 0 then return cap end
    return math.min(cap, longest + math.max(0, tonumber(CONFIG.AutoTraderGoldAdaptiveObservePaddingSeconds) or 1))
end
State.AutoTrader.RecordHumanDetectionTiming = function(seconds, details)
    seconds = tonumber(seconds)
    if not seconds or seconds < 0 then return false end
    local model = State.AutoTrader.NormalizeHumanDetectionTiming(State.AutoTrader.HumanDetectionTiming)
    -- One timing sample per JobId. Script reinjection in the same human server must
    -- not overweight the history or teach a later duplicate as a new server.
    for _, row in ipairs(model.samples) do
        if type(row) == "table" and row.jobId == game.JobId then return false end
    end
    model.count += 1
    model.totalSeconds += seconds
    model.maxSeconds = math.max(model.maxSeconds, seconds)
    table.insert(model.samples, {
        seconds = seconds, jobId = game.JobId, userId = type(details) == "table" and tonumber(details.userId) or nil,
        name = type(details) == "table" and details.name or nil, atUnix = os.time(),
    })
    while #model.samples > CONFIG.AutoTraderGoldHumanTimingSampleLimit do table.remove(model.samples, 1) end
    State.AutoTrader.HumanDetectionTiming = model
    State.AutoTrader.SaveHumanDetectionTiming(true)
    State.AutoTrader.Log("gold_human_detection_timing_learned", {
        seconds = seconds, samples = model.count, longestSeconds = model.maxSeconds,
        averageSeconds = model.count > 0 and (model.totalSeconds / model.count) or 0,
        effectiveBotHoldSeconds = State.AutoTrader.GetGoldAdaptiveObserveSeconds(),
        userId = type(details) == "table" and details.userId or nil,
        name = type(details) == "table" and details.name or nil,
    })
    return true
end
State.AutoTrader.LoadHumanDetectionTiming()

State.AutoTrader.GetQueueOnTeleport = function()
    for _, name in ipairs({"queue_on_teleport", "queueonteleport", "queue_on_tp", "queueteleport"}) do
        local direct = State.TryGetExecutorGlobal(name)
        if type(direct) == "function" then return direct end
    end
    for _, tableName in ipairs({"syn", "fluxus", "krnl"}) do
        local t = State.TryGetExecutorGlobal(tableName)
        if type(t) == "table" then
            for _, key in ipairs({"queue_on_teleport", "queueonteleport", "queue_on_tp"}) do
                if type(t[key]) == "function" then return t[key] end
            end
        end
    end
    return nil
end
State.AutoTrader.BuildCompactTeleportBotDb = function()
    local rows = {}
    for fingerprint, record in pairs(State.AutoTrader.BotIconDb.icons or {}) do table.insert(rows, {fingerprint = fingerprint, record = record}) end
    table.sort(rows, function(a, b)
        local ag = State.AutoTrader.BotIconJobCount(a.record.strictGoldBotJobs)
        local bg = State.AutoTrader.BotIconJobCount(b.record.strictGoldBotJobs)
        if ag ~= bg then return ag > bg end
        return (tonumber(a.record.lastSeen) or 0) > (tonumber(b.record.lastSeen) or 0)
    end)
    local icons = {}
    local function compactJobs(source)
        local jobs = {}
        for jobId, stamp in pairs(type(source) == "table" and source or {}) do table.insert(jobs, {id = jobId, stamp = tonumber(stamp) or 0}) end
        table.sort(jobs, function(a, b) return a.stamp > b.stamp end)
        local out = {}
        for index, row in ipairs(jobs) do
            if index > CONFIG.AutoTraderBootstrapBotDbJobsPerIcon then break end
            out[row.id] = row.stamp
        end
        return out
    end
    for index, row in ipairs(rows) do
        if index > CONFIG.AutoTraderBootstrapBotDbMaxIcons then break end
        local r = row.record or {}
        icons[row.fingerprint] = {
            strictGoldBotJobs = compactJobs(r.strictGoldBotJobs), strictGoldBotSightings = tonumber(r.strictGoldBotSightings) or 0,
            -- v19 gold and older evidence are retained only for backwards-compatible diagnostics
            goldBotJobs = compactJobs(r.goldBotJobs), goldBotSightings = tonumber(r.goldBotSightings) or 0,
            botEvidence = tonumber(r.botEvidence) or 0, humanEvidence = tonumber(r.humanEvidence) or 0,
            botJobs = compactJobs(r.botJobs), humanJobs = compactJobs(r.humanJobs),
            botPlayerSightings = tonumber(r.botPlayerSightings) or 0, humanPlayerSightings = tonumber(r.humanPlayerSightings) or 0,
            sampleUserId = tonumber(r.sampleUserId), sampleName = r.sampleName,
            firstSeen = tonumber(r.firstSeen) or 0, lastSeen = tonumber(r.lastSeen) or 0,
        }
    end
    return {version = 4, icons = icons}
end
State.AutoTrader.RefreshTeleportScriptLkg = function()
    local ok, response, source = fetchStaticTextCompat(CONFIG.AutoTraderTeleportScriptUrl, {["Cache-Control"]="no-cache"}, CONFIG.AutoTraderHttpTimeoutSeconds)
    if not ok or type(response) ~= "table" or response.Success ~= true or type(response.Body) ~= "string" then
        State.AutoTrader.TeleportScriptIntegrity = "remote_unavailable"
        return false, tostring(response)
    end
    local valid, detail = verifyDistributionSource(response.Body)
    if not valid then
        State.AutoTrader.TeleportScriptIntegrity = "hash_mismatch"
        State.AutoTrader.Log("teleport_script_integrity_rejected", {source=source, reason=detail, bytes=#response.Body})
        return false, detail
    end
    local wrote, writeErr = HARDEN.atomicWriteTextFileBestEffort(State.AutoTrader.TeleportScriptLkgFile, response.Body)
    if wrote then
        State.AutoTrader.TeleportScriptLkgVerifiedAt = os.time()
        State.AutoTrader.TeleportScriptIntegrity = "verified_live_and_lkg"
    else
        State.AutoTrader.TeleportScriptIntegrity = "verified_live_lkg_write_failed"
    end
    return true, writeErr
end
HARDEN.bootstrapShaCode = [[
local K={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}
local function S(m)
 if type(m)~='string' or type(bit32)~='table' then return nil end
 local B,X,N,R,Q=bit32.band,bit32.bxor,bit32.bnot,bit32.rshift,bit32.rrotate
 local h0,h1,h2,h3,h4,h5,h6,h7=0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19
 local bc=0;local yt=os.clock();local function Y()bc=bc+1;if bc>=64 and os.clock()-yt>=.003 then bc=0;task.wait();yt=os.clock() end end
 local function P(s,o)
  local w={}
  for i=0,15 do local j=o+i*4;local a,b,c,d=string.byte(s,j,j+3);if d==nil then return false end;w[i]=a*16777216+b*65536+c*256+d end
  for i=16,63 do local a=X(Q(w[i-15],7),Q(w[i-15],18),R(w[i-15],3));local z=X(Q(w[i-2],17),Q(w[i-2],19),R(w[i-2],10));w[i]=B(w[i-16]+a+w[i-7]+z,0xffffffff) end
  local a,b,c,d,e,f,g,h=h0,h1,h2,h3,h4,h5,h6,h7
  for i=0,63 do local s1=X(Q(e,6),Q(e,11),Q(e,25));local ch=X(B(e,f),B(N(e),g));local t1=B(h+s1+ch+K[i+1]+w[i],0xffffffff);local s0=X(Q(a,2),Q(a,13),Q(a,22));local maj=X(B(a,b),B(a,c),B(b,c));local t2=B(s0+maj,0xffffffff);h,g,f,e,d,c,b,a=g,f,e,B(d+t1,0xffffffff),c,b,a,B(t1+t2,0xffffffff) end
  h0,h1,h2,h3,h4,h5,h6,h7=B(h0+a,0xffffffff),B(h1+b,0xffffffff),B(h2+c,0xffffffff),B(h3+d,0xffffffff),B(h4+e,0xffffffff),B(h5+f,0xffffffff),B(h6+g,0xffffffff),B(h7+h,0xffffffff);Y();return true
 end
 local n=#m;local q=n-(n%64);for o=1,q,64 do if not P(m,o) then return nil end end
 local L=n*8;local hi=math.floor(L/4294967296);local lo=L%4294967296
 local function U(v)return string.char(B(R(v,24),255),B(R(v,16),255),B(R(v,8),255),B(v,255))end
 local t=string.sub(m,q+1)..string.char(128);t=t..string.rep('\0',(56-(#t%64))%64)..U(hi)..U(lo);for o=1,#t,64 do if not P(t,o) then return nil end end
 return string.format('%08x%08x%08x%08x%08x%08x%08x%08x',h0,h1,h2,h3,h4,h5,h6,h7)
end
]]
State.AutoTrader.BuildTeleportBootstrapCode = function(reason, includeBotDb)
    State.AutoTrader.TeleportBootstrapSerial += 1
    local bootstrapId = State.AutoTrader.ControllerEpoch .. "-" .. tostring(State.AutoTrader.TeleportBootstrapSerial) .. "-" .. tostring(os.time())
    State.AutoTrader.LastTeleportBootstrapId = bootstrapId
    local payload = {
        version = 2,
        bootstrapId = bootstrapId,
        issuedAtUnix = os.time(),
        issuedOrder = os.time() * 100000 + State.AutoTrader.TeleportBootstrapSerial,
        controllerVersion = CONTROLLER_VERSION,
        expectedNormalizedSha256 = HARDEN.distributionNormalizedSha256,
        reason = tostring(reason or "teleport"),
        preferences = {
            automation = State.AutoTrader.Preferences.automation == true,
            ignoreFriends = State.AutoTrader.Preferences.ignoreFriends == true,
            openingAnchor = State.AutoTrader.Preferences.openingAnchor == true,
            preferDuplicates = State.AutoTrader.Preferences.preferDuplicates == true,
            unknownTheirZero = State.AutoTrader.Preferences.unknownTheirZero == true,
            winPreset = State.AutoTrader.Preferences.winPreset,
            reserves = State.AutoTrader.Preferences.reserves,
            panelPosition = State.AutoTrader.Preferences.panelPosition,
        },
        recentJobs = State.AutoTrader.RecentJobs,
        botDb = includeBotDb == false and nil or State.AutoTrader.BuildCompactTeleportBotDb(),
    }
    local ok, encoded = pcall(function() return HttpService:JSONEncode(payload) end)
    if not ok then return nil, tostring(encoded) end
    local quotedJson = string.format("%q", encoded)
    local quotedUrl = string.format("%q", CONFIG.AutoTraderTeleportScriptUrl)
    local quotedKey = string.format("%q", State.AutoTrader.TeleportBootstrapKey)
    local quotedLkg = string.format("%q", State.AutoTrader.TeleportScriptLkgFile)
    local quotedVersion = string.format("%q", CONTROLLER_VERSION)
    local quotedHash = string.format("%q", HARDEN.distributionNormalizedSha256)
    local quotedSentinel = string.format("%q", '__BUILD_SHA256_PLACEHOLDER__')
    local maxAttempts = tostring(math.max(1, math.floor(CONFIG.AutoTraderBootstrapMaxAttempts)))
    local initialRetry = tostring(math.max(0.5, CONFIG.AutoTraderBootstrapInitialRetrySeconds))
    local maxRetry = tostring(math.max(CONFIG.AutoTraderBootstrapInitialRetrySeconds, CONFIG.AutoTraderBootstrapMaxRetrySeconds))
    local httpAttemptTimeout = tostring(math.max(1, CONFIG.AutoTraderBootstrapHttpAttemptTimeoutSeconds))
    local executionTimeout = tostring(math.max(1, CONFIG.AutoTraderBootstrapExecutionTimeoutSeconds))
    local fileTimeout = tostring(math.max(0.5, CONFIG.AutoTraderExecutorFileTimeoutSeconds))
    return table.concat({
        "local H=game:GetService('HttpService')",
        "local E=(getgenv and getgenv()) or _G",
        "local PLS=game:GetService('Players'); local D=os.clock()+60; while (not game:IsLoaded() or not PLS.LocalPlayer) and os.clock()<D do task.wait(.1) end; if not game:IsLoaded() or not PLS.LocalPlayer then warn('[SV bootstrap] destination did not finish loading inside startup window'); return end; local PG=PLS.LocalPlayer:FindFirstChildOfClass('PlayerGui') or PLS.LocalPlayer:WaitForChild('PlayerGui',20); if not PG then warn('[SV bootstrap] destination PlayerGui unavailable after load'); return end; task.wait(1.5)",
        "local B=H:JSONDecode(" .. quotedJson .. ")",
        "local T=E.__SV_AUTO_TRADER_BOOTSTRAP_IDS or {}; local A=T.latest; if type(A)=='table' and tonumber(A.order or 0)>tonumber(B.issuedOrder or 0) then return end; if type(A)=='table' and A.id==B.bootstrapId and A.started then return end; T.latest={id=B.bootstrapId,order=B.issuedOrder,issuedAt=B.issuedAtUnix,started=true}; E.__SV_AUTO_TRADER_BOOTSTRAP_IDS=T; _G.__SV_AUTO_TRADER_BOOTSTRAP_IDS=T",
        "E[" .. quotedKey .. "]=B; _G[" .. quotedKey .. "]=B",
        HARDEN.bootstrapShaCode,
        "local V=" .. quotedVersion .. "; local X=" .. quotedHash .. "; local P=" .. quotedSentinel,
        "local function C(b) if type(b)~='string' or #b<1000 or not string.find(b,V,1,true) then return false end; local n,c=string.gsub(b,'distributionNormalizedSha256 = \\\"[^\\\"]+\\\"','distributionNormalizedSha256 = \\\"'..P..'\\\"',1); return c==1 and S(n)==X end",
        "local L=" .. quotedLkg,
        "local IF=(isfile or E.isfile or E.is_file); local RF=(readfile or E.readfile or E.read_file); local WF=(writefile or E.writefile or E.write_file)",
        "local function R() local function q(n) local z={d=false,b=nil}; task.spawn(function() local ok,e=pcall(function() return IF and IF(n) and RF and RF(n) end); if ok then z.b=e end; z.d=true end); local x=os.clock()+" .. fileTimeout .. "; while not z.d and os.clock()<x do task.wait(.05) end; if z.d and C(z.b) then return z.b end end; return q(L) or q(L..'.bak') end",
        "local U=" .. quotedUrl,
        "local function F() local q={d=false,o=false,b=nil}; task.spawn(function() local o,b=pcall(function() return game:HttpGet(U) end); q.o=o;q.b=b;q.d=true end); local x=os.clock()+" .. httpAttemptTimeout .. "; while not q.d and os.clock()<x do task.wait(.1) end; if q.d and q.o and C(q.b) then if WF then task.spawn(function() pcall(WF,L,q.b) end) end; return q.b end end",
        "local b=R(); local d=" .. initialRetry .. "; local i=0; while not b and i<" .. maxAttempts .. " do i=i+1; b=F(); if not b and i<" .. maxAttempts .. " then task.wait(d); d=math.min(" .. maxRetry .. ",d*2) end end; if not b then warn('[SV bootstrap] no verified script available for '..tostring(B.bootstrapId)); return end",
        "local LS=nil; if type(loadstring)=='function' then LS=loadstring elseif type(E.loadstring)=='function' then LS=E.loadstring elseif type(load)=='function' then LS=load elseif type(E.load)=='function' then LS=E.load end; if type(LS)~='function' then warn('[SV bootstrap] no compatible loadstring/load compiler is exposed after teleport; verified source was not executed'); return end; local f,e=LS(b); if not f then warn('[SV bootstrap] verified script failed to compile:',e); return end",
        "local q={d=false,o=false,e=nil}; task.spawn(function() local o,e=pcall(f); q.o=o;q.e=e;q.d=true end); local x=os.clock()+" .. executionTimeout .. "; while not q.d and os.clock()<x do task.wait(.2) end; if not q.d then warn('[SV bootstrap] verified controller execution exceeded startup deadline; not launching a duplicate'); return end; if not q.o then warn('[SV bootstrap] verified controller execution failed:',q.e) end",
    }, ";\n")
end
State.AutoTrader.QueueTeleportScript = function(reason)
    if State.AutoTrader.TeleportQueued then return true, State.AutoTrader.TeleportQueueOutcome end
    local queueFunction = State.AutoTrader.GetQueueOnTeleport()
    if type(queueFunction) ~= "function" then
        State.AutoTrader.Log("queue_on_teleport_unavailable", {reason = reason})
        return false, "queue_on_teleport unavailable"
    end
    -- File persistence is idempotent/best-effort. The queue call itself is not:
    -- if our wait times out we intentionally do NOT issue a second queue call.
    task.spawn(function()
        State.AutoTrader.SaveRecentJobs()
        State.AutoTrader.SaveBotIconDb(true)
        State.AutoTrader.FlushTargetStats()
        State.AutoTrader.SavePreferences()
        State.AutoTrader.FlushDiskDebugLog()
        -- Do not fetch/hash the controller here. Teleport handoff is latency-sensitive,
        -- and the destination bootstrap can use the already-verified LKG or fetch after load.
    end)
    local code, buildError = State.AutoTrader.BuildTeleportBootstrapCode(reason, true)
    if not code then return false, buildError end
    local minimalFallback = false
    if #code > 180000 then
        local smaller, smallerError = State.AutoTrader.BuildTeleportBootstrapCode(reason, false)
        if not smaller then return false, smallerError end
        code = smaller
        minimalFallback = true
    end
    State.AutoTrader.TeleportQueued = true -- reserve the single non-idempotent attempt before invoking executor code
    State.AutoTrader.LastTeleportReason = tostring(reason or "teleport")
    local ok, err, operation = waitForExternalWithDeadline("queue_on_teleport", 2.5, function() return queueFunction(code) end)
    if ok then
        State.AutoTrader.TeleportQueueOutcome = "confirmed"
        State.AutoTrader.Log("teleport_script_queued", {reason=reason, minimalFallback=minimalFallback, bootstrapId=State.AutoTrader.LastTeleportBootstrapId})
        return true, "confirmed"
    end
    if operation and operation.timedOut then
        State.AutoTrader.TeleportQueueOutcome = "unknown_timeout_no_retry"
        State.AutoTrader.Log("teleport_script_queue_outcome_unknown", {reason=reason, error=err, bootstrapId=State.AutoTrader.LastTeleportBootstrapId})
        return true, "unknown_timeout_no_retry"
    end
    State.AutoTrader.TeleportQueued = false
    State.AutoTrader.TeleportQueueOutcome = "failed"
    return false, tostring(err)
end
State.AutoTrader.HttpGetBody = function(url)
    if type(httpRequest) == "function" then
        local ok, response = boundedHttpRequest(
            {Url = url, Method = "GET", Headers = { ["Cache-Control"] = "no-cache" }},
            CONFIG.AutoTraderHttpTimeoutSeconds
        )
        if ok and type(response) == "table" and tonumber(response.StatusCode or response.Status) == 200 then
            return response.Body or response.body
        end
    end
    local ok, body = boundedGameHttpGet(url, CONFIG.AutoTraderHttpTimeoutSeconds)
    if ok and type(body) == "string" then return body end
    return nil
end
State.AutoTrader.InspectServerListBody = function(body)
    local summary = {
        ok = false, rows = 0, playingRows = 0, tokenRows = 0, tokens = 0,
        tokenCoverage = 0, bodyBytes = 0, degraded = false, decodeError = nil,
    }
    if type(body) ~= "string" or body == "" then
        summary.decodeError = "empty body"
        return nil, summary
    end
    summary.bodyBytes = #body
    if #body > CONFIG.ServerListJsonMaxBytes then
        summary.decodeError = "body exceeded configured maximum"
        return nil, summary
    end
    local okDecode, decoded = pcall(function() return HttpService:JSONDecode(body) end)
    if not okDecode or type(decoded) ~= "table" then
        summary.decodeError = "JSON decode failed"
        return nil, summary
    end
    local data = type(decoded.data) == "table" and decoded.data or {}
    summary.ok = true
    summary.rows = #data
    for _, server in ipairs(data) do
        local playing = tonumber(server.playing) or 0
        if playing > 0 then summary.playingRows += 1 end
        local tokens = type(server.playerTokens) == "table" and server.playerTokens or nil
        if tokens and #tokens > 0 then
            summary.tokenRows += 1
            summary.tokens += #tokens
        end
    end
    summary.tokenCoverage = summary.playingRows > 0 and summary.tokenRows / summary.playingRows or 1
    -- A page containing active servers but little/no playerToken coverage is
    -- structurally valid JSON yet semantically degraded for avatar filtering.
    -- Roblox normally exposes tokens on the active rows here; requiring 50%
    -- coverage also catches partially stripped/proxied representations.
    summary.degraded = summary.playingRows >= 5 and summary.tokenCoverage < 0.50
    return decoded, summary
end

State.AutoTrader.FetchServerListPage = function(url)
    local result = {
        selectedTransport = nil,
        gameHttpGet = {attempted = false, ok = false, rows = 0, playingRows = 0, tokenRows = 0, tokens = 0, tokenCoverage = 0, bodyBytes = 0, degraded = false, error = nil},
        executor = {attempted = false, ok = false, status = nil, rows = 0, playingRows = 0, tokenRows = 0, tokens = 0, tokenCoverage = 0, bodyBytes = 0, degraded = false, retryAfterSeconds = nil, error = nil},
    }
    local fallbackDecoded, fallbackSummary = nil, nil

    -- Prefer Roblox's in-client GET path for this endpoint. In live testing some
    -- executor request transports returned HTTP 200 server lists with playerTokens
    -- stripped while game:HttpGet/browser responses still contained them.
    result.gameHttpGet.attempted = true
    local okGame, gameBody = boundedGameHttpGet(url, CONFIG.AutoTraderHttpTimeoutSeconds)
    if okGame and type(gameBody) == "string" then
        local decoded, summary = State.AutoTrader.InspectServerListBody(gameBody)
        for key, value in pairs(summary) do if result.gameHttpGet[key] ~= nil then result.gameHttpGet[key] = value end end
        result.gameHttpGet.ok = summary.ok == true
        if decoded and not summary.degraded then
            result.selectedTransport = "game:HttpGet"
            return decoded, result
        end
        if decoded then fallbackDecoded, fallbackSummary = decoded, summary end
        if not decoded then result.gameHttpGet.error = summary.decodeError end
    else
        result.gameHttpGet.error = tostring(gameBody or "game:HttpGet failed")
    end

    -- If game:HttpGet fails OR gives a tokenless active-server page, try executor
    -- HTTP. A 200 response is accepted only after the same semantic token check.
    if type(httpRequest) == "function" then
        result.executor.attempted = true
        local okReq, rawResponse = boundedHttpRequest({
            Url = url,
            URL = url,
            Method = "GET",
            Headers = { ["Cache-Control"] = "no-cache", ["Accept"] = "application/json" },
        }, CONFIG.AutoTraderHttpTimeoutSeconds)
        if okReq then
            local normalized = normalizeHttpResponse(rawResponse)
            result.executor.status = normalized and normalized.StatusCode or nil
            if normalized and type(normalized.Headers) == "table" then
                for key, value in pairs(normalized.Headers) do
                    if string.lower(tostring(key)) == "retry-after" then
                        result.executor.retryAfterSeconds = tonumber(value)
                        break
                    end
                end
            end
            if normalized and normalized.Success and type(normalized.Body) == "string" then
                local decoded, summary = State.AutoTrader.InspectServerListBody(normalized.Body)
                for key, value in pairs(summary) do if result.executor[key] ~= nil then result.executor[key] = value end end
                result.executor.ok = summary.ok == true
                if decoded and not summary.degraded then
                    result.selectedTransport = "executor_request"
                    return decoded, result
                end
                if not fallbackDecoded and decoded then fallbackDecoded, fallbackSummary = decoded, summary end
                if not decoded then result.executor.error = summary.decodeError end
            else
                result.executor.error = normalized and ("HTTP " .. tostring(normalized.StatusCode or "?")) or "unsupported response shape"
            end
        else
            result.executor.error = tostring(rawResponse)
        end
    else
        result.executor.error = "request(options) unavailable"
    end

    -- Preserve ordinary server hopping even if both transports return a degraded
    -- tokenless representation. The caller may still use JobIds as UNKNOWN servers.
    if fallbackDecoded then
        result.selectedTransport = fallbackSummary and fallbackSummary.degraded and "degraded_unknown_fallback" or "fallback"
        return fallbackDecoded, result
    end
    return nil, result
end

State.AutoTrader.FetchPublicServers = function(maxPages)
    State.AutoTrader.PruneRecentJobs()
    local rows = {}
    local cursor = nil
    local diagnostics = {
        pagesRequested = math.max(1, tonumber(maxPages) or CONFIG.AutoTraderServerListPages),
        pagesAttempted = 0,
        pagesSucceeded = 0,
        rawServerRows = 0,
        usableRows = 0,
        rowsWithPlayerTokens = 0,
        totalPlayerTokens = 0,
        tokenlessActivePages = 0,
        selectedGameHttpGetPages = 0,
        selectedExecutorPages = 0,
        selectedDegradedPages = 0,
        transportPages = {},
        lastError = nil,
    }
    for pageIndex = 1, diagnostics.pagesRequested do
        diagnostics.pagesAttempted += 1
        local url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId)
            .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true"
        if cursor and cursor ~= "" then url = url .. "&cursor=" .. HttpService:UrlEncode(cursor) end
        local decoded, transport = State.AutoTrader.FetchServerListPage(url)
        transport.page = pageIndex
        table.insert(diagnostics.transportPages, transport)
        if not decoded then
            diagnostics.lastError = "server list HTTP/JSON failed on both transports"
            break
        end
        diagnostics.pagesSucceeded += 1
        if transport.selectedTransport == "game:HttpGet" then diagnostics.selectedGameHttpGetPages += 1
        elseif transport.selectedTransport == "executor_request" then diagnostics.selectedExecutorPages += 1
        else diagnostics.selectedDegradedPages += 1 end

        local data = type(decoded.data) == "table" and decoded.data or {}
        diagnostics.rawServerRows += #data
        local pagePlayingRows, pageTokenRows = 0, 0
        for _, server in ipairs(data) do
            local playing = tonumber(server.playing)
            local maxPlayers = tonumber(server.maxPlayers)
            local jobId = server.id
            if type(jobId) == "string" and jobId ~= "" and playing and maxPlayers and maxPlayers > 0 then
                if playing > 0 then pagePlayingRows += 1 end
                local tokens = type(server.playerTokens) == "table" and server.playerTokens or {}
                if #tokens > 0 then
                    pageTokenRows += 1
                    diagnostics.rowsWithPlayerTokens += 1
                    diagnostics.totalPlayerTokens += #tokens
                end
                table.insert(rows, {
                    id = jobId,
                    playing = playing,
                    maxPlayers = maxPlayers,
                    occupancy = playing / maxPlayers,
                    playerTokens = tokens,
                    ping = tonumber(server.ping),
                    fps = tonumber(server.fps),
                })
                diagnostics.usableRows += 1
            end
        end
        if pagePlayingRows > 0 and pageTokenRows == 0 then diagnostics.tokenlessActivePages += 1 end
        cursor = decoded.nextPageCursor
        if not cursor or cursor == "" then break end
        -- v27: page 1 normally contains far more candidates than one hop needs.
        -- Do not spend another server-list request unless the first page was thin.
        if pageIndex == 1
            and diagnostics.usableRows >= CONFIG.AutoTraderServerFirstPageUsableTarget then
            diagnostics.stoppedAfterFirstPage = true
            diagnostics.stoppedAfterFirstPageReason = "page 1 supplied " .. tostring(diagnostics.usableRows)
                .. " usable rows (target " .. tostring(CONFIG.AutoTraderServerFirstPageUsableTarget) .. ")"
            break
        end
    end
    return rows, diagnostics
end
State.AutoTrader.CanonicalThumbnailFingerprint = function(imageUrl)
    if type(imageUrl) ~= "string" or imageUrl == "" then return nil end
    local hash = State.AutoTrader.ExtractAvatarHeadshotHash(imageUrl)
    if hash then return hash end
    -- Keep a fallback path for unexpected Roblox thumbnail URL shapes, but only
    -- exact 32-hex AvatarHeadshot hashes participate in cross-server reputation.
    local value = string.lower(imageUrl)
    value = value:match("^([^?]+)") or value
    local path = value:match("^https?://[^/]+/(.+)$")
    return path and ("fallback:" .. path) or value
end
State.AutoTrader.ResolveCurrentPlayerFingerprints = function()
    local players = {}
    local ids = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent and tonumber(player.UserId) and player.UserId > 0 then
            table.insert(players, player)
            table.insert(ids, tostring(player.UserId))
        end
    end
    local currentMaxPlayers = math.max(#players, 1)
    pcall(function()
        local reported = tonumber(Players.MaxPlayers)
        if reported and reported > 0 then currentMaxPlayers = reported end
    end)
    local result = {
        id = game.JobId,
        playing = #players,
        maxPlayers = currentMaxPlayers,
        occupancy = #players / math.max(1, currentMaxPlayers),
        previewFingerprints = {},
        previewThumbnailUrls = {},
        fingerprintByUserId = {},
        playerNameByUserId = {},
    }
    if #ids == 0 then return false, result, "no remote players in current server" end
    local completed = 0
    for first = 1, #ids, 100 do
        local chunk = {}
        for index = first, math.min(#ids, first + 99) do table.insert(chunk, ids[index]) end
        local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
            .. table.concat(chunk, ",")
            .. "&size=150x150&format=Png&isCircular=false"
        local body = State.AutoTrader.HttpGetBody(url)
        if body then
            local okDecode, decoded = pcall(function() return HttpService:JSONDecode(body) end)
            if okDecode and type(decoded) == "table" and type(decoded.data) == "table" then
                for _, item in ipairs(decoded.data) do
                    local userId = tonumber(item.targetId or item.targetID or item.userId)
                    local imageUrl = item.imageUrl or item.imageURL
                    local fingerprint = State.AutoTrader.CanonicalThumbnailFingerprint(imageUrl)
                    if userId and fingerprint and (item.state == nil or tostring(item.state) == "Completed") then
                        result.fingerprintByUserId[userId] = fingerprint
                        table.insert(result.previewFingerprints, fingerprint)
                        table.insert(result.previewThumbnailUrls, imageUrl)
                        completed += 1
                    end
                end
            end
        end
    end
    for _, player in ipairs(players) do result.playerNameByUserId[player.UserId] = player.Name end
    return completed > 0, result, completed > 0 and nil or "current-player headshot lookup returned no completed thumbnails"
end

State.AutoTrader.AddSoftHumanIconEvidence = function()
    return false
end
State.AutoTrader.LearnHumanFingerprintForPlayer = function()
    -- v21: trade/inventory behavior never modifies bot identity knowledge.
    return false
end
State.AutoTrader.GetPlayerBotRisk = function(player)
    if not player then return 0, nil end
    local screen = State.AutoTrader.CurrentServerAvatarScreen
    local info = screen and screen.jobId == game.JobId and screen.botByUserId
        and screen.botByUserId[player.UserId] or nil
    if not info then return 0, nil end
    return tonumber(info.displayRisk) or 0, info
end

State.AutoTrader.ResolveServerPreviewFingerprints = function(servers)
    local diagnostics = {
        servers = #(servers or {}), tokens = 0, batches = 0, batchesSucceeded = 0,
        completed = 0, failedStates = 0, unmapped = 0, lastError = nil,
    }
    if type(httpRequest) ~= "function" then return false, "request(options) unavailable", diagnostics end
    local payload, requestMap = {}, {}
    for _, server in ipairs(servers or {}) do
        server.previewFingerprints = {}
        server.previewThumbnailUrls = {}
        server.previewTokenCount = 0
        for tokenIndex, token in ipairs(server.playerTokens or {}) do
            if type(token) == "string" and token ~= "" then
                local requestId = tostring(server.id) .. "|" .. tostring(tokenIndex)
                requestMap[requestId] = {server = server, tokenIndex = tokenIndex}
                table.insert(payload, {
                    requestId = requestId,
                    type = "AvatarHeadShot",
                    targetId = 0,
                    token = token,
                    format = "Png",
                    size = "150x150",
                })
                server.previewTokenCount += 1
                diagnostics.tokens += 1
            end
        end
    end
    if #payload == 0 then
        local reason = #(servers or {}) == 0 and "no candidate servers supplied" or "candidate server rows contained no playerTokens"
        diagnostics.lastError = reason
        return false, reason, diagnostics
    end
    local consecutiveFailures = 0
    for first = 1, #payload, CONFIG.AutoTraderThumbnailBatchSize do
        diagnostics.batches += 1
        local chunk = {}
        for index = first, math.min(#payload, first + CONFIG.AutoTraderThumbnailBatchSize - 1) do
            table.insert(chunk, payload[index])
        end
        local okBody, encoded = pcall(function() return HttpService:JSONEncode(chunk) end)
        if not okBody then
            diagnostics.lastError = tostring(encoded)
            return diagnostics.completed > 0, tostring(encoded), diagnostics
        end
        local okRequest, response = boundedHttpRequest({
            Url = "https://thumbnails.roblox.com/v1/batch",
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json", ["Accept"] = "application/json" },
            Body = encoded,
        }, CONFIG.AutoTraderHttpTimeoutSeconds)
        if okRequest and type(response) == "table"
            and tonumber(response.StatusCode or response.Status) == 200 then
            consecutiveFailures = 0
            diagnostics.batchesSucceeded += 1
            local body = response.Body or response.body
            local okDecode, decoded = pcall(function() return HttpService:JSONDecode(body or "") end)
            if okDecode and type(decoded) == "table" and type(decoded.data) == "table" then
                for itemIndex, item in ipairs(decoded.data) do
                    local mapping = requestMap[tostring(item.requestId)]
                    -- requestId should round-trip. If an executor/API variant omits
                    -- it but preserves batch order, use the corresponding request
                    -- as a conservative fallback instead of discarding all previews.
                    if not mapping then
                        local original = chunk[itemIndex]
                        mapping = original and requestMap[tostring(original.requestId)] or nil
                    end
                    local imageUrl = item.imageUrl or item.imageURL
                    local fingerprint = State.AutoTrader.CanonicalThumbnailFingerprint(imageUrl)
                    local completedState = item.state == nil or string.lower(tostring(item.state)) == "completed"
                    if mapping and fingerprint and completedState then
                        local server = mapping.server
                        table.insert(server.previewFingerprints, fingerprint)
                        table.insert(server.previewThumbnailUrls, imageUrl)
                        diagnostics.completed += 1
                    elseif not mapping then
                        diagnostics.unmapped += 1
                    else
                        diagnostics.failedStates += 1
                    end
                end
            else
                diagnostics.lastError = "thumbnail batch JSON decode failed"
            end
        else
            consecutiveFailures += 1
            diagnostics.lastError = okRequest and ("thumbnail HTTP " .. tostring(response and (response.StatusCode or response.Status)))
                or ("thumbnail request failed: " .. tostring(response))
            if consecutiveFailures >= 2 then
                diagnostics.lastError = tostring(diagnostics.lastError) .. " · stopped after 2 consecutive batch failures"
                break
            end
        end
        if first + CONFIG.AutoTraderThumbnailBatchSize <= #payload then task.wait(0.05) end
    end
    diagnostics.completed = diagnostics.completed
    local ok = diagnostics.completed > 0
    return ok, ok and nil or (diagnostics.lastError or "thumbnail batch returned no completed previews"), diagnostics
end
State.AutoTrader.BuildPreviewScanContext = function(servers)
    local context = {serverCount = 0, hashJobCounts = {}, hashSightings = {}, topHashes = {}}
    for _, server in ipairs(servers or {}) do
        local fingerprints = server.previewFingerprints or {}
        if #fingerprints > 0 then
            context.serverCount += 1
            local seenThisJob = {}
            for _, fingerprint in ipairs(fingerprints) do
                context.hashSightings[fingerprint] = (context.hashSightings[fingerprint] or 0) + 1
                if not seenThisJob[fingerprint] then
                    seenThisJob[fingerprint] = true
                    context.hashJobCounts[fingerprint] = (context.hashJobCounts[fingerprint] or 0) + 1
                end
            end
        end
    end
    for fingerprint, jobs in pairs(context.hashJobCounts) do
        table.insert(context.topHashes, {
            fingerprint = fingerprint,
            jobs = jobs,
            sightings = context.hashSightings[fingerprint] or 0,
            ratio = context.serverCount > 0 and jobs / context.serverCount or 0,
        })
    end
    table.sort(context.topHashes, function(a, b)
        if a.jobs ~= b.jobs then return a.jobs > b.jobs end
        return a.sightings > b.sightings
    end)
    while #context.topHashes > 30 do table.remove(context.topHashes) end
    return context
end
State.AutoTrader.ClassifyServerPreview = function(server, scanContext)
    local fingerprints = server.previewFingerprints or {}
    local observed, known, confirmed, goldMatched = 0, 0, 0, 0
    local classes, frequencies = {}, {}
    for _, fingerprint in ipairs(fingerprints) do
        frequencies[fingerprint] = (frequencies[fingerprint] or 0) + 1
        local class, confidence, record = State.AutoTrader.GetBotIconClass(fingerprint)
        local goldJobs = record and State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs) or 0
        classes[fingerprint] = {class = class, confidence = confidence, goldJobs = goldJobs}
        if class ~= "unknown" then goldMatched += 1 end
        if class == "observed_bot" then observed += 1
        elseif class == "known_bot" then known += 1
        elseif class == "confirmed_bot" then confirmed += 1 end
    end
    local sample = #fingerprints
    local goldMatchRatio = sample > 0 and goldMatched / sample or 0
    local previewTrusted = sample >= CONFIG.AutoTraderGoldBotMinPreviewSamples
    local hardReject = previewTrusted and goldMatchRatio >= CONFIG.AutoTraderGoldBotRejectRatio
    local suspicious = previewTrusted and goldMatchRatio >= CONFIG.AutoTraderGoldBotWarnRatio
    -- Unknown previews are neutral. The strict hash DB is an optimization for
    -- server SELECTION, never a prerequisite for leaving an exhausted server.
    local safeEnough = not hardReject
    local safeConfidence = previewTrusted and (1 - goldMatchRatio) or nil
    local occupancy = tonumber(server.occupancy)
        or ((tonumber(server.playing) or 0) / math.max(1, tonumber(server.maxPlayers) or 1))
    local occupancyFit = 1 - math.min(1, math.abs(occupancy - 0.86) / 0.50)
    local score = (tonumber(server.playing) or 0) * 8 + occupancyFit * 20 - goldMatchRatio * 400 + math.min(sample, 5) * 0.5
    server.botPreview = {
        sample = sample, goldMatched = goldMatched, goldMatchRatio = goldMatchRatio,
        observed = observed, known = known, confirmed = confirmed,
        confirmedRatio = sample > 0 and confirmed / sample or 0,
        suspectRatio = sample > 0 and (observed + known + confirmed) / sample or 0,
        scanFrequentRatio = 0, maxScanJobs = 0, maxScanRatio = 0,
        hardReject = hardReject, suspicious = suspicious, structuralReject = false,
        botLikelihood = goldMatchRatio, safeConfidence = safeConfidence,
        previewTrusted = previewTrusted, safeEnough = safeEnough,
        topTwoRatio = 0, uniqueFingerprints = 0,
        frequencies = frequencies, score = score, classes = classes,
        filterSource = "strict_gold_hash_db_when_available_unknown_allowed",
    }
    return server.botPreview
end
State.AutoTrader.GetCurrentServerPreview = function(rows)
    for _, server in ipairs(rows or {}) do
        if server.id == game.JobId then return server end
    end
    return nil
end
State.AutoTrader.GetInventorySubsystemHealth = function()
    local remoteState = State.Profile and State.Profile.remoteTotals
    local localStamp = remoteState and remoteState.lastSuccessByUserId
        and remoteState.lastSuccessByUserId[LocalPlayer.UserId] or nil
    local localFresh = localStamp ~= nil
        and os.clock() - localStamp <= math.max(30, CONFIG.RemoteStaleSeconds * 2)
    local remote = safeFindPath(
        ReplicatedStorage,
        {"Remotes", "Extras", "GetFullInventory"}
    )
    return {
        healthy = SupremeDatabase ~= nil
            and remote ~= nil
            and remote:IsA("RemoteFunction")
            and localFresh,
        supremeLoaded = SupremeDatabase ~= nil,
        remotePresent = remote ~= nil and remote:IsA("RemoteFunction"),
        localInventoryFresh = localFresh,
        localInventoryAge = localStamp and (os.clock() - localStamp) or nil,
    }
end
State.AutoTrader.GetFingerprintConcentration = function(frequencies, sample)
    local first, second = 0, 0
    local unique = 0
    for _, amount in pairs(type(frequencies) == "table" and frequencies or {}) do
        amount = math.max(0, tonumber(amount) or 0)
        if amount > 0 then
            unique += 1
            if amount >= first then
                second = first
                first = amount
            elseif amount > second then
                second = amount
            end
        end
    end
    sample = math.max(0, tonumber(sample) or 0)
    local topTwo = first + second
    return {
        first = first,
        second = second,
        topTwo = topTwo,
        topTwoRatio = sample > 0 and topTwo / sample or 0,
        unique = unique,
    }
end
State.AutoTrader.ResolveUserIdsFingerprints = function(userIds)
    local result = {fingerprintByUserId = {}, imageByUserId = {}}
    if type(userIds) ~= "table" or #userIds == 0 then return false, result, "no user ids" end
    local completed = 0
    for first = 1, #userIds, 100 do
        local chunk = {}
        for index = first, math.min(#userIds, first + 99) do table.insert(chunk, tostring(userIds[index])) end
        local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds="
            .. table.concat(chunk, ",") .. "&size=150x150&format=Png&isCircular=false"
        local body = State.AutoTrader.HttpGetBody(url)
        if body then
            local okDecode, decoded = pcall(function() return HttpService:JSONDecode(body) end)
            if okDecode and type(decoded) == "table" and type(decoded.data) == "table" then
                for _, item in ipairs(decoded.data) do
                    local userId = tonumber(item.targetId or item.targetID or item.userId)
                    local imageUrl = item.imageUrl or item.imageURL
                    local fingerprint = State.AutoTrader.CanonicalThumbnailFingerprint(imageUrl)
                    if userId and fingerprint and (item.state == nil or string.lower(tostring(item.state)) == "completed") then
                        result.fingerprintByUserId[userId] = fingerprint
                        result.imageByUserId[userId] = imageUrl
                        completed += 1
                    end
                end
            end
        end
    end
    return completed == #userIds, result, completed == #userIds and nil or ("resolved " .. tostring(completed) .. "/" .. tostring(#userIds) .. " certified headshots")
end

State.AutoTrader.MarkGoldCertificationRegular = function(reason, details)
    local c = State.AutoTrader.GoldBotCertification
    if type(c) ~= "table" or c.jobId ~= game.JobId then return false end
    if c.status == "certified_learned" then return false end
    c.status = "regular"
    c.reason = tostring(reason or "A remote player exposed sustained human-controlled MoveDirection; this JobId is permanently excluded from bot learning.")
    c.failedAt = os.clock()
    c.candidateFingerprintByUserId = nil
    c.candidateImageByUserId = nil
    c.candidatePreparedAt = 0
    c.certifiedUserIds = nil
    c.physicalSummaries = nil
    if type(details) == "table" then
        c.failedPlayer = details.name or c.failedPlayer
        c.failedUserId = details.userId or c.failedUserId
        c.moveDirectionViolation = details.moveDirectionViolation or c.moveDirectionViolation
    end
    -- Measure human-detection latency on the same time basis as the server hold, but
    -- anchor late joiners to their own firstSeenAt so a 30s-late join detected in 2s
    -- teaches ~2s, not ~32s.
    local timingAnchor = tonumber(c.windowStartedAt) or 0
    local failedTrack = c.players and c.players[tonumber(c.failedUserId)]
    if type(failedTrack) == "table" then
        timingAnchor = math.max(timingAnchor, tonumber(failedTrack.firstSeenAt) or 0)
    end
    if timingAnchor > 0 then
        c.humanDetectionSeconds = math.max(0, c.failedAt - timingAnchor)
        State.AutoTrader.RecordHumanDetectionTiming(c.humanDetectionSeconds, details)
    end
    State.AutoTrader.Log("gold_bot_certification_regular", details or {reason = c.reason})
    return true
end

State.AutoTrader.PrepareStrictGoldCandidate = function(certification)
    certification = certification or State.AutoTrader.GoldBotCertification
    if type(certification) ~= "table" or certification.status ~= "candidate" or type(certification.certifiedUserIds) ~= "table" then return false end
    local now = os.clock()
    if certification.candidateFingerprintByUserId then return true end
    if now - (tonumber(certification.lastHashAttemptAt) or 0) < CONFIG.AutoTraderGoldThumbnailRetrySeconds then return false end
    certification.lastHashAttemptAt = now
    local okThumb, resolved, reason = State.AutoTrader.ResolveUserIdsFingerprints(certification.certifiedUserIds)
    if not okThumb then
        certification.reason = "Physical candidate passed the MoveDirection + fixed-facing gate; waiting for every candidate avatar headshot: " .. tostring(reason)
        return false
    end
    certification.candidateFingerprintByUserId = resolved.fingerprintByUserId
    certification.candidateImageByUserId = resolved.imageByUserId
    certification.candidatePreparedAt = now
    certification.reason = "STRICT GOLD CANDIDATE staged. Continuing whole-JobId MoveDirection monitoring; hashes will be carried only at the actual normal teleport call and committed by the destination server."
    return true
end

State.AutoTrader.BuildStrictGoldTeleportCommitPayload = function()
    local c = State.AutoTrader.GoldBotCertification
    if type(c) ~= "table" or c.jobId ~= game.JobId or c.status ~= "candidate" then return nil end
    if type(c.certifiedUserIds) ~= "table" or type(c.candidateFingerprintByUserId) ~= "table" then return nil end
    local currentIds = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then table.insert(currentIds, player.UserId) end
    end
    table.sort(currentIds)
    local expected = table.clone(c.certifiedUserIds)
    table.sort(expected)
    if table.concat(currentIds, ",") ~= table.concat(expected, ",") then
        c.status = "observing"
        c.reason = "Membership changed before departure; preserving all per-player evidence and waiting only for the current membership to pass."
        c.certifiedUserIds = nil
        c.candidateFingerprintByUserId = nil
        c.candidateImageByUserId = nil
        c.candidatePreparedAt = 0
        return nil
    end
    for _, userId in ipairs(currentIds) do
        local track = c.players and c.players[userId]
        if type(track) ~= "table" or track.passed ~= true then return nil end
    end
    local grouped = {}
    for _, userId in ipairs(c.certifiedUserIds) do
        local fingerprint = State.AutoTrader.ExtractAvatarHeadshotHash(c.candidateFingerprintByUserId[userId])
            or c.candidateFingerprintByUserId[userId]
        if type(fingerprint) ~= "string" or #fingerprint ~= 32 then return nil end
        local row = grouped[fingerprint]
        if not row then
            row = {fingerprint = fingerprint, count = 0, sampleUserId = userId, sampleName = c.names and c.names[userId]}
            grouped[fingerprint] = row
        end
        row.count += 1
    end
    local rows = {}
    for _, row in pairs(grouped) do table.insert(rows, row) end
    table.sort(rows, function(a, b) return a.fingerprint < b.fingerprint end)
    return {
        version = 3,
        sourceJobId = game.JobId,
        certifiedPlayers = #c.certifiedUserIds,
        certifiedAt = c.certifiedAt,
        observeSeconds = tonumber(c.requiredObserveSeconds) or State.AutoTrader.GetGoldAdaptiveObserveSeconds(),
        observeSecondsCap = CONFIG.AutoTraderGoldObserveSeconds,
        humanTimingMaxSeconds = tonumber(State.AutoTrader.HumanDetectionTiming and State.AutoTrader.HumanDetectionTiming.maxSeconds) or 0,
        moveDirectionEpsilon = CONFIG.AutoTraderGoldMoveDirectionEpsilon,
        moveDirectionViolationMinSamples = CONFIG.AutoTraderGoldMoveDirectionViolationMinSamples,
        moveDirectionViolationMinSpanSeconds = CONFIG.AutoTraderGoldMoveDirectionViolationMinSpanSeconds,
        maxObservedMoveDirection = tonumber(c.maxObservedMoveDirection) or 0,
        fingerprints = rows,
    }
end

State.AutoTrader.ImportStrictGoldTeleportCommit = function(payload)
    if type(payload) ~= "table" or tonumber(payload.version) ~= 3 then return false end
    local sourceJobId = payload.sourceJobId
    if type(sourceJobId) ~= "string" or sourceJobId == "" or sourceJobId == game.JobId then return false end
    if math.max(0, tonumber(payload.certifiedPlayers) or 0) < CONFIG.AutoTraderGoldMinRemotePlayers then return false end
    if type(payload.fingerprints) ~= "table" or #payload.fingerprints == 0 or #payload.fingerprints > 50 then return false end
    local learned = 0
    for _, row in ipairs(payload.fingerprints) do
        if type(row) ~= "table" then return false end
        local fingerprint = State.AutoTrader.ExtractAvatarHeadshotHash(row.fingerprint) or row.fingerprint
        if type(fingerprint) ~= "string" or not fingerprint:match("^[0-9a-fA-F]+$") or #fingerprint ~= 32 then return false end
        local count = math.max(1, math.min(20, math.floor(tonumber(row.count) or 1)))
        if State.AutoTrader.AddStrictGoldBotIconEvidence(
            string.lower(fingerprint), sourceJobId, count, tonumber(row.sampleUserId), row.sampleName
        ) then
            learned += 1
        end
    end
    State.AutoTrader.SaveBotIconDb(true)
    State.AutoTrader.LastBotLearning = {
        jobId = sourceJobId, importedIntoJobId = game.JobId,
        action = "strict_gold_departure_commit_imported",
        source = "teleport_data_after_persistent_remote_movedirection_plus_fixed_facing_gate",
        certifiedPlayers = payload.certifiedPlayers, hashesLearned = learned,
        observeSeconds = payload.observeSeconds, moveDirectionEpsilon = payload.moveDirectionEpsilon,
        moveDirectionViolationMinSamples = payload.moveDirectionViolationMinSamples,
        moveDirectionViolationMinSpanSeconds = payload.moveDirectionViolationMinSpanSeconds,
        maxObservedMoveDirection = payload.maxObservedMoveDirection,
    }
    State.AutoTrader.Log("strict_gold_departure_commit_imported", State.AutoTrader.LastBotLearning)
    return true
end

State.AutoTrader.BuildGoldCertificationDepartureSummary = function()
    local c = State.AutoTrader.GoldBotCertification or {}
    return {
        jobId = game.JobId, status = c.status, reason = c.reason, atUnix = os.time(),
        failedPlayer = c.failedPlayer, failedUserId = c.failedUserId, moveDirectionViolation = c.moveDirectionViolation,
        maxObservedMoveDirection = c.maxObservedMoveDirection, currentRemoteCount = c.currentRemoteCount,
        trackableRemoteCount = c.trackableRemoteCount, passedRemoteCount = c.passedRemoteCount,
        pendingRemoteCount = c.pendingRemoteCount, certifiedAt = c.certifiedAt, candidatePreparedAt = c.candidatePreparedAt,
        humanDetectionSeconds = c.humanDetectionSeconds, requiredObserveSeconds = c.requiredObserveSeconds,
    }
end

State.AutoTrader.BuildGoldCertificationHistoryTeleportPayload = function()
    local rows = {}
    local current = State.AutoTrader.BuildGoldCertificationDepartureSummary()
    if current then table.insert(rows, current) end
    for _, row in ipairs(State.AutoTrader.GoldCertificationHistory or {}) do
        if type(row) == "table" and row.jobId ~= game.JobId then table.insert(rows, row) end
        if #rows >= CONFIG.AutoTraderGoldCertificationHistoryLimit then break end
    end
    return {version = 1, rows = rows}
end

State.AutoTrader.ImportGoldCertificationHistory = function(payload)
    if type(payload) ~= "table" or tonumber(payload.version) ~= 1 or type(payload.rows) ~= "table" then return false end
    State.AutoTrader.GoldCertificationHistory = State.AutoTrader.GoldCertificationHistory or {}
    local seen, merged = {}, {}
    for _, row in ipairs(payload.rows) do
        if type(row) == "table" and type(row.jobId) == "string" and row.jobId ~= ""
            and row.jobId ~= game.JobId and not seen[row.jobId] then
            seen[row.jobId] = true
            table.insert(merged, row)
        end
        if #merged >= CONFIG.AutoTraderGoldCertificationHistoryLimit then break end
    end
    for _, row in ipairs(State.AutoTrader.GoldCertificationHistory) do
        if type(row) == "table" and type(row.jobId) == "string" and row.jobId ~= game.JobId and not seen[row.jobId] then
            seen[row.jobId] = true
            table.insert(merged, row)
        end
        if #merged >= CONFIG.AutoTraderGoldCertificationHistoryLimit then break end
    end
    State.AutoTrader.GoldCertificationHistory = merged
    return true
end

State.AutoTrader.ResetGoldBotObservationWindow = function(reason)
    local previous = State.AutoTrader.GoldBotCertification
    local attempts = type(previous) == "table" and (tonumber(previous.attempts) or 0) or 0
    local c = {
        jobId = game.JobId, status = "waiting",
        reason = tostring(reason or "Waiting for persistent per-player MoveDirection + RootPart evidence."),
        windowStartedAt = 0, windowAge = 0, membershipKey = nil, players = {}, sampleCount = 0, attempts = attempts,
        certifiedAt = 0, lastHashAttemptAt = 0, learnedHashes = 0, certifiedUserIds = nil,
        moveDirectionViolation = nil, maxObservedMoveDirection = 0,
        candidateFingerprintByUserId = nil, candidateImageByUserId = nil, candidatePreparedAt = 0,
        currentRemoteCount = 0, passedRemoteCount = 0, pendingRemoteCount = 0, trackableRemoteCount = 0,
    }
    State.AutoTrader.GoldBotCertification = c
    return c
end

State.AutoTrader.ClearStrictGoldCandidateStaging = function(certification, reason)
    local c = certification or State.AutoTrader.GoldBotCertification
    if type(c) ~= "table" then return false end
    c.certifiedAt = 0
    c.certifiedUserIds = nil
    c.candidateFingerprintByUserId = nil
    c.candidateImageByUserId = nil
    c.candidatePreparedAt = 0
    if c.status == "candidate" then c.status = "observing" end
    if reason then c.reason = tostring(reason) end
    return true
end

State.AutoTrader.BuildGoldPlayerSupportSummary = function(track, now)
    if type(track) ~= "table" then return nil end
    now = tonumber(now) or os.clock()
    local segmentSpan = track.segmentFirstMovedAt and track.segmentLastMovedAt
        and math.max(0, track.segmentLastMovedAt - track.segmentFirstMovedAt) or 0
    local violationSpan = track.moveViolationFirstAt and track.moveViolationLastAt
        and math.max(0, track.moveViolationLastAt - track.moveViolationFirstAt) or 0
    return {
        name = track.name, present = track.present == true, trackable = track.trackable == true, passed = track.passed == true,
        passedAt = track.passedAt, firstSeenAt = track.firstSeenAt, lastSeenAt = track.lastSeenAt,
        untrackableSince = track.untrackableSince, untrackableReason = track.untrackableReason,
        rootChanges = track.rootChanges, segmentResets = track.segmentResets,
        settleRemainingSeconds = track.settleUntil and math.max(0, track.settleUntil - now) or 0,
        segmentAge = track.segmentStartedAt and math.max(0, now - track.segmentStartedAt) or 0,
        segmentDistance = track.segmentDistance, segmentMaxDisplacement = track.segmentMaxDisplacement,
        segmentMovingSamples = track.segmentMovingSamples, segmentMovementSpanSeconds = segmentSpan,
        segmentMaxFacingAngle = track.segmentMaxFacingAngle, maxMoveDirectionMagnitude = track.maxMoveDirectionMagnitude,
        moveViolationSamples = track.moveViolationSamples, moveViolationSpanSeconds = violationSpan,
        moveViolationMaxMagnitude = track.moveViolationMaxMagnitude, passedEvidence = track.passedEvidence,
    }
end

State.AutoTrader.SampleGoldBotCertification = function()
    if Destroyed then return false end
    local now = os.clock()
    local c = State.AutoTrader.GoldBotCertification
    if type(c) ~= "table" or c.jobId ~= game.JobId then
        c = State.AutoTrader.ResetGoldBotObservationWindow("New JobId; starting persistent per-player MoveDirection + RootPart observation.")
    end
    if c.status == "regular" or c.status == "certified_learned" then return true end
    c.players = type(c.players) == "table" and c.players or {}
    c.sampleCount = (tonumber(c.sampleCount) or 0) + 1

    -- Presence changes never destroy evidence. A dead/untrackable player pauses;
    -- a respawn starts a fresh stable-facing segment for that player only.
    for _, track in pairs(c.players) do
        if type(track) == "table" then
            track.present = false
            track.trackable = false
        end
    end

    local ids, names = {}, {}
    local trackableCount = 0
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            local userId = player.UserId
            table.insert(ids, userId)
            names[userId] = player.Name
            local track = c.players[userId]
            if type(track) ~= "table" then
                track = {
                    userId = userId, name = player.Name, firstSeenAt = now, lastSeenAt = now, present = true, trackable = false,
                    passed = false, passedAt = 0, root = nil, rootChanges = 0, segmentResets = 0,
                    maxMoveDirectionMagnitude = 0, moveViolationSamples = 0, moveViolationFirstAt = nil,
                    moveViolationLastAt = nil, moveViolationMaxMagnitude = 0,
                }
                c.players[userId] = track
            end
            track.name = player.Name
            track.present = true
            track.lastSeenAt = now

            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local root = character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
            if not humanoid or not root or not root:IsA("BasePart") or humanoid.Health <= 0 then
                if not track.untrackableSince then track.untrackableSince = now end
                -- Force a fresh per-player segment when the character becomes trackable again.
                -- Passed evidence survives; only this transient root segment is discarded.
                track.root = nil
                track.untrackableReason = not character and "no character"
                    or not humanoid and "no Humanoid"
                    or not root and "no HumanoidRootPart"
                    or humanoid.Health <= 0 and "dead/respawning"
                    or "root unavailable"
            else
                trackableCount += 1
                track.trackable = true
                track.untrackableSince = nil
                track.untrackableReason = nil

                local look = Vector3.new(root.CFrame.LookVector.X, 0, root.CFrame.LookVector.Z)
                if look.Magnitude > 0.001 then look = look.Unit else look = Vector3.new(0, 0, -1) end
                if track.root ~= root then
                    track.root = root
                    track.rootChanges = (tonumber(track.rootChanges) or 0) + 1
                    track.segmentStartedAt = now
                    track.settleUntil = now + CONFIG.AutoTraderGoldCharacterSettleSeconds
                    track.segmentStartPosition = root.Position
                    track.lastPosition = root.Position
                    track.segmentStartLook = look
                    track.segmentDistance = 0
                    track.segmentMaxDisplacement = 0
                    track.segmentMovingSamples = 0
                    track.segmentFirstMovedAt = nil
                    track.segmentLastMovedAt = nil
                    track.segmentMaxFacingAngle = 0
                    track.moveViolationSamples = 0
                    track.moveViolationFirstAt = nil
                    track.moveViolationLastAt = nil
                    track.moveViolationMaxMagnitude = 0
                end

                local moveDirection = humanoid.MoveDirection
                local moveMagnitude = typeof(moveDirection) == "Vector3" and moveDirection.Magnitude or 0
                track.maxMoveDirectionMagnitude = math.max(tonumber(track.maxMoveDirectionMagnitude) or 0, moveMagnitude)
                c.maxObservedMoveDirection = math.max(tonumber(c.maxObservedMoveDirection) or 0, moveMagnitude)

                local settled = now >= (tonumber(track.settleUntil) or now)
                if settled then
                    if moveMagnitude > CONFIG.AutoTraderGoldMoveDirectionEpsilon then
                        local lastViolation = tonumber(track.moveViolationLastAt)
                        if not lastViolation or now - lastViolation > CONFIG.AutoTraderGoldMoveDirectionViolationGapSeconds then
                            track.moveViolationSamples = 0
                            track.moveViolationFirstAt = now
                            track.moveViolationMaxMagnitude = 0
                        end
                        track.moveViolationSamples = (tonumber(track.moveViolationSamples) or 0) + 1
                        track.moveViolationFirstAt = track.moveViolationFirstAt or now
                        track.moveViolationLastAt = now
                        track.moveViolationMaxMagnitude = math.max(tonumber(track.moveViolationMaxMagnitude) or 0, moveMagnitude)
                        local violationSpan = math.max(0, now - (tonumber(track.moveViolationFirstAt) or now))
                        if track.moveViolationSamples >= CONFIG.AutoTraderGoldMoveDirectionViolationMinSamples
                            and violationSpan >= CONFIG.AutoTraderGoldMoveDirectionViolationMinSpanSeconds then
                            State.AutoTrader.MarkGoldCertificationRegular(
                                player.Name .. " exposed sustained Humanoid.MoveDirection for "
                                    .. tostring(track.moveViolationSamples) .. " samples across " .. string.format("%.2fs", violationSpan)
                                    .. " (max " .. string.format("%.3f", track.moveViolationMaxMagnitude) .. "); this JobId is REGULAR for learning and will teach ZERO bot hashes.",
                                {
                                    name = player.Name, userId = userId,
                                    moveDirectionViolation = {
                                        samples = track.moveViolationSamples, spanSeconds = violationSpan,
                                        maxMagnitude = track.moveViolationMaxMagnitude, vector = tostring(moveDirection), at = now,
                                    },
                                }
                            )
                            return true
                        end
                    elseif track.moveViolationLastAt
                        and now - track.moveViolationLastAt > CONFIG.AutoTraderGoldMoveDirectionViolationGapSeconds then
                        track.moveViolationSamples = 0
                        track.moveViolationFirstAt = nil
                        track.moveViolationLastAt = nil
                        track.moveViolationMaxMagnitude = 0
                    end

                    -- Positive evidence counts only in a stable-facing segment while
                    -- MoveDirection is inside the zero fuzz. Facing changes start a
                    -- new segment for this player only; nobody else's progress resets.
                    if moveMagnitude <= CONFIG.AutoTraderGoldMoveDirectionEpsilon then
                        local position = root.Position
                        local delta = position - (track.lastPosition or position)
                        local step = delta.Magnitude
                        local facingDot = math.clamp((track.segmentStartLook or look):Dot(look), -1, 1)
                        local facingAngle = math.deg(math.acos(facingDot))
                        if facingAngle > CONFIG.AutoTraderGoldOrientationFuzzDegrees then
                            track.segmentResets = (tonumber(track.segmentResets) or 0) + 1
                            track.segmentStartedAt = now
                            track.segmentStartPosition = position
                            track.lastPosition = position
                            track.segmentStartLook = look
                            track.segmentDistance = 0
                            track.segmentMaxDisplacement = 0
                            track.segmentMovingSamples = 0
                            track.segmentFirstMovedAt = nil
                            track.segmentLastMovedAt = nil
                            track.segmentMaxFacingAngle = 0
                        else
                            track.segmentMaxFacingAngle = math.max(tonumber(track.segmentMaxFacingAngle) or 0, facingAngle)
                            track.segmentDistance = (tonumber(track.segmentDistance) or 0) + step
                            track.segmentMaxDisplacement = math.max(
                                tonumber(track.segmentMaxDisplacement) or 0,
                                (position - (track.segmentStartPosition or position)).Magnitude
                            )
                            if step >= CONFIG.AutoTraderGoldMovementStepStuds then
                                track.segmentMovingSamples = (tonumber(track.segmentMovingSamples) or 0) + 1
                                track.segmentFirstMovedAt = track.segmentFirstMovedAt or now
                                track.segmentLastMovedAt = now
                            end
                            track.lastPosition = position
                            local movementSpan = track.segmentFirstMovedAt and track.segmentLastMovedAt
                                and math.max(0, track.segmentLastMovedAt - track.segmentFirstMovedAt) or 0
                            if not track.passed
                                and (tonumber(track.segmentDistance) or 0) >= CONFIG.AutoTraderGoldMinTotalDistanceStuds
                                and (tonumber(track.segmentMaxDisplacement) or 0) >= CONFIG.AutoTraderGoldMinMaxDisplacementStuds
                                and (tonumber(track.segmentMovingSamples) or 0) >= CONFIG.AutoTraderGoldMinMovingSamples
                                and movementSpan >= CONFIG.AutoTraderGoldMinMovementSpanSeconds
                                and (tonumber(track.segmentMaxFacingAngle) or 0) <= CONFIG.AutoTraderGoldOrientationFuzzDegrees then
                                track.passed = true
                                track.passedAt = now
                                track.passedEvidence = {
                                    distance = track.segmentDistance, maxDisplacement = track.segmentMaxDisplacement,
                                    movingSamples = track.segmentMovingSamples, movementSpanSeconds = movementSpan,
                                    maxFacingAngle = track.segmentMaxFacingAngle,
                                    maxObservedMoveDirectionMagnitude = track.maxMoveDirectionMagnitude, rootChanges = track.rootChanges,
                                }
                                State.AutoTrader.Log("gold_bot_player_passed", {userId = userId, name = player.Name, evidence = track.passedEvidence})
                            end
                        end
                    else
                        -- Do not transform normal Humanoid walking into fake CFrame
                        -- glide distance when MoveDirection later returns to zero.
                        track.lastPosition = root.Position
                    end
                else
                    track.lastPosition = root.Position
                end
            end
        end
    end
    table.sort(ids)
    c.names = names
    c.currentRemoteCount = #ids
    c.trackableRemoteCount = trackableCount
    c.membershipKey = table.concat(ids, ",")
    if c.windowStartedAt <= 0 and #ids >= CONFIG.AutoTraderGoldMinRemotePlayers then c.windowStartedAt = now end
    c.windowAge = c.windowStartedAt > 0 and math.max(0, now - c.windowStartedAt) or 0

    local passed, pending = 0, {}
    local summaries = {}
    for _, userId in ipairs(ids) do
        local track = c.players[userId]
        summaries[userId] = State.AutoTrader.BuildGoldPlayerSupportSummary(track, now)
        if track and track.passed then
            passed += 1
        else
            local why = track and (track.untrackableReason
                or (now < (tonumber(track.settleUntil) or 0) and "character settling")
                or "needs fixed-facing zero-MoveDirection motion") or "not observed"
            table.insert(pending, (names[userId] or tostring(userId)) .. ": " .. tostring(why))
        end
    end
    c.passedRemoteCount = passed
    c.pendingRemoteCount = #ids - passed
    c.physicalSummaries = summaries

    if #ids < CONFIG.AutoTraderGoldMinRemotePlayers then
        State.AutoTrader.ClearStrictGoldCandidateStaging(c)
        c.status = "waiting"
        c.reason = "Waiting for at least " .. tostring(CONFIG.AutoTraderGoldMinRemotePlayers)
            .. " remote players. Existing per-player evidence is preserved."
        return true
    end

    local allPassed = passed == #ids
    local requiredObserveSeconds = State.AutoTrader.GetGoldAdaptiveObserveSeconds()
    c.requiredObserveSeconds = requiredObserveSeconds
    local serverObservedLongEnough = c.windowStartedAt > 0 and c.windowAge >= requiredObserveSeconds
    if not allPassed or not serverObservedLongEnough then
        if c.status == "candidate" then State.AutoTrader.ClearStrictGoldCandidateStaging(c) end
        c.status = "observing"
        if not allPassed then
            c.reason = "Persistent certification: " .. tostring(passed) .. "/" .. tostring(#ids)
                .. " current remote players have passed. Deaths/respawns/untrackable states PAUSE only that player; joins add only a new pending track. "
                .. table.concat(pending, "; ")
        else
            local timing = State.AutoTrader.HumanDetectionTiming or {}
            c.reason = "Every current remote player has passed independently; adaptive hold is "
                .. string.format("%.2fs", requiredObserveSeconds)
                .. " (longest learned human detection " .. string.format("%.2fs", tonumber(timing.maxSeconds) or 0)
                .. " + " .. string.format("%.2fs", CONFIG.AutoTraderGoldAdaptiveObservePaddingSeconds)
                .. " padding, capped at " .. string.format("%.1fs", CONFIG.AutoTraderGoldObserveSeconds) .. ")."
        end
        return true
    end

    local currentKey = table.concat(ids, ",")
    local stagedKey = type(c.certifiedUserIds) == "table" and table.concat(c.certifiedUserIds, ",") or nil
    if c.status ~= "candidate" or stagedKey ~= currentKey then
        State.AutoTrader.ClearStrictGoldCandidateStaging(c)
        c.status = "candidate"
        c.certifiedAt = now
        c.certifiedUserIds = table.clone(ids)
        c.membershipKey = currentKey
        c.reason = "STRICT GOLD CANDIDATE: every CURRENT remote player independently passed persistent zero-MoveDirection + fixed-facing movement evidence. Evidence survived deaths/respawns/membership churn; sustained MoveDirection monitoring continues until departure."
        State.AutoTrader.Log("strict_gold_candidate_staged", {
            players = #ids, passed = passed, maxObservedMoveDirection = tonumber(c.maxObservedMoveDirection) or 0,
            requiredObserveSeconds = requiredObserveSeconds, humanTimingMaxSeconds = tonumber(State.AutoTrader.HumanDetectionTiming and State.AutoTrader.HumanDetectionTiming.maxSeconds) or 0,
        })
    end
    State.AutoTrader.PrepareStrictGoldCandidate(c)
    return true
end

do
    -- The strict evidence belongs to the server we just left. Import it only now,
    -- after an actual teleport delivered the validated candidate payload.
    local okData, teleportData = pcall(function() return TeleportService:GetLocalPlayerTeleportData() end)
    if okData and type(teleportData) == "table" then
        if type(teleportData.goldCertificationHistory) == "table" then
            State.AutoTrader.ImportGoldCertificationHistory(teleportData.goldCertificationHistory)
        end
        if type(teleportData.strictGoldCommit) == "table" then
            State.AutoTrader.ImportStrictGoldTeleportCommit(teleportData.strictGoldCommit)
        end
    end
end

State.AutoTrader.BuildGoldCertificationSupport = function()
    local c = State.AutoTrader.GoldBotCertification or {}
    local now = os.clock()
    local players = {}
    for userId, track in pairs(c.players or {}) do
        if type(track) == "table" then
            local row = State.AutoTrader.BuildGoldPlayerSupportSummary(track, now)
            if row then
                row.userId = userId
                players[tostring(userId)] = row
            end
        end
    end
    return {
        jobId = c.jobId, status = c.status, reason = c.reason,
        windowStartedAt = c.windowStartedAt, windowAge = c.windowAge,
        membershipKey = c.membershipKey, sampleCount = c.sampleCount, attempts = c.attempts,
        certifiedAt = c.certifiedAt, candidatePreparedAt = c.candidatePreparedAt,
        committedAt = c.committedAt, learnedHashes = c.learnedHashes,
        failedPlayer = c.failedPlayer, failedUserId = c.failedUserId, failedAt = c.failedAt,
        humanDetectionSeconds = c.humanDetectionSeconds, requiredObserveSeconds = c.requiredObserveSeconds,
        moveDirectionViolation = c.moveDirectionViolation, maxObservedMoveDirection = c.maxObservedMoveDirection,
        currentRemoteCount = c.currentRemoteCount, trackableRemoteCount = c.trackableRemoteCount,
        passedRemoteCount = c.passedRemoteCount, pendingRemoteCount = c.pendingRemoteCount,
        certifiedUserIds = c.certifiedUserIds, physicalSummaries = c.physicalSummaries, players = players,
    }
end

-- Compatibility functions retained for support code; they can no longer train or trigger hops.
State.AutoTrader.LearnCurrentServerBotIcons = function()
    return State.AutoTrader.LastBotLearning
end
State.AutoTrader.ShouldFastRejectInventoryBotLobby = function()
    return false, {disabled = true, reason = "v26 bot identity learning never uses inventory/trade/animation state"}
end
State.AutoTrader.ScreenCurrentServerAvatars = function(force)
    if State.AutoTrader.CurrentServerAvatarScreenInFlight then return State.AutoTrader.CurrentServerAvatarScreen end
    if not force and State.AutoTrader.CurrentServerAvatarScreenJobId == game.JobId
        and os.clock() - (State.AutoTrader.CurrentServerAvatarScreenAt or 0) < CONFIG.AutoTraderBotCurrentPreviewRetrySeconds then
        return State.AutoTrader.CurrentServerAvatarScreen
    end
    State.AutoTrader.CurrentServerAvatarScreenInFlight = true
    local okThumb, current, reason = State.AutoTrader.ResolveCurrentPlayerFingerprints()
    State.AutoTrader.CurrentServerAvatarScreenInFlight = false
    State.AutoTrader.CurrentServerAvatarScreenAt = os.clock()
    State.AutoTrader.CurrentServerAvatarScreenJobId = game.JobId
    if not okThumb then
        State.AutoTrader.CurrentServerAvatarScreen = {jobId = game.JobId, ok = false, reason = reason, botByUserId = {}}
        return State.AutoTrader.CurrentServerAvatarScreen
    end
    local botByUserId = {}
    local matched = 0
    for userId, fingerprint in pairs(current.fingerprintByUserId or {}) do
        local class, confidence, record = State.AutoTrader.GetBotIconClass(fingerprint)
        local goldJobs = record and State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs) or 0
        local displayRisk = class == "confirmed_bot" and 0.99 or class == "known_bot" and 0.93 or class == "observed_bot" and 0.80 or 0
        if class ~= "unknown" then matched += 1 end
        botByUserId[userId] = {fingerprint = fingerprint, class = class, confidence = confidence, goldJobs = goldJobs, displayRisk = displayRisk}
    end
    local sample = #(current.previewFingerprints or {})
    local result = {
        jobId = game.JobId, ok = true, sample = sample, at = os.clock(),
        fingerprintByUserId = current.fingerprintByUserId, botByUserId = botByUserId,
        goldMatched = matched, goldMatchRatio = sample > 0 and matched / sample or 0,
        -- Explicitly informational: these fields never activate current-server hopping.
        fastBot = false, safeConfidence = nil, botLikelihood = nil,
    }
    State.AutoTrader.PlayerBotRiskByUserId = botByUserId
    State.AutoTrader.CurrentServerAvatarScreen = result
    State.AutoTrader.Log("current_server_avatar_screen", result)
    return result
end

State.AutoTrader.BuildCachedServerQueue = function()
    local nowUnix = os.time()
    local ttl = math.max(1, tonumber(CONFIG.AutoTraderServerCandidateCacheTtlSeconds) or 180)
    local entries = State.AutoTrader.PruneServerCandidateCache()
    local queue, scanRows, kept = {}, {}, {}
    local droppedStrict = 0
    for _, entry in ipairs(entries) do
        local server = {
            id = entry.id, playing = entry.playing, maxPlayers = entry.maxPlayers,
            occupancy = entry.occupancy, ping = entry.ping, fps = entry.fps,
            previewFingerprints = table.clone(entry.previewFingerprints or {}),
            previewTokenCount = #(entry.previewFingerprints or {}),
            cacheScannedAt = entry.scannedAt,
        }
        local preview = State.AutoTrader.ClassifyServerPreview(server)
        local age = math.max(0, nowUnix - entry.scannedAt)
        table.insert(scanRows, {
            id = server.id, playing = server.playing, maxPlayers = server.maxPlayers,
            cacheAgeSeconds = age, previewSample = preview.sample,
            goldBotMatches = preview.goldMatched, goldBotMatchRatio = preview.goldMatchRatio,
            previewTrusted = preview.previewTrusted, safeEnough = preview.safeEnough,
            hardReject = preview.hardReject, score = preview.score,
            cacheState = preview.previewTrusted and "trusted_clear" or "unknown",
        })
        if preview.safeEnough then
            table.insert(queue, server)
            table.insert(kept, entry)
        else
            droppedStrict += 1
        end
    end
    if droppedStrict > 0 then
        State.AutoTrader.ServerCandidateCache = {version = 1, entries = kept}
        State.AutoTrader.SaveServerCandidateCache()
    end
    table.sort(queue, function(a, b)
        local ap, bp = a.botPreview or {}, b.botPreview or {}
        if (ap.previewTrusted == true) ~= (bp.previewTrusted == true) then return ap.previewTrusted == true end
        if (a.cacheScannedAt or 0) ~= (b.cacheScannedAt or 0) then return (a.cacheScannedAt or 0) > (b.cacheScannedAt or 0) end
        if math.abs((ap.goldMatchRatio or 0) - (bp.goldMatchRatio or 0)) > 0.000001 then return (ap.goldMatchRatio or 0) < (bp.goldMatchRatio or 0) end
        if a.playing ~= b.playing then return a.playing > b.playing end
        return a.id < b.id
    end)
    while #queue > CONFIG.AutoTraderServerQueueLimit do table.remove(queue) end
    local trusted, unknown, oldestAge = 0, 0, 0
    for _, server in ipairs(queue) do
        oldestAge = math.max(oldestAge, math.max(0, nowUnix - (server.cacheScannedAt or nowUnix)))
        if server.botPreview and server.botPreview.previewTrusted then trusted += 1 else unknown += 1 end
    end
    local scan = {
        at = os.clock(), source = "candidate_cache", cacheHit = #queue > 0,
        cacheTtlSeconds = ttl, cacheEntriesAfterPrune = #entries, cacheDroppedStrict = droppedStrict,
        cacheOldestSelectedAgeSeconds = oldestAge, queueCount = #queue,
        safeCandidateCount = #queue, trustedCandidateCount = trusted, unknownCandidateCount = unknown,
        candidates = scanRows, filterSource = "strict_gold_hash_db_rechecked_on_cached_fingerprints_unknown_allowed",
        fetch = {cacheHit = #queue > 0, pagesRequested = 0, pagesAttempted = 0, pagesSucceeded = 0, transportPages = {},
            selectedGameHttpGetPages = 0, selectedExecutorPages = 0, selectedDegradedPages = 0},
    }
    local best = queue[1]
    scan.selected = best and best.id or nil
    scan.bestScanned = best and {
        id = best.id, goldBotMatchRatio = best.botPreview and best.botPreview.goldMatchRatio or 0,
        safeConfidence = best.botPreview and best.botPreview.safeConfidence or nil,
        previewTrusted = best.botPreview and best.botPreview.previewTrusted or false,
        safeEnough = best.botPreview and best.botPreview.safeEnough or false,
        playing = best.playing, maxPlayers = best.maxPlayers,
        cacheAgeSeconds = math.max(0, nowUnix - (best.cacheScannedAt or nowUnix)),
    } or nil
    State.AutoTrader.LastServerCandidateCacheUse = {
        at = os.clock(), queueCount = #queue, trusted = trusted, unknown = unknown,
        droppedStrict = droppedStrict, ttlSeconds = ttl,
    }
    return queue, scan
end

State.AutoTrader.BuildPublicServerQueue = function(forceFresh)
    if not forceFresh then
        local cachedQueue, cachedScan = State.AutoTrader.BuildCachedServerQueue()
        if #cachedQueue > 0 then
            State.AutoTrader.LastServerScan = cachedScan
            return cachedQueue, cachedScan
        end
    end

    local rows, fetchDiagnostics = State.AutoTrader.FetchPublicServers(CONFIG.AutoTraderServerListPages)
    local allJoinable, fresh, recentFallback = {}, {}, {}
    local nowUnix = os.time()
    local filteredCurrent, filteredFull = 0, 0
    for _, server in ipairs(rows) do
        if server.id == game.JobId then filteredCurrent += 1
        elseif server.playing >= server.maxPlayers then filteredFull += 1
        else
            table.insert(allJoinable, server)
            local recentAt = tonumber(State.AutoTrader.RecentJobs[server.id])
            if not recentAt then table.insert(fresh, server)
            elseif nowUnix - recentAt >= CONFIG.AutoTraderRecentServerFallbackMinAgeSeconds then
                server.recentFallbackAge = nowUnix - recentAt
                table.insert(recentFallback, server)
            end
        end
    end
    local candidates = #fresh > 0 and fresh or recentFallback
    local usedRecentFallback = #fresh == 0 and #recentFallback > 0
    table.sort(candidates, function(a, b)
        local ap = a.occupancy >= CONFIG.AutoTraderServerPreferredMinOccupancy and a.occupancy <= CONFIG.AutoTraderServerPreferredMaxOccupancy
        local bp = b.occupancy >= CONFIG.AutoTraderServerPreferredMinOccupancy and b.occupancy <= CONFIG.AutoTraderServerPreferredMaxOccupancy
        if ap ~= bp then return ap end
        if usedRecentFallback and (a.recentFallbackAge or 0) ~= (b.recentFallbackAge or 0) then return (a.recentFallbackAge or 0) > (b.recentFallbackAge or 0) end
        if a.playing ~= b.playing then return a.playing > b.playing end
        return a.id < b.id
    end)
    while #candidates > CONFIG.AutoTraderServerCandidateLimit do table.remove(candidates) end

    local thumbOK, thumbReason, thumbDiagnostics = State.AutoTrader.ResolveServerPreviewFingerprints(candidates)
    local scan = {
        at = os.clock(), source = "fresh_http_scan", cacheHit = false,
        thumbnailAvailable = thumbOK, thumbnailReason = thumbReason, thumbnail = thumbDiagnostics, fetch = fetchDiagnostics,
        rawRows = #rows, joinableRows = #allJoinable, freshRows = #fresh, recentFallbackRows = #recentFallback,
        usedRecentFallback = usedRecentFallback, filteredCurrent = filteredCurrent, filteredFull = filteredFull,
        preclassifyPool = #candidates, candidates = {}, filterSource = "strict_gold_hash_db_when_available_unknown_allowed",
    }
    local queue = {}
    for _, server in ipairs(candidates) do
        local preview = State.AutoTrader.ClassifyServerPreview(server)
        local row = {
            id = server.id, playing = server.playing, maxPlayers = server.maxPlayers, occupancy = server.occupancy,
            previewSample = preview.sample, previewTokenCount = server.previewTokenCount or #(server.playerTokens or {}),
            goldBotMatches = preview.goldMatched, goldBotMatchRatio = preview.goldMatchRatio,
            confirmedBotRatio = preview.confirmedRatio, suspectBotRatio = preview.suspectRatio,
            botLikelihood = preview.goldMatchRatio, safeConfidence = preview.safeConfidence,
            previewTrusted = preview.previewTrusted, safeEnough = preview.safeEnough,
            hardReject = preview.hardReject, suspicious = preview.suspicious, score = preview.score,
            hashes = server.previewFingerprints, recent = State.AutoTrader.RecentJobs[server.id] ~= nil,
            recentFallbackAge = server.recentFallbackAge,
        }
        table.insert(scan.candidates, row)
        if preview.safeEnough then table.insert(queue, server) end
    end
    table.sort(queue, function(a, b)
        local ap, bp = a.botPreview or {}, b.botPreview or {}
        if (ap.previewTrusted == true) ~= (bp.previewTrusted == true) then return ap.previewTrusted == true end
        if math.abs((ap.goldMatchRatio or 0) - (bp.goldMatchRatio or 0)) > 0.000001 then return (ap.goldMatchRatio or 0) < (bp.goldMatchRatio or 0) end
        local as, bs = ap.score or -math.huge, bp.score or -math.huge
        if math.abs(as - bs) > 0.000001 then return as > bs end
        if a.playing ~= b.playing then return a.playing > b.playing end
        return a.id < b.id
    end)
    while #queue > CONFIG.AutoTraderServerQueueLimit do table.remove(queue) end
    table.sort(scan.candidates, function(a, b)
        if (a.safeEnough == true) ~= (b.safeEnough == true) then return a.safeEnough == true end
        if (a.previewTrusted == true) ~= (b.previewTrusted == true) then return a.previewTrusted == true end
        if math.abs((a.goldBotMatchRatio or 1) - (b.goldBotMatchRatio or 1)) > 0.000001 then return (a.goldBotMatchRatio or 1) < (b.goldBotMatchRatio or 1) end
        return tostring(a.id) < tostring(b.id)
    end)
    while #scan.candidates > 60 do table.remove(scan.candidates) end
    scan.queueCount = #queue
    scan.safeThreshold = CONFIG.AutoTraderGoldBotRejectRatio
    scan.safeCandidateCount = #queue
    scan.trustedCandidateCount = 0
    scan.unknownCandidateCount = 0
    for _, server in ipairs(queue) do
        if server.botPreview and server.botPreview.previewTrusted then scan.trustedCandidateCount += 1
        else scan.unknownCandidateCount += 1 end
    end
    local best = scan.candidates[1]
    scan.bestScanned = best and {
        id = best.id, goldBotMatchRatio = best.goldBotMatchRatio, safeConfidence = best.safeConfidence,
        previewTrusted = best.previewTrusted, safeEnough = best.safeEnough, playing = best.playing, maxPlayers = best.maxPlayers,
    } or nil
    scan.selected = queue[1] and queue[1].id or nil
    scan.cachedCandidateCount = State.AutoTrader.MergeServerCandidateCache(queue)
    State.AutoTrader.LastServerScan = scan
    return queue, scan
end
-- Backward-compatible helper for any callers/debug code that still expect one server.
State.AutoTrader.FindPublicServer = function()
    local queue, scan = State.AutoTrader.BuildPublicServerQueue()
    return queue[1], scan
end
State.AutoTrader.BeginTeleport = function(reason, sameJob, commitStrictGold)
    if State.AutoTrader.TeleportInProgress then return false end
    local queued, queueError = State.AutoTrader.QueueTeleportScript(reason)
    if not queued then
        State.AutoTrader.Status = "WAIT · TELEPORT QUEUE"
        State.AutoTrader.StatusDetail = "Automatic teleport was blocked because the executor queue_on_teleport function is unavailable: " .. tostring(queueError)
        State.AutoTrader.Render()
        return false
    end
    State.AutoTrader.TeleportInProgress = true
    State.AutoTrader.TeleportAttemptStartedAt = os.clock()
    State.AutoTrader.TeleportAttemptOriginJobId = game.JobId
    State.AutoTrader.LastTeleportReason = tostring(reason)
    local teleportData = {
        svAutoTrader = true, reason = tostring(reason), fromJobId = game.JobId,
        goldCertificationHistory = State.AutoTrader.BuildGoldCertificationHistoryTeleportPayload(),
        strictGoldCommit = commitStrictGold == true and State.AutoTrader.BuildStrictGoldTeleportCommitPayload() or nil,
    }
    local ok, err = pcall(function()
        if sameJob and #Players:GetPlayers() > 1 and type(game.JobId) == "string" and game.JobId ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer, nil, teleportData)
        else
            TeleportService:Teleport(game.PlaceId, LocalPlayer, teleportData)
        end
    end)
    if not ok then
        State.AutoTrader.TeleportInProgress = false
        State.AutoTrader.TeleportAttemptStartedAt = 0
        State.AutoTrader.TeleportAttemptOriginJobId = nil
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.Log("teleport_call_failed", {reason = reason, error = tostring(err)})
        return false
    end
    return true
end
State.AutoTrader.AbortServerHop = function(reason)
    State.AutoTrader.ServerHopQueueGeneration += 1
    State.AutoTrader.ServerHopAttemptGeneration += 1
    State.AutoTrader.ServerHopInProgress = false
    State.AutoTrader.ServerHopQueue = {}
    State.AutoTrader.ServerHopQueueIndex = 0
    State.AutoTrader.ServerHopCurrentCandidate = nil
    State.AutoTrader.ServerHopCurrentDisposition = nil
    State.AutoTrader.ServerHopTeleportStarted = false
    State.AutoTrader.ServerHopStartedAt = 0
    State.AutoTrader.ServerHopLastProgressAt = 0
    State.AutoTrader.TeleportInProgress = false
    State.AutoTrader.TeleportAttemptStartedAt = 0
    State.AutoTrader.TeleportAttemptOriginJobId = nil
    if reason then
        State.AutoTrader.Log("server_hop_aborted", {reason = tostring(reason)})
    end
end
State.AutoTrader.ServerHopStillAllowed = function()
    local currentDisposition = State.AutoTrader.GetServerDisposition()
    local _, liveIncoming = State.AutoTrader.GetIncomingRequestUi()
    local exhausted = string.sub(tostring(currentDisposition), 1, 9) == "EXHAUSTED"
    local forcedReason = State.AutoTrader.FastBotHopReason
    local explicitNonBotHop = State.AutoTrader.FastBotHopActive == true
        and (forcedReason == "MANUAL_SERVER_SEARCH" or forcedReason == "EXHAUSTED_NO_PROGRESS")
    if forcedReason == "EXHAUSTED_NO_PROGRESS" and currentDisposition == "ACTIVE" and State.AutoTrader.SelectTarget then
        local revivedTarget = State.AutoTrader.SelectTarget()
        if revivedTarget then return false, "new trading opportunity appeared: " .. tostring(revivedTarget.Name) end
    end
    local noWork = not State.AutoTrader.PendingRequest
        and not State.AutoTrader.IsAnyNativeOutgoingPending()
        and State.AutoTrader.RequestLifecycle == "idle"
        and not State.AutoTrader.TradeDeclinePending
        and not State.CurrentTrade
        and not State.AutoTrader.PostTradeAuditPending
        and not (liveIncoming and State.AutoTrader.IsGuiShown(liveIncoming))
    return (exhausted or explicitNonBotHop) and noWork,
        explicitNonBotHop and tostring(State.AutoTrader.FastBotHopReason) or currentDisposition
end
State.AutoTrader.GetServerRescanDelay = function(scan)
    local base = math.max(1, tonumber(CONFIG.AutoTraderServerRescanDelaySeconds) or 2)
    local maxDelay = math.max(base, tonumber(CONFIG.AutoTraderServerRateLimitMaxBackoffSeconds) or 16)
    local fetch = scan and scan.fetch
    local rateLimited = false
    local retryAfterSeconds = 0
    for _, page in ipairs(fetch and fetch.transportPages or {}) do
        local gameInfo = type(page.gameHttpGet) == "table" and page.gameHttpGet or {}
        local execInfo = type(page.executor) == "table" and page.executor or {}
        local function is429(info)
            if tonumber(info.status) == 429 then return true end
            return string.find(string.lower(tostring(info.error or "")), "429", 1, true) ~= nil
        end
        if is429(gameInfo) or is429(execInfo) then
            rateLimited = true
            retryAfterSeconds = math.max(retryAfterSeconds, tonumber(execInfo.retryAfterSeconds) or 0)
        end
    end
    if rateLimited then
        local previous = tonumber(State.AutoTrader.ServerRateLimitBackoffSeconds) or 0
        local exponential = previous > 0 and math.min(maxDelay, previous * 2) or math.min(maxDelay, base * 2)
        local delay = retryAfterSeconds > 0
            and math.min(maxDelay, math.max(base, retryAfterSeconds))
            or exponential
        State.AutoTrader.ServerRateLimitBackoffSeconds = delay
        State.AutoTrader.ServerRateLimitConsecutiveScans = (tonumber(State.AutoTrader.ServerRateLimitConsecutiveScans) or 0) + 1
        return delay, true
    end
    State.AutoTrader.ServerRateLimitBackoffSeconds = 0
    State.AutoTrader.ServerRateLimitConsecutiveScans = 0
    return base, false
end

State.AutoTrader.TryRateLimitBlindHopFallback = function(reason)
    if (tonumber(State.AutoTrader.ServerRateLimitConsecutiveScans) or 0) < CONFIG.AutoTraderServerRateLimitBlindHopAfterScans then return false end
    local allowed = State.AutoTrader.ServerHopStillAllowed()
    if not allowed then return false end
    State.AutoTrader.Log("server_rate_limit_blind_hop_fallback", {
        scans = State.AutoTrader.ServerRateLimitConsecutiveScans, reason = tostring(reason or "rate limited"),
    })
    State.AutoTrader.AbortServerHop("switching from rate-limited screened scan to blind public teleport")
    State.AutoTrader.Status = "SERVER HOP · BLIND FALLBACK"
    State.AutoTrader.StatusDetail = "Server-list transports are repeatedly rate limited; using Roblox's normal public teleport so trading is not stranded."
    State.AutoTrader.Render()
    return State.AutoTrader.BeginTeleport("server_rate_limit_blind_fallback", false, true)
end
State.AutoTrader.TryNextServerHopCandidate = function(queueGeneration)
    if Destroyed
        or not State.AutoTrader.ServerHopInProgress
        or queueGeneration ~= State.AutoTrader.ServerHopQueueGeneration then
        return false
    end
    if State.AutoTrader.TeleportInProgress then return false end

    local allowed, currentDisposition = State.AutoTrader.ServerHopStillAllowed()
    if not allowed then
        State.AutoTrader.AbortServerHop("new work appeared: " .. tostring(currentDisposition))
        State.AutoTrader.Status = "SERVER HOP CANCELED · NEW WORK"
        State.AutoTrader.StatusDetail = "A new actionable request/player/trade appeared while server candidates were being tried."
        State.AutoTrader.Render()
        return false
    end

    State.AutoTrader.ServerHopQueueIndex += 1
    local server = State.AutoTrader.ServerHopQueue[State.AutoTrader.ServerHopQueueIndex]
    if not server then
        local scan = State.AutoTrader.LastServerScan
        local best = scan and scan.bestScanned or nil
        local rescanDelay, rateLimited = State.AutoTrader.GetServerRescanDelay(scan)
        if rateLimited and State.AutoTrader.TryRateLimitBlindHopFallback("cached/fresh queue exhausted") then return true end
        State.AutoTrader.Status = rateLimited and "SERVER HOP · RATE LIMITED" or "SERVER HOP · WAITING FOR ELIGIBLE SERVER"
        if best and best.previewTrusted then
            State.AutoTrader.StatusDetail = string.format(
                "Best scanned server still has %.0f%% learned-gold bot-avatar matches / %.0f%% unmatched previews. Need gold matches below %.0f%%; rescanning in %.0fs.",
                (tonumber(best.goldBotMatchRatio) or 1) * 100,
                (tonumber(best.safeConfidence) or 0) * 100,
                CONFIG.AutoTraderGoldBotRejectRatio * 100,
                rescanDelay
            )
        else
            State.AutoTrader.StatusDetail = string.format(
                "No joinable candidate is currently available. Cached UNKNOWN servers are allowed; reaching this state means the <3-minute cache is exhausted and the fresh server list was empty/unusable or every trusted candidate hit the strict bot reject gate. Rescanning in %.0fs.",
                rescanDelay
            )
        end
        State.AutoTrader.Log("server_hop_queue_exhausted", {
            disposition = State.AutoTrader.ServerHopCurrentDisposition,
            tried = State.AutoTrader.ServerHopQueueIndex - 1,
        })
        State.AutoTrader.Render()
        task.delay(rescanDelay, function()
            if Destroyed
                or not State.AutoTrader.ServerHopInProgress
                or queueGeneration ~= State.AutoTrader.ServerHopQueueGeneration then
                return
            end
            local stillAllowed, dispositionNow = State.AutoTrader.ServerHopStillAllowed()
            if not stillAllowed then
                State.AutoTrader.AbortServerHop("new work before rescan: " .. tostring(dispositionNow))
                return
            end
            local queue, scan = State.AutoTrader.BuildPublicServerQueue()
            if Destroyed or not State.AutoTrader.ServerHopInProgress then return end
            State.AutoTrader.ServerHopLastProgressAt = os.clock()
            State.AutoTrader.ServerHopQueueGeneration += 1
            local nextGeneration = State.AutoTrader.ServerHopQueueGeneration
            State.AutoTrader.ServerHopQueue = queue
            State.AutoTrader.ServerHopQueueIndex = 0
            State.AutoTrader.LastServerScan = scan
            if #queue == 0 then
                local best = scan and scan.bestScanned or nil
                local nextDelay, rateLimited = State.AutoTrader.GetServerRescanDelay(scan)
                if rateLimited and State.AutoTrader.TryRateLimitBlindHopFallback("repeated empty rate-limited scan") then return end
                State.AutoTrader.Status = rateLimited and "SERVER HOP · RATE LIMITED" or "SERVER HOP · WAITING FOR ELIGIBLE SERVER"
                State.AutoTrader.StatusDetail = best and best.previewTrusted
                    and string.format(
                        "Fresh scan still has no server below the %.0f%% learned-gold-avatar gate; best has %.0f%% gold matches. Rescanning in %.0fs.",
                        CONFIG.AutoTraderGoldBotRejectRatio * 100,
                        (tonumber(best.goldBotMatchRatio) or 1) * 100,
                        nextDelay
                    )
                    or string.format(
                        "Fresh scan still has no eligible server. Unknown thumbnail previews are allowed; waiting only because no usable candidate was returned or every trusted candidate hit the strict bot reject gate. Rescanning in %.0fs.",
                        nextDelay
                    )
                State.AutoTrader.Log("server_hop_rescan_empty", {scan = scan})
                State.AutoTrader.Render()
                task.delay(nextDelay, function()
                    if not Destroyed and State.AutoTrader.ServerHopInProgress then
                        State.AutoTrader.TryNextServerHopCandidate(nextGeneration)
                    end
                end)
                return
            end
            State.AutoTrader.TryNextServerHopCandidate(nextGeneration)
        end)
        return true
    end

    State.AutoTrader.ServerHopCurrentCandidate = server
    State.AutoTrader.ServerHopTeleportStarted = false
    State.AutoTrader.ServerHopLastProgressAt = os.clock()
    State.AutoTrader.RecentJobs[server.id] = os.time()
    State.AutoTrader.SaveRecentJobs()
    State.AutoTrader.SaveServerCandidateCache()
    State.AutoTrader.Log("server_hop_candidate_attempt", {
        queueIndex = State.AutoTrader.ServerHopQueueIndex,
        queueCount = #State.AutoTrader.ServerHopQueue,
        jobId = server.id,
        playing = server.playing,
        maxPlayers = server.maxPlayers,
        occupancy = server.occupancy,
        goldBotMatchRatio = server.botPreview and server.botPreview.goldMatchRatio or nil,
        safeConfidence = server.botPreview and server.botPreview.safeConfidence or nil,
        botPreview = server.botPreview,
        disposition = State.AutoTrader.ServerHopCurrentDisposition,
    })
    State.AutoTrader.Status = "SERVER HOP · TRYING "
        .. tostring(State.AutoTrader.ServerHopQueueIndex)
        .. "/"
        .. tostring(#State.AutoTrader.ServerHopQueue)
    local cacheSuffix = server.cacheScannedAt and (" · cached " .. tostring(math.max(0, os.time() - server.cacheScannedAt)) .. "s ago") or " · fresh scan"
    if server.botPreview and server.botPreview.previewTrusted then
        State.AutoTrader.StatusDetail = tostring(server.playing)
            .. "/"
            .. tostring(server.maxPlayers)
            .. string.format(
                " players · %.0f%% strict-gold bot-avatar matches · passed the pre-join hash filter.",
                (server.botPreview.goldMatchRatio or 0) * 100
            ) .. cacheSuffix
    else
        State.AutoTrader.StatusDetail = tostring(server.playing)
            .. "/"
            .. tostring(server.maxPlayers)
            .. " players · avatar preview unavailable/insufficient, so this candidate is UNKNOWN and allowed."
            .. cacheSuffix
    end
    State.AutoTrader.Render()

    local queued, queueError = State.AutoTrader.QueueTeleportScript(
        "server_hop:" .. tostring(State.AutoTrader.ServerHopCurrentDisposition)
    )
    if not queued then
        State.AutoTrader.AbortServerHop("queue_on_teleport unavailable: " .. tostring(queueError))
        State.AutoTrader.Status = "WAIT · TELEPORT QUEUE"
        State.AutoTrader.StatusDetail = tostring(queueError)
        State.AutoTrader.Render()
        return false
    end

    State.AutoTrader.TeleportInProgress = true
    State.AutoTrader.TeleportAttemptStartedAt = os.clock()
    State.AutoTrader.TeleportAttemptOriginJobId = game.JobId
    State.AutoTrader.ServerHopAttemptGeneration += 1
    local attemptGeneration = State.AutoTrader.ServerHopAttemptGeneration
    local teleportData = {
        svAutoTrader = true,
        reason = "server_hop",
        fromJobId = game.JobId,
        candidateJobId = server.id,
        queueIndex = State.AutoTrader.ServerHopQueueIndex,
        -- Strict bot evidence is committed only by the destination server after an
        -- actual teleport. If this call fails, the old server learns nothing.
        strictGoldCommit = State.AutoTrader.BuildStrictGoldTeleportCommitPayload(),
        goldCertificationHistory = State.AutoTrader.BuildGoldCertificationHistoryTeleportPayload(),
    }
    local ok, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(
            game.PlaceId,
            server.id,
            LocalPlayer,
            nil,
            teleportData
        )
    end)
    if not ok then
        State.AutoTrader.TeleportInProgress = false
        State.AutoTrader.TeleportAttemptStartedAt = 0
        State.AutoTrader.TeleportAttemptOriginJobId = nil
        State.AutoTrader.Log("server_hop_candidate_call_failed", {
            jobId = server.id,
            error = tostring(err),
        })
        task.delay(0.1, function()
            if not Destroyed
                and State.AutoTrader.ServerHopInProgress
                and queueGeneration == State.AutoTrader.ServerHopQueueGeneration
                and attemptGeneration == State.AutoTrader.ServerHopAttemptGeneration then
                State.AutoTrader.TryNextServerHopCandidate(queueGeneration)
            end
        end)
        return true
    end

    -- Guard against executors/client states where TeleportToPlaceInstance returns
    -- but neither Started nor TeleportInitFailed arrives. If Started fires we
    -- leave this attempt alone and let Roblox complete the teleport.
    task.delay(CONFIG.AutoTraderServerTeleportAttemptTimeoutSeconds, function()
        if Destroyed
            or not State.AutoTrader.ServerHopInProgress
            or queueGeneration ~= State.AutoTrader.ServerHopQueueGeneration
            or attemptGeneration ~= State.AutoTrader.ServerHopAttemptGeneration
            or State.AutoTrader.ServerHopTeleportStarted
            or not State.AutoTrader.TeleportInProgress then
            return
        end
        local current = State.AutoTrader.ServerHopCurrentCandidate
        if current and current.id == server.id and game.JobId ~= server.id then
            State.AutoTrader.TeleportInProgress = false
            State.AutoTrader.TeleportAttemptStartedAt = 0
            State.AutoTrader.TeleportAttemptOriginJobId = nil
            State.AutoTrader.Log("server_hop_candidate_timeout", {
                jobId = server.id,
                seconds = CONFIG.AutoTraderServerTeleportAttemptTimeoutSeconds,
            })
            State.AutoTrader.TryNextServerHopCandidate(queueGeneration)
        end
    end)
    return true
end
State.AutoTrader.TryServerHop = function(disposition, counts)
    if not CONFIG.AutoTraderServerHopEnabled
        or State.AutoTrader.ServerHopInProgress
        or State.AutoTrader.TeleportInProgress then
        return false
    end
    if os.clock() - (State.AutoTrader.LastServerHopAttemptAt or 0)
        < CONFIG.AutoTraderServerHopRetrySeconds then
        return false
    end
    State.AutoTrader.LastServerHopAttemptAt = os.clock()
    State.AutoTrader.ServerHopInProgress = true
    State.AutoTrader.ServerHopStartedAt = os.clock()
    State.AutoTrader.ServerHopLastProgressAt = State.AutoTrader.ServerHopStartedAt
    State.AutoTrader.ServerHopCurrentDisposition = tostring(disposition)
    State.AutoTrader.ServerHopQueueGeneration += 1
    local queueGeneration = State.AutoTrader.ServerHopQueueGeneration
    State.AutoTrader.ServerHopQueue = {}
    State.AutoTrader.ServerHopQueueIndex = 0
    State.AutoTrader.ServerHopCurrentCandidate = nil
    State.AutoTrader.Status = "SERVER EXHAUSTED · HOPPING"
    State.AutoTrader.StatusDetail = tostring(disposition)
        .. " · using the fresh <3-minute candidate cache first, then scanning Roblox only if the cache cannot supply an eligible destination."
    State.AutoTrader.Render()

    task.spawn(function()
        -- v27: hopping never DECIDES bot identity. A staged strict-gold candidate may be carried only after this ordinary hop decision was already made.
        if Destroyed
            or not State.AutoTrader.ServerHopInProgress
            or queueGeneration ~= State.AutoTrader.ServerHopQueueGeneration then
            return
        end
        local allowed, currentDisposition = State.AutoTrader.ServerHopStillAllowed()
        if not allowed then
            State.AutoTrader.AbortServerHop("new work before scan: " .. tostring(currentDisposition))
            return
        end
        local queue, scan = State.AutoTrader.BuildPublicServerQueue()
        if not Destroyed and State.AutoTrader.ServerHopInProgress then
            State.AutoTrader.ServerHopLastProgressAt = os.clock()
        end
        if Destroyed
            or not State.AutoTrader.ServerHopInProgress
            or queueGeneration ~= State.AutoTrader.ServerHopQueueGeneration then
            return
        end
        State.AutoTrader.ServerHopQueue = queue
        State.AutoTrader.ServerHopQueueIndex = 0
        State.AutoTrader.LastServerScan = scan
        State.AutoTrader.Log("server_hop_queue_built", {
            count = #queue,
            scan = scan,
        })
        State.AutoTrader.TryNextServerHopCandidate(queueGeneration)
    end)
    return true
end
State.AutoTrader.SampleMovement = function()
    if Destroyed or not CONFIG.AutoTraderMovementWatchdogEnabled then return true end
    local now = os.clock()
    local anyTrackable = false
    local moved = false
    local seen = {}
    local threshold = CONFIG.AutoTraderMovementThresholdStuds
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        local root = character and (character:FindFirstChild("HumanoidRootPart") or character.PrimaryPart)
        if root and root:IsA("BasePart") then
            anyTrackable = true
            seen[player.UserId] = true
            local previous = State.AutoTrader.MovementSamples[player.UserId]
            local position = root.Position
            if not previous or (position - previous.position).Magnitude >= threshold then moved = true end
            State.AutoTrader.MovementSamples[player.UserId] = {position = position, at = now}
        end
    end
    for userId in pairs(State.AutoTrader.MovementSamples) do
        if not seen[userId] then State.AutoTrader.MovementSamples[userId] = nil end
    end
    if moved or not anyTrackable then State.AutoTrader.LastAnyMovementAt = now end
    if not State.AutoTrader.Preferences.automation
        or State.AutoTrader.SessionFrozen
        or State.AutoTrader.TeleportInProgress
        or State.AutoTrader.ServerHopInProgress then
        return true
    end
    local baseline = math.max(State.AutoTrader.LastAnyMovementAt or now, State.AutoTrader.MovementWatchdogArmedAt or 0)
    if anyTrackable and now - baseline >= CONFIG.AutoTraderMovementTimeoutSeconds
        and now - (State.AutoTrader.LastSameServerRecoveryAt or 0) >= CONFIG.AutoTraderSameServerRecoveryCooldownSeconds then
        State.AutoTrader.LastSameServerRecoveryAt = now
        State.AutoTrader.LastAnyMovementAt = now
        State.AutoTrader.Status = "SERVER MOTIONLESS · REJOINING"
        State.AutoTrader.StatusDetail = "No tracked player moved for " .. tostring(CONFIG.AutoTraderMovementTimeoutSeconds) .. " continuous seconds; rejoining this session when possible."
        State.AutoTrader.Log("movement_watchdog_rejoin", {jobId = game.JobId, players = #Players:GetPlayers()})
        State.AutoTrader.Render()
        State.AutoTrader.BeginTeleport("movement_watchdog_same_server", true)
    end
    return true
end
State.AutoTrader.LoadRecentJobs()
State.AutoTrader.LoadServerCandidateCache()
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then State.AutoTrader.EnsureServerPlayer(player) end
end
connect(LocalPlayer.Idled, function()
    local handled = false
    if VirtualUser then
        handled = pcall(function()
            VirtualUser:CaptureController()
            local camera = workspace.CurrentCamera
            VirtualUser:Button2Down(Vector2.new(0, 0), camera and camera.CFrame or CFrame.new())
            task.wait(0.08)
            VirtualUser:Button2Up(Vector2.new(0, 0), camera and camera.CFrame or CFrame.new())
        end)
    end
    if not handled and VirtualInputManager then
        handled = pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
            task.wait(0.04)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
        end)
    end
    State.AutoTrader.Log("anti_idle", {handled = handled})
end)
connect(Players.PlayerAdded, function(player)
    if player ~= LocalPlayer then
        State.AutoTrader.EnsureServerPlayer(player)
        State.AutoTrader.RequestFriendStatus(player)
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.ServerExhaustedSince = 0
        task.defer(function()
            if not Destroyed and type(State.Profile.QueueRemoteLeaderboardSweep) == "function" then
                State.Profile.QueueRemoteLeaderboardSweep(false)
            end
        end)
    end
end)
connect(Players.PlayerRemoving, function(player)
    State.AutoTrader.EndServerPlayerPresence(player)
end)
connect(LocalPlayer.OnTeleport, function(teleportState)
    if teleportState == Enum.TeleportState.Started then
        State.AutoTrader.TeleportInProgress = true
        if State.AutoTrader.TeleportAttemptStartedAt <= 0 then
            State.AutoTrader.TeleportAttemptStartedAt = os.clock()
            State.AutoTrader.TeleportAttemptOriginJobId = game.JobId
        end
        if not State.AutoTrader.TeleportQueued then
            State.AutoTrader.QueueTeleportScript("external_or_late_teleport")
        end
        if State.AutoTrader.ServerHopInProgress then
            State.AutoTrader.ServerHopTeleportStarted = true
        end
    end
end)
connect(TeleportService.TeleportInitFailed, function(player, result, message, placeId, teleportOptions)
    if player ~= LocalPlayer then return end
    local failedCandidate = State.AutoTrader.ServerHopCurrentCandidate
    local wasServerHop = State.AutoTrader.ServerHopInProgress and failedCandidate ~= nil
    State.AutoTrader.TeleportInProgress = false
    State.AutoTrader.TeleportAttemptStartedAt = 0
    State.AutoTrader.TeleportAttemptOriginJobId = nil
    State.AutoTrader.ServerHopTeleportStarted = false
    State.AutoTrader.LastAnyMovementAt = os.clock()
    State.AutoTrader.Log("teleport_init_failed", {
        result = tostring(result),
        message = tostring(message),
        placeId = placeId,
        serverHop = wasServerHop,
        candidateJobId = failedCandidate and failedCandidate.id or nil,
        queueIndex = State.AutoTrader.ServerHopQueueIndex,
        queueCount = #(State.AutoTrader.ServerHopQueue or {}),
    })
    if wasServerHop then
        local queueGeneration = State.AutoTrader.ServerHopQueueGeneration
        State.AutoTrader.Status = "SERVER HOP · CANDIDATE FAILED"
        State.AutoTrader.StatusDetail = "That server became unavailable/full. Trying the next screened server."
        State.AutoTrader.Render()
        task.delay(0.12, function()
            if not Destroyed and State.AutoTrader.ServerHopInProgress then
                State.AutoTrader.TryNextServerHopCandidate(queueGeneration)
            end
        end)
    else
        State.AutoTrader.ServerHopInProgress = false
        if State.AutoTrader.RecoveryTeleportRequired then
            task.delay(CONFIG.AutoTraderRecoveryRetrySeconds, function()
                if not Destroyed and State.AutoTrader.RecoveryTeleportRequired then
                    State.AutoTrader.RequestRecoveryTeleport(State.AutoTrader.RecoveryTeleportReason or "teleport initialization failed")
                end
            end)
        end
    end
end)

State.AutoTrader.SetCooldown = function(player, reason, duration)
    if not player or player == LocalPlayer then
        return
    end
    State.AutoTrader.Cooldowns[player.UserId] = {
        untilTime = os.clock() + (tonumber(duration) or CONFIG.AutoTraderCooldownSeconds),
        reason = tostring(reason or "unavailable"),
        name = player.Name,
    }
    if State.AutoTrader.SelectedTarget == player then
        State.AutoTrader.SelectedTarget = nil
    end
    State.AutoTrader.Log("cooldown", {
        userId = player.UserId,
        name = player.Name,
        reason = reason,
        duration = tonumber(duration) or CONFIG.AutoTraderCooldownSeconds,
    })
end
State.AutoTrader.CooldownRemaining = function(player)
    if not player then
        return 0
    end
    local entry = State.AutoTrader.Cooldowns[player.UserId]
    if not entry then
        return 0
    end
    local remaining = entry.untilTime - os.clock()
    if remaining <= 0 then
        State.AutoTrader.Cooldowns[player.UserId] = nil
        return 0
    end
    return remaining
end
-- v30: one eligibility model owns both target selection and server disposition.
-- This prevents a verified-positive player from making the server look ACTIVE when
-- that same player is actually blocked by cooldown/repeat/friend/economic gates.
State.AutoTrader.ReconcilePlayerActivityOutcome = function(player, entry)
    if not player or not entry then return end
    local outcome = entry.outcome
    if outcome == "request_pending" then
        local matchingPending = State.AutoTrader.PendingRequest
            and State.AutoTrader.PendingRequest.userId == player.UserId
        local matchingNative = State.AutoTrader.IsNativeOutgoingPending
            and State.AutoTrader.IsNativeOutgoingPending(player)
        if not matchingPending and not matchingNative then
            State.AutoTrader.Log("stale_request_pending_outcome_cleared", {
                userId = player.UserId, name = player.Name, reason = entry.reason,
            })
            entry.outcome = nil
            entry.outcomeAt = os.clock()
            entry.reason = "stale request_pending reconciled after native request vanished"
        end
    elseif outcome == "trading" then
        local anyTrade = State.CurrentTrade ~= nil or (isTradeVisible and isTradeVisible())
        if not anyTrade then
            State.AutoTrader.Log("stale_trading_outcome_cleared", {
                userId = player.UserId, name = player.Name, reason = entry.reason,
            })
            entry.outcome = nil
            entry.outcomeAt = os.clock()
            entry.reason = "stale trading outcome reconciled after trade state vanished"
        end
    end
end

State.AutoTrader.BuildEligibilityContext = function()
    local now = os.clock()
    local hopRate = State.AutoTrader.GetHopOpportunityRate()
    return {
        now = now,
        canEconomicSkip = now - (State.AutoTrader.ServerJoinedAt or now) >= CONFIG.AutoTraderEconomicSkipGraceSeconds,
        hopOpportunityRate = hopRate,
        opportunityFloor = math.max(
            CONFIG.AutoTraderTargetOpportunityFloor,
            hopRate * CONFIG.AutoTraderHopOpportunityRetentionFactor
        ),
    }
end

State.AutoTrader.EvaluatePlayerEligibility = function(player, context)
    context = context or State.AutoTrader.BuildEligibilityContext()
    local now = context.now or os.clock()
    local entry = State.AutoTrader.EnsureServerPlayer(player)
    if not entry then
        return {state = "ineligible", player = player, actionable = false, reason = "player unavailable"}
    end
    State.AutoTrader.ReconcilePlayerActivityOutcome(player, entry)

    if State.AutoTrader.IsTerminalServerOutcome(entry.outcome) then
        return {
            state = "terminal", player = player, entry = entry, actionable = false,
            reason = entry.reason or entry.outcome, outcome = entry.outcome,
        }
    end

    if entry.outcome == "request_pending" then
        return {state = "active_request", player = player, entry = entry, actionable = false, reason = entry.reason}
    elseif entry.outcome == "trading" then
        return {state = "active_trade", player = player, entry = entry, actionable = false, reason = entry.reason}
    end

    local knownTotal, knownVerified, knownValueReason = State.AutoTrader.GetVerifiedPlayerValue(player)
    local cooldown = State.AutoTrader.CooldownRemaining(player)
    if cooldown > 0 then
        return {
            state = "retry_later", player = player, entry = entry, actionable = false,
            retryIn = cooldown, verifiedTotal = knownVerified and knownTotal or nil,
            reason = State.AutoTrader.Cooldowns[player.UserId] and State.AutoTrader.Cooldowns[player.UserId].reason or "cooldown",
        }
    end

    local lastRequest = State.AutoTrader.RequestHistory[player.UserId] or 0
    local repeatRemaining = math.max(0, CONFIG.AutoTraderRepeatRequestSeconds - (now - lastRequest))
    if repeatRemaining > 0 then
        return {
            state = "retry_later", player = player, entry = entry, actionable = false,
            retryIn = repeatRemaining, verifiedTotal = knownVerified and knownTotal or nil, reason = "repeat-request spacing",
        }
    end

    if State.AutoTrader.Preferences.ignoreFriends then
        local friend = State.AutoTrader.GetFriendStatus(player)
        if friend == nil then
            entry.friendWaitStartedAt = (entry.friendWaitStartedAt or 0) > 0 and entry.friendWaitStartedAt or now
            local friendWait = now - entry.friendWaitStartedAt
            if friendWait >= CONFIG.AutoTraderFriendLookupMaxWaitSeconds then
                return {state = "unresolvable", player = player, entry = entry, actionable = false, verifiedTotal = knownVerified and knownTotal or nil, reason = "friend status remained unresolved past bounded wait"}
            end
            return {state = "friend_pending", player = player, entry = entry, actionable = false, verifiedTotal = knownVerified and knownTotal or nil, reason = "friend status pending"}
        elseif friend == true then
            entry.friendWaitStartedAt = 0
            return {state = "friend", player = player, entry = entry, actionable = false, verifiedTotal = knownVerified and knownTotal or nil, reason = "Ignore Friends is ON"}
        end
        entry.friendWaitStartedAt = 0
    end

    local total, verified, valueReason = knownTotal, knownVerified, knownValueReason
    if not verified or total == nil then
        local age = now - (entry.firstSeenAt or State.AutoTrader.ServerJoinedAt or now)
        if age >= CONFIG.AutoTraderUnresolvedMaxWaitSeconds then
            return {state = "unresolvable", player = player, entry = entry, actionable = false, reason = valueReason or "inventory unresolved"}
        end
        return {state = "discovery_pending", player = player, entry = entry, actionable = false, reason = valueReason or "inventory unresolved"}
    end
    if total <= 0 then
        return {state = "zero", player = player, entry = entry, actionable = false, verifiedTotal = total, reason = "verified zero"}
    end

    local score = State.AutoTrader.GetTargetScore(player, total)
    local economicPath = State.AutoTrader.TargetHasEconomicPath(total)
    if context.canEconomicSkip and (not economicPath or score < context.opportunityFloor) then
        return {
            state = "economic_hop_preferred", player = player, entry = entry, actionable = false,
            verifiedTotal = total, score = score, economicPath = economicPath,
            reason = not economicPath
                and "known inventory cannot support even the cheapest safe local denomination"
                or ("expected value/second below stay-vs-hop floor: " .. tostring(score) .. " < " .. tostring(context.opportunityFloor)),
        }
    end

    if not economicPath then
        return {
            state = "no_economic_path", player = player, entry = entry, actionable = false,
            verifiedTotal = total, score = score, economicPath = false,
            reason = "known inventory cannot support a safe local denomination",
        }
    end

    return {
        state = "actionable", player = player, entry = entry, actionable = true,
        verifiedTotal = total, score = score, economicPath = true,
    }
end

State.AutoTrader.BuildEligibilitySnapshot = function()
    local context = State.AutoTrader.BuildEligibilityContext()
    local counts = {
        total = 0, valued = 0, zero = 0, unknown = 0, unresolvable = 0,
        friend = 0, exhausted = 0, active = 0,
        verifiedPositive = 0, verifiedZero = 0, verifiedCount = 0,
        actionable = 0, economicHopPreferred = 0, retryLater = 0,
        friendPending = 0, discoveryPending = 0, noEconomicPath = 0,
    }
    local rows = {}
    local best, bestScore, bestTotal = nil, -math.huge, 0
    local bestEconomic, bestEconomicScore = nil, -math.huge
    local earliestRetry = math.huge
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            counts.total += 1
            local row = State.AutoTrader.EvaluatePlayerEligibility(player, context)
            table.insert(rows, row)
            if row.verifiedTotal ~= nil then
                counts.verifiedCount += 1
                if row.verifiedTotal > 0 then counts.verifiedPositive += 1 else counts.verifiedZero += 1 end
            end
            if row.state == "actionable" then
                counts.actionable += 1
                counts.valued += 1
                local score = tonumber(row.score) or -math.huge
                local total = tonumber(row.verifiedTotal) or 0
                if not best
                    or score > bestScore + 0.000001
                    or (math.abs(score - bestScore) <= 0.000001 and total > bestTotal)
                    or (math.abs(score - bestScore) <= 0.000001 and total == bestTotal and player.UserId < best.UserId) then
                    best, bestScore, bestTotal = player, score, total
                end
            elseif row.state == "economic_hop_preferred" then
                counts.economicHopPreferred += 1
                counts.valued += 1
                local score = tonumber(row.score) or -math.huge
                if not bestEconomic or score > bestEconomicScore then
                    bestEconomic, bestEconomicScore = player, score
                end
            elseif row.state == "no_economic_path" then
                counts.noEconomicPath += 1
                counts.valued += 1
            elseif row.state == "retry_later" then
                counts.retryLater += 1
                earliestRetry = math.min(earliestRetry, tonumber(row.retryIn) or math.huge)
                if row.verifiedTotal and row.verifiedTotal > 0 then counts.valued += 1 end
            elseif row.state == "friend_pending" then
                counts.friendPending += 1
                counts.unknown += 1
            elseif row.state == "discovery_pending" then
                counts.discoveryPending += 1
                counts.unknown += 1
            elseif row.state == "unresolvable" then
                counts.unresolvable += 1
            elseif row.state == "friend" then
                counts.friend += 1
            elseif row.state == "zero" then
                counts.zero += 1
            elseif row.state == "active_request" or row.state == "active_trade" then
                counts.active += 1
            elseif row.state == "terminal" then
                counts.exhausted += 1
            end
        end
    end
    local snapshot = {
        at = context.now,
        context = context,
        rows = rows,
        counts = counts,
        best = best,
        bestScore = best and bestScore or nil,
        bestTotal = best and bestTotal or 0,
        bestEconomic = bestEconomic,
        bestEconomicScore = bestEconomic and bestEconomicScore or nil,
        earliestRetry = earliestRetry < math.huge and earliestRetry or nil,
    }
    State.AutoTrader.LastEligibilitySnapshot = snapshot
    return snapshot
end

-- Override the older classification-only disposition with the same snapshot used
-- by SelectTarget. ACTIVE now literally means actionable or authoritatively active.
State.AutoTrader.GetServerDisposition = function()
    local counts = {
        total = 0, valued = 0, zero = 0, unknown = 0, unresolvable = 0,
        friend = 0, exhausted = 0, active = 0,
        verifiedPositive = 0, verifiedZero = 0, verifiedCount = 0,
        actionable = 0, economicHopPreferred = 0, retryLater = 0,
        friendPending = 0, discoveryPending = 0, noEconomicPath = 0,
    }
    if not State.AutoTrader.Preferences.automation then return "OFF", counts end
    if State.AutoTrader.SessionFrozen then return "FROZEN", counts end
    if State.AutoTrader.PostTradeAuditPending or State.AutoTrader.PendingRequest
        or State.AutoTrader.IsAnyNativeOutgoingPending()
        or State.AutoTrader.RequestLifecycle ~= "idle"
        or State.AutoTrader.TradeDeclinePending
        or State.CurrentTrade or (isTradeVisible and isTradeVisible()) then
        return "ACTIVE", counts
    end
    local snapshot = State.AutoTrader.BuildEligibilitySnapshot()
    counts = snapshot.counts
    if counts.actionable > 0 or counts.active > 0 then return "ACTIVE", counts end
    if counts.discoveryPending > 0 then return "WAITING_FOR_DISCOVERY", counts end
    if counts.friendPending > 0 then return "WAITING_FOR_FRIEND_STATUS", counts end
    if counts.retryLater > 0 and (snapshot.earliestRetry or math.huge) <= CONFIG.AutoTraderRetryWaitMaxSeconds then
        counts.earliestRetry = snapshot.earliestRetry
        return "WAITING_FOR_RETRY", counts
    end
    if counts.economicHopPreferred > 0 then return "EXHAUSTED_ECONOMIC_HOP_PREFERRED", counts end
    if counts.noEconomicPath > 0 then return "EXHAUSTED_NO_ECONOMIC_PATH", counts end
    if counts.retryLater > 0 then
        counts.earliestRetry = snapshot.earliestRetry
        return "EXHAUSTED_RETRY_LATER", counts
    end
    if counts.total == 0 or counts.friend == counts.total then return "EXHAUSTED_NO_ELIGIBLE_PLAYERS", counts end
    if counts.exhausted > 0 then return "EXHAUSTED_ALL_ATTEMPTED", counts end
    if counts.unresolvable > 0 then return "EXHAUSTED_UNRESOLVABLE", counts end
    return "EXHAUSTED_NO_VALUE", counts
end

State.AutoTrader.SelectTarget = function()
    local snapshot = State.AutoTrader.BuildEligibilitySnapshot()
    local context = snapshot.context
    local best = snapshot.best
    State.AutoTrader.LastOpportunityDecision = {
        at = context.now,
        hopOpportunityRate = context.hopOpportunityRate,
        retentionFloor = context.opportunityFloor,
        bestScore = snapshot.bestScore,
        bestName = best and best.Name or nil,
        bestUserId = best and best.UserId or nil,
        bestEconomicName = snapshot.bestEconomic and snapshot.bestEconomic.Name or nil,
        bestEconomicUserId = snapshot.bestEconomic and snapshot.bestEconomic.UserId or nil,
        bestEconomicScore = snapshot.bestEconomicScore,
        actionableCount = snapshot.counts.actionable,
        economicHopPreferredCount = snapshot.counts.economicHopPreferred,
        retryLaterCount = snapshot.counts.retryLater,
        earliestRetry = snapshot.earliestRetry,
    }
    State.AutoTrader.SelectedTarget = best
    State.AutoTrader.SelectedTargetScore = snapshot.bestScore or -math.huge
    State.AutoTrader.SelectedTargetValue = snapshot.bestTotal or 0
    State.AutoTrader.SelectedTargetProfile = best and State.AutoTrader.GetTargetProfile(best) or nil
    State.AutoTrader.LastDecisionEvent = {
        at=context.now, kind=best and "target" or "no_target", userId=best and best.UserId or nil,
        name=best and best.Name or nil, score=snapshot.bestScore, counts=snapshot.counts,
        hopOpportunityRate=context.hopOpportunityRate, retentionFloor=context.opportunityFloor,
    }
    return best
end
State.AutoTrader.GetLocalInventory = function(force)
    local remoteState = State.Profile.remoteTotals
    if not remoteState then
        return nil, "verified inventory unavailable"
    end
    local raw = remoteState.rawByUserId[LocalPlayer.UserId]
    local lastSuccess = remoteState.lastSuccessByUserId[LocalPlayer.UserId]
    if type(raw) ~= "table" or not lastSuccess then
        return nil, "waiting for verified local inventory"
    end
    local age = os.clock() - lastSuccess
    if age > math.max(15, CONFIG.PlayerValuesRefreshSeconds * 3) then
        return nil, "local inventory snapshot is stale"
    end
    if not force
        and State.AutoTrader.InventoryCache
        and State.AutoTrader.InventoryCacheStamp == lastSuccess then
        return State.AutoTrader.InventoryCache
    end
    if type(State.Profile.CalculateRemoteInventory) ~= "function" then
        return nil, "inventory calculator not ready"
    end
    local calculated, reason = State.Profile.CalculateRemoteInventory(raw)
    if not calculated then
        return nil, tostring(reason or "inventory calculation failed")
    end
    local entries = {}
    local byKey = {}
    local function addHints(section)
        for _, hint in ipairs(section and section.cardHints or {}) do
            local record = hint.record
            local unitValue = record and record.data and numericValue(record.data) or nil
            if record and unitValue and unitValue > 0 then
                local itemType = tostring(hint.itemType or "Weapons")
                local itemId = tostring(hint.itemId or "")
                if itemId ~= "" then
                    local key = State.Mapping.MakeItemKey(itemType, itemId)
                    local quantity = math.max(1, tonumber(hint.quantity) or 1)
                    local existing = byKey[key]
                    if existing then
                        if existing.record ~= record
                            or math.abs(existing.unitValue - unitValue) > 0.000001 then
                            existing.conflicted = true
                        else
                            existing.quantity += quantity
                        end
                    else
                        existing = {
                            key = key,
                            itemId = itemId,
                            itemType = itemType,
                            quantity = quantity,
                            record = record,
                            name = tostring(record.name or itemId),
                            unitValue = unitValue,
                            demand = tonumberSafe(record.data.demand) or 0,
                            resolutionMeta = hint.resolutionMeta,
                        }
                        byKey[key] = existing
                    end
                end
            end
        end
    end
    addHints(calculated.weapons)
    addHints(calculated.pets)
    for _, entry in pairs(byKey) do
        if not entry.conflicted then
            table.insert(entries, entry)
        end
    end
    table.sort(entries, function(a, b)
        if a.unitValue ~= b.unitValue then
            return a.unitValue > b.unitValue
        end
        return normalize(a.name) < normalize(b.name)
    end)
    State.AutoTrader.InventoryCache = {
        entries = entries,
        raw = raw,
        lastSuccess = lastSuccess,
        age = age,
        partial = calculated.partial == true,
    }
    State.AutoTrader.InventoryCacheAt = os.clock()
    State.AutoTrader.InventoryCacheStamp = lastSuccess
    return State.AutoTrader.InventoryCache
end
State.AutoTrader.GetLocalAuditSnapshot = function(force)
    local remoteState = State.Profile.remoteTotals
    if not remoteState then
        return nil, "verified inventory unavailable"
    end
    local raw = remoteState.rawByUserId[LocalPlayer.UserId]
    local lastSuccess = remoteState.lastSuccessByUserId[LocalPlayer.UserId]
    if type(raw) ~= "table" or not lastSuccess then
        return nil, "waiting for verified local inventory"
    end
    local age = os.clock() - lastSuccess
    if age > math.max(15, CONFIG.PlayerValuesRefreshSeconds * 3) then
        return nil, "local inventory snapshot is stale"
    end
    if type(State.Profile.CalculateRemoteInventory) ~= "function" then
        return nil, "inventory calculator not ready"
    end
    local calculated, reason = State.Profile.CalculateRemoteInventory(raw)
    if not calculated then
        return nil, tostring(reason or "inventory calculation failed")
    end
    local quantities = {}
    local evidence = {}
    local function add(itemType, itemId, quantity, resolved, record)
        if itemId == nil then
            return
        end
        local key = State.Mapping.MakeItemKey(itemType, itemId)
        quantity = math.max(1, math.floor(tonumber(quantity) or 1))
        quantities[key] = (quantities[key] or 0) + quantity
        evidence[key] = evidence[key] or {
            key = key,
            itemType = tostring(itemType or "Weapons"),
            itemId = tostring(itemId),
            resolved = resolved == true,
            name = record and record.name or tostring(itemId),
        }
    end
    local function ingest(section, itemType)
        for _, hint in ipairs(section and section.cardHints or {}) do
            add(
                hint.itemType or itemType,
                hint.itemId,
                hint.quantity,
                true,
                hint.record
            )
        end
        for _, miss in ipairs(section and section.unresolvedAll or {}) do
            add(
                miss.itemType or itemType,
                miss.itemId,
                miss.quantity,
                false,
                nil
            )
        end
    end
    ingest(calculated.weapons, "Weapons")
    ingest(calculated.pets, "Pets")
    return {
        quantities = quantities,
        evidence = evidence,
        raw = raw,
        lastSuccess = lastSuccess,
        age = age,
        partial = calculated.partial == true,
    }
end
State.AutoTrader.GetTradableInventory = function()
    local inventory, reason = State.AutoTrader.GetLocalInventory(false)
    if not inventory then
        return nil, reason
    end
    local result = {}
    for _, entry in ipairs(inventory.entries) do
        local reserve = State.AutoTrader.GetReserve(entry.itemType, entry.itemId)
        local available = math.max(0, math.floor(entry.quantity) - reserve)
        if available > 0 then
            local copy = {}
            for key, value in pairs(entry) do
                copy[key] = value
            end
            copy.reserve = reserve
            copy.maxQuantity = available
            copy.spareCopies = available
            table.insert(result, copy)
        end
    end
    return result, nil, inventory
end
State.AutoTrader.GetAnchor = function(entries)
    local best = nil
    local bestScore = -math.huge
    for _, entry in ipairs(entries or {}) do
        if entry.unitValue
            and entry.unitValue > 0
            and entry.unitValue <= CONFIG.AutoTraderAnchorMaxValue
            and entry.maxQuantity > 0 then
            local data = entry.record and entry.record.data or {}
            local duplicate = entry.maxQuantity >= 2 and 1 or 0
            local demand = tonumber(entry.demand) or tonumber(data.demand) or 0
            local flip = data.flippability and (FLIP_SCORE[data.flippability] or 0) or 0
            local stability = data.stability and (STABILITY_SCORE[data.stability] or 0) or 0
            local risk = 0
            if data.stability == "Receding" then risk += 3.5 end
            if data.stability == "Underpaid For" then risk += 2.0 end
            if data.stability == "Untradable" then risk += 100 end
            local costPenalty = math.log((tonumber(entry.unitValue) or 0) + 1) * 1.35
            local score = demand * 2.4
                + flip * 1.35
                + stability * 0.65
                + (State.AutoTrader.Preferences.preferDuplicates and duplicate * 3.0 or duplicate * 1.0)
                - costPenalty
                - risk
            if not best or score > bestScore + 0.000001
                or (math.abs(score - bestScore) <= 0.000001 and entry.unitValue < best.unitValue) then
                best = entry
                bestScore = score
            end
        end
    end
    State.AutoTrader.LastAnchorAttractiveness = best and bestScore or nil
    return best
end
State.AutoTrader.OfferHash = function(entries)
    local parts = {}
    for _, entry in ipairs(entries or {}) do
        table.insert(parts,
            normalizeTradeItemType(entry.itemType)
            .. "|"
            .. tostring(entry.itemId)
            .. "|"
            .. tostring(math.max(1, tonumber(entry.quantity) or 1))
        )
    end
    table.sort(parts)
    return table.concat(parts, ";")
end
State.AutoTrader.GetOfferQuantity = function(entries, itemType, itemId)
    local wanted = State.Mapping.MakeItemKey(itemType, itemId)
    for _, entry in ipairs(entries or {}) do
        if State.Mapping.MakeItemKey(entry.itemType, entry.itemId) == wanted then
            return math.max(0, math.floor(tonumber(entry.quantity) or 0))
        end
    end
    return 0
end
State.AutoTrader.SummarizeOther = function(entries)
    local summary = summarizeResolvedOffer(entries)
    summary.unknownCount = #summary.unresolved + #summary.nonNumeric
    summary.knownFloor = summary.totalValue
    return summary
end
State.AutoTrader.GetEffectiveMinimumWin = function(otherSummary)
    local base = State.AutoTrader.GetMinimumWin()
    local known = math.max(0, tonumber(otherSummary and otherSummary.knownFloor) or 0)
    local shares = otherSummary and otherSummary.stabilityShares or {}
    local receding = tonumber(shares and shares["Receding"]) or 0
    local underpaid = tonumber(shares and shares["Underpaid For"]) or 0
    local fluctuating = tonumber(shares and shares["Fluctuating"]) or 0
    local percent = CONFIG.AutoTraderMinWinPercent
        + receding * CONFIG.AutoTraderRecedingRiskPercent
        + underpaid * CONFIG.AutoTraderUnderpaidRiskPercent
        + fluctuating * CONFIG.AutoTraderFluctuatingRiskPercent
    local percentageFloor = known * percent
    local effective = math.max(base, percentageFloor)
    effective = math.ceil(effective * 10 - 0.000001) / 10
    local info = {
        base = base,
        receiveKnownFloor = known,
        percent = percent,
        percentageFloor = percentageFloor,
        effective = effective,
        recedingShare = receding,
        underpaidShare = underpaid,
        fluctuatingShare = fluctuating,
    }
    State.AutoTrader.LastEffectiveMinimumWin = info
    return effective, info
end
State.AutoTrader.EvaluateMarketGate = function(plan, otherSummary)
    local give = summarizeResolvedOffer(plan and plan.items or {})
    local receive = otherSummary or {}
    local failures = {}
    local warnings = {}
    local shares = receive.stabilityShares or {}
    local untradable = tonumber(shares["Untradable"]) or 0
    local receding = tonumber(shares["Receding"]) or 0
    local underpaid = tonumber(shares["Underpaid For"]) or 0
    if CONFIG.AutoTraderRejectUntradable and untradable > 0.000001 then
        table.insert(failures, "incoming offer contains Untradable listed value")
    end
    if receding > CONFIG.AutoTraderMaxRecedingShare then
        table.insert(
            failures,
            "incoming Receding share "
                .. formatPercent(receding * 100, false)
                .. " exceeds "
                .. formatPercent(CONFIG.AutoTraderMaxRecedingShare * 100, false)
        )
    elseif receding >= CONFIG.AutoTraderMaxRecedingShare * 0.5 then
        table.insert(warnings, "meaningful Receding exposure")
    end
    if underpaid > CONFIG.AutoTraderMaxUnderpaidShare then
        table.insert(
            failures,
            "incoming Underpaid For share "
                .. formatPercent(underpaid * 100, false)
                .. " exceeds "
                .. formatPercent(CONFIG.AutoTraderMaxUnderpaidShare * 100, false)
        )
    elseif underpaid >= CONFIG.AutoTraderMaxUnderpaidShare * 0.5 then
        table.insert(warnings, "meaningful Underpaid For exposure")
    end
    local demandDrop = nil
    if comparableCoverage(give.demandCoverage, receive.demandCoverage) then
        demandDrop = (give.demand or 0) - (receive.demand or 0)
        if demandDrop > CONFIG.AutoTraderMaxDemandDrop then
            table.insert(
                failures,
                "incoming demand is "
                    .. formatNumber(demandDrop)
                    .. " points below the outgoing offer"
            )
        end
    end
    local flipDrop = nil
    if comparableCoverage(give.flipCoverage, receive.flipCoverage) then
        flipDrop = (give.flip or 0) - (receive.flip or 0)
        if flipDrop > CONFIG.AutoTraderMaxFlipDrop then
            table.insert(
                failures,
                "incoming flippability is "
                    .. formatNumber(flipDrop)
                    .. " points below the outgoing offer"
            )
        end
    end
    local stabilityDrop = nil
    if comparableCoverage(give.stabilityCoverage, receive.stabilityCoverage) then
        stabilityDrop = (give.stability or 0) - (receive.stability or 0)
        if stabilityDrop > CONFIG.AutoTraderMaxStabilityDrop then
            table.insert(
                failures,
                "incoming stability is "
                    .. formatNumber(stabilityDrop)
                    .. " points below the outgoing offer"
            )
        end
    end
    local result = {
        ok = #failures == 0,
        failures = failures,
        warnings = warnings,
        give = {
            demand = give.demand,
            demandCoverage = give.demandCoverage,
            flip = give.flip,
            flipCoverage = give.flipCoverage,
            stability = give.stability,
            stabilityCoverage = give.stabilityCoverage,
        },
        receive = {
            demand = receive.demand,
            demandCoverage = receive.demandCoverage,
            flip = receive.flip,
            flipCoverage = receive.flipCoverage,
            stability = receive.stability,
            stabilityCoverage = receive.stabilityCoverage,
            stabilityShares = shares,
        },
        demandDrop = demandDrop,
        flipDrop = flipDrop,
        stabilityDrop = stabilityDrop,
    }
    return result.ok, result
end
State.AutoTrader.QuantityOptions = function(maxQuantity, unitValue, lower, upper)
    local maximum = math.min(
        math.floor(maxQuantity),
        math.max(0, math.floor(upper / unitValue + 0.000001))
    )
    if maximum <= 0 then
        return {}
    end
    local set = {}
    local function add(value)
        value = math.floor(tonumber(value) or 0)
        if value >= 1 and value <= maximum then
            set[value] = true
        end
    end
    if maximum <= CONFIG.AutoTraderExactQuantityLimit then
        for quantity = 1, maximum do
            add(quantity)
        end
    else
        for quantity = 1, 10 do
            add(quantity)
        end
        for quantity = maximum - 9, maximum do
            add(quantity)
        end
        for _, target in ipairs({lower, upper, (lower + upper) / 2}) do
            local center = math.floor(target / unitValue + 0.5)
            for delta = -6, 6 do
                add(center + delta)
            end
        end
        local steps = {0.10, 0.20, 0.25, 0.33, 0.40, 0.50, 0.60, 0.67, 0.75, 0.80, 0.90}
        for _, fraction in ipairs(steps) do
            add(math.floor(maximum * fraction + 0.5))
        end
    end
    local result = {}
    for quantity in pairs(set) do
        table.insert(result, quantity)
    end
    table.sort(result)
    return result
end
State.AutoTrader.GetNegotiationStage = function(otherSummary)
    local stableFor = math.max(0, os.clock() - (State.AutoTrader.OtherStableSince or os.clock()))
    local margin, stage, nextAt
    if stableFor < CONFIG.AutoTraderNegotiationStage2Seconds then
        margin, stage, nextAt = CONFIG.AutoTraderNegotiationStage1Margin, 1, CONFIG.AutoTraderNegotiationStage2Seconds
    elseif stableFor < CONFIG.AutoTraderNegotiationStage3Seconds then
        margin, stage, nextAt = CONFIG.AutoTraderNegotiationStage2Margin, 2, CONFIG.AutoTraderNegotiationStage3Seconds
    elseif stableFor < CONFIG.AutoTraderNegotiationFinalSeconds then
        margin, stage, nextAt = CONFIG.AutoTraderNegotiationStage3Margin, 3, CONFIG.AutoTraderNegotiationFinalSeconds
    else
        margin, stage, nextAt = 0, 4, nil
    end
    local hardMin = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    local known = math.max(0, tonumber(otherSummary and otherSummary.knownFloor) or 0)
    local targetProfit = math.max(hardMin, known * margin)
    return {
        stage = stage,
        margin = margin,
        stableFor = stableFor,
        nextAt = nextAt,
        nextIn = nextAt and math.max(0, nextAt - stableFor) or nil,
        targetProfit = targetProfit,
        final = stage >= 4,
    }
end

State.AutoTrader.FindPlan = function(otherSummary, inventoryEntries, generation, negotiation)
    local plannerStartedAt = os.clock()
    local gcBefore = nil
    pcall(function() gcBefore = collectgarbage("count") end)
    local function invalidPlannerInput(reason)
        return nil, reason, {
            invalidInput = true,
            plannerMilliseconds = (os.clock() - plannerStartedAt) * 1000,
            receiveKnownFloor = tonumber(otherSummary and otherSummary.knownFloor),
            inventoryEntryCount = type(inventoryEntries) == "table" and #inventoryEntries or nil,
        }
    end
    if type(otherSummary) ~= "table" then
        return invalidPlannerInput("their offer summary is unavailable")
    end
    local knownFloor = tonumber(otherSummary.knownFloor)
    if knownFloor == nil or knownFloor < 0 then
        return invalidPlannerInput("their offer summary does not have a numeric known-floor value yet")
    end
    if type(inventoryEntries) ~= "table" then
        return invalidPlannerInput("local tradable inventory entries are unavailable")
    end
    local minWin, minInfo = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    minWin = tonumber(minWin)
    if minWin == nil then return invalidPlannerInput("dynamic minimum win is unavailable") end
    local upper = knownFloor - minWin
    negotiation = negotiation or State.AutoTrader.GetNegotiationStage(otherSummary)
    if type(negotiation) ~= "table" then return invalidPlannerInput("negotiation state is unavailable") end
    local targetProfit = math.max(minWin, tonumber(negotiation.targetProfit) or minWin)
    local targetUpper = math.max(0, math.min(upper, knownFloor - targetProfit))
    local diagnostics = {
        receiveKnownFloor=knownFloor, unknownCount=tonumber(otherSummary.unknownCount) or 0,
        minimumWin=minWin, minimumWinInfo=minInfo, upper=upper, targetUpper=targetUpper,
        targetProfit=targetProfit, negotiationStage=negotiation.stage, negotiationMargin=negotiation.margin,
        proactiveAccept=negotiation.final==true, candidateCount=0, peakStates=1, pruned=false,
        quantityPruned=false, marketRejected=0, marketRejectSamples={}, exactQuantityLimit=CONFIG.AutoTraderExactQuantityLimit,
        exactStateLimit=CONFIG.AutoTraderExactStateLimit, beamWidth=CONFIG.AutoTraderBeamWidth,
        bucketFrontier=CONFIG.AutoTraderPlannerBucketFrontier, theoreticalQuantities=0, sampledQuantities=0,
        expansions=0, dominanceDiscarded=0, frontierCapped=0, beamDiscarded=0, yieldCount=0,
    }
    local function finishDiagnostics()
        diagnostics.plannerMilliseconds = (os.clock() - plannerStartedAt) * 1000
        local gcAfter = nil
        pcall(function() gcAfter = collectgarbage("count") end)
        if gcBefore and gcAfter then diagnostics.gcDeltaKb = gcAfter - gcBefore end
    end
    if upper <= 0 then finishDiagnostics(); return nil, "their known numeric value is too small for the dynamic minimum win", diagnostics end
    local preferDuplicates = State.AutoTrader.Preferences.preferDuplicates == true
    local candidates = {}
    for _, entry in ipairs(inventoryEntries or {}) do
        if entry.unitValue and entry.unitValue > 0 and entry.unitValue <= upper and entry.maxQuantity and entry.maxQuantity > 0 then
            table.insert(candidates, entry)
        end
    end
    diagnostics.candidateCount = #candidates
    table.sort(candidates, function(a,b)
        if preferDuplicates and (a.maxQuantity >= 2) ~= (b.maxQuantity >= 2) then return a.maxQuantity >= 2 end
        if a.unitValue ~= b.unitValue then return a.unitValue > b.unitValue end
        if a.demand ~= b.demand then return a.demand > b.demand end
        return a.key < b.key
    end)
    local function metricData(candidate)
        local data = candidate.record and candidate.record.data or {}
        return tonumberSafe(data.demand), data.flippability and FLIP_SCORE[data.flippability] or nil, data.stability and STABILITY_SCORE[data.stability] or nil
    end
    local function marketVector(state)
        local total = math.max(0.000001, state.total)
        local function one(sum, weight)
            local coverage = weight / total
            return coverage >= 0.5, weight > 0 and (sum / weight) or 0, coverage
        end
        local dc,dm,dv = one(state.demandWeighted, state.demandWeight)
        local fc,fm,fv = one(state.flipWeighted, state.flipWeight)
        local sc,sm,sv = one(state.stabilityWeighted, state.stabilityWeight)
        return {dc=dc,dm=dm,dv=dv,fc=fc,fm=fm,fv=fv,sc=sc,sm=sm,sv=sv}
    end
    local function dominates(a,b)
        if math.abs(a.total-b.total) > 0.000001 then return false end
        local av,bv = marketVector(a),marketVector(b)
        if av.dc ~= bv.dc or av.fc ~= bv.fc or av.sc ~= bv.sc then return false end
        local noWorse = a.slots <= b.slots
        local strictly = a.slots < b.slots
        if preferDuplicates then noWorse = noWorse and a.duplicateScore >= b.duplicateScore; strictly = strictly or a.duplicateScore > b.duplicateScore end
        noWorse = noWorse and a.demandScore >= b.demandScore
        strictly = strictly or a.demandScore > b.demandScore
        if av.dc then noWorse = noWorse and av.dm <= bv.dm + 0.000001; strictly = strictly or av.dm < bv.dm - 0.000001 end
        if av.fc then noWorse = noWorse and av.fm <= bv.fm + 0.000001; strictly = strictly or av.fm < bv.fm - 0.000001 end
        if av.sc then noWorse = noWorse and av.sm <= bv.sm + 0.000001; strictly = strictly or av.sm < bv.sm - 0.000001 end
        return noWorse and strictly
    end
    local function reconstructItems(state)
        local reversed = {}
        local cursor = state
        while cursor and cursor.addedItem do table.insert(reversed, cursor.addedItem); cursor = cursor.parent end
        local items = {}
        for i=#reversed,1,-1 do table.insert(items, reversed[i]) end
        return items
    end
    local function stateSort(a,b)
        local aPreferred,bPreferred = a.total <= targetUpper+0.000001,b.total <= targetUpper+0.000001
        if aPreferred ~= bPreferred then return aPreferred end
        local ad,bd=math.abs(targetUpper-a.total),math.abs(targetUpper-b.total)
        if math.abs(ad-bd)>0.000001 then return ad<bd end
        if a.slots~=b.slots then return a.slots<b.slots end
        if preferDuplicates and a.duplicateScore~=b.duplicateScore then return a.duplicateScore>b.duplicateScore end
        return a.demandScore>b.demandScore
    end
    local states={{total=0,slots=0,demandScore=0,duplicateScore=0,demandWeighted=0,demandWeight=0,flipWeighted=0,flipWeight=0,stabilityWeighted=0,stabilityWeight=0,parent=nil,addedItem=nil}}
    local budgetStarted=os.clock()
    local function maybeYield()
        if (os.clock()-budgetStarted)*1000 >= CONFIG.AutoTraderPlannerYieldBudgetMs then
            diagnostics.yieldCount += 1
            RunService.Heartbeat:Wait()
            budgetStarted=os.clock()
        end
    end
    for _,candidate in ipairs(candidates) do
        if Destroyed or generation~=State.AutoTrader.PlanGeneration then finishDiagnostics(); return nil,"superseded",diagnostics end
        local maxUsable=math.min(math.floor(candidate.maxQuantity),math.max(0,math.floor(upper/candidate.unitValue+0.000001)))
        diagnostics.theoreticalQuantities += maxUsable
        if maxUsable>CONFIG.AutoTraderExactQuantityLimit then diagnostics.quantityPruned=true end
        local options=State.AutoTrader.QuantityOptions(candidate.maxQuantity,candidate.unitValue,0,upper)
        diagnostics.sampledQuantities += #options
        if #options>0 then
            local byBucket={}
            local function consider(state)
                local bucket=math.floor(state.total*100+0.5)
                local frontier=byBucket[bucket]
                if not frontier then frontier={}; byBucket[bucket]=frontier end
                for i=#frontier,1,-1 do
                    local existing=frontier[i]
                    if dominates(existing,state) then diagnostics.dominanceDiscarded+=1; return end
                    if dominates(state,existing) then table.remove(frontier,i); diagnostics.dominanceDiscarded+=1 end
                end
                table.insert(frontier,state)
                if #frontier>CONFIG.AutoTraderPlannerBucketFrontier then
                    table.sort(frontier,stateSort)
                    while #frontier>CONFIG.AutoTraderPlannerBucketFrontier do table.remove(frontier); diagnostics.frontierCapped+=1 end
                end
            end
            for _,state in ipairs(states) do
                consider(state)
                if state.slots<CONFIG.MaxOfferSlots then
                    for _,quantity in ipairs(options) do
                        local total=state.total+candidate.unitValue*quantity
                        if total<=upper+0.000001 then
                            diagnostics.expansions+=1
                            local weighted=candidate.unitValue*quantity
                            local demand,flip,stability=metricData(candidate)
                            local item={key=candidate.key,itemId=candidate.itemId,itemType=candidate.itemType,name=candidate.name,quantity=quantity,unitValue=candidate.unitValue,record=candidate.record,demand=candidate.demand,reserve=candidate.reserve}
                            consider({
                                total=total,slots=state.slots+1,
                                demandScore=state.demandScore+candidate.demand*candidate.unitValue*quantity,
                                duplicateScore=state.duplicateScore+(candidate.maxQuantity>=2 and quantity or 0),
                                demandWeighted=state.demandWeighted+(demand and demand*weighted or 0), demandWeight=state.demandWeight+(demand and weighted or 0),
                                flipWeighted=state.flipWeighted+(flip and flip*weighted or 0), flipWeight=state.flipWeight+(flip and weighted or 0),
                                stabilityWeighted=state.stabilityWeighted+(stability and stability*weighted or 0), stabilityWeight=state.stabilityWeight+(stability and weighted or 0),
                                parent=state, addedItem=item,
                            })
                        end
                        maybeYield()
                    end
                end
            end
            local nextStates={}
            for _,frontier in pairs(byBucket) do for _,state in ipairs(frontier) do table.insert(nextStates,state) end end
            diagnostics.peakStates=math.max(diagnostics.peakStates,#nextStates)
            if #nextStates>CONFIG.AutoTraderExactStateLimit then
                diagnostics.pruned=true
                table.sort(nextStates,stateSort)
                local before=#nextStates
                while #nextStates>CONFIG.AutoTraderBeamWidth do table.remove(nextStates) end
                diagnostics.beamDiscarded += before-#nextStates
            end
            states=nextStates
        end
        maybeYield()
    end
    table.sort(states,stateSort)
    local best,bestMarket=nil,nil
    for _,state in ipairs(states) do
        if state.slots>0 and state.total<=upper+0.000001 then
            state.items=reconstructItems(state)
            local marketOK,market=State.AutoTrader.EvaluateMarketGate(state,otherSummary)
            if marketOK then best,bestMarket=state,market; break end
            diagnostics.marketRejected+=1
            if #diagnostics.marketRejectSamples<5 then table.insert(diagnostics.marketRejectSamples,{total=state.total,failures=market.failures}) end
        end
        maybeYield()
    end
    diagnostics.closest=best and best.total or nil
    diagnostics.solverMode=(diagnostics.pruned and "pareto-frontier+adaptive-beam" or "pareto-frontier-dp") .. (diagnostics.quantityPruned and "+sampled-quantity" or "+exact-quantity")
    finishDiagnostics()
    if not best then
        if diagnostics.marketRejected>0 then return nil,"market-quality gate rejected every candidate combination",diagnostics end
        return nil,"no numeric local combination can preserve the dynamic minimum win",diagnostics
    end
    best.parent=nil; best.addedItem=nil
    best.minWin=minWin; best.minimumWinInfo=minInfo; best.targetProfit=targetProfit; best.targetUpper=targetUpper
    best.negotiationStage=negotiation.stage; best.negotiationMargin=negotiation.margin; best.proactiveAccept=negotiation.final==true
    best.receiveTotal=otherSummary.knownFloor; best.unknownCount=otherSummary.unknownCount; best.win=otherSummary.knownFloor-best.total; best.marketGate=bestMarket
    State.AutoTrader.LastMarketGate=bestMarket
    return best,nil,diagnostics
end
State.AutoTrader.ValidatePlan = function(plan, context)
    context = type(context) == "table" and context or {}
    local expectedOtherHash = context.otherHash
    local expectedMappingRevision = context.mappingRevision
    local expectedInventoryStamp = context.inventoryStamp
    local expectedDatabaseRevision = context.databaseRevision
    local expectedDatabaseHash = context.databaseHash
    local expectedGameDataRevision = context.gameDataRevision
    local expectedPartnerUserId = context.partnerUserId
    local checks = {context = {
        mappingRevision = expectedMappingRevision,
        databaseRevision = expectedDatabaseRevision,
        databaseHash = expectedDatabaseHash,
        gameDataRevision = expectedGameDataRevision,
        partnerUserId = expectedPartnerUserId,
    }}
    local function fail(reason)
        checks.ok = false
        checks.reason = reason
        return false, checks
    end
    if not plan or type(plan.items) ~= "table" then return fail("missing plan") end
    if expectedMappingRevision == nil or State.Mapping.Revision ~= expectedMappingRevision then return fail("mapping revision changed") end
    if expectedDatabaseRevision == nil or expectedDatabaseHash == nil
        or HARDEN.supremeDataRevision ~= expectedDatabaseRevision or HARDEN.supremeDataHash ~= expectedDatabaseHash then
        return fail("Supreme database revision/hash changed")
    end
    if expectedGameDataRevision == nil or State.GameDataRevision ~= expectedGameDataRevision then return fail("game item-data revision changed") end
    local remoteState = State.Profile.remoteTotals
    if not remoteState or remoteState.lastSuccessByUserId[LocalPlayer.UserId] ~= expectedInventoryStamp then return fail("local inventory snapshot changed") end
    if type(State.CurrentTrade) ~= "table" then return fail("trade state disappeared") end
    local _, currentOtherSide = getTradeSides(State.CurrentTrade)
    if not currentOtherSide then return fail("current trade partner is unavailable") end
    local currentPartner = State.AutoTrader.GetPlayerFromSide(currentOtherSide)
    if expectedPartnerUserId and (not currentPartner or currentPartner.UserId ~= expectedPartnerUserId) then return fail("trade partner changed") end
    local currentOtherEntries = resolveTradeOffer(currentOtherSide)
    local currentHash = State.AutoTrader.OfferHash(currentOtherEntries)
    if currentHash ~= expectedOtherHash then return fail("their offer changed") end
    if State.AutoTrader.LastOtherHash ~= expectedOtherHash or os.clock() - State.AutoTrader.OtherStableSince < CONFIG.AutoTraderStableSeconds then return fail("their offer is not stable") end
    local otherSummary = State.AutoTrader.SummarizeOther(currentOtherEntries)
    if otherSummary.slotCount == 0 then return fail("their offer disappeared") end
    if not State.AutoTrader.Preferences.unknownTheirZero and otherSummary.unknownCount > 0 then return fail("their offer contains unknown value data") end
    local tradable, inventoryReason = State.AutoTrader.GetTradableInventory()
    if not tradable then return fail(tostring(inventoryReason or "tradable inventory unavailable")) end
    local allowed = {}
    for _, entry in ipairs(tradable) do allowed[entry.key] = entry end
    local recomputed, slots = 0, 0
    local validatedItems = {}
    for _, item in ipairs(plan.items) do
        slots += 1
        local source = allowed[item.key]
        if not source then return fail("plan contains an unavailable or reserved item") end
        local quantity = math.floor(tonumber(item.quantity) or 0)
        if quantity < 1 or quantity > source.maxQuantity then return fail("plan violates a reserve or owned quantity") end
        if not source.unitValue or source.unitValue <= 0 then return fail("plan contains a nonnumeric local item") end
        recomputed += source.unitValue * quantity
        table.insert(validatedItems, {
            key = source.key, itemId = source.itemId, itemType = source.itemType, name = source.name,
            quantity = quantity, unitValue = source.unitValue, record = source.record,
            demand = source.demand, reserve = source.reserve,
        })
    end
    if slots < 1 or slots > CONFIG.MaxOfferSlots then return fail("plan violates the slot cap") end
    if math.abs(recomputed - plan.total) > 0.001 then return fail("plan total does not recompute") end
    local minWin, minInfo = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    local profit = otherSummary.knownFloor - recomputed
    if profit < minWin - 0.001 then
        checks.minimumWin = minWin; checks.minimumWinInfo = minInfo
        return fail("profit is below the dynamic minimum win")
    end
    -- Re-evaluate market quality from the currently resolved inventory records, not stale planner records.
    local marketOK, market = State.AutoTrader.EvaluateMarketGate({items=validatedItems,total=recomputed}, otherSummary)
    checks.marketGate = market
    State.AutoTrader.LastMarketGate = market
    if not marketOK then return fail("market-quality gate failed: " .. table.concat(market.failures or {}, "; ")) end
    checks.ok = true
    checks.reason = "independent safety validation passed"
    checks.profit = profit; checks.minimumWin = minWin; checks.minimumWinInfo = minInfo
    checks.give = recomputed; checks.receiveKnownFloor = otherSummary.knownFloor; checks.unknownCount = otherSummary.unknownCount; checks.slots = slots
    checks.validatedItems = validatedItems
    return true, checks
end
State.AutoTrader.IsLocalAccepted = function()
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then
        tradeGui = PlayerGui:FindFirstChild("TradeGUI")
    end
    local accepted = tradeGui
        and safeFindPath(tradeGui, {"Container", "Trade", "YourOffer", "Accepted"})
    return accepted
        and accepted:IsA("GuiObject")
        and accepted.Visible == true
        and tradeGui.Enabled == true
end
State.AutoTrader.IsFatalIntegrityReason = function(reason)
    local text = string.lower(tostring(reason or ""))
    return text:find("post%-trade inventory", 1) ~= nil
        or text:find("without a usable pre%-trade audit snapshot", 1) ~= nil
end
State.AutoTrader.AbortCurrentTradeBestEffort = function(reason)
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("DeclineTrade")
    if (State.CurrentTrade or (isTradeVisible and isTradeVisible()))
        and remote and remote:IsA("RemoteEvent") then
        pcall(function() remote:FireServer() end)
    end
    State.CurrentTrade = nil
    if type(State.AutoTrader.ClearTradeRuntime) == "function" then
        pcall(State.AutoTrader.ClearTradeRuntime)
    else
        State.AutoTrader.ManagedPartnerUserId = nil
        State.AutoTrader.ActionGeneration += 1
        State.AutoTrader.ActionInFlight = nil
    end
    State.AutoTrader.Log("trade_abort_best_effort", {reason = tostring(reason or "recovery")})
end
State.AutoTrader.RequestRecoveryTeleport = function(reason)
    local text=tostring(reason or "overnight recovery")
    State.AutoTrader.RecoveryTeleportRequired=true
    State.AutoTrader.RecoveryTeleportReason=text
    State.AutoTrader.LastRecoveryReason=text
    State.AutoTrader.LastSafetyEvent = {at=os.clock(), unix=os.time(), severity="recoverable", kind="recovery", reason=text}
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.TeleportInProgress or State.AutoTrader.ServerHopInProgress then return false end
    local now=os.clock()
    if now-(State.AutoTrader.RecoveryTeleportLastAttemptAt or 0)<CONFIG.AutoTraderRecoveryRetrySeconds then return false end
    local lastSame=tonumber(State.AutoTrader.RecoveryReasonLastAt[text]) or 0
    if now-lastSame<CONFIG.AutoTraderRecoverySameReasonCooldownSeconds then return false end
    State.AutoTrader.RecoveryTeleportLastAttemptAt=now
    State.AutoTrader.RecoveryReasonLastAt[text]=now
    State.AutoTrader.Status="RECOVERING · REJOIN"
    State.AutoTrader.StatusDetail=text.." · rejoining a fresh public server so automation can continue."
    State.AutoTrader.Render()
    local started=State.AutoTrader.BeginTeleport("overnight_recovery:"..text,false)
    if started then
        State.AutoTrader.AutomaticRecoveryCount=(State.AutoTrader.AutomaticRecoveryCount or 0)+1
        State.AutoTrader.Log("automatic_recovery_started",{reason=text,count=State.AutoTrader.AutomaticRecoveryCount})
    else
        State.AutoTrader.Log("recovery_teleport_start_failed",{reason=text})
    end
    return started
end
State.AutoTrader.RecoverOperationalFreeze = function(reason)
    if State.AutoTrader.FatalIntegrityStop or not State.AutoTrader.Preferences.automation then return false end
    if State.AutoTrader.SessionFrozen and reason and State.AutoTrader.SessionFrozen ~= reason then return false end
    local frozenReason = State.AutoTrader.SessionFrozen or State.AutoTrader.OperationalFreezeReason or tostring(reason or "operational safety stop")
    State.AutoTrader.AbortCurrentTradeBestEffort(frozenReason)
    State.AutoTrader.PendingRequest = nil
    State.AutoTrader.RequestConfirmGeneration += 1
    State.AutoTrader.SessionFrozen = nil
    State.AutoTrader.OperationalFreezeAt = 0
    State.AutoTrader.OperationalFreezeReason = nil
    State.AutoTrader.NextRequestAt = os.clock() + 0.5
    State.AutoTrader.Log("operational_freeze_recovered", {reason = frozenReason})
    return State.AutoTrader.RequestRecoveryTeleport(frozenReason)
end
State.AutoTrader.Freeze = function(reason)
    if State.AutoTrader.SessionFrozen then
        return
    end
    local text = tostring(reason or "safety stop")
    local fatal = State.AutoTrader.IsFatalIntegrityReason(text)
    State.AutoTrader.SessionFrozen = text
    State.AutoTrader.FatalIntegrityStop = fatal
    State.AutoTrader.ActionGeneration += 1
    State.AutoTrader.ActionInFlight = nil
    State.AutoTrader.Desired = nil
    State.AutoTrader.Status = fatal and "FROZEN · INTEGRITY STOP" or "RECOVERING · SAFETY RESET"
    State.AutoTrader.StatusDetail = fatal
        and (text .. " Manual review is required because transaction integrity is ambiguous.")
        or (text .. " The overnight supervisor will abandon this state and rejoin automatically.")
    State.AutoTrader.LastSafetyEvent = {at=os.clock(), unix=os.time(), severity=fatal and "fatal" or "recoverable", kind="freeze", reason=text}
    State.AutoTrader.Log("freeze", {reason = text, fatal = fatal, severity = fatal and "fatal" or "recoverable"})
    if State.AutoTrader.RestoreTradeVisuals then
        State.AutoTrader.RestoreTradeVisuals()
    end
    if State.AutoTrader.Render then
        State.AutoTrader.Render()
    end
    if not fatal then
        State.AutoTrader.OperationalFreezeAt = os.clock()
        State.AutoTrader.OperationalFreezeReason = text
        task.delay(CONFIG.AutoTraderOperationalRecoveryDelaySeconds, function()
            if Destroyed or State.AutoTrader.FatalIntegrityStop then return end
            if State.AutoTrader.SessionFrozen == text then
                State.AutoTrader.RecoverOperationalFreeze(text)
            end
        end)
    end
end
State.AutoTrader.GetCurrentLocalEntries = function()
    if type(State.CurrentTrade) ~= "table" then
        return nil
    end
    local localSide = getTradeSides(State.CurrentTrade)
    if not localSide then
        return nil
    end
    return resolveTradeOffer(localSide)
end
State.AutoTrader.ObserveAction = function(localEntries)
    local action = State.AutoTrader.ActionInFlight
    local currentHash = State.AutoTrader.OfferHash(localEntries)
    if action then
        local currentQuantity = State.AutoTrader.GetOfferQuantity(
            localEntries,
            action.itemType,
            action.itemId
        )
        local passed = action.kind == "add"
            and currentQuantity > action.beforeQuantity
            or action.kind == "remove"
                and currentQuantity < action.beforeQuantity
        if passed then
            State.AutoTrader.Log("mutation_verified", {
                serial = action.serial,
                kind = action.kind,
                itemId = action.itemId,
                itemType = action.itemType,
                beforeQuantity = action.beforeQuantity,
                afterQuantity = currentQuantity,
                latency = os.clock() - action.startedAt,
            })
            State.AutoTrader.ActionInFlight = nil
            State.AutoTrader.LastManagedLocalHash = currentHash
            return true
        end
        if currentHash ~= action.beforeHash then
            State.AutoTrader.Freeze(
                "Local offer changed in an unexpected way while verifying "
                .. action.kind
                .. " "
                .. tostring(action.itemId)
                .. "."
            )
            return false
        end
        return nil
    end
    if State.AutoTrader.Preferences.automation
        and State.AutoTrader.ManagedPartnerUserId
        and State.AutoTrader.LastManagedLocalHash
        and currentHash ~= State.AutoTrader.LastManagedLocalHash then
        State.AutoTrader.Freeze("Unexpected manual/local offer mutation detected while Auto Trading was active.")
        return false
    end
    return true
end
State.AutoTrader.DecisionDataFresh = function()
    local now = os.time()
    local age = HARDEN.lastDatabaseVerifiedAt > 0 and (now - HARDEN.lastDatabaseVerifiedAt) or math.huge
    if not SupremeDatabase then
        State.AutoTrader.DataDegradedReason = "Supreme value database unavailable"
        return false, State.AutoTrader.DataDegradedReason
    end
    if age > CONFIG.DecisionDataMaxAgeSeconds then
        State.AutoTrader.DataDegradedReason = "Supreme value data has not been authoritatively refreshed for " .. tostring(math.floor(age)) .. "s"
        return false, State.AutoTrader.DataDegradedReason, age
    end
    State.AutoTrader.DataDegradedReason = nil
    return true, nil, age
end
State.AutoTrader.ActionContextValid = function(context)
    if not State.AutoTrader.Preferences.automation then
        return false, "Auto Trading is off"
    end
    if State.AutoTrader.SessionFrozen then
        return false, State.AutoTrader.SessionFrozen
    end
    local dataFresh, dataReason = State.AutoTrader.DecisionDataFresh()
    if not dataFresh then return false, dataReason end
    if State.AutoTrader.IsLocalAccepted() then
        if not State.AutoTrader.ManualAcceptHold then
            State.AutoTrader.ManualAcceptHold = true
            State.AutoTrader.ActionGeneration += 1
            State.AutoTrader.ActionInFlight = nil
            State.AutoTrader.Log("manual_accept_hold", {})
        end
        State.AutoTrader.Status = "LOCAL ACCEPT ACTIVE · HANDS OFF"
        State.AutoTrader.StatusDetail = "A local/manual acceptance is active. Auto Trader will not mutate the offer until the game resets acceptance."
        State.AutoTrader.Render()
        return false, "manual accept hold"
    elseif State.AutoTrader.ManualAcceptHold then
        State.AutoTrader.ManualAcceptHold = false
        State.AutoTrader.Log("manual_accept_reset", {})
    end
    if type(State.CurrentTrade) ~= "table" then
        return false, "trade state disappeared"
    end
    local localSide, otherSide = getTradeSides(State.CurrentTrade)
    if not localSide or not otherSide then
        return false, "trade sides unavailable"
    end
    local partner = State.AutoTrader.GetPlayerFromSide(otherSide)
    if not partner or partner.UserId ~= State.AutoTrader.ManagedPartnerUserId then
        return false, "managed trade partner changed"
    end
    if context and context.partnerUserId and partner.UserId ~= context.partnerUserId then
        return false, "plan partner changed"
    end
    if context and context.mappingRevision and State.Mapping.Revision ~= context.mappingRevision then
        return false, "mapping revision changed"
    end
    if context and context.databaseRevision and (HARDEN.supremeDataRevision ~= context.databaseRevision or HARDEN.supremeDataHash ~= context.databaseHash) then
        return false, "Supreme database revision/hash changed"
    end
    if context and context.inventoryStamp then
        local remoteState = State.Profile.remoteTotals
        if not remoteState
            or remoteState.lastSuccessByUserId[LocalPlayer.UserId] ~= context.inventoryStamp then
            return false, "local inventory snapshot changed"
        end
    end
    if context and context.otherHash ~= nil then
        local currentOtherEntries = resolveTradeOffer(otherSide)
        if State.AutoTrader.OfferHash(currentOtherEntries) ~= context.otherHash then
            return false, "their offer changed before action"
        end
    end
    return true
end
State.AutoTrader.FireMutation = function(kind, item, context, localEntries)
    if State.AutoTrader.ActionInFlight then
        return false
    end
    local valid, reason = State.AutoTrader.ActionContextValid(context)
    if not valid then
        if reason ~= "manual accept hold" and State.AutoTrader.Preferences.automation then
            State.AutoTrader.Freeze("Action precheck failed: " .. tostring(reason))
        end
        return false
    end
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remoteName = kind == "add" and "OfferItem" or kind == "remove" and "RemoveOffer" or nil
    local remote = remoteName and tradeFolder and tradeFolder:FindFirstChild(remoteName) or nil
    if not remote or not remote:IsA("RemoteEvent") then
        State.AutoTrader.Freeze("Required trade mutation remote is unavailable: " .. tostring(remoteName))
        return false
    end
    local beforeEntries = localEntries or State.AutoTrader.GetCurrentLocalEntries() or {}
    local beforeHash = State.AutoTrader.OfferHash(beforeEntries)
    if State.AutoTrader.LastManagedLocalHash
        and beforeHash ~= State.AutoTrader.LastManagedLocalHash then
        State.AutoTrader.Freeze("Offer changed between action planning and mutation precheck.")
        return false
    end
    local beforeQuantity = State.AutoTrader.GetOfferQuantity(beforeEntries, item.itemType, item.itemId)
    if kind == "add" then
        local tradable, inventoryReason = State.AutoTrader.GetTradableInventory()
        if not tradable then
            State.AutoTrader.Freeze(tostring(inventoryReason or "tradable inventory unavailable"))
            return false
        end
        local allowed = nil
        local key = State.Mapping.MakeItemKey(item.itemType, item.itemId)
        for _, candidate in ipairs(tradable) do
            if candidate.key == key then
                allowed = candidate
                break
            end
        end
        if not allowed or beforeQuantity >= allowed.maxQuantity then
            State.AutoTrader.Freeze("Add mutation would violate owned quantity or configured reserve for " .. tostring(item.itemId) .. ".")
            return false
        end
    end
    State.AutoTrader.ActionSerial += 1
    local serial = State.AutoTrader.ActionSerial
    local generation = State.AutoTrader.ActionGeneration
    State.AutoTrader.ActionInFlight = {
        serial = serial,
        generation = generation,
        kind = kind,
        itemId = item.itemId,
        itemType = item.itemType,
        beforeHash = beforeHash,
        beforeQuantity = beforeQuantity,
        startedAt = os.clock(),
    }
    State.AutoTrader.Status = kind == "add" and "ADDING · VERIFYING" or "REMOVING · VERIFYING"
    State.AutoTrader.StatusDetail = tostring(item.name or item.itemId) .. " · one mutation, waiting for authoritative UpdateTrade."
    State.AutoTrader.Log("mutation_sent", {
        serial = serial,
        kind = kind,
        itemId = item.itemId,
        itemType = item.itemType,
        beforeQuantity = beforeQuantity,
        contextKind = context and context.kind or nil,
    })
    State.AutoTrader.Render()
    local ok, err = pcall(function()
        remote:FireServer(item.itemId, item.itemType)
    end)
    if not ok then
        State.AutoTrader.ActionInFlight = nil
        State.AutoTrader.Freeze("Trade mutation call failed: " .. tostring(err))
        return false
    end
    task.delay(CONFIG.AutoTraderActionTimeoutSeconds, function()
        if Destroyed then
            return
        end
        local active = State.AutoTrader.ActionInFlight
        if not active or active.serial ~= serial or active.generation ~= generation then
            return
        end
        local currentEntries = State.AutoTrader.GetCurrentLocalEntries() or {}
        local currentQuantity = State.AutoTrader.GetOfferQuantity(currentEntries, item.itemType, item.itemId)
        local passed = kind == "add"
            and currentQuantity > beforeQuantity
            or kind == "remove"
                and currentQuantity < beforeQuantity
        if passed then
            State.AutoTrader.ActionInFlight = nil
            State.AutoTrader.LastManagedLocalHash = State.AutoTrader.OfferHash(currentEntries)
            State.AutoTrader.Log("mutation_verified_timeout_poll", {
                serial = serial,
                afterQuantity = currentQuantity,
            })
            scheduleTradeRefresh(0)
            return
        end
        State.AutoTrader.ActionInFlight = nil
        State.AutoTrader.Freeze(
            "No verified postcondition after "
            .. formatNumber(CONFIG.AutoTraderActionTimeoutSeconds)
            .. "s for "
            .. kind
            .. " "
            .. tostring(item.itemId)
            .. ". No retry was attempted."
        )
    end)
    return true
end
State.AutoTrader.RememberHiddenProperty = function(object, property)
    if not object or not object.Parent then
        return
    end
    local indexed = State.AutoTrader.BackgroundRestoreIndex[object]
    if not indexed then
        indexed = {}
        State.AutoTrader.BackgroundRestoreIndex[object] = indexed
    end
    if indexed[property] then
        return
    end
    local ok, value = pcall(function()
        return object[property]
    end)
    if not ok then
        return
    end
    indexed[property] = true
    table.insert(State.AutoTrader.BackgroundRestore, {
        object = object,
        property = property,
        value = value,
    })
end
State.AutoTrader.HideBackgroundObject = function(object)
    if not object or not object.Parent then
        return
    end
    if object:IsA("ScreenGui") then
        State.AutoTrader.RememberHiddenProperty(object, "Enabled")
        pcall(function()
            object.Enabled = false
        end)
    elseif object:IsA("GuiObject") then
        State.AutoTrader.RememberHiddenProperty(object, "Visible")
        pcall(function()
            object.Visible = false
        end)
    end
end
State.AutoTrader.SuppressTradeVisuals = function()
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen then
        return
    end
    State.AutoTrader.BackgroundSuppressed = true
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then
        tradeGui = PlayerGui:FindFirstChild("TradeGUI")
    end
    local container = tradeGui and tradeGui:FindFirstChild("Container")
    State.AutoTrader.HideBackgroundObject(container)
    State.AutoTrader.HideBackgroundObject(TradePanel)
    local globalFade = PlayerGui:FindFirstChild("Fade")
    State.AutoTrader.HideBackgroundObject(globalFade)
    local mainGui = PlayerGui:FindFirstChild("MainGUI")
    local gameFrame = mainGui and mainGui:FindFirstChild("Game")
    local gameFade = gameFrame and gameFrame:FindFirstChild("Fade")
    State.AutoTrader.HideBackgroundObject(gameFade)
end
State.AutoTrader.RestoreTradeVisuals = function()
    for index = #State.AutoTrader.BackgroundRestore, 1, -1 do
        local entry = State.AutoTrader.BackgroundRestore[index]
        if entry and entry.object and entry.object.Parent then
            pcall(function()
                entry.object[entry.property] = entry.value
            end)
        end
    end
    table.clear(State.AutoTrader.BackgroundRestore)
    State.AutoTrader.BackgroundRestoreIndex = setmetatable({}, {__mode = "k"})
    State.AutoTrader.BackgroundSuppressed = false
end
State.AutoTrader.ShowSuccessNotification = function(partner, plan, auditText)
    State.AutoTrader.NotificationSerial += 1
    local serial = State.AutoTrader.NotificationSerial
    if UI.AutoTraderSuccessNotification and UI.AutoTraderSuccessNotification.Parent then
        UI.AutoTraderSuccessNotification:Destroy()
    end
    local frame = create("Frame", {
        Name = "SV_AutoTraderSuccessNotification",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -18, 0, 18),
        Size = UDim2.fromOffset(310, 92),
        BackgroundColor3 = THEME.bg,
        BorderSizePixel = 0,
        ZIndex = 1900,
    }, UI.RootGui)
    UI.AutoTraderSuccessNotification = frame
    addCorner(frame, 5)
    addStroke(frame, THEME.green, 1, 0.05)
    local title = makeLabel(frame, "AUTO TRADE COMPLETE", 11, THEME.green, Enum.Font.ArialBold)
    title.Position = UDim2.fromOffset(12, 8)
    title.Size = UDim2.new(1, -48, 0, 18)
    title.ZIndex = 1901
    local details = partner and ("Successful trade with " .. partner.Name) or "Successful automated trade"
    if plan then
        details = details
            .. "\nGave "
            .. formatCompact(plan.total)
            .. " · received "
            .. formatCompact(plan.receiveTotal)
            .. (plan.unknownCount and plan.unknownCount > 0 and "+" or "")
            .. " · +"
            .. formatCompact(plan.win)
            .. " min"
    end
    if auditText and auditText ~= "" then
        details = details .. "\n" .. auditText
    end
    local body = makeLabel(frame, details, 9, THEME.text, Enum.Font.Arial)
    body.Position = UDim2.fromOffset(12, 29)
    body.Size = UDim2.new(1, -24, 0, 54)
    body.TextWrapped = true
    body.TextYAlignment = Enum.TextYAlignment.Top
    body.ZIndex = 1901
    local close = makeButton(frame, "×", UDim2.fromOffset(26, 22), THEME.panel2)
    close.Position = UDim2.new(1, -34, 0, 7)
    close.TextColor3 = THEME.muted
    close.ZIndex = 1902
    connect(close.MouseButton1Click, function()
        if frame.Parent then
            frame:Destroy()
        end
    end)
    task.delay(CONFIG.AutoTraderSuccessNotificationSeconds, function()
        if Destroyed or serial ~= State.AutoTrader.NotificationSerial then
            return
        end
        if frame.Parent then
            frame:Destroy()
        end
    end)
end
State.AutoTrader.NoteTradeUpdate = function(trade)
    if (State.AutoTrader.TradeBeganAt or 0) <= 0 and type(trade) == "table" then
        State.AutoTrader.TradeBeganAt = os.clock()
    end
    State.AutoTrader.LastTradeUpdateAt = os.clock()
    State.AutoTrader.LastTradeActivityAt = State.AutoTrader.LastTradeUpdateAt
    local owned = State.AutoTrader.PendingAutoTransaction
    if owned and type(trade) == "table" then
        local localSide, otherSide = getTradeSides(trade)
        local localEntries = localSide and resolveTradeOffer(localSide) or nil
        local otherEntries = otherSide and resolveTradeOffer(otherSide) or nil
        local tokenChanged = trade.LastOffer ~= nil and tostring(trade.LastOffer) ~= tostring(owned.token)
        local localChanged = localEntries and State.AutoTrader.OfferHash(localEntries) ~= owned.localHash
        local otherChanged = otherEntries and State.AutoTrader.OfferHash(otherEntries) ~= owned.otherHash
        if tokenChanged or localChanged or otherChanged then
            State.AutoTrader.Log("owned_auto_transaction_invalidated_by_trade_update", {
                generation = owned.generation, tokenChanged = tokenChanged,
                localChanged = localChanged, otherChanged = otherChanged,
            })
            State.AutoTrader.PendingAutoTransaction = nil
            State.AutoTrader.SettlementStartedAt = 0
            State.AutoTrader.SettlementGoneSince = 0
            State.AutoTrader.SettlementLastProbeAt = 0
            State.AutoTrader.SettlementEndedProbeCount = 0
        end
    end
    State.AutoTrader.AutoAcceptGeneration += 1
    State.AutoTrader.AutoAcceptScheduledKey = nil
    State.AutoTrader.AutoAcceptSentKey = nil
    State.AutoTrader.AutoAcceptSentAt = 0
    State.AutoTrader.AutoAcceptTradeUpdateAt = 0
    State.AutoTrader.OtherAcceptedAt = 0
    if type(trade) == "table" then
        State.AutoTrader.Log("acceptance_reset_trade_update", {
            lastOffer = trade.LastOffer,
        })
    end
end
State.AutoTrader.GetAcceptCooldown = function()
    local elapsed = os.clock() - (State.AutoTrader.LastTradeUpdateAt or 0)
    local remaining = math.max(0, CONFIG.AutoTraderAcceptDelaySeconds - elapsed)
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then
        tradeGui = PlayerGui:FindFirstChild("TradeGUI")
    end
    local cooldown = tradeGui
        and safeFindPath(tradeGui, {"Container", "Trade", "Actions", "Accept", "Cooldown"})
    if cooldown and cooldown:IsA("GuiObject") and cooldown.Visible then
        local title = cooldown:FindFirstChild("Title")
        local text = title and title:IsA("TextLabel") and title.Text or nil
        local number = text and tonumber(tostring(text):match("%((%-?%d+)%)")) or nil
        if number and number > 0 then
            remaining = math.max(remaining, number + 0.1)
        else
            remaining = math.max(remaining, CONFIG.AutoTraderAcceptRetryCheckSeconds)
        end
        return false, remaining, text
    end
    return remaining <= 0, remaining, nil
end
State.AutoTrader.BuildAcceptKey = function(partner, localEntries, otherEntries, token)
    return tostring(partner and partner.UserId or "?")
        .. "|"
        .. State.AutoTrader.OfferHash(localEntries or {})
        .. "|"
        .. State.AutoTrader.OfferHash(otherEntries or {})
        .. "|"
        .. tostring(token)
        .. "|"
        .. tostring(State.Mapping.Revision)
        .. "|"
        .. tostring(SupremeDatabase)
end
State.AutoTrader.ValidateAutoAccept = function()
    if not State.AutoTrader.Preferences.automation then
        return false, "Auto Trading is off"
    end
    if State.AutoTrader.SessionFrozen then
        return false, State.AutoTrader.SessionFrozen
    end
    local dataFresh, dataReason = State.AutoTrader.DecisionDataFresh()
    if not dataFresh then return false, dataReason end
    if State.AutoTrader.ActionInFlight then
        return false, "offer mutation is still being verified"
    end
    if type(State.CurrentTrade) ~= "table" then
        return false, "trade state disappeared"
    end
    local localSide, otherSide = getTradeSides(State.CurrentTrade)
    if not localSide or not otherSide then
        return false, "trade sides unavailable"
    end
    local partner = State.AutoTrader.GetPlayerFromSide(otherSide)
    if not partner or partner.UserId ~= State.AutoTrader.ManagedPartnerUserId then
        return false, "managed trade partner changed"
    end
    local allowed, reason = State.AutoTrader.PlayerAllowed(partner)
    if not allowed then
        return false, tostring(reason)
    end
    local plan = State.AutoTrader.Plan
    if not plan or not State.AutoTrader.Desired or State.AutoTrader.Desired.kind ~= "plan" then
        return false, "no verified final plan"
    end
    local localEntries = resolveTradeOffer(localSide)
    local otherEntries = resolveTradeOffer(otherSide)
    if State.AutoTrader.OfferHash(localEntries) ~= State.AutoTrader.OfferHash(plan.items) then
        return false, "local offer is not the exact verified plan"
    end
    local otherHash = State.AutoTrader.OfferHash(otherEntries)
    if otherHash ~= State.AutoTrader.LastOtherHash then
        return false, "their offer changed"
    end
    if os.clock() - State.AutoTrader.OtherStableSince < CONFIG.AutoTraderStableSeconds then
        return false, "their offer is not stable"
    end
    local remoteState = State.Profile.remoteTotals
    local inventoryStamp = remoteState and remoteState.lastSuccessByUserId[LocalPlayer.UserId] or nil
    local planned = type(plan.validationContext) == "table" and plan.validationContext or {}
    local safe, safety = State.AutoTrader.ValidatePlan(plan, {
        otherHash = otherHash,
        mappingRevision = planned.mappingRevision or State.Mapping.Revision,
        inventoryStamp = inventoryStamp,
        databaseRevision = planned.databaseRevision or HARDEN.supremeDataRevision,
        databaseHash = planned.databaseHash or HARDEN.supremeDataHash,
        gameDataRevision = planned.gameDataRevision or State.GameDataRevision,
        partnerUserId = partner.UserId,
    })
    if not safe then
        return false, tostring(safety and safety.reason or "independent plan validation failed")
    end
    local token = State.CurrentTrade.LastOffer
    if token == nil then
        return false, "trade LastOffer token is unavailable"
    end
    local cooldownReady, remaining, cooldownText = State.AutoTrader.GetAcceptCooldown()
    if not cooldownReady then
        return false, "accept cooldown", {
            remaining = remaining,
            text = cooldownText,
        }
    end
    return true, {
        partner = partner,
        plan = plan,
        localEntries = localEntries,
        otherEntries = otherEntries,
        otherHash = otherHash,
        token = token,
        safety = safety,
        inventoryStamp = inventoryStamp,
        acceptKey = State.AutoTrader.BuildAcceptKey(partner, localEntries, otherEntries, token),
    }
end
State.AutoTrader.ScheduleAutoAccept = function(delaySeconds)
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen then
        return
    end
    State.AutoTrader.AutoAcceptGeneration += 1
    local generation = State.AutoTrader.AutoAcceptGeneration
    local delayValue = math.max(CONFIG.AutoTraderAcceptRetryCheckSeconds, tonumber(delaySeconds) or CONFIG.AutoTraderAcceptRetryCheckSeconds)
    State.AutoTrader.Status = "AUTO ACCEPT · COOLDOWN"
    State.AutoTrader.StatusDetail = "Exact offer is verified. Waiting " .. formatNumber(delayValue) .. "s for the game's acceptance cooldown."
    State.AutoTrader.Render()
    task.delay(delayValue, function()
        if Destroyed or generation ~= State.AutoTrader.AutoAcceptGeneration then
            return
        end
        State.AutoTrader.AutoAcceptScheduledKey = nil
        State.AutoTrader.TryAutoAccept()
    end)
end
State.AutoTrader.CaptureAcceptAudit = function(info)
    local snapshot, reason = State.AutoTrader.GetLocalAuditSnapshot(false)
    if not snapshot then
        State.AutoTrader.Log("accept_audit_snapshot_failed", {reason = reason})
        return nil
    end
    local before = {}
    for key, quantity in pairs(snapshot.quantities or {}) do
        before[key] = quantity
    end
    local expected = {}
    local outgoing = {}
    local incoming = {}
    local function touchExpected(key)
        if expected[key] == nil then
            expected[key] = before[key] or 0
        end
    end
    for _, item in ipairs(info.plan.items or {}) do
        local key = State.Mapping.MakeItemKey(item.itemType, item.itemId)
        local quantity = math.max(1, math.floor(tonumber(item.quantity) or 1))
        touchExpected(key)
        expected[key] -= quantity
        outgoing[key] = (outgoing[key] or 0) + quantity
    end
    for _, item in ipairs(info.otherEntries or {}) do
        local key = State.Mapping.MakeItemKey(item.itemType, item.itemId)
        local quantity = math.max(1, math.floor(tonumber(item.quantity) or 1))
        touchExpected(key)
        expected[key] += quantity
        incoming[key] = (incoming[key] or 0) + quantity
    end
    for key, quantity in pairs(expected) do
        if quantity < 0 then
            State.AutoTrader.Log("accept_audit_negative_expected", {
                key = key,
                quantity = quantity,
            })
            return nil
        end
    end
    return {
        stamp = snapshot.lastSuccess,
        before = before,
        expected = expected,
        outgoing = outgoing,
        incoming = incoming,
        evidence = snapshot.evidence,
        partial = snapshot.partial,
        plan = info.plan,
        databaseRevision = HARDEN.supremeDataRevision,
        databaseHash = HARDEN.supremeDataHash,
        mappingRevision = State.Mapping.Revision,
        strategySchemaVersion = STRATEGY_SCHEMA_VERSION,
        strategyConfigSignature = currentStrategyConfigSignature(),
        controllerVersion = CONTROLLER_VERSION,
    }
end
State.AutoTrader.TryAutoAccept = function()
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen then
        return false
    end
    if State.AutoTrader.IsLocalAccepted() then
        State.AutoTrader.Status = "LOCAL ACCEPT ACTIVE · WAITING"
        State.AutoTrader.StatusDetail = "A local acceptance is already active; automation will not send another acceptance."
        State.AutoTrader.Render()
        return false
    end
    local valid, info, extra = State.AutoTrader.ValidateAutoAccept()
    if not valid then
        if info == "accept cooldown" then
            State.AutoTrader.ScheduleAutoAccept(extra and extra.remaining or CONFIG.AutoTraderAcceptRetryCheckSeconds)
        elseif info ~= "no verified final plan"
            and info ~= "offer mutation is still being verified"
            and info ~= "their offer is not stable" then
            State.AutoTrader.Status = "AUTO ACCEPT · BLOCKED"
            State.AutoTrader.StatusDetail = tostring(info)
            State.AutoTrader.Render()
        end
        return false
    end
    if State.AutoTrader.AutoAcceptSentKey
        and State.AutoTrader.AutoAcceptTradeUpdateAt == State.AutoTrader.LastTradeUpdateAt
        and State.AutoTrader.AutoAcceptSentKey ~= info.acceptKey then
        State.AutoTrader.Freeze("Safety inputs changed after automatic acceptance without an authoritative trade reset.")
        return false
    end
    if State.AutoTrader.AutoAcceptSentKey == info.acceptKey then
        State.AutoTrader.Status = State.AutoTrader.OtherAcceptedAt > 0
            and "AUTO ACCEPTED · COMPLETING"
            or "AUTO ACCEPTED · WAITING"
        State.AutoTrader.StatusDetail = State.AutoTrader.OtherAcceptedAt > 0
            and "Both sides have accepted this exact offer. Waiting for the server completion signal."
            or "Your exact verified offer was accepted automatically. Waiting for the other player."
        State.AutoTrader.Render()
        return true
    end
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("AcceptTrade")
    if not remote or not remote:IsA("RemoteEvent") then
        State.AutoTrader.Freeze("Trade.AcceptTrade RemoteEvent is unavailable.")
        return false
    end
    local acceptAudit = State.AutoTrader.CaptureAcceptAudit(info)
    if not acceptAudit then
        State.AutoTrader.Freeze("A fresh verified pre-trade inventory snapshot was unavailable at the final acceptance gate.")
        return false
    end
    State.AutoTrader.AutoAcceptSentKey = info.acceptKey
    State.AutoTrader.AutoAcceptSentAt = os.clock()
    State.AutoTrader.AutoAcceptTradeUpdateAt = State.AutoTrader.LastTradeUpdateAt
    State.AutoTrader.LastAcceptAudit = acceptAudit
    State.AutoTrader.AutoTransactionGeneration += 1
    State.AutoTrader.PendingAutoTransaction = {
        generation = State.AutoTrader.AutoTransactionGeneration,
        partnerUserId = info.partner.UserId,
        partnerName = info.partner.Name,
        token = info.token,
        acceptKey = info.acceptKey,
        localHash = State.AutoTrader.OfferHash(info.localEntries),
        otherHash = info.otherHash,
        acceptedAt = os.clock(),
        tradeBeganAt = State.AutoTrader.TradeBeganAt,
        requestStartedAt = State.AutoTrader.TradeRequestStartedAt,
        audit = acceptAudit,
        plan = info.plan,
        databaseRevision = HARDEN.supremeDataRevision,
        databaseHash = HARDEN.supremeDataHash,
        mappingRevision = State.Mapping.Revision,
        correlationId = State.AutoTrader.TradeCorrelationId
            or (State.AutoTrader.ControllerEpoch .. ":trade:" .. tostring(State.AutoTrader.AutoTransactionGeneration)),
    }
    State.AutoTrader.SettlementGoneSince = 0
    State.AutoTrader.SettlementLastProbeAt = 0
    State.AutoTrader.SettlementEndedProbeCount = 0
    if State.AutoTrader.OtherAcceptedAt > 0 then
        State.AutoTrader.SettlementStartedAt = os.clock()
    end
    State.AutoTrader.Status = State.AutoTrader.OtherAcceptedAt > 0
        and "AUTO ACCEPT · COMPLETING"
        or "AUTO ACCEPTED · WAITING"
    State.AutoTrader.StatusDetail = State.AutoTrader.OtherAcceptedAt > 0
        and "Sending acceptance for the exact independently verified offer; the other side is already accepted."
        or "Accepted the exact independently verified offer automatically. Waiting for the other player."
    State.AutoTrader.Log("auto_accept_sent", {
        partner = info.partner.Name,
        userId = info.partner.UserId,
        token = info.token,
        localHash = State.AutoTrader.OfferHash(info.localEntries),
        otherHash = info.otherHash,
        correlationId = State.AutoTrader.PendingAutoTransaction and State.AutoTrader.PendingAutoTransaction.correlationId or nil,
        give = info.plan.total,
        receiveKnownFloor = info.plan.receiveTotal,
        win = info.plan.win,
    })
    State.AutoTrader.Render()
    local ok, err = pcall(function()
        remote:FireServer(game.PlaceId * 3, info.token)
    end)
    if not ok then
        State.AutoTrader.AutoAcceptSentKey = nil
        State.AutoTrader.PendingAutoTransaction = nil
        State.AutoTrader.SettlementStartedAt = 0
        State.AutoTrader.SettlementGoneSince = 0
        State.AutoTrader.Freeze("Auto Accept call failed: " .. tostring(err))
        return false
    end
    return true
end
State.AutoTrader.RunPostTradeAudit = function(audit, receivedItems, partner, completedPlan, tradeSeconds, requestToCompletionSeconds, options)
    options = type(options) == "table" and options or {}
    if not audit then
        State.AutoTrader.PostTradeAuditPending = false
        State.AutoTrader.PostTradeAuditStartedAt = 0
        State.AutoTrader.PostTradeAuditOwner = nil
        State.AutoTrader.Preferences.automation = false
        State.AutoTrader.SavePreferences()
        State.AutoTrader.FatalIntegrityStop = true
        State.AutoTrader.SessionFrozen = "Server completed an owned automated trade without a usable pre-trade audit snapshot. Auto Trading was disabled."
        State.AutoTrader.Status = "FROZEN · AUDIT MISSING"
        State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
        if partner then State.AutoTrader.RecordTargetEvent(partner, "auditFailure") end
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.PostTradeAuditPending = true
    State.AutoTrader.PostTradeAuditStartedAt = os.clock()
    State.AutoTrader.PostTradeAuditGeneration += 1
    local generation = State.AutoTrader.PostTradeAuditGeneration
    State.AutoTrader.PostTradeAuditOwner = options.owner or {
        generation = options.ownerGeneration,
        partnerUserId = partner and partner.UserId or options.partnerUserId,
    }
    State.AutoTrader.LastReplayFixture = {
        capturedAtUnix=os.time(), controllerVersion=CONTROLLER_VERSION,
        partnerUserId=partner and partner.UserId or options.partnerUserId, partnerName=partner and partner.Name or nil,
        audit=compactDebugValue(audit), plan=compactDebugValue(completedPlan),
        receivedItems=compactDebugValue(receivedItems), databaseRevision=audit.databaseRevision, databaseHash=audit.databaseHash,
        mappingRevision=audit.mappingRevision, strategySchemaVersion=STRATEGY_SCHEMA_VERSION,
    }
    local expected = {}
    for key, quantity in pairs(audit.expected or {}) do expected[key] = quantity end

    local serverIncoming = {}
    for _, item in ipairs(type(receivedItems) == "table" and receivedItems or {}) do
        if type(item) == "table" then
            local itemId = item[1] or item.ItemID or item.ItemId
            local itemType = item.ItemType or item.Type or item[3] or "Weapons"
            local quantity = math.max(1, math.floor(tonumber(item[2] or item.Amount or item.Quantity) or 1))
            if itemId ~= nil then
                local key = State.Mapping.MakeItemKey(itemType, itemId)
                serverIncoming[key] = (serverIncoming[key] or 0) + quantity
            end
        end
    end
    local serverMismatches = {}
    if next(serverIncoming) ~= nil then
        local keys = {}
        for key in pairs(audit.incoming or {}) do keys[key] = true end
        for key in pairs(serverIncoming) do keys[key] = true end
        for key in pairs(keys) do
            local wanted, observed = audit.incoming[key] or 0, serverIncoming[key] or 0
            if wanted ~= observed then
                table.insert(serverMismatches, {key = key, expectedReceived = wanted, serverReported = observed})
            end
        end
    end

    local function inventoryMismatchesFor(fresh)
        local quantities = fresh and fresh.quantities or {}
        local mismatches = {}
        for key, wanted in pairs(expected) do
            local observed = quantities[key] or 0
            if observed ~= wanted then
                table.insert(mismatches, {
                    key = key, expected = wanted, observed = observed,
                    before = audit.before and audit.before[key] or 0,
                    gave = audit.outgoing and audit.outgoing[key] or 0,
                    received = audit.incoming and audit.incoming[key] or 0,
                })
            end
        end
        return mismatches
    end
    local function unchangedFromBefore(fresh)
        local quantities = fresh and fresh.quantities or {}
        for key in pairs(expected) do
            if (quantities[key] or 0) ~= (audit.before and audit.before[key] or 0) then return false end
        end
        return true
    end
    local refreshInFlight = false
    local function requestLocalRefresh()
        if refreshInFlight then return end
        refreshInFlight = true
        task.spawn(function()
            if Destroyed or generation ~= State.AutoTrader.PostTradeAuditGeneration then
                refreshInFlight = false
                return
            end
            if type(State.Profile.FetchRemoteTotalForPlayer) == "function" then
                local ok, reason = State.Profile.FetchRemoteTotalForPlayer(LocalPlayer, true)
                State.AutoTrader.Log("post_trade_local_inventory_refresh", {ok = ok, reason = reason, generation = generation})
            elseif type(State.Profile.QueueRemoteLeaderboardSweep) == "function" then
                State.Profile.QueueRemoteLeaderboardSweep(true)
            end
            refreshInFlight = false
        end)
    end

    State.AutoTrader.Status = "AUDITING TRADE"
    State.AutoTrader.StatusDetail = options.recoveredWithoutCompletion
        and "The owned trade ended without the completion event. Verifying repeated fresh inventory snapshots before deciding whether it settled."
        or "Trade completed. Verifying the server receipt and repeated fresh inventory deltas before selecting another player."
    State.AutoTrader.Render()

    task.spawn(function()
        local deadline = os.clock() + CONFIG.AutoTraderPostTradeAuditTimeoutSeconds
        local latestFresh, latestReason, latestInventoryMismatches = nil, nil, nil
        local freshSamples = 0
        local lastSeenStamp = tonumber(audit.stamp) or 0
        local nextRefreshAt = 0
        local passed = false
        while not Destroyed and generation == State.AutoTrader.PostTradeAuditGeneration and os.clock() < deadline do
            local now = os.clock()
            if now >= nextRefreshAt then
                nextRefreshAt = now + 0.70
                requestLocalRefresh()
            end
            task.wait(0.18)
            local remoteState = State.Profile.remoteTotals
            local stamp = remoteState and tonumber(remoteState.lastSuccessByUserId[LocalPlayer.UserId]) or nil
            if stamp and stamp > lastSeenStamp and stamp > (tonumber(audit.stamp) or 0) then
                State.AutoTrader.InventoryCache = nil
                State.AutoTrader.InventoryCacheStamp = nil
                local fresh, reason = State.AutoTrader.GetLocalAuditSnapshot(true)
                latestReason = reason
                if fresh and tonumber(fresh.lastSuccess) and tonumber(fresh.lastSuccess) > lastSeenStamp then
                    latestFresh = fresh
                    lastSeenStamp = tonumber(fresh.lastSuccess)
                    freshSamples += 1
                    latestInventoryMismatches = inventoryMismatchesFor(fresh)
                    State.AutoTrader.Log("post_trade_audit_fresh_sample", {
                        generation = generation, sample = freshSamples,
                        mismatches = #latestInventoryMismatches,
                        serverMismatches = #serverMismatches,
                    })
                    if #latestInventoryMismatches == 0 and #serverMismatches == 0 then
                        passed = true
                        break
                    end
                    -- A mismatch on the first freshly timestamped snapshot can be
                    -- propagation lag. Keep polling until it resolves or the deadline.
                    nextRefreshAt = 0
                end
            end
        end
        if Destroyed or generation ~= State.AutoTrader.PostTradeAuditGeneration then return end

        if not latestFresh then
            State.AutoTrader.PostTradeAuditPending = false
            State.AutoTrader.PostTradeAuditStartedAt = 0
            State.AutoTrader.PostTradeAuditOwner = nil
            State.AutoTrader.LastAuditDetail = {
                result = "timeout_rejoin", reason = latestReason, freshSamples = freshSamples,
                expected = expected, outgoing = audit.outgoing, incoming = audit.incoming,
                serverIncoming = serverIncoming, serverMismatches = serverMismatches,
                recoveredWithoutCompletion = options.recoveredWithoutCompletion == true,
            }
            if partner then State.AutoTrader.RecordTargetEvent(partner, "auditFailure") end
            State.AutoTrader.Log("post_trade_audit_timeout_recover", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.Status = "AUDIT TIMEOUT · RESYNCING"
            State.AutoTrader.StatusDetail = "Fresh inventory verification timed out; rejoining to establish a clean authoritative inventory baseline."
            State.AutoTrader.Render()
            State.AutoTrader.RequestRecoveryTeleport("post-trade inventory audit timed out")
            return
        end

        latestInventoryMismatches = latestInventoryMismatches or inventoryMismatchesFor(latestFresh)
        -- If the completion event was missed and repeated authoritative inventory
        -- snapshots still equal the pre-trade baseline, the trade did not settle.
        -- That is a terminal interaction, not an integrity mismatch.
        if not passed and options.recoveredWithoutCompletion and unchangedFromBefore(latestFresh) and #serverMismatches == 0 then
            State.AutoTrader.PostTradeAuditPending = false
            State.AutoTrader.PostTradeAuditStartedAt = 0
            State.AutoTrader.PostTradeAuditOwner = nil
            State.AutoTrader.LastAuditDetail = {
                result = "not_completed", stampBefore = audit.stamp, stampAfter = latestFresh.lastSuccess,
                freshSamples = freshSamples, expected = expected, outgoing = audit.outgoing,
                incoming = audit.incoming, inventoryMismatches = latestInventoryMismatches,
                recoveredWithoutCompletion = true,
            }
            if partner then
                local totalSeconds = requestToCompletionSeconds or tradeSeconds
                State.AutoTrader.RecordTargetEvent(partner, "tradeDecline", {seconds = tradeSeconds, totalSeconds = totalSeconds})
                State.AutoTrader.MarkServerPlayerOutcome(partner, "trade_declined", "accepted trade ended without settlement")
                State.AutoTrader.SetCooldown(partner, "trade ended without settlement")
            end
            State.AutoTrader.Status = "TRADE DID NOT SETTLE"
            State.AutoTrader.StatusDetail = "The completion event was missing and repeated fresh inventory snapshots stayed at the pre-trade baseline; moving on safely."
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
            State.AutoTrader.Log("owned_trade_recovered_not_completed", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.Render()
            return
        end

        State.AutoTrader.PostTradeAuditPending = false
        State.AutoTrader.PostTradeAuditStartedAt = 0
        State.AutoTrader.PostTradeAuditOwner = nil
        local failed = not passed or #serverMismatches > 0 or #latestInventoryMismatches > 0
        State.AutoTrader.LastAuditDetail = {
            result = failed and "failed" or "passed",
            stampBefore = audit.stamp, stampAfter = latestFresh.lastSuccess,
            freshSamples = freshSamples, prePartial = audit.partial, postPartial = latestFresh.partial,
            expected = expected, outgoing = audit.outgoing, incoming = audit.incoming,
            serverIncoming = serverIncoming, serverMismatches = serverMismatches,
            inventoryMismatches = latestInventoryMismatches,
            recoveredWithoutCompletion = options.recoveredWithoutCompletion == true,
        }
        if failed then
            State.AutoTrader.Preferences.automation = false
            State.AutoTrader.SavePreferences()
            State.AutoTrader.FatalIntegrityStop = true
            State.AutoTrader.SessionFrozen = "Post-trade inventory or server-reported receipt still differed from the exact expected transaction after repeated fresh verification. Auto Trading was disabled."
            State.AutoTrader.Status = "FROZEN · AUDIT MISMATCH"
            State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
            if partner then State.AutoTrader.RecordTargetEvent(partner, "auditFailure") end
            State.AutoTrader.Log("post_trade_audit_failed", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Persistent transaction audit mismatch · Auto Trading disabled")
        else
            State.AutoTrader.LastAcceptAudit = {
                result = "passed", stamp = latestFresh.lastSuccess, checked = expected,
                outgoing = audit.outgoing, incoming = audit.incoming,
            }
            if partner then
                State.AutoTrader.RecordTargetEvent(partner, "success", {
                    profit = completedPlan and completedPlan.win or 0,
                    seconds = tradeSeconds, totalSeconds = requestToCompletionSeconds,
                    negotiationStage = completedPlan and completedPlan.negotiationStage or nil,
                    negotiationMargin = completedPlan and completedPlan.negotiationMargin or nil,
                })
                State.AutoTrader.MarkServerPlayerOutcome(partner, "traded", "post-trade audit passed")
            end
            State.AutoTrader.AuditedTradesThisServer += 1
            State.AutoTrader.ServerMeaningfulProgressAt = os.clock()
            State.AutoTrader.Status = "TRADE COMPLETE · VERIFIED"
            State.AutoTrader.StatusDetail = options.recoveredWithoutCompletion
                and "The completion event was missed, but repeated fresh inventory deltas matched the exact owned transaction."
                or "Server receipt and repeated fresh incoming/outgoing inventory deltas matched the exact automated trade."
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
            State.AutoTrader.Log("post_trade_audit_passed", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Full incoming + outgoing audit ✓")
        end
        State.AutoTrader.Render()
    end)
end

State.AutoTrader.ProbeAuthoritativeTradeActive = function()
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = ReplicatedStorage:FindFirstChild("GetTradeStatus")
        or (tradeFolder and tradeFolder:FindFirstChild("GetTradeStatus"))
    if not remote or not remote:IsA("RemoteFunction") then return nil, "GetTradeStatus unavailable" end
    local ok, packed = waitForExternalWithDeadline("GetTradeStatus settlement probe", CONFIG.AutoTraderRequestInvokeTimeoutSeconds, function()
        return {remote:InvokeServer()}
    end)
    if not ok or type(packed) ~= "table" then return nil, tostring(packed or "probe failed") end
    local status, data = packed[1], packed[2]
    if status == "StartTrade" and type(data) == "table" and data.Player1 and data.Player2 then
        State.CurrentTrade = data
        State.AutoTrader.LastTradeUpdateAt = os.clock()
        return true, status
    end
    return false, status
end

State.AutoTrader.RecoverOwnedSettlementIfEnded = function()
    local tx = State.AutoTrader.PendingAutoTransaction
    if not tx or (State.AutoTrader.SettlementStartedAt or 0) <= 0 then return false end
    local now = os.clock()
    if State.CurrentTrade then
        State.AutoTrader.SettlementGoneSince = 0
        State.AutoTrader.SettlementEndedProbeCount = 0
        return false
    end
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then tradeGui = PlayerGui:FindFirstChild("Trade") or PlayerGui:FindFirstChild("TradeGUI") end
    local nativeActive = tradeGui and tradeGui:IsA("ScreenGui") and tradeGui.Enabled == true
    if not nativeActive then
        State.AutoTrader.SettlementGoneSince = (State.AutoTrader.SettlementGoneSince or 0) > 0 and State.AutoTrader.SettlementGoneSince or now
        if now - State.AutoTrader.SettlementGoneSince < CONFIG.AutoTraderAcceptedSettlementGoneQuietSeconds then return false end
    else
        State.AutoTrader.SettlementGoneSince = 0
        if now - State.AutoTrader.SettlementStartedAt < CONFIG.AutoTraderAcceptedSettlementProbeSeconds then return false end
    end
    if now - (State.AutoTrader.SettlementLastProbeAt or 0) < CONFIG.AutoTraderAcceptedSettlementPollSeconds then return false end
    State.AutoTrader.SettlementLastProbeAt = now
    local active, reason = State.AutoTrader.ProbeAuthoritativeTradeActive()
    if active == true then
        State.AutoTrader.SettlementGoneSince = 0
        State.AutoTrader.SettlementEndedProbeCount = 0
        State.AutoTrader.Log("owned_settlement_probe_still_active", {reason = reason, generation = tx.generation})
        return false
    elseif active == nil then
        State.AutoTrader.Log("owned_settlement_probe_unknown", {reason = reason, generation = tx.generation})
        return false
    end
    State.AutoTrader.SettlementEndedProbeCount = (State.AutoTrader.SettlementEndedProbeCount or 0) + 1
    -- A stale native GUI is weaker than GetTradeStatus, but require two separate
    -- authoritative ended probes before overriding a still-visible ScreenGui.
    if nativeActive and State.AutoTrader.SettlementEndedProbeCount < 2 then
        State.AutoTrader.Log("owned_settlement_probe_ended_gui_still_visible", {generation = tx.generation, status = reason})
        return false
    end

    local partner = Players:GetPlayerByUserId(tx.partnerUserId)
    local tradeSeconds = tx.tradeBeganAt and tx.tradeBeganAt > 0 and (now - tx.tradeBeganAt) or nil
    local requestSeconds = tx.requestStartedAt and tx.requestStartedAt > 0 and (now - tx.requestStartedAt) or tradeSeconds
    local audit, plan = tx.audit, tx.plan
    State.AutoTrader.Log("owned_settlement_completion_event_missing", {
        generation = tx.generation, partnerUserId = tx.partnerUserId, status = reason,
        nativeGuiStillVisible = nativeActive, endedProbeCount = State.AutoTrader.SettlementEndedProbeCount,
    })
    State.AutoTrader.ClearTradeRuntime()
    State.AutoTrader.RunPostTradeAudit(audit, nil, partner, plan, tradeSeconds, requestSeconds, {recoveredWithoutCompletion = true, owner = {generation = tx.generation, partnerUserId = tx.partnerUserId}})
    return true
end

State.AutoTrader.ReconcileDesired = function(localEntries, desired, context)
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen then
        return
    end
    if State.AutoTrader.ActionInFlight then
        return
    end
    local valid, reason = State.AutoTrader.ActionContextValid(context)
    if not valid then
        if reason ~= "manual accept hold" then
            State.AutoTrader.Freeze("Reconcile precheck failed: " .. tostring(reason))
        end
        return
    end
    local localHash = State.AutoTrader.OfferHash(localEntries)
    if not State.AutoTrader.LastManagedLocalHash then
        State.AutoTrader.LastManagedLocalHash = localHash
    elseif localHash ~= State.AutoTrader.LastManagedLocalHash then
        State.AutoTrader.Freeze("Observed local offer differs from the last verified automation state.")
        return
    end
    local desiredMap = {}
    local desiredItems = desired and desired.items or {}
    for _, item in ipairs(desiredItems) do
        local key = State.Mapping.MakeItemKey(item.itemType, item.itemId)
        desiredMap[key] = {
            quantity = math.max(1, math.floor(tonumber(item.quantity) or 1)),
            item = item,
        }
    end
    for _, current in ipairs(localEntries or {}) do
        local key = State.Mapping.MakeItemKey(current.itemType, current.itemId)
        local wanted = desiredMap[key]
        local currentQuantity = math.max(1, math.floor(tonumber(current.quantity) or 1))
        local wantedQuantity = wanted and wanted.quantity or 0
        if currentQuantity > wantedQuantity then
            State.AutoTrader.FireMutation("remove", {
                itemId = current.itemId,
                itemType = current.itemType,
                name = current.record and current.record.name or current.itemId,
            }, context, localEntries)
            return
        end
    end
    for _, item in ipairs(desiredItems) do
        local currentQuantity = State.AutoTrader.GetOfferQuantity(localEntries, item.itemType, item.itemId)
        local wantedQuantity = math.max(1, math.floor(tonumber(item.quantity) or 1))
        if currentQuantity < wantedQuantity then
            State.AutoTrader.FireMutation("add", item, context, localEntries)
            return
        end
    end
    State.AutoTrader.LastManagedLocalHash = localHash
    if context and context.kind == "anchor" then
        State.AutoTrader.Status = "ANCHOR READY"
        State.AutoTrader.StatusDetail = "Opening anchor is in. Waiting for their offer."
    elseif context and context.kind == "clear" then
        State.AutoTrader.Status = "WAIT · KNOWN VALUE"
        State.AutoTrader.StatusDetail = "Their offer has no numeric known value yet; your automated offer is empty."
    else
        local proactive = State.AutoTrader.Plan and State.AutoTrader.Plan.proactiveAccept == true
        if proactive or State.AutoTrader.OtherAcceptedAt > 0 then
            State.AutoTrader.Status = "OFFER READY · AUTO ACCEPT"
            State.AutoTrader.StatusDetail = "Exact verified plan is present. Running the final acceptance gate."
        else
            State.AutoTrader.Status = "NEGOTIATING · HOLDING MARGIN"
            State.AutoTrader.StatusDetail = "Higher-profit offer is ready. Waiting briefly for them to accept before conceding toward the hard safety floor."
        end
    end
    State.AutoTrader.Render()
    if context and context.kind == "plan"
        and (State.AutoTrader.OtherAcceptedAt > 0 or (State.AutoTrader.Plan and State.AutoTrader.Plan.proactiveAccept == true)) then
        State.AutoTrader.TryAutoAccept()
    end
end
State.AutoTrader.BuildActionContext = function(kind, otherHash, inventorySnapshot, partner)
    return {
        kind = kind,
        otherHash = otherHash,
        mappingRevision = State.Mapping.Revision,
        inventoryStamp = inventorySnapshot and inventorySnapshot.lastSuccess or nil,
        databaseRevision = HARDEN.supremeDataRevision,
        databaseHash = HARDEN.supremeDataHash,
        partnerUserId = partner and partner.UserId or nil,
    }
end
State.AutoTrader.PlayerAllowed = function(partner)
    if not partner then
        return false, "partner unavailable"
    end
    if State.AutoTrader.Preferences.ignoreFriends then
        local friend = State.AutoTrader.GetFriendStatus(partner)
        if friend == nil then
            return false, "friend status pending"
        elseif friend then
            return false, "Ignore Friends is ON"
        end
    end
    return true
end
State.AutoTrader.SetManagedPartner = function(partner)
    local userId = partner and partner.UserId or nil
    if State.AutoTrader.ManagedPartnerUserId ~= userId then
        State.AutoTrader.ActionGeneration += 1
        State.AutoTrader.AutoAcceptGeneration += 1
        State.AutoTrader.ActionInFlight = nil
        State.AutoTrader.AutoAcceptScheduledKey = nil
        State.AutoTrader.AutoAcceptSentKey = nil
        State.AutoTrader.LastManagedLocalHash = nil
        State.AutoTrader.ManagedPartnerUserId = userId
        State.AutoTrader.TradeBeganAt = os.clock()
        State.AutoTrader.Log("managed_partner", {
            userId = userId,
            name = partner and partner.Name or nil,
        })
    end
end
State.AutoTrader.GetRequestFrame = function()
    local main = PlayerGui:FindFirstChild("MainGUI")
    return main and safeFindPath(main, {"Game", "Leaderboard", "Container", "TradeRequest"})
end
State.AutoTrader.IsGuiShown = function(object)
    if not object or not object:IsA("GuiObject") or not object.Visible then return false end
    local current = object.Parent
    while current do
        if current:IsA("GuiObject") and not current.Visible then return false end
        if current:IsA("ScreenGui") and not current.Enabled then return false end
        current = current.Parent
    end
    return true
end
State.AutoTrader.GetOutgoingRequestUi = function()
    local frame = State.AutoTrader.GetRequestFrame()
    local sending = frame and frame:FindFirstChild("SendingRequest")
    local username = sending and sending:FindFirstChild("Username")
    return frame, sending, username
end
State.AutoTrader.GetIncomingRequestUi = function()
    local frame = State.AutoTrader.GetRequestFrame()
    local receiving = frame and frame:FindFirstChild("ReceivingRequest")
    local title = receiving and receiving:FindFirstChild("Title")
    local username = receiving and receiving:FindFirstChild("Username")
    local accept = receiving and receiving:FindFirstChild("Accept")
    local decline = receiving and receiving:FindFirstChild("Decline")
    return frame, receiving, title, username, accept, decline
end
State.AutoTrader.GetTextValue = function(object)
    if object and (object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox")) then
        return tostring(object.Text or "")
    end
    return ""
end
State.AutoTrader.NormalizeRequestName = function(text)
    text = tostring(text or ""):gsub("^%s+", ""):gsub("%s+$", "")
    text = text:gsub("^@", "")
    return text
end
State.AutoTrader.ResolveIncomingPlayer = function(text)
    local wanted = State.AutoTrader.NormalizeRequestName(text)
    if wanted == "" then return nil end
    local exact = Players:FindFirstChild(wanted)
    if exact and exact:IsA("Player") then return exact end
    local lower = string.lower(wanted)
    local displayMatch = nil
    for _, player in ipairs(Players:GetPlayers()) do
        if string.lower(player.Name) == lower then return player end
        if string.lower(player.DisplayName or "") == lower then
            if displayMatch then return nil end
            displayMatch = player
        end
    end
    return displayMatch
end
State.AutoTrader.BindRequestCancelObserver = function()
    local _, sending = State.AutoTrader.GetOutgoingRequestUi()
    local cancel = sending and sending:FindFirstChild("Cancel")
    if not cancel or not cancel:IsA("GuiButton") or State.AutoTrader.RequestCancelButton == cancel then return end
    State.AutoTrader.RequestCancelButton = cancel
    connect(cancel.MouseButton1Click, function()
        local pending = State.AutoTrader.PendingRequest
        if not pending then return end
        State.AutoTrader.Log("request_canceled_locally", pending)
        State.AutoTrader.BeginPendingRequestCancellation("request canceled locally", "local_cancel", true)
        State.AutoTrader.Status = "REQUEST · CANCELING"
        State.AutoTrader.StatusDetail = "Waiting for MM2 to confirm the outgoing request is gone before another request can start."
        State.AutoTrader.Render()
    end)
end
State.AutoTrader.IsNativeOutgoingPending = function(target)
    local frame, sending, username = State.AutoTrader.GetOutgoingRequestUi()
    if not frame or not sending or not State.AutoTrader.IsGuiShown(sending) then return false end
    local shownName = State.AutoTrader.NormalizeRequestName(State.AutoTrader.GetTextValue(username))
    if target and shownName ~= "" and string.lower(shownName) ~= string.lower(target.Name) then return false end
    return true
end
State.AutoTrader.IsAnyNativeOutgoingPending = function()
    local _, sending = State.AutoTrader.GetOutgoingRequestUi()
    return sending ~= nil and State.AutoTrader.IsGuiShown(sending)
end
State.AutoTrader.FireCancelRequest = function()
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("CancelRequest")
    if not remote or not remote:IsA("RemoteEvent") then return false, "Trade.CancelRequest unavailable" end
    local ok, err = pcall(function() remote:FireServer() end)
    return ok, ok and nil or tostring(err)
end
State.AutoTrader.FinalizePendingCancellation = function(pending)
    if not pending or State.AutoTrader.PendingRequest ~= pending then return false end
    local player = Players:GetPlayerByUserId(pending.userId)
    local outcome = pending.cancelOutcome
    if player and outcome == "trade_unavailable" then
        State.AutoTrader.RecordTargetEvent(player, "ignored", {seconds = os.clock() - (pending.sentAt or os.clock())})
        State.AutoTrader.MarkServerPlayerOutcome(player, "trade_unavailable", pending.cancelReason or "request could not become pending")
        State.AutoTrader.SetCooldown(player, "request unavailable/unconfirmed", 20)
    elseif player and outcome == "no_response" then
        State.AutoTrader.RecordTargetEvent(player, "ignored", {seconds = os.clock() - (pending.sentAt or os.clock())})
        State.AutoTrader.MarkServerPlayerOutcome(player, "no_response", pending.cancelReason or "request timed out")
        State.AutoTrader.SetCooldown(player, "request ignored", 75)
    elseif player and outcome == "deferred" then
        State.AutoTrader.MarkServerPlayerOutcome(player, "deferred", pending.cancelReason or "outgoing request deferred")
        -- v30: we canceled this ourselves; do not penalize the player with the full
        -- repeat-request window after the single-flight quiet barrier completes.
        State.AutoTrader.RequestHistory[player.UserId] = nil
    elseif player and outcome == "local_cancel" then
        State.AutoTrader.MarkServerPlayerOutcome(player, "local_cancel", pending.cancelReason or "request canceled locally")
    end
    State.AutoTrader.Log("request_cancel_confirmed", {
        userId = pending.userId, name = pending.name, outcome = outcome,
        reason = pending.cancelReason, age = os.clock() - (pending.sentAt or os.clock()),
    })
    State.AutoTrader.PendingRequest = nil
    State.AutoTrader.RequestLifecycle = "idle"
    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestCancelQuietSeconds
    State.AutoTrader.RequestConfirmGeneration += 1
    local _, receiving = State.AutoTrader.GetIncomingRequestUi()
    if receiving and State.AutoTrader.IsGuiShown(receiving) then
        task.defer(State.AutoTrader.HandleIncomingRequest)
    end
    return true
end
State.AutoTrader.BeginPendingRequestCancellation = function(reason, outcome, alreadySent)
    local pending = State.AutoTrader.PendingRequest
    if not pending then return false, "no pending request" end
    if pending.phase == "canceling" then return true, "already canceling" end
    if not alreadySent then
        local ok, err = State.AutoTrader.FireCancelRequest()
        if not ok then return false, err end
    end
    State.AutoTrader.RequestConfirmGeneration += 1
    pending.generation = State.AutoTrader.RequestConfirmGeneration
    pending.phase = "canceling"
    pending.cancelStartedAt = os.clock()
    pending.cancelQuietSince = nil
    pending.cancelReason = tostring(reason or "request cancellation")
    pending.cancelOutcome = outcome
    State.AutoTrader.RequestLifecycle = "canceling"
    State.AutoTrader.Log("request_cancel_started", {userId = pending.userId, name = pending.name, reason = pending.cancelReason, outcome = outcome})
    return true
end
State.AutoTrader.FinalizePendingDecline = function(pending, reason)
    if not pending or State.AutoTrader.PendingRequest ~= pending then return false end
    local player = Players:GetPlayerByUserId(pending.userId)
    if player then
        local responseSeconds = os.clock() - (pending.sentAt or os.clock())
        State.AutoTrader.RecordTargetEvent(player, "response", {seconds = responseSeconds})
        State.AutoTrader.RecordTargetEvent(player, "decline", {seconds = responseSeconds})
        State.AutoTrader.MarkServerPlayerOutcome(player, "declined", reason or "request declined")
        State.AutoTrader.SetCooldown(player, "request declined")
    end
    State.AutoTrader.Log("request_declined_confirmed", {
        userId = pending.userId, name = pending.name,
        observedAt = pending.declineObservedAt, reason = reason,
    })
    State.AutoTrader.PendingRequest = nil
    State.AutoTrader.RequestConfirmGeneration += 1
    State.AutoTrader.RequestLifecycle = "idle"
    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestCancelQuietSeconds
    State.AutoTrader.Status = "COOLDOWN · DECLINED"
    State.AutoTrader.StatusDetail = player
        and (player.Name .. " declined; moving on after the short clean-state spacing.")
        or "Request was declined."
    State.AutoTrader.Render()
    return true
end

State.AutoTrader.ReconcileOutgoingRequestState = function()
    local now = os.clock()
    local pending = State.AutoTrader.PendingRequest
    local nativeVisible = State.AutoTrader.IsAnyNativeOutgoingPending()
    if pending and pending.phase == "canceling" then
        if nativeVisible then
            pending.cancelQuietSince = nil
        else
            pending.cancelQuietSince = pending.cancelQuietSince or now
            if now - pending.cancelQuietSince >= CONFIG.AutoTraderRequestCancelQuietSeconds then
                State.AutoTrader.FinalizePendingCancellation(pending)
                return true
            end
        end
        if now - (pending.cancelStartedAt or now) >= CONFIG.AutoTraderRequestCancelConfirmTimeoutSeconds then
            State.AutoTrader.Log("request_cancel_confirmation_timeout", {userId = pending.userId, name = pending.name})
            State.AutoTrader.RequestRecoveryTeleport("outgoing request cancellation could not be authoritatively confirmed")
        end
        return true
    end
    if pending and pending.phase ~= "canceling" then
        local player = Players:GetPlayerByUserId(pending.userId)
        if nativeVisible and State.AutoTrader.IsNativeOutgoingPending(player) then
            pending.nativeGoneSince = nil
            if not pending.nativeConfirmed then
                pending.phase = "pending"
                pending.nativeConfirmed = true
                pending.confirmedAt = now
                State.AutoTrader.RequestLifecycle = "pending"
                if player then State.AutoTrader.MarkServerPlayerOutcome(player, "request_pending", "native SendingRequest confirmed") end
                State.AutoTrader.LastRequestAttempt = {
                    userId = pending.userId, name = pending.name, result = "native_pending_late_or_reconciled",
                    generation = pending.generation, seconds = now - (pending.sentAt or now), at = now,
                }
                State.AutoTrader.Log("request_native_confirmed_reconciled", State.AutoTrader.LastRequestAttempt)
            end
        elseif pending.nativeConfirmed and not State.CurrentTrade and not (isTradeVisible and isTradeVisible()) then
            pending.nativeGoneSince = pending.nativeGoneSince or now
            if now - pending.nativeGoneSince >= CONFIG.AutoTraderRequestNativeGoneGraceSeconds then
                if pending.declineObservedAt then
                    State.AutoTrader.FinalizePendingDecline(pending, "request declined; native pending state cleared after decline event")
                    return true
                end
                State.AutoTrader.Log("request_native_disappeared_without_terminal_event", pending)
                State.AutoTrader.BeginPendingRequestCancellation(
                    "native pending request disappeared without a StartTrade/DeclineRequest event", "no_response", false
                )
                return true
            end
        else
            pending.nativeGoneSince = nil
        end
    end
    if not pending and nativeVisible then
        if (State.AutoTrader.OrphanRequestCancelStartedAt or 0) <= 0 then
            local ok, err = State.AutoTrader.FireCancelRequest()
            if ok then
                State.AutoTrader.OrphanRequestCancelStartedAt = now
                State.AutoTrader.OrphanRequestQuietSince = 0
                State.AutoTrader.RequestLifecycle = "canceling_orphan"
                State.AutoTrader.Log("orphan_native_request_cancel_started", {})
            else
                State.AutoTrader.Log("orphan_native_request_cancel_failed", {error = err})
                State.AutoTrader.RequestRecoveryTeleport("orphan native outgoing request could not be canceled")
            end
        end
        return true
    end
    if (State.AutoTrader.OrphanRequestCancelStartedAt or 0) > 0 then
        State.AutoTrader.OrphanRequestQuietSince = State.AutoTrader.OrphanRequestQuietSince > 0 and State.AutoTrader.OrphanRequestQuietSince or now
        if now - State.AutoTrader.OrphanRequestQuietSince >= CONFIG.AutoTraderRequestCancelQuietSeconds then
            State.AutoTrader.Log("orphan_native_request_cancel_confirmed", {})
            State.AutoTrader.OrphanRequestCancelStartedAt = 0
            State.AutoTrader.OrphanRequestQuietSince = 0
            State.AutoTrader.RequestLifecycle = "idle"
            State.AutoTrader.NextRequestAt = now + CONFIG.AutoTraderRequestCancelQuietSeconds
        elseif now - State.AutoTrader.OrphanRequestCancelStartedAt >= CONFIG.AutoTraderRequestCancelConfirmTimeoutSeconds then
            State.AutoTrader.RequestRecoveryTeleport("orphan outgoing request state stayed ambiguous")
        end
        return true
    end
    if pending then
        State.AutoTrader.RequestLifecycle = pending.phase or "pending"
    else
        State.AutoTrader.RequestLifecycle = "idle"
    end
    return false
end
State.AutoTrader.ClickNativeGuiButton = function(button, actionName)
    if not button or not button:IsA("GuiButton") or not State.AutoTrader.IsGuiShown(button) then
        return false, "button unavailable/hidden"
    end
    if VirtualInputManager then
        local center = button.AbsolutePosition + button.AbsoluteSize / 2
        local ok, err = pcall(function()
            VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, true, game, 0)
            task.wait(0.04)
            VirtualInputManager:SendMouseButtonEvent(center.X, center.Y, 0, false, game, 0)
        end)
        if ok then
            State.AutoTrader.Log("native_gui_click", {action = actionName, mode = "VirtualInputManager"})
            return true
        end
        State.AutoTrader.Log("native_gui_click_failed", {action = actionName, mode = "VirtualInputManager", error = tostring(err)})
    end
    local firesignalFunction = State.TryGetExecutorGlobal("firesignal")
    if type(firesignalFunction) == "function" then
        local ok, err = pcall(firesignalFunction, button.MouseButton1Click)
        if ok then
            State.AutoTrader.Log("native_gui_click", {action = actionName, mode = "firesignal.MouseButton1Click"})
            return true
        end
        State.AutoTrader.Log("native_gui_click_failed", {action = actionName, mode = "firesignal", error = tostring(err)})
    end
    return false, "no working GUI click method"
end
State.AutoTrader.CancelOutgoingForIncoming = function(incomingPlayer)
    local pending = State.AutoTrader.PendingRequest
    if not pending then
        if State.AutoTrader.IsAnyNativeOutgoingPending() then
            State.AutoTrader.ReconcileOutgoingRequestState()
            return false, "native outgoing cancellation pending"
        end
        return true
    end
    if incomingPlayer and pending.userId == incomingPlayer.UserId and pending.phase ~= "canceling" then return true end
    local started, reason = State.AutoTrader.BeginPendingRequestCancellation(
        "outgoing request canceled for incoming requester", "deferred", false
    )
    if not started then return false, reason end
    State.AutoTrader.Status = "INCOMING · WAITING FOR CANCEL"
    State.AutoTrader.StatusDetail = "Canceling the previous outgoing request and waiting for MM2's native request state to clear before accepting "
        .. (incomingPlayer and incomingPlayer.Name or "the incoming request") .. "."
    State.AutoTrader.Render()
    return false, "outgoing cancellation pending"
end
State.AutoTrader.DecideIncomingRequester = function(player)
    if not player or player == LocalPlayer or not player.Parent then return "decline", "requester unavailable" end
    if State.AutoTrader.Preferences.ignoreFriends then
        local friend = State.AutoTrader.GetFriendStatus(player)
        if friend == true then return "decline", "Ignore Friends is ON" end
        if friend == nil then return "wait", "friend status pending" end
    end
    local total, verified, valueReason = State.AutoTrader.GetVerifiedPlayerValue(player)
    if not verified or total == nil then return "wait", valueReason or "inventory unresolved" end
    if total <= 0 then return "decline", "verified inventory value is 0" end
    return "accept", "verified positive inventory value " .. formatCompact(total)
end
State.AutoTrader.ActOnIncomingRequest = function(player, decision, reason, signature)
    State.AutoTrader.IncomingRequestResolvingSignature = nil
    local _, receiving, title, username, accept, decline = State.AutoTrader.GetIncomingRequestUi()
    if not receiving or not State.AutoTrader.IsGuiShown(receiving) then return false end
    local currentSignature = State.AutoTrader.NormalizeRequestName(State.AutoTrader.GetTextValue(username))
        .. "|" .. State.AutoTrader.GetTextValue(title)
    if signature and currentSignature ~= signature then return false end
    if decision == "accept" then
        local canceled, cancelReason = State.AutoTrader.CancelOutgoingForIncoming(player)
        if not canceled then
            State.AutoTrader.Log("incoming_blocked_cancel_pending", {player = player.Name, reason = cancelReason})
            State.AutoTrader.IncomingRequestLastHandledAt = 0
            task.delay(0.15, function()
                if not Destroyed then State.AutoTrader.HandleIncomingRequest() end
            end)
            return false
        end
    end
    local button = decision == "accept" and accept or decline
    local ok, clickReason = State.AutoTrader.ClickNativeGuiButton(button, "incoming_" .. decision)
    State.AutoTrader.IncomingRequestDecision = {
        player = player and player.Name or nil,
        userId = player and player.UserId or nil,
        decision = decision,
        reason = reason,
        signature = signature,
        at = os.clock(),
        clickOk = ok,
        clickReason = clickReason,
    }
    State.AutoTrader.IncomingRequestLastHandledAt = os.clock()
    State.AutoTrader.IncomingRequestLastSignature = signature
    State.AutoTrader.Log("incoming_request_decision", State.AutoTrader.IncomingRequestDecision)
    if player then
        State.AutoTrader.RecordTargetEvent(player, "incomingRequest")
        if decision == "accept" and ok then State.AutoTrader.RecordTargetEvent(player, "incomingAccepted") end
    end
    State.AutoTrader.Status = decision == "accept" and "INCOMING · ACCEPTING" or "INCOMING · DECLINING"
    State.AutoTrader.StatusDetail = (player and player.Name or "Unknown requester") .. " · " .. tostring(reason)
    State.AutoTrader.Render()
    return ok
end
State.AutoTrader.HandleIncomingRequest = function()
    if Destroyed or not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen then return end
    if State.CurrentTrade or (isTradeVisible and isTradeVisible()) or State.AutoTrader.ManagedPartnerUserId then return end
    local _, receiving, title, username = State.AutoTrader.GetIncomingRequestUi()
    if not receiving or not State.AutoTrader.IsGuiShown(receiving) then return end
    local requestName = State.AutoTrader.NormalizeRequestName(State.AutoTrader.GetTextValue(username))
    local signature = requestName .. "|" .. State.AutoTrader.GetTextValue(title)
    if requestName == "" then return end
    if State.AutoTrader.IncomingRequestResolvingSignature == signature then return end
    if State.AutoTrader.IncomingRequestLastSignature == signature
        and os.clock() - (State.AutoTrader.IncomingRequestLastHandledAt or 0) < CONFIG.AutoTraderIncomingActionTimeoutSeconds then
        return
    end
    local player = State.AutoTrader.ResolveIncomingPlayer(requestName)
    if not player then
        State.AutoTrader.Status = "INCOMING · RESOLVING"
        State.AutoTrader.StatusDetail = "Could not uniquely resolve incoming requester " .. requestName .. " yet."
        State.AutoTrader.Render()
        return
    end
    local decision, reason = State.AutoTrader.DecideIncomingRequester(player)
    if decision ~= "wait" then
        State.AutoTrader.ActOnIncomingRequest(player, decision, reason, signature)
        return
    end
    State.AutoTrader.IncomingRequestGeneration += 1
    local generation = State.AutoTrader.IncomingRequestGeneration
    State.AutoTrader.IncomingRequestResolvingSignature = signature
    State.AutoTrader.IncomingRequestLastSignature = signature
    State.AutoTrader.IncomingRequestLastHandledAt = os.clock()
    State.AutoTrader.Status = "INCOMING · CHECKING"
    State.AutoTrader.StatusDetail = player.Name .. " requested a trade; prioritizing their verified inventory before deciding."
    State.AutoTrader.Render()
    task.spawn(function()
        local deadline = os.clock() + CONFIG.AutoTraderIncomingResolveSeconds
        while not Destroyed and generation == State.AutoTrader.IncomingRequestGeneration and os.clock() < deadline do
            State.AutoTrader.RequestFriendStatus(player, true)
            if type(State.Profile.FetchRemoteTotalForPlayer) == "function" then
                State.Profile.FetchRemoteTotalForPlayer(player, true)
            elseif type(State.Profile.QueueRemoteLeaderboardSweep) == "function" then
                State.Profile.QueueRemoteLeaderboardSweep(true)
            end
            local nextDecision, nextReason = State.AutoTrader.DecideIncomingRequester(player)
            if nextDecision ~= "wait" then
                State.AutoTrader.IncomingRequestResolvingSignature = nil
                State.AutoTrader.ActOnIncomingRequest(player, nextDecision, nextReason, signature)
                return
            end
            task.wait(0.25)
        end
        if Destroyed or generation ~= State.AutoTrader.IncomingRequestGeneration then return end
        State.AutoTrader.IncomingRequestResolvingSignature = nil
        State.AutoTrader.ActOnIncomingRequest(player, "decline", "inventory/friend verification did not resolve inside the incoming-request window", signature)
    end)
end
State.AutoTrader.BindIncomingRequestObserver = function()
    local _, receiving, _, username = State.AutoTrader.GetIncomingRequestUi()
    if not receiving or not receiving:IsA("GuiObject") then return end
    if State.AutoTrader.IncomingRequestFrame ~= receiving then
        State.AutoTrader.IncomingRequestFrame = receiving
        connect(receiving:GetPropertyChangedSignal("Visible"), function()
            if receiving.Visible then
                task.defer(State.AutoTrader.HandleIncomingRequest)
            else
                State.AutoTrader.IncomingRequestGeneration += 1
                State.AutoTrader.IncomingRequestResolvingSignature = nil
            end
        end)
    end
    if username and (username:IsA("TextLabel") or username:IsA("TextButton") or username:IsA("TextBox"))
        and State.AutoTrader.IncomingRequestUsernameObject ~= username then
        State.AutoTrader.IncomingRequestUsernameObject = username
        connect(username:GetPropertyChangedSignal("Text"), function()
            if receiving.Visible then task.defer(State.AutoTrader.HandleIncomingRequest) end
        end)
    end
    if receiving.Visible then task.defer(State.AutoTrader.HandleIncomingRequest) end
end
State.AutoTrader.FailPendingRequestAttempt = function(target, generation, reason, detail)
    local pending = State.AutoTrader.PendingRequest
    if not pending
        or (target and pending.userId ~= target.UserId)
        or (generation and pending.generation ~= generation) then
        return false
    end
    pending.failureReason = tostring(reason or "request failed")
    pending.failureDetail = detail and tostring(detail) or nil
    State.AutoTrader.LastRequestAttempt = {
        userId = pending.userId, name = pending.name, result = "canceling_unavailable",
        reason = pending.failureReason, detail = pending.failureDetail, phase = pending.phase,
        age = os.clock() - (pending.sentAt or os.clock()), at = os.clock(),
    }
    local started, cancelReason = State.AutoTrader.BeginPendingRequestCancellation(pending.failureReason, "trade_unavailable", false)
    if not started then
        State.AutoTrader.Log("request_failure_cancel_failed", {reason = cancelReason, pending = pending})
        State.AutoTrader.RequestRecoveryTeleport("failed outgoing request could not be canceled cleanly")
        return false
    end
    State.AutoTrader.Status = "REQUEST FAILED · CANCELING"
    State.AutoTrader.StatusDetail = (pending.name or "That player")
        .. " did not reach a trustworthy MM2 pending state; canceling/confirming cleanup before trying anybody else."
    State.AutoTrader.Log("request_attempt_cleanup_started", State.AutoTrader.LastRequestAttempt)
    State.AutoTrader.Render()
    return true
end
State.AutoTrader.TrySendRequest = function()
    local function blocked(reason)
        State.AutoTrader.LastRequestGate = {reason = tostring(reason), at = os.clock()}
        return false, reason
    end
    if Destroyed then return blocked("destroyed") end
    if not State.AutoTrader.Preferences.automation then return blocked("automation off") end
    if State.AutoTrader.SessionFrozen then return blocked("session frozen") end
    if State.AutoTrader.RecoveryTeleportRequired then return blocked("recovery rejoin pending") end
    State.AutoTrader.ReconcileOutgoingRequestState()
    if State.AutoTrader.PendingRequest then return blocked("request already pending/canceling") end
    if State.AutoTrader.IsAnyNativeOutgoingPending() then return blocked("native outgoing request still active") end
    if State.AutoTrader.RequestLifecycle ~= "idle" then return blocked("request lifecycle not idle") end
    if State.AutoTrader.TradeDeclinePending then return blocked("trade decline still being confirmed") end
    if type(State.CurrentTrade) == "table" then return blocked("trade state active") end
    if isTradeVisible and isTradeVisible() then return blocked("trade GUI visible") end
    if os.clock() < State.AutoTrader.NextRequestAt then
        return blocked("request spacing")
    end
    local _, receiving = State.AutoTrader.GetIncomingRequestUi()
    if receiving and State.AutoTrader.IsGuiShown(receiving) then
        State.AutoTrader.HandleIncomingRequest()
        return blocked("incoming request has priority")
    end
    local target = State.AutoTrader.SelectTarget()
    if not target then return blocked("no eligible target") end
    local friendAllowed, reason = State.AutoTrader.PlayerAllowed(target)
    if not friendAllowed then return blocked(reason or "target not allowed") end
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("SendRequest")
    if not remote or not remote:IsA("RemoteFunction") then
        State.AutoTrader.Freeze("Trade.SendRequest RemoteFunction is unavailable.")
        return blocked("Trade.SendRequest unavailable")
    end

    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
    State.AutoTrader.RequestHistory[target.UserId] = os.clock()
    State.AutoTrader.RecordTargetEvent(target, "request")
    State.AutoTrader.RequestConfirmGeneration += 1
    local generation = State.AutoTrader.RequestConfirmGeneration
    State.AutoTrader.PendingRequest = {
        userId = target.UserId,
        name = target.Name,
        sentAt = os.clock(),
        phase = "invoking",
        nativeConfirmed = false,
        invokeFinished = false,
        nativeWindowExpired = false,
        invokeHintUnavailable = false,
        generation = generation,
        correlationId = State.AutoTrader.ControllerEpoch .. ":request:" .. tostring(generation),
    }
    State.AutoTrader.RequestLifecycle = "invoking"
    State.AutoTrader.LastRequestGate = nil
    State.AutoTrader.LastRequestAttempt = {
        userId = target.UserId,
        name = target.Name,
        result = "started",
        generation = generation,
        at = os.clock(),
    }
    State.AutoTrader.MarkServerPlayerOutcome(target, "request_attempted", "SendRequest invoked")
    State.AutoTrader.Status = "REQUESTING"
    State.AutoTrader.StatusDetail = "Requesting " .. target.Name .. "; verifying MM2's native SendingRequest state independently of the RemoteFunction response."
    State.AutoTrader.Log("request_send", {userId = target.UserId, name = target.Name, generation = generation, correlationId = State.AutoTrader.PendingRequest.correlationId})
    State.AutoTrader.Render()

    local function activePending()
        local pending = State.AutoTrader.PendingRequest
        if not pending
            or pending.userId ~= target.UserId
            or pending.generation ~= generation then
            return nil
        end
        return pending
    end

    -- Probe the native UI independently. The old implementation did not start
    -- this timer until InvokeServer returned, so a stalled/odd trades-off response
    -- could leave the bot stuck on one player forever.
    task.spawn(function()
        local deadline = os.clock() + CONFIG.AutoTraderOutgoingNativeConfirmSeconds
        while not Destroyed and os.clock() < deadline do
            local pending = activePending()
            if not pending then return end
            if State.CurrentTrade or (isTradeVisible and isTradeVisible()) then return end
            if State.AutoTrader.IsNativeOutgoingPending(target) then
                pending.phase = "pending"
                State.AutoTrader.RequestLifecycle = "pending"
                pending.nativeConfirmed = true
                pending.confirmedAt = os.clock()
                State.AutoTrader.MarkServerPlayerOutcome(target, "request_pending", "native SendingRequest confirmed")
                State.AutoTrader.LastRequestAttempt = {
                    userId = target.UserId,
                    name = target.Name,
                    result = "native_pending",
                    generation = generation,
                    seconds = os.clock() - pending.sentAt,
                    at = os.clock(),
                }
                State.AutoTrader.Status = "REQUEST PENDING"
                State.AutoTrader.StatusDetail = "MM2 confirmed the native pending request to " .. target.Name .. "."
                State.AutoTrader.Log("request_native_confirmed", {userId = target.UserId, generation = generation})
                State.AutoTrader.Render()
                return
            end
            task.wait(0.08)
        end
        local pending = activePending()
        if not pending then return end
        pending.nativeWindowExpired = true
        if pending.nativeConfirmed or pending.phase == "canceling" then return end
        pending.phase = "awaiting_native"
        State.AutoTrader.RequestLifecycle = "awaiting_native"
        State.AutoTrader.Status = "REQUEST · VERIFYING"
        State.AutoTrader.StatusDetail = "MM2 has not shown a pending request for " .. target.Name
            .. "; the short UI probe is diagnostic only, so waiting until the full request-attempt deadline before cleanup."
        State.AutoTrader.Render()
    end)

    -- Hard watchdog: even if InvokeServer never returns, this attempt cannot pin
    -- the auto trader forever. A real trade/native pending state cancels this path.
    task.delay(CONFIG.AutoTraderRequestInvokeTimeoutSeconds, function()
        if Destroyed then return end
        State.AutoTrader.ReconcileOutgoingRequestState()
        local pending = activePending()
        if not pending or pending.nativeConfirmed or pending.phase == "canceling" then return end
        if State.CurrentTrade or (isTradeVisible and isTradeVisible()) then return end
        State.AutoTrader.FailPendingRequestAttempt(
            target,
            generation,
            "SendRequest attempt timed out",
            "No native SendingRequest/trade appeared within " .. tostring(CONFIG.AutoTraderRequestInvokeTimeoutSeconds) .. "s"
        )
    end)

    task.spawn(function()
        local ok, result = pcall(function() return remote:InvokeServer(target) end)
        if Destroyed then return end
        local pending = activePending()
        if not pending then return end -- late return after watchdog/decline/trade
        pending.invokeFinished = true
        pending.invokeOk = ok
        pending.invokeResult = result
        -- Once MM2's native pending UI has appeared, that UI is authoritative.
        -- Ignore any odd/late RemoteFunction return instead of undoing a real request.
        if pending.nativeConfirmed or pending.phase == "canceling" then return end
        pending.invokeHintUnavailable = (not ok) or result == true
        pending.phase = "awaiting_native"
        State.AutoTrader.RequestLifecycle = "awaiting_native"
        if pending.invokeHintUnavailable then
            State.AutoTrader.Log("request_invoke_non_authoritative_hint", {
                userId = target.UserId, generation = generation, ok = ok, result = tostring(result),
            })
        end
        -- v27: RemoteFunction return values are not authoritative enough to free the
        -- single-flight slot. Native SendingRequest/StartTrade or the hard cleanup
        -- watchdog decides the lifecycle.

    end)
    return true, "started"
end
State.AutoTrader.OnTradeState = function(localSide, otherSide, localEntries, otherEntries)
    local partner = State.AutoTrader.GetPlayerFromSide(otherSide)
    State.AutoTrader.LastTradePartner = partner
    if not partner then
        State.AutoTrader.UnresolvedTradePartnerSince = (State.AutoTrader.UnresolvedTradePartnerSince or 0) > 0
            and State.AutoTrader.UnresolvedTradePartnerSince or os.clock()
        State.AutoTrader.Status = "WAIT · PARTNER"
        State.AutoTrader.StatusDetail = "Trade partner could not be identified yet; this state is bounded and will be ended cleanly if MM2 does not resolve it."
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.UnresolvedTradePartnerSince = 0
    if State.AutoTrader.PendingRequest and State.AutoTrader.PendingRequest.userId == partner.UserId then
        State.AutoTrader.TradeRequestStartedAt = State.AutoTrader.PendingRequest.sentAt or State.AutoTrader.TradeRequestStartedAt or os.clock()
        State.AutoTrader.TradeCorrelationId = State.AutoTrader.PendingRequest.correlationId or State.AutoTrader.TradeCorrelationId
        State.AutoTrader.PendingRequest = nil
        State.AutoTrader.RequestLifecycle = "idle"
        State.AutoTrader.RequestConfirmGeneration += 1
    end
    if State.AutoTrader.IncomingRequestDecision
        and State.AutoTrader.IncomingRequestDecision.userId == partner.UserId then
        State.AutoTrader.IncomingRequestGeneration += 1
        State.AutoTrader.IncomingRequestResolvingSignature = nil
        State.AutoTrader.IncomingRequestDecision = nil
    end
    local allowed, allowReason = State.AutoTrader.PlayerAllowed(partner)
    if not allowed then
        State.AutoTrader.Plan = nil
        State.AutoTrader.Desired = nil
        if allowReason == "friend status pending" then
            State.AutoTrader.SetManagedPartner(nil)
            State.AutoTrader.RestoreTradeVisuals()
            State.AutoTrader.FriendTradeCheckStartedAt = (State.AutoTrader.FriendTradeCheckStartedAt or 0) > 0
                and State.AutoTrader.FriendTradeCheckStartedAt or os.clock()
            State.AutoTrader.RequestFriendStatus(partner, true)
            State.AutoTrader.Status = "WAIT · FRIEND CHECK"
            State.AutoTrader.StatusDetail = "This active trade is paused only long enough to resolve Ignore Friends safely."
        elseif State.AutoTrader.Preferences.automation then
            State.AutoTrader.SetManagedPartner(partner)
            State.AutoTrader.FriendTradeCheckStartedAt = 0
            State.AutoTrader.Status = "DECLINING · DISALLOWED TRADE"
            State.AutoTrader.StatusDetail = tostring(allowReason) .. "; ending the trade cleanly before selecting anyone else."
            task.defer(function()
                if not Destroyed and State.CurrentTrade then
                    State.AutoTrader.EndDisallowedTrade(partner, tostring(allowReason))
                end
            end)
        else
            State.AutoTrader.SetManagedPartner(nil)
            State.AutoTrader.RestoreTradeVisuals()
            State.AutoTrader.Status = "MANUAL TRADE · NOT MANAGED"
            State.AutoTrader.StatusDetail = tostring(allowReason)
        end
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.FriendTradeCheckStartedAt = 0
    if State.AutoTrader.Preferences.automation then
        State.AutoTrader.SetManagedPartner(partner)
        State.AutoTrader.SuppressTradeVisuals()
    else
        State.AutoTrader.SetManagedPartner(nil)
        State.AutoTrader.RestoreTradeVisuals()
    end
    local actionObservation = State.AutoTrader.ObserveAction(localEntries)
    if actionObservation == false or State.AutoTrader.SessionFrozen then
        State.AutoTrader.Render()
        return
    end
    if State.AutoTrader.Preferences.automation and State.AutoTrader.IsLocalAccepted() then
        if not State.AutoTrader.ManualAcceptHold then
            State.AutoTrader.ManualAcceptHold = true
            State.AutoTrader.ActionGeneration += 1
            State.AutoTrader.ActionInFlight = nil
            State.AutoTrader.Log("manual_accept_hold", {})
        end
        State.AutoTrader.Status = "LOCAL ACCEPT ACTIVE · HANDS OFF"
        State.AutoTrader.StatusDetail = "A local/manual acceptance is active. Auto Trader will not modify the offer until acceptance resets."
        State.AutoTrader.Render()
        return
    elseif State.AutoTrader.ManualAcceptHold then
        State.AutoTrader.ManualAcceptHold = false
        State.AutoTrader.Log("manual_accept_reset", {})
    end
    local otherSummary = State.AutoTrader.SummarizeOther(otherEntries)
    State.AutoTrader.OtherSummary = otherSummary
    if otherSummary.slotCount > 0 and State.AutoTrader.FirstOfferAt <= 0 then
        State.AutoTrader.FirstOfferAt = os.clock()
        State.AutoTrader.Log("first_offer_seen", {partner = partner.Name, seconds = os.clock() - State.AutoTrader.TradeBeganAt})
    end
    if not State.AutoTrader.Preferences.unknownTheirZero and otherSummary.unknownCount > 0 then
        State.AutoTrader.Plan = nil
        State.AutoTrader.Desired = nil
        State.AutoTrader.Status = "FROZEN · UNKNOWN VALUE"
        State.AutoTrader.StatusDetail = "Their offer contains unresolved or nonnumeric values and Unknown Their Value = 0 is OFF."
        State.AutoTrader.Render()
        return
    end
    local tradable, inventoryReason, inventorySnapshot = State.AutoTrader.GetTradableInventory()
    if not tradable then
        State.AutoTrader.ActiveTradeInventoryWaitSince = (State.AutoTrader.ActiveTradeInventoryWaitSince or 0) > 0
            and State.AutoTrader.ActiveTradeInventoryWaitSince or os.clock()
        State.AutoTrader.Status = "WAIT · INVENTORY"
        State.AutoTrader.StatusDetail = tostring(inventoryReason or "Waiting for verified local inventory.") .. " Refreshing your inventory directly before deciding whether to end this trade."
        State.AutoTrader.Plan = nil
        State.AutoTrader.Desired = nil
        if type(State.Profile.FetchRemoteTotalForPlayer) == "function" then
            task.spawn(function() State.Profile.FetchRemoteTotalForPlayer(LocalPlayer, true) end)
        end
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.ActiveTradeInventoryWaitSince = 0
    State.AutoTrader.Anchor = State.AutoTrader.GetAnchor(tradable)
    local otherHash = State.AutoTrader.OfferHash(otherEntries)
    if otherSummary.slotCount == 0 then
        State.AutoTrader.Plan = nil
        State.AutoTrader.Safety = nil
        State.AutoTrader.LastCalculationSignature = nil
        State.AutoTrader.LastOtherHash = otherHash
        State.AutoTrader.OtherStableSince = os.clock()
        if State.AutoTrader.Preferences.openingAnchor and State.AutoTrader.Anchor then
            local anchorItem = {
                key = State.AutoTrader.Anchor.key,
                itemId = State.AutoTrader.Anchor.itemId,
                itemType = State.AutoTrader.Anchor.itemType,
                name = State.AutoTrader.Anchor.name,
                quantity = 1,
                unitValue = State.AutoTrader.Anchor.unitValue,
                record = State.AutoTrader.Anchor.record,
                demand = State.AutoTrader.Anchor.demand,
            }
            State.AutoTrader.Desired = {
                items = {anchorItem},
                kind = "anchor",
            }
            State.AutoTrader.Status = State.AutoTrader.Preferences.automation and "OPENING ANCHOR" or "SHADOW ANCHOR"
            State.AutoTrader.StatusDetail = "Safe anchor: "
                .. anchorItem.name
                .. " · "
                .. formatCompact(anchorItem.unitValue)
                .. "."
            if State.AutoTrader.Preferences.automation
                and os.clock() - State.AutoTrader.TradeBeganAt >= CONFIG.AutoTraderTradeWarmupSeconds then
                local context = State.AutoTrader.BuildActionContext("anchor", otherHash, inventorySnapshot, partner)
                State.AutoTrader.ReconcileDesired(localEntries, State.AutoTrader.Desired, context)
            end
        else
            State.AutoTrader.Desired = {items = {}, kind = "clear"}
            State.AutoTrader.Status = "WAIT · THEIR OFFER"
            State.AutoTrader.StatusDetail = "Waiting for them to offer something. Opening Anchor is off or no eligible anchor exists."
        end
        State.AutoTrader.Render()
        return
    end
    if otherSummary.knownFloor <= 0 then
        State.AutoTrader.Plan = nil
        State.AutoTrader.Safety = nil
        State.AutoTrader.Desired = {items = {}, kind = "clear"}
        State.AutoTrader.Status = "WAIT · KNOWN VALUE"
        State.AutoTrader.StatusDetail = otherSummary.unknownCount > 0
            and "Their offer currently has only unknown/nonnumeric value. It is treated as a 0-value floor."
            or "Their offer has no positive numeric value."
        if State.AutoTrader.Preferences.automation then
            local context = State.AutoTrader.BuildActionContext("clear", otherHash, inventorySnapshot, partner)
            State.AutoTrader.ReconcileDesired(localEntries, State.AutoTrader.Desired, context)
        end
        State.AutoTrader.Render()
        return
    end
    if otherHash ~= State.AutoTrader.LastOtherHash then
        State.AutoTrader.LastOtherHash = otherHash
        State.AutoTrader.OtherStableSince = os.clock()
        State.AutoTrader.PlanGeneration += 1
        State.AutoTrader.Plan = nil
        State.AutoTrader.Safety = nil
        State.AutoTrader.Desired = nil
        State.AutoTrader.LastCalculationSignature = nil
        State.AutoTrader.Status = "WAIT · STABILIZING"
        State.AutoTrader.StatusDetail = "Their exact offer changed. Waiting "
            .. formatNumber(CONFIG.AutoTraderStableSeconds)
            .. "s before changing your offer."
        State.AutoTrader.Render()
        local generation = State.AutoTrader.PlanGeneration
        task.delay(CONFIG.AutoTraderStableSeconds + 0.05, function()
            if Destroyed
                or generation ~= State.AutoTrader.PlanGeneration
                or State.AutoTrader.LastOtherHash ~= otherHash then
                return
            end
            scheduleTradeRefresh(0)
        end)
        return
    end
    local stableFor = os.clock() - State.AutoTrader.OtherStableSince
    if stableFor < CONFIG.AutoTraderStableSeconds then
        State.AutoTrader.Status = "WAIT · STABILIZING"
        State.AutoTrader.StatusDetail = "Stable for "
            .. formatNumber(stableFor)
            .. " / "
            .. formatNumber(CONFIG.AutoTraderStableSeconds)
            .. "s."
        State.AutoTrader.Render()
        return
    end
    local negotiation = State.AutoTrader.GetNegotiationStage(otherSummary)
    State.AutoTrader.LastNegotiation = negotiation
    local scheduleKey = otherHash .. "|stage:" .. tostring(negotiation.stage)
    if negotiation.nextIn and State.AutoTrader.LastNegotiationScheduleKey ~= scheduleKey then
        State.AutoTrader.LastNegotiationScheduleKey = scheduleKey
        local expectedHash = otherHash
        local expectedStage = negotiation.stage
        task.delay(negotiation.nextIn + 0.06, function()
            if Destroyed or not State.CurrentTrade or State.AutoTrader.LastOtherHash ~= expectedHash then return end
            local current = State.AutoTrader.GetNegotiationStage(State.AutoTrader.OtherSummary or otherSummary)
            if current.stage ~= expectedStage then
                State.AutoTrader.LastCalculationSignature = nil
                scheduleTradeRefresh(0)
            end
        end)
    end
    local mappingRevision = State.Mapping.Revision
    local inventoryStamp = inventorySnapshot and inventorySnapshot.lastSuccess or nil
    local calculationSignature = otherHash
        .. "|"
        .. tostring(mappingRevision)
        .. "|"
        .. tostring(inventoryStamp)
        .. "|"
        .. tostring(HARDEN.supremeDataRevision)
        .. "|"
        .. tostring(HARDEN.supremeDataHash)
        .. "|game:"
        .. tostring(State.GameDataRevision)
        .. "|"
        .. tostring(State.AutoTrader.Preferences.winPreset)
        .. "|"
        .. tostring(State.AutoTrader.Preferences.preferDuplicates)
        .. "|"
        .. tostring(State.AutoTrader.ReserveTypeCount())
        .. "|"
        .. tostring(State.AutoTrader.Preferences.unknownTheirZero)
        .. "|neg:" .. tostring(negotiation.stage)
    if State.AutoTrader.LastCalculationSignature == calculationSignature and State.AutoTrader.Plan then
        if State.AutoTrader.Preferences.automation and State.AutoTrader.Desired then
            local context = State.AutoTrader.BuildActionContext("plan", otherHash, inventorySnapshot, partner)
            State.AutoTrader.ReconcileDesired(localEntries, State.AutoTrader.Desired, context)
        else
            State.AutoTrader.Render()
        end
        return
    end
    State.AutoTrader.LastCalculationSignature = calculationSignature
    State.AutoTrader.PlanGeneration += 1
    local generation = State.AutoTrader.PlanGeneration
    local expectedDatabaseRevision = HARDEN.supremeDataRevision
    local expectedDatabaseHash = HARDEN.supremeDataHash
    local expectedGameDataRevision = State.GameDataRevision
    local expectedPartnerUserId = partner.UserId
    State.AutoTrader.Status = "CALCULATING"
    State.AutoTrader.StatusDetail = "Optimizing expected value/hour: targeting negotiation stage "
        .. tostring(negotiation.stage)
        .. " while preserving the same hard dynamic minimum-win and market-quality floors."
    State.AutoTrader.Render()
    task.spawn(function()
        local plan, reason, diagnostics = State.AutoTrader.FindPlan(otherSummary, tradable, generation, negotiation)
        if Destroyed or generation ~= State.AutoTrader.PlanGeneration then
            return
        end
        State.AutoTrader.LastPlannerReason = {
            reason = reason,
            diagnostics = diagnostics,
        }
        if not plan then
            State.AutoTrader.Plan = nil
            State.AutoTrader.Safety = nil
            State.AutoTrader.Desired = nil
            State.AutoTrader.Status = "NO SAFE COMBINATION"
            State.AutoTrader.StatusDetail = tostring(reason or "No safe combination found.")
            State.AutoTrader.Log("plan_none", State.AutoTrader.LastPlannerReason)
            State.AutoTrader.Render()
            return
        end
        local validationContext = {
            otherHash = otherHash,
            mappingRevision = mappingRevision,
            inventoryStamp = inventoryStamp,
            databaseRevision = expectedDatabaseRevision,
            databaseHash = expectedDatabaseHash,
            gameDataRevision = expectedGameDataRevision,
            partnerUserId = expectedPartnerUserId,
        }
        local safe, safety = State.AutoTrader.ValidatePlan(plan, validationContext)
        if Destroyed or generation ~= State.AutoTrader.PlanGeneration then
            return
        end
        State.AutoTrader.Safety = safety
        if not safe then
            State.AutoTrader.Plan = nil
            State.AutoTrader.Desired = nil
            State.AutoTrader.Status = "FROZEN · SAFETY CHECK"
            State.AutoTrader.StatusDetail = tostring(safety and safety.reason or "Independent safety validation failed.")
            State.AutoTrader.Log("plan_rejected", safety)
            State.AutoTrader.Render()
            return
        end
        plan.validationContext = {
            mappingRevision = mappingRevision,
            databaseRevision = expectedDatabaseRevision,
            databaseHash = expectedDatabaseHash,
            gameDataRevision = expectedGameDataRevision,
            partnerUserId = expectedPartnerUserId,
        }
        State.AutoTrader.Plan = plan
        State.AutoTrader.Desired = {
            items = plan.items,
            kind = "plan",
        }
        State.AutoTrader.Status = State.AutoTrader.Preferences.automation
            and "PLAN VERIFIED"
            or "SHADOW READY"
        State.AutoTrader.StatusDetail = State.AutoTrader.Preferences.automation
            and (plan.proactiveAccept
                and "Final concession stage: exact safe plan is being reconciled and may auto-accept after the cooldown."
                or ("Holding a higher-profit negotiation stage (target margin "
                    .. formatPercent((plan.negotiationMargin or 0) * 100, false)
                    .. "). The bot will concede only if the same offer remains on the table."))
            or "Plan passed dynamic-profit and market-quality validation. Auto Trading is currently off."
        State.AutoTrader.Log("plan_ready", {
            receiveKnownFloor = plan.receiveTotal,
            unknownCount = plan.unknownCount,
            give = plan.total,
            win = plan.win,
            targetProfit = plan.targetProfit,
            negotiationStage = plan.negotiationStage,
            negotiationMargin = plan.negotiationMargin,
            proactiveAccept = plan.proactiveAccept,
            items = plan.items,
        })
        State.AutoTrader.Render()
        if State.AutoTrader.Preferences.automation then
            local context = State.AutoTrader.BuildActionContext("plan", otherHash, inventorySnapshot, partner)
            State.AutoTrader.ReconcileDesired(localEntries, State.AutoTrader.Desired, context)
        end
    end)
end
State.AutoTrader.ClearTradeRuntime = function()
    -- Do not rely on a secondary TradeGUI-disabled event to clear the authoritative
    -- state. Some executors miss that signal, which previously left REQUEST GATE
    -- stuck on "trade state active" after a decline.
    State.CurrentTrade = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.ActionGeneration += 1
    State.AutoTrader.ActionInFlight = nil
    State.AutoTrader.LastTradePartner = nil
    State.AutoTrader.ManagedPartnerUserId = nil
    State.AutoTrader.LastManagedLocalHash = nil
    State.AutoTrader.LastOtherHash = nil
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.OtherStableSince = 0
    State.AutoTrader.LastNegotiation = nil
    State.AutoTrader.LastNegotiationScheduleKey = nil
    State.AutoTrader.Plan = nil
    State.AutoTrader.Safety = nil
    State.AutoTrader.Anchor = nil
    State.AutoTrader.Desired = nil
    State.AutoTrader.OtherSummary = nil
    State.AutoTrader.ManualAcceptHold = false
    State.AutoTrader.AutoAcceptGeneration += 1
    State.AutoTrader.AutoAcceptScheduledKey = nil
    State.AutoTrader.AutoAcceptSentKey = nil
    State.AutoTrader.AutoAcceptSentAt = 0
    State.AutoTrader.OtherAcceptedAt = 0
    State.AutoTrader.LastTradeUpdateAt = 0
    State.AutoTrader.LastTradeActivityAt = 0
    State.AutoTrader.FirstOfferAt = 0
    State.AutoTrader.AutoAcceptTradeUpdateAt = 0
    State.AutoTrader.PendingAutoTransaction = nil
    State.AutoTrader.SettlementStartedAt = 0
    State.AutoTrader.SettlementGoneSince = 0
    State.AutoTrader.SettlementLastProbeAt = 0
    State.AutoTrader.SettlementEndedProbeCount = 0
    State.AutoTrader.FriendTradeCheckStartedAt = 0
    State.AutoTrader.UnresolvedTradePartnerSince = 0
    State.AutoTrader.ActiveTradeInventoryWaitSince = 0
    State.AutoTrader.RestoreTradeVisuals()
    State.AutoTrader.TradeBeganAt = 0
    State.AutoTrader.TradeRequestStartedAt = 0
    State.AutoTrader.TradeCorrelationId = nil
end
State.AutoTrader.OnNoTrade = function()
    -- v30: if an owned auto-accepted transaction lost its completion event, keep
    -- its audit evidence alive until authoritative trade status says the trade is gone.
    if State.AutoTrader.PendingAutoTransaction and (State.AutoTrader.SettlementStartedAt or 0) > 0 then
        State.AutoTrader.RecoverOwnedSettlementIfEnded()
        if State.AutoTrader.PendingAutoTransaction then
            State.AutoTrader.Status = "TRADE SETTLEMENT · VERIFYING"
            State.AutoTrader.StatusDetail = "Both sides accepted. The native trade UI is gone, so verifying authoritative trade state before deciding whether the transaction completed."
            State.AutoTrader.Render()
            return
        end
        if State.AutoTrader.PostTradeAuditPending then return end
    end
    if State.AutoTrader.LastTradePartner or State.AutoTrader.ManagedPartnerUserId then
        State.AutoTrader.ClearTradeRuntime()
    else
        State.AutoTrader.RestoreTradeVisuals()
    end
    if State.AutoTrader.PostTradeAuditPending then
        State.AutoTrader.Status = "AUDITING TRADE"
        State.AutoTrader.StatusDetail = "Waiting for the fresh verified post-trade inventory audit before requesting anyone else."
        State.AutoTrader.Render()
        return
    end
    if State.AutoTrader.TradeDeclinePending then
        State.AutoTrader.Status = "TRADE END · CONFIRMING"
        State.AutoTrader.StatusDetail = "Waiting for MM2's native trade state to remain closed before another request can start."
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.ReconcileOutgoingRequestState()
    State.AutoTrader.ReconcileTradeDeclineState()
    if State.AutoTrader.PendingRequest or State.AutoTrader.TradeDeclinePending then
        State.AutoTrader.Render()
        return
    end
    if State.AutoTrader.RecoveryTeleportRequired then
        State.AutoTrader.Status = "RECOVERING · REJOIN"
        State.AutoTrader.StatusDetail = tostring(State.AutoTrader.RecoveryTeleportReason or "A clean-state rejoin is required before trading can continue.")
        State.AutoTrader.RequestRecoveryTeleport(State.AutoTrader.RecoveryTeleportReason or "pending recovery")
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.BindIncomingRequestObserver()
    local _, incomingFrame = State.AutoTrader.GetIncomingRequestUi()
    if State.AutoTrader.Preferences.automation and incomingFrame and State.AutoTrader.IsGuiShown(incomingFrame) then
        State.AutoTrader.HandleIncomingRequest()
        State.AutoTrader.Status = "INCOMING REQUEST"
        State.AutoTrader.StatusDetail = "Handling an incoming trade request before cold outgoing targeting."
        State.AutoTrader.Render()
        return
    end
    if State.AutoTrader.PendingRequest then
        local player = Players:GetPlayerByUserId(State.AutoTrader.PendingRequest.userId)
        if not player then
            State.AutoTrader.Log("pending_target_left", State.AutoTrader.PendingRequest)
            if State.AutoTrader.PendingRequest.phase ~= "canceling" then
                local started, err = State.AutoTrader.BeginPendingRequestCancellation("pending target left the server", "trade_unavailable", false)
                if not started then State.AutoTrader.RequestRecoveryTeleport("pending target left and request cancellation failed: " .. tostring(err)) end
            end
            State.AutoTrader.Status = "REQUEST · CLEANING UP"
            State.AutoTrader.StatusDetail = "The target left; canceling any surviving native request before selecting another player."
            State.AutoTrader.Render()
            return
        else
            local phase = State.AutoTrader.PendingRequest.phase or "pending"
            State.AutoTrader.Status = phase == "pending" and "REQUEST PENDING" or "REQUEST · VERIFYING"
            State.AutoTrader.StatusDetail = phase == "pending"
                and ("Waiting up to " .. tostring(CONFIG.AutoTraderPendingRequestTimeoutSeconds) .. "s for " .. player.Name .. " to accept or decline.")
                or ("Waiting briefly for MM2's native SendingRequest confirmation for " .. player.Name .. ".")
            State.AutoTrader.SelectedTarget = player
            State.AutoTrader.Render()
            return
        end
    end
    -- v21: current-server bot evidence cannot cause a hop. Only ordinary
    -- target/discovery/exhaustion/liveness logic below decides when to leave.
    local target = State.AutoTrader.SelectTarget()
    if State.AutoTrader.Preferences.automation then
        if State.AutoTrader.SessionFrozen then
            State.AutoTrader.Status = "FROZEN · SAFETY STOP"
            State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
        elseif target then
            State.AutoTrader.ServerExhaustedSince = 0
            State.AutoTrader.Status = "AUTO TARGET"
            State.AutoTrader.StatusDetail = "Next eligible: " .. target.Name .. ". Ranked by estimated audited Supreme-value gain per second, response/trade probability, and usable inventory composition."
            local started, requestReason = State.AutoTrader.TrySendRequest()
            if not started and requestReason == "request spacing" then
                State.AutoTrader.Status = "WAIT · REQUEST SPACING"
                State.AutoTrader.StatusDetail = "Next eligible: " .. target.Name .. ". Sending as soon as the short anti-spam spacing expires."
            elseif not started and requestReason and requestReason ~= "request already pending" then
                State.AutoTrader.Status = "WAIT · REQUEST GATE"
                State.AutoTrader.StatusDetail = "Next eligible: " .. target.Name .. ". Request is currently blocked by: " .. tostring(requestReason) .. "."
            end
        else
            local disposition, counts = State.AutoTrader.GetServerDisposition()
            State.AutoTrader.LastServerDisposition = {kind = disposition, counts = counts, at = os.clock()}
            if disposition == "WAITING_FOR_DISCOVERY" then
                State.AutoTrader.ServerExhaustedSince = 0
                State.AutoTrader.KickServerDiscovery()
                State.AutoTrader.Status = "WAIT · DISCOVERY"
                State.AutoTrader.StatusDetail = "No actionable target yet; " .. tostring(counts.discoveryPending or counts.unknown or 0) .. " player inventory/inventories are still inside the bounded discovery window."
            elseif disposition == "WAITING_FOR_FRIEND_STATUS" then
                State.AutoTrader.ServerExhaustedSince = 0
                State.AutoTrader.Status = "WAIT · FRIEND CHECK"
                State.AutoTrader.StatusDetail = "No actionable target yet; waiting briefly for " .. tostring(counts.friendPending or 0) .. " friend-status lookup(s)."
            elseif disposition == "WAITING_FOR_RETRY" then
                State.AutoTrader.ServerExhaustedSince = 0
                State.AutoTrader.Status = "WAIT · RETRY"
                State.AutoTrader.StatusDetail = "No target is actionable this instant; the earliest clean retry opens in about " .. formatNumber(counts.earliestRetry or 0) .. "s."
            elseif string.sub(disposition, 1, 9) == "EXHAUSTED" then
                if State.AutoTrader.ServerExhaustedSince <= 0 then
                    State.AutoTrader.ServerExhaustedSince = os.clock()
                end
                State.AutoTrader.Status = "SERVER EXHAUSTED"
                State.AutoTrader.StatusDetail = disposition .. " · hopping after the short anti-race grace period."
                if os.clock() - State.AutoTrader.ServerExhaustedSince >= CONFIG.AutoTraderServerHopGraceSeconds then
                    State.AutoTrader.TryServerHop(disposition, counts)
                end
            else
                State.AutoTrader.ServerExhaustedSince = 0
                local reason = "shared eligibility invariant produced no target with unexpected disposition " .. tostring(disposition)
                State.AutoTrader.Log("eligibility_controller_invariant_violation", {disposition = disposition, counts = counts})
                State.AutoTrader.Status = "CONTROLLER MISMATCH · RECOVERING"
                State.AutoTrader.StatusDetail = reason .. "; rejoining instead of idling."
                State.AutoTrader.RequestRecoveryTeleport(reason)
            end
        end
    else
        State.AutoTrader.Status = target and "SHADOW TARGET" or "AUTO OFF"
        State.AutoTrader.StatusDetail = target
            and ("Would consider " .. target.Name .. " using response history + inventory-quality ranking. Auto Trading is OFF.")
            or "Auto Trading is OFF. Planner can still analyze manual trades."
    end
    State.AutoTrader.Render()
end
State.AutoTrader.BuildDebug = function()
    local localEntries = nil
    local otherEntries = nil
    local partner = nil
    if type(State.CurrentTrade) == "table" then
        local localSide, otherSide = getTradeSides(State.CurrentTrade)
        if localSide and otherSide then
            localEntries = resolveTradeOffer(localSide)
            otherEntries = resolveTradeOffer(otherSide)
            partner = State.AutoTrader.GetPlayerFromSide(otherSide)
        end
    end
    local inventory = State.AutoTrader.GetLocalInventory(false)
    local auditSnapshot = State.AutoTrader.GetLocalAuditSnapshot(false)
    local reserveList = {}
    if inventory then
        for _, entry in ipairs(inventory.entries) do
            local reserve = State.AutoTrader.GetReserve(entry.itemType, entry.itemId)
            if reserve > 0 then
                table.insert(reserveList, {
                    key = entry.key,
                    name = entry.name,
                    itemId = entry.itemId,
                    itemType = entry.itemType,
                    owned = entry.quantity,
                    reserve = reserve,
                    tradable = math.max(0, entry.quantity - reserve),
                    unitValue = entry.unitValue,
                })
            end
        end
    end
    local serverCandidates = {}
    local eligibilityContext = State.AutoTrader.BuildEligibilityContext()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local eligibility = State.AutoTrader.EvaluatePlayerEligibility(player, eligibilityContext)
            local total, verified, valueReason, info = State.AutoTrader.GetVerifiedPlayerValue(player)
            local rawStats = State.AutoTrader.TargetStats.players[tostring(player.UserId)]
            local profile = total and State.AutoTrader.GetTargetProfile(player) or nil
            local score = total and State.AutoTrader.GetTargetScore(player, total) or nil
            table.insert(serverCandidates, {
                name = player.Name,
                userId = player.UserId,
                verifiedTotal = verified and total or nil,
                valueState = valueReason,
                rawVerifiedInfo = info and {
                    total = info.total,
                    partial = info.partial,
                    unresolvedUnits = info.unresolvedUnits,
                    nonNumericUnits = info.nonNumericUnits,
                    resolvedUnits = info.resolvedUnits,
                } or nil,
                score = score,
                botRisk = State.AutoTrader.GetPlayerBotRisk and select(1, State.AutoTrader.GetPlayerBotRisk(player)) or 0,
                botInfo = State.AutoTrader.GetPlayerBotRisk and select(2, State.AutoTrader.GetPlayerBotRisk(player)) or nil,
                profile = profile,
                stats = rawStats,
                friend = State.AutoTrader.FriendCache[player.UserId],
                friendMeta = State.AutoTrader.FriendCacheMeta[player.UserId],
                serverState = State.AutoTrader.ServerPlayers[player.UserId],
                cooldown = State.AutoTrader.CooldownRemaining(player),
                eligibility = {
                    state = eligibility.state,
                    actionable = eligibility.actionable == true,
                    reason = eligibility.reason,
                    retryIn = eligibility.retryIn,
                    score = eligibility.score,
                    verifiedTotal = eligibility.verifiedTotal,
                    economicPath = eligibility.economicPath,
                },
            })
        end
    end
    table.sort(serverCandidates, function(a, b)
        return (tonumber(a.score) or -math.huge) > (tonumber(b.score) or -math.huge)
    end)
    while #serverCandidates > 12 do
        table.remove(serverCandidates)
    end
    local otherSummary = otherEntries and State.AutoTrader.SummarizeOther(otherEntries) or State.AutoTrader.OtherSummary
    local effectiveMin, effectiveInfo = nil, State.AutoTrader.LastEffectiveMinimumWin
    if otherSummary and (tonumber(otherSummary.knownFloor) or 0) > 0 then
        effectiveMin, effectiveInfo = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    end
    local auditKeyCount = 0
    if auditSnapshot then
        for _ in pairs(auditSnapshot.quantities or {}) do
            auditKeyCount += 1
        end
    end
    local persistentStatsCount = 0
    for _ in pairs((State.AutoTrader.TargetStats and State.AutoTrader.TargetStats.players) or {}) do
        persistentStatsCount += 1
    end
    local strategyStats = State.AutoTrader.GetStrategyStats()
    local botIconSummary = {}
    for fingerprint, record in pairs(State.AutoTrader.BotIconDb.icons or {}) do
        local class, confidence = State.AutoTrader.GetBotIconClass(fingerprint)
        table.insert(botIconSummary, {
            fingerprint = fingerprint,
            class = class,
            confidence = confidence,
            botEvidence = tonumber(record.botEvidence) or 0,
            humanEvidence = tonumber(record.humanEvidence) or 0,
            botJobs = State.AutoTrader.BotIconJobCount(record.botJobs),
            humanJobs = State.AutoTrader.BotIconJobCount(record.humanJobs),
            goldBotJobs = State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs),
            goldBotSightings = tonumber(record.strictGoldBotSightings) or 0,
            legacyV19GoldJobs = State.AutoTrader.BotIconJobCount(record.goldBotJobs),
            legacyV19GoldSightings = tonumber(record.goldBotSightings) or 0,
            botPlayerSightings = tonumber(record.botPlayerSightings) or 0,
            humanPlayerSightings = tonumber(record.humanPlayerSightings) or 0,
            firstSeen = record.firstSeen,
            lastSeen = record.lastSeen,
        })
    end
    table.sort(botIconSummary, function(a, b)
        if (a.goldBotJobs or 0) ~= (b.goldBotJobs or 0) then return (a.goldBotJobs or 0) > (b.goldBotJobs or 0) end
        return (a.goldBotSightings or 0) > (b.goldBotSightings or 0)
    end)
    while #botIconSummary > 20 do table.remove(botIconSummary) end
    local _, liveReceiving, liveIncomingTitle, liveIncomingUsername = State.AutoTrader.GetIncomingRequestUi()
    local _, liveSending, liveSendingUsername = State.AutoTrader.GetOutgoingRequestUi()
    local payload = {
        format = HARDEN.supportFormat,
        version = CONTROLLER_VERSION,
        generatedUnix = os.time(),
        generatedClock = os.clock(),
        supportInstruction = "Paste this entire block into ChatGPT when asking about Auto Trader behavior.",
        executorCompatibility = {
            requestAvailable = type(httpRequest) == "function",
            queueOnTeleportAvailable = type(State.AutoTrader.GetQueueOnTeleport()) == "function",
            readfileAvailable = type(State.TryGetExecutorGlobal("readfile")) == "function",
            writefileAvailable = type(State.TryGetExecutorGlobal("writefile")) == "function",
            isfileAvailable = type(State.TryGetExecutorGlobal("isfile")) == "function",
            scriptInstanceAvailable = (function()
                local value = nil
                pcall(function() value = script end)
                return typeof(value) == "Instance"
            end)(),
            staticHttpFallbackEnabled = true,
        },
        preferences = {
            automation = State.AutoTrader.Preferences.automation,
            ignoreFriends = State.AutoTrader.Preferences.ignoreFriends,
            openingAnchor = State.AutoTrader.Preferences.openingAnchor,
            preferDuplicates = State.AutoTrader.Preferences.preferDuplicates,
            unknownTheirZero = State.AutoTrader.Preferences.unknownTheirZero,
            winPreset = State.AutoTrader.Preferences.winPreset,
            baseMinimumWin = State.AutoTrader.GetMinimumWin(),
            dynamicMinimumPercent = CONFIG.AutoTraderMinWinPercent,
            fullAutoAccept = true,
            backgroundTrading = true,
            serverHopEnabled = CONFIG.AutoTraderServerHopEnabled,
            movementWatchdogEnabled = CONFIG.AutoTraderMovementWatchdogEnabled,
            outgoingNativeConfirmSeconds = CONFIG.AutoTraderOutgoingNativeConfirmSeconds,
            requestInvokeTimeoutSeconds = CONFIG.AutoTraderRequestInvokeTimeoutSeconds,
            httpTimeoutSeconds = CONFIG.AutoTraderHttpTimeoutSeconds,
            incomingResolveSeconds = CONFIG.AutoTraderIncomingResolveSeconds,
            incomingUnresolvedTimeoutSeconds = CONFIG.AutoTraderIncomingUnresolvedTimeoutSeconds,
            incomingStuckTimeoutSeconds = CONFIG.AutoTraderIncomingStuckTimeoutSeconds,
            staleTradeGuiTimeoutSeconds = CONFIG.AutoTraderStaleTradeGuiTimeoutSeconds,
            absoluteTradeTimeoutSeconds = CONFIG.AutoTraderAbsoluteTradeTimeoutSeconds,
            serverHopHardTimeoutSeconds = CONFIG.AutoTraderServerHopHardTimeoutSeconds,
            serverGoldBotRejectRatio = CONFIG.AutoTraderGoldBotRejectRatio,
            serverRescanDelaySeconds = CONFIG.AutoTraderServerRescanDelaySeconds,
            serverRateLimitMaxBackoffSeconds = CONFIG.AutoTraderServerRateLimitMaxBackoffSeconds,
            serverRateLimitBlindHopAfterScans = CONFIG.AutoTraderServerRateLimitBlindHopAfterScans,
            serverHopTotalTimeoutSeconds = CONFIG.AutoTraderServerHopTotalTimeoutSeconds,
            serverCandidateCacheTtlSeconds = CONFIG.AutoTraderServerCandidateCacheTtlSeconds,
            serverCandidateCacheLimit = CONFIG.AutoTraderServerCandidateCacheLimit,
            serverFirstPageUsableTarget = CONFIG.AutoTraderServerFirstPageUsableTarget,
            teleportHardTimeoutSeconds = CONFIG.AutoTraderTeleportStartedHardTimeoutSeconds,
            noEligibleWorkTimeoutSeconds = CONFIG.AutoTraderNoEligibleWorkTimeoutSeconds,
            targetOpportunityFloor = CONFIG.AutoTraderTargetOpportunityFloor,
            economicSkipGraceSeconds = CONFIG.AutoTraderEconomicSkipGraceSeconds,
            retryWaitMaxSeconds = CONFIG.AutoTraderRetryWaitMaxSeconds,
            friendLookupMaxWaitSeconds = CONFIG.AutoTraderFriendLookupMaxWaitSeconds,
            friendTradeResolveSeconds = CONFIG.AutoTraderFriendTradeResolveSeconds,
            tradePartnerResolveSeconds = CONFIG.AutoTraderTradePartnerResolveSeconds,
            activeInventoryResolveSeconds = CONFIG.AutoTraderActiveInventoryResolveSeconds,
            acceptedSettlementProbeSeconds = CONFIG.AutoTraderAcceptedSettlementProbeSeconds,
            acceptedSettlementGoneQuietSeconds = CONFIG.AutoTraderAcceptedSettlementGoneQuietSeconds,
            acceptedSettlementPollSeconds = CONFIG.AutoTraderAcceptedSettlementPollSeconds,
            postTradeAuditTimeoutSeconds = CONFIG.AutoTraderPostTradeAuditTimeoutSeconds,
            learnedHopOpportunityRate = State.AutoTrader.GetHopOpportunityRate(),
            hopOpportunityRetentionFactor = CONFIG.AutoTraderHopOpportunityRetentionFactor,
            goldBotLearning = {
                source = "strict_persistent_remote_movedirection_plus_fixed_facing_adaptive_human_latency",
                observeSecondsCap = CONFIG.AutoTraderGoldObserveSeconds,
                effectiveObserveSeconds = State.AutoTrader.GetGoldAdaptiveObserveSeconds(),
                adaptivePaddingSeconds = CONFIG.AutoTraderGoldAdaptiveObservePaddingSeconds,
                humanTimingSamples = tonumber(State.AutoTrader.HumanDetectionTiming and State.AutoTrader.HumanDetectionTiming.count) or 0,
                humanTimingLongestSeconds = tonumber(State.AutoTrader.HumanDetectionTiming and State.AutoTrader.HumanDetectionTiming.maxSeconds) or 0,
                remoteSignal = "persistent per-player Humanoid.MoveDirection + HumanoidRootPart.CFrame",
                moveDirectionEpsilon = CONFIG.AutoTraderGoldMoveDirectionEpsilon,
                characterSettleSeconds = CONFIG.AutoTraderGoldCharacterSettleSeconds,
                moveDirectionViolationMinSamples = CONFIG.AutoTraderGoldMoveDirectionViolationMinSamples,
                moveDirectionViolationMinSpanSeconds = CONFIG.AutoTraderGoldMoveDirectionViolationMinSpanSeconds,
                moveDirectionViolationGapSeconds = CONFIG.AutoTraderGoldMoveDirectionViolationGapSeconds,
                orientationFuzzDegrees = CONFIG.AutoTraderGoldOrientationFuzzDegrees,
                minTotalDistanceStuds = CONFIG.AutoTraderGoldMinTotalDistanceStuds,
                minMaxDisplacementStuds = CONFIG.AutoTraderGoldMinMaxDisplacementStuds,
                minMovingSamples = CONFIG.AutoTraderGoldMinMovingSamples,
                minMovementSpanSeconds = CONFIG.AutoTraderGoldMinMovementSpanSeconds,
                minRemotePlayers = CONFIG.AutoTraderGoldMinRemotePlayers,
            },
            negotiationMargins = {
                CONFIG.AutoTraderNegotiationStage1Margin,
                CONFIG.AutoTraderNegotiationStage2Margin,
                CONFIG.AutoTraderNegotiationStage3Margin,
                0,
            },
            negotiationStageSeconds = {
                CONFIG.AutoTraderNegotiationStage2Seconds,
                CONFIG.AutoTraderNegotiationStage3Seconds,
                CONFIG.AutoTraderNegotiationFinalSeconds,
            },
        },
        marketSafetyConfig = {
            rejectUntradable = CONFIG.AutoTraderRejectUntradable,
            maxRecedingShare = CONFIG.AutoTraderMaxRecedingShare,
            maxUnderpaidShare = CONFIG.AutoTraderMaxUnderpaidShare,
            maxDemandDrop = CONFIG.AutoTraderMaxDemandDrop,
            maxFlipDrop = CONFIG.AutoTraderMaxFlipDrop,
            maxStabilityDrop = CONFIG.AutoTraderMaxStabilityDrop,
        },
        solverConfig = {
            objective = "maximize learned audited Supreme-value gain/hour; bot identity is excluded from current-server target/hop decisions",
            maxOfferSlots = CONFIG.MaxOfferSlots,
            exactStateLimit = CONFIG.AutoTraderExactStateLimit,
            beamWidth = CONFIG.AutoTraderBeamWidth,
            exactQuantityLimit = CONFIG.AutoTraderExactQuantityLimit,
            bucketFrontier = CONFIG.AutoTraderPlannerBucketFrontier,
            yieldBudgetMs = CONFIG.AutoTraderPlannerYieldBudgetMs,
        },
        database = {
            status = DatabaseStatus,
            lastDatabaseLoad = LastDatabaseLoad,
            lastDatabaseVerifiedAt = HARDEN.lastDatabaseVerifiedAt,
            databaseAgeSeconds = HARDEN.lastDatabaseVerifiedAt > 0 and (os.time() - HARDEN.lastDatabaseVerifiedAt) or nil,
            databaseSource = HARDEN.lastDatabaseSource,
            dataRevision = HARDEN.supremeDataRevision,
            dataHash = HARDEN.supremeDataHash,
            catalogItems = #Catalog,
            categoryCounts = HARDEN.supremeIndexDiagnostics.categoryCounts,
            canonicalCollisions = HARDEN.supremeIndexDiagnostics.canonicalCollisions,
            gameDatabaseSource = State.GameDatabaseSource,
            gameDataRevision = State.GameDataRevision,
            mappingRevision = State.Mapping.Revision,
            mappingEntries = mappingEntryCount(LinkedImages, State.Mapping.ItemLinks),
            lastMappingVerifiedAt = HARDEN.lastMappingVerifiedAt,
            mappingAgeSeconds = HARDEN.lastMappingVerifiedAt > 0 and (os.time() - HARDEN.lastMappingVerifiedAt) or nil,
            mappingSource = HARDEN.lastMappingSource,
            mappingDiagnostics = HARDEN.mappingDiagnostics,
            supremeLkgFile = HARDEN.supremeLkgFile,
            supremeLkgMetaFile = HARDEN.supremeLkgMetaFile,
            supremeLkgLegacyFile = HARDEN.supremeLkgLegacyFile,
            supremeHashMilliseconds = HARDEN.lastSupremeHashMilliseconds,
            supremeHashYields = HARDEN.lastSupremeHashYields,
            supremeLkgHashMilliseconds = HARDEN.lastSupremeLkgHashMilliseconds,
            supremeLkgHashYields = HARDEN.lastSupremeLkgHashYields,
            mappingsLkgFile = HARDEN.mappingsLkgFile,
            http = HttpState,
        },
        runtimeHealth = {
            externalOperations = externalOperationHealth(),
            persistence = HARDEN.persistenceHealth,
            subsystem = HARDEN.subsystemHealth,
            resolver = HARDEN.resolveTelemetry,
            guiDiscovery = HARDEN.guiDiscovery,
            connections = {
                root = #(Connections or {}),
                profile = #(State.Profile.connections or {}),
                tradeInventory = #(State.TradeInventoryConnections or {}),
            },
            remoteInvoke = {
                live = State.AutoTrader.RemoteInvokeLive, hung = State.AutoTrader.HungRemoteInvokes,
                circuitOpen = State.AutoTrader.RemoteInvokeCircuitOpen,
                timeoutsThisServer = State.AutoTrader.RemoteInvokeTimeoutsThisServer,
                latency = State.Profile.GetRemoteInvokeLatencyStats and State.Profile.GetRemoteInvokeLatencyStats() or nil,
            },
            recoveries = {count=State.AutoTrader.AutomaticRecoveryCount,lastReason=State.AutoTrader.LastRecoveryReason},
            safety = State.AutoTrader.LastSafetyEvent,
            decision = State.AutoTrader.LastDecisionEvent,
            render = {count=State.AutoTrader.RenderCount, lastAt=State.AutoTrader.LastRenderedAt},
            teleportScriptIntegrity = State.AutoTrader.TeleportScriptIntegrity,
            teleportQueueOutcome = State.AutoTrader.TeleportQueueOutcome,
            bootstrapId = State.AutoTrader.LastTeleportBootstrapId,
            degradedReason = State.AutoTrader.DataDegradedReason,
            tradeCorrelationId = State.AutoTrader.TradeCorrelationId,
        },
        status = State.AutoTrader.Status,
        statusDetail = State.AutoTrader.StatusDetail,
        negotiation = State.AutoTrader.LastNegotiation,
        opportunityDecision = State.AutoTrader.LastOpportunityDecision,
        eligibilitySummary = State.AutoTrader.LastEligibilitySnapshot and {
            at = State.AutoTrader.LastEligibilitySnapshot.at,
            counts = State.AutoTrader.LastEligibilitySnapshot.counts,
            earliestRetry = State.AutoTrader.LastEligibilitySnapshot.earliestRetry,
            bestName = State.AutoTrader.LastEligibilitySnapshot.best and State.AutoTrader.LastEligibilitySnapshot.best.Name or nil,
            bestScore = State.AutoTrader.LastEligibilitySnapshot.bestScore,
            bestEconomicName = State.AutoTrader.LastEligibilitySnapshot.bestEconomic and State.AutoTrader.LastEligibilitySnapshot.bestEconomic.Name or nil,
            bestEconomicScore = State.AutoTrader.LastEligibilitySnapshot.bestEconomicScore,
        } or nil,
        replayFixture = State.AutoTrader.LastReplayFixture,
        selfTest = State.AutoTrader.SelfTest,
        pendingAutoTransaction = State.AutoTrader.PendingAutoTransaction and {
            generation = State.AutoTrader.PendingAutoTransaction.generation,
            partnerUserId = State.AutoTrader.PendingAutoTransaction.partnerUserId,
            partnerName = State.AutoTrader.PendingAutoTransaction.partnerName,
            token = State.AutoTrader.PendingAutoTransaction.token,
            acceptKey = State.AutoTrader.PendingAutoTransaction.acceptKey,
            localHash = State.AutoTrader.PendingAutoTransaction.localHash,
            otherHash = State.AutoTrader.PendingAutoTransaction.otherHash,
            databaseRevision = State.AutoTrader.PendingAutoTransaction.databaseRevision,
            databaseHash = State.AutoTrader.PendingAutoTransaction.databaseHash,
            mappingRevision = State.AutoTrader.PendingAutoTransaction.mappingRevision,
            correlationId = State.AutoTrader.PendingAutoTransaction.correlationId,
            age = os.clock() - (State.AutoTrader.PendingAutoTransaction.acceptedAt or os.clock()),
        } or nil,
        settlement = {
            startedAt = State.AutoTrader.SettlementStartedAt,
            age = State.AutoTrader.SettlementStartedAt > 0 and (os.clock() - State.AutoTrader.SettlementStartedAt) or 0,
            goneSince = State.AutoTrader.SettlementGoneSince,
            postTradeAuditOwner = State.AutoTrader.PostTradeAuditOwner,
        },
        strategyLearning = {
            global = strategyStats.global,
            bands = strategyStats.bands,
            marginStages = strategyStats.marginStages,
            hopOpportunityRate = State.AutoTrader.GetHopOpportunityRate(),
        },
        anchorAttractiveness = State.AutoTrader.LastAnchorAttractiveness,
        sessionFrozen = State.AutoTrader.SessionFrozen,
        fatalIntegrityStop = State.AutoTrader.FatalIntegrityStop,
        operationalFreezeAt = State.AutoTrader.OperationalFreezeAt,
        operationalFreezeReason = State.AutoTrader.OperationalFreezeReason,
        recoveryTeleportRequired = State.AutoTrader.RecoveryTeleportRequired,
        recoveryTeleportReason = State.AutoTrader.RecoveryTeleportReason,
        target = State.AutoTrader.SelectedTarget and {
            name = State.AutoTrader.SelectedTarget.Name,
            userId = State.AutoTrader.SelectedTarget.UserId,
            score = State.AutoTrader.SelectedTargetScore,
            verifiedValue = State.AutoTrader.SelectedTargetValue,
            profile = State.AutoTrader.SelectedTargetProfile,
            stats = State.AutoTrader.TargetStats.players[tostring(State.AutoTrader.SelectedTarget.UserId)],
        } or nil,
        serverCandidates = serverCandidates,
        serverLifecycle = {
            jobId = game.JobId,
            placeId = game.PlaceId,
            joinedClock = State.AutoTrader.ServerJoinedAt,
            disposition = State.AutoTrader.LastServerDisposition,
            exhaustedSince = State.AutoTrader.ServerExhaustedSince,
            hopInProgress = State.AutoTrader.ServerHopInProgress,
            hopQueueIndex = State.AutoTrader.ServerHopQueueIndex,
            hopQueueCount = #(State.AutoTrader.ServerHopQueue or {}),
            hopCurrentCandidate = State.AutoTrader.ServerHopCurrentCandidate and {
                id = State.AutoTrader.ServerHopCurrentCandidate.id,
                playing = State.AutoTrader.ServerHopCurrentCandidate.playing,
                maxPlayers = State.AutoTrader.ServerHopCurrentCandidate.maxPlayers,
                score = State.AutoTrader.ServerHopCurrentCandidate.botPreview
                    and State.AutoTrader.ServerHopCurrentCandidate.botPreview.score or nil,
                goldBotMatchRatio = State.AutoTrader.ServerHopCurrentCandidate.botPreview
                    and State.AutoTrader.ServerHopCurrentCandidate.botPreview.goldMatchRatio or nil,
                safeConfidence = State.AutoTrader.ServerHopCurrentCandidate.botPreview
                    and State.AutoTrader.ServerHopCurrentCandidate.botPreview.safeConfidence or nil,
            } or nil,
            teleportInProgress = State.AutoTrader.TeleportInProgress,
            teleportAttemptStartedAt = State.AutoTrader.TeleportAttemptStartedAt,
            teleportAttemptOriginJobId = State.AutoTrader.TeleportAttemptOriginJobId,
            teleportQueued = State.AutoTrader.TeleportQueued,
            lastTeleportReason = State.AutoTrader.LastTeleportReason,
            serverHopStartedAt = State.AutoTrader.ServerHopStartedAt,
            serverHopLastProgressAt = State.AutoTrader.ServerHopLastProgressAt,
            staleTradeGuiSince = State.AutoTrader.StaleTradeGuiSince,
            noEligibleWorkSince = State.AutoTrader.NoEligibleWorkSince,
            serverMeaningfulProgressAt = State.AutoTrader.ServerMeaningfulProgressAt,
            serverNoProgressRecoveries = State.AutoTrader.ServerNoProgressRecoveries,
            postTradeAuditStartedAt = State.AutoTrader.PostTradeAuditStartedAt,
            remoteInvokeTimeoutsThisServer = State.AutoTrader.RemoteInvokeTimeoutsThisServer,
            hungRemoteInvokes = State.AutoTrader.HungRemoteInvokes,
            remoteInvokeCircuitOpen = State.AutoTrader.RemoteInvokeCircuitOpen,
            automaticRecoveryCount = State.AutoTrader.AutomaticRecoveryCount,
            lastRecoveryReason = State.AutoTrader.LastRecoveryReason,
            recentJobs = State.AutoTrader.RecentJobs,
            playerStates = State.AutoTrader.ServerPlayers,
            lastAnyMovementAt = State.AutoTrader.LastAnyMovementAt,
            watchdogArmedAt = State.AutoTrader.MovementWatchdogArmedAt,
            auditedTradesThisServer = State.AutoTrader.AuditedTradesThisServer,
            fastBotHopActive = State.AutoTrader.FastBotHopActive,
            fastBotHopReason = State.AutoTrader.FastBotHopReason,
            serverRateLimitBackoffSeconds = State.AutoTrader.ServerRateLimitBackoffSeconds,
            serverRateLimitConsecutiveScans = State.AutoTrader.ServerRateLimitConsecutiveScans,
            requestLifecycle = State.AutoTrader.RequestLifecycle,
            nativeOutgoingVisible = State.AutoTrader.IsAnyNativeOutgoingPending(),
            tradeDeclinePending = State.AutoTrader.TradeDeclinePending,
            tradeDeclineAge = State.AutoTrader.TradeDeclineStartedAt > 0 and (os.clock() - State.AutoTrader.TradeDeclineStartedAt) or 0,
            unresolvedTradePartnerAge = State.AutoTrader.UnresolvedTradePartnerSince > 0 and (os.clock() - State.AutoTrader.UnresolvedTradePartnerSince) or 0,
            activeTradeInventoryWaitAge = State.AutoTrader.ActiveTradeInventoryWaitSince > 0 and (os.clock() - State.AutoTrader.ActiveTradeInventoryWaitSince) or 0,
            friendTradeCheckAge = State.AutoTrader.FriendTradeCheckStartedAt > 0 and (os.clock() - State.AutoTrader.FriendTradeCheckStartedAt) or 0,
        },
        incomingRequest = {
            decision = State.AutoTrader.IncomingRequestDecision,
            resolvingSignature = State.AutoTrader.IncomingRequestResolvingSignature,
            lastSignature = State.AutoTrader.IncomingRequestLastSignature,
            lastHandledAt = State.AutoTrader.IncomingRequestLastHandledAt,
            liveVisible = liveReceiving and State.AutoTrader.IsGuiShown(liveReceiving) or false,
            liveUsername = State.AutoTrader.GetTextValue(liveIncomingUsername),
            liveTitle = State.AutoTrader.GetTextValue(liveIncomingTitle),
        },
        outgoingRequestUi = {
            liveVisible = liveSending and State.AutoTrader.IsGuiShown(liveSending) or false,
            liveUsername = State.AutoTrader.GetTextValue(liveSendingUsername),
        },
        serverSelector = {
            lastScan = State.AutoTrader.LastServerScan,
            lastBotLearning = State.AutoTrader.LastBotLearning,
            currentServerAvatarScreen = State.AutoTrader.CurrentServerAvatarScreen,
            goldPhysicalCertification = State.AutoTrader.BuildGoldCertificationSupport(),
            goldCertificationHistory = State.AutoTrader.GoldCertificationHistory,
            humanDetectionTiming = State.AutoTrader.HumanDetectionTiming,
            humanTimingFile = State.AutoTrader.HumanTimingFile,
            effectiveGoldObserveSeconds = State.AutoTrader.GetGoldAdaptiveObserveSeconds(),
            serverCandidateCache = {
                file = State.AutoTrader.ServerCandidateCacheFile,
                ttlSeconds = CONFIG.AutoTraderServerCandidateCacheTtlSeconds,
                entryCount = #(State.AutoTrader.ServerCandidateCache and State.AutoTrader.ServerCandidateCache.entries or {}),
                lastUse = State.AutoTrader.LastServerCandidateCacheUse,
            },
            botIconDbFile = State.AutoTrader.BotIconDbFile,
            botIconDbCount = State.AutoTrader.GetBotIconDbCount(),
            goldBotIconDbCount = State.AutoTrader.GetGoldBotIconDbCount(),
            topBotIconEvidence = botIconSummary,
        },
        pendingRequest = State.AutoTrader.PendingRequest,
        lastRequestGate = State.AutoTrader.LastRequestGate,
        lastRequestAttempt = State.AutoTrader.LastRequestAttempt,
        partner = partner and {
            name = partner.Name,
            userId = partner.UserId,
            friend = State.AutoTrader.FriendCache[partner.UserId],
            friendMeta = State.AutoTrader.FriendCacheMeta[partner.UserId],
            serverState = State.AutoTrader.ServerPlayers[partner.UserId],
            cooldown = State.AutoTrader.CooldownRemaining(partner),
            profile = State.AutoTrader.GetTargetProfile(partner),
            stats = State.AutoTrader.TargetStats.players[tostring(partner.UserId)],
        } or nil,
        localOfferHash = localEntries and State.AutoTrader.OfferHash(localEntries) or nil,
        otherOfferHash = otherEntries and State.AutoTrader.OfferHash(otherEntries) or nil,
        localOffer = localEntries,
        otherOffer = otherEntries,
        otherSummary = otherSummary,
        effectiveMinimumWin = effectiveMin,
        effectiveMinimumInfo = effectiveInfo,
        plan = State.AutoTrader.Plan,
        safety = State.AutoTrader.Safety,
        marketGate = State.AutoTrader.LastMarketGate,
        planner = State.AutoTrader.LastPlannerReason,
        anchor = State.AutoTrader.Anchor,
        actionInFlight = State.AutoTrader.ActionInFlight,
        autoAcceptSentKey = State.AutoTrader.AutoAcceptSentKey,
        autoAcceptSentAt = State.AutoTrader.AutoAcceptSentAt,
        lastTradeUpdateAt = State.AutoTrader.LastTradeUpdateAt,
        lastTradeActivityAt = State.AutoTrader.LastTradeActivityAt,
        backgroundSuppressed = State.AutoTrader.BackgroundSuppressed,
        postTradeAuditPending = State.AutoTrader.PostTradeAuditPending,
        lastAcceptAudit = State.AutoTrader.LastAcceptAudit,
        lastAuditDetail = State.AutoTrader.LastAuditDetail,
        reserves = reserveList,
        inventory = inventory and {
            stamp = inventory.lastSuccess,
            age = inventory.age,
            partial = inventory.partial,
            resolvedNumericTypes = #inventory.entries,
        } or nil,
        auditInventory = auditSnapshot and {
            stamp = auditSnapshot.lastSuccess,
            age = auditSnapshot.age,
            partial = auditSnapshot.partial,
            keyedItemTypes = auditKeyCount,
        } or nil,
        persistentTargetStats = {
            count = persistentStatsCount,
            file = State.AutoTrader.TargetStatsFile,
            storageVersion = State.AutoTrader.TargetStats.version,
            strategySchemaVersion = State.AutoTrader.TargetStats.strategySchemaVersion,
            strategyConfigSignature = State.AutoTrader.TargetStats.configSignature,
            strategyConfigSnapshot = State.AutoTrader.TargetStats.configSnapshot,
        },
        recentLog = State.AutoTrader.DebugLog,
    }
    local safePayload = HARDEN.supportJsonValue(payload)
    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(safePayload)
    end)
    if not ok then
        return nil, tostring(encoded)
    end
    return HARDEN.supportFormat .. "\n" .. encoded
end
State.AutoTrader.CopyDebug = function()
    local text, err = State.AutoTrader.BuildDebug()
    if not text then
        State.AutoTrader.Status = "SUPPORT ERROR"
        State.AutoTrader.StatusDetail = tostring(err)
        State.AutoTrader.Render()
        return false
    end
    local setter = State.TryGetExecutorGlobal and State.TryGetExecutorGlobal("setclipboard") or rawget(_G, "setclipboard")
    if type(setter) ~= "function" then
        setter = State.TryGetExecutorGlobal and State.TryGetExecutorGlobal("toclipboard") or rawget(_G, "toclipboard")
    end
    if type(setter) ~= "function" then
        State.AutoTrader.Status = "SUPPORT READY"
        State.AutoTrader.StatusDetail = "Clipboard function is unavailable; support snapshot length " .. tostring(#text) .. "."
        State.AutoTrader.Render()
        return false
    end
    local ok, copyErr = pcall(setter, text)
    State.AutoTrader.Status = ok and "SUPPORT COPIED" or "SUPPORT ERROR"
    State.AutoTrader.StatusDetail = ok and ("Copied support snapshot (" .. tostring(#text) .. " chars). Paste it into ChatGPT.") or tostring(copyErr)
    State.AutoTrader.Render()
    return ok
end
do
-- v30 AUTO TRADER UI ------------------------------------------------------
-- Compact Windows 7 / Frutiger Aero control-panel treatment. The navigation
-- is horizontal to reclaim width, surfaces are light and glassy rather than
-- futuristic-dark, and diagnostics are preserved with larger, crisper text.
local AERO = {
    shellTop = Color3.fromRGB(181, 220, 241),
    shellMid = Color3.fromRGB(127, 188, 221),
    shellBottom = Color3.fromRGB(89, 154, 193),
    glassTop = Color3.fromRGB(133, 207, 241),
    glassBottom = Color3.fromRGB(48, 132, 190),
    tabBarTop = Color3.fromRGB(244, 250, 253),
    tabBarBottom = Color3.fromRGB(214, 231, 241),
    cardTop = Color3.fromRGB(255, 255, 255),
    cardBottom = Color3.fromRGB(229, 240, 247),
    cardAltTop = Color3.fromRGB(246, 253, 255),
    cardAltBottom = Color3.fromRGB(219, 237, 247),
    selectedTop = Color3.fromRGB(134, 205, 241),
    selectedBottom = Color3.fromRGB(66, 148, 204),
    selectedBorder = Color3.fromRGB(79, 139, 176),
    greenTop = Color3.fromRGB(170, 222, 116),
    greenBottom = Color3.fromRGB(88, 159, 58),
    buttonTop = Color3.fromRGB(252, 254, 255),
    buttonBottom = Color3.fromRGB(211, 229, 240),
    buttonHoverTop = Color3.fromRGB(255, 255, 255),
    buttonHoverBottom = Color3.fromRGB(194, 222, 239),
    page = Color3.fromRGB(238, 246, 251),
    recessed = Color3.fromRGB(225, 238, 246),
    highlight = Color3.fromRGB(255, 255, 255),
    shadow = Color3.fromRGB(77, 111, 132),
}

local function aeroGradient(parent, topColor, bottomColor, rotation)
    return create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, topColor),
            ColorSequenceKeypoint.new(1, bottomColor),
        }),
        Rotation = rotation or 90,
    }, parent)
end

local function aeroStroke(parent, color, transparency)
    return addStroke(parent, color or THEME.border, 1, transparency or 0.1)
end

local function aeroButton(parent, text, size, accent)
    local button = makeButton(parent, text, size, accent and AERO.greenBottom or AERO.buttonBottom)
    button.TextSize = 12
    button.Font = Enum.Font.ArialBold
    button.AutoButtonColor = false
    aeroStroke(button, accent and Color3.fromRGB(153, 225, 116) or AERO.selectedBorder, 0.28)
    aeroGradient(
        button,
        accent and AERO.greenTop or AERO.buttonTop,
        accent and AERO.greenBottom or AERO.buttonBottom,
        90
    )
    connect(button.MouseEnter, function()
        if button.Parent then
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = accent and Color3.fromRGB(111, 177, 73) or AERO.buttonHoverBottom,
            }):Play()
        end
    end)
    connect(button.MouseLeave, function()
        if button.Parent then
            TweenService:Create(button, TweenInfo.new(0.1), {
                BackgroundColor3 = accent and AERO.greenBottom or AERO.buttonBottom,
            }):Play()
        end
    end)
    return button
end

UI.AutoTraderLauncher = aeroButton(
    UI.RootGui,
    "SV AUTO TRADER",
    UDim2.fromOffset(150, 34),
    false
)
UI.AutoTraderLauncher.Name = "SV_AutoTraderLauncher"
UI.AutoTraderLauncher.AnchorPoint = Vector2.new(1, 1)
UI.AutoTraderLauncher.Position = UDim2.new(1, -18, 1, -18)
UI.AutoTraderLauncher.ZIndex = 1500
UI.AutoTraderLauncher.TextColor3 = THEME.text
UI.AutoTraderLauncher.TextSize = 11
UI.AutoTraderLauncherScale = create("UIScale", {Scale = 1}, UI.AutoTraderLauncher)

UI.AutoTraderPanel = create("Frame", {
    Name = "SV_AutoTraderPanel",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -24, 0.5, 0),
    Size = UDim2.fromOffset(650, 600),
    BackgroundColor3 = AERO.shellBottom,
    BorderSizePixel = 0,
    Visible = false,
    ClipsDescendants = true,
    ZIndex = 1450,
}, UI.RootGui)
if type(State.AutoTrader.Preferences.panelPosition) == "table" then
    local p = State.AutoTrader.Preferences.panelPosition
    UI.AutoTraderPanel.Position = UDim2.new(
        tonumber(p.xs) or 1,
        tonumber(p.xo) or -24,
        tonumber(p.ys) or 0.5,
        tonumber(p.yo) or 0
    )
end
addCorner(UI.AutoTraderPanel, 5)
aeroStroke(UI.AutoTraderPanel, AERO.selectedBorder, 0.08)
aeroGradient(UI.AutoTraderPanel, AERO.shellTop, AERO.shellBottom, 90)
UI.AutoTraderScale = create("UIScale", {Scale = 1}, UI.AutoTraderPanel)
clampAutoTraderPanelPosition = function(save)
    if not UI.AutoTraderPanel or not UI.AutoTraderPanel.Parent then return end
    local camera = workspace.CurrentCamera
    local viewport = camera and camera.ViewportSize or Vector2.new(1366, 768)
    local absolutePosition = UI.AutoTraderPanel.AbsolutePosition
    local absoluteSize = UI.AutoTraderPanel.AbsoluteSize
    if absoluteSize.X <= 0 or absoluteSize.Y <= 0 then return end
    local margin = 8
    local dx,dy = 0,0
    if absolutePosition.X < margin then dx = margin - absolutePosition.X
    elseif absolutePosition.X + absoluteSize.X > viewport.X - margin then dx = (viewport.X - margin) - (absolutePosition.X + absoluteSize.X) end
    if absolutePosition.Y < margin then dy = margin - absolutePosition.Y
    elseif absolutePosition.Y + absoluteSize.Y > viewport.Y - margin then dy = (viewport.Y - margin) - (absolutePosition.Y + absoluteSize.Y) end
    if math.abs(dx) > 0.5 or math.abs(dy) > 0.5 then
        local pos = UI.AutoTraderPanel.Position
        UI.AutoTraderPanel.Position = UDim2.new(pos.X.Scale, pos.X.Offset + dx, pos.Y.Scale, pos.Y.Offset + dy)
    end
    if save then
        local pos = UI.AutoTraderPanel.Position
        State.AutoTrader.Preferences.panelPosition = {xs=pos.X.Scale,xo=pos.X.Offset,ys=pos.Y.Scale,yo=pos.Y.Offset}
        State.AutoTrader.SavePreferences()
    end
end
task.defer(function() clampAutoTraderPanelPosition(false) end)

-- A restrained glossy highlight instead of giant rounded "glass bubbles".
UI.AutoTraderGloss = create("Frame", {
    Position = UDim2.fromOffset(1, 1),
    Size = UDim2.new(1, -2, 0, 26),
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BackgroundTransparency = 0.91,
    BorderSizePixel = 0,
    ZIndex = 1451,
}, UI.AutoTraderPanel)

UI.AutoTraderHeader = create("Frame", {
    Position = UDim2.fromOffset(0, 0),
    Size = UDim2.new(1, 0, 0, 56),
    BackgroundColor3 = AERO.glassBottom,
    BorderSizePixel = 0,
    Active = true,
    ZIndex = 1452,
}, UI.AutoTraderPanel)
aeroGradient(UI.AutoTraderHeader, AERO.glassTop, AERO.glassBottom, 90)
create("Frame", {
    Position = UDim2.new(0, 0, 1, -1),
    Size = UDim2.new(1, 0, 0, 1),
    BackgroundColor3 = AERO.selectedBorder,
    BackgroundTransparency = 0.36,
    BorderSizePixel = 0,
    ZIndex = 1453,
}, UI.AutoTraderHeader)

UI.AutoTraderTitle = makeLabel(UI.AutoTraderHeader, "SUPREME AUTO TRADER", 17, Color3.fromRGB(255, 255, 255), Enum.Font.ArialBold)
UI.AutoTraderTitle.Position = UDim2.fromOffset(14, 5)
UI.AutoTraderTitle.Size = UDim2.new(1, -250, 0, 22)
UI.AutoTraderTitle.ZIndex = 1454
UI.AutoTraderSubtitle = makeLabel(
    UI.AutoTraderHeader,
    "OVERNIGHT CONTROL · LIVE AUDITS · AUTO RECOVERY",
    11,
    Color3.fromRGB(235, 249, 255),
    Enum.Font.Arial
)
UI.AutoTraderSubtitle.Position = UDim2.fromOffset(14, 29)
UI.AutoTraderSubtitle.Size = UDim2.new(1, -260, 0, 16)
UI.AutoTraderSubtitle.ZIndex = 1454
UI.AutoTraderHeaderMetric = makeLabel(UI.AutoTraderHeader, "+0 · 0/hr", 12, Color3.fromRGB(231, 255, 205), Enum.Font.ArialBold)
UI.AutoTraderHeaderMetric.Position = UDim2.new(1, -210, 0, 8)
UI.AutoTraderHeaderMetric.Size = UDim2.fromOffset(164, 22)
UI.AutoTraderHeaderMetric.TextXAlignment = Enum.TextXAlignment.Right
UI.AutoTraderHeaderMetric.ZIndex = 1454
UI.AutoTraderClose = aeroButton(UI.AutoTraderHeader, "×", UDim2.fromOffset(30, 26), false)
UI.AutoTraderClose.Position = UDim2.new(1, -36, 0, 7)
UI.AutoTraderClose.TextColor3 = Color3.fromRGB(111, 38, 44)
UI.AutoTraderClose.TextSize = 16
UI.AutoTraderClose.ZIndex = 1455

-- Compact Windows-style tab strip. This recovers the sidebar width while keeping
-- navigation obvious and familiar at a much smaller overall window size.
UI.AutoTraderTabs = create("Frame", {
    Position = UDim2.fromOffset(8, 62),
    Size = UDim2.new(1, -16, 0, 38),
    BackgroundColor3 = AERO.tabBarBottom,
    BorderSizePixel = 0,
    ZIndex = 1452,
}, UI.AutoTraderPanel)
addCorner(UI.AutoTraderTabs, 3)
aeroStroke(UI.AutoTraderTabs, THEME.border, 0.18)
aeroGradient(UI.AutoTraderTabs, AERO.tabBarTop, AERO.tabBarBottom, 90)

local tabNames = {"HOME", "TRADE", "PEOPLE", "SERVERS", "SETTINGS"}
UI.AutoTraderTabButtons = {}
UI.AutoTraderPages = {}
for index, tabName in ipairs(tabNames) do
    local button = makeButton(UI.AutoTraderTabs, tabName, UDim2.new(0.2, -5, 1, -8), AERO.buttonBottom)
    button.Position = UDim2.new((index - 1) * 0.2, 4, 0, 4)
    button.TextXAlignment = Enum.TextXAlignment.Center
    button.TextSize = 12
    button.Font = Enum.Font.ArialBold
    button.TextColor3 = THEME.muted
    button.ZIndex = 1454
    addCorner(button, 3)
    addStroke(button, THEME.border, 1, 0.30)
    UI.AutoTraderTabButtons[tabName] = button
end

UI.AutoTraderPageHost = create("Frame", {
    Position = UDim2.fromOffset(8, 108),
    Size = UDim2.new(1, -16, 1, -116),
    BackgroundColor3 = AERO.page,
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 1452,
}, UI.AutoTraderPanel)
addCorner(UI.AutoTraderPageHost, 3)
aeroStroke(UI.AutoTraderPageHost, THEME.border, 0.16)
for _, tabName in ipairs(tabNames) do
    local page = create("Frame", {
        Name = "Page_" .. tabName,
        Position = UDim2.fromOffset(8, 8),
        Size = UDim2.new(1, -16, 1, -16),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Visible = false,
        ClipsDescendants = true,
        ZIndex = 1453,
    }, UI.AutoTraderPageHost)
    UI.AutoTraderPages[tabName] = page
end

local function uiCard(parent, position, size, alternate)
    local card = create("Frame", {
        Position = position,
        Size = size,
        BackgroundColor3 = alternate and AERO.cardAltBottom or AERO.cardBottom,
        BorderSizePixel = 0,
        ZIndex = 1454,
    }, parent)
    addCorner(card, 3)
    aeroStroke(card, THEME.border, 0.34)
    aeroGradient(
        card,
        alternate and AERO.cardAltTop or AERO.cardTop,
        alternate and AERO.cardAltBottom or AERO.cardBottom,
        90
    )
    local shine = create("Frame", {
        Position = UDim2.fromOffset(1, 1),
        Size = UDim2.new(1, -2, 0, 18),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 0.955,
        BorderSizePixel = 0,
        ZIndex = 1455,
    }, card)
    return card
end

local function uiSectionTitle(parent, text, y)
    local label = makeLabel(parent, text, 11, Color3.fromRGB(37, 83, 111), Enum.Font.ArialBold)
    label.Position = UDim2.fromOffset(10, y or 7)
    label.Size = UDim2.new(1, -20, 0, 15)
    label.ZIndex = 1456
    return label
end

local function uiValueLabel(parent, text, y, size, color, font)
    local label = makeLabel(parent, text, size or 11, color or THEME.muted, font or Enum.Font.Arial)
    label.Position = UDim2.fromOffset(10, y)
    label.Size = UDim2.new(1, -20, 0, 17)
    label.ZIndex = 1456
    return label
end

local function clearDynamic(container)
    if not container then return end
    for _, child in ipairs(container:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then child:Destroy() end
    end
end

-- HOME -------------------------------------------------------------------
local home = UI.AutoTraderPages.HOME
UI.AutoTraderHomeScroll = create("ScrollingFrame", {
    Size = UDim2.fromScale(1, 1),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    CanvasSize = UDim2.fromOffset(0, 1090),
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(74, 139, 178),
    ZIndex = 1454,
}, home)
UI.AutoTraderHomeContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 1082),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1454,
}, UI.AutoTraderHomeScroll)

UI.AutoTraderStageCard = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, 72), true)
uiSectionTitle(UI.AutoTraderStageCard, "WHERE AM I?", 6)
UI.AutoTraderPipeline = uiValueLabel(UI.AutoTraderStageCard, "SERVER  ›  DISCOVER  ›  TARGET  ›  REQUEST  ›  TRADE  ›  AUDIT", 25, 9, THEME.muted, Enum.Font.ArialBold)
UI.AutoTraderPipeline.TextXAlignment = Enum.TextXAlignment.Center
UI.AutoTraderStage = uiValueLabel(UI.AutoTraderStageCard, "NOW: IDLE", 46, 11, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderStage.TextXAlignment = Enum.TextXAlignment.Center

UI.AutoTraderStatusBox = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 80), UDim2.new(1, 0, 0, 112))
uiSectionTitle(UI.AutoTraderStatusBox, "CURRENT ACTION", 6)
UI.AutoTraderStatus = uiValueLabel(UI.AutoTraderStatusBox, "IDLE", 25, 13, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderTarget = uiValueLabel(UI.AutoTraderStatusBox, "Target: —", 48, 10, THEME.muted, Enum.Font.Arial)
UI.AutoTraderTotals = uiValueLabel(UI.AutoTraderStatusBox, "Them: —   Plan: —   Win: —", 67, 10, THEME.muted, Enum.Font.Arial)
UI.AutoTraderSafety = makeLabel(UI.AutoTraderStatusBox, "Waiting.", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderSafety.Position = UDim2.fromOffset(10, 87)
UI.AutoTraderSafety.Size = UDim2.new(1, -20, 0, 20)
UI.AutoTraderSafety.TextWrapped = true
UI.AutoTraderSafety.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderSafety.ZIndex = 1456

UI.AutoTraderServerCard = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 200), UDim2.new(0.5, -4, 0, 128))
uiSectionTitle(UI.AutoTraderServerCard, "THIS SERVER", 6)
UI.AutoTraderServerRisk = uiValueLabel(UI.AutoTraderServerCard, "Bot learning: waiting", 26, 11, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderServerPopulation = uiValueLabel(UI.AutoTraderServerCard, "Players: —", 49)
UI.AutoTraderServerDisposition = uiValueLabel(UI.AutoTraderServerCard, "Work state: —", 69)
UI.AutoTraderServerDecision = makeLabel(UI.AutoTraderServerCard, "Evaluating whether there is useful trade work here.", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderServerDecision.Position = UDim2.fromOffset(10, 89)
UI.AutoTraderServerDecision.Size = UDim2.new(1, -20, 0, 34)
UI.AutoTraderServerDecision.TextWrapped = true
UI.AutoTraderServerDecision.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderServerDecision.ZIndex = 1456

UI.AutoTraderOpportunityCard = uiCard(UI.AutoTraderHomeContent, UDim2.new(0.5, 4, 0, 200), UDim2.new(0.5, -4, 0, 128), true)
uiSectionTitle(UI.AutoTraderOpportunityCard, "IS IT WORTH STAYING?", 6)
UI.AutoTraderOpportunityBest = uiValueLabel(UI.AutoTraderOpportunityCard, "Best target: —", 26, 11, THEME.green, Enum.Font.ArialBold)
UI.AutoTraderOpportunityRates = uiValueLabel(UI.AutoTraderOpportunityCard, "Target EV: —   Hop EV: —", 49)
UI.AutoTraderOpportunityFloor = uiValueLabel(UI.AutoTraderOpportunityCard, "Stay floor: —", 69)
UI.AutoTraderOpportunityDecision = makeLabel(UI.AutoTraderOpportunityCard, "Waiting for verified opportunities.", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderOpportunityDecision.Position = UDim2.fromOffset(10, 89)
UI.AutoTraderOpportunityDecision.Size = UDim2.new(1, -20, 0, 34)
UI.AutoTraderOpportunityDecision.TextWrapped = true
UI.AutoTraderOpportunityDecision.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderOpportunityDecision.ZIndex = 1456

UI.AutoTraderSafetyCard = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 336), UDim2.new(0.5, -4, 0, 212))
uiSectionTitle(UI.AutoTraderSafetyCard, "HEALTH CHECKS", 6)
UI.AutoTraderSafetyRows = {}
for i = 1, 9 do
    UI.AutoTraderSafetyRows[i] = uiValueLabel(UI.AutoTraderSafetyCard, "—", 26 + (i - 1) * 20, 10, THEME.muted, Enum.Font.Arial)
end

UI.AutoTraderEventCard = uiCard(UI.AutoTraderHomeContent, UDim2.new(0.5, 4, 0, 336), UDim2.new(0.5, -4, 0, 228), true)
uiSectionTitle(UI.AutoTraderEventCard, "RECENT ACTIVITY", 6)
UI.AutoTraderEventRows = {}
for i = 1, 8 do
    local row = makeLabel(UI.AutoTraderEventCard, "", 10, THEME.muted, Enum.Font.Arial)
    row.Position = UDim2.fromOffset(10, 26 + (i - 1) * 24)
    row.Size = UDim2.new(1, -20, 0, 22)
    row.TextWrapped = true
    row.TextYAlignment = Enum.TextYAlignment.Top
    row.ZIndex = 1456
    UI.AutoTraderEventRows[i] = row
end

-- Full statistics are still present, now directly below live status.
UI.AutoTraderStatsSession = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 576), UDim2.new(0.5, -4, 0, 214))
uiSectionTitle(UI.AutoTraderStatsSession, "THIS SESSION", 6)
UI.AutoTraderSessionRows = {}
for i = 1, 9 do
    UI.AutoTraderSessionRows[i] = uiValueLabel(UI.AutoTraderStatsSession, "—", 25 + (i - 1) * 20, 10, THEME.muted, Enum.Font.Arial)
end

UI.AutoTraderStatsLearned = uiCard(UI.AutoTraderHomeContent, UDim2.new(0.5, 4, 0, 576), UDim2.new(0.5, -4, 0, 214), true)
uiSectionTitle(UI.AutoTraderStatsLearned, "LEARNED STRATEGY", 6)
UI.AutoTraderLearnedRows = {}
for i = 1, 9 do
    UI.AutoTraderLearnedRows[i] = uiValueLabel(UI.AutoTraderStatsLearned, "—", 25 + (i - 1) * 20, 10, THEME.muted, Enum.Font.Arial)
end

UI.AutoTraderStatsMargins = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 798), UDim2.new(1, 0, 0, 164))
uiSectionTitle(UI.AutoTraderStatsMargins, "NEGOTIATION LEARNING", 6)
UI.AutoTraderMarginRows = {}
for i = 1, 4 do
    UI.AutoTraderMarginRows[i] = uiValueLabel(UI.AutoTraderStatsMargins, "—", 28 + (i - 1) * 29, 10, THEME.muted, Enum.Font.Arial)
end

UI.AutoTraderStatsNote = uiCard(UI.AutoTraderHomeContent, UDim2.fromOffset(0, 970), UDim2.new(1, 0, 0, 104), true)
uiSectionTitle(UI.AutoTraderStatsNote, "WHAT THESE NUMBERS MEAN", 6)
UI.AutoTraderStatsNoteText = makeLabel(
    UI.AutoTraderStatsNote,
    "Session profit/hour is wall-clock since startup. Learned rates are persisted, decayed observations across strangers; they influence opportunity ranking but never bypass exact trade safety checks.",
    9,
    THEME.faint,
    Enum.Font.Arial
)
UI.AutoTraderStatsNoteText.Position = UDim2.fromOffset(10, 29)
UI.AutoTraderStatsNoteText.Size = UDim2.new(1, -20, 0, 62)
UI.AutoTraderStatsNoteText.TextWrapped = true
UI.AutoTraderStatsNoteText.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderStatsNoteText.ZIndex = 1456

-- TRADE ------------------------------------------------------------------
local tradePage = UI.AutoTraderPages.TRADE
UI.AutoTraderTradeStatusCard = uiCard(tradePage, UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, 108), true)
uiSectionTitle(UI.AutoTraderTradeStatusCard, "LIVE TRADE", 6)
UI.AutoTraderTradePartner = uiValueLabel(UI.AutoTraderTradeStatusCard, "Partner: —", 27, 12, THEME.text, Enum.Font.ArialBold)
UI.AutoTraderTradeTotals = uiValueLabel(UI.AutoTraderTradeStatusCard, "Them: —   Us: —   Profit: —", 50, 11, THEME.green, Enum.Font.ArialBold)
UI.AutoTraderTradeState = makeLabel(UI.AutoTraderTradeStatusCard, "No active managed trade.", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderTradeState.Position = UDim2.fromOffset(10, 73)
UI.AutoTraderTradeState.Size = UDim2.new(1, -20, 0, 30)
UI.AutoTraderTradeState.TextWrapped = true
UI.AutoTraderTradeState.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderTradeState.ZIndex = 1456

UI.AutoTraderNegotiationCard = uiCard(tradePage, UDim2.fromOffset(0, 116), UDim2.new(1, 0, 0, 110))
uiSectionTitle(UI.AutoTraderNegotiationCard, "NEGOTIATION CLOCK", 6)
UI.AutoTraderNegotiationStage = uiValueLabel(UI.AutoTraderNegotiationCard, "Stage: —", 26, 11, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderNegotiationMargins = uiValueLabel(UI.AutoTraderNegotiationCard, "18%  ›  11%  ›  6%  ›  HARD FLOOR", 49, 10, THEME.muted, Enum.Font.ArialBold)
UI.AutoTraderNegotiationTimer = uiValueLabel(UI.AutoTraderNegotiationCard, "Waiting for their offer.", 70, 9, THEME.faint, Enum.Font.Arial)
UI.AutoTraderNegotiationSafety = uiValueLabel(UI.AutoTraderNegotiationCard, "Hard minimum: —", 89, 9, THEME.faint, Enum.Font.Arial)

UI.AutoTraderPlanCard = uiCard(tradePage, UDim2.fromOffset(0, 234), UDim2.new(0.55, -4, 1, -234))
uiSectionTitle(UI.AutoTraderPlanCard, "WHAT WE WILL OFFER", 6)
UI.AutoTraderPlanRows = {}
for index = 1, CONFIG.MaxOfferSlots do
    local row = makeLabel(UI.AutoTraderPlanCard, "—", 10, THEME.muted, Enum.Font.Arial)
    row.Position = UDim2.fromOffset(10, 28 + (index - 1) * 27)
    row.Size = UDim2.new(1, -20, 0, 24)
    row.ZIndex = 1456
    UI.AutoTraderPlanRows[index] = row
end
UI.AutoTraderAudit = makeLabel(UI.AutoTraderPlanCard, "Last audit: —", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderAudit.Position = UDim2.fromOffset(10, 145)
UI.AutoTraderAudit.Size = UDim2.new(1, -20, 1, -155)
UI.AutoTraderAudit.TextWrapped = true
UI.AutoTraderAudit.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderAudit.ZIndex = 1456

UI.AutoTraderTradeInfoCard = uiCard(tradePage, UDim2.new(0.55, 4, 0, 234), UDim2.new(0.45, -4, 1, -234), true)
uiSectionTitle(UI.AutoTraderTradeInfoCard, "WHY THE BOT CHOSE THIS", 6)
UI.AutoTraderTradeWhy = makeLabel(
    UI.AutoTraderTradeInfoCard,
    "The planner will explain margin, market safety, request state, and acceptance readiness here.",
    9,
    THEME.muted,
    Enum.Font.Arial
)
UI.AutoTraderTradeWhy.Position = UDim2.fromOffset(10, 28)
UI.AutoTraderTradeWhy.Size = UDim2.new(1, -20, 1, -38)
UI.AutoTraderTradeWhy.TextWrapped = true
UI.AutoTraderTradeWhy.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderTradeWhy.ZIndex = 1456

-- PEOPLE -----------------------------------------------------------------
local playersPage = UI.AutoTraderPages.PEOPLE
UI.AutoTraderPlayerHeader = makeLabel(playersPage, "WHO SHOULD WE TRADE WITH NEXT?", 13, THEME.text, Enum.Font.ArialBold)
UI.AutoTraderPlayerHeader.Position = UDim2.fromOffset(4, 0)
UI.AutoTraderPlayerHeader.Size = UDim2.new(1, -8, 0, 22)
UI.AutoTraderPlayerHeader.ZIndex = 1454
UI.AutoTraderPlayerHint = makeLabel(
    playersPage,
    "Ranked by trading economics only. Bot-avatar labels are shown for diagnosis but never change current-server target EV.",
    9,
    THEME.faint,
    Enum.Font.Arial
)
UI.AutoTraderPlayerHint.Position = UDim2.fromOffset(4, 24)
UI.AutoTraderPlayerHint.Size = UDim2.new(1, -8, 0, 20)
UI.AutoTraderPlayerHint.TextWrapped = true
UI.AutoTraderPlayerHint.ZIndex = 1454
UI.AutoTraderPlayerDetail = uiCard(playersPage, UDim2.fromOffset(0, 50), UDim2.new(1, 0, 0, 82), true)
uiSectionTitle(UI.AutoTraderPlayerDetail, "NEXT / SELECTED PLAYER", 6)
UI.AutoTraderPlayerDetailText = makeLabel(UI.AutoTraderPlayerDetail, "No ranked target yet.", 10, THEME.muted, Enum.Font.Arial)
UI.AutoTraderPlayerDetailText.Position = UDim2.fromOffset(10, 25)
UI.AutoTraderPlayerDetailText.Size = UDim2.new(1, -20, 0, 50)
UI.AutoTraderPlayerDetailText.TextWrapped = true
UI.AutoTraderPlayerDetailText.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderPlayerDetailText.ZIndex = 1456
UI.AutoTraderPlayerScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(0, 140),
    Size = UDim2.new(1, 0, 1, -140),
    BackgroundColor3 = AERO.recessed,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(74, 139, 178),
    ZIndex = 1454,
}, playersPage)
addCorner(UI.AutoTraderPlayerScroll, 4)
aeroStroke(UI.AutoTraderPlayerScroll, THEME.border, 0.3)
UI.AutoTraderPlayerContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1455,
}, UI.AutoTraderPlayerScroll)
create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, UI.AutoTraderPlayerContent)
create("UIPadding", {
    PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5),
    PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)
}, UI.AutoTraderPlayerContent)

-- SERVERS ----------------------------------------------------------------
local serversPage = UI.AutoTraderPages.SERVERS
UI.AutoTraderServerScanCard = uiCard(serversPage, UDim2.fromOffset(0, 0), UDim2.new(1, 0, 0, 126), true)
uiSectionTitle(UI.AutoTraderServerScanCard, "WHERE WE WILL GO NEXT", 6)
UI.AutoTraderServerScanStatus = uiValueLabel(UI.AutoTraderServerScanCard, "No public-server scan yet.", 26, 11, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderServerScanThreshold = uiValueLabel(UI.AutoTraderServerScanCard, "Filter: strict learned bot-avatar matches only", 49)
UI.AutoTraderServerScanBest = uiValueLabel(UI.AutoTraderServerScanCard, "Best scanned: —", 69)
UI.AutoTraderServerScanReason = makeLabel(UI.AutoTraderServerScanCard, "", 10, THEME.faint, Enum.Font.Arial)
UI.AutoTraderServerScanReason.Position = UDim2.fromOffset(10, 89)
UI.AutoTraderServerScanReason.Size = UDim2.new(1, -20, 0, 32)
UI.AutoTraderServerScanReason.TextWrapped = true
UI.AutoTraderServerScanReason.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderServerScanReason.ZIndex = 1456

UI.AutoTraderForceServer = aeroButton(serversPage, "FIND A NEW SERVER", UDim2.new(0.5, -4, 0, 36), true)
UI.AutoTraderForceServer.Position = UDim2.fromOffset(0, 134)
UI.AutoTraderForceServer.ZIndex = 1454
UI.AutoTraderRefreshServerScan = aeroButton(serversPage, "REFRESH SERVER LIST", UDim2.new(0.5, -4, 0, 36), false)
UI.AutoTraderRefreshServerScan.Position = UDim2.new(0.5, 4, 0, 134)
UI.AutoTraderRefreshServerScan.TextColor3 = THEME.blue
UI.AutoTraderRefreshServerScan.ZIndex = 1454

local serverListTitle = makeLabel(serversPage, "RECENT ELIGIBLE SERVERS", 10, Color3.fromRGB(37, 83, 111), Enum.Font.ArialBold)
serverListTitle.Position = UDim2.fromOffset(4, 178)
serverListTitle.Size = UDim2.new(0.48, -8, 0, 18)
serverListTitle.ZIndex = 1454
UI.AutoTraderServerCandidateScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(0, 200),
    Size = UDim2.new(0.48, -4, 1, -200),
    BackgroundColor3 = AERO.recessed,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(74, 139, 178),
    ZIndex = 1454,
}, serversPage)
addCorner(UI.AutoTraderServerCandidateScroll, 4)
aeroStroke(UI.AutoTraderServerCandidateScroll, THEME.border, 0.3)
UI.AutoTraderServerCandidateContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1455,
}, UI.AutoTraderServerCandidateScroll)
create("UIListLayout", {Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder}, UI.AutoTraderServerCandidateContent)
create("UIPadding", {
    PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5),
    PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)
}, UI.AutoTraderServerCandidateContent)

UI.AutoTraderBotHeaderCard = uiCard(serversPage, UDim2.new(0.49, 4, 0, 178), UDim2.new(0.51, -4, 0, 116), true)
uiSectionTitle(UI.AutoTraderBotHeaderCard, "BOT INTELLIGENCE", 6)
UI.AutoTraderBotSummary = uiValueLabel(UI.AutoTraderBotHeaderCard, "Waiting for physical evidence.", 26, 10, THEME.blue, Enum.Font.ArialBold)
UI.AutoTraderBotDetail = makeLabel(
    UI.AutoTraderBotHeaderCard,
    "Learns only from strict persistent MoveDirection + RootPart movement/facing evidence. Inventory, trade behavior, and animations never teach bot hashes.",
    8,
    THEME.faint,
    Enum.Font.Arial
)
UI.AutoTraderBotDetail.Position = UDim2.fromOffset(10, 48)
UI.AutoTraderBotDetail.Size = UDim2.new(1, -102, 0, 58)
UI.AutoTraderBotDetail.TextWrapped = true
UI.AutoTraderBotDetail.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderBotDetail.ZIndex = 1456
UI.AutoTraderRefreshBots = aeroButton(UI.AutoTraderBotHeaderCard, "REFRESH", UDim2.fromOffset(82, 29), false)
UI.AutoTraderRefreshBots.Position = UDim2.new(1, -92, 0, 50)
UI.AutoTraderRefreshBots.TextColor3 = THEME.green
UI.AutoTraderRefreshBots.ZIndex = 1457

UI.AutoTraderBotScroll = create("ScrollingFrame", {
    Position = UDim2.new(0.49, 4, 0, 302),
    Size = UDim2.new(0.51, -4, 1, -302),
    BackgroundColor3 = AERO.recessed,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(74, 139, 178),
    ZIndex = 1454,
}, serversPage)
addCorner(UI.AutoTraderBotScroll, 4)
aeroStroke(UI.AutoTraderBotScroll, THEME.border, 0.3)
UI.AutoTraderBotContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1455,
}, UI.AutoTraderBotScroll)
create("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}, UI.AutoTraderBotContent)
create("UIPadding", {
    PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5),
    PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)
}, UI.AutoTraderBotContent)

-- SETTINGS ---------------------------------------------------------------
local settingsPage = UI.AutoTraderPages.SETTINGS
local settingsHint = makeLabel(
    settingsPage,
    "These are the controls that change behavior. Diagnostic/support export remains one click away.",
    9,
    THEME.faint,
    Enum.Font.Arial
)
settingsHint.Position = UDim2.fromOffset(4, 0)
settingsHint.Size = UDim2.new(1, -176, 0, 20)
settingsHint.ZIndex = 1454
UI.AutoTraderResetPosition = aeroButton(settingsPage, "RESET WINDOW", UDim2.fromOffset(164, 22), false)
UI.AutoTraderResetPosition.Position = UDim2.new(1, -164, 0, 0)
UI.AutoTraderResetPosition.TextSize = 11
UI.AutoTraderResetPosition.ZIndex = 1454
connect(UI.AutoTraderResetPosition.MouseButton1Click, function()
    if Destroyed then return end
    UI.AutoTraderPanel.Position = UDim2.new(1, -24, 0.5, 0)
    State.AutoTrader.Preferences.panelPosition = nil
    State.AutoTrader.SavePreferences()
    task.defer(function() clampAutoTraderPanelPosition(true) end)
end)

UI.AutoTraderEnabled = aeroButton(settingsPage, "", UDim2.new(1, 0, 0, 42), true)
UI.AutoTraderEnabled.Position = UDim2.fromOffset(0, 28)
UI.AutoTraderEnabled.TextSize = 12
UI.AutoTraderEnabled.ZIndex = 1454
UI.AutoTraderIgnoreFriends = aeroButton(settingsPage, "", UDim2.new(0.5, -4, 0, 34), false)
UI.AutoTraderIgnoreFriends.Position = UDim2.fromOffset(0, 78)
UI.AutoTraderIgnoreFriends.ZIndex = 1454
UI.AutoTraderOpeningAnchor = aeroButton(settingsPage, "", UDim2.new(0.5, -4, 0, 34), false)
UI.AutoTraderOpeningAnchor.Position = UDim2.new(0.5, 4, 0, 78)
UI.AutoTraderOpeningAnchor.ZIndex = 1454
UI.AutoTraderUnknownTheir = aeroButton(settingsPage, "", UDim2.new(0.5, -4, 0, 34), false)
UI.AutoTraderUnknownTheir.Position = UDim2.fromOffset(0, 120)
UI.AutoTraderUnknownTheir.ZIndex = 1454
UI.AutoTraderPreferDuplicates = aeroButton(settingsPage, "", UDim2.new(0.5, -4, 0, 34), false)
UI.AutoTraderPreferDuplicates.Position = UDim2.new(0.5, 4, 0, 120)
UI.AutoTraderPreferDuplicates.ZIndex = 1454
UI.AutoTraderProfit = aeroButton(settingsPage, "", UDim2.new(1, 0, 0, 36), false)
UI.AutoTraderProfit.Position = UDim2.fromOffset(0, 162)
UI.AutoTraderProfit.ZIndex = 1454
UI.AutoTraderSkipTarget = aeroButton(settingsPage, "SKIP CURRENT TARGET", UDim2.new(0.5, -4, 0, 36), false)
UI.AutoTraderSkipTarget.Position = UDim2.fromOffset(0, 206)
UI.AutoTraderSkipTarget.TextColor3 = THEME.yellow
UI.AutoTraderSkipTarget.ZIndex = 1454
UI.AutoTraderCopyDebug = aeroButton(settingsPage, "COPY FULL SUPPORT SNAPSHOT", UDim2.new(0.5, -4, 0, 36), false)
UI.AutoTraderCopyDebug.Position = UDim2.new(0.5, 4, 0, 206)
UI.AutoTraderCopyDebug.TextColor3 = THEME.blue
UI.AutoTraderCopyDebug.ZIndex = 1454

UI.AutoTraderReserveTitle = makeLabel(settingsPage, "INVENTORY RESERVES", 10, Color3.fromRGB(37, 83, 111), Enum.Font.ArialBold)
UI.AutoTraderReserveTitle.Position = UDim2.fromOffset(4, 254)
UI.AutoTraderReserveTitle.Size = UDim2.new(1, -120, 0, 18)
UI.AutoTraderReserveTitle.ZIndex = 1454
UI.AutoTraderReserveCount = makeLabel(settingsPage, "0 reserves", 10, THEME.muted, Enum.Font.Arial)
UI.AutoTraderReserveCount.Position = UDim2.new(1, -116, 0, 254)
UI.AutoTraderReserveCount.Size = UDim2.fromOffset(112, 18)
UI.AutoTraderReserveCount.TextXAlignment = Enum.TextXAlignment.Right
UI.AutoTraderReserveCount.ZIndex = 1454

UI.AutoTraderSearch = create("TextBox", {
    Position = UDim2.fromOffset(0, 278),
    Size = UDim2.new(1, 0, 0, 32),
    BackgroundColor3 = Color3.fromRGB(251, 253, 254),
    BorderSizePixel = 0,
    PlaceholderText = "Search your inventory and choose how many copies to keep...",
    PlaceholderColor3 = THEME.faint,
    Text = "",
    TextColor3 = THEME.text,
    TextSize = 12,
    Font = Enum.Font.Arial,
    ClearTextOnFocus = false,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 1454,
}, settingsPage)
addCorner(UI.AutoTraderSearch, 4)
aeroStroke(UI.AutoTraderSearch, THEME.border, 0.3)

UI.AutoTraderReserveScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(0, 318),
    Size = UDim2.new(1, 0, 1, -318),
    BackgroundColor3 = AERO.recessed,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 5,
    ScrollBarImageColor3 = Color3.fromRGB(74, 139, 178),
    ZIndex = 1454,
}, settingsPage)
addCorner(UI.AutoTraderReserveScroll, 4)
aeroStroke(UI.AutoTraderReserveScroll, THEME.border, 0.3)
UI.AutoTraderReserveContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1455,
}, UI.AutoTraderReserveScroll)
UI.AutoTraderReserveLayout = create("UIListLayout", {Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder}, UI.AutoTraderReserveContent)
UI.AutoTraderReservePadding = create("UIPadding", {
    PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5),
    PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)
}, UI.AutoTraderReserveContent)

local function setActiveAutoTraderTab(tabName)
    tabName = UI.AutoTraderPages[tabName] and tabName or "HOME"
    State.AutoTrader.ActiveTab = tabName
    for name, page in pairs(UI.AutoTraderPages) do
        page.Visible = name == tabName
    end
    for name, button in pairs(UI.AutoTraderTabButtons) do
        local active = name == tabName
        button.BackgroundColor3 = active and AERO.selectedBottom or AERO.buttonBottom
        button.TextColor3 = active and Color3.fromRGB(255, 255, 255) or THEME.muted
        local gradient = button:FindFirstChildOfClass("UIGradient")
        if active then
            if not gradient then
                gradient = aeroGradient(button, AERO.selectedTop, AERO.selectedBottom, 90)
            else
                gradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, AERO.selectedTop),
                    ColorSequenceKeypoint.new(1, AERO.selectedBottom),
                })
            end
        elseif gradient then
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, AERO.buttonTop),
                ColorSequenceKeypoint.new(1, AERO.buttonBottom),
            })
        end
    end
    if State.AutoTrader.Render then State.AutoTrader.Render() end
end
for name, button in pairs(UI.AutoTraderTabButtons) do
    local tabName = name
    connect(button.MouseButton1Click, function()
        setActiveAutoTraderTab(tabName)
    end)
end
setActiveAutoTraderTab(State.AutoTrader.ActiveTab or "HOME")

State.AutoTrader.UpdateControls = function()
    local prefs = State.AutoTrader.Preferences
    UI.AutoTraderEnabled.Text = prefs.automation and "AUTOMATION IS RUNNING" or "AUTOMATION IS STOPPED"
    UI.AutoTraderEnabled.TextColor3 = prefs.automation and THEME.green or THEME.yellow
    UI.AutoTraderEnabled.BackgroundColor3 = prefs.automation and Color3.fromRGB(98, 166, 67) or AERO.buttonBottom
    local automationGradient = UI.AutoTraderEnabled:FindFirstChildOfClass("UIGradient")
    if automationGradient then
        automationGradient.Color = prefs.automation and ColorSequence.new({
            ColorSequenceKeypoint.new(0, AERO.greenTop),
            ColorSequenceKeypoint.new(1, AERO.greenBottom),
        }) or ColorSequence.new({
            ColorSequenceKeypoint.new(0, AERO.buttonTop),
            ColorSequenceKeypoint.new(1, AERO.buttonBottom),
        })
    end
    UI.AutoTraderIgnoreFriends.Text = prefs.ignoreFriends and "Ignore Friends: ON" or "Ignore Friends: OFF"
    UI.AutoTraderIgnoreFriends.TextColor3 = prefs.ignoreFriends and THEME.green or THEME.muted
    UI.AutoTraderOpeningAnchor.Text = prefs.openingAnchor and "Opening Anchor: ON" or "Opening Anchor: OFF"
    UI.AutoTraderOpeningAnchor.TextColor3 = prefs.openingAnchor and THEME.green or THEME.muted
    UI.AutoTraderUnknownTheir.Text = prefs.unknownTheirZero and "Unknown Theirs = 0: ON" or "Unknown Theirs = 0: OFF"
    UI.AutoTraderUnknownTheir.TextColor3 = prefs.unknownTheirZero and THEME.green or THEME.muted
    UI.AutoTraderPreferDuplicates.Text = prefs.preferDuplicates and "Prefer Duplicates: ON" or "Prefer Duplicates: OFF"
    UI.AutoTraderPreferDuplicates.TextColor3 = prefs.preferDuplicates and THEME.green or THEME.muted
    local minWin = State.AutoTrader.GetMinimumWin()
    local summary = State.AutoTrader.OtherSummary
    if summary and (tonumber(summary.knownFloor) or 0) > 0 then
        local effective = State.AutoTrader.GetEffectiveMinimumWin(summary)
        UI.AutoTraderProfit.Text = "Base Win: +" .. formatNumber(minWin) .. " · Current Floor: +" .. formatNumber(effective)
    else
        UI.AutoTraderProfit.Text = "Base Win: +" .. formatNumber(minWin) .. " · Dynamic ≥ " .. formatPercent(CONFIG.AutoTraderMinWinPercent * 100, false)
    end
    UI.AutoTraderReserveCount.Text = tostring(State.AutoTrader.ReserveTypeCount()) .. " reserves"
end

State.AutoTrader.RebuildReserveList = function()
    if not UI.AutoTraderReserveContent or not UI.AutoTraderReserveContent.Parent then return end
    clearDynamic(UI.AutoTraderReserveContent)
    local inventory, reason = State.AutoTrader.GetLocalInventory(false)
    if not inventory then
        local label = makeLabel(UI.AutoTraderReserveContent, tostring(reason or "Waiting for inventory..."), 10, THEME.faint, Enum.Font.Arial)
        label.Size = UDim2.new(1, 0, 0, 30); label.TextWrapped = true; label.ZIndex = 1453
        return
    end
    local search = normalize(State.AutoTrader.ProtectedSearch or "")
    local shown = 0
    for _, entry in ipairs(inventory.entries) do
        local searchable = normalize(entry.name .. " " .. entry.itemId .. " " .. entry.itemType)
        if search == "" or searchable:find(search, 1, true) then
            shown += 1
            local reserve = State.AutoTrader.GetReserve(entry.itemType, entry.itemId)
            local row = create("Frame", {Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = reserve > 0 and Color3.fromRGB(255, 239, 232) or THEME.panel2, BorderSizePixel = 0, ZIndex = 1453}, UI.AutoTraderReserveContent)
            addCorner(row, 4)
            local label = makeLabel(row, entry.name .. " x" .. tostring(entry.quantity) .. " · " .. formatCompact(entry.unitValue), 10, reserve > 0 and THEME.text or THEME.muted, Enum.Font.Arial)
            label.Position = UDim2.fromOffset(8, 0); label.Size = UDim2.new(1, -122, 1, 0); label.TextTruncate = Enum.TextTruncate.AtEnd; label.ZIndex = 1454
            local minus = makeButton(row, "−", UDim2.fromOffset(25, 23), THEME.panel3); minus.Position = UDim2.new(1, -112, 0.5, -11); minus.TextColor3 = THEME.yellow; minus.ZIndex = 1454
            local count = makeLabel(row, "Keep " .. tostring(reserve), 10, reserve > 0 and THEME.red or THEME.faint, Enum.Font.ArialBold); count.Position = UDim2.new(1, -83, 0, 0); count.Size = UDim2.fromOffset(52, 32); count.TextXAlignment = Enum.TextXAlignment.Center; count.ZIndex = 1454
            local plus = makeButton(row, "+", UDim2.fromOffset(25, 23), THEME.panel3); plus.Position = UDim2.new(1, -27, 0.5, -11); plus.TextColor3 = THEME.green; plus.ZIndex = 1454
            local rowEntry, rowReserve = entry, reserve
            minus.MouseButton1Click:Connect(function() if not Destroyed then State.AutoTrader.SetReserve(rowEntry.itemType, rowEntry.itemId, rowReserve - 1, rowEntry.quantity) end end)
            plus.MouseButton1Click:Connect(function() if not Destroyed then State.AutoTrader.SetReserve(rowEntry.itemType, rowEntry.itemId, rowReserve + 1, rowEntry.quantity) end end)
        end
    end
    if shown == 0 then
        local label = makeLabel(UI.AutoTraderReserveContent, "No matching resolved numeric inventory items.", 10, THEME.faint, Enum.Font.Arial)
        label.Size = UDim2.new(1, 0, 0, 28); label.ZIndex = 1453
    end
end

local function getAutoTraderStage()
    if State.AutoTrader.PostTradeAuditPending then return "AUDIT" end
    if State.CurrentTrade then
        if State.AutoTrader.OtherSummary and (State.AutoTrader.OtherSummary.slotCount or 0) > 0 then return "NEGOTIATE" end
        return "TRADE"
    end
    if State.AutoTrader.PendingRequest then return "REQUEST" end
    if State.AutoTrader.ServerHopInProgress or State.AutoTrader.TeleportInProgress or tostring(State.AutoTrader.Status):find("SERVER HOP", 1, true) then return "SERVER SCAN" end
    local status = tostring(State.AutoTrader.Status or "")
    if status:find("DISCOVERY", 1, true) then return "DISCOVERY" end
    if State.AutoTrader.SelectedTarget then return "TARGET" end
    return State.AutoTrader.Preferences.automation and "DISCOVERY" or "IDLE"
end
local function statusColor(status)
    status = tostring(status or "")
    if status:find("FROZEN", 1, true) or status:find("ERROR", 1, true) then return THEME.red end
    if status:find("COMPLETE", 1, true) or status:find("READY", 1, true) or status:find("VERIFIED", 1, true) then return THEME.green end
    if status:find("WAIT", 1, true) or status:find("PENDING", 1, true) or status:find("COOLDOWN", 1, true) then return THEME.yellow end
    return THEME.blue
end
local function pct01(value) return string.format("%.0f%%", clamp(tonumber(value) or 0, 0, 1) * 100) end
local function rateText(value) return value and string.format("%.3f/s", tonumber(value) or 0) or "—" end
local function goldAvatarLabel(info)
    local class = info and info.class or "unknown"
    if class == "confirmed_bot" then return "GOLD 3+", THEME.red end
    if class == "known_bot" then return "GOLD 2", THEME.yellow end
    if class == "observed_bot" then return "GOLD 1", THEME.yellow end
    return "BOT ?", THEME.faint
end

State.AutoTrader.RebuildPlayerDashboard = function()
    if not UI.AutoTraderPlayerContent then return end
    clearDynamic(UI.AutoTraderPlayerContent)
    local rows = {}
    local context = State.AutoTrader.BuildEligibilityContext()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            local eligibility = State.AutoTrader.EvaluatePlayerEligibility(player, context)
            local total = eligibility.verifiedTotal
            if total == nil then
                local verifiedTotal, verified = State.AutoTrader.GetVerifiedPlayerValue(player)
                if verified then total = verifiedTotal end
            end
            local score = eligibility.score
            if score == nil and total and total > 0 then score = State.AutoTrader.GetTargetScore(player, total) end
            local risk, botInfo = State.AutoTrader.GetPlayerBotRisk(player)
            table.insert(rows, {
                player = player, eligibility = eligibility, total = total, score = score,
                risk = risk or 0, botInfo = botInfo,
            })
        end
    end
    local priority = {
        actionable = 1, active_request = 2, active_trade = 2,
        retry_later = 3, economic_hop_preferred = 4, friend_pending = 5,
        discovery_pending = 5, no_economic_path = 6, terminal = 7,
        friend = 8, unresolvable = 9, zero = 10, ineligible = 11,
    }
    table.sort(rows, function(a, b)
        local ap = priority[a.eligibility.state] or 50
        local bp = priority[b.eligibility.state] or 50
        if ap ~= bp then return ap < bp end
        local as, bs = tonumber(a.score) or -math.huge, tonumber(b.score) or -math.huge
        if as ~= bs then return as > bs end
        return (tonumber(a.total) or 0) > (tonumber(b.total) or 0)
    end)
    local stateLabels = {
        actionable = "READY", active_request = "REQUEST", active_trade = "TRADING",
        retry_later = "RETRY", economic_hop_preferred = "HOP BETTER",
        friend_pending = "FRIEND ?", discovery_pending = "DISCOVERY",
        no_economic_path = "NO PATH", terminal = "DONE", friend = "FRIEND",
        unresolvable = "UNRESOLVED", zero = "ZERO", ineligible = "INELIGIBLE",
    }
    for index, info in ipairs(rows) do
        local p = info.player
        local eligibility = info.eligibility
        local row = makeButton(UI.AutoTraderPlayerContent, "", UDim2.new(1, 0, 0, 48), THEME.panel2)
        row.LayoutOrder = index; row.ZIndex = 1454
        aeroStroke(row, THEME.border, 0.5)
        aeroGradient(row, AERO.cardAltTop, AERO.cardAltBottom, 90)
        local nameColor = eligibility.state == "actionable" and THEME.green
            or (p == State.AutoTrader.SelectedTarget and THEME.green or THEME.text)
        local name = makeLabel(row, tostring(index) .. ". " .. p.Name, 10, nameColor, Enum.Font.ArialBold)
        name.Position = UDim2.fromOffset(8, 3); name.Size = UDim2.new(0.34, -8, 0, 18); name.TextTruncate = Enum.TextTruncate.AtEnd; name.ZIndex = 1455
        local value = makeLabel(row, "Value " .. (info.total ~= nil and formatCompact(info.total) or "?"), 10, THEME.muted, Enum.Font.Arial)
        value.Position = UDim2.new(0.34, 2, 0, 3); value.Size = UDim2.new(0.18, -4, 0, 18); value.ZIndex = 1455
        local ev = makeLabel(row, "EV " .. rateText(info.score), 10, info.score and THEME.green or THEME.faint, Enum.Font.Arial)
        ev.Position = UDim2.new(0.52, 2, 0, 3); ev.Size = UDim2.new(0.18, -4, 0, 18); ev.ZIndex = 1455
        local avatarText, avatarColor = goldAvatarLabel(info.botInfo)
        local risk = makeLabel(row, avatarText, 10, avatarColor, Enum.Font.ArialBold)
        risk.Position = UDim2.new(0.70, 2, 0, 3); risk.Size = UDim2.new(0.14, -4, 0, 18); risk.ZIndex = 1455
        local stateText = stateLabels[eligibility.state] or string.upper(tostring(eligibility.state or "unknown"))
        local stateColor = eligibility.state == "actionable" and THEME.green
            or (eligibility.state == "economic_hop_preferred" and THEME.yellow or THEME.faint)
        local state = makeLabel(row, stateText, 10, stateColor, Enum.Font.ArialBold)
        state.Position = UDim2.new(0.84, 2, 0, 3); state.Size = UDim2.new(0.16, -8, 0, 18); state.TextXAlignment = Enum.TextXAlignment.Right; state.TextTruncate = Enum.TextTruncate.AtEnd; state.ZIndex = 1455
        local subText = tostring(eligibility.reason or "")
        if eligibility.state == "retry_later" then
            subText = "retry in " .. formatNumber(eligibility.retryIn or 0) .. "s · " .. subText
        elseif subText == "" then
            local profile = State.AutoTrader.GetTargetProfile(p)
            subText = profile and ("demand " .. tostring(profile.demand or "?") .. " · useful types " .. tostring(profile.usefulTypes or 0) .. " · coverage " .. string.format("%.1f%%", (tonumber(profile.numericCoverage) or 0) * 100)) or "inventory profile unresolved"
        end
        local sub = makeLabel(row, subText, 10, THEME.faint, Enum.Font.Arial)
        sub.Position = UDim2.fromOffset(8, 25); sub.Size = UDim2.new(1, -16, 0, 18); sub.TextTruncate = Enum.TextTruncate.AtEnd; sub.ZIndex = 1455
        row.MouseButton1Click:Connect(function()
            local stats = State.AutoTrader.GetPlayerStats(p)
            local botClass = info.botInfo and info.botInfo.class or "unknown"
            UI.AutoTraderPlayerDetailText.Text = p.Name .. " · " .. stateText .. " · value " .. (info.total ~= nil and formatCompact(info.total) or "?") .. " · EV " .. rateText(info.score) .. " · avatar DB " .. botClass .. " (informational only)\nReason: " .. tostring(eligibility.reason or "ready") .. "\nHistory: " .. tostring(math.floor(tonumber(stats.requests) or 0)) .. " requests, " .. tostring(math.floor(tonumber(stats.responses) or 0)) .. " responses, " .. tostring(math.floor(tonumber(stats.successes) or 0)) .. " audited wins."
        end)
    end
    if #rows == 0 then
        local label = makeLabel(UI.AutoTraderPlayerContent, "No other players are currently available.", 10, THEME.faint, Enum.Font.Arial)
        label.Size = UDim2.new(1, 0, 0, 34); label.ZIndex = 1454
    end
    local target = State.AutoTrader.SelectedTarget
    if target then
        local eligibility = State.AutoTrader.EvaluatePlayerEligibility(target, context)
        local _, botInfo = State.AutoTrader.GetPlayerBotRisk(target)
        UI.AutoTraderPlayerDetailText.Text = target.Name .. " is currently next · value " .. (eligibility.verifiedTotal and formatCompact(eligibility.verifiedTotal) or "?") .. " · expected " .. rateText(eligibility.score) .. " · avatar DB " .. tostring(botInfo and botInfo.class or "unknown") .. " (does not affect target ranking)."
    elseif State.AutoTrader.LastEligibilitySnapshot then
        local c = State.AutoTrader.LastEligibilitySnapshot.counts or {}
        UI.AutoTraderPlayerDetailText.Text = "No player is actionable now · ready " .. tostring(c.actionable or 0)
            .. " · economic-hop " .. tostring(c.economicHopPreferred or 0)
            .. " · retry " .. tostring(c.retryLater or 0)
            .. " · discovery/friend pending " .. tostring((c.discoveryPending or 0) + (c.friendPending or 0)) .. "."
    end
end

State.AutoTrader.RebuildServerDashboard = function()
    if not UI.AutoTraderServerCandidateContent then return end
    clearDynamic(UI.AutoTraderServerCandidateContent)
    local scan = State.AutoTrader.LastServerScan
    if not scan or type(scan.candidates) ~= "table" then
        local label = makeLabel(UI.AutoTraderServerCandidateContent, "No public-server scan captured yet. The list will populate when the bot needs to hop.", 10, THEME.faint, Enum.Font.Arial)
        label.Size = UDim2.new(1, 0, 0, 44); label.TextWrapped = true; label.ZIndex = 1454
        return
    end
    for index, candidate in ipairs(scan.candidates) do
        if index > 24 then break end
        local safe = candidate.safeEnough == true
        local row = create("Frame", {Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = safe and Color3.fromRGB(223, 244, 218) or THEME.panel2, BorderSizePixel = 0, ZIndex = 1454}, UI.AutoTraderServerCandidateContent)
        addCorner(row, 4)
        aeroStroke(row, safe and Color3.fromRGB(102, 161, 82) or THEME.border, 0.55)
        aeroGradient(
            row,
            safe and Color3.fromRGB(236, 249, 232) or AERO.cardAltTop,
            safe and Color3.fromRGB(213, 239, 207) or AERO.cardAltBottom,
            90
        )
        local id = tostring(candidate.id or "?")
        local short = #id > 12 and (string.sub(id, 1, 8) .. "…") or id
        local title = makeLabel(row, tostring(index) .. ". " .. short .. " · " .. tostring(candidate.playing or "?") .. "/" .. tostring(candidate.maxPlayers or "?"), 10, safe and THEME.green or THEME.text, Enum.Font.ArialBold)
        title.Position = UDim2.fromOffset(8, 3); title.Size = UDim2.new(0.42, -8, 0, 17); title.ZIndex = 1455
        local trusted = candidate.previewTrusted == true
        local confidenceText = trusted
            and ("Gold matches " .. pct01(candidate.goldBotMatchRatio) .. " · unmatched " .. pct01(candidate.safeConfidence))
            or "Avatar preview UNKNOWN · allowed"
        local confidence = makeLabel(row, confidenceText, 10, trusted and (safe and THEME.green or THEME.red) or THEME.yellow, Enum.Font.ArialBold)
        confidence.Position = UDim2.new(0.42, 2, 0, 3); confidence.Size = UDim2.new(0.36, -4, 0, 17); confidence.ZIndex = 1455
        local resultText = not safe and "REJECT" or trusted and "ACCEPT" or "UNKNOWN"
        local resultColor = not safe and THEME.red or trusted and THEME.green or THEME.yellow
        local result = makeLabel(row, resultText, 10, resultColor, Enum.Font.ArialBold)
        result.Position = UDim2.new(0.78, 2, 0, 3); result.Size = UDim2.new(0.22, -10, 0, 17); result.TextXAlignment = Enum.TextXAlignment.Right; result.ZIndex = 1455
        local sub = makeLabel(row, "samples " .. tostring(candidate.previewSample or 0) .. " · strict learned avatars " .. tostring(candidate.goldBotMatches or 0) .. " · only strict persistent MoveDirection + fixed-facing hashes participate", 10, THEME.faint, Enum.Font.Arial)
        sub.Position = UDim2.fromOffset(8, 22); sub.Size = UDim2.new(1, -16, 0, 15); sub.TextTruncate = Enum.TextTruncate.AtEnd; sub.ZIndex = 1455
    end
end

State.AutoTrader.RebuildBotDashboard = function()
    if not UI.AutoTraderBotContent then return end
    clearDynamic(UI.AutoTraderBotContent)
    local cert = State.AutoTrader.GoldBotCertification or {}
    local certTitle = makeLabel(UI.AutoTraderBotContent, "STRICT BOT CERTIFICATION", 10, THEME.faint, Enum.Font.ArialBold)
    certTitle.Size = UDim2.new(1, 0, 0, 20); certTitle.ZIndex = 1454
    local certBox = create("Frame", {Size = UDim2.new(1, 0, 0, 62), BackgroundColor3 = THEME.panel2, BorderSizePixel = 0, ZIndex = 1454}, UI.AutoTraderBotContent); addCorner(certBox, 4)
    aeroStroke(certBox, THEME.border, 0.5)
    aeroGradient(certBox, AERO.cardAltTop, AERO.cardAltBottom, 90)
    local age = cert.windowStartedAt and cert.windowStartedAt > 0 and (os.clock() - cert.windowStartedAt) or 0
    local certColor = (cert.status == "certified_learned" or cert.status == "candidate") and THEME.green or cert.status == "regular" and THEME.blue or THEME.yellow
    local headline = makeLabel(certBox, string.upper(tostring(cert.status or "waiting"))
        .. ((cert.status == "observing" or cert.status == "candidate")
            and (" · " .. tostring(cert.passedRemoteCount or 0) .. "/" .. tostring(cert.currentRemoteCount or 0) .. " players passed") or "")
        .. (cert.status == "observing" and (" · age " .. string.format("%.1fs", age)) or ""),
        10, certColor, Enum.Font.ArialBold)
    headline.Position = UDim2.fromOffset(8, 6); headline.Size = UDim2.new(1, -16, 0, 18); headline.ZIndex = 1455
    local moveSummary = " · max MoveDirection " .. string.format("%.3f", tonumber(cert.maxObservedMoveDirection) or 0)
        .. "/" .. string.format("%.3f", CONFIG.AutoTraderGoldMoveDirectionEpsilon)
    local reason = makeLabel(certBox, tostring(cert.reason or "Waiting for observation.") .. moveSummary, 10, THEME.muted, Enum.Font.Arial)
    reason.Position = UDim2.fromOffset(8, 25); reason.Size = UDim2.new(1, -16, 0, 32); reason.TextWrapped = true; reason.TextYAlignment = Enum.TextYAlignment.Top; reason.ZIndex = 1455

    local section = makeLabel(UI.AutoTraderBotContent, "CURRENT SERVER AVATARS · INFORMATIONAL ONLY", 10, THEME.faint, Enum.Font.ArialBold)
    section.Size = UDim2.new(1, 0, 0, 20); section.ZIndex = 1454
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do if player ~= LocalPlayer and player.Parent then table.insert(players, player) end end
    table.sort(players, function(a, b)
        local _, ai = State.AutoTrader.GetPlayerBotRisk(a); local _, bi = State.AutoTrader.GetPlayerBotRisk(b)
        local ag, bg = tonumber(ai and ai.goldJobs) or 0, tonumber(bi and bi.goldJobs) or 0
        if ag ~= bg then return ag > bg end
        return a.UserId < b.UserId
    end)
    for _, player in ipairs(players) do
        local _, info = State.AutoTrader.GetPlayerBotRisk(player)
        local row = create("Frame", {Size = UDim2.new(1, 0, 0, 60), BackgroundColor3 = THEME.panel2, BorderSizePixel = 0, ZIndex = 1454}, UI.AutoTraderBotContent); addCorner(row, 4)
        aeroStroke(row, THEME.border, 0.55)
        aeroGradient(row, AERO.cardAltTop, AERO.cardAltBottom, 90)
        local img = create("ImageLabel", {Position = UDim2.fromOffset(5, 5), Size = UDim2.fromOffset(50, 50), BackgroundColor3 = THEME.panel3, BorderSizePixel = 0, Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(player.UserId) .. "&w=150&h=150", ZIndex = 1455}, row); addCorner(img, 4)
        local class = info and info.class or "unknown"
        local goldJobs = tonumber(info and info.goldJobs) or 0
        local classColor = class == "confirmed_bot" and THEME.red or (class == "known_bot" or class == "observed_bot") and THEME.yellow or THEME.faint
        local name = makeLabel(row, player.Name, 10, THEME.text, Enum.Font.ArialBold); name.Position = UDim2.fromOffset(64, 6); name.Size = UDim2.new(1, -72, 0, 18); name.TextTruncate = Enum.TextTruncate.AtEnd; name.ZIndex = 1455
        local detail = makeLabel(row, class == "unknown" and "UNKNOWN · no strict learned avatar match" or (string.upper(class) .. " · strict gold servers " .. tostring(goldJobs)), 10, classColor, Enum.Font.ArialBold); detail.Position = UDim2.fromOffset(64, 25); detail.Size = UDim2.new(1, -72, 0, 16); detail.ZIndex = 1455
        local hash = makeLabel(row, info and tostring(info.fingerprint or "") or "Press REFRESH to resolve this player's avatar hash", 10, THEME.faint, Enum.Font.Code); hash.Position = UDim2.fromOffset(64, 42); hash.Size = UDim2.new(1, -72, 0, 13); hash.TextTruncate = Enum.TextTruncate.AtEnd; hash.ZIndex = 1455
    end

    local learnedTitle = makeLabel(UI.AutoTraderBotContent, "STRICT GOLD LEARNED HASHES", 10, THEME.faint, Enum.Font.ArialBold)
    learnedTitle.Size = UDim2.new(1, 0, 0, 24); learnedTitle.ZIndex = 1454
    local learned = {}
    for fingerprint, record in pairs(State.AutoTrader.BotIconDb.icons or {}) do
        local goldJobs = State.AutoTrader.BotIconJobCount(record.strictGoldBotJobs)
        if goldJobs > 0 then
            local class, confidence = State.AutoTrader.GetBotIconClass(fingerprint)
            table.insert(learned, {fingerprint = fingerprint, record = record, class = class, confidence = confidence, goldJobs = goldJobs})
        end
    end
    table.sort(learned, function(a, b)
        if a.goldJobs ~= b.goldJobs then return a.goldJobs > b.goldJobs end
        return (tonumber(a.record.strictGoldBotSightings) or 0) > (tonumber(b.record.strictGoldBotSightings) or 0)
    end)
    if #learned == 0 then
        local empty = makeLabel(UI.AutoTraderBotContent, "No strict learned hashes yet. Legacy evidence is preserved locally, but server filtering uses only strict departure-committed persistent MoveDirection hashes.", 10, THEME.faint, Enum.Font.Arial)
        empty.Size = UDim2.new(1, 0, 0, 36); empty.TextWrapped = true; empty.ZIndex = 1454
    end
    for index, info in ipairs(learned) do
        if index > 30 then break end
        local r = info.record
        local row = create("Frame", {Size = UDim2.new(1, 0, 0, 60), BackgroundColor3 = THEME.panel2, BorderSizePixel = 0, ZIndex = 1454}, UI.AutoTraderBotContent); addCorner(row, 4)
        aeroStroke(row, THEME.border, 0.55)
        aeroGradient(row, AERO.cardAltTop, AERO.cardAltBottom, 90)
        if tonumber(r.sampleUserId) then
            local img = create("ImageLabel", {Position = UDim2.fromOffset(5, 5), Size = UDim2.fromOffset(50, 50), BackgroundColor3 = THEME.panel3, BorderSizePixel = 0, Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(math.floor(r.sampleUserId)) .. "&w=150&h=150", ZIndex = 1455}, row); addCorner(img, 4)
        end
        local classColor = info.class == "confirmed_bot" and THEME.red or THEME.yellow
        local title = makeLabel(row, (r.sampleName and (r.sampleName .. " · ") or "") .. string.upper(info.class), 10, classColor, Enum.Font.ArialBold); title.Position = UDim2.fromOffset(64, 6); title.Size = UDim2.new(1, -72, 0, 17); title.TextTruncate = Enum.TextTruncate.AtEnd; title.ZIndex = 1455
        local evidence = makeLabel(row, "strict gold servers " .. tostring(info.goldJobs) .. " · strict sightings " .. tostring(math.floor(tonumber(r.strictGoldBotSightings) or 0)), 10, THEME.muted, Enum.Font.Arial); evidence.Position = UDim2.fromOffset(64, 24); evidence.Size = UDim2.new(1, -72, 0, 16); evidence.ZIndex = 1455
        local hash = makeLabel(row, info.fingerprint, 10, THEME.faint, Enum.Font.Code); hash.Position = UDim2.fromOffset(64, 42); hash.Size = UDim2.new(1, -72, 0, 13); hash.TextTruncate = Enum.TextTruncate.AtEnd; hash.ZIndex = 1455
    end
end

local function humanEvent(entry)
    if type(entry) ~= "table" then return "" end
    local kind, data = tostring(entry.kind or "event"), type(entry.data) == "table" and entry.data or {}
    local name = data.name or data.partner or data.partnerName
    if kind == "request_send" then return "Request sent" .. (name and (" → " .. tostring(name)) or "") end
    if kind == "request_native_confirmed" then return "Request UI confirmed" end
    if kind == "trade_started" then return "Trade started" .. (name and (" · " .. tostring(name)) or "") end
    if kind == "trade_declined" then return "Trade declined" .. (name and (" · " .. tostring(name)) or "") end
    if kind == "post_trade_audit_passed" then return "Audit passed · trade profit verified" end
    if kind == "server_hop_queue_built" then return "Gold-hash server scan finished" end
    if kind == "server_hop_candidate_attempt" then return "Teleporting to gold-hash-screened server" end
    if kind == "current_server_avatar_screen" then return "Avatar bot screen refreshed" end
    if kind == "target_economic_skip" then return "Low-EV target skipped" .. (name and (" · " .. tostring(name)) or "") end
    if kind == "gold_bot_server_certified" then return "Gold bot server certified · hashes saved" end
    if kind == "gold_bot_certification_regular" then return "Bot learning vetoed · remote MoveDirection/facing looked human" .. (name and (" · " .. tostring(name)) or "") end
    if kind == "gold_bot_certification_inconclusive" then return "Bot certification inconclusive · waiting for useful zero-MoveDirection movement" end
    if kind == "mutation_verified" then return "Offer mutation verified" end
    if kind == "auto_accept_sent" then return "Final verified accept sent" end
    return kind:gsub("_", " ")
end

State.AutoTrader.Render = function()
    local now = os.clock()
    local minimumInterval = 1 / 30
    local since = now - (State.AutoTrader.LastRenderedAt or 0)
    if since < minimumInterval then
        if not State.AutoTrader.RenderQueued then
            State.AutoTrader.RenderQueued = true
            task.delay(math.max(0.001, minimumInterval - since), function()
                if Destroyed then return end
                State.AutoTrader.RenderQueued = false
                State.AutoTrader.Render()
            end)
        end
        return
    end
    State.AutoTrader.RenderQueued = false
    State.AutoTrader.LastRenderedAt = now
    State.AutoTrader.RenderCount = (State.AutoTrader.RenderCount or 0) + 1
    State.AutoTrader.UpdateControls()
    local status = State.AutoTrader.Status or "IDLE"
    local color = statusColor(status)
    local stage = getAutoTraderStage()
    local session = State.AutoTrader.UiSession or {}
    local elapsed = math.max(1, os.clock() - (tonumber(session.startedAt) or os.clock()))
    local profit = tonumber(session.profit) or 0
    local profitHour = profit / elapsed * 3600
    UI.AutoTraderLauncher.Text = "AUTO TRADER · +" .. formatCompact(profit)
    UI.AutoTraderLauncher.TextColor3 = State.AutoTrader.Preferences.automation and THEME.green or THEME.blue
    UI.AutoTraderHeaderMetric.Text = "+" .. formatCompact(profit) .. " · " .. formatCompact(profitHour) .. "/hr"
    UI.AutoTraderHeaderMetric.TextColor3 = profit > 0 and THEME.green or THEME.blue
    UI.AutoTraderStatus.Text = status; UI.AutoTraderStatus.TextColor3 = color
    UI.AutoTraderStage.Text = "NOW: " .. stage; UI.AutoTraderStage.TextColor3 = color

    local target = State.AutoTrader.LastTradePartner or State.AutoTrader.SelectedTarget
    UI.AutoTraderTarget.Text = target and ((State.AutoTrader.LastTradePartner and "Partner: " or "Next eligible: ") .. target.Name) or "Target: —"
    local plan, summary = State.AutoTrader.Plan, State.AutoTrader.OtherSummary
    if plan then
        UI.AutoTraderTotals.Text = "Them: " .. formatCompact(plan.receiveTotal) .. (plan.unknownCount and plan.unknownCount > 0 and "+" or "") .. "   Plan: " .. formatCompact(plan.total) .. "   Win: +" .. formatCompact(plan.win)
    elseif State.AutoTrader.Anchor and summary and summary.slotCount == 0 then
        UI.AutoTraderTotals.Text = "Anchor: " .. State.AutoTrader.Anchor.name .. " · " .. formatCompact(State.AutoTrader.Anchor.unitValue)
    elseif summary then
        UI.AutoTraderTotals.Text = "Them known: " .. formatCompact(summary.knownFloor) .. (summary.unknownCount > 0 and (" + " .. tostring(summary.unknownCount) .. " unknown") or "")
    else UI.AutoTraderTotals.Text = "Them: —   Plan: —   Win: —" end
    UI.AutoTraderSafety.Text = tostring(State.AutoTrader.StatusDetail or "")

    local disposition, counts = State.AutoTrader.GetServerDisposition()
    local screen = State.AutoTrader.CurrentServerAvatarScreen
    local cert = State.AutoTrader.GoldBotCertification or {}
    UI.AutoTraderServerRisk.Text = "Bot learning: " .. string.upper(tostring(cert.status or "waiting"))
    UI.AutoTraderServerRisk.TextColor3 = cert.status == "certified_learned" and THEME.green or cert.status == "regular" and THEME.blue or THEME.yellow
    UI.AutoTraderServerPopulation.Text = "Players " .. tostring(counts.total or 0)
        .. " · ready " .. tostring(counts.actionable or 0)
        .. " · hop-better " .. tostring(counts.economicHopPreferred or 0)
        .. " · retry " .. tostring(counts.retryLater or 0)
        .. " · unknown " .. tostring(counts.unknown or 0)
    UI.AutoTraderServerDisposition.Text = "Disposition: " .. tostring(disposition)
    if State.AutoTrader.FastBotHopActive then
        UI.AutoTraderServerDecision.Text = "LEAVE · " .. tostring(State.AutoTrader.FastBotHopReason or "manual/liveness")
    elseif State.AutoTrader.SelectedTarget then
        UI.AutoTraderServerDecision.Text = "STAY · actionable opportunity " .. State.AutoTrader.SelectedTarget.Name
    elseif string.sub(tostring(disposition), 1, 9) == "EXHAUSTED" then
        UI.AutoTraderServerDecision.Text = "LEAVE · no player is actionable under the shared eligibility model"
    elseif tostring(disposition):find("WAITING", 1, true) then
        UI.AutoTraderServerDecision.Text = "WAIT BRIEFLY · bounded discovery/friend/retry state"
    else
        UI.AutoTraderServerDecision.Text = "SCAN · ordinary trading logic only"
    end

    local opp = State.AutoTrader.LastOpportunityDecision or {}
    UI.AutoTraderOpportunityBest.Text = opp.bestName and ("Best: " .. tostring(opp.bestName))
        or (opp.bestEconomicName and ("Best below floor: " .. tostring(opp.bestEconomicName)) or "Best target: —")
    local shownTargetRate = opp.bestScore or opp.bestEconomicScore
    UI.AutoTraderOpportunityRates.Text = "Target EV " .. rateText(shownTargetRate) .. "   Hop EV " .. rateText(opp.hopOpportunityRate)
    UI.AutoTraderOpportunityFloor.Text = "Stay floor: " .. rateText(opp.retentionFloor)
    if opp.bestScore and opp.retentionFloor then
        UI.AutoTraderOpportunityDecision.Text = "STAY: at least one target is actionable above the current stay-vs-hop floor."
    elseif opp.bestEconomicScore and opp.retentionFloor then
        UI.AutoTraderOpportunityDecision.Text = "HOP: remaining positive targets are below the current stay-vs-hop floor; the controller will leave instead of idling."
    else UI.AutoTraderOpportunityDecision.Text = "Waiting for enough verified inventory to compare stay-vs-hop value." end

    local dataFresh, _, dataAge = State.AutoTrader.DecisionDataFresh()
    local safety = {
        {"Request watchdog", not State.AutoTrader.PendingRequest or (os.clock() - (State.AutoTrader.PendingRequest.sentAt or os.clock()) < CONFIG.AutoTraderRequestInvokeTimeoutSeconds + CONFIG.AutoTraderPendingRequestTimeoutSeconds)},
        {"Trade lifetime", not State.CurrentTrade or State.AutoTrader.TradeBeganAt <= 0 or os.clock() - State.AutoTrader.TradeBeganAt < CONFIG.AutoTraderAbsoluteTradeTimeoutSeconds},
        {"Post-trade audit", not State.AutoTrader.PostTradeAuditPending or State.AutoTrader.PostTradeAuditStartedAt <= 0 or os.clock() - State.AutoTrader.PostTradeAuditStartedAt < CONFIG.AutoTraderPostTradeAuditSupervisorSeconds},
        {"Values " .. (dataAge and (HARDEN.formatDuration(dataAge) .. " old · " .. tostring(HARDEN.lastDatabaseSource)) or "unavailable"), dataFresh},
        {"Mappings " .. (HARDEN.lastMappingVerifiedAt > 0 and (HARDEN.formatDuration(os.time() - HARDEN.lastMappingVerifiedAt) .. " old · " .. tostring(HARDEN.lastMappingSource)) or "unavailable"), HARDEN.lastMappingVerifiedAt > 0},
        {"Remote inventory · hung " .. tostring(State.AutoTrader.HungRemoteInvokes or 0), not State.AutoTrader.RemoteInvokeCircuitOpen},
        {"Server progress", not State.AutoTrader.RecoveryTeleportRequired},
        {"Teleport script · " .. tostring(State.AutoTrader.TeleportScriptIntegrity or "unknown"), State.AutoTrader.TeleportScriptIntegrity ~= "mismatch"},
        {"Integrity stop", not State.AutoTrader.FatalIntegrityStop},
    }
    for i, row in ipairs(safety) do UI.AutoTraderSafetyRows[i].Text = (row[2] and "✓ " or "! ") .. row[1]; UI.AutoTraderSafetyRows[i].TextColor3 = row[2] and THEME.green or THEME.red end

    local logs = State.AutoTrader.DebugLog or {}
    for i = 1, #UI.AutoTraderEventRows do
        local entry = logs[#logs - i + 1]
        UI.AutoTraderEventRows[i].Text = entry and (string.format("%6.1f  ", tonumber(entry.t) or 0) .. humanEvent(entry)) or ""
    end

    local partner = State.AutoTrader.LastTradePartner
    UI.AutoTraderTradePartner.Text = partner and ("Partner: " .. partner.Name) or "Partner: —"
    if plan then UI.AutoTraderTradeTotals.Text = "Them " .. formatCompact(plan.receiveTotal) .. " · Us " .. formatCompact(plan.total) .. " · Profit +" .. formatCompact(plan.win)
    elseif summary then UI.AutoTraderTradeTotals.Text = "Them known " .. formatCompact(summary.knownFloor) .. " · waiting for plan"
    else UI.AutoTraderTradeTotals.Text = "Them: —   Us: —   Profit: —" end
    UI.AutoTraderTradeState.Text = State.CurrentTrade and tostring(State.AutoTrader.StatusDetail or status) or "No active managed trade. The page will populate when a trade begins."
    local negotiation = summary and (summary.knownFloor or 0) > 0 and State.AutoTrader.GetNegotiationStage(summary) or nil
    if negotiation then
        UI.AutoTraderNegotiationStage.Text = "Stage " .. tostring(negotiation.stage) .. (negotiation.final and " · FINAL FLOOR" or (" · target " .. formatPercent((negotiation.margin or 0) * 100, false)))
        UI.AutoTraderNegotiationTimer.Text = negotiation.nextIn and ("Next concession in " .. string.format("%.1fs", negotiation.nextIn) .. " · stable for " .. string.format("%.1fs", negotiation.stableFor)) or "Final concession stage · no lower margin allowed."
        UI.AutoTraderNegotiationSafety.Text = "Target profit +" .. formatCompact(negotiation.targetProfit) .. " · hard floor +" .. formatCompact(State.AutoTrader.GetEffectiveMinimumWin(summary))
    else
        UI.AutoTraderNegotiationStage.Text = "Stage: —"; UI.AutoTraderNegotiationTimer.Text = "Waiting for their offer."; UI.AutoTraderNegotiationSafety.Text = "Hard minimum: —"
    end
    for index = 1, CONFIG.MaxOfferSlots do
        local row, item = UI.AutoTraderPlanRows[index], plan and plan.items[index]
        if item then row.Text = tostring(index) .. ". " .. item.name .. (item.quantity > 1 and (" x" .. tostring(item.quantity)) or "") .. " · " .. formatCompact(item.unitValue * item.quantity); row.TextColor3 = THEME.text
        else row.Text = index == 1 and "— no calculated plan yet —" or ""; row.TextColor3 = THEME.faint end
    end
    local audit = State.AutoTrader.LastAuditDetail or State.AutoTrader.LastAcceptAudit
    if audit then
        UI.AutoTraderAudit.Text = "Last audit: " .. tostring(audit.result or "captured") .. (audit.inventoryMismatches and (" · inventory mismatches " .. tostring(#audit.inventoryMismatches)) or "")
    else UI.AutoTraderAudit.Text = "Last audit: —" end
    local market = State.AutoTrader.LastMarketGate
    UI.AutoTraderTradeWhy.Text = plan and ("Planner stage " .. tostring(plan.negotiationStage or "?") .. " targeted a +" .. formatCompact(plan.win) .. " audited gain. " .. (market and ("Market gate: " .. tostring(market.reason or market.ok or "checked") .. ". ") or "") .. "The hard minimum-win and post-trade audit remain non-negotiable.") or "The planner will explain its margin, market gate, and acceptance state here."

    local scan = State.AutoTrader.LastServerScan
    if scan then
        UI.AutoTraderServerScanStatus.Text = State.AutoTrader.ServerHopInProgress and "Scanning server candidates" or "Last server-selection scan"
        UI.AutoTraderServerScanThreshold.Text = "Reject trusted previews at strict-gold matches ≥ " .. string.format("%.0f%%", (tonumber(scan.safeThreshold) or CONFIG.AutoTraderGoldBotRejectRatio) * 100) .. " · trusted " .. tostring(scan.trustedCandidateCount or 0) .. " · unknown allowed " .. tostring(scan.unknownCandidateCount or 0)
        local best = scan.bestScanned
        UI.AutoTraderServerScanBest.Text = best and (best.previewTrusted
            and ("Best: gold matches " .. pct01(best.goldBotMatchRatio) .. " · unmatched " .. pct01(best.safeConfidence) .. " · " .. tostring(best.playing or "?") .. "/" .. tostring(best.maxPlayers or "?"))
            or ("Best: avatar preview UNKNOWN (allowed) · " .. tostring(best.playing or "?") .. "/" .. tostring(best.maxPlayers or "?"))) or "Best scanned: —"
        local selectedRow = nil
        for _, candidate in ipairs(scan.candidates or {}) do
            if candidate.id == scan.selected then selectedRow = candidate; break end
        end
        local fetch = scan.fetch or {}
        local transportText = "GET pages: game:HttpGet " .. tostring(fetch.selectedGameHttpGetPages or 0)
            .. " · executor " .. tostring(fetch.selectedExecutorPages or 0)
            .. " · degraded " .. tostring(fetch.selectedDegradedPages or 0)
        if scan.selected then
            UI.AutoTraderServerScanReason.Text = "Selected JobId " .. tostring(scan.selected)
                .. ((selectedRow and selectedRow.previewTrusted) and " after strict-gold filtering. " or " as UNKNOWN because avatar preview was unavailable/insufficient. ")
                .. transportText
        else
            UI.AutoTraderServerScanReason.Text = "No eligible candidate yet; UNKNOWN previews are allowed, so only an empty/unusable server list or trusted strict-gold rejects should block selection. " .. transportText
        end
    else
        UI.AutoTraderServerScanStatus.Text = "No public-server scan yet."; UI.AutoTraderServerScanThreshold.Text = "Filter source: strict gold hashes when available; unknown previews are allowed"; UI.AutoTraderServerScanBest.Text = "Best scanned: —"; UI.AutoTraderServerScanReason.Text = ""
    end

    local dbCount = State.AutoTrader.GetBotIconDbCount()
    local goldDbCount = State.AutoTrader.GetGoldBotIconDbCount()
    UI.AutoTraderBotSummary.Text = "Gold hashes " .. tostring(goldDbCount) .. " · legacy stored " .. tostring(math.max(0, dbCount - goldDbCount)) .. " (ignored) · certification " .. string.upper(tostring(cert.status or "waiting"))

    local global = State.AutoTrader.NormalizeStrategyBucket(State.AutoTrader.GetStrategyStats().global)
    local requests, responses, trades, successes = tonumber(session.requests) or 0, tonumber(session.responses) or 0, tonumber(session.trades) or 0, tonumber(session.successes) or 0
    local sessionRows = {
        "Runtime: " .. string.format("%.1f min", elapsed / 60),
        "Audited profit: +" .. formatCompact(profit),
        "Profit/hour: +" .. formatCompact(profitHour),
        "Requests: " .. tostring(requests),
        "Responses: " .. tostring(responses) .. " (" .. (requests > 0 and pct01(responses / requests) or "—") .. ")",
        "Trades started: " .. tostring(trades),
        "Audited wins: " .. tostring(successes),
        "Avg profit/win: " .. (successes > 0 and ("+" .. formatCompact(profit / successes)) or "—"),
        "Gold bot DB: " .. tostring(goldDbCount) .. " hashes",
    }
    for i, text in ipairs(sessionRows) do UI.AutoTraderSessionRows[i].Text = text end
    local learnedProfitHr = (tonumber(global.terminalSeconds) or 0) > 0 and ((tonumber(global.totalProfit) or 0) / global.terminalSeconds * 3600) or 0
    local learnedRows = {
        "Requests learned: " .. tostring(math.floor(global.requests or 0)),
        "Response rate: " .. ((global.requests or 0) > 0 and pct01((global.responses or 0) / global.requests) or "—"),
        "Trade/start rate: " .. ((global.responses or 0) > 0 and pct01((global.trades or 0) / global.responses) or "—"),
        "Win/trade rate: " .. ((global.trades or 0) > 0 and pct01((global.successes or 0) / global.trades) or "—"),
        "Learned profit: +" .. formatCompact(global.totalProfit or 0),
        "Interaction profit/hr: +" .. formatCompact(learnedProfitHr),
        "Fresh-server EV: " .. rateText(State.AutoTrader.GetHopOpportunityRate()),
        "Value bands: 4", 
        "Stats persist across hops",
    }
    for i, text in ipairs(learnedRows) do UI.AutoTraderLearnedRows[i].Text = text end
    local margins = State.AutoTrader.GetStrategyStats().marginStages or {}
    local marginNames = {"18% high margin", "11% concession", "6% concession", "hard floor"}
    for i = 1, 4 do
        local m = type(margins[tostring(i)]) == "table" and margins[tostring(i)] or {}
        local outcomes, wins = tonumber(m.shownOutcomes) or 0, tonumber(m.successes) or 0
        local avgProfit = wins > 0 and (tonumber(m.totalProfit) or 0) / wins or 0
        UI.AutoTraderMarginRows[i].Text = tostring(i) .. ". " .. marginNames[i] .. " · outcomes " .. tostring(math.floor(outcomes)) .. " · win " .. (outcomes > 0 and pct01(wins / outcomes) or "—") .. " · avg +" .. formatCompact(avgProfit)
    end

    if UI.AutoTraderPanel.Visible then
        local renderNow = os.clock()
        if State.AutoTrader.ActiveTab == "PEOPLE" then
            if renderNow - (State.AutoTrader.LastPlayerDashboardBuildAt or 0) >= 0.5 then
                State.AutoTrader.LastPlayerDashboardBuildAt = renderNow
                State.AutoTrader.RebuildPlayerDashboard()
            end
        elseif State.AutoTrader.ActiveTab == "SERVERS" then
            if renderNow - (State.AutoTrader.LastServerDashboardBuildAt or 0) >= 0.8 then
                State.AutoTrader.LastServerDashboardBuildAt = renderNow
                State.AutoTrader.RebuildServerDashboard()
            end
            if renderNow - (State.AutoTrader.LastBotDashboardBuildAt or 0) >= 0.8 then
                State.AutoTrader.LastBotDashboardBuildAt = renderNow
                State.AutoTrader.RebuildBotDashboard()
            end
        elseif State.AutoTrader.ActiveTab == "SETTINGS"
            and UI.AutoTraderReserveContent
            and #UI.AutoTraderReserveContent:GetChildren() <= 2 then
            State.AutoTrader.RebuildReserveList()
        end
    end
end

connect(UI.AutoTraderSkipTarget.MouseButton1Click, function()
    local target = State.AutoTrader.SelectedTarget
    if target and target.Parent then
        State.AutoTrader.MarkServerPlayerOutcome(target, "manual_skip", "manual UI skip")
        State.AutoTrader.SetCooldown(target, "manual UI skip", 120)
        State.AutoTrader.SelectedTarget = nil
        State.AutoTrader.Status = "TARGET SKIPPED"
        State.AutoTrader.StatusDetail = target.Name .. " was skipped for this server visit."
        State.AutoTrader.Render()
        if not isTradeVisible() then State.AutoTrader.OnNoTrade() end
    end
end)
connect(UI.AutoTraderRefreshBots.MouseButton1Click, function()
    task.spawn(function()
        State.AutoTrader.ScreenCurrentServerAvatars(true)
        if not Destroyed then State.AutoTrader.Render() end
    end)
end)
connect(UI.AutoTraderRefreshServerScan.MouseButton1Click, function()
    if State.AutoTrader.ServerHopInProgress then
        State.AutoTrader.Status = "SERVER SCAN · ALREADY RUNNING"
        State.AutoTrader.StatusDetail = "The server search is already running; its liveness watchdog remains armed."
        State.AutoTrader.Render()
    else
        task.spawn(function()
            local _, scan = State.AutoTrader.BuildPublicServerQueue(true)
            State.AutoTrader.LastServerScan = scan
            if not Destroyed then State.AutoTrader.Render() end
        end)
    end
end)
connect(UI.AutoTraderForceServer.MouseButton1Click, function()
    if State.CurrentTrade or State.AutoTrader.PendingRequest or State.AutoTrader.PostTradeAuditPending then
        State.AutoTrader.Status = "WAIT · ACTIVE WORK"
        State.AutoTrader.StatusDetail = "Server search will not interrupt an active request/trade/audit."
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.FastBotHopActive = true
    State.AutoTrader.FastBotHopReason = "MANUAL_SERVER_SEARCH"
    State.AutoTrader.Status = "SERVER HOP · MANUAL SEARCH"
    State.AutoTrader.StatusDetail = "Selecting another server; trusted previews are filtered by strict-gold hashes and UNKNOWN previews remain eligible."
    State.AutoTrader.Render()
    State.AutoTrader.TryServerHop("MANUAL_SERVER_SEARCH", select(2, State.AutoTrader.GetServerDisposition()))
end)

end
State.AutoTrader.BindLocalDeclineObserver = function()
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then
        tradeGui = PlayerGui:FindFirstChild("TradeGUI")
    end
    local button = tradeGui
        and safeFindPath(tradeGui, {"Container", "Trade", "Actions", "Decline", "ActionButton"})
    if not button or not button:IsA("GuiButton") or State.AutoTrader.LocalDeclineButton == button then
        return
    end
    State.AutoTrader.LocalDeclineButton = button
    connect(button.MouseButton1Click, function()
        State.AutoTrader.LocalDeclineAt = os.clock()
        State.AutoTrader.Log("local_trade_decline_click", {})
    end)
end
State.AutoTrader.BindRemoteObservers = function(tradeFolder)
    if not tradeFolder then
        return
    end
    local declineRequest = tradeFolder:FindFirstChild("DeclineRequest")
    if declineRequest and declineRequest:IsA("RemoteEvent") then
        connect(declineRequest.OnClientEvent, function()
            local observedPending = State.AutoTrader.PendingRequest
            local observedGeneration = observedPending and observedPending.generation or nil
            if observedPending then observedPending.declineObservedAt = os.clock() end
            State.AutoTrader.Log("request_decline_event_observed", observedPending)
            task.delay(0.12, function()
                if Destroyed then return end
                local pending = State.AutoTrader.PendingRequest
                if not observedPending or not pending
                    or pending.userId ~= observedPending.userId
                    or pending.generation ~= observedGeneration then
                    State.AutoTrader.Log("request_decline_event_stale", {observed = observedPending, current = pending})
                    return
                end
                local player = Players:GetPlayerByUserId(pending.userId)
                -- If the same target's native pending UI is still visibly alive after
                -- the event, the event cannot authoritatively free this generation.
                if State.AutoTrader.IsNativeOutgoingPending(player) then
                    State.AutoTrader.Log("request_decline_event_ambiguous_native_still_visible", pending)
                    return
                end
                if pending.phase == "canceling" then
                    pending.cancelQuietSince = os.clock() - CONFIG.AutoTraderRequestCancelQuietSeconds
                    State.AutoTrader.FinalizePendingCancellation(pending)
                    State.AutoTrader.Status = "REQUEST CANCELED"
                    State.AutoTrader.StatusDetail = "MM2 confirmed the previous outgoing request is gone; the single-flight slot is clean."
                    State.AutoTrader.Render()
                    return
                end
                State.AutoTrader.FinalizePendingDecline(pending, "request declined")
            end)
        end)
    end
    local startTrade = tradeFolder:FindFirstChild("StartTrade")
    if startTrade and startTrade:IsA("RemoteEvent") then
        connect(startTrade.OnClientEvent, function(_, partnerName)
            State.AutoTrader.TradeBeganAt = os.clock()
            State.AutoTrader.LocalDeclineAt = 0
            State.AutoTrader.FirstOfferAt = 0
            State.AutoTrader.LastTradeUpdateAt = os.clock()
            State.AutoTrader.LastTradeActivityAt = State.AutoTrader.LastTradeUpdateAt
            State.AutoTrader.AutoAcceptGeneration += 1
            State.AutoTrader.AutoAcceptSentKey = nil
            State.AutoTrader.AutoAcceptSentAt = 0
            State.AutoTrader.AutoAcceptTradeUpdateAt = 0
            State.AutoTrader.OtherAcceptedAt = 0
            State.AutoTrader.ActionGeneration += 1
            State.AutoTrader.ActionInFlight = nil
            State.AutoTrader.LastManagedLocalHash = nil
            local pending = State.AutoTrader.PendingRequest
            local incoming = State.AutoTrader.IncomingRequestDecision
            local partnerPlayer = type(partnerName) == "string" and State.AutoTrader.ResolveIncomingPlayer(partnerName) or nil
            if pending and partnerPlayer and partnerPlayer.UserId == pending.userId then
                State.AutoTrader.RecordTargetEvent(partnerPlayer, "response", {seconds = os.clock() - pending.sentAt})
                State.AutoTrader.RecordTargetEvent(partnerPlayer, "trade")
                State.AutoTrader.MarkServerPlayerOutcome(partnerPlayer, "trading", "trade started")
                State.AutoTrader.TradeRequestStartedAt = pending.sentAt or os.clock()
                State.AutoTrader.TradeCorrelationId = pending.correlationId or State.AutoTrader.TradeCorrelationId
                State.AutoTrader.PendingRequest = nil
                State.AutoTrader.RequestLifecycle = "idle"
                State.AutoTrader.RequestConfirmGeneration += 1
            elseif partnerPlayer then
                if pending then
                    local old = Players:GetPlayerByUserId(pending.userId)
                    if old then
                        State.AutoTrader.MarkServerPlayerOutcome(old, "deferred", "different authoritative trade started")
                        State.AutoTrader.RequestHistory[old.UserId] = nil
                    end
                    State.AutoTrader.Log("trade_started_pending_mismatch", {pending = pending, partnerName = partnerName})
                    State.AutoTrader.PendingRequest = nil
                    State.AutoTrader.RequestLifecycle = "idle"
                    State.AutoTrader.RequestConfirmGeneration += 1
                end
                State.AutoTrader.TradeRequestStartedAt = os.clock()
                State.AutoTrader.TradeCorrelationId = State.AutoTrader.TradeCorrelationId
                    or (State.AutoTrader.ControllerEpoch .. ":trade-external:" .. tostring(State.AutoTrader.ActionGeneration))
                State.AutoTrader.RecordTargetEvent(partnerPlayer, "trade")
                State.AutoTrader.MarkServerPlayerOutcome(partnerPlayer, "trading", incoming and "incoming request accepted" or "trade started externally")
            end
            if incoming and (not partnerPlayer or incoming.userId == partnerPlayer.UserId) then
                State.AutoTrader.IncomingRequestGeneration += 1
                State.AutoTrader.IncomingRequestResolvingSignature = nil
                State.AutoTrader.IncomingRequestDecision = nil
            end
            State.AutoTrader.Log("trade_started", {partnerName = partnerName, pending = pending, incoming = incoming})
            if State.AutoTrader.Preferences.automation then
                task.defer(function()
                    if not Destroyed then
                        State.AutoTrader.SuppressTradeVisuals()
                    end
                end)
                task.delay(0.15, function()
                    if not Destroyed and State.AutoTrader.Preferences.automation then
                        State.AutoTrader.SuppressTradeVisuals()
                    end
                end)
            end
        end)
    end
    local declineTrade = tradeFolder:FindFirstChild("DeclineTrade")
    if declineTrade and declineTrade:IsA("RemoteEvent") then
        connect(declineTrade.OnClientEvent, function()
            local observedPartner = State.AutoTrader.LastTradePartner
            local observedPartnerUserId = observedPartner and observedPartner.UserId or nil
            local observedTradeBeganAt = State.AutoTrader.TradeBeganAt
            local observedLocalDecline = State.AutoTrader.TradeDeclinePending == true
                or os.clock() - (State.AutoTrader.LocalDeclineAt or 0) <= CONFIG.AutoTraderTradeDeclineConfirmTimeoutSeconds
            local observedOutcome = State.AutoTrader.TradeDeclineOutcome
            State.AutoTrader.Log("trade_decline_event_observed", {
                partnerUserId = observedPartnerUserId,
                localDecline = observedLocalDecline,
                tradeBeganAt = observedTradeBeganAt,
                requestedOutcome = observedOutcome,
            })
            task.delay(0.18, function()
                if Destroyed then return end
                local tradeGui = State.TradeGui
                if not tradeGui or not tradeGui.Parent then tradeGui = PlayerGui:FindFirstChild("Trade") or PlayerGui:FindFirstChild("TradeGUI") end
                local nativeActive = tradeGui and tradeGui:IsA("ScreenGui") and tradeGui.Enabled == true
                local currentPartner = State.AutoTrader.LastTradePartner
                local currentUserId = currentPartner and currentPartner.UserId or nil
                local newerTrade = State.CurrentTrade
                    and ((State.AutoTrader.TradeBeganAt or 0) > (observedTradeBeganAt or 0) + 0.01
                        or (observedPartnerUserId and currentUserId and observedPartnerUserId ~= currentUserId))
                -- DeclineTrade carries no partner/generation. If a trade is still
                -- active after the event (especially a newer/different trade), never
                -- apply this ambiguous callback to that live transaction.
                if nativeActive and State.CurrentTrade then
                    State.AutoTrader.Log("trade_decline_event_ambiguous_active_trade", {
                        observedPartnerUserId = observedPartnerUserId,
                        currentPartnerUserId = currentUserId,
                        newerTrade = newerTrade == true,
                    })
                    return
                end
                if newerTrade then
                    State.AutoTrader.Log("trade_decline_event_stale_newer_trade", {
                        observedPartnerUserId = observedPartnerUserId,
                        currentPartnerUserId = currentUserId,
                    })
                    return
                end
                local partner = observedPartnerUserId and Players:GetPlayerByUserId(observedPartnerUserId) or observedPartner
                if partner and not observedLocalDecline then
                    local negotiation = State.AutoTrader.LastNegotiation
                    local activeSeconds = observedTradeBeganAt and observedTradeBeganAt > 0 and (os.clock() - observedTradeBeganAt) or nil
                    local totalSeconds = State.AutoTrader.TradeRequestStartedAt > 0 and (os.clock() - State.AutoTrader.TradeRequestStartedAt) or activeSeconds
                    State.AutoTrader.RecordTargetEvent(partner, "tradeDecline", {
                        seconds = activeSeconds, totalSeconds = totalSeconds,
                        negotiationStage = negotiation and negotiation.stage or nil,
                        negotiationMargin = negotiation and negotiation.margin or nil,
                    })
                    State.AutoTrader.MarkServerPlayerOutcome(partner, "trade_declined", "active trade declined")
                    State.AutoTrader.SetCooldown(partner, "active trade declined")
                elseif partner and observedLocalDecline and observedOutcome ~= "idle" then
                    local serverEntry = State.AutoTrader.ServerPlayers[partner.UserId]
                    if not serverEntry or serverEntry.outcome ~= "idle" then
                        State.AutoTrader.MarkServerPlayerOutcome(partner, "local_cancel", "trade ended locally")
                    end
                end
                State.AutoTrader.Log("trade_declined", {
                    partner = partner and partner.Name or nil,
                    localDecline = observedLocalDecline,
                    requestedOutcome = observedOutcome,
                })
                State.AutoTrader.TradeDeclinePending = false
                State.AutoTrader.LocalDeclineAt = 0
                State.AutoTrader.TradeDeclineStartedAt = 0
                State.AutoTrader.TradeDeclineQuietSince = 0
                State.AutoTrader.TradeDeclinePartnerUserId = nil
                State.AutoTrader.TradeDeclineOutcome = nil
                State.AutoTrader.ClearTradeRuntime()
                State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
                State.AutoTrader.Status = observedLocalDecline and "TRADE ENDED" or "COOLDOWN · TRADE ENDED"
                State.AutoTrader.StatusDetail = observedLocalDecline
                    and "The local decline was confirmed; the trade lifecycle is clean."
                    or (partner
                        and (partner.Name .. " ended the trade; ignoring them for about 2 minutes.")
                        or "Trade ended.")
                State.AutoTrader.Render()
            end)
        end)
    end
    local acceptTrade = tradeFolder:FindFirstChild("AcceptTrade")
    if acceptTrade and acceptTrade:IsA("RemoteEvent") then
        connect(acceptTrade.OnClientEvent, function(success, receivedItems)
            if success == false then
                State.AutoTrader.OtherAcceptedAt = os.clock()
                State.AutoTrader.LastTradeActivityAt = State.AutoTrader.OtherAcceptedAt
                State.AutoTrader.Log("other_player_accepted", {
                    partner = State.AutoTrader.LastTradePartner and State.AutoTrader.LastTradePartner.Name or nil,
                })
                if State.AutoTrader.Preferences.automation
                    and State.AutoTrader.ManagedPartnerUserId
                    and State.AutoTrader.Plan then
                    State.AutoTrader.TryAutoAccept()
                    local tx = State.AutoTrader.PendingAutoTransaction
                    if tx then
                        State.AutoTrader.SettlementStartedAt = (State.AutoTrader.SettlementStartedAt or 0) > 0
                            and State.AutoTrader.SettlementStartedAt or os.clock()
                        State.AutoTrader.SettlementGoneSince = 0
                        State.AutoTrader.Status = "AUTO ACCEPTED · SETTLING"
                        State.AutoTrader.StatusDetail = "Both sides accepted the owned exact offer. Waiting for authoritative settlement; no teleport will be attempted just because the completion event is delayed."
                        State.AutoTrader.Render()
                        local generation = tx.generation
                        task.delay(CONFIG.AutoTraderAcceptedSettlementProbeSeconds, function()
                            if Destroyed then return end
                            local current = State.AutoTrader.PendingAutoTransaction
                            if not current or current.generation ~= generation then return end
                            State.AutoTrader.Status = "TRADE SETTLEMENT · VERIFYING"
                            State.AutoTrader.StatusDetail = "Settlement is taking longer than usual. Keeping the transaction state intact and reconciling authoritative trade status."
                            State.AutoTrader.Log("accepted_trade_settlement_slow", {
                                generation = generation,
                                partnerUserId = current.partnerUserId,
                                seconds = os.clock() - (State.AutoTrader.SettlementStartedAt or os.clock()),
                            })
                            State.AutoTrader.RecoverOwnedSettlementIfEnded()
                            State.AutoTrader.Render()
                        end)
                    end
                end
                return
            end
            if success == true then
                local tx = State.AutoTrader.PendingAutoTransaction
                if not tx and State.AutoTrader.PostTradeAuditPending then
                    State.AutoTrader.Log("late_or_duplicate_completion_during_audit", {owner = State.AutoTrader.PostTradeAuditOwner})
                    return
                end
                local partner = State.AutoTrader.LastTradePartner
                if not partner and tx then partner = Players:GetPlayerByUserId(tx.partnerUserId) end
                if tx and partner and partner.UserId ~= tx.partnerUserId then
                    State.AutoTrader.Preferences.automation = false
                    State.AutoTrader.SavePreferences()
                    State.AutoTrader.FatalIntegrityStop = true
                    State.AutoTrader.SessionFrozen = "A trade completion arrived for a different partner than the owned automated acceptance transaction. Auto Trading was disabled."
                    State.AutoTrader.Status = "FROZEN · TRANSACTION OWNER MISMATCH"
                    State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
                    State.AutoTrader.Log("auto_transaction_owner_mismatch", {
                        expectedUserId = tx.partnerUserId, observedUserId = partner.UserId,
                    })
                    State.AutoTrader.Render()
                    return
                end

                if tx then
                    local completedPlan, audit = tx.plan, tx.audit
                    local now = os.clock()
                    local tradeSeconds = tx.tradeBeganAt and tx.tradeBeganAt > 0 and (now - tx.tradeBeganAt)
                        or (State.AutoTrader.TradeBeganAt > 0 and (now - State.AutoTrader.TradeBeganAt) or nil)
                    local requestToCompletionSeconds = tx.requestStartedAt and tx.requestStartedAt > 0 and (now - tx.requestStartedAt)
                        or (State.AutoTrader.TradeRequestStartedAt > 0 and (now - State.AutoTrader.TradeRequestStartedAt) or tradeSeconds)
                    if partner then State.AutoTrader.RequestHistory[partner.UserId] = now end
                    State.AutoTrader.Log("owned_trade_completed", {
                        generation = tx.generation, partner = partner and partner.Name or tx.partnerName,
                        receivedItems = receivedItems, plan = completedPlan,
                    })
                    State.AutoTrader.RestoreTradeVisuals()
                    State.AutoTrader.ClearTradeRuntime()
                    State.AutoTrader.Status = "TRADE COMPLETED"
                    State.AutoTrader.StatusDetail = "Server confirmed the owned automated trade. Starting repeated fresh-inventory verification."
                    State.AutoTrader.Render()
                    State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Server completion confirmed")
                    State.AutoTrader.RunPostTradeAudit(audit, receivedItems, partner, completedPlan, tradeSeconds, requestToCompletionSeconds, {owner = {generation = tx.generation, partnerUserId = tx.partnerUserId}})
                else
                    -- Manual/external completions are not allowed to borrow a stale
                    -- automated audit snapshot. Reconcile locally and continue.
                    local now = os.clock()
                    if partner then
                        State.AutoTrader.RequestHistory[partner.UserId] = now
                        State.AutoTrader.MarkServerPlayerOutcome(partner, "traded", "manual/external trade completed")
                    end
                    State.AutoTrader.Log("external_trade_completed_unowned", {
                        partner = partner and partner.Name or nil, receivedItems = receivedItems,
                    })
                    State.AutoTrader.ClearTradeRuntime()
                    State.AutoTrader.InventoryCache = nil
                    State.AutoTrader.InventoryCacheStamp = nil
                    if type(State.Profile.FetchRemoteTotalForPlayer) == "function" then
                        task.spawn(function() State.Profile.FetchRemoteTotalForPlayer(LocalPlayer, true) end)
                    end
                    State.AutoTrader.NextRequestAt = now + CONFIG.AutoTraderRequestSpacingSeconds
                    State.AutoTrader.Status = "EXTERNAL TRADE COMPLETE"
                    State.AutoTrader.StatusDetail = "A trade completed without an owned auto-accept transaction. No stale automated audit was applied; local inventory is being refreshed."
                    State.AutoTrader.Render()
                end
            end
        end)
    end
end
State.AutoTrader.CancelIgnoredRequest = function()
    local pending = State.AutoTrader.PendingRequest
    if not pending or pending.phase == "canceling" then return false end
    State.AutoTrader.Log("request_timeout_cancel", pending)
    local started, err = State.AutoTrader.BeginPendingRequestCancellation("request timed out", "no_response", false)
    if not started then
        State.AutoTrader.RequestRecoveryTeleport("pending request timeout cancellation failed: " .. tostring(err))
        return false
    end
    State.AutoTrader.Status = "REQUEST TIMEOUT · CANCELING"
    State.AutoTrader.StatusDetail = (pending.name or "Pending request")
        .. " timed out; waiting for MM2 to confirm the request is gone before moving on."
    State.AutoTrader.Render()
    return true
end
State.AutoTrader.EndIdleTrade = function()
    if not State.AutoTrader.ManagedPartnerUserId or not State.CurrentTrade or State.AutoTrader.ActionInFlight then
        return false
    end
    local partner = Players:GetPlayerByUserId(State.AutoTrader.ManagedPartnerUserId)
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("DeclineTrade")
    if not remote or not remote:IsA("RemoteEvent") then
        State.AutoTrader.Freeze("Trade.DeclineTrade RemoteEvent is unavailable for the idle-trade timeout.")
        return false
    end
    State.AutoTrader.LocalDeclineAt = os.clock()
    State.AutoTrader.TradeDeclinePending = true
    State.AutoTrader.TradeDeclineStartedAt = State.AutoTrader.LocalDeclineAt
    State.AutoTrader.TradeDeclineQuietSince = 0
    State.AutoTrader.TradeDeclinePartnerUserId = partner and partner.UserId or State.AutoTrader.ManagedPartnerUserId
    State.AutoTrader.TradeDeclineOutcome = "idle"
    State.AutoTrader.Log("idle_trade_decline", {
        partner = partner and partner.Name or nil,
        idleFor = os.clock() - (State.AutoTrader.LastTradeActivityAt or State.AutoTrader.TradeBeganAt or os.clock()),
    })
    local ok, err = pcall(function()
        remote:FireServer()
    end)
    if not ok then
        State.AutoTrader.TradeDeclinePending = false
        State.AutoTrader.TradeDeclineStartedAt = 0
        State.AutoTrader.TradeDeclineQuietSince = 0
        State.AutoTrader.TradeDeclinePartnerUserId = nil
        State.AutoTrader.TradeDeclineOutcome = nil
        State.AutoTrader.Freeze("Idle trade cancellation failed: " .. tostring(err))
        return false
    end
    if partner then
        local negotiation = State.AutoTrader.LastNegotiation
        local activeSeconds = State.AutoTrader.TradeBeganAt > 0 and (os.clock() - State.AutoTrader.TradeBeganAt) or CONFIG.AutoTraderTradeIdleTimeoutSeconds
        local totalSeconds = State.AutoTrader.TradeRequestStartedAt > 0 and (os.clock() - State.AutoTrader.TradeRequestStartedAt) or activeSeconds
        State.AutoTrader.RecordTargetEvent(partner, "idle", {
            seconds = activeSeconds, totalSeconds = totalSeconds,
            negotiationStage = negotiation and negotiation.stage or nil,
            negotiationMargin = negotiation and negotiation.margin or nil,
        })
        State.AutoTrader.MarkServerPlayerOutcome(partner, "idle", "trade idle/no response")
        State.AutoTrader.SetCooldown(partner, "trade idle/no response", CONFIG.AutoTraderCooldownSeconds)
    end
    State.AutoTrader.Status = "IDLE TRADE · DECLINING"
    State.AutoTrader.StatusDetail = "Decline sent; waiting for MM2's authoritative trade-end state before another request can start."
    State.AutoTrader.Render()
    return true
end
State.AutoTrader.EndDisallowedTrade = function(partner, reason)
    if State.AutoTrader.TradeDeclinePending then return true end
    if not State.CurrentTrade then return false end
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("DeclineTrade")
    if not remote or not remote:IsA("RemoteEvent") then
        State.AutoTrader.RequestRecoveryTeleport("Trade.DeclineTrade unavailable while ending a disallowed trade")
        return false
    end
    State.AutoTrader.LocalDeclineAt = os.clock()
    State.AutoTrader.TradeDeclinePending = true
    State.AutoTrader.TradeDeclineStartedAt = State.AutoTrader.LocalDeclineAt
    State.AutoTrader.TradeDeclineQuietSince = 0
    State.AutoTrader.TradeDeclinePartnerUserId = partner and partner.UserId or State.AutoTrader.ManagedPartnerUserId
    State.AutoTrader.TradeDeclineOutcome = "disallowed"
    State.AutoTrader.Log("disallowed_trade_decline", {partner = partner and partner.Name or nil, reason = reason})
    local ok, err = pcall(function() remote:FireServer() end)
    if not ok then
        State.AutoTrader.TradeDeclinePending = false
        State.AutoTrader.TradeDeclineStartedAt = 0
        State.AutoTrader.TradeDeclineQuietSince = 0
        State.AutoTrader.TradeDeclinePartnerUserId = nil
        State.AutoTrader.TradeDeclineOutcome = nil
        State.AutoTrader.RequestRecoveryTeleport("disallowed active trade could not be declined cleanly: " .. tostring(err))
        return false
    end
    State.AutoTrader.Status = "TRADE END · CONFIRMING"
    State.AutoTrader.StatusDetail = "Decline sent for a trade automation is not allowed to manage; waiting for MM2's authoritative trade state to close."
    State.AutoTrader.Render()
    return true
end

State.AutoTrader.ReconcileTradeDeclineState = function()
    if not State.AutoTrader.TradeDeclinePending then return false end
    local now = os.clock()
    -- Read the native ScreenGui enabled state directly. Background automation hides
    -- the trade container visually, so isTradeVisible() intentionally reports true
    -- while CurrentTrade exists and cannot be used as a decline acknowledgement.
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then tradeGui = PlayerGui:FindFirstChild("Trade") or PlayerGui:FindFirstChild("TradeGUI") end
    local nativeActive = tradeGui and tradeGui:IsA("ScreenGui") and tradeGui.Enabled == true
    if nativeActive then
        State.AutoTrader.TradeDeclineQuietSince = 0
        return true
    end
    if (State.AutoTrader.TradeDeclineQuietSince or 0) <= 0 then
        State.AutoTrader.TradeDeclineQuietSince = now
        return true
    end
    if now - State.AutoTrader.TradeDeclineQuietSince >= CONFIG.AutoTraderTradeDeclineQuietSeconds then
        State.AutoTrader.Log("trade_decline_confirmed_by_gui_absence", {
            partnerUserId = State.AutoTrader.TradeDeclinePartnerUserId, outcome = State.AutoTrader.TradeDeclineOutcome,
        })
        State.AutoTrader.TradeDeclinePending = false
        State.AutoTrader.LocalDeclineAt = 0
        State.AutoTrader.TradeDeclineStartedAt = 0
        State.AutoTrader.TradeDeclineQuietSince = 0
        State.AutoTrader.TradeDeclinePartnerUserId = nil
        State.AutoTrader.TradeDeclineOutcome = nil
        State.AutoTrader.ClearTradeRuntime()
        State.AutoTrader.NextRequestAt = now + CONFIG.AutoTraderRequestSpacingSeconds
        State.AutoTrader.Status = "TRADE ENDED"
        State.AutoTrader.StatusDetail = "MM2's trade UI stayed gone after the decline; the trade lifecycle is clean."
        State.AutoTrader.Render()
    end
    return true
end
State.AutoTrader.OvernightSupervisor = function()
    if Destroyed or not State.AutoTrader.Preferences.automation then return true end
    local now = os.clock()

    if State.AutoTrader.FatalIntegrityStop then
        return true
    end

    if State.AutoTrader.SessionFrozen then
        if State.AutoTrader.OperationalFreezeAt > 0
            and now - State.AutoTrader.OperationalFreezeAt >= CONFIG.AutoTraderOperationalRecoveryDelaySeconds then
            State.AutoTrader.RecoverOperationalFreeze(State.AutoTrader.SessionFrozen)
        end
        return true
    end

    if State.AutoTrader.RecoveryTeleportRequired
        and not State.AutoTrader.TeleportInProgress
        and not State.AutoTrader.ServerHopInProgress then
        State.AutoTrader.RequestRecoveryTeleport(State.AutoTrader.RecoveryTeleportReason or "pending overnight recovery")
        return true
    end

    if State.AutoTrader.PostTradeAuditPending then
        if State.AutoTrader.PostTradeAuditStartedAt <= 0 then
            State.AutoTrader.PostTradeAuditStartedAt = now
        elseif now - State.AutoTrader.PostTradeAuditStartedAt >= CONFIG.AutoTraderPostTradeAuditSupervisorSeconds then
            local age = now - State.AutoTrader.PostTradeAuditStartedAt
            State.AutoTrader.PostTradeAuditGeneration += 1
            State.AutoTrader.PostTradeAuditPending = false
            State.AutoTrader.PostTradeAuditStartedAt = 0
            State.AutoTrader.PostTradeAuditOwner = nil
            State.AutoTrader.LastAuditDetail = {result = "outer_watchdog_rejoin", age = age}
            State.AutoTrader.Log("post_trade_audit_outer_watchdog", {seconds = age})
            State.AutoTrader.Status = "AUDIT WATCHDOG · RESYNCING"
            State.AutoTrader.StatusDetail = "The post-trade audit state outlived its independent deadline; rejoining before any more trades."
            State.AutoTrader.Render()
            State.AutoTrader.RequestRecoveryTeleport("post-trade audit outer watchdog expired")
            return true
        end
    else
        State.AutoTrader.PostTradeAuditStartedAt = 0
    end

    State.AutoTrader.ReconcileOutgoingRequestState()
    State.AutoTrader.ReconcileTradeDeclineState()
    if State.AutoTrader.PendingAutoTransaction and (State.AutoTrader.SettlementStartedAt or 0) > 0 then
        State.AutoTrader.RecoverOwnedSettlementIfEnded()
    end

    if State.AutoTrader.TradeDeclinePending
        and State.AutoTrader.TradeDeclineStartedAt > 0
        and now - State.AutoTrader.TradeDeclineStartedAt >= CONFIG.AutoTraderTradeDeclineConfirmTimeoutSeconds then
        State.AutoTrader.Log("trade_decline_confirmation_timeout", {
            seconds = now - State.AutoTrader.TradeDeclineStartedAt,
            partnerUserId = State.AutoTrader.TradeDeclinePartnerUserId,
        })
        State.AutoTrader.RequestRecoveryTeleport("active trade decline could not be authoritatively confirmed")
        return true
    end

    if State.AutoTrader.ServerHopInProgress
        and State.AutoTrader.ServerHopStartedAt > 0
        and now - State.AutoTrader.ServerHopStartedAt >= CONFIG.AutoTraderServerHopTotalTimeoutSeconds then
        local reason = "server-hop pipeline exceeded its total deadline despite scan activity"
        State.AutoTrader.Log("server_hop_total_timeout", {seconds = now - State.AutoTrader.ServerHopStartedAt})
        State.AutoTrader.AbortServerHop(reason)
        State.AutoTrader.Status = "SERVER HOP · BLIND FALLBACK"
        State.AutoTrader.StatusDetail = "Screened hopping exceeded its total deadline; using a normal public teleport and carrying any staged strict bot evidence."
        State.AutoTrader.Render()
        State.AutoTrader.BeginTeleport("server_hop_total_timeout_blind_fallback", false, true)
        return true
    end

    if State.AutoTrader.TeleportInProgress
        and State.AutoTrader.TeleportAttemptStartedAt > 0
        and now - State.AutoTrader.TeleportAttemptStartedAt >= CONFIG.AutoTraderTeleportStartedHardTimeoutSeconds then
        local reason = "teleport did not complete inside the hard overnight deadline"
        local wasServerHop = State.AutoTrader.ServerHopInProgress
        State.AutoTrader.Log("teleport_hard_timeout", {
            seconds = now - State.AutoTrader.TeleportAttemptStartedAt,
            lastReason = State.AutoTrader.LastTeleportReason,
            serverHop = wasServerHop,
        })
        if wasServerHop then
            State.AutoTrader.AbortServerHop(reason)
            State.AutoTrader.Status = "SERVER HOP · BLIND FALLBACK"
            State.AutoTrader.StatusDetail = "A screened teleport stalled; retrying through Roblox's normal public teleport and carrying any staged strict bot evidence."
            State.AutoTrader.Render()
            State.AutoTrader.BeginTeleport("server_hop_teleport_timeout_blind_fallback", false, true)
        else
            State.AutoTrader.TeleportInProgress = false
            State.AutoTrader.TeleportAttemptStartedAt = 0
            State.AutoTrader.TeleportAttemptOriginJobId = nil
            State.AutoTrader.RequestRecoveryTeleport(reason)
        end
        return true
    end

    if State.AutoTrader.ServerHopInProgress
        and State.AutoTrader.ServerHopLastProgressAt > 0
        and now - State.AutoTrader.ServerHopLastProgressAt >= CONFIG.AutoTraderServerHopHardTimeoutSeconds then
        local reason = "server-hop pipeline made no scan/teleport progress inside its hard overnight deadline"
        State.AutoTrader.Log("server_hop_hard_timeout", {
            seconds = now - State.AutoTrader.ServerHopLastProgressAt,
            totalSeconds = State.AutoTrader.ServerHopStartedAt > 0 and (now - State.AutoTrader.ServerHopStartedAt) or nil,
            queueIndex = State.AutoTrader.ServerHopQueueIndex,
            queueCount = #(State.AutoTrader.ServerHopQueue or {}),
        })
        State.AutoTrader.AbortServerHop(reason)
        State.AutoTrader.Status = "SERVER HOP · BLIND FALLBACK"
        State.AutoTrader.StatusDetail = "The screened hop pipeline stopped making progress; using a normal public teleport and carrying any staged strict bot evidence."
        State.AutoTrader.Render()
        State.AutoTrader.BeginTeleport("server_hop_progress_timeout_blind_fallback", false, true)
        return true
    end

    local _, receiving, title, username, _, decline = State.AutoTrader.GetIncomingRequestUi()
    if receiving and State.AutoTrader.IsGuiShown(receiving) then
        local signature = State.AutoTrader.NormalizeRequestName(State.AutoTrader.GetTextValue(username))
            .. "|" .. State.AutoTrader.GetTextValue(title)
        if State.AutoTrader.IncomingRequestFirstSeenSignature ~= signature then
            State.AutoTrader.IncomingRequestFirstSeenSignature = signature
            State.AutoTrader.IncomingRequestFirstSeenAt = now
        end
        local age = now - (State.AutoTrader.IncomingRequestFirstSeenAt or now)
        local requester = State.AutoTrader.ResolveIncomingPlayer(State.AutoTrader.GetTextValue(username))
        if not requester and age >= CONFIG.AutoTraderIncomingUnresolvedTimeoutSeconds then
            State.AutoTrader.ClickNativeGuiButton(decline, "incoming_unresolved_timeout_decline")
            State.AutoTrader.Log("incoming_unresolved_timeout", {signature = signature, age = age})
        end
        if age >= CONFIG.AutoTraderIncomingStuckTimeoutSeconds then
            State.AutoTrader.ClickNativeGuiButton(decline, "incoming_stuck_timeout_decline")
            State.AutoTrader.RequestRecoveryTeleport("incoming request UI stayed stuck for " .. tostring(math.floor(age)) .. "s")
            return true
        end
    else
        State.AutoTrader.IncomingRequestFirstSeenSignature = nil
        State.AutoTrader.IncomingRequestFirstSeenAt = 0
    end

    local tradeVisible = isTradeVisible and isTradeVisible() or false
    if tradeVisible and not State.CurrentTrade
        and not State.AutoTrader.PostTradeAuditPending
        and not State.AutoTrader.PendingAutoTransaction then
        if State.AutoTrader.StaleTradeGuiSince <= 0 then
            State.AutoTrader.StaleTradeGuiSince = now
        elseif now - State.AutoTrader.StaleTradeGuiSince >= CONFIG.AutoTraderStaleTradeGuiTimeoutSeconds then
            local reason = "TradeGUI remained visible without an authoritative trade state"
            State.AutoTrader.Log("stale_trade_gui_timeout", {seconds = now - State.AutoTrader.StaleTradeGuiSince})
            State.AutoTrader.AbortCurrentTradeBestEffort(reason)
            State.AutoTrader.StaleTradeGuiSince = 0
            State.AutoTrader.RequestRecoveryTeleport(reason)
            return true
        end
    else
        State.AutoTrader.StaleTradeGuiSince = 0
    end

    if State.CurrentTrade
        and State.AutoTrader.TradeBeganAt > 0
        and now - State.AutoTrader.TradeBeganAt >= CONFIG.AutoTraderAbsoluteTradeTimeoutSeconds then
        local partner = State.AutoTrader.LastTradePartner
        State.AutoTrader.Log("absolute_trade_timeout", {
            partner = partner and partner.Name or nil,
            seconds = now - State.AutoTrader.TradeBeganAt,
        })
        local ended = State.AutoTrader.EndIdleTrade()
        if not ended then
            State.AutoTrader.AbortCurrentTradeBestEffort("absolute trade lifetime exceeded")
            State.AutoTrader.RequestRecoveryTeleport("absolute trade lifetime exceeded")
        end
        return true
    end

    local incomingVisible = receiving and State.AutoTrader.IsGuiShown(receiving) or false
    local noBlockingWork = not State.AutoTrader.PendingRequest
        and not State.CurrentTrade
        and not State.AutoTrader.PostTradeAuditPending
        and not State.AutoTrader.ServerHopInProgress
        and not State.AutoTrader.TeleportInProgress
        and not incomingVisible
    if noBlockingWork then
        local target = State.AutoTrader.SelectTarget()
        local disposition = State.AutoTrader.GetServerDisposition()
        if not target and disposition == "ACTIVE" then
            if State.AutoTrader.NoEligibleWorkSince <= 0 then
                State.AutoTrader.NoEligibleWorkSince = now
            elseif now - State.AutoTrader.NoEligibleWorkSince >= CONFIG.AutoTraderNoEligibleWorkTimeoutSeconds then
                local reason = "server stayed ACTIVE without any eligible request target"
                State.AutoTrader.Log("no_eligible_work_timeout", {seconds = now - State.AutoTrader.NoEligibleWorkSince})
                State.AutoTrader.NoEligibleWorkSince = 0
                State.AutoTrader.RequestRecoveryTeleport(reason)
                return true
            end
        else
            State.AutoTrader.NoEligibleWorkSince = 0
        end
    else
        State.AutoTrader.NoEligibleWorkSince = 0
    end

    -- Whole-server liveness deadline. PlayerAdded does intentionally NOT reset
    -- this clock, so a churny bot lobby cannot keep WAITING_FOR_DISCOVERY alive forever.
    if noBlockingWork then
        local targetNow = State.AutoTrader.SelectTarget()
        if not targetNow then
            local baseline = math.max(State.AutoTrader.ServerJoinedAt or now, State.AutoTrader.ServerMeaningfulProgressAt or 0)
            if now - baseline >= CONFIG.AutoTraderServerNoProgressTimeoutSeconds then
                State.AutoTrader.ServerNoProgressRecoveries += 1
                State.AutoTrader.FastBotHopActive = true
                State.AutoTrader.FastBotHopReason = "EXHAUSTED_NO_PROGRESS"
                State.AutoTrader.Log("server_no_progress_timeout", {
                    seconds = now - baseline,
                    recoveries = State.AutoTrader.ServerNoProgressRecoveries,
                    disposition = State.AutoTrader.GetServerDisposition(),
                })
                State.AutoTrader.Status = "SERVER IDLE · FORCED HOP"
                State.AutoTrader.StatusDetail = "No actionable trading progress occurred inside the whole-server deadline; hopping even if new unresolved players keep joining."
                State.AutoTrader.Render()
                State.AutoTrader.ServerMeaningfulProgressAt = now
                State.AutoTrader.TryServerHop("EXHAUSTED_NO_PROGRESS", select(2, State.AutoTrader.GetServerDisposition()))
                return true
            end
        end
    end
    return true
end

State.AutoTrader.LastInvariantCheckAt = 0
State.AutoTrader.CheckInvariants = function()
    local now=os.clock()
    if now-(State.AutoTrader.LastInvariantCheckAt or 0)<0.75 then return true,{} end
    State.AutoTrader.LastInvariantCheckAt=now
    local issues={}
    local function issue(code,detail,severity) table.insert(issues,{code=code,detail=detail,severity=severity or "warning"}) end
    local pending=State.AutoTrader.PendingRequest
    if pending and State.AutoTrader.RequestLifecycle=="idle" then issue("pending_request_idle_lifecycle","PendingRequest exists while lifecycle is idle","error") end
    if not pending and State.AutoTrader.RequestLifecycle~="idle" and not State.AutoTrader.IsAnyNativeOutgoingPending()
        and (State.AutoTrader.OrphanRequestCancelStartedAt or 0)<=0 then issue("orphan_request_lifecycle",State.AutoTrader.RequestLifecycle,"error") end
    local txn=State.AutoTrader.PendingAutoTransaction
    if txn and (not txn.partnerUserId or not txn.audit or not txn.localHash or not txn.otherHash) then issue("owned_transaction_incomplete","PendingAutoTransaction is missing ownership evidence","fatal") end
    if txn and State.AutoTrader.ManagedPartnerUserId and txn.partnerUserId~=State.AutoTrader.ManagedPartnerUserId
        and State.CurrentTrade then issue("owned_transaction_partner_mismatch","owned transaction partner differs from managed partner","fatal") end
    if State.AutoTrader.ActionInFlight and (not State.CurrentTrade or State.AutoTrader.IsLocalAccepted()) then
        issue("mutation_without_legal_trade_state","ActionInFlight exists without a mutable active trade","fatal")
    end
    if State.AutoTrader.PostTradeAuditPending and type(State.AutoTrader.PostTradeAuditOwner)~="table" then
        issue("audit_without_owner","post-trade audit is pending without transaction ownership","fatal")
    end
    if State.AutoTrader.TeleportInProgress and pending and pending.phase~="canceling" then issue("teleport_with_live_request","teleport started while outgoing request was still live","error") end
    if #issues>0 then
        State.AutoTrader.Log("controller_invariant_check",{issues=issues})
        for _,row in ipairs(issues) do
            if row.severity=="fatal" and not State.AutoTrader.FatalIntegrityStop then State.AutoTrader.Freeze("Invariant failure: "..tostring(row.code).." · "..tostring(row.detail)); break end
        end
    end
    return #issues==0,issues
end
State.AutoTrader.Tick = function()
    if Destroyed then
        return
    end
    State.AutoTrader.CheckInvariants()
    State.AutoTrader.BindLocalDeclineObserver()
    State.AutoTrader.BindRequestCancelObserver()
    State.AutoTrader.BindIncomingRequestObserver()
    State.AutoTrader.ReconcileOutgoingRequestState()
    State.AutoTrader.ReconcileTradeDeclineState()
    if State.AutoTrader.Preferences.automation
        and State.AutoTrader.ManagedPartnerUserId
        and (State.CurrentTrade or isTradeVisible()) then
        State.AutoTrader.SuppressTradeVisuals()
    elseif State.AutoTrader.BackgroundSuppressed
        and not State.AutoTrader.ManagedPartnerUserId then
        State.AutoTrader.RestoreTradeVisuals()
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            State.AutoTrader.RequestFriendStatus(player)
        end
    end
    if State.AutoTrader.PendingRequest then
        local target = Players:GetPlayerByUserId(State.AutoTrader.PendingRequest.userId)
        if not target then
            State.AutoTrader.Log("pending_target_left", State.AutoTrader.PendingRequest)
            if State.AutoTrader.PendingRequest.phase ~= "canceling" then
                local started, err = State.AutoTrader.BeginPendingRequestCancellation("pending target left the server", "trade_unavailable", false)
                if not started then State.AutoTrader.RequestRecoveryTeleport("pending target left and request cancellation failed: " .. tostring(err)) end
            end
        elseif State.AutoTrader.Preferences.automation
            and (State.CurrentTrade or (isTradeVisible and isTradeVisible())) then
            -- A StartTrade/UpdateTrade event can arrive before the request cleanup
            -- event that identifies the partner. Never fire CancelRequest into an
            -- already-active trade; force trade-state reconciliation instead.
            if scheduleTradeRefresh then scheduleTradeRefresh(0) end
        elseif State.AutoTrader.Preferences.automation
            and State.AutoTrader.PendingRequest.phase == "pending"
            and os.clock() - (State.AutoTrader.PendingRequest.confirmedAt or State.AutoTrader.PendingRequest.sentAt) >= CONFIG.AutoTraderPendingRequestTimeoutSeconds then
            State.AutoTrader.CancelIgnoredRequest()
        elseif State.AutoTrader.Preferences.automation
            and State.AutoTrader.PendingRequest.phase ~= "pending"
            and State.AutoTrader.PendingRequest.phase ~= "canceling"
            and os.clock() - (State.AutoTrader.PendingRequest.sentAt or os.clock()) >= CONFIG.AutoTraderRequestInvokeTimeoutSeconds + 0.75 then
            State.AutoTrader.FailPendingRequestAttempt(
                target,
                State.AutoTrader.PendingRequest.generation,
                "request watchdog recovery",
                "Pending request never reached native pending/trade state"
            )
        end
    end
    if State.AutoTrader.Preferences.automation
        and State.CurrentTrade
        and (State.AutoTrader.UnresolvedTradePartnerSince or 0) > 0
        and os.clock() - State.AutoTrader.UnresolvedTradePartnerSince >= CONFIG.AutoTraderTradePartnerResolveSeconds
        and not State.AutoTrader.TradeDeclinePending then
        State.AutoTrader.EndDisallowedTrade(nil, "trade partner identity remained unresolved past the bounded window")
    end
    if State.AutoTrader.Preferences.automation
        and State.CurrentTrade
        and State.AutoTrader.ManagedPartnerUserId
        and (State.AutoTrader.ActiveTradeInventoryWaitSince or 0) > 0
        and os.clock() - State.AutoTrader.ActiveTradeInventoryWaitSince >= CONFIG.AutoTraderActiveInventoryResolveSeconds
        and not State.AutoTrader.TradeDeclinePending then
        local partner = Players:GetPlayerByUserId(State.AutoTrader.ManagedPartnerUserId)
        if partner then
            State.AutoTrader.MarkServerPlayerOutcome(partner, "deferred", "local inventory unavailable during active trade")
            State.AutoTrader.SetCooldown(partner, "local inventory unavailable; try elsewhere", 30)
        end
        State.AutoTrader.EndDisallowedTrade(partner, "verified local inventory remained unavailable past the bounded active-trade window")
    end

    if State.AutoTrader.Preferences.automation
        and State.CurrentTrade
        and not State.AutoTrader.ManagedPartnerUserId
        and State.AutoTrader.LastTradePartner
        and (State.AutoTrader.FriendTradeCheckStartedAt or 0) > 0
        and os.clock() - State.AutoTrader.FriendTradeCheckStartedAt >= CONFIG.AutoTraderFriendTradeResolveSeconds
        and not State.AutoTrader.TradeDeclinePending then
        local partner = State.AutoTrader.LastTradePartner
        State.AutoTrader.SetManagedPartner(partner)
        State.AutoTrader.EndDisallowedTrade(partner, "friend status could not be resolved inside the bounded active-trade window")
    end

    if State.AutoTrader.Preferences.automation
        and State.AutoTrader.ManagedPartnerUserId
        and State.CurrentTrade
        and not State.AutoTrader.TradeDeclinePending
        and not State.AutoTrader.PostTradeAuditPending
        and not (State.AutoTrader.PendingAutoTransaction and (State.AutoTrader.SettlementStartedAt or 0) > 0)
        and not State.AutoTrader.SessionFrozen then
        local activity = math.max(
            tonumber(State.AutoTrader.LastTradeActivityAt) or 0,
            tonumber(State.AutoTrader.TradeBeganAt) or 0,
            tonumber(State.AutoTrader.OtherAcceptedAt) or 0,
            tonumber(State.AutoTrader.AutoAcceptSentAt) or 0
        )
        local noOfferYet = not State.AutoTrader.OtherSummary or State.AutoTrader.OtherSummary.slotCount == 0
        if noOfferYet
            and State.AutoTrader.TradeBeganAt > 0
            and os.clock() - State.AutoTrader.TradeBeganAt >= CONFIG.AutoTraderFirstOfferTimeoutSeconds then
            State.AutoTrader.EndIdleTrade()
        elseif activity > 0 and os.clock() - activity >= CONFIG.AutoTraderTradeIdleTimeoutSeconds then
            State.AutoTrader.EndIdleTrade()
        end
    end
    if not isTradeVisible() and not State.CurrentTrade then
        State.AutoTrader.OnNoTrade()
    elseif UI.AutoTraderPanel.Visible then
        State.AutoTrader.Render()
    end
end
connect(UI.AutoTraderLauncher.MouseButton1Click, function()
    UI.AutoTraderPanel.Visible = not UI.AutoTraderPanel.Visible
    if UI.AutoTraderPanel.Visible then
        State.AutoTrader.GetLocalInventory(true)
        State.AutoTrader.RebuildReserveList()
        if isTradeVisible and isTradeVisible() then
            scheduleTradeRefresh(0)
        else
            State.AutoTrader.OnNoTrade()
        end
    end
end)
connect(UI.AutoTraderClose.MouseButton1Click, function()
    UI.AutoTraderPanel.Visible = false
end)
connect(UI.AutoTraderEnabled.MouseButton1Click, function()
    State.AutoTrader.Preferences.automation = not State.AutoTrader.Preferences.automation
    if State.AutoTrader.Preferences.automation then
        State.AutoTrader.SessionFrozen = nil
        State.AutoTrader.FatalIntegrityStop = false
        State.AutoTrader.OperationalFreezeAt = 0
        State.AutoTrader.OperationalFreezeReason = nil
        State.AutoTrader.RecoveryTeleportRequired = false
        State.AutoTrader.RecoveryTeleportReason = nil
        State.AutoTrader.ManualAcceptHold = false
        State.AutoTrader.ActionGeneration += 1
        State.AutoTrader.ActionInFlight = nil
        State.AutoTrader.LastManagedLocalHash = nil
        State.AutoTrader.NextRequestAt = os.clock() + 0.4
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.MovementWatchdogArmedAt = os.clock() + 5
        State.AutoTrader.ServerExhaustedSince = 0
        State.AutoTrader.Log("automation_enabled", {})
    else
        State.AutoTrader.ActionGeneration += 1
        State.AutoTrader.AutoAcceptGeneration += 1
        State.AutoTrader.ActionInFlight = nil
        State.AutoTrader.AutoAcceptScheduledKey = nil
        State.AutoTrader.AutoAcceptSentKey = nil
        State.AutoTrader.ManagedPartnerUserId = nil
        State.AutoTrader.LastManagedLocalHash = nil
        State.AutoTrader.RestoreTradeVisuals()
        State.AutoTrader.Log("automation_disabled", {})
    end
    State.AutoTrader.SavePreferences()
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
    if not isTradeVisible() then
        State.AutoTrader.OnNoTrade()
    end
end)
connect(UI.AutoTraderIgnoreFriends.MouseButton1Click, function()
    State.AutoTrader.Preferences.ignoreFriends = not State.AutoTrader.Preferences.ignoreFriends
    State.AutoTrader.SavePreferences()
    State.AutoTrader.SelectedTarget = nil
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
    if not isTradeVisible() then
        State.AutoTrader.OnNoTrade()
    end
end)
connect(UI.AutoTraderOpeningAnchor.MouseButton1Click, function()
    State.AutoTrader.Preferences.openingAnchor = not State.AutoTrader.Preferences.openingAnchor
    State.AutoTrader.SavePreferences()
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
end)
connect(UI.AutoTraderUnknownTheir.MouseButton1Click, function()
    State.AutoTrader.Preferences.unknownTheirZero = not State.AutoTrader.Preferences.unknownTheirZero
    State.AutoTrader.SavePreferences()
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
end)
connect(UI.AutoTraderPreferDuplicates.MouseButton1Click, function()
    State.AutoTrader.Preferences.preferDuplicates = not State.AutoTrader.Preferences.preferDuplicates
    State.AutoTrader.SavePreferences()
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
end)
connect(UI.AutoTraderProfit.MouseButton1Click, function()
    State.AutoTrader.Preferences.winPreset = (
        math.floor(tonumber(State.AutoTrader.Preferences.winPreset) or 1)
        % #State.AutoTrader.WinPresets
    ) + 1
    State.AutoTrader.SavePreferences()
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.UpdateControls()
    scheduleTradeRefresh(0)
end)
connect(UI.AutoTraderCopyDebug.MouseButton1Click, function()
    State.AutoTrader.CopyDebug()
end)
connect(UI.AutoTraderSearch:GetPropertyChangedSignal("Text"), function()
    State.AutoTrader.ProtectedSearch = UI.AutoTraderSearch.Text
    State.AutoTrader.RebuildReserveList()
end)
State.AutoTrader.Dragging = false
State.AutoTrader.DragInput = nil
State.AutoTrader.DragStart = nil
State.AutoTrader.DragStartPosition = nil
connect(UI.AutoTraderHeader.InputBegan, function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end
    State.AutoTrader.Dragging = true
    State.AutoTrader.DragStart = input.Position
    State.AutoTrader.DragStartPosition = UI.AutoTraderPanel.Position
end)
connect(UI.AutoTraderHeader.InputChanged, function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        State.AutoTrader.DragInput = input
    end
end)
connect(UserInputService.InputChanged, function(input)
    if not State.AutoTrader.Dragging
        or input ~= State.AutoTrader.DragInput
        or not UI.AutoTraderPanel.Parent then
        return
    end
    local delta = input.Position - State.AutoTrader.DragStart
    local start = State.AutoTrader.DragStartPosition
    UI.AutoTraderPanel.Position = UDim2.new(
        start.X.Scale,
        start.X.Offset + delta.X,
        start.Y.Scale,
        start.Y.Offset + delta.Y
    )
end)
connect(UserInputService.InputEnded, function(input)
    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
        return
    end
    if State.AutoTrader.Dragging then
        local position = UI.AutoTraderPanel.Position
        State.AutoTrader.Preferences.panelPosition = {
            xs = position.X.Scale,
            xo = position.X.Offset,
            ys = position.Y.Scale,
            yo = position.Y.Offset,
        }
        clampAutoTraderPanelPosition(true)
    end
    State.AutoTrader.Dragging = false
    State.AutoTrader.DragInput = nil
end)
connect(Players.PlayerRemoving, function(player)
    if State.AutoTrader.PendingRequest and State.AutoTrader.PendingRequest.userId == player.UserId then
        State.AutoTrader.Log("pending_target_left", State.AutoTrader.PendingRequest)
        if State.AutoTrader.PendingRequest.phase ~= "canceling" then
            local started, err = State.AutoTrader.BeginPendingRequestCancellation("pending target left the server", "trade_unavailable", false)
            if not started then
                State.AutoTrader.Log("pending_target_left_cancel_failed", {error = err})
                State.AutoTrader.RequestRecoveryTeleport("outgoing request target left and cancellation failed")
            end
        end
    end
    State.AutoTrader.EndServerPlayerPresence(player)
end)
State.AutoTrader.UpdateControls()
State.AutoTrader.Render()
updatePublicUiScale()
UI.ValueBox = create("Frame", {
    Position = UDim2.fromOffset(14, 128),
    Size = UDim2.new(1, -28, 0, 82),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
    ZIndex = 1001,
}, TradePanel)
addCorner(UI.ValueBox, 9)
UI.GiveTitle = makeLabel(
    UI.ValueBox,
    "YOU GIVE",
    9,
    THEME.faint,
    Enum.Font.ArialBold
)
UI.GiveTitle.Position = UDim2.fromOffset(10, 7)
UI.GiveTitle.Size = UDim2.fromOffset(100, 14)
UI.GiveTitle.ZIndex = 1002
UI.ReceiveTitle = makeLabel(
    UI.ValueBox,
    "YOU RECEIVE",
    9,
    THEME.faint,
    Enum.Font.ArialBold
)
UI.ReceiveTitle.Position = UDim2.new(1, -110, 0, 7)
UI.ReceiveTitle.Size = UDim2.fromOffset(100, 14)
UI.ReceiveTitle.TextXAlignment = Enum.TextXAlignment.Right
UI.ReceiveTitle.ZIndex = 1002
UI.GiveValue = makeLabel(
    UI.ValueBox,
    "0",
    18,
    THEME.orange,
    Enum.Font.ArialBold
)
UI.GiveValue.Position = UDim2.fromOffset(10, 23)
UI.GiveValue.Size = UDim2.fromOffset(120, 23)
UI.GiveValue.ZIndex = 1002
UI.ReceiveValue = makeLabel(
    UI.ValueBox,
    "0",
    18,
    THEME.green,
    Enum.Font.ArialBold
)
UI.ReceiveValue.Position = UDim2.new(1, -130, 0, 23)
UI.ReceiveValue.Size = UDim2.fromOffset(120, 23)
UI.ReceiveValue.TextXAlignment = Enum.TextXAlignment.Right
UI.ReceiveValue.ZIndex = 1002
UI.DifferenceValue = makeLabel(
    UI.ValueBox,
    "Difference: 0",
    11,
    THEME.muted,
    Enum.Font.Arial
)
UI.DifferenceValue.Position = UDim2.fromOffset(10, 53)
UI.DifferenceValue.Size = UDim2.new(1, -20, 0, 19)
UI.DifferenceValue.TextXAlignment = Enum.TextXAlignment.Center
UI.DifferenceValue.ZIndex = 1002
UI.SignalsTitle = makeLabel(
    TradePanel,
    "SIGNALS",
    9,
    THEME.faint,
    Enum.Font.ArialBold
)
UI.SignalsTitle.Position = UDim2.fromOffset(14, 220)
UI.SignalsTitle.Size = UDim2.new(1, -28, 0, 16)
UI.SignalsTitle.ZIndex = 1001
UI.SignalBox = create("Frame", {
    Position = UDim2.fromOffset(14, 239),
    Size = UDim2.new(1, -28, 0, 100),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
    ZIndex = 1001,
}, TradePanel)
addCorner(UI.SignalBox, 9)
UI.SignalLabels = {}
UI.signalNames = {
    {"Demand", "demand"},
    {"Flippability", "flippability"},
    {"Stability", "stability"},
    {"Trend", "trend"},
    {"Rarity", "rarity"},
}
for index, definition in ipairs(UI.signalNames) do
    local y = 5 + (index - 1) * 18
    local nameLabel = makeLabel(
        UI.SignalBox,
        definition[1],
        10,
        THEME.muted,
        Enum.Font.Arial
    )
    nameLabel.Position = UDim2.fromOffset(10, y)
    nameLabel.Size = UDim2.new(0.55, -10, 0, 17)
    nameLabel.ZIndex = 1002
    local verdictLabel = makeLabel(
        UI.SignalBox,
        "—",
        10,
        THEME.faint,
        Enum.Font.ArialBold
    )
    verdictLabel.Position = UDim2.new(0.55, 0, 0, y)
    verdictLabel.Size = UDim2.new(0.45, -10, 0, 17)
    verdictLabel.TextXAlignment = Enum.TextXAlignment.Right
    verdictLabel.ZIndex = 1002
    UI.SignalLabels[definition[2]] = verdictLabel
end
UI.NotesTitle = makeLabel(
    TradePanel,
    "WHY",
    9,
    THEME.faint,
    Enum.Font.ArialBold
)
UI.NotesTitle.Position = UDim2.fromOffset(14, 349)
UI.NotesTitle.Size = UDim2.new(1, -28, 0, 16)
UI.NotesTitle.ZIndex = 1001
UI.NotesScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(14, 369),
    Size = UDim2.new(1, -28, 1, -383),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = THEME.border,
    ZIndex = 1001,
}, TradePanel)
addCorner(UI.NotesScroll, 9)
UI.NotesContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1002,
}, UI.NotesScroll)
UI.NotesList = create("UIListLayout", {
    Padding = UDim.new(0, 6),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, UI.NotesContent)
UI.NotesPadding = create("UIPadding", {
    PaddingLeft = UDim.new(0, 9),
    PaddingRight = UDim.new(0, 9),
    PaddingTop = UDim.new(0, 9),
    PaddingBottom = UDim.new(0, 9),
}, UI.NotesContent)
local function renderNotes(notes)
    for _, child in ipairs(UI.NotesContent:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
    for index, text in ipairs(notes or {}) do
        local row = create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = tostring(index) .. ". " .. tostring(text),
            TextColor3 = THEME.muted,
            TextSize = 10,
            Font = Enum.Font.Arial,
            TextWrapped = true,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextYAlignment = Enum.TextYAlignment.Top,
            ZIndex = 1003,
        }, UI.NotesContent)
    end
    if #(notes or {}) == 0 then
        local empty = makeLabel(
            UI.NotesContent,
            "Add items to both sides to see an explanation.",
            10,
            THEME.faint,
            Enum.Font.Arial
        )
        empty.Size = UDim2.new(1, 0, 0, 40)
        empty.TextWrapped = true
        empty.ZIndex = 1003
    end
    UI.NotesScroll.CanvasPosition = Vector2.new(0, 0)
end
local function renderTradePanel(result)
    State.LastEvaluation = result
    if not result then
        UI.TradePanelStatus.Text = "Waiting for trade..."
        UI.TradePanelStatus.TextColor3 = THEME.text
        UI.TradePanelScore.Text = "Supreme Values " .. DatabaseStatus
        UI.GiveValue.Text = "0"
        UI.ReceiveValue.Text = "0"
        UI.DifferenceValue.Text = "Difference: 0"
        for _, label in pairs(UI.SignalLabels) do
            label.Text = "—"
            label.TextColor3 = THEME.faint
        end
        renderNotes({})
        return
    end
    if not result.evaluable then
        UI.TradePanelStatus.Text = "CAN'T SCORE"
        UI.TradePanelStatus.TextColor3 = THEME.yellow
        UI.TradePanelScore.Text = "Missing or nonnumeric item data"
        local giveTotal =
            result.localOffer and result.localOffer.totalValue or 0
        local receiveTotal =
            result.otherOffer and result.otherOffer.totalValue or 0
        UI.GiveValue.Text = formatNumber(giveTotal)
        UI.ReceiveValue.Text = formatNumber(receiveTotal)
        UI.DifferenceValue.Text = "Recommendation disabled"
        for _, label in pairs(UI.SignalLabels) do
            label.Text = "UNKNOWN"
            label.TextColor3 = THEME.faint
        end
        renderNotes(result.notes)
        return
    end
    UI.TradePanelStatus.Text =
        (result.shouldTrade and "TAKE · " or "PASS · ")
        .. result.verdict
    UI.TradePanelStatus.TextColor3 =
        result.shouldTrade and THEME.green or THEME.red
    UI.TradePanelScore.Text =
        string.format(
            "Score %.1f · %s confidence · %s",
            result.score,
            result.confidenceLabel,
            result.tradeType
        )
    UI.GiveValue.Text = formatNumber(result.value.giving)
    UI.ReceiveValue.Text = formatNumber(result.value.receiving)
    local differenceColor =
        result.value.difference > 0 and THEME.green
        or result.value.difference < 0 and THEME.red
        or THEME.yellow
    UI.DifferenceValue.TextColor3 = differenceColor
    UI.DifferenceValue.Text =
        "Difference: "
        .. (result.value.difference > 0 and "+" or "")
        .. formatNumber(result.value.difference)
        .. "  ("
        .. formatPercent(result.value.percentage, true)
        .. ")"
    for key, label in pairs(UI.SignalLabels) do
        local signalVerdict = result.comparisons[key] or "UNKNOWN"
        label.Text = signalVerdict
        label.TextColor3 = verdictColor(signalVerdict)
    end
    renderNotes(result.notes)
end
connect(UI.ToggleHelper.MouseButton1Click, function()
    State.TradeHelperEnabled = not State.TradeHelperEnabled
    refreshToggleText()
    if not State.TradeHelperEnabled then
        clearAllTradeHighlights()
    end
end)
State.MainGUI = nil
State.InventoryRoot = nil
State.TradeGui = nil
State.TradeInventoryRoot = nil
State.TradeOffer1 = nil
State.TradeOffer2 = nil
HARDEN.guiDiscovery = HARDEN.guiDiscovery or {mainCalls=0,tradeCalls=0,tradeCacheHits=0,tradeSuccess=0,inventoryScans=0,totalTradeSeconds=0,maxTradeSeconds=0,totalInventorySeconds=0,maxInventorySeconds=0}
local function discoverMainGui()
    HARDEN.guiDiscovery.mainCalls += 1
    State.MainGUI = PlayerGui:FindFirstChild("MainGUI")
    if not State.MainGUI then
        return
    end
    State.InventoryRoot =
        safeFindPath(State.MainGUI, {"Game", "Inventory"})
        or findFirstDescendantByName(State.MainGUI, "Inventory")
end
local function discoverTradeInventoryRoots(hostGui)
    State.TradeInventoryRoots = {}
    State.TradeDiscoveryCandidates = {}
    State.TradeWeaponRoot = nil
    State.TradePetRoot = nil
    if not hostGui then
        return
    end
    local function pathType(instance)
        local path = normalize(instance:GetFullName())
        if path:find("pet", 1, true) then
            return "Pets"
        end
        if path:find("weapon", 1, true) then
            return "Weapons"
        end
        return nil
    end
    local function directLooseCards(container)
        local cards = {}
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("GuiObject")
                and not tradeCardIsInsideOffers(child)
                and looksLikeTradeInventoryCardLoose(child) then
                table.insert(cards, child)
            end
        end
        return cards
    end
    for _, descendant in ipairs(hostGui:GetDescendants()) do
        if descendant:IsA("GuiObject")
            and not tradeCardIsInsideOffers(descendant) then
            local cards = directLooseCards(descendant)
            local count = #cards
            if count >= 2 then
                local path = normalize(descendant:GetFullName())
                local detectedType = pathType(descendant)
                local score = count * 100
                if detectedType then
                    score = score + 80
                end
                if path:find("items", 1, true) then
                    score = score + 35
                end
                if path:find("current", 1, true) then
                    score = score + 25
                end
                if descendant.Visible then
                    score = score + 15
                end
                if count > CONFIG.MaxOfferSlots then
                    score = score + 180
                end
                table.insert(
                    State.TradeDiscoveryCandidates,
                    {
                        root = descendant,
                        cards = cards,
                        count = count,
                        itemType = detectedType,
                        score = score,
                    }
                )
            end
        end
    end
    table.sort(
        State.TradeDiscoveryCandidates,
        function(a, b)
            if a.score ~= b.score then
                return a.score > b.score
            end
            return a.count > b.count
        end
    )
    local selected = {}
    local usedRoots = {}
    local function addCandidate(candidate, forcedType)
        if not candidate
            or usedRoots[candidate.root] then
            return
        end
        usedRoots[candidate.root] = true
        local detectedType =
            forcedType
            or candidate.itemType
        if not detectedType then
            local weaponHits = 0
            local petHits = 0
            for index = 1, math.min(5, #candidate.cards) do
                local card = candidate.cards[index]
                local displayName = getLooseCardDisplayName(card)
                local iconId = getCardIconAssetId(card)
                if findInternalGameItemId(
                    displayName or "",
                    "Weapons",
                    iconId
                ) then
                    weaponHits = weaponHits + 1
                end
                if findInternalGameItemId(
                    displayName or "",
                    "Pets",
                    iconId
                ) then
                    petHits = petHits + 1
                end
            end
            if weaponHits > petHits then
                detectedType = "Weapons"
            elseif petHits > weaponHits then
                detectedType = "Pets"
            end
        end
        if detectedType then
            table.insert(
                selected,
                {
                    root = candidate.root,
                    itemType = detectedType,
                }
            )
            if detectedType == "Weapons"
                and not State.TradeWeaponRoot then
                State.TradeWeaponRoot = candidate.root
            elseif detectedType == "Pets"
                and not State.TradePetRoot then
                State.TradePetRoot = candidate.root
            end
        end
    end
    for _, candidate in ipairs(State.TradeDiscoveryCandidates) do
        if candidate.itemType == "Weapons"
            and not State.TradeWeaponRoot then
            addCandidate(candidate, "Weapons")
        end
        if candidate.itemType == "Pets"
            and not State.TradePetRoot then
            addCandidate(candidate, "Pets")
        end
    end
    if not State.TradeWeaponRoot
        or not State.TradePetRoot then
        for _, candidate in ipairs(State.TradeDiscoveryCandidates) do
            if #selected >= 2 then
                break
            end
            addCandidate(candidate)
        end
    end
    State.TradeInventoryRoots = selected
    if #selected > 0 then
        State.TradeInventoryRoot =
            selected[1].root.Parent
            or selected[1].root
        if State.CurrentTrade then
            State.TradeInventoryRefreshGeneration =
                State.TradeInventoryRefreshGeneration + 1
            local generation =
                State.TradeInventoryRefreshGeneration
            task.delay(0.18, function()
                if Destroyed
                    or generation ~= State.TradeInventoryRefreshGeneration then
                    return
                end
                if State.CurrentTrade
                    and isTradeVisible() then
                    scheduleTradeRefresh(0)
                end
            end)
        end
    end
end
local function discoverTradeGui(force)
    local discoveryStarted = os.clock()
    HARDEN.guiDiscovery.tradeCalls += 1
    local function finishTradeDiscovery(result, cacheHit)
        local elapsed = os.clock() - discoveryStarted
        HARDEN.guiDiscovery.totalTradeSeconds += elapsed
        HARDEN.guiDiscovery.maxTradeSeconds = math.max(HARDEN.guiDiscovery.maxTradeSeconds, elapsed)
        if result then HARDEN.guiDiscovery.tradeSuccess += 1 end
        if cacheHit then HARDEN.guiDiscovery.tradeCacheHits += 1 end
        return result
    end
    if not force
        and State.TradeOffer1
        and State.TradeOffer1.Parent
        and State.TradeOffer2
        and State.TradeOffer2.Parent
        and State.TradeGui
        and State.TradeGui.Parent then
        return finishTradeDiscovery(true, true)
    end
    local function clearTradeGuiState()
        State.TradeGui = nil
        State.TradeInventoryRoot = nil
        State.TradeWeaponRoot = nil
        State.TradePetRoot = nil
        State.TradeOffer1 = nil
        State.TradeOffer2 = nil
    end
    local function commonAncestor(a, b)
        if not a or not b then
            return nil
        end
        local ancestors = {}
        local current = a
        while current do
            ancestors[current] = true
            current = current.Parent
        end
        current = b
        while current do
            if ancestors[current] then
                return current
            end
            current = current.Parent
        end
        return nil
    end
    local function nearestScreenGui(instance)
        local current = instance
        while current and current ~= PlayerGui do
            if current:IsA("ScreenGui") then
                return current
            end
            current = current.Parent
        end
        return nil
    end
    local function directItemCount(container)
        local count = 0
        if not container then
            return 0
        end
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("GuiObject")
                and looksLikeItemCard(child) then
                count = count + 1
            end
        end
        return count
    end
    local function bestCardContainer(categoryNode)
        if not categoryNode then
            return nil
        end
        local best = nil
        local bestCount = 0
        if categoryNode:IsA("GuiObject") then
            local ownCount = directItemCount(categoryNode)
            if ownCount > 0 then
                best = categoryNode
                bestCount = ownCount
            end
        end
        for _, descendant in ipairs(
            categoryNode:GetDescendants()
        ) do
            if descendant:IsA("GuiObject") then
                local count =
                    directItemCount(descendant)
                if count > bestCount then
                    best = descendant
                    bestCount = count
                end
            end
        end
        return best
    end
    local function findItemsNearTrade(tradeCommon, hostGui)
        local current = tradeCommon
        while current and current ~= hostGui do
            local parent = current.Parent
            if parent then
                local items =
                    parent:FindFirstChild("Items")
                if items then
                    return items
                end
            end
            current = parent
        end
        local best = nil
        local bestScore = -1
        for _, descendant in ipairs(
            hostGui:GetDescendants()
        ) do
            if descendant.Name == "Items"
                and descendant:IsA("GuiObject") then
                local score = 0
                if descendant:FindFirstChild(
                    "Weapons",
                    true
                ) then
                    score = score + 5
                end
                if descendant:FindFirstChild(
                    "Pets",
                    true
                ) then
                    score = score + 5
                end
                if descendant:FindFirstChild(
                    "Main"
                ) then
                    score = score + 3
                end
                if score > bestScore then
                    best = descendant
                    bestScore = score
                end
            end
        end
        return best
    end
    clearTradeGuiState()
    local offer1 =
        PlayerGui:FindFirstChild("Offer1", true)
    local offer2 =
        PlayerGui:FindFirstChild("Offer2", true)
    if not offer1 or not offer2 then
        local offerCandidates = {}
        for _, descendant in ipairs(
            PlayerGui:GetDescendants()
        ) do
            if descendant:IsA("GuiObject") then
                local container =
                    descendant:FindFirstChild("Container")
                if container
                    and container:FindFirstChild("NewItem1")
                    and container:FindFirstChild("NewItem2") then
                    table.insert(
                        offerCandidates,
                        descendant
                    )
                end
            end
        end
        if #offerCandidates >= 2 then
            offer1 = offerCandidates[1]
            offer2 = offerCandidates[2]
        end
    end
    if not offer1 or not offer2 then
        return finishTradeDiscovery(false, false)
    end
    local tradeCommon =
        commonAncestor(offer1, offer2)
    local hostGui =
        nearestScreenGui(tradeCommon)
        or nearestScreenGui(offer1)
        or nearestScreenGui(offer2)
    if not tradeCommon or not hostGui then
        return finishTradeDiscovery(false, false)
    end
    State.TradeGui = hostGui
    State.TradeOffer1 = offer1
    State.TradeOffer2 = offer2
    discoverTradeInventoryRoots(hostGui)
    if TradePanel.Parent ~= hostGui then
        TradePanel.Parent = hostGui
        TradePanel.AnchorPoint =
            Vector2.new(1, 0.5)
        TradePanel.Position =
            UDim2.new(1, -12, 0.5, 0)
        TradePanel.ZIndex = 1000
    end
    return finishTradeDiscovery(true, false)
end
isTradeVisible = function()
    if State.AutoTrader
        and State.AutoTrader.BackgroundSuppressed
        and type(State.CurrentTrade) == "table" then
        return true
    end
    if not State.TradeOffer1
        or not State.TradeOffer1.Parent
        or not State.TradeOffer2
        or not State.TradeOffer2.Parent then
        if not discoverTradeGui(false) then
            return false
        end
    end
    local function chainVisible(instance)
        local current = instance
        while current and current ~= PlayerGui do
            if current:IsA("ScreenGui") then
                if not current.Enabled then
                    return false
                end
            elseif current:IsA("GuiObject") then
                if not current.Visible then
                    return false
                end
            end
            current = current.Parent
        end
        return true
    end
    return
        chainVisible(State.TradeOffer1)
        or chainVisible(State.TradeOffer2)
end
local function scanInventoryCards()
    local scanStarted = os.clock()
    HARDEN.guiDiscovery.inventoryScans += 1
    local function finishInventoryScan()
        local elapsed = os.clock() - scanStarted
        HARDEN.guiDiscovery.totalInventorySeconds += elapsed
        HARDEN.guiDiscovery.maxInventorySeconds = math.max(HARDEN.guiDiscovery.maxInventorySeconds, elapsed)
    end
    if not SupremeDatabase then finishInventoryScan(); return end
    if not State.InventoryRoot or not State.InventoryRoot.Parent then
        discoverMainGui()
    end
    if not State.InventoryRoot then finishInventoryScan(); return end
    for _, descendant in ipairs(State.InventoryRoot:GetDescendants()) do
        if looksLikeItemCard(descendant) then
            decorateCard(descendant, {
                showValue = CONFIG.ValueBadgeOnInventory,
                showInfo = CONFIG.StatsButtons,
                compactMode = false,
            })
        end
    end
    finishInventoryScan()
end
local function refreshTrackedCards()
    local resolvedSnapshot = {}
    for frame, info in pairs(State.DecoratedCards) do
        if frame and frame.Parent and info then
            table.insert(resolvedSnapshot, {
                frame = frame,
                info = info,
            })
        end
    end
    for _, entry in ipairs(resolvedSnapshot) do
        local info = entry.info
        decorateCard(entry.frame, {
            itemId = info.itemId,
            itemType = info.itemType,
            displayName = info.displayName,
            showValue = info.showValue,
            showInfo = info.showInfo,
            compactMode = info.compactMode,
        })
    end
    local unresolvedSnapshot = {}
    for frame, context in pairs(State.UnresolvedCards) do
        if frame and frame.Parent and context then
            table.insert(unresolvedSnapshot, {
                frame = frame,
                context = context,
            })
        end
    end
    for _, entry in ipairs(unresolvedSnapshot) do
        local context = entry.context
        decorateCard(entry.frame, {
            itemId = context.itemId,
            itemType = context.itemType,
            displayName = context.displayName,
            showValue = true,
            showInfo = true,
            compactMode =
                State.TradeInventoryRoot
                and entry.frame:IsDescendantOf(State.TradeInventoryRoot)
                or false,
        })
    end
end
local function getTradeOfferSlots(offerRoot)
    local slots = {}
    if not offerRoot then
        return slots
    end
    local container = offerRoot:FindFirstChild("Container")
    if not container then
        return slots
    end
    for index = 1, CONFIG.MaxOfferSlots do
        local slot =
            container:FindFirstChild(
                "NewItem" .. tostring(index)
            )
        if slot and slot:IsA("GuiObject") then
            table.insert(slots, slot)
        end
    end
    return slots
end
local function annotateOfferSlots(localEntries, otherEntries)
    if not State.TradeOffer1 or not State.TradeOffer2 then
        discoverTradeGui()
    end
    local localSlots = getTradeOfferSlots(State.TradeOffer1)
    local otherSlots = getTradeOfferSlots(State.TradeOffer2)
    for index, slot in ipairs(localSlots) do
        removeCardDecoration(slot)
        local entry = localEntries[index]
        if entry and entry.record then
            decorateCard(slot, {
                itemId = entry.itemId,
                itemType = entry.itemType,
                record = entry.record,
                showValue = CONFIG.ValueBadgeOnTrade,
                showInfo = CONFIG.StatsButtons,
                compactMode = true,
            })
        end
    end
    for index, slot in ipairs(otherSlots) do
        removeCardDecoration(slot)
        local entry = otherEntries[index]
        if entry and entry.record then
            decorateCard(slot, {
                itemId = entry.itemId,
                itemType = entry.itemType,
                record = entry.record,
                showValue = CONFIG.ValueBadgeOnTrade,
                showInfo = CONFIG.StatsButtons,
                compactMode = true,
            })
        end
    end
end
local function gatherTradeInventoryCards()
    local cards = {}
    if not State.TradeGui
        or not State.TradeGui.Parent
        or #State.TradeInventoryRoots == 0 then
        discoverTradeGui(true)
    end
    for _, discovered in ipairs(
        State.TradeInventoryRoots
    ) do
        local root = discovered.root
        local preferredType = discovered.itemType
        if root and root.Parent then
            for _, child in ipairs(root:GetChildren()) do
                if child:IsA("GuiObject")
                    and not tradeCardIsInsideOffers(child)
                    and looksLikeTradeInventoryCardLoose(child) then
                    local itemType,
                        itemId,
                        displayName,
                        iconAssetId =
                        classifyTradeCard(
                            child,
                            preferredType
                        )
                    if itemType then
                        local record = nil
                        if iconAssetId then
                            local manual =
                                LinkedImages[
                                    numericAssetId(iconAssetId)
                                ]
                            if manual then
                                record =
                                    State.Mapping.ResolveLinkRecord(
                                        manual
                                    )
                            end
                        end
                        if not record then
                            record =
                                select(
                                    1,
                                    resolveGameItem(
                                        itemId or displayName,
                                        itemType,
                                        displayName
                                    )
                                )
                        end
                        decorateCard(child, {
                            itemId = itemId,
                            itemType = itemType,
                            displayName = displayName,
                            record = record,
                            showValue = CONFIG.ValueBadgeOnTrade,
                            showInfo = CONFIG.StatsButtons,
                            compactMode = true,
                            allowLooseCard = true,
                        })
                        if record then
                            local candidateId =
                                itemId
                                or displayName
                                or record.name
                                or (
                                    iconAssetId
                                    and ("ICON_" .. tostring(iconAssetId))
                                )
                            if candidateId then
                                table.insert(
                                    cards,
                                    {
                                        frame = child,
                                        itemId = tostring(candidateId),
                                        gameItemId = itemId,
                                        displayName = displayName,
                                        iconAssetId = iconAssetId,
                                        itemType = itemType,
                                        record = record,
                                    }
                                )
                            end
                        end
                    end
                end
            end
        end
    end
    return cards
end
local function offeredQuantityForCandidate(entries, candidate)
    local exact =
        findOfferEntry(
            entries,
            candidate.itemId,
            candidate.itemType
        )
    if exact then
        return exact.quantity or 0
    end
    if candidate.record then
        local wantedName =
            normalize(candidate.record.name or "")
        local wantedCategory =
            normalizeCategory(
                candidate.record.category or ""
            )
        for _, entry in ipairs(entries) do
            if entry.record then
                local entryName =
                    normalize(entry.record.name or "")
                local entryCategory =
                    normalizeCategory(
                        entry.record.category or ""
                    )
                if entryName == wantedName
                    and entryCategory == wantedCategory then
                    return entry.quantity or 0
                end
            end
        end
    end
    return 0
end
local function createHypotheticalOffer(currentEntries, candidate)
    local copy = cloneOfferEntries(currentEntries)
    local existing =
        findOfferEntry(
            copy,
            candidate.itemId,
            candidate.itemType
        )
    if not existing and candidate.record then
        local wantedName =
            normalize(candidate.record.name or "")
        local wantedCategory =
            normalizeCategory(
                candidate.record.category or ""
            )
        for _, entry in ipairs(copy) do
            if entry.record
                and normalize(entry.record.name or "") == wantedName
                and normalizeCategory(
                    entry.record.category or ""
                ) == wantedCategory then
                existing = entry
                break
            end
        end
    end
    if existing then
        existing.quantity = existing.quantity + 1
    else
        table.insert(copy, {
            itemId = candidate.itemId,
            itemType = candidate.itemType,
            quantity = 1,
            record = candidate.record,
        })
    end
    return copy
end
local function queueBoundedTradeHelperRetry()
    State.TradeHelperRetryGeneration =
        State.TradeHelperRetryGeneration + 1
    local generation =
        State.TradeHelperRetryGeneration
    State.TradeHelperRetryCount = 0
    local delays = {
        0.15,
        0.35,
        0.70,
        1.10,
        1.60,
    }
    for index, delaySeconds in ipairs(delays) do
        task.delay(delaySeconds, function()
            if Destroyed
                or generation ~= State.TradeHelperRetryGeneration
                or not State.CurrentTrade
                or not isTradeVisible() then
                return
            end
            if State.LastTradeHelperStats
                and (State.LastTradeHelperStats.cards or 0) > 0 then
                return
            end
            State.TradeHelperRetryCount = index
            discoverTradeGui(true)
            scheduleTradeRefresh(0)
        end)
    end
end
local function recalculateTradeHelper(localEntries, otherEntries)
    State.TradeHelperGeneration =
        State.TradeHelperGeneration + 1
    local generation = State.TradeHelperGeneration
    clearAllTradeHighlights()
    if not State.TradeHelperEnabled
        or not isTradeVisible()
        or not SupremeDatabase then
        return
    end
    if #localEntries >= CONFIG.MaxOfferSlots then
        return
    end
    local cards = gatherTradeInventoryCards()
    State.LastTradeHelperStats = {
        cards = #cards,
        numeric = 0,
        offerable = 0,
        evaluable = 0,
        safe = 0,
    }
    if #cards == 0
        and State.TradeHelperRetryCount == 0 then
        queueBoundedTradeHelperRetry()
    end
    if #cards > 0 then
        State.TradeHelperRetryGeneration =
            State.TradeHelperRetryGeneration + 1
        State.TradeHelperRetryCount = 0
    end
    task.spawn(function()
        local safeCandidates = {}
        for index, candidate in ipairs(cards) do
            if Destroyed
                or generation ~= State.TradeHelperGeneration then
                return
            end
            local unitValue =
                numericValue(candidate.record.data)
            if unitValue then
                State.LastTradeHelperStats.numeric =
                    State.LastTradeHelperStats.numeric + 1
                local alreadyOffered =
                    offeredQuantityForCandidate(
                        localEntries,
                        candidate
                    )
                local visibleAmount =
                    getAmountFromCard(candidate.frame)
                local canOffer =
                    (
                        visibleAmount
                        and visibleAmount > alreadyOffered
                    )
                    or (
                        not visibleAmount
                        and alreadyOffered == 0
                    )
                if canOffer then
                    State.LastTradeHelperStats.offerable =
                        State.LastTradeHelperStats.offerable + 1
                    local hypothetical =
                        createHypotheticalOffer(
                            localEntries,
                            candidate
                        )
                    local result =
                        evaluateResolvedTrade(
                            hypothetical,
                            otherEntries
                        )
                    if result.evaluable then
                        State.LastTradeHelperStats.evaluable =
                            State.LastTradeHelperStats.evaluable + 1
                    end
                    if result.evaluable
                        and result.shouldTrade then
                        State.LastTradeHelperStats.safe =
                            State.LastTradeHelperStats.safe + 1
                        table.insert(
                            safeCandidates,
                            {
                                candidate = candidate,
                                result = result,
                                unitValue = unitValue,
                            }
                        )
                    end
                end
            end
            if index % 12 == 0 then
                RunService.Heartbeat:Wait()
            end
        end
        if Destroyed
            or generation ~= State.TradeHelperGeneration then
            return
        end
        table.sort(safeCandidates, function(a, b)
            if a.unitValue ~= b.unitValue then
                return a.unitValue > b.unitValue
            end
            local aDistance =
                math.abs(
                    a.result.score
                    - CONFIG.ShouldTradeScore
                )
            local bDistance =
                math.abs(
                    b.result.score
                    - CONFIG.ShouldTradeScore
                )
            return aDistance < bDistance
        end)
        local best = safeCandidates[1]
        for _, safe in ipairs(safeCandidates) do
            if Destroyed
                or generation ~= State.TradeHelperGeneration then
                return
            end
            setTradeHighlight(
                safe.candidate.frame,
                safe == best and "BEST" or "SAFE",
                safe.result
            )
        end
    end)
end
State.PendingTradeRefresh = false
local function updateFromTradeState()
    State.PendingTradeRefresh = false
    if Destroyed then
        return
    end
    if not State.TradeGui or not State.TradeGui.Parent then
        discoverTradeGui()
    end
    local visible = isTradeVisible()
    TradePanel.Visible =
        visible and CONFIG.TradePanel
    if not visible then
        clearAllTradeHighlights()
        State.AutoTrader.OnNoTrade()
        return
    end
    if not State.CurrentTrade then
        renderTradePanel(nil)
        clearAllTradeHighlights()
        State.AutoTrader.OnNoTrade()
        return
    end
    local localSide, otherSide =
        getTradeSides(State.CurrentTrade)
    if not localSide or not otherSide then
        renderTradePanel(nil)
        clearAllTradeHighlights()
        State.AutoTrader.OnNoTrade()
        return
    end
    local localEntries =
        resolveTradeOffer(localSide)
    local otherEntries =
        resolveTradeOffer(otherSide)
    local result =
        evaluateResolvedTrade(
            localEntries,
            otherEntries
        )
    annotateOfferSlots(localEntries, otherEntries)
    renderTradePanel(result)
    State.AutoTrader.OnTradeState(
        localSide,
        otherSide,
        localEntries,
        otherEntries
    )
    recalculateTradeHelper(
        localEntries,
        otherEntries
    )
end
scheduleTradeRefresh = function(delaySeconds)
    if State.PendingTradeRefresh then
        return
    end
    State.PendingTradeRefresh = true
    task.delay(delaySeconds or 0.05, function()
        if Destroyed then
            return
        end
        updateFromTradeState()
    end)
end
requestFullUiRefresh = function()
    if Destroyed then
        return
    end
    table.clear(ResolveCache)
        table.clear(State.ResolveMetaCache)
    GameResolverLastBuild = 0
    if State.AutoTrader then
        State.AutoTrader.InventoryCache = nil
        State.AutoTrader.InventoryCacheStamp = nil
        State.AutoTrader.LastCalculationSignature = nil
        State.AutoTrader.PlanGeneration =
            State.AutoTrader.PlanGeneration + 1
    end
    refreshTrackedCards()
    scheduleTradeRefresh(0)
end
local TradeFolder =
    ReplicatedStorage:FindFirstChild("Trade")
    or ReplicatedStorage:WaitForChild("Trade", 10)
local UpdateTradeRemote =
    TradeFolder
    and TradeFolder:FindFirstChild("UpdateTrade")
local StartTradeRemote =
    TradeFolder
    and TradeFolder:FindFirstChild("StartTrade")
local GetTradeStatus =
    ReplicatedStorage:FindFirstChild("GetTradeStatus")
    or (
        TradeFolder
        and TradeFolder:FindFirstChild("GetTradeStatus")
    )
if not GetTradeStatus then
    GetTradeStatus = ReplicatedStorage:WaitForChild("GetTradeStatus", 3)
end
State.AutoTrader.BindRemoteObservers(
    TradeFolder
)
local recoverTradeStatus
if UpdateTradeRemote
    and UpdateTradeRemote:IsA("RemoteEvent") then
    connect(
        UpdateTradeRemote.OnClientEvent,
        function(trade)
            if type(trade) == "table"
                and trade.Player1
                and trade.Player2 then
                State.CurrentTrade = trade
                State.AutoTrader.NoteTradeUpdate(trade)
                if not State.TradeOffer1
                    or not State.TradeOffer1.Parent then
                    discoverTradeGui(true)
                end
            end
            scheduleTradeRefresh(0.08)
            if not State.LastTradeHelperStats
                or (State.LastTradeHelperStats.cards or 0) == 0 then
                queueBoundedTradeHelperRetry()
            end
        end
    )
end
if StartTradeRemote
    and StartTradeRemote:IsA("RemoteEvent") then
    connect(
        StartTradeRemote.OnClientEvent,
        function()
            task.delay(0.08, function()
                if Destroyed then
                    return
                end
                discoverTradeGui(true)
                if State.TradeGui then
                    TradePanel.Visible = CONFIG.TradePanel
                        and not State.AutoTrader.BackgroundSuppressed
                end
                recoverTradeStatus()
                scheduleTradeRefresh(0.10)
                queueBoundedTradeHelperRetry()
                task.delay(0.35, function()
                    if Destroyed
                        or not isTradeVisible() then
                        return
                    end
                    if #State.TradeInventoryRoots == 0 then
                        discoverTradeGui(true)
                        reconnectGuiWatchers()
                        scheduleTradeRefresh(0.05)
                    end
                end)
            end)
        end
    )
end
recoverTradeStatus = function()
    if not GetTradeStatus
        or not GetTradeStatus:IsA("RemoteFunction") then
        return false
    end
    local ok, packed = waitForExternalWithDeadline("GetTradeStatus", CONFIG.AutoTraderRequestInvokeTimeoutSeconds, function()
        return {GetTradeStatus:InvokeServer()}
    end)
    if not ok or type(packed) ~= "table" then
        return false
    end
    local status, data = packed[1], packed[2]
    if status == "StartTrade"
        and type(data) == "table"
        and data.Player1
        and data.Player2 then
        State.CurrentTrade = data
        State.AutoTrader.NoteTradeUpdate(data)
        scheduleTradeRefresh(0.06)
        return true
    end
    return false
end
local function isInsideInjectedUi(instance, stopAt)
    local current = instance
    while current and current ~= stopAt do
        if current.Name
            and current.Name:sub(1, 3) == "SV_" then
            return true
        end
        current = current.Parent
    end
    return false
end
local function findItemCardFromDescendant(descendant, stopAt)
    if not descendant then
        return nil
    end
    if isInsideInjectedUi(descendant, stopAt) then
        return nil
    end
    local current = descendant
    while current and current ~= stopAt do
        if looksLikeItemCard(current) then
            return current
        end
        current = current.Parent
    end
    return nil
end
local function queueCardDecoration(card, options)
    if not card
        or not card.Parent
        or State.PendingCardDecorations[card] then
        return
    end
    State.PendingCardDecorations[card] = true
    task.defer(function()
        State.PendingCardDecorations[card] = nil
        if Destroyed
            or not card
            or not card.Parent
            or isInsideInjectedUi(card, nil) then
            return
        end
        decorateCard(card, options)
    end)
end
State.Profile.Disconnect = function()
    if State.Profile.root
        and State.Profile.root.Parent then
        local tooltip =
            State.Profile.root:FindFirstChild(
                "SV_TotalBreakdownTooltip"
            )
        if tooltip then
            tooltip:Destroy()
        end
    end
    for _, connection in ipairs(
        State.Profile.connections
    ) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    State.Profile.connections = {}
end
State.Profile.GetRoots = function()
    if not State.MainGUI
        or not State.MainGUI.Parent then
        discoverMainGui()
    end
    local profileRoot =
        State.MainGUI
        and safeFindPath(
            State.MainGUI,
            {
                "Game",
                "ViewProfile",
            }
        )
        or nil
    State.Profile.root = profileRoot
    State.Profile.weaponItems =
        profileRoot
        and safeFindPath(
            profileRoot,
            {
                "Main",
                "Weapons",
                "Items",
            }
        )
        or nil
    State.Profile.petItems =
        profileRoot
        and safeFindPath(
            profileRoot,
            {
                "Main",
                "Pets",
                "Items",
            }
        )
        or nil
    return profileRoot
end
State.Profile.ColorForValue = function(total)
    total = tonumber(total) or 0
    if total >= 5000 then
        return THEME.yellow
    elseif total >= 1000 then
        return THEME.purple
    elseif total >= 250 then
        return THEME.blue
    elseif total >= 50 then
        return THEME.green
    end
    return THEME.muted
end
State.Profile.GetUsername = function()
    local profileRoot =
        State.Profile.root
        or State.Profile.GetRoots()
    local main =
        profileRoot
        and profileRoot:FindFirstChild("Main")
    if not main then
        return nil
    end
    for _, tabName in ipairs({
        "Weapons",
        "Pets",
    }) do
        local section =
            main:FindFirstChild(tabName)
        local title =
            section
            and section:FindFirstChild("Title")
        local usernameLabel =
            title
            and title:FindFirstChild("Username")
        if usernameLabel
            and usernameLabel:IsA("TextLabel") then
            local value =
                trim(usernameLabel.Text or "")
            local username =
                value:match("^(.-)'s%s+Weapons$")
                or value:match("^(.-)'s%s+Pets$")
            if username and trim(username) ~= "" then
                return trim(username)
            end
        end
    end
    return nil
end
State.Profile.MakeSummaryLabel = function(section, name)
    if not section then
        return nil
    end
    local title =
        section:FindFirstChild("Title")
        or section
    local existing =
        title:FindFirstChild(name)
    if existing
        and existing:IsA("TextLabel") then
        return existing
    end
    if existing then
        existing:Destroy()
    end
    local label = create("TextLabel", {
        Name = name,
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, -8, 0, 5),
        Size = UDim2.fromOffset(154, 22),
        BackgroundColor3 =
            Color3.fromRGB(12, 15, 20),
        BackgroundTransparency = 0.08,
        BorderSizePixel = 0,
        Text = "Total Value: ?",
        TextColor3 = THEME.muted,
        TextSize = 12,
        Font = Enum.Font.ArialBold,
        TextXAlignment =
            Enum.TextXAlignment.Center,
        TextYAlignment =
            Enum.TextYAlignment.Center,
        ZIndex = 120,
        Active = true,
    }, title)
    addCorner(label, 6)
    addStroke(
        label,
        THEME.border,
        1,
        0.18
    )
    return label
end
State.Profile.FormatBreakdown = function(
    values,
    total,
    partial,
    stale
)
    local sorted = {}
    for _, value in ipairs(values or {}) do
        local numeric = tonumber(value)
        if numeric then
            table.insert(sorted, numeric)
        end
    end
    table.sort(
        sorted,
        function(a, b)
            return a > b
        end
    )
    if #sorted == 0 then
        if tonumber(total) and total ~= 0 then
            return formatNumber(total)
        end
        return "No numeric items counted"
    end
    local parts = {}
    local limit = math.min(#sorted, 90)
    for index = 1, limit do
        table.insert(
            parts,
            formatNumber(sorted[index])
        )
    end
    if #sorted > limit then
        table.insert(parts, "…")
    end
    local text =
        table.concat(parts, " + ")
    if #sorted <= limit then
        text =
            text
            .. " = "
            .. formatNumber(total or 0)
    end
    if partial then
        text =
            text
            .. "\nKnown numeric items only"
    end
    if stale then
        text =
            text
            .. "\nLast known value; live refresh is delayed"
    end
    return text
end
State.Profile.AttachSummaryHover = function(label)
    if not label
        or not label.Parent
        or label:GetAttribute(
            "SV_BreakdownHoverBound"
        ) then
        return
    end
    label:SetAttribute(
        "SV_BreakdownHoverBound",
        true
    )
    connect(
        label.MouseEnter,
        function()
            local profileRoot =
                State.Profile.root
            if not profileRoot
                or not profileRoot.Parent then
                return
            end
            local old =
                profileRoot:FindFirstChild(
                    "SV_TotalBreakdownTooltip"
                )
            if old then
                old:Destroy()
            end
            local tooltip =
                create("Frame", {
                    Name =
                        "SV_TotalBreakdownTooltip",
                    AnchorPoint =
                        Vector2.new(1, 0),
                    Size =
                        UDim2.fromOffset(
                            350,
                            104
                        ),
                    BackgroundColor3 =
                        Color3.fromRGB(
                            10,
                            12,
                            16
                        ),
                    BackgroundTransparency =
                        0.02,
                    BorderSizePixel = 0,
                    ZIndex = 500,
                    Active = false,
                }, profileRoot)
            addCorner(tooltip, 7)
            addStroke(
                tooltip,
                THEME.border,
                1,
                0.08
            )
            local rootPosition =
                profileRoot.AbsolutePosition
            local x =
                label.AbsolutePosition.X
                - rootPosition.X
                + label.AbsoluteSize.X
            local y =
                label.AbsolutePosition.Y
                - rootPosition.Y
                + label.AbsoluteSize.Y
                + 5
            tooltip.Position =
                UDim2.fromOffset(x, y)
            local info =
                State.Profile.summaryDisplay
                or {}
            create("TextLabel", {
                Position =
                    UDim2.fromOffset(
                        10,
                        8
                    ),
                Size =
                    UDim2.new(
                        1,
                        -20,
                        1,
                        -16
                    ),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Text =
                    State.Profile
                        .FormatBreakdown(
                            info.breakdownValues,
                            info.total,
                            info.partial,
                            info.stale
                        ),
                TextColor3 = THEME.text,
                TextSize = 11,
                Font =
                    Enum.Font.Arial,
                TextWrapped = true,
                TextXAlignment =
                    Enum.TextXAlignment.Left,
                TextYAlignment =
                    Enum.TextYAlignment.Top,
                ZIndex = 501,
                Active = false,
            }, tooltip)
        end
    )
    connect(
        label.MouseLeave,
        function()
            local profileRoot =
                State.Profile.root
            local tooltip =
                profileRoot
                and profileRoot:FindFirstChild(
                    "SV_TotalBreakdownTooltip"
                )
            if tooltip then
                tooltip:Destroy()
            end
        end
    )
end
State.Profile.UpdateSummaryUI = function(
    total,
    partial,
    username,
    info
)
    local profileRoot =
        State.Profile.root
    if not profileRoot
        or not profileRoot.Parent then
        return
    end
    local main =
        profileRoot:FindFirstChild("Main")
    if not main then
        return
    end
    info = info or {}
    State.Profile.summaryDisplay = {
        username = username,
        total = total or 0,
        partial = partial == true,
        stale = info.stale == true,
        source = info.source,
        breakdownValues =
            info.breakdownValues
            or {},
    }
    local stalePrefix =
        info.stale
        and "~"
        or ""
    local valueText =
        partial and (tonumber(total) or 0) == 0
        and (stalePrefix .. "?")
        or (
            stalePrefix
            .. formatCompact(total or 0)
            .. (partial and "+" or "")
        )
    local color =
        info.stale
        and THEME.muted
        or (
            partial and (tonumber(total) or 0) == 0
            and THEME.yellow
            or State.Profile.ColorForValue(total)
        )
    for _, tabName in ipairs({
        "Weapons",
        "Pets",
    }) do
        local section =
            main:FindFirstChild(tabName)
        if section then
            local totalLabel =
                State.Profile.MakeSummaryLabel(
                    section,
                    "SV_ProfileTotal"
                )
            if totalLabel then
                State.Profile.AttachSummaryHover(
                    totalLabel
                )
                totalLabel.Text =
                    "Total Value: " .. valueText
                totalLabel.TextColor3 = color
                local stroke =
                    totalLabel:FindFirstChildOfClass(
                        "UIStroke"
                    )
                if stroke then
                    stroke.Color = color
                end
            end
        end
    end
end
State.Profile.QueueVisibleRemoteRefresh = function()
    State.Profile.visibleRemoteGeneration =
        State.Profile.visibleRemoteGeneration
        + 1
    local generation =
        State.Profile.visibleRemoteGeneration
    task.delay(0.04, function()
        if Destroyed
            or generation
                ~= State.Profile
                    .visibleRemoteGeneration then
            return
        end
        local username =
            State.Profile.GetUsername()
        if not username
            or username == "" then
            return
        end
        local target =
            Players:FindFirstChild(username)
        if not target then
            for _, player in ipairs(
                Players:GetPlayers()
            ) do
                if normalize(player.Name)
                        == normalize(username)
                    or normalize(
                        player.DisplayName
                    ) == normalize(username) then
                    target = player
                    break
                end
            end
        end
        if not target then
            return
        end
        local fetch =
            State.Profile
                .FetchRemoteTotalForPlayer
        if type(fetch) ~= "function" then
            return
        end
        task.spawn(function()
            local ok = fetch(target, true)
            if ok then
                State.Profile
                    .RefreshLeaderboardBadges()
            end
        end)
    end)
end
State.Profile.DecorateLeaderboardFor = function(
    username,
    info
)
    if not username
        or not info
        or not State.MainGUI
        or not State.MainGUI.Parent then
        return 0
    end
    local container =
        safeFindPath(
            State.MainGUI,
            {
                "Game",
                "Leaderboard",
                "Container",
            }
        )
    if not container then
        return 0
    end
    local row =
        container:FindFirstChild(username)
    if not row then
        local normalizedUsername =
            normalize(username)
        for _, child in ipairs(
            container:GetChildren()
        ) do
            if normalize(child.Name)
                == normalizedUsername then
                row = child
                break
            end
        end
    end
    if not row then
        return 0
    end
    local playerLabel =
        row:FindFirstChild("PlayerLabel")
    if not playerLabel
        or not (
            playerLabel:IsA("TextLabel")
            or playerLabel:IsA("TextButton")
        ) then
        return 0
    end
    local oldPill =
        playerLabel:FindFirstChild(
            "SV_ProfileValuePill"
        )
    if oldPill then
        oldPill:Destroy()
    end
    local stalePrefix =
        info.stale
        and "~"
        or ""
    local display =
        info.partial
            and (tonumber(info.total) or 0) == 0
        and (stalePrefix .. "?")
        or (
            stalePrefix
            .. formatCompact(
                info.total or 0
            )
            .. (
                info.partial
                and "+"
                or ""
            )
        )
    local color =
        info.stale
        and THEME.muted
        or (
            info.partial
                and (tonumber(info.total) or 0) == 0
            and THEME.yellow
            or State.Profile.ColorForValue(
                info.total
            )
        )
    local valueLabel =
        playerLabel:FindFirstChild(
            "SV_LeaderboardValue"
        )
    local added = 0
    if not valueLabel
        or not valueLabel:IsA("TextLabel") then
        if valueLabel then
            valueLabel:Destroy()
        end
        valueLabel = create("TextLabel", {
            Name =
                "SV_LeaderboardValue",
            AnchorPoint =
                Vector2.new(1, 0.5),
            Position =
                UDim2.new(
                    0,
                    -4,
                    0.5,
                    0
                ),
            Size =
                UDim2.fromOffset(
                    52,
                    22
                ),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = display,
            TextColor3 = color,
            TextSize = 15,
            TextStrokeColor3 =
                Color3.fromRGB(
                    5,
                    7,
                    10
                ),
            TextStrokeTransparency =
                0.10,
            Font =
                Enum.Font.ArialBold,
            TextXAlignment =
                Enum.TextXAlignment.Center,
            TextYAlignment =
                Enum.TextYAlignment.Center,
            ZIndex =
                math.max(
                    120,
                    playerLabel.ZIndex + 5
                ),
            Active = false,
        }, playerLabel)
        added = 1
    else
        valueLabel.Text = display
        valueLabel.TextColor3 = color
        valueLabel.BackgroundTransparency = 1
        valueLabel.TextSize = 15
        valueLabel.TextStrokeTransparency = 0.10
    end
    State.Profile.leaderboardBadges[
        playerLabel
    ] = {
        username = username,
        total = info.total,
    }
    return added
end
State.Profile.RefreshLeaderboardBadges = function()
    for username, info in pairs(
        State.Profile.totalsByName
    ) do
        State.Profile.DecorateLeaderboardFor(
            username,
            info
        )
    end
end
State.Profile.FindRemoteCardHint = function(
    username,
    itemType,
    displayName,
    frame
)
    if type(username) ~= "string"
        or username == ""
        or type(displayName) ~= "string"
        or displayName == "" then
        return nil
    end
    local targetPlayer =
        Players:FindFirstChild(
            username
        )
    if not targetPlayer then
        local normalizedUsername =
            normalize(username)
        local displayMatch = nil
        for _, player in ipairs(
            Players:GetPlayers()
        ) do
            if normalize(player.Name)
                == normalizedUsername then
                targetPlayer = player
                break
            end
            if normalize(
                player.DisplayName
            ) == normalizedUsername then
                if displayMatch then
                    displayMatch = false
                elseif displayMatch
                    ~= false then
                    displayMatch = player
                end
            end
        end
        if not targetPlayer
            and displayMatch
            and displayMatch ~= false then
            targetPlayer =
                displayMatch
        end
    end
    if not targetPlayer then
        return nil
    end
    local allHints =
        State.Profile
            .remoteCardHintsByUserId[
                targetPlayer.UserId
            ]
    if type(allHints)
        ~= "table" then
        return nil
    end
    local hints =
        allHints[
            itemType == "Pets"
            and "Pets"
            or "Weapons"
        ]
    if type(hints)
        ~= "table" then
        return nil
    end
    local function simpleName(value)
        local name =
            normalize(value or "")
        name =
            name:gsub(
                "%s*%(knife%)%s*$",
                ""
            )
        name =
            name:gsub(
                "%s*%(gun%)%s*$",
                ""
            )
        name =
            name:gsub(
                "%s*%(%d%d%d%d%)%s*$",
                ""
            )
        return trim(name)
    end
    local visibleName =
        normalize(displayName)
    local visibleSimple =
        simpleName(displayName)
    local matches = {}
    local function addMatch(hint)
        for _, existing in ipairs(
            matches
        ) do
            if existing.itemId
                    == hint.itemId
                and existing.record
                    == hint.record then
                return
            end
        end
        table.insert(
            matches,
            hint
        )
    end
    for _, hint in ipairs(hints) do
        local record =
            hint.record
        if type(record) == "table" then
            local recordName =
                normalize(
                    record.name
                    or ""
                )
            local recordSimple =
                simpleName(
                    record.name
                )
            local idBase =
                select(
                    1,
                    parseInternalItemIdHints(
                        hint.itemId
                    )
                )
            local idSimple =
                simpleName(idBase)
            if visibleName ~= ""
                and (
                    recordName
                        == visibleName
                    or recordSimple
                        == visibleSimple
                    or (
                        idSimple ~= ""
                        and idSimple
                            == visibleSimple
                    )
                ) then
                addMatch(hint)
            end
        end
    end
    if #matches == 0 then
        return nil
    end
    if #matches > 1 then
        local exact = {}
        for _, hint in ipairs(matches) do
            if normalize(
                hint.record
                and hint.record.name
                or ""
            ) == visibleName then
                table.insert(
                    exact,
                    hint
                )
            end
        end
        if #exact > 0 then
            matches = exact
        end
    end
    if #matches > 1
        and frame then
        local rarity =
            State.GetCardRarityHint(
                frame
            )
        local preferredCategory =
            State.GameRarityToSupremeCategory(
                rarity
            )
        if preferredCategory then
            local rarityMatches = {}
            for _, hint in ipairs(
                matches
            ) do
                if normalizeCategory(
                    hint.record
                    and hint.record.category
                    or ""
                ) == preferredCategory then
                    table.insert(
                        rarityMatches,
                        hint
                    )
                end
            end
            if #rarityMatches > 0 then
                matches =
                    rarityMatches
            end
        end
    end
    if #matches > 1
        and frame then
        local visibleQuantity =
            getAmountFromCard(
                frame
            )
        if visibleQuantity then
            local quantityMatches = {}
            for _, hint in ipairs(
                matches
            ) do
                if tonumber(
                    hint.quantity
                ) == tonumber(
                    visibleQuantity
                ) then
                    table.insert(
                        quantityMatches,
                        hint
                    )
                end
            end
            if #quantityMatches > 0 then
                matches =
                    quantityMatches
            end
        end
    end
    if #matches ~= 1 then
        return nil
    end
    return matches[1]
end
State.Profile.ScanRoot = function(root, itemType, username)
    local result = {
        cardsSeen = 0,
        resolved = 0,
        numericTotal = 0,
        nonNumericUnits = 0,
        unresolved = 0,
        numericContributions = {},
    }
    if not CONFIG.ValueBadgeOnProfile
        or not SupremeDatabase
        or not root
        or not root.Parent then
        return result
    end
    for _, descendant in ipairs(
        root:GetDescendants()
    ) do
        if descendant:IsA("GuiObject")
            and looksLikeItemCard(descendant)
            and not isInsideInjectedUi(
                descendant,
                root
            ) then
            local displayName =
                getTextFromItemName(
                    descendant
                )
                or getLooseCardDisplayName(
                    descendant
                )
            local normalizedName =
                normalize(displayName or "")
            if normalizedName ~= ""
                and normalizedName ~= "loading"
                and normalizedName ~= "loading..." then
                result.cardsSeen =
                    result.cardsSeen + 1
                local cardOptions = {
                    itemType = itemType,
                    displayName = displayName,
                    showValue = true,
                    showInfo = CONFIG.StatsButtons,
                    compactMode = true,
                    allowLooseCard = false,
                    requireTrustedResolution =
                        CONFIG.ProfileRequireTrustedMatches,
                }
                local record =
                    decorateCard(
                        descendant,
                        cardOptions
                    )
                if not record
                    and username then
                    local remoteHint =
                        State.Profile
                            .FindRemoteCardHint(
                                username,
                                itemType,
                                displayName,
                                descendant
                            )
                    if remoteHint
                        and remoteHint.record then
                        cardOptions.itemId =
                            remoteHint.itemId
                        cardOptions.record =
                            remoteHint.record
                        record =
                            decorateCard(
                                descendant,
                                cardOptions
                            )
                    end
                end
                if record then
                    result.resolved =
                        result.resolved + 1
                    local quantity =
                        getAmountFromCard(
                            descendant
                        )
                        or 1
                    local unitValue =
                        numericValue(
                            record.data
                        )
                    if unitValue then
                        result.numericTotal =
                            result.numericTotal
                            + (
                                unitValue
                                * quantity
                            )
                        for _ = 1, math.min(
                            math.max(
                                1,
                                math.floor(quantity)
                            ),
                            200
                        ) do
                            table.insert(
                                result.numericContributions,
                                unitValue
                            )
                        end
                    else
                        result.nonNumericUnits =
                            result.nonNumericUnits
                            + quantity
                    end
                else
                    result.unresolved =
                        result.unresolved + 1
                end
            end
        end
    end
    return result
end
State.Profile.Scan = function()
    if Destroyed
        or not CONFIG.ValueBadgeOnProfile
        or not SupremeDatabase then
        return
    end
    local profileRoot =
        State.Profile.GetRoots()
    if not profileRoot
        or not profileRoot.Parent then
        return
    end
    local username =
        State.Profile.GetUsername()
    State.Profile.currentUsername =
        username
    local weapons =
        State.Profile.ScanRoot(
            State.Profile.weaponItems,
            "Weapons",
            username
        )
    local pets =
        State.Profile.ScanRoot(
            State.Profile.petItems,
            "Pets",
            username
        )
    local visibleTotal =
        weapons.numericTotal
        + pets.numericTotal
    local visiblePartial =
        weapons.nonNumericUnits > 0
        or pets.nonNumericUnits > 0
        or weapons.unresolved > 0
        or pets.unresolved > 0
        or weapons.cardsSeen == 0
        or pets.cardsSeen == 0
    local breakdownValues = {}
    for _, value in ipairs(
        weapons.numericContributions
        or {}
    ) do
        table.insert(
            breakdownValues,
            value
        )
    end
    for _, value in ipairs(
        pets.numericContributions
        or {}
    ) do
        table.insert(
            breakdownValues,
            value
        )
    end
    local verifiedInfo =
        username
        and State.Profile.totalsByName[
            username
        ]
        or nil
    if verifiedInfo
        and verifiedInfo.source
            ~= "GetFullInventoryVerified" then
        verifiedInfo = nil
    end
    local displayInfo =
        verifiedInfo
        or {
            total = visibleTotal,
            partial = visiblePartial,
            cards =
                weapons.cardsSeen
                + pets.cardsSeen,
            resolved =
                weapons.resolved
                + pets.resolved,
            unresolved =
                weapons.unresolved
                + pets.unresolved,
            source =
                "VisibleProfileTemporary",
            breakdownValues =
                breakdownValues,
        }
    State.Profile.UpdateSummaryUI(
        displayInfo.total,
        displayInfo.partial,
        username,
        displayInfo
    )
end
State.Profile.QueueScan = function()
    State.Profile.scanGeneration =
        State.Profile.scanGeneration + 1
    local generation =
        State.Profile.scanGeneration
    for _, delaySeconds in ipairs({
        0,
        0.06,
        0.16,
        0.35,
    }) do
        task.delay(delaySeconds, function()
            if Destroyed
                or generation
                    ~= State.Profile.scanGeneration then
                return
            end
            State.Profile.Scan()
        end)
    end
end
State.Profile.Bind = function()
    State.Profile.Disconnect()
    local profileRoot =
        State.Profile.GetRoots()
    if not profileRoot then
        return false
    end
    local function keep(connection)
        -- Profile.Bind owns these connections exclusively. Keeping them out of the
        -- root bag avoids retaining disconnected RBXScriptConnection objects forever
        -- across profile rebinds.
        table.insert(State.Profile.connections, connection)
    end
    if profileRoot:IsA("GuiObject") then
        keep(
            profileRoot:GetPropertyChangedSignal(
                "Visible"
            ):Connect(function()
                if profileRoot.Visible then
                    State.Profile.QueueScan()
                    State.Profile.QueueVisibleRemoteRefresh()
                end
            end)
        )
    end
    keep(
        profileRoot.DescendantAdded:Connect(
            function(descendant)
                if isInsideInjectedUi(
                    descendant,
                    profileRoot
                ) then
                    return
                end
                local path =
                    normalize(
                        descendant:GetFullName()
                    )
                if path:find(
                    "viewprofile.main.weapons",
                    1,
                    true
                )
                    or path:find(
                        "viewprofile.main.pets",
                        1,
                        true
                    ) then
                    State.Profile.QueueScan()
                end
            end
        )
    )
    local main =
        profileRoot:FindFirstChild("Main")
    local nav =
        profileRoot:FindFirstChild("Nav")
    if main then
        for _, tabName in ipairs({
            "Weapons",
            "Pets",
        }) do
            local section =
                main:FindFirstChild(tabName)
            if section
                and section:IsA("GuiObject") then
                keep(
                    section:GetPropertyChangedSignal(
                        "Visible"
                    ):Connect(function()
                        if section.Visible then
                            State.Profile.QueueScan()
                        end
                    end)
                )
                local title =
                    section:FindFirstChild("Title")
                local username =
                    title
                    and title:FindFirstChild(
                        "Username"
                    )
                if username
                    and username:IsA("TextLabel") then
                    keep(
                        username:GetPropertyChangedSignal(
                            "Text"
                        ):Connect(function()
                            State.Profile.QueueScan()
                            State.Profile.QueueVisibleRemoteRefresh()
                        end)
                    )
                end
            end
        end
    end
    if nav then
        for _, tabName in ipairs({
            "Weapons",
            "Pets",
        }) do
            local button =
                nav:FindFirstChild(tabName)
            if button
                and button:IsA("GuiButton") then
                keep(
                    button.MouseButton1Click:Connect(
                        function()
                            State.Profile.QueueScan()
                        end
                    )
                )
            end
        end
    end
    local leaderboardContainer =
        State.MainGUI
        and safeFindPath(
            State.MainGUI,
            {
                "Game",
                "Leaderboard",
                "Container",
            }
        )
        or nil
    if leaderboardContainer then
        keep(
            leaderboardContainer.ChildAdded:Connect(
                function(row)
                    task.delay(0.03, function()
                        if Destroyed
                            or not row.Parent then
                            return
                        end
                        local player =
                            Players:FindFirstChild(
                                row.Name
                            )
                        local cached =
                            State.Profile.totalsByName[
                                row.Name
                            ]
                        if cached then
                            State.Profile
                                .DecorateLeaderboardFor(
                                    row.Name,
                                    cached
                                )
                        elseif player
                            and State.Profile
                                .FetchRemoteTotalForPlayer then
                            task.spawn(function()
                                local ok =
                                    State.Profile
                                        .FetchRemoteTotalForPlayer(
                                            player
                                        )
                                if ok then
                                    State.Profile
                                        .DecorateLeaderboardFor(
                                            player.Name,
                                            State.Profile
                                                .totalsByName[
                                                    player.Name
                                                ]
                                        )
                                end
                            end)
                        end
                    end)
                end
            )
        )
    end
    State.Profile.QueueScan()
    State.Profile.QueueVisibleRemoteRefresh()
    State.Profile.RefreshLeaderboardBadges()
    return true
end
State.Profile.RemovePlayerCache = function(player)
    if not player then
        return
    end
    State.Profile.totalsByName[
        player.Name
    ] = nil
    State.Profile.remoteCardHintsByUserId[
        player.UserId
    ] = nil
    local remoteState =
        State.Profile.remoteTotals
    remoteState.rawByUserId[
        player.UserId
    ] = nil
    remoteState.lastSuccessByUserId[
        player.UserId
    ] = nil
    remoteState.failureCountByUserId[
        player.UserId
    ] = nil
    remoteState.retryAfterByUserId[
        player.UserId
    ] = nil
    local inFlight =
        remoteState.inFlightByUserId[
            player.UserId
        ]
    if inFlight then
        inFlight.expired = true
        remoteState.inFlightByUserId[
            player.UserId
        ] = nil
    end
    for label, info in pairs(
        State.Profile.leaderboardBadges
    ) do
        if info
            and normalize(
                info.username or ""
            ) == normalize(player.Name) then
            if label
                and label.Parent then
                for _, valueName in ipairs({
                    "SV_LeaderboardValue",
                    "SV_ProfileValuePill",
                }) do
                    local valueLabel =
                        label:FindFirstChild(
                            valueName
                        )
                    if valueLabel then
                        pcall(function()
                            valueLabel:Destroy()
                        end)
                    end
                end
            end
            State.Profile.leaderboardBadges[
                label
            ] = nil
        end
    end
end
State.InventoryDescendantConnection = nil
State.TradeEnabledConnection = nil
local function disconnectExactTradeInventoryConnections()
    for _, connection in ipairs(
        State.TradeInventoryConnections
    ) do
        pcall(function()
            connection:Disconnect()
        end)
    end
    State.TradeInventoryConnections = {}
end
local function queueTradeInventoryPopulationRefresh()
    State.TradeInventoryRefreshGeneration =
        State.TradeInventoryRefreshGeneration + 1
    local generation =
        State.TradeInventoryRefreshGeneration
    task.delay(0.18, function()
        if Destroyed
            or generation ~= State.TradeInventoryRefreshGeneration then
            return
        end
        if State.CurrentTrade
            and isTradeVisible() then
            scheduleTradeRefresh(0)
        end
    end)
end
local function bindTradeInventoryRoot(root, itemType)
    if not root then
        return
    end
    local added =
        root.ChildAdded:Connect(function(child)
            if not SupremeDatabase
                or isInsideInjectedUi(child, root) then
                return
            end
            task.defer(function()
                if Destroyed
                    or not child
                    or not child.Parent
                    or not child:IsA("GuiObject")
                    or not looksLikeTradeInventoryCardLoose(child) then
                    return
                end
                local resolvedType,
                    itemId,
                    displayName =
                    classifyTradeCard(
                        child,
                        itemType
                    )
                if resolvedType then
                    decorateCard(child, {
                        itemId = itemId,
                        itemType = resolvedType,
                        displayName = displayName,
                        showValue = CONFIG.ValueBadgeOnTrade,
                        showInfo = CONFIG.StatsButtons,
                        compactMode = true,
                        allowLooseCard = true,
                    })
                    queueTradeInventoryPopulationRefresh()
                end
            end)
        end)
    local removed =
        root.ChildRemoved:Connect(function(child)
            if isInsideInjectedUi(child, root) then
                return
            end
            queueTradeInventoryPopulationRefresh()
        end)
    table.insert(
        State.TradeInventoryConnections,
        added
    )
    table.insert(
        State.TradeInventoryConnections,
        removed
    )
end
reconnectGuiWatchers = function()
    if State.InventoryDescendantConnection then
        pcall(function()
            State.InventoryDescendantConnection:Disconnect()
        end)
        State.InventoryDescendantConnection = nil
    end
    if State.TradeEnabledConnection then
        pcall(function()
            State.TradeEnabledConnection:Disconnect()
        end)
        State.TradeEnabledConnection = nil
    end
    disconnectExactTradeInventoryConnections()
    discoverMainGui()
    discoverTradeGui()
    if State.InventoryRoot then
        State.InventoryDescendantConnection =
            State.InventoryRoot.DescendantAdded:Connect(function(descendant)
                if not SupremeDatabase
                    or isInsideInjectedUi(
                        descendant,
                        State.InventoryRoot
                    ) then
                    return
                end
                local card =
                    findItemCardFromDescendant(
                        descendant,
                        State.InventoryRoot
                    )
                if card then
                    queueCardDecoration(card, {
                        showValue = CONFIG.ValueBadgeOnInventory,
                        showInfo = CONFIG.StatsButtons,
                        compactMode = false,
                    })
                end
            end)
        table.insert(
            Connections,
            State.InventoryDescendantConnection
        )
    end
    if State.TradeGui then
        for _, discovered in ipairs(
            State.TradeInventoryRoots
        ) do
            bindTradeInventoryRoot(
                discovered.root,
                discovered.itemType
            )
        end
        if State.TradeGui.Name == "Trade" then
            State.TradeEnabledConnection =
                State.TradeGui:GetPropertyChangedSignal(
                    "Enabled"
                ):Connect(function()
                    if State.TradeGui.Enabled then
                        TradePanel.Visible =
                            CONFIG.TradePanel
                            and not State.AutoTrader.BackgroundSuppressed
                        task.delay(0.06, function()
                            if Destroyed then
                                return
                            end
                            recoverTradeStatus()
                            scheduleTradeRefresh(0.08)
                        end)
                    else
                        State.CurrentTrade = nil
                        State.TradeHelperGeneration =
                            State.TradeHelperGeneration + 1
                        TradePanel.Visible = false
                        clearAllTradeHighlights()
                        State.AutoTrader.OnNoTrade()
                    end
                end)
            table.insert(
                Connections,
                State.TradeEnabledConnection
            )
        end
    end
end
connect(PlayerGui.ChildAdded, function(child)
    if child.Name == "MainGUI" then
        task.delay(0.12, function()
            if Destroyed then
                return
            end
            reconnectGuiWatchers()
            scanInventoryCards()
            State.Profile.Bind()
            State.Profile.QueueRemoteLeaderboardSweep()
        end)
    elseif child.Name == "Trade"
        and child:IsA("ScreenGui") then
        task.delay(0.12, function()
            if Destroyed then
                return
            end
            reconnectGuiWatchers()
            if child.Enabled then
                recoverTradeStatus()
                scheduleTradeRefresh(0.08)
            end
        end)
    end
end)
connect(
    Players.PlayerAdded,
    function(player)
        for _, delaySeconds in ipairs({
            0.15,
            0.45,
            0.90,
            1.50,
            2.40,
            3.30,
            4.10,
        }) do
            task.delay(delaySeconds, function()
                if Destroyed
                    or not player.Parent then
                    return
                end
                local cached =
                    State.Profile.totalsByName[
                        player.Name
                    ]
                if cached
                    and cached.source
                        == "GetFullInventoryVerified" then
                    State.Profile.DecorateLeaderboardFor(
                        player.Name,
                        cached
                    )
                    return
                end
                local ok =
                    State.Profile.FetchRemoteTotalForPlayer(
                        player
                    )
                if ok then
                    State.Profile.RefreshLeaderboardBadges()
                end
            end)
        end
    end
)
connect(
    Players.PlayerRemoving,
    function(player)
        State.Profile.RemovePlayerCache(
            player
        )
    end
)
connect(
    LocalPlayer.CharacterAdded,
    function()
        for _, delaySeconds in ipairs({
            0.35,
            0.85,
            1.50,
        }) do
            task.delay(delaySeconds, function()
                if Destroyed then
                    return
                end
                discoverMainGui()
                State.Profile.Bind()
            end)
        end
    end
)
local function removeInjectedChildren()
    local maintenanceRoot =
        PlayerGui:FindFirstChild(
            "SV_PC_Maintenance"
        )
    for _, descendant in ipairs(
        PlayerGui:GetDescendants()
    ) do
        local insideMaintenance =
            maintenanceRoot
            and (
                descendant
                    == maintenanceRoot
                or descendant:IsDescendantOf(
                    maintenanceRoot
                )
            )
        if descendant
                ~= UI.RootGui
            and not insideMaintenance
            and descendant.Name
            and descendant.Name:sub(
                1,
                3
            ) == "SV_" then
            pcall(function()
                descendant:Destroy()
            end)
        end
    end
end
State.Profile.ResolveRemoteInventoryItem = function(
    itemId,
    itemType,
    quantity
)
    if type(itemId) ~= "string"
        or itemId == "" then
        return nil
    end
    local normalizedId =
        normalize(itemId)
    if normalizedId == ""
        or normalizedId == "weapons"
        or normalizedId == "pets"
        or normalizedId == "inventory"
        or normalizedId == "items"
        or normalizedId == "current"
        or normalizedId == "classic"
        or normalizedId == "holiday"
        or normalizedId == "holidays"
        or normalizedId == "halloween"
        or normalizedId == "christmas"
        or normalizedId == "seasonal"
        or normalizedId == "season1"
        or normalizedId == "season2"
        or normalizedId == "equipped"
        or normalizedId == "default"
        or normalizedId == "owned"
        or normalizedId == "slots"
        or normalizedId == "converted"
        or normalizedId == "defaultgun"
        or normalizedId == "defaultknife" then
        return nil
    end
    local record,
        reason,
        resolutionMeta =
        resolveGameItem(
            itemId,
            itemType,
            itemId
        )
    local trusted =
        not CONFIG.ProfileRequireTrustedMatches
        or not resolutionMeta
        or resolutionMeta.trusted
            ~= false
    local remoteExactUnique = false
    if record
        and not trusted
        and resolutionMeta
        and tonumber(
            resolutionMeta.candidateCount
        ) == 1 then
        local rawIdName =
            normalize(itemId)
        local supremeName =
            normalize(
                record.name
                or ""
            )
        if rawIdName ~= ""
            and rawIdName == supremeName then
            remoteExactUnique = true
            trusted = true
        end
    end
    if not record
        or not trusted then
        return {
            itemId = itemId,
            itemType = itemType,
            quantity = quantity or 1,
            resolved = false,
            reason =
                not trusted
                and "WEAK_MATCH"
                or reason,
            suggestedRecord =
                record,
            resolutionMeta =
                resolutionMeta,
        }
    end
    local unitValue =
        numericValue(
            record.data
        )
    local returnedMeta =
        resolutionMeta
    if remoteExactUnique then
        returnedMeta = {}
        if type(resolutionMeta)
            == "table" then
            for key, value in pairs(
                resolutionMeta
            ) do
                returnedMeta[key] =
                    value
            end
        end
        returnedMeta.trusted = true
        returnedMeta.level =
            "remote-exact-unique"
        returnedMeta.source =
            "GetFullInventory exact unique name"
    end
    return {
        itemId = itemId,
        itemType = itemType,
        quantity = quantity or 1,
        resolved = true,
        record = record,
        unitValue = unitValue,
        resolutionMeta =
            returnedMeta,
    }
end
State.Profile.CalculateRemoteSection = function(
    section,
    itemType,
    seenQuantities
)
    local result = {
        total = 0,
        partial = false,
        resolvedItems = 0,
        resolvedUnits = 0,
        unresolvedLeaves = 0,
        nonNumericUnits = 0,
        samples = {},
        numericContributions = {},
        cardHints = {},
        unresolvedAll = {},
    }
    if type(section) ~= "table" then
        result.partial = true
        return result
    end
    local visited = setmetatable(
        {},
        {__mode = "k"}
    )
    local nodeCount = 0
    local function addResult(
        itemId,
        quantity
    )
        quantity = tonumber(quantity) or 1
        if quantity <= 0 then
            return false
        end
        if quantity > 10000 then
            return false
        end
        if type(seenQuantities)
            == "table" then
            local seenKey =
                tostring(itemType)
                .. "|"
                .. tostring(itemId)
            local previous =
                tonumber(
                    seenQuantities[
                        seenKey
                    ]
                )
                or 0
            if quantity <= previous then
                return true
            end
            seenQuantities[
                seenKey
            ] = quantity
            quantity =
                quantity
                - previous
        end
        local resolved =
            State.Profile.ResolveRemoteInventoryItem(
                tostring(itemId),
                itemType,
                quantity
            )
        if not resolved then
            return false
        end
        if resolved.resolved then
            table.insert(
                result.cardHints,
                {
                    itemId =
                        resolved.itemId,
                    itemType =
                        itemType,
                    quantity =
                        quantity,
                    record =
                        resolved.record,
                    resolutionMeta =
                        resolved.resolutionMeta,
                }
            )
            result.resolvedItems =
                result.resolvedItems + 1
            result.resolvedUnits =
                result.resolvedUnits
                + quantity
            if resolved.unitValue then
                result.total =
                    result.total
                    + (
                        resolved.unitValue
                        * quantity
                    )
                for _ = 1, math.min(
                    math.max(
                        1,
                        math.floor(quantity)
                    ),
                    200
                ) do
                    table.insert(
                        result.numericContributions,
                        resolved.unitValue
                    )
                end
            else
                result.nonNumericUnits =
                    result.nonNumericUnits
                    + quantity
                result.partial = true
            end
            if #result.samples < 30 then
                table.insert(
                    result.samples,
                    {
                        itemId = resolved.itemId,
                        quantity = quantity,
                        name =
                            resolved.record.name,
                        category =
                            resolved.record.category,
                        value =
                            resolved.record.data
                            and resolved.record.data.value,
                        numeric =
                            resolved.unitValue,
                        confidence =
                            resolved.resolutionMeta
                            and resolved.resolutionMeta.level,
                        yearNarrowed =
                            resolved.resolutionMeta
                            and resolved.resolutionMeta.yearNarrowed
                            or nil,
                    }
                )
            end
        else
            result.unresolvedLeaves =
                result.unresolvedLeaves + 1
            result.partial = true
            table.insert(
                result.unresolvedAll,
                {
                    itemId = resolved.itemId,
                    itemType = itemType,
                    quantity = quantity,
                    reason = resolved.reason,
                    suggested =
                        resolved.suggestedRecord
                        and resolved.suggestedRecord.name
                        or nil,
                    resolutionMeta =
                        resolved.resolutionMeta,
                }
            )
            if #result.samples < 30 then
                table.insert(
                    result.samples,
                    {
                        itemId = resolved.itemId,
                        quantity = quantity,
                        unresolved = true,
                        reason =
                            resolved.reason,
                        suggested =
                            resolved.suggestedRecord
                            and resolved.suggestedRecord.name
                            or nil,
                        confidence =
                            resolved.resolutionMeta
                            and resolved.resolutionMeta.level,
                        yearNarrowed =
                            resolved.resolutionMeta
                            and resolved.resolutionMeta.yearNarrowed
                            or nil,
                    }
                )
            end
        end
        return true
    end
    local function walk(
        node,
        depth,
        parentKey
    )
        if depth > 5
            or nodeCount > 2500 then
            result.partial = true
            return
        end
        if type(node) ~= "table" then
            return
        end
        if visited[node] then
            return
        end
        visited[node] = true
        nodeCount = nodeCount + 1
        local objectId =
            node.ItemId
            or node.ItemID
            or node.itemId
            or node.itemID
            or node.ID
            or node.Id
            or node.id
            or node.Name
            or node.name
        local objectQuantity =
            node.Amount
            or node.amount
            or node.Quantity
            or node.quantity
            or node.Count
            or node.count
            or node.Owned
            or node.owned
        if type(objectId) == "string"
            and objectQuantity ~= nil
            and tonumber(objectQuantity) then
            if addResult(
                objectId,
                objectQuantity
            ) then
                visited[node] = nil
                return
            end
        end
        for key, value in pairs(node) do
            if type(key) == "string"
                and type(value) == "number" then
                addResult(key, value)
            elseif type(key) == "string"
                and type(value) == "boolean" then
                if value then
                    addResult(key, 1)
                end
            elseif type(value) == "string"
                and type(key) == "number" then
                addResult(value, 1)
            elseif type(value) == "table" then
                local nestedQuantity =
                    value.Amount
                    or value.amount
                    or value.Quantity
                    or value.quantity
                    or value.Count
                    or value.count
                    or value.Owned
                    or value.owned
                local handled = false
                if type(key) == "string"
                    and tonumber(nestedQuantity) then
                    handled =
                        addResult(
                            key,
                            nestedQuantity
                        )
                end
                if not handled then
                    walk(
                        value,
                        depth + 1,
                        key
                    )
                end
            end
        end
        visited[node] = nil
    end
    walk(section, 0, nil)
    return result
end
State.Profile.CalculateRemoteInventory = function(data)
    if type(data) ~= "table" then
        return nil, "not_table"
    end
    local inventory = type(data.Inventory) == "table" and data.Inventory or nil
    local weaponSections = {}
    local petSections = {}
    local seenSectionTables = setmetatable({}, {__mode = "k"})
    local excludedSectionNames = {
        userid = true,
        userId = true,
        playerid = true,
        playerId = true,
        inventory = true,
        currencies = true,
        currency = true,
        coins = true,
        gems = true,
        emotes = true,
        toys = true,
        effects = true,
        perks = true,
        powers = true,
        radios = true,
        settings = true,
        stats = true,
        metadata = true,
        profile = true,
        trades = true,
        offers = true,
        achievements = true,
        badges = true,
        titles = true,
        crafting = true,
        recipes = true,
        materials = true,
        crates = true,
        boxes = true,
        equipped = true,
        slots = true,
        converted = true,
    }
    local structuralNames = {
        weapons = true,
        weapon = true,
        pets = true,
        pet = true,
        items = true,
        current = true,
        owned = true,
        inventory = true,
        slots = true,
        converted = true,
        default = true,
        defaultgun = true,
        defaultknife = true,
    }
    local function addSection(target, candidate)
        if type(candidate) == "table" and not seenSectionTables[candidate] then
            seenSectionTables[candidate] = true
            table.insert(target, candidate)
        end
    end
    local function knownItemType(itemId)
        if type(itemId) ~= "string" and type(itemId) ~= "number" then
            return nil
        end
        local id = tostring(itemId)
        if id == "" or structuralNames[normalize(id)] then
            return nil
        end
        if State.Mapping.ItemLinks[
            State.Mapping.MakeItemKey("Weapons", id)
        ] then
            return "Weapons"
        end
        if State.Mapping.ItemLinks[
            State.Mapping.MakeItemKey("Pets", id)
        ] then
            return "Pets"
        end
        if getGameItemData("Weapons", id) then
            return "Weapons"
        end
        if getGameItemData("Pets", id) then
            return "Pets"
        end
        return nil
    end
    local function detectSectionType(candidate)
        if type(candidate) ~= "table" then
            return nil
        end
        local visited = setmetatable({}, {__mode = "k"})
        local checked = 0
        local weaponHits = 0
        local petHits = 0
        local function walk(node, depth)
            if depth > 4 or checked >= 24 or visited[node] then
                return
            end
            visited[node] = true
            for key, value in pairs(node) do
                if checked >= 24 then
                    break
                end
                local candidateId = nil
                if type(value) == "table" then
                    candidateId =
                        value.ItemID
                        or value.ItemId
                        or value.DataID
                        or value.DataId
                        or value.ID
                        or value.Id
                end
                if candidateId == nil
                    and (type(key) == "string" or type(key) == "number")
                    and not structuralNames[normalize(key)] then
                    candidateId = key
                end
                if candidateId ~= nil then
                    checked = checked + 1
                    local itemType = knownItemType(candidateId)
                    if itemType == "Weapons" then
                        weaponHits = weaponHits + 1
                    elseif itemType == "Pets" then
                        petHits = petHits + 1
                    end
                end
                if type(value) == "table" then
                    walk(value, depth + 1)
                end
            end
        end
        walk(candidate, 0)
        if weaponHits > petHits and weaponHits > 0 then
            return "Weapons"
        end
        if petHits > weaponHits and petHits > 0 then
            return "Pets"
        end
        return nil
    end
    local function considerNamedSection(name, candidate)
        if type(candidate) ~= "table" then
            return
        end
        local normalizedName = normalize(name)
        if excludedSectionNames[normalizedName] then
            return
        end
        if normalizedName == "pets" or normalizedName == "pet" then
            addSection(petSections, candidate)
            return
        end
        if normalizedName == "weapons"
            or normalizedName == "weapon"
            or normalizedName == "holiday"
            or normalizedName == "holidays"
            or normalizedName == "classic"
            or normalizedName == "season1"
            or normalizedName:find("halloween", 1, true)
            or normalizedName:find("christmas", 1, true)
            or normalizedName:find("season", 1, true) then
            addSection(weaponSections, candidate)
            return
        end
        local detected = detectSectionType(candidate)
        if detected == "Weapons" then
            addSection(weaponSections, candidate)
        elseif detected == "Pets" then
            addSection(petSections, candidate)
        end
    end
    considerNamedSection("Weapons", data.Weapons or data.weapons)
    considerNamedSection("Pets", data.Pets or data.pets)
    considerNamedSection("Holiday", data.Holiday or data.holiday)
    considerNamedSection("Holidays", data.Holidays or data.holidays)
    if inventory then
        considerNamedSection("Weapons", inventory.Weapons or inventory.weapons)
        considerNamedSection("Pets", inventory.Pets or inventory.pets)
        considerNamedSection("Holiday", inventory.Holiday or inventory.holiday)
        considerNamedSection("Holidays", inventory.Holidays or inventory.holidays)
    end
    for name, candidate in pairs(data) do
        if name ~= "Inventory"
            and name ~= "inventory"
            and name ~= "Weapons"
            and name ~= "weapons"
            and name ~= "Pets"
            and name ~= "pets"
            and name ~= "Holiday"
            and name ~= "holiday"
            and name ~= "Holidays"
            and name ~= "holidays" then
            considerNamedSection(name, candidate)
        end
    end
    if inventory then
        for name, candidate in pairs(inventory) do
            if name ~= "Weapons"
                and name ~= "weapons"
                and name ~= "Pets"
                and name ~= "pets"
                and name ~= "Holiday"
                and name ~= "holiday"
                and name ~= "Holidays"
                and name ~= "holidays" then
                considerNamedSection(name, candidate)
            end
        end
    end
    local function emptyResult()
        return {
            total = 0,
            partial = false,
            resolvedItems = 0,
            resolvedUnits = 0,
            unresolvedLeaves = 0,
            nonNumericUnits = 0,
            samples = {},
            numericContributions = {},
            cardHints = {},
            unresolvedAll = {},
        }
    end
    local function mergeResult(target, source)
        target.total = target.total + (source.total or 0)
        target.partial = target.partial or source.partial
        target.resolvedItems = target.resolvedItems + (source.resolvedItems or 0)
        target.resolvedUnits = target.resolvedUnits + (source.resolvedUnits or 0)
        target.unresolvedLeaves = target.unresolvedLeaves + (source.unresolvedLeaves or 0)
        target.nonNumericUnits = target.nonNumericUnits + (source.nonNumericUnits or 0)
        for _, value in ipairs(source.numericContributions or {}) do
            table.insert(target.numericContributions, value)
        end
        for _, hint in ipairs(source.cardHints or {}) do
            table.insert(target.cardHints, hint)
        end
        for _, miss in ipairs(source.unresolvedAll or {}) do
            table.insert(target.unresolvedAll, miss)
        end
        for _, sample in ipairs(source.samples or {}) do
            if #target.samples >= 30 then
                break
            end
            table.insert(target.samples, sample)
        end
    end
    local weaponResult = emptyResult()
    local petResult = emptyResult()
    local weaponSeenQuantities = {}
    local petSeenQuantities = {}
    if #weaponSections == 0 then
        weaponResult.partial = true
    else
        for _, candidate in ipairs(weaponSections) do
            mergeResult(
                weaponResult,
                State.Profile.CalculateRemoteSection(
                    candidate,
                    "Weapons",
                    weaponSeenQuantities
                )
            )
        end
    end
    if #petSections == 0 then
        petResult.partial = true
    else
        for _, candidate in ipairs(petSections) do
            mergeResult(
                petResult,
                State.Profile.CalculateRemoteSection(
                    candidate,
                    "Pets",
                    petSeenQuantities
                )
            )
        end
    end
    local total = weaponResult.total + petResult.total
    local breakdownValues = {}
    for _, value in ipairs(weaponResult.numericContributions or {}) do
        table.insert(breakdownValues, value)
    end
    for _, value in ipairs(petResult.numericContributions or {}) do
        table.insert(breakdownValues, value)
    end
    return {
        total = total,
        partial = weaponResult.partial or petResult.partial,
        weapons = weaponResult,
        pets = petResult,
        resolvedItems = weaponResult.resolvedItems + petResult.resolvedItems,
        resolvedUnits = weaponResult.resolvedUnits + petResult.resolvedUnits,
        breakdownValues = breakdownValues,
    }
end
State.Profile.ExtractReturnedUserId = function(data)
    if type(data) ~= "table" then
        return nil
    end
    local candidates = {
        data.userId,
        data.UserId,
        data.userid,
        data.UserID,
        data.playerId,
        data.PlayerId,
        data.playerID,
        data.PlayerID,
    }
    for _, value in ipairs(candidates) do
        local numeric = tonumber(value)
        if numeric
            and numeric > 0 then
            return math.floor(numeric)
        end
    end
    return nil
end
State.Profile.MarkRemoteFailure = function(player, reason)
    if not player then
        return
    end
    local userId = player.UserId
    local remoteState = State.Profile.remoteTotals
    remoteState.failureCountByUserId[userId] =
        (remoteState.failureCountByUserId[userId] or 0) + 1
    local cached = State.Profile.totalsByName[player.Name]
    local lastSuccess = remoteState.lastSuccessByUserId[userId]
    if cached
        and lastSuccess
        and os.clock() - lastSuccess >= CONFIG.RemoteStaleSeconds then
        cached.stale = true
        cached.lastFailureReason = tostring(reason or "refresh_failed")
        State.Profile.DecorateLeaderboardFor(player.Name, cached)
        if State.Profile.currentUsername
            and normalize(State.Profile.currentUsername) == normalize(player.Name) then
            State.Profile.UpdateSummaryUI(
                cached.total,
                cached.partial,
                player.Name,
                cached
            )
        end
    end
end
State.Profile.ApplyRemoteInventoryData = function(player, data, freshRemote)
    if Destroyed
        or not player
        or not player.Parent
        or type(data) ~= "table" then
        return false, "invalid_result"
    end
    local returnedUserId =
        State.Profile.ExtractReturnedUserId(data)
    if not returnedUserId then
        return false, "missing_identity"
    end
    if returnedUserId ~= player.UserId then
        return false, "identity_mismatch"
    end
    local calculated, reason =
        State.Profile.CalculateRemoteInventory(data)
    if not calculated then
        return false, reason or "calculate_failed"
    end
    local remoteState = State.Profile.remoteTotals
    if freshRemote then
        remoteState.rawByUserId[player.UserId] = data
        remoteState.lastSuccessByUserId[player.UserId] = os.clock()
        remoteState.failureCountByUserId[player.UserId] = 0
        remoteState.retryAfterByUserId[player.UserId] = nil
    end
    local remoteCardHints = {
        Weapons =
            calculated.weapons
            and calculated.weapons.cardHints
            or {},
        Pets =
            calculated.pets
            and calculated.pets.cardHints
            or {},
    }
    State.Profile.remoteCardHintsByUserId[player.UserId] =
        remoteCardHints
    local unresolvedUnits = 0
    local unresolvedLeaves = 0
    local nonNumericUnits = 0
    for _, section in ipairs({calculated.weapons, calculated.pets}) do
        if type(section) == "table" then
            unresolvedLeaves += math.max(0, tonumber(section.unresolvedLeaves) or 0)
            nonNumericUnits += math.max(0, tonumber(section.nonNumericUnits) or 0)
            for _, miss in ipairs(type(section.unresolvedAll) == "table" and section.unresolvedAll or {}) do
                unresolvedUnits += math.max(1, tonumber(miss.quantity) or 1)
            end
        end
    end
    if player == LocalPlayer
        and State.AutoTrader then
        State.AutoTrader.InventoryCache = nil
        State.AutoTrader.InventoryCacheStamp = nil
        State.AutoTrader.LastCalculationSignature = nil
        State.AutoTrader.PlanGeneration =
            State.AutoTrader.PlanGeneration + 1
        if UI.AutoTraderPanel
            and UI.AutoTraderPanel.Visible
            and State.AutoTrader.RebuildReserveList then
            task.defer(
                State.AutoTrader.RebuildReserveList
            )
        end
    end
    if calculated.weapons then
        calculated.weapons.cardHints = nil
        calculated.weapons.unresolvedAll = nil
    end
    if calculated.pets then
        calculated.pets.cardHints = nil
        calculated.pets.unresolvedAll = nil
    end
    local lastSuccess =
        remoteState.lastSuccessByUserId[player.UserId]
    local stale =
        lastSuccess ~= nil
        and os.clock() - lastSuccess >= CONFIG.RemoteStaleSeconds
    local previousInfo =
        State.Profile.totalsByName[
            player.Name
        ]
    local info = {
        total = calculated.total,
        partial = calculated.partial,
        cards = calculated.resolvedUnits,
        resolved = calculated.resolvedItems,
        resolvedUnits = calculated.resolvedUnits,
        unresolvedLeaves = unresolvedLeaves,
        unresolvedUnits = unresolvedUnits,
        nonNumericUnits = nonNumericUnits,
        updatedAt =
            freshRemote
            and os.time()
            or (
                previousInfo
                and previousInfo.updatedAt
                or os.time()
            ),
        source = "GetFullInventoryVerified",
        returnedUserId = returnedUserId,
        breakdownValues = calculated.breakdownValues or {},
        stale = stale,
    }
    State.Profile.totalsByName[player.Name] = info
    State.Profile.DecorateLeaderboardFor(player.Name, info)
    if State.Profile.currentUsername
        and normalize(State.Profile.currentUsername) == normalize(player.Name) then
        State.Profile.UpdateSummaryUI(
            info.total,
            info.partial,
            player.Name,
            info
        )
        State.Profile.QueueScan()
    end
    return true
end
State.Profile.RecalculateCachedRemoteTotals = function()
    if Destroyed or not SupremeDatabase then
        return
    end
    for _, player in ipairs(Players:GetPlayers()) do
        local raw =
            State.Profile.remoteTotals.rawByUserId[player.UserId]
        if type(raw) == "table" then
            pcall(
                State.Profile.ApplyRemoteInventoryData,
                player,
                raw,
                false
            )
        end
    end
    State.Profile.RefreshLeaderboardBadges()
end
State.Profile.GetRemoteInvokeLatencyStats = function()
    local rows = {}
    for _, value in ipairs(State.Profile.remoteTotals.invokeLatencies or {}) do table.insert(rows, tonumber(value) or 0) end
    table.sort(rows)
    local function pct(p)
        if #rows == 0 then return 0 end
        local index = math.max(1, math.min(#rows, math.ceil(#rows * p)))
        return rows[index]
    end
    return {count=#rows, p50=pct(0.50), p90=pct(0.90), p99=pct(0.99), max=rows[#rows] or 0}
end
State.Profile.FetchRemoteTotalForPlayer = function(player, force)
    if Destroyed or not SupremeDatabase or not player or not player.Parent then return false, "unavailable" end
    local remoteState = State.Profile.remoteTotals
    local userId = player.UserId
    local now = os.clock()
    if remoteState.circuitOpen or (State.AutoTrader and State.AutoTrader.RemoteInvokeCircuitOpen) then
        return false, "remote_circuit_open"
    end
    if (remoteState.liveInvokeCount or 0) >= CONFIG.AutoTraderRemoteInvokeMaxLive then
        return false, "global_in_flight"
    end
    local lastSuccess = remoteState.lastSuccessByUserId[userId]
    local userJitter = ((userId % 17) / 17 - 0.5) * 1.6
    if not force and lastSuccess and now - lastSuccess < CONFIG.PlayerValuesRefreshSeconds + userJitter then return true, "fresh" end
    local retryAfter = remoteState.retryAfterByUserId[userId]
    if retryAfter and now < retryAfter then return false, "cooldown" end
    if remoteState.inFlightByUserId[userId] then return false, remoteState.hungByUserId[userId] and "hung_in_flight" or "in_flight" end
    local remote = safeFindPath(ReplicatedStorage, {"Remotes", "Extras", "GetFullInventory"})
    if not remote or not remote:IsA("RemoteFunction") then State.Profile.MarkRemoteFailure(player, "remote_missing"); return false, "remote_missing" end
    remoteState.requestSerial += 1
    local request = {
        serial = remoteState.requestSerial, userId=userId, playerName=player.Name,
        startedAt=now, done=false, expired=false, ok=false, data=nil, hung=false,
    }
    remoteState.inFlightByUserId[userId] = request
    remoteState.liveInvokeCount = (remoteState.liveInvokeCount or 0) + 1
    if State.AutoTrader then State.AutoTrader.RemoteInvokeLive = remoteState.liveInvokeCount end
    task.spawn(function()
        local ok, data = pcall(function() return remote:InvokeServer(player) end)
        request.ok, request.data, request.done, request.finishedAt = ok, data, true, os.clock()
        local latency = request.finishedAt - request.startedAt
        table.insert(remoteState.invokeLatencies, latency)
        while #remoteState.invokeLatencies > 64 do table.remove(remoteState.invokeLatencies, 1) end
        remoteState.liveInvokeCount = math.max(0, (remoteState.liveInvokeCount or 1) - 1)
        if remoteState.inFlightByUserId[userId] == request then remoteState.inFlightByUserId[userId] = nil end
        if remoteState.hungByUserId[userId] == request then remoteState.hungByUserId[userId] = nil end
        local hung = 0
        for _ in pairs(remoteState.hungByUserId) do hung += 1 end
        if hung == 0 then
            remoteState.circuitOpen = false; remoteState.circuitOpenedAt = 0
            if State.AutoTrader then State.AutoTrader.RemoteInvokeCircuitOpen=false; State.AutoTrader.RemoteInvokeCircuitOpenedAt=0 end
        end
        if State.AutoTrader then
            State.AutoTrader.RemoteInvokeLive = remoteState.liveInvokeCount
            State.AutoTrader.HungRemoteInvokes = hung
            State.AutoTrader.LastRemoteInvokeLatency = latency
            State.AutoTrader.MaxRemoteInvokeLatency = math.max(State.AutoTrader.MaxRemoteInvokeLatency or 0, latency)
            if request.expired then State.AutoTrader.Log("remote_invoke_late_completion", {userId=userId,name=request.playerName,latency=latency,ok=ok}) end
        end
    end)
    local deadline = os.clock() + CONFIG.RemoteTimeoutSeconds
    while not request.done and not Destroyed and os.clock() < deadline do task.wait(0.05) end
    if Destroyed then request.expired = true; return false, "destroyed" end
    if not request.done then
        request.expired, request.hung = true, true
        remoteState.hungByUserId[userId] = request
        remoteState.circuitOpen, remoteState.circuitOpenedAt = true, os.clock()
        if State.AutoTrader then
            State.AutoTrader.RemoteInvokeTimeoutsThisServer = (State.AutoTrader.RemoteInvokeTimeoutsThisServer or 0) + 1
            State.AutoTrader.HungRemoteInvokes = (State.AutoTrader.HungRemoteInvokes or 0) + 1
            State.AutoTrader.RemoteInvokeCircuitOpen = true
            State.AutoTrader.RemoteInvokeCircuitOpenedAt = os.clock()
            State.AutoTrader.Log("remote_invoke_hung_circuit_open", {userId=userId,name=player.Name,serial=request.serial,timeout=CONFIG.RemoteTimeoutSeconds})
            if State.AutoTrader.Preferences and State.AutoTrader.Preferences.automation
                and not State.AutoTrader.TeleportInProgress and not State.AutoTrader.ServerHopInProgress then
                task.delay(CONFIG.AutoTraderRemoteInvokeHungRecoverySeconds, function()
                    if Destroyed then return end
                    if remoteState.hungByUserId[userId] == request and not request.done then
                        State.AutoTrader.RequestRecoveryTeleport("GetFullInventory invocation remained hung after timeout; remote circuit opened")
                    end
                end)
            end
        end
        local failures = (remoteState.failureCountByUserId[userId] or 0) + 1
        remoteState.retryAfterByUserId[userId] = os.clock() + math.min(120, 20 + failures * 10)
        State.Profile.MarkRemoteFailure(player, "timeout_hung")
        return false, "timeout_hung"
    end
    if not request.ok or type(request.data) ~= "table" then
        State.Profile.MarkRemoteFailure(player, request.ok and "non_table" or tostring(request.data))
        return false, "request_failed"
    end
    local applied, reason = State.Profile.ApplyRemoteInventoryData(player, request.data, true)
    if not applied then State.Profile.MarkRemoteFailure(player, reason); return false, reason end
    return true
end
State.Profile.QueueRemoteLeaderboardSweep = function(forceAll)
    if Destroyed or not SupremeDatabase then
        return
    end
    local remoteState = State.Profile.remoteTotals
    if forceAll then
        remoteState.forceSweep = true
    end
    if remoteState.running then
        remoteState.pendingSweep = true
        return
    end
    remoteState.generation = remoteState.generation + 1
    local generation = remoteState.generation
    local forceThisSweep = remoteState.forceSweep
    remoteState.forceSweep = false
    remoteState.running = true
    remoteState.pendingSweep = false
    task.spawn(function()
        pcall(function()
            local playerList = Players:GetPlayers()
            local currentUsername =
                normalize(State.Profile.currentUsername or "")
            table.sort(
                playerList,
                function(a, b)
                    local aCurrent =
                        currentUsername ~= ""
                        and normalize(a.Name) == currentUsername
                    local bCurrent =
                        currentUsername ~= ""
                        and normalize(b.Name) == currentUsername
                    if aCurrent ~= bCurrent then
                        return aCurrent
                    end
                    if (a == LocalPlayer) ~= (b == LocalPlayer) then
                        return a == LocalPlayer
                    end
                    local aLast =
                        remoteState.lastSuccessByUserId[a.UserId]
                        or -math.huge
                    local bLast =
                        remoteState.lastSuccessByUserId[b.UserId]
                        or -math.huge
                    return aLast < bLast
                end
            )
            for _, player in ipairs(playerList) do
                if Destroyed
                    or generation ~= remoteState.generation then
                    break
                end
                if player.Parent then
                    State.Profile.FetchRemoteTotalForPlayer(
                        player,
                        forceThisSweep
                    )
                end
                task.wait(0.045 + math.random() * 0.045)
            end
        end)
        if generation == remoteState.generation then
            remoteState.running = false
        end
        if not Destroyed then
            State.Profile.RefreshLeaderboardBadges()
        end
        if not Destroyed and remoteState.pendingSweep then
            remoteState.pendingSweep = false
            task.defer(function()
                State.Profile.QueueRemoteLeaderboardSweep(
                    remoteState.forceSweep
                )
            end)
        end
    end)
end
if State.Profile.remoteTotals
    .pendingNativeResweep then
    State.Profile.remoteTotals
        .pendingNativeResweep = false
    task.defer(function()
        if not Destroyed then
            State.Profile
                .QueueRemoteLeaderboardSweep()
        end
    end)
end
local Controller = {}
function Controller.Destroy()
    if Destroyed or HARDEN.destroying then return end
    HARDEN.destroying = true
    Destroyed = true -- stop periodic/new async work before any persistence begins
    State.TradeHelperGeneration += 1
    if State.AutoTrader then
        State.AutoTrader.PlanGeneration += 1
        State.AutoTrader.ActionGeneration += 1
        State.AutoTrader.AutoAcceptGeneration += 1
        State.AutoTrader.RequestConfirmGeneration += 1
        State.AutoTrader.PostTradeAuditGeneration += 1
        State.AutoTrader.ServerHopQueueGeneration += 1
        State.AutoTrader.IncomingRequestGeneration += 1
        if State.AutoTrader.RestoreTradeVisuals then pcall(State.AutoTrader.RestoreTradeVisuals) end
        State.AutoTrader.Log("controller_destroying", {external=externalOperationHealth(), persistence=HARDEN.persistenceHealth})
    end
    State.TradeInventoryRefreshGeneration += 1
    State.Profile.scanGeneration += 1
    State.Profile.visibleRemoteGeneration += 1
    State.Profile.remoteTotals.generation += 1
    for _, request in pairs(State.Profile.remoteTotals.inFlightByUserId) do request.expired = true end
    local persistenceResults = {}
    local pending = 0
    local function launch(name, fn)
        pending += 1
        task.spawn(function()
            local ok, result = pcall(fn)
            persistenceResults[name] = {ok=ok and result~=false, result=tostring(result)}
            pending -= 1
        end)
    end
    if State.AutoTrader then
        if State.AutoTrader.FlushTargetStats then launch("targetStats", State.AutoTrader.FlushTargetStats) end
        if State.AutoTrader.SaveRecentJobs then launch("recentJobs", State.AutoTrader.SaveRecentJobs) end
        if State.AutoTrader.SaveServerCandidateCache then launch("serverCache", State.AutoTrader.SaveServerCandidateCache) end
        if State.AutoTrader.FlushBotIconDb then launch("botDb", State.AutoTrader.FlushBotIconDb) end
        if State.AutoTrader.FlushHumanDetectionTiming then launch("humanTiming", State.AutoTrader.FlushHumanDetectionTiming) end
        if State.AutoTrader.SavePreferences then launch("preferences", State.AutoTrader.SavePreferences) end
        if State.AutoTrader.FlushDiskDebugLog then launch("debugLog", State.AutoTrader.FlushDiskDebugLog) end
    end
    local persistDeadline = os.clock() + 4
    while pending > 0 and os.clock() < persistDeadline do task.wait(0.03) end
    if pending > 0 then warn("[SV Public] shutdown persistence deadline expired with", pending, "operation(s) still running") end
    for name,result in pairs(persistenceResults) do if not result.ok then warn("[SV Public] shutdown persistence failed:",name,result.result) end end
    if State.Profile and State.Profile.Disconnect then pcall(State.Profile.Disconnect) end
    if disconnectExactTradeInventoryConnections then pcall(disconnectExactTradeInventoryConnections) end
    safeDisconnectAll()
    clearAllTradeHighlights()
    if UI.RootGui and UI.RootGui.Parent then UI.RootGui:Destroy() end
    removeInjectedChildren()
    if rawget(_G, GLOBAL_KEY) == Controller then rawset(_G, GLOBAL_KEY, nil) end
    rawset(_G, HARDEN.readyGlobalCurrent, nil); rawset(ExecutorEnvironment, HARDEN.readyGlobalCurrent, nil)
    rawset(_G, HARDEN.readyGlobalLegacy, nil); rawset(ExecutorEnvironment, HARDEN.readyGlobalLegacy, nil)
    HARDEN.destroying = false
end
function Controller.RefreshValues()
    local databaseOK, databaseError, databaseChanged =
        fetchSupremeDatabase()
    local linksOK, linksError, linksChanged =
        loadLinkedImages()
    if databaseChanged or linksChanged then
        table.clear(ResolveCache)
        table.clear(State.ResolveMetaCache)
        GameResolverLastBuild = 0
    end
    if SupremeDatabase then
        State.Profile.RecalculateCachedRemoteTotals()
        scanInventoryCards()
        refreshTrackedCards()
        scheduleTradeRefresh(0)
        State.Profile.QueueScan()
        State.Profile.QueueRemoteLeaderboardSweep(false)
    end
    return SupremeDatabase ~= nil,
        databaseError
        or linksError
end
function Controller.SetTradeHelperEnabled(enabled)
    State.TradeHelperEnabled = enabled == true
    refreshToggleText()
    if not State.TradeHelperEnabled then
        clearAllTradeHighlights()
    else
        scheduleTradeRefresh(0)
    end
end
HARDEN.refreshResolvedViews = function(discoverInventory)
    if not SupremeDatabase then
        return
    end
    table.clear(ResolveCache)
    table.clear(State.ResolveMetaCache)
    GameResolverLastBuild = 0
    if State.AutoTrader then
        State.AutoTrader.InventoryCache = nil
        State.AutoTrader.InventoryCacheStamp = nil
        State.AutoTrader.LastCalculationSignature = nil
        State.AutoTrader.PlanGeneration =
            State.AutoTrader.PlanGeneration + 1
    end
    State.Profile.RecalculateCachedRemoteTotals()
    if discoverInventory then
        scanInventoryCards()
    end
    refreshTrackedCards()
    scheduleTradeRefresh(0)
    State.Profile.QueueScan()
    State.Profile.QueueRemoteLeaderboardSweep(false)
end
HARDEN.jitteredDelay = function(seconds)
    return math.max(
        0.2,
        seconds * (0.90 + math.random() * 0.20)
    )
end
HARDEN.subsystemHealth = HARDEN.subsystemHealth or {}
HARDEN.recordSubsystem = function(name, ok, latency, err)
    name = tostring(name or "unnamed")
    local row = HARDEN.subsystemHealth[name] or {successes=0,failures=0,consecutiveFailures=0,totalLatency=0,maxLatency=0,lastSuccess=0,lastFailure=0,lastError=nil}
    if ok then row.successes+=1; row.consecutiveFailures=0; row.lastSuccess=os.clock()
    else row.failures+=1; row.consecutiveFailures+=1; row.lastFailure=os.clock(); row.lastError=tostring(err) end
    row.totalLatency += math.max(0,latency or 0); row.maxLatency=math.max(row.maxLatency,latency or 0)
    row.averageLatency=row.totalLatency/math.max(1,row.successes+row.failures)
    HARDEN.subsystemHealth[name]=row
    return row
end
HARDEN.safeCallNamed = function(name, callback)
    local started=os.clock()
    local packed
    if type(xpcall)=="function" and type(debug)=="table" and type(debug.traceback)=="function" then
        packed={xpcall(callback,debug.traceback)}
    else
        packed={pcall(callback)}
    end
    local ok,result,detail=packed[1],packed[2],packed[3]
    local healthy=ok and result~=false
    local err=healthy and nil or (ok and (detail or result) or result)
    local row=HARDEN.recordSubsystem(name,healthy,os.clock()-started,err)
    if not healthy then warn("[SV Public] subsystem error ["..tostring(name).."]:",err) end
    return healthy,result,row,detail
end
HARDEN.startFastPeriodic = function(baseSeconds, callback, name)
    task.spawn(function()
        local delaySeconds=math.max(0.02,tonumber(baseSeconds) or 0.05)
        local subsystem=tostring(name or "fast-periodic")
        task.wait(delaySeconds)
        while not Destroyed do
            local healthy,_,row=HARDEN.safeCallNamed(subsystem,callback)
            if Destroyed then break end
            if not healthy and row.consecutiveFailures>=3 then
                if row.consecutiveFailures==3 then warn("[SV Public] suspending noisy fast subsystem briefly:",subsystem) end
                task.wait(math.max(1,math.min(5,row.consecutiveFailures)))
            else
                task.wait(delaySeconds)
            end
        end
    end)
end
HARDEN.startPeriodic = function(baseSeconds, backoff, callback, name)
    task.spawn(function()
        local failures=0
        local subsystem=tostring(name or ("periodic@"..tostring(baseSeconds)))
        task.wait(HARDEN.jitteredDelay(baseSeconds))
        while not Destroyed do
            local healthy=select(1,HARDEN.safeCallNamed(subsystem,callback))
            if healthy then failures=0 else failures=math.min(failures+1,3) end
            if Destroyed then break end
            local multiplier=backoff and math.min(2^failures,4) or 1
            task.wait(HARDEN.jitteredDelay(baseSeconds*multiplier))
        end
    end)
end
State.QueueNativeDatabaseWarmup()
rawset(_G, GLOBAL_KEY, Controller)
do
    -- Executor-injected chunks do not consistently expose a Script object.
    -- Never let an absent/non-Instance `script` abort startup before the
    -- value database and periodic refresh loops are launched.
    HARDEN.scriptObject = nil
    pcall(function() HARDEN.scriptObject = script end)
    if typeof(HARDEN.scriptObject) == "Instance" then
        pcall(function()
            connect(HARDEN.scriptObject.Destroying, function()
                Controller.Destroy()
            end)
        end)
    end
end
task.spawn(function()
    -- Load the value/mapping databases before optional GUI binding. Some
    -- executors expose injected Script/GUI state differently; a bad UI
    -- binding must never strand the catalog at "Loading...".
    local initOK, initError =
        pcall(function()
            local databaseOK, databaseError =
                ensureSupremeDatabase(false)
            if Destroyed then
                return
            end
            local linksOK, linksError, linksChanged =
                loadLinkedImages()
            if not linksOK and linksError then
                warn("[SV Public] linked_images.json was not loaded:", linksError)
            end
            if not databaseOK and databaseError then
                warn("[SV Public] Initial value database unavailable:", databaseError)
            end
            State.AutoTrader.RunSelfTests()
            task.spawn(function()
                if not Destroyed then State.AutoTrader.RefreshTeleportScriptLkg() end
            end)

            -- These are cosmetic/binding concerns and are intentionally
            -- isolated after the foundational database work.
            HARDEN.safeCallNamed("startup.reconnectGuiWatchers", reconnectGuiWatchers)
            HARDEN.safeCallNamed("startup.profileBind", State.Profile.Bind)
            HARDEN.safeCallNamed("startup.updateUiScale", updatePublicUiScale)

            if databaseOK then
                HARDEN.refreshResolvedViews(true)
            end
            if linksChanged and SupremeDatabase then
                HARDEN.refreshResolvedViews(false)
            end
            discoverTradeGui()
            if isTradeVisible() then
                recoverTradeStatus()
            end
        end)
    if not initOK and not Destroyed then
        warn("[SV Public] Initial startup recovered from an error:", initError)
    end
end)
HARDEN.startPeriodic(
    CONFIG.RefreshSeconds,
    true,
    function()
        local ok, refreshError, changed =
            fetchSupremeDatabase()
        if changed then
            HARDEN.refreshResolvedViews(false)
        end
        if not ok and refreshError and not SupremeDatabase then
            DatabaseStatus = "Unavailable"
        end
        return ok, refreshError
    end,
    "values-refresh"
)
do
    HARDEN.linkedDelay = CONFIG.LinkedImagesRefreshSeconds
    HARDEN.linkedNextPollAt = 0
    HARDEN.startPeriodic(
        CONFIG.LinkedImagesRefreshSeconds,
        false,
        function()
            local now = os.clock()
            if now < HARDEN.linkedNextPollAt then return true end
            local ok, linkedError, changed = loadLinkedImages()
            if ok then
                HARDEN.linkedDelay = changed and CONFIG.LinkedImagesRefreshSeconds
                    or math.min(CONFIG.LinkedImagesMaxRefreshSeconds, math.max(CONFIG.LinkedImagesRefreshSeconds, HARDEN.linkedDelay * 1.7))
                if changed and SupremeDatabase then HARDEN.refreshResolvedViews(false) end
            else
                HARDEN.linkedDelay = math.min(CONFIG.LinkedImagesMaxRefreshSeconds, math.max(CONFIG.LinkedImagesRefreshSeconds * 2, HARDEN.linkedDelay * 1.5))
            end
            HARDEN.linkedNextPollAt = os.clock() + HARDEN.linkedDelay
            return ok, linkedError
        end,
        "linked-images-refresh"
    )
end
HARDEN.startPeriodic(
    CONFIG.PlayerSweepSeconds,
    false,
    function()
        if SupremeDatabase then
            State.Profile.QueueRemoteLeaderboardSweep(false)
        end
        return true
    end,
    "player-sweep"
)
HARDEN.startPeriodic(
    CONFIG.InventoryRefreshSeconds,
    false,
    function()
        if SupremeDatabase then
            refreshTrackedCards()
        end
        return true
    end,
    "inventory-refresh"
)
HARDEN.startPeriodic(
    CONFIG.InventoryDiscoverySeconds,
    false,
    function()
        if SupremeDatabase then
            scanInventoryCards()
        end
        return true
    end,
    "inventory-discovery"
)
HARDEN.startPeriodic(
    CONFIG.ProfileRefreshSeconds,
    false,
    function()
        if SupremeDatabase then
            State.Profile.QueueScan()
        end
        return true
    end,
    "profile-refresh"
)
HARDEN.startPeriodic(
    CONFIG.TradeRefreshSeconds,
    false,
    function()
        if SupremeDatabase and isTradeVisible() then
            scheduleTradeRefresh(0)
        end
        return true
    end,
    "trade-refresh"
)
HARDEN.startPeriodic(
    5,
    false,
    function()
        updatePublicUiScale()
        return true
    end,
    "ui-scale"
)
HARDEN.startPeriodic(
    2,
    false,
    function()
        State.AutoTrader.Tick()
        return true
    end,
    "trader-tick"
)
HARDEN.startFastPeriodic(
    CONFIG.AutoTraderGoldSampleSeconds,
    function() return State.AutoTrader.SampleGoldBotCertification() end,
    "gold-certification"
)
HARDEN.startPeriodic(
    1,
    false,
    function()
        return State.AutoTrader.SampleMovement()
    end,
    "movement-watchdog"
)
HARDEN.startPeriodic(
    1,
    false,
    function()
        return State.AutoTrader.OvernightSupervisor()
    end,
    "overnight-supervisor"
)
do
    HARDEN.lastTradeRecovery = 0
    HARDEN.startPeriodic(
        1.5,
        false,
        function()
            local currentGameDatabase =
                getGameDatabase()
            if currentGameDatabase ~= State.LastGameDatabase then
                State.LastGameDatabase = currentGameDatabase
                if SupremeDatabase then
                    HARDEN.refreshResolvedViews(false)
                else
                    table.clear(ResolveCache)
                    table.clear(State.ResolveMetaCache)
                    GameResolverLastBuild = 0
                end
            end
            if State.TradeGui
                and State.TradeGui.Parent
                and State.TradeGui.Enabled
                and not State.CurrentTrade then
                local now = os.clock()
                if now - HARDEN.lastTradeRecovery >= 3 then
                    HARDEN.lastTradeRecovery = now
                    recoverTradeStatus()
                end
            end
            return true
        end,
        "trade-recovery"
    )
end
rawset(_G, HARDEN.readyGlobalCurrent, true)
rawset(ExecutorEnvironment, HARDEN.readyGlobalCurrent, true)
-- Legacy ready alias is intentionally retained for old loaders; user-facing versioning is canonical.
rawset(_G, HARDEN.readyGlobalLegacy, true)
rawset(ExecutorEnvironment, HARDEN.readyGlobalLegacy, true)
warn("[SV Public] Supreme Values PC Public Helper " .. CONTROLLER_VERSION .. " loaded.")
