local CONFIG = {
    version = "18.38-public-auto-trader-v6-serverhop-recovery",
    Enabled = true,
    JsonUrl = "https://raw.githubusercontent.com/zzourn/supreme-values/main/supremevalues_output.json",
    LinkedImagesUrl = "https://raw.githubusercontent.com/zzourn/supreme-values/main/linked_images.json",
    RefreshSeconds = 60,
    LinkedImagesRefreshSeconds = 8,
    PlayerValuesRefreshSeconds = 8,
    PlayerSweepSeconds = 2,
    InventoryRefreshSeconds = 5,
    InventoryDiscoverySeconds = 20,
    ProfileRefreshSeconds = 5,
    TradeRefreshSeconds = 2,
    RemoteTimeoutSeconds = 5,
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
    AutoTraderStableSeconds = 0.9,
    AutoTraderTradeWarmupSeconds = 0.6,
    AutoTraderActionTimeoutSeconds = 1.8,
    AutoTraderAcceptDelaySeconds = 6.15,
    AutoTraderAcceptRetryCheckSeconds = 0.35,
    AutoTraderSuccessNotificationSeconds = 15,
    AutoTraderPostTradeAuditTimeoutSeconds = 8,
    AutoTraderPendingRequestTimeoutSeconds = 12,
    AutoTraderFirstOfferTimeoutSeconds = 18,
    AutoTraderTradeIdleTimeoutSeconds = 35,
    AutoTraderAnchorMaxValue = 100,
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
    AutoTraderServerHopEnabled = true,
    AutoTraderUnresolvedMaxWaitSeconds = 22,
    AutoTraderDiscoveryRetrySeconds = 4,
    AutoTraderDiscoveryRetryLimit = 3,
    AutoTraderServerHopGraceSeconds = 2.5,
    AutoTraderServerHopRetrySeconds = 5,
    AutoTraderServerListPages = 3,
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
if not CONFIG.Enabled then
    return
end
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
    error("SupremeValues_PC_PublicHelper requires a LocalPlayer.")
end
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local httpRequest =
    (type(request) == "function" and request)
    or (type(http_request) == "function" and http_request)
    or (type(syn) == "table" and type(syn.request) == "function" and syn.request)
if type(httpRequest) ~= "function" then
    warn("[SV Public] No request(options) HTTP function is available.")
end
local GLOBAL_KEY = "__SUPREME_VALUES_PC_PUBLIC_HELPER"
do
    local old = rawget(_G, GLOBAL_KEY)
    if type(old) == "table" and type(old.Destroy) == "function" then
        pcall(old.Destroy)
    end
end
local THEME = {
    bg = Color3.fromRGB(15, 17, 22),
    panel = Color3.fromRGB(22, 25, 32),
    panel2 = Color3.fromRGB(28, 32, 40),
    panel3 = Color3.fromRGB(35, 40, 50),
    border = Color3.fromRGB(57, 64, 78),
    text = Color3.fromRGB(242, 245, 250),
    muted = Color3.fromRGB(157, 166, 182),
    faint = Color3.fromRGB(105, 115, 134),
    green = Color3.fromRGB(83, 218, 142),
    yellow = Color3.fromRGB(255, 210, 74),
    red = Color3.fromRGB(245, 105, 118),
    blue = Color3.fromRGB(101, 176, 255),
    purple = Color3.fromRGB(128, 111, 255),
    orange = Color3.fromRGB(255, 156, 86),
}
local Connections = {}
local Destroyed = false
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
            requestSerial = 0,
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
        TextSize = textSize or 13,
        Font = font or Enum.Font.Gotham,
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
        Font = Enum.Font.GothamMedium,
    }, parent)
    addCorner(button, 7)
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
    linkedETag = nil,
    supremeETag = nil,
}
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
    if type(database) ~= "table" then
        return exactIndex, canonicalIndex, catalog
    end
    local function ingestRecord(category, sourceKey, itemData, variantIndex)
        if type(itemData) ~= "table" then
            return
        end
        local recordKey = itemData.record_key or itemData.recordKey
        if type(recordKey) ~= "string" or recordKey == "" then
            recordKey = tostring(sourceKey)
            if variantIndex then
                recordKey = recordKey .. "#" .. tostring(variantIndex)
            end
        end
        local record = {
            key = recordKey,
            sourceKey = tostring(sourceKey),
            name = itemData.name or sourceKey,
            category = category,
            data = itemData,
            variantIndex = variantIndex,
        }
        table.insert(catalog, record)
        addRecordToIndex(exactIndex, record.name, record)
        addRecordToIndex(canonicalIndex, canonicalName(record.name), record)
        if normalize(record.sourceKey) ~= normalize(record.name) then
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
    end
    for category, categoryData in pairs(database) do
        if category ~= "_metadata" and type(categoryData) == "table" then
            for itemKey, itemData in pairs(categoryData) do
                if type(itemData) == "table" then
                    if type(itemData[1]) == "table" then
                        for variantIndex, variantData in ipairs(itemData) do
                            ingestRecord(category, itemKey, variantData, variantIndex)
                        end
                    else
                        ingestRecord(category, itemKey, itemData, nil)
                    end
                end
            end
        end
    end
    return exactIndex, canonicalIndex, catalog
end
local function getSupremeRecord(
    category,
    name,
    supremeKey,
    year
)
    if not SupremeDatabase then
        return nil
    end
    local wantedCategory =
        normalizeCategory(category)
    local wantedName =
        normalize(name)
    local wantedKey =
        supremeKey
        and tostring(supremeKey)
        or nil
    local wantedYear =
        tonumber(year)
    local nameMatches = {}
    local yearMatches = {}
    for _, record in ipairs(
        Catalog
    ) do
        if normalizeCategory(
            record.category
        ) == wantedCategory then
            if wantedKey
                and (
                    tostring(
                        record.key
                        or ""
                    ) == wantedKey
                    or tostring(
                        record.sourceKey
                        or ""
                    ) == wantedKey
                ) then
                if tostring(
                    record.key
                    or ""
                ) == wantedKey then
                    return record
                end
            end
            if wantedName ~= ""
                and normalize(
                    record.name
                ) == wantedName then
                table.insert(
                    nameMatches,
                    record
                )
                local recordYear =
                    tonumber(
                        record.data
                        and record.data.year
                    )
                if wantedYear
                    and recordYear
                        == wantedYear then
                    table.insert(
                        yearMatches,
                        record
                    )
                end
            end
        end
    end
    if #yearMatches == 1 then
        return yearMatches[1]
    end
    if #nameMatches == 1 then
        return nameMatches[1]
    end
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
                    name = link.name,
                    category = link.category,
                    supreme_key = link.supreme_key,
                    year = link.year,
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
                    name = link.name,
                    category = link.category,
                    supreme_key = link.supreme_key,
                    year = link.year,
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
local function loadLinkedImages()
    if type(httpRequest) ~= "function" then
        return false, "request(options) is unavailable.", false
    end
    local headers = {
        ["Accept"] = "application/json",
        ["Cache-Control"] = "no-cache",
    }
    if HttpState.linkedETag then
        headers["If-None-Match"] = HttpState.linkedETag
    end
    local ok, response = pcall(function()
        return httpRequest({
            Url = CONFIG.LinkedImagesUrl,
            Method = "GET",
            Headers = headers,
        })
    end)
    if not ok then
        return false, tostring(response), false
    end
    if type(response) ~= "table" then
        return false, "Invalid linked-images response.", false
    end
    if tonumber(response.StatusCode) == 304 then
        return true, nil, false
    end
    if tonumber(response.StatusCode) == 404 then
        return false, "linked_images.json returned HTTP 404; keeping last-known-good mappings.", false
    end
    if response.Success ~= true then
        return false, "HTTP " .. tostring(response.StatusCode or "?"), false
    end
    local body = response.Body or ""
    if body == "" then
        return false, "linked_images.json returned an empty body; keeping last-known-good mappings.", false
    end
    if LastLinkedImagesBody == body then
        HttpState.linkedETag = getResponseHeader(response, "etag") or HttpState.linkedETag
        return true, nil, false
    end
    local decodeOK, decoded = pcall(function()
        return HttpService:JSONDecode(body)
    end)
    if not decodeOK or type(decoded) ~= "table" then
        return false, "linked_images.json could not be decoded; keeping last-known-good mappings.", false
    end
    local normalizeOK, nextImages, nextItems =
        pcall(
            normalizeLinkedImagesDocument,
            decoded
        )
    if not normalizeOK then
        return false, "linked_images.json normalization failed; keeping last-known-good mappings.", false
    end
    local oldCount = mappingEntryCount(LinkedImages, State.Mapping.ItemLinks)
    local newCount = mappingEntryCount(nextImages, nextItems)
    if oldCount > 0 and newCount == 0 then
        return false, "linked_images.json became unexpectedly empty; keeping last-known-good mappings.", false
    end
    LinkedImages = nextImages
    State.Mapping.ItemLinks = nextItems
    LastLinkedImagesBody = body
    HttpState.linkedETag = getResponseHeader(response, "etag") or HttpState.linkedETag
    rebuildManualLinkIndexes()
    return true, nil, true
end
local function validateSupremeCandidate(decoded, candidateCatalog)
    if type(decoded) ~= "table" or type(decoded._metadata) ~= "table" then
        return false, "The JSON is not the expected Supreme Values database."
    end
    if decoded._metadata.complete == false then
        return false, "The latest JSON says the scrape is incomplete."
    end
    local candidateCount = #candidateCatalog
    if candidateCount < CONFIG.MinimumCatalogItems then
        return false, "The candidate database is suspiciously small (" .. tostring(candidateCount) .. " items)."
    end
    local previousCount = #Catalog
    if previousCount > 0 then
        local minimumRelative = math.max(
            CONFIG.MinimumCatalogItems,
            math.floor(previousCount * 0.65)
        )
        if candidateCount < minimumRelative then
            return false, "The candidate database dropped from " .. tostring(previousCount) .. " to " .. tostring(candidateCount) .. " items."
        end
    end
    local metadataCount = tonumber(decoded._metadata.total_items)
    if metadataCount and metadataCount > 0 then
        local minimumIndexed = math.floor(metadataCount * 0.80)
        if candidateCount < minimumIndexed then
            return false, "The candidate database indexed fewer items than its metadata claims."
        end
    end
    return true
end
local function fetchSupremeDatabase()
    if type(httpRequest) ~= "function" then
        return false, "The custom request(options) function is not available.", false
    end
    local headers = {
        ["Accept"] = "application/json",
        ["Cache-Control"] = "no-cache",
    }
    if HttpState.supremeETag then
        headers["If-None-Match"] = HttpState.supremeETag
    end
    local requestOK, response = pcall(function()
        return httpRequest({
            Url = CONFIG.JsonUrl,
            Method = "GET",
            Headers = headers,
        })
    end)
    if not requestOK then
        return false, "HTTP error: " .. tostring(response), false
    end
    if type(response) ~= "table" then
        return false, "request(options) returned something other than a response table.", false
    end
    if tonumber(response.StatusCode) == 304 then
        if SupremeDatabase then
            LastDatabaseLoad = os.time()
            DatabaseStatus = "Ready"
            return true, nil, false
        end
        DatabaseStatus = "Unavailable"
        return false, "HTTP 304 received before an initial database load.", false
    end
    if response.Success ~= true then
        return false, string.format(
            "HTTP %s %s",
            tostring(response.StatusCode or "?"),
            tostring(response.StatusMessage or "request failed")
        ), false
    end
    local body = response.Body
    if type(body) ~= "string" or body == "" then
        return false, "GitHub returned an empty response body; keeping last-known-good values.", false
    end
    if LastSupremeBody == body and SupremeDatabase then
        HttpState.supremeETag = getResponseHeader(response, "etag") or HttpState.supremeETag
        LastDatabaseLoad = os.time()
        DatabaseStatus = "Ready"
        return true, nil, false
    end
    local decodeOK, decoded = pcall(function()
        return HttpService:JSONDecode(body)
    end)
    if not decodeOK then
        return false, "JSON decode failed: " .. tostring(decoded), false
    end
    local indexOK, candidateExact, candidateCanonical, candidateCatalog =
        pcall(
            buildSupremeIndex,
            decoded
        )
    if not indexOK then
        return false, "The candidate database could not be indexed; keeping last-known-good values.", false
    end
    local valid, validationError =
        validateSupremeCandidate(decoded, candidateCatalog)
    if not valid then
        return false, validationError, false
    end
    SupremeDatabase = decoded
    IndexExact = candidateExact
    IndexCanonical = candidateCanonical
    Catalog = candidateCatalog
    LastSupremeBody = body
    HttpState.supremeETag = getResponseHeader(response, "etag") or HttpState.supremeETag
    LastDatabaseLoad = os.time()
    DatabaseStatus = "Ready"
    return true, nil, true
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
State.GameDataAliasIndex =
    State.GameDataAliasIndex
    or {
        Weapons = {},
        Pets = {},
    }
State.RebuildGameDataAliasIndex = function(
    database
)
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
    return rawget(_G, name)
end
State.TryDecompileDataModule = function(
    moduleScript
)
    if not CONFIG.UseDecompiledSyncFallback
        or not moduleScript
        or not moduleScript:IsA(
            "ModuleScript"
        ) then
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
    local okSource, source =
        pcall(
            decompileFunction,
            moduleScript
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
    if not okResult
        or type(result) ~= "table" then
        return nil,
            "decompiled module execution failed"
    end
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
        local wantedCanonical = {}
        for _, searchName in ipairs(searchNames) do
            local c = canonicalName(searchName)
            if c ~= "" then
                wantedCanonical[c] = true
            end
        end
        for _, record in ipairs(Catalog) do
            local rc = canonicalName(record.name)
            for wanted in pairs(wantedCanonical) do
                if rc == wanted
                    or rc:find(wanted, 1, true)
                    or wanted:find(rc, 1, true) then
                    add(record)
                    break
                end
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
        .. tostring(
            State.Mapping.Revision
        )
    if ResolveCache[cacheKey] ~= nil then
        local cached =
            ResolveCache[cacheKey]
        local meta =
            State.ResolveMetaCache[
                cacheKey
            ]
        if cached == false then
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
addCorner(UI.Details, 14)
addStroke(UI.Details, THEME.border, 1, 0.1)
UI.DetailsTitle = makeLabel(
    UI.Details,
    "Item",
    20,
    THEME.text,
    Enum.Font.GothamBold
)
UI.DetailsTitle.Position = UDim2.fromOffset(18, 15)
UI.DetailsTitle.Size = UDim2.new(1, -72, 0, 28)
UI.DetailsTitle.ZIndex = 2002
UI.DetailsSubtitle = makeLabel(
    UI.Details,
    "",
    11,
    THEME.muted,
    Enum.Font.Gotham
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
        Enum.Font.GothamMedium
    )
    left.Position = UDim2.fromOffset(11, 4)
    left.Size = UDim2.new(1, -22, 0, 15)
    left.ZIndex = 2003
    local right = makeLabel(
        row,
        valueText,
        13,
        valueColor or THEME.text,
        Enum.Font.GothamMedium
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
        Font = Enum.Font.GothamBold,
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
        Font = Enum.Font.GothamBold,
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
addCorner(TradePanel, 13)
addStroke(TradePanel, THEME.border, 1, 0.1)
UI.TradePanelScale = create("UIScale", {
    Scale = 1,
}, TradePanel)
UI.DetailsScale = create("UIScale", {
    Scale = 1,
}, UI.Details)
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
        UI.AutoTraderLauncherScale.Scale =
            scale
    end
end
updatePublicUiScale()
UI.TradePanelTitle = makeLabel(
    TradePanel,
    "TRADE ANALYSIS",
    11,
    THEME.faint,
    Enum.Font.GothamBold
)
UI.TradePanelTitle.Position = UDim2.fromOffset(14, 10)
UI.TradePanelTitle.Size = UDim2.new(1, -28, 0, 18)
UI.TradePanelTitle.ZIndex = 1001
UI.TradePanelStatus = makeLabel(
    TradePanel,
    "Waiting for trade...",
    18,
    THEME.text,
    Enum.Font.GothamBold
)
UI.TradePanelStatus.Position = UDim2.fromOffset(14, 31)
UI.TradePanelStatus.Size = UDim2.new(1, -28, 0, 28)
UI.TradePanelStatus.ZIndex = 1001
UI.TradePanelScore = makeLabel(
    TradePanel,
    "",
    10,
    THEME.muted,
    Enum.Font.GothamMedium
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
    PreferencesKey = "__SV_AUTO_TRADER_PREFS_V2",
    TargetStatsKey = "__SV_AUTO_TRADER_TARGET_STATS_V1",
    TargetStatsFile = "SV_AutoTrader_TargetStats_v1.json",
    RecentJobsKey = "__SV_AUTO_TRADER_RECENT_JOBS_V1",
    RecentJobsFile = "SV_AutoTrader_RecentJobs_v1.json",
    TeleportBootstrapKey = "__SV_AUTO_TRADER_TELEPORT_BOOTSTRAP_V1",
    FriendCache = {},
    FriendCacheMeta = {},
    FriendPending = {},
    Cooldowns = {},
    RequestHistory = {},
    TargetStats = {},
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
    LastRenderAt = 0,
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
    LastAcceptAudit = nil,
    ServerPlayers = {},
    ServerJoinedAt = os.clock(),
    LastServerDisposition = nil,
    LastServerDispositionAt = 0,
    ServerExhaustedSince = 0,
    LastDiscoveryKickAt = 0,
    ServerHopInProgress = false,
    LastServerHopAttemptAt = 0,
    RecentJobs = {},
    TeleportQueued = false,
    TeleportInProgress = false,
    LastTeleportReason = nil,
    MovementSamples = {},
    LastAnyMovementAt = os.clock(),
    MovementWatchdogArmedAt = os.clock() + CONFIG.AutoTraderMovementJoinGraceSeconds,
    LastSameServerRecoveryAt = 0,
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
State.AutoTrader.TeleportBootstrap = rawget(ExecutorEnvironment, State.AutoTrader.TeleportBootstrapKey)
    or rawget(_G, State.AutoTrader.TeleportBootstrapKey)
State.AutoTrader.Preferences = rawget(_G, State.AutoTrader.PreferencesKey)
if type(State.AutoTrader.Preferences) ~= "table" then
    State.AutoTrader.Preferences = {
        automation = CONFIG.AutoTraderActiveDefault,
        ignoreFriends = CONFIG.AutoTraderIgnoreFriendsDefault,
        openingAnchor = CONFIG.AutoTraderOpeningAnchorDefault,
        preferDuplicates = CONFIG.AutoTraderPreferDuplicatesDefault,
        unknownTheirZero = CONFIG.AutoTraderUnknownTheirZeroDefault,
        winPreset = 2,
        reserves = {},
        panelPosition = nil,
    }
    rawset(_G, State.AutoTrader.PreferencesKey, State.AutoTrader.Preferences)
end
local AutoPrefs = State.AutoTrader.Preferences
if type(AutoPrefs.reserves) ~= "table" then
    AutoPrefs.reserves = {}
end
if AutoPrefs.automation == nil then
    AutoPrefs.automation = CONFIG.AutoTraderActiveDefault
end
if AutoPrefs.ignoreFriends == nil then
    AutoPrefs.ignoreFriends = CONFIG.AutoTraderIgnoreFriendsDefault
end
if AutoPrefs.openingAnchor == nil then
    AutoPrefs.openingAnchor = CONFIG.AutoTraderOpeningAnchorDefault
end
if AutoPrefs.preferDuplicates == nil then
    AutoPrefs.preferDuplicates = CONFIG.AutoTraderPreferDuplicatesDefault
end
if AutoPrefs.unknownTheirZero == nil then
    AutoPrefs.unknownTheirZero = CONFIG.AutoTraderUnknownTheirZeroDefault
end
if tonumber(AutoPrefs.winPreset) == nil then
    AutoPrefs.winPreset = 2
end
do
    local bootstrap = State.AutoTrader.TeleportBootstrap
    if type(bootstrap) == "table" and type(bootstrap.preferences) == "table" then
        local incoming = bootstrap.preferences
        for _, key in ipairs({"automation", "ignoreFriends", "openingAnchor", "preferDuplicates", "unknownTheirZero", "winPreset", "reserves"}) do
            if incoming[key] ~= nil then
                AutoPrefs[key] = incoming[key]
            end
        end
        if type(AutoPrefs.reserves) ~= "table" then
            AutoPrefs.reserves = {}
        end
    end
    rawset(ExecutorEnvironment, State.AutoTrader.TeleportBootstrapKey, nil)
    rawset(_G, State.AutoTrader.TeleportBootstrapKey, nil)
end
State.AutoTrader.LoadTargetStats = function()
    local loaded = rawget(_G, State.AutoTrader.TargetStatsKey)
    if type(loaded) ~= "table" then
        local isfileFunction = State.TryGetExecutorGlobal("isfile")
        local readfileFunction = State.TryGetExecutorGlobal("readfile")
        if type(isfileFunction) == "function"
            and type(readfileFunction) == "function" then
            local fileOK, exists = pcall(
                isfileFunction,
                State.AutoTrader.TargetStatsFile
            )
            if fileOK and exists then
                local readOK, body = pcall(
                    readfileFunction,
                    State.AutoTrader.TargetStatsFile
                )
                if readOK and type(body) == "string" and body ~= "" then
                    local decodeOK, decoded = pcall(function()
                        return HttpService:JSONDecode(body)
                    end)
                    if decodeOK and type(decoded) == "table" then
                        loaded = decoded
                    end
                end
            end
        end
    end
    if type(loaded) ~= "table" then
        loaded = {}
    end
    State.AutoTrader.TargetStats = loaded
    rawset(_G, State.AutoTrader.TargetStatsKey, loaded)
end
State.AutoTrader.SaveTargetStats = function()
    rawset(_G, State.AutoTrader.TargetStatsKey, State.AutoTrader.TargetStats)
    State.AutoTrader.TargetStatsSaveGeneration += 1
    local generation = State.AutoTrader.TargetStatsSaveGeneration
    task.delay(0.6, function()
        if Destroyed or generation ~= State.AutoTrader.TargetStatsSaveGeneration then
            return
        end
        State.AutoTrader.FlushTargetStats()
    end)
end
State.AutoTrader.FlushTargetStats = function()
    rawset(_G, State.AutoTrader.TargetStatsKey, State.AutoTrader.TargetStats)
    local writefileFunction = State.TryGetExecutorGlobal("writefile")
    if type(writefileFunction) ~= "function" then
        return false
    end
    local encodeOK, encoded = pcall(function()
        return HttpService:JSONEncode(State.AutoTrader.TargetStats)
    end)
    if not encodeOK or type(encoded) ~= "string" then
        return false
    end
    return pcall(
        writefileFunction,
        State.AutoTrader.TargetStatsFile,
        encoded
    )
end
State.AutoTrader.LoadTargetStats()
State.AutoTrader.WinPresets = {1, 2, 3, 5}
State.AutoTrader.SavePreferences = function()
    rawset(_G, State.AutoTrader.PreferencesKey, State.AutoTrader.Preferences)
end
State.AutoTrader.Log = function(kind, data)
    local log = State.AutoTrader.DebugLog
    table.insert(log, {
        t = os.clock(),
        kind = tostring(kind or "event"),
        data = data,
    })
    while #log > 90 do
        table.remove(log, 1)
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
State.AutoTrader.GetPlayerStats = function(player)
    if not player then
        return nil
    end
    local key = tostring(player.UserId)
    local stats = State.AutoTrader.TargetStats[key]
        or State.AutoTrader.TargetStats[player.UserId]
    if not stats then
        stats = {
            requests = 0,
            responses = 0,
            declines = 0,
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
    State.AutoTrader.TargetStats[player.UserId] = nil
    State.AutoTrader.TargetStats[key] = stats
    stats.auditFailures = tonumber(stats.auditFailures) or 0
    stats.lastDecayUnix = tonumber(stats.lastDecayUnix) or os.time()
    stats.lastEventUnix = tonumber(stats.lastEventUnix) or os.time()
    local nowUnix = os.time()
    local elapsedDays = math.max(0, (nowUnix - stats.lastDecayUnix) / 86400)
    if elapsedDays >= 0.25 then
        local factor = CONFIG.AutoTraderTargetStatsDecayPerDay ^ elapsedDays
        for _, field in ipairs({
            "requests",
            "responses",
            "declines",
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
State.AutoTrader.RecordTargetEvent = function(player, kind, data)
    if not player then
        return
    end
    local stats = State.AutoTrader.GetPlayerStats(player)
    data = data or {}
    if kind == "request" then
        stats.requests += 1
        stats.lastRequestedAt = os.time()
    elseif kind == "response" then
        stats.responses += 1
        local seconds = tonumber(data.seconds)
        if seconds and seconds >= 0 then
            stats.totalResponseSeconds += seconds
        end
    elseif kind == "decline" then
        stats.declines += 1
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
        and cached.databaseToken == tostring(SupremeDatabase) then
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
        databaseToken = tostring(SupremeDatabase),
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
State.AutoTrader.GetTargetScore = function(player, verifiedTotal)
    local total = tonumber(verifiedTotal) or 0
    if total <= 0 then
        return -math.huge
    end
    local stats = State.AutoTrader.GetPlayerStats(player)
    local responseRate = ((tonumber(stats.responses) or 0) + 1.5)
        / ((tonumber(stats.requests) or 0) + 2)
    local successRate = ((tonumber(stats.successes) or 0) + 0.8)
        / ((tonumber(stats.trades) or 0) + 2)
    local avgResponse = (tonumber(stats.responses) or 0) > 0
        and ((tonumber(stats.totalResponseSeconds) or 0) / stats.responses)
        or 5
    local avgTrade = (tonumber(stats.successes) or 0) > 0
        and ((tonumber(stats.totalTradeSeconds) or 0) / stats.successes)
        or 18
    local expectedSeconds = math.max(3, avgResponse + avgTrade)
    local expectedProfit = (tonumber(stats.successes) or 0) > 0
        and math.max(1, (tonumber(stats.totalProfit) or 0) / stats.successes)
        or math.max(1, math.min(20, math.sqrt(total) * 0.65))
    local freshBonus = (tonumber(stats.requests) or 0) < 0.25 and 1.15 or 1
    local profile = State.AutoTrader.GetTargetProfile(player)
    local compositionMultiplier = profile and profile.multiplier or 0.70
    local auditPenalty = 1 / (1 + (tonumber(stats.auditFailures) or 0) * 0.35)
    return (
        expectedProfit
        * responseRate
        * successRate
        * freshBonus
        * compositionMultiplier
        * auditPenalty
        / expectedSeconds
    ) + math.sqrt(total) * 0.0005
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
        State.AutoTrader.FriendCache[userId] = false
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
            -- A failed Roblox friend lookup must never deadlock all targeting.
            -- Fail open as non-friend, but mark it as retryable and retry periodically.
            State.AutoTrader.FriendCache[userId] = false
            State.AutoTrader.FriendCacheMeta[userId] = {checkedAt = os.clock(), fallback = true, error = tostring(isFriend)}
            State.AutoTrader.Log("friend_lookup_failed_open", {userId = userId, name = player.Name, error = tostring(isFriend)})
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
            State.AutoTrader.FriendCache[player.UserId] = false
            State.AutoTrader.FriendCacheMeta[player.UserId] = {checkedAt = os.clock(), fallback = true, error = "friend lookup timed out"}
            return false
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
    if not player or player == LocalPlayer then
        return nil
    end
    local entry = State.AutoTrader.ServerPlayers[player.UserId]
    if not entry then
        entry = {
            userId = player.UserId,
            name = player.Name,
            firstSeenAt = os.clock(),
            outcome = nil,
            outcomeAt = 0,
            discoveryRetries = 0,
            lastDiscoveryRetryAt = 0,
        }
        State.AutoTrader.ServerPlayers[player.UserId] = entry
        State.AutoTrader.ServerExhaustedSince = 0
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.Log("server_player_seen", {userId = player.UserId, name = player.Name})
    else
        entry.name = player.Name
    end
    return entry
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
        or outcome == "trade_declined"
        or outcome == "idle"
        or outcome == "local_cancel"
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
    local info = State.Profile.totalsByName[player.Name]
    local verified = type(info) == "table"
        and info.source == "GetFullInventoryVerified"
        and not info.stale
    local total = verified and tonumber(info.total) or nil
    if total ~= nil then
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
State.AutoTrader.GetServerDisposition = function()
    local counts = {
        total = 0, valued = 0, zero = 0, unknown = 0, unresolvable = 0,
        friend = 0, exhausted = 0, active = 0,
    }
    if not State.AutoTrader.Preferences.automation then
        return "OFF", counts
    end
    if State.AutoTrader.SessionFrozen then
        return "FROZEN", counts
    end
    if State.AutoTrader.PostTradeAuditPending or State.AutoTrader.PendingRequest
        or State.CurrentTrade or (isTradeVisible and isTradeVisible()) then
        return "ACTIVE", counts
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Parent then
            counts.total += 1
            local class = State.AutoTrader.GetServerPlayerClassification(player)
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
    if counts.valued > 0 or counts.active > 0 then
        return "ACTIVE", counts
    end
    if counts.unknown > 0 then
        return "WAITING_FOR_DISCOVERY", counts
    end
    if counts.total == 0 or counts.friend == counts.total then
        return "EXHAUSTED_NO_ELIGIBLE_PLAYERS", counts
    end
    if counts.exhausted > 0 then
        return "EXHAUSTED_ALL_ATTEMPTED", counts
    end
    if counts.unresolvable > 0 then
        return "EXHAUSTED_UNRESOLVABLE", counts
    end
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
        stamp = tonumber(stamp) or 0
        if type(jobId) == "string" and jobId ~= ""
            and now - stamp <= CONFIG.AutoTraderRecentServerTtlSeconds then
            table.insert(rows, {jobId = jobId, stamp = stamp})
        end
    end
    table.sort(rows, function(a, b) return a.stamp > b.stamp end)
    State.AutoTrader.RecentJobs = {}
    for index, row in ipairs(rows) do
        if index > CONFIG.AutoTraderRecentServerLimit then break end
        State.AutoTrader.RecentJobs[row.jobId] = row.stamp
    end
end
State.AutoTrader.SaveRecentJobs = function()
    State.AutoTrader.PruneRecentJobs()
    rawset(_G, State.AutoTrader.RecentJobsKey, State.AutoTrader.RecentJobs)
    rawset(ExecutorEnvironment, State.AutoTrader.RecentJobsKey, State.AutoTrader.RecentJobs)
    local writer = State.TryGetExecutorGlobal("writefile")
    if type(writer) == "function" then
        local ok, body = pcall(function() return HttpService:JSONEncode(State.AutoTrader.RecentJobs) end)
        if ok then pcall(writer, State.AutoTrader.RecentJobsFile, body) end
    end
end
State.AutoTrader.LoadRecentJobs = function()
    local merged = {}
    local function merge(value)
        if type(value) ~= "table" then return end
        for jobId, stamp in pairs(value) do
            if type(jobId) == "string" then merged[jobId] = math.max(tonumber(merged[jobId]) or 0, tonumber(stamp) or os.time()) end
        end
    end
    merge(rawget(_G, State.AutoTrader.RecentJobsKey))
    merge(rawget(ExecutorEnvironment, State.AutoTrader.RecentJobsKey))
    local bootstrap = State.AutoTrader.TeleportBootstrap
    if type(bootstrap) == "table" then merge(bootstrap.recentJobs) end
    local isfileFunction = State.TryGetExecutorGlobal("isfile")
    local reader = State.TryGetExecutorGlobal("readfile")
    if type(isfileFunction) == "function" and type(reader) == "function" then
        local okExists, exists = pcall(isfileFunction, State.AutoTrader.RecentJobsFile)
        if okExists and exists then
            local okRead, body = pcall(reader, State.AutoTrader.RecentJobsFile)
            if okRead and type(body) == "string" then
                local okDecode, decoded = pcall(function() return HttpService:JSONDecode(body) end)
                if okDecode then merge(decoded) end
            end
        end
    end
    State.AutoTrader.RecentJobs = merged
    if type(game.JobId) == "string" and game.JobId ~= "" then
        State.AutoTrader.RecentJobs[game.JobId] = os.time()
    end
    State.AutoTrader.SaveRecentJobs()
end
State.AutoTrader.GetQueueOnTeleport = function()
    local direct = State.TryGetExecutorGlobal("queue_on_teleport") or State.TryGetExecutorGlobal("queueonteleport")
    if type(direct) == "function" then return direct end
    local synTable = State.TryGetExecutorGlobal("syn")
    if type(synTable) == "table" and type(synTable.queue_on_teleport) == "function" then return synTable.queue_on_teleport end
    local fluxusTable = State.TryGetExecutorGlobal("fluxus")
    if type(fluxusTable) == "table" and type(fluxusTable.queue_on_teleport) == "function" then return fluxusTable.queue_on_teleport end
    return nil
end
State.AutoTrader.BuildTeleportBootstrapCode = function(reason)
    local payload = {
        reason = tostring(reason or "teleport"),
        preferences = {
            automation = State.AutoTrader.Preferences.automation == true,
            ignoreFriends = State.AutoTrader.Preferences.ignoreFriends == true,
            openingAnchor = State.AutoTrader.Preferences.openingAnchor == true,
            preferDuplicates = State.AutoTrader.Preferences.preferDuplicates == true,
            unknownTheirZero = State.AutoTrader.Preferences.unknownTheirZero == true,
            winPreset = State.AutoTrader.Preferences.winPreset,
            reserves = State.AutoTrader.Preferences.reserves,
        },
        recentJobs = State.AutoTrader.RecentJobs,
    }
    local ok, encoded = pcall(function() return HttpService:JSONEncode(payload) end)
    if not ok then return nil, tostring(encoded) end
    local quotedJson = string.format("%q", encoded)
    local quotedUrl = string.format("%q", CONFIG.AutoTraderTeleportScriptUrl)
    local quotedKey = string.format("%q", State.AutoTrader.TeleportBootstrapKey)
    return table.concat({
        "local H=game:GetService('HttpService')",
        "local E=(getgenv and getgenv()) or _G",
        "local B=H:JSONDecode(" .. quotedJson .. ")",
        "E[" .. quotedKey .. "]=B; _G[" .. quotedKey .. "]=B",
        "task.wait(1)",
        "loadstring(game:HttpGet(" .. quotedUrl .. "))()",
    }, ";")
end
State.AutoTrader.QueueTeleportScript = function(reason)
    if State.AutoTrader.TeleportQueued then return true end
    local queueFunction = State.AutoTrader.GetQueueOnTeleport()
    if type(queueFunction) ~= "function" then
        State.AutoTrader.Log("queue_on_teleport_unavailable", {reason = reason})
        return false, "queue_on_teleport unavailable"
    end
    State.AutoTrader.SaveRecentJobs()
    local code, buildError = State.AutoTrader.BuildTeleportBootstrapCode(reason)
    if not code then return false, buildError end
    local ok, err = pcall(queueFunction, code)
    if ok then
        State.AutoTrader.TeleportQueued = true
        State.AutoTrader.LastTeleportReason = tostring(reason or "teleport")
        State.AutoTrader.Log("teleport_script_queued", {reason = reason})
        return true
    end
    return false, tostring(err)
end
State.AutoTrader.HttpGetBody = function(url)
    if type(httpRequest) == "function" then
        local ok, response = pcall(httpRequest, {Url = url, Method = "GET", Headers = { ["Cache-Control"] = "no-cache" }})
        if ok and type(response) == "table" and tonumber(response.StatusCode or response.Status) == 200 then
            return response.Body or response.body
        end
    end
    local ok, body = pcall(function() return game:HttpGet(url) end)
    if ok and type(body) == "string" then return body end
    return nil
end
State.AutoTrader.FindPublicServer = function()
    State.AutoTrader.PruneRecentJobs()
    local candidates, fallback = {}, {}
    local cursor = nil
    for _ = 1, CONFIG.AutoTraderServerListPages do
        local url = "https://games.roblox.com/v1/games/" .. tostring(game.PlaceId)
            .. "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true"
        if cursor and cursor ~= "" then url = url .. "&cursor=" .. HttpService:UrlEncode(cursor) end
        local body = State.AutoTrader.HttpGetBody(url)
        if not body then break end
        local ok, decoded = pcall(function() return HttpService:JSONDecode(body) end)
        if not ok or type(decoded) ~= "table" then break end
        for _, server in ipairs(type(decoded.data) == "table" and decoded.data or {}) do
            local playing = tonumber(server.playing)
            local maxPlayers = tonumber(server.maxPlayers)
            local jobId = server.id
            if type(jobId) == "string" and jobId ~= "" and jobId ~= game.JobId
                and playing and maxPlayers and playing < maxPlayers then
                local row = {id = jobId, playing = playing, maxPlayers = maxPlayers}
                table.insert(fallback, row)
                if not State.AutoTrader.RecentJobs[jobId] then table.insert(candidates, row) end
            end
        end
        cursor = decoded.nextPageCursor
        if not cursor then break end
    end
    local pool = #candidates > 0 and candidates or fallback
    if #pool == 0 then return nil end
    table.sort(pool, function(a, b)
        if a.playing ~= b.playing then return a.playing > b.playing end
        return a.id < b.id
    end)
    local top = math.min(#pool, 10)
    return pool[math.random(1, top)]
end
State.AutoTrader.BeginTeleport = function(reason, sameJob)
    if State.AutoTrader.TeleportInProgress then return false end
    local queued, queueError = State.AutoTrader.QueueTeleportScript(reason)
    if not queued then
        State.AutoTrader.Status = "WAIT · TELEPORT QUEUE"
        State.AutoTrader.StatusDetail = "Automatic teleport was blocked because the executor queue_on_teleport function is unavailable: " .. tostring(queueError)
        State.AutoTrader.Render()
        return false
    end
    State.AutoTrader.TeleportInProgress = true
    State.AutoTrader.LastTeleportReason = tostring(reason)
    local teleportData = {svAutoTrader = true, reason = tostring(reason), fromJobId = game.JobId}
    local ok, err = pcall(function()
        if sameJob and #Players:GetPlayers() > 1 and type(game.JobId) == "string" and game.JobId ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer, nil, teleportData)
        else
            TeleportService:Teleport(game.PlaceId, LocalPlayer, teleportData)
        end
    end)
    if not ok then
        State.AutoTrader.TeleportInProgress = false
        State.AutoTrader.LastAnyMovementAt = os.clock()
        State.AutoTrader.Log("teleport_call_failed", {reason = reason, error = tostring(err)})
        return false
    end
    return true
end
State.AutoTrader.TryServerHop = function(disposition, counts)
    if not CONFIG.AutoTraderServerHopEnabled or State.AutoTrader.ServerHopInProgress or State.AutoTrader.TeleportInProgress then return false end
    if os.clock() - (State.AutoTrader.LastServerHopAttemptAt or 0) < CONFIG.AutoTraderServerHopRetrySeconds then return false end
    State.AutoTrader.LastServerHopAttemptAt = os.clock()
    State.AutoTrader.ServerHopInProgress = true
    State.AutoTrader.Status = "SERVER EXHAUSTED · HOPPING"
    State.AutoTrader.StatusDetail = tostring(disposition) .. " · looking for a populated public server."
    State.AutoTrader.Render()
    task.spawn(function()
        local server = State.AutoTrader.FindPublicServer()
        if Destroyed then return end
        if not server then
            State.AutoTrader.ServerHopInProgress = false
            State.AutoTrader.Status = "WAIT · SERVER HOP"
            State.AutoTrader.StatusDetail = "No eligible public server was returned; retrying automatically."
            State.AutoTrader.Log("server_hop_no_server", {disposition = disposition, counts = counts})
            State.AutoTrader.Render()
            return
        end
        State.AutoTrader.RecentJobs[server.id] = os.time()
        State.AutoTrader.SaveRecentJobs()
        State.AutoTrader.Log("server_hop_selected", {jobId = server.id, playing = server.playing, disposition = disposition})
        local queued, queueError = State.AutoTrader.QueueTeleportScript("server_hop:" .. tostring(disposition))
        if not queued then
            State.AutoTrader.ServerHopInProgress = false
            State.AutoTrader.Status = "WAIT · TELEPORT QUEUE"
            State.AutoTrader.StatusDetail = tostring(queueError)
            State.AutoTrader.Render()
            return
        end
        State.AutoTrader.TeleportInProgress = true
        local teleportData = {svAutoTrader = true, reason = "server_hop", fromJobId = game.JobId}
        local ok, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer, nil, teleportData)
        end)
        if not ok then
            State.AutoTrader.TeleportInProgress = false
            State.AutoTrader.ServerHopInProgress = false
            State.AutoTrader.Log("server_hop_failed", {jobId = server.id, error = tostring(err)})
            State.AutoTrader.Status = "WAIT · SERVER HOP"
            State.AutoTrader.StatusDetail = "Teleport failed; another server will be tried automatically."
            State.AutoTrader.Render()
        end
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
    if not State.AutoTrader.Preferences.automation or State.AutoTrader.SessionFrozen or State.AutoTrader.TeleportInProgress then return true end
    local baseline = math.max(State.AutoTrader.LastAnyMovementAt or now, State.AutoTrader.MovementWatchdogArmedAt or 0)
    if anyTrackable and now - baseline >= CONFIG.AutoTraderMovementTimeoutSeconds
        and now - (State.AutoTrader.LastSameServerRecoveryAt or 0) >= CONFIG.AutoTraderSameServerRecoveryCooldownSeconds then
        State.AutoTrader.LastSameServerRecoveryAt = now
        State.AutoTrader.LastAnyMovementAt = now
        State.AutoTrader.Status = "SERVER MOTIONLESS · REJOINING"
        State.AutoTrader.StatusDetail = "No tracked player moved for 20 continuous seconds; rejoining this session when possible."
        State.AutoTrader.Log("movement_watchdog_rejoin", {jobId = game.JobId, players = #Players:GetPlayers()})
        State.AutoTrader.Render()
        State.AutoTrader.BeginTeleport("movement_watchdog_same_server", true)
    end
    return true
end
State.AutoTrader.LoadRecentJobs()
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then State.AutoTrader.EnsureServerPlayer(player) end
end
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
    State.AutoTrader.MovementSamples[player.UserId] = nil
    State.AutoTrader.ServerExhaustedSince = 0
end)
connect(LocalPlayer.OnTeleport, function(teleportState)
    if teleportState == Enum.TeleportState.Started and not State.AutoTrader.TeleportQueued then
        State.AutoTrader.QueueTeleportScript("external_or_late_teleport")
    end
end)
connect(TeleportService.TeleportInitFailed, function(player, result, message)
    if player ~= LocalPlayer then return end
    State.AutoTrader.TeleportInProgress = false
    State.AutoTrader.ServerHopInProgress = false
    State.AutoTrader.LastAnyMovementAt = os.clock()
    State.AutoTrader.Log("teleport_init_failed", {result = tostring(result), message = tostring(message)})
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
State.AutoTrader.SelectTarget = function()
    local best = nil
    local bestScore = -math.huge
    local bestTotal = 0
    local now = os.clock()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer
            and player.Parent
            and State.AutoTrader.CooldownRemaining(player) <= 0 then
            local lastRequest = State.AutoTrader.RequestHistory[player.UserId] or 0
            if now - lastRequest >= CONFIG.AutoTraderRepeatRequestSeconds then
                local friend = State.AutoTrader.GetFriendStatus(player)
                local friendAllowed = not State.AutoTrader.Preferences.ignoreFriends or friend == false
                if friendAllowed then
                    local info = State.Profile.totalsByName[player.Name]
                    local verified = type(info) == "table"
                        and info.source == "GetFullInventoryVerified"
                        and not info.stale
                    local total = verified and tonumber(info.total) or nil
                    if total and total > 0 then
                        local score = State.AutoTrader.GetTargetScore(player, total)
                        if not best
                            or score > bestScore + 0.000001
                            or (math.abs(score - bestScore) <= 0.000001 and total > bestTotal)
                            or (math.abs(score - bestScore) <= 0.000001 and total == bestTotal and player.UserId < best.UserId) then
                            best = player
                            bestScore = score
                            bestTotal = total
                        end
                    end
                end
            end
        end
    end
    State.AutoTrader.SelectedTarget = best
    State.AutoTrader.SelectedTargetScore = bestScore
    State.AutoTrader.SelectedTargetValue = bestTotal
    State.AutoTrader.SelectedTargetProfile = best
        and State.AutoTrader.GetTargetProfile(best)
        or nil
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
    for _, entry in ipairs(entries or {}) do
        if entry.unitValue
            and entry.unitValue > 0
            and entry.unitValue <= CONFIG.AutoTraderAnchorMaxValue
            and entry.maxQuantity > 0 then
            local duplicate = entry.maxQuantity >= 2 and 1 or 0
            if not best then
                best = entry
            else
                local bestDuplicate = best.maxQuantity >= 2 and 1 or 0
                if State.AutoTrader.Preferences.preferDuplicates
                    and duplicate ~= bestDuplicate then
                    if duplicate > bestDuplicate then
                        best = entry
                    end
                elseif entry.demand ~= best.demand then
                    if entry.demand > best.demand then
                        best = entry
                    end
                elseif entry.unitValue > best.unitValue then
                    best = entry
                end
            end
        end
    end
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
State.AutoTrader.FindPlan = function(otherSummary, inventoryEntries, generation)
    local minWin, minInfo = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    local upper = otherSummary.knownFloor - minWin
    local diagnostics = {
        receiveKnownFloor = otherSummary.knownFloor,
        unknownCount = otherSummary.unknownCount,
        minimumWin = minWin,
        minimumWinInfo = minInfo,
        upper = upper,
        candidateCount = 0,
        peakStates = 1,
        pruned = false,
        quantityPruned = false,
        marketRejected = 0,
        marketRejectSamples = {},
        exactQuantityLimit = CONFIG.AutoTraderExactQuantityLimit,
        exactStateLimit = CONFIG.AutoTraderExactStateLimit,
        beamWidth = CONFIG.AutoTraderBeamWidth,
    }
    if upper <= 0 then
        return nil, "their known numeric value is too small for the dynamic minimum win", diagnostics
    end
    local candidates = {}
    for _, entry in ipairs(inventoryEntries or {}) do
        if entry.unitValue
            and entry.unitValue > 0
            and entry.unitValue <= upper
            and entry.maxQuantity
            and entry.maxQuantity > 0 then
            table.insert(candidates, entry)
        end
    end
    diagnostics.candidateCount = #candidates
    table.sort(candidates, function(a, b)
        if State.AutoTrader.Preferences.preferDuplicates
            and (a.maxQuantity >= 2) ~= (b.maxQuantity >= 2) then
            return a.maxQuantity >= 2
        end
        if a.unitValue ~= b.unitValue then
            return a.unitValue > b.unitValue
        end
        if a.demand ~= b.demand then
            return a.demand > b.demand
        end
        return a.key < b.key
    end)
    local states = {{total = 0, slots = 0, demandScore = 0, duplicateScore = 0, items = {}}}
    for candidateIndex, candidate in ipairs(candidates) do
        if Destroyed or generation ~= State.AutoTrader.PlanGeneration then
            return nil, "superseded", diagnostics
        end
        local maxUsableQuantity = math.min(
            math.floor(candidate.maxQuantity),
            math.max(0, math.floor(upper / candidate.unitValue + 0.000001))
        )
        if maxUsableQuantity > CONFIG.AutoTraderExactQuantityLimit then
            diagnostics.quantityPruned = true
        end
        local options = State.AutoTrader.QuantityOptions(candidate.maxQuantity, candidate.unitValue, 0, upper)
        if #options > 0 then
            local byBucket = {}
            local function consider(state)
                local bucket = math.floor(state.total * 100 + 0.5)
                local existing = byBucket[bucket]
                if not existing
                    or state.total > existing.total + 0.000001
                    or (math.abs(state.total - existing.total) <= 0.000001 and state.slots < existing.slots)
                    or (math.abs(state.total - existing.total) <= 0.000001 and state.slots == existing.slots and State.AutoTrader.Preferences.preferDuplicates and state.duplicateScore > existing.duplicateScore)
                    or (math.abs(state.total - existing.total) <= 0.000001 and state.slots == existing.slots and state.duplicateScore == existing.duplicateScore and state.demandScore > existing.demandScore) then
                    byBucket[bucket] = state
                end
            end
            for _, state in ipairs(states) do
                consider(state)
                if state.slots < CONFIG.MaxOfferSlots then
                    for _, quantity in ipairs(options) do
                        local total = state.total + candidate.unitValue * quantity
                        if total <= upper + 0.000001 then
                            local items = {}
                            for itemIndex, item in ipairs(state.items) do
                                items[itemIndex] = item
                            end
                            table.insert(items, {
                                key = candidate.key,
                                itemId = candidate.itemId,
                                itemType = candidate.itemType,
                                name = candidate.name,
                                quantity = quantity,
                                unitValue = candidate.unitValue,
                                record = candidate.record,
                                demand = candidate.demand,
                                reserve = candidate.reserve,
                            })
                            consider({
                                total = total,
                                slots = state.slots + 1,
                                demandScore = state.demandScore + candidate.demand * candidate.unitValue * quantity,
                                duplicateScore = state.duplicateScore + (candidate.maxQuantity >= 2 and quantity or 0),
                                items = items,
                            })
                        end
                    end
                end
            end
            local nextStates = {}
            for _, state in pairs(byBucket) do
                table.insert(nextStates, state)
            end
            diagnostics.peakStates = math.max(diagnostics.peakStates, #nextStates)
            if #nextStates > CONFIG.AutoTraderExactStateLimit then
                diagnostics.pruned = true
                table.sort(nextStates, function(a, b)
                    local aDistance = upper - a.total
                    local bDistance = upper - b.total
                    if math.abs(aDistance - bDistance) > 0.000001 then
                        return aDistance < bDistance
                    end
                    if a.slots ~= b.slots then
                        return a.slots < b.slots
                    end
                    if State.AutoTrader.Preferences.preferDuplicates and a.duplicateScore ~= b.duplicateScore then
                        return a.duplicateScore > b.duplicateScore
                    end
                    return a.demandScore > b.demandScore
                end)
                while #nextStates > CONFIG.AutoTraderBeamWidth do
                    table.remove(nextStates)
                end
            end
            states = nextStates
        end
        if candidateIndex % 6 == 0 then
            RunService.Heartbeat:Wait()
        end
    end
    table.sort(states, function(a, b)
        if math.abs(a.total - b.total) > 0.000001 then
            return a.total > b.total
        end
        if a.slots ~= b.slots then
            return a.slots < b.slots
        end
        if State.AutoTrader.Preferences.preferDuplicates and a.duplicateScore ~= b.duplicateScore then
            return a.duplicateScore > b.duplicateScore
        end
        return a.demandScore > b.demandScore
    end)
    local best = nil
    local bestMarket = nil
    for _, state in ipairs(states) do
        if state.slots > 0 and state.total <= upper + 0.000001 then
            local marketOK, market = State.AutoTrader.EvaluateMarketGate(state, otherSummary)
            if marketOK then
                best = state
                bestMarket = market
                break
            end
            diagnostics.marketRejected += 1
            if #diagnostics.marketRejectSamples < 5 then
                table.insert(diagnostics.marketRejectSamples, {
                    total = state.total,
                    failures = market.failures,
                })
            end
        end
    end
    diagnostics.closest = best and best.total or nil
    diagnostics.solverMode = diagnostics.pruned
        and "adaptive-beam"
        or (diagnostics.quantityPruned and "exact-state-dp+sampled-quantity" or "exact-state-dp")
    if not best then
        if diagnostics.marketRejected > 0 then
            return nil, "market-quality gate rejected every candidate combination", diagnostics
        end
        return nil, "no numeric local combination can preserve the dynamic minimum win", diagnostics
    end
    best.minWin = minWin
    best.minimumWinInfo = minInfo
    best.receiveTotal = otherSummary.knownFloor
    best.unknownCount = otherSummary.unknownCount
    best.win = otherSummary.knownFloor - best.total
    best.marketGate = bestMarket
    State.AutoTrader.LastMarketGate = bestMarket
    return best, nil, diagnostics
end
State.AutoTrader.ValidatePlan = function(
    plan,
    expectedOtherHash,
    expectedMappingRevision,
    expectedInventoryStamp,
    expectedDatabase,
    expectedPartnerUserId
)
    local checks = {}
    local function fail(reason)
        checks.ok = false
        checks.reason = reason
        return false, checks
    end
    if not plan or type(plan.items) ~= "table" then
        return fail("missing plan")
    end
    if State.Mapping.Revision ~= expectedMappingRevision then
        return fail("mapping revision changed")
    end
    if SupremeDatabase ~= expectedDatabase then
        return fail("Supreme database changed")
    end
    local remoteState = State.Profile.remoteTotals
    if not remoteState
        or remoteState.lastSuccessByUserId[LocalPlayer.UserId] ~= expectedInventoryStamp then
        return fail("local inventory snapshot changed")
    end
    if type(State.CurrentTrade) ~= "table" then
        return fail("trade state disappeared")
    end
    local _, currentOtherSide = getTradeSides(State.CurrentTrade)
    if not currentOtherSide then
        return fail("current trade partner is unavailable")
    end
    local currentPartner = State.AutoTrader.GetPlayerFromSide(currentOtherSide)
    if expectedPartnerUserId
        and (not currentPartner or currentPartner.UserId ~= expectedPartnerUserId) then
        return fail("trade partner changed")
    end
    local currentOtherEntries = resolveTradeOffer(currentOtherSide)
    local currentHash = State.AutoTrader.OfferHash(currentOtherEntries)
    if currentHash ~= expectedOtherHash then
        return fail("their offer changed")
    end
    if State.AutoTrader.LastOtherHash ~= expectedOtherHash
        or os.clock() - State.AutoTrader.OtherStableSince < CONFIG.AutoTraderStableSeconds then
        return fail("their offer is not stable")
    end
    local otherSummary = State.AutoTrader.SummarizeOther(currentOtherEntries)
    if otherSummary.slotCount == 0 then
        return fail("their offer disappeared")
    end
    if not State.AutoTrader.Preferences.unknownTheirZero
        and otherSummary.unknownCount > 0 then
        return fail("their offer contains unknown value data")
    end
    local tradable, inventoryReason = State.AutoTrader.GetTradableInventory()
    if not tradable then
        return fail(tostring(inventoryReason or "tradable inventory unavailable"))
    end
    local allowed = {}
    for _, entry in ipairs(tradable) do
        allowed[entry.key] = entry
    end
    local recomputed = 0
    local slots = 0
    for _, item in ipairs(plan.items) do
        slots += 1
        local source = allowed[item.key]
        if not source then
            return fail("plan contains an unavailable or reserved item")
        end
        local quantity = math.floor(tonumber(item.quantity) or 0)
        if quantity < 1 or quantity > source.maxQuantity then
            return fail("plan violates a reserve or owned quantity")
        end
        if not source.unitValue or source.unitValue <= 0 then
            return fail("plan contains a nonnumeric local item")
        end
        recomputed += source.unitValue * quantity
    end
    if slots < 1 or slots > CONFIG.MaxOfferSlots then
        return fail("plan violates the slot cap")
    end
    if math.abs(recomputed - plan.total) > 0.001 then
        return fail("plan total does not recompute")
    end
    local minWin, minInfo = State.AutoTrader.GetEffectiveMinimumWin(otherSummary)
    local profit = otherSummary.knownFloor - recomputed
    if profit < minWin - 0.001 then
        checks.minimumWin = minWin
        checks.minimumWinInfo = minInfo
        return fail("profit is below the dynamic minimum win")
    end
    local marketOK, market = State.AutoTrader.EvaluateMarketGate(plan, otherSummary)
    checks.marketGate = market
    State.AutoTrader.LastMarketGate = market
    if not marketOK then
        return fail(
            "market-quality gate failed: "
            .. table.concat(market.failures or {}, "; ")
        )
    end
    checks.ok = true
    checks.reason = "independent safety validation passed"
    checks.profit = profit
    checks.minimumWin = minWin
    checks.minimumWinInfo = minInfo
    checks.give = recomputed
    checks.receiveKnownFloor = otherSummary.knownFloor
    checks.unknownCount = otherSummary.unknownCount
    checks.slots = slots
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
State.AutoTrader.Freeze = function(reason)
    if State.AutoTrader.SessionFrozen then
        return
    end
    State.AutoTrader.SessionFrozen = tostring(reason or "safety stop")
    State.AutoTrader.ActionGeneration += 1
    State.AutoTrader.ActionInFlight = nil
    State.AutoTrader.Desired = nil
    State.AutoTrader.Status = "FROZEN · SAFETY STOP"
    State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
    State.AutoTrader.Log("freeze", {
        reason = State.AutoTrader.SessionFrozen,
    })
    if State.AutoTrader.RestoreTradeVisuals then
        State.AutoTrader.RestoreTradeVisuals()
    end
    if State.AutoTrader.Render then
        State.AutoTrader.Render()
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
State.AutoTrader.ActionContextValid = function(context)
    if not State.AutoTrader.Preferences.automation then
        return false, "Auto Trading is off"
    end
    if State.AutoTrader.SessionFrozen then
        return false, State.AutoTrader.SessionFrozen
    end
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
    if context and context.database and SupremeDatabase ~= context.database then
        return false, "Supreme database changed"
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
    addCorner(frame, 11)
    addStroke(frame, THEME.green, 1, 0.05)
    local title = makeLabel(frame, "AUTO TRADE COMPLETE", 11, THEME.green, Enum.Font.GothamBold)
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
    local body = makeLabel(frame, details, 9, THEME.text, Enum.Font.GothamMedium)
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
    State.AutoTrader.LastTradeUpdateAt = os.clock()
    State.AutoTrader.LastTradeActivityAt = State.AutoTrader.LastTradeUpdateAt
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
    local safe, safety = State.AutoTrader.ValidatePlan(
        plan,
        otherHash,
        State.Mapping.Revision,
        inventoryStamp,
        SupremeDatabase,
        partner.UserId
    )
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
        State.AutoTrader.Freeze("Auto Accept call failed: " .. tostring(err))
        return false
    end
    return true
end
State.AutoTrader.RunPostTradeAudit = function(audit, receivedItems, partner, completedPlan, tradeSeconds)
    if not audit then
        State.AutoTrader.PostTradeAuditPending = false
        State.AutoTrader.Preferences.automation = false
        State.AutoTrader.SavePreferences()
        State.AutoTrader.SessionFrozen = "Server completed a trade without a usable pre-trade audit snapshot. Auto Trading was disabled."
        State.AutoTrader.Status = "FROZEN · AUDIT MISSING"
        State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
        if partner then
            State.AutoTrader.RecordTargetEvent(partner, "auditFailure")
        end
        State.AutoTrader.Render()
        return
    end
    State.AutoTrader.PostTradeAuditPending = true
    State.AutoTrader.PostTradeAuditGeneration += 1
    local generation = State.AutoTrader.PostTradeAuditGeneration
    local expected = {}
    for key, quantity in pairs(audit.expected or {}) do
        expected[key] = quantity
    end
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
        for key in pairs(audit.incoming or {}) do
            keys[key] = true
        end
        for key in pairs(serverIncoming) do
            keys[key] = true
        end
        for key in pairs(keys) do
            local wanted = audit.incoming[key] or 0
            local observed = serverIncoming[key] or 0
            if wanted ~= observed then
                table.insert(serverMismatches, {
                    key = key,
                    expectedReceived = wanted,
                    serverReported = observed,
                })
            end
        end
    end
    State.AutoTrader.Status = "AUDITING TRADE"
    State.AutoTrader.StatusDetail = "Trade completed. Verifying the server-reported incoming items and a fresh full inventory delta before selecting another player."
    State.AutoTrader.Render()
    task.delay(0.35, function()
        if Destroyed or generation ~= State.AutoTrader.PostTradeAuditGeneration then
            return
        end
        State.Profile.QueueRemoteLeaderboardSweep(true)
    end)
    task.spawn(function()
        local deadline = os.clock() + CONFIG.AutoTraderPostTradeAuditTimeoutSeconds
        local fresh = nil
        local freshReason = nil
        while not Destroyed and generation == State.AutoTrader.PostTradeAuditGeneration and os.clock() < deadline do
            task.wait(0.25)
            local remoteState = State.Profile.remoteTotals
            local stamp = remoteState and remoteState.lastSuccessByUserId[LocalPlayer.UserId] or nil
            if stamp and audit.stamp and stamp > audit.stamp then
                State.AutoTrader.InventoryCache = nil
                State.AutoTrader.InventoryCacheStamp = nil
                fresh, freshReason = State.AutoTrader.GetLocalAuditSnapshot(true)
                if fresh then
                    break
                end
            end
        end
        if Destroyed or generation ~= State.AutoTrader.PostTradeAuditGeneration then
            return
        end
        if not fresh then
            State.AutoTrader.PostTradeAuditPending = false
            State.AutoTrader.Preferences.automation = false
            State.AutoTrader.SavePreferences()
            State.AutoTrader.SessionFrozen = "Post-trade audit could not obtain a fresh verified inventory. Auto Trading was disabled."
            State.AutoTrader.Status = "FROZEN · AUDIT TIMEOUT"
            State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
            State.AutoTrader.LastAuditDetail = {
                result = "timeout",
                reason = freshReason,
                expected = expected,
                outgoing = audit.outgoing,
                incoming = audit.incoming,
                serverIncoming = serverIncoming,
                serverMismatches = serverMismatches,
            }
            if partner then
                State.AutoTrader.RecordTargetEvent(partner, "auditFailure")
            end
            State.AutoTrader.Log("post_trade_audit_timeout", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Inventory audit unavailable · Auto Trading disabled")
            State.AutoTrader.Render()
            return
        end
        local quantities = fresh.quantities or {}
        local inventoryMismatches = {}
        for key, wanted in pairs(expected) do
            local observed = quantities[key] or 0
            if observed ~= wanted then
                table.insert(inventoryMismatches, {
                    key = key,
                    expected = wanted,
                    observed = observed,
                    before = audit.before and audit.before[key] or 0,
                    gave = audit.outgoing and audit.outgoing[key] or 0,
                    received = audit.incoming and audit.incoming[key] or 0,
                })
            end
        end
        State.AutoTrader.PostTradeAuditPending = false
        local failed = #serverMismatches > 0 or #inventoryMismatches > 0
        State.AutoTrader.LastAuditDetail = {
            result = failed and "failed" or "passed",
            stampBefore = audit.stamp,
            stampAfter = fresh.lastSuccess,
            prePartial = audit.partial,
            postPartial = fresh.partial,
            expected = expected,
            outgoing = audit.outgoing,
            incoming = audit.incoming,
            serverIncoming = serverIncoming,
            serverMismatches = serverMismatches,
            inventoryMismatches = inventoryMismatches,
        }
        if failed then
            State.AutoTrader.Preferences.automation = false
            State.AutoTrader.SavePreferences()
            State.AutoTrader.SessionFrozen = "Post-trade inventory or server-reported receipt differed from the exact expected transaction. Auto Trading was disabled."
            State.AutoTrader.Status = "FROZEN · AUDIT MISMATCH"
            State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
            if partner then
                State.AutoTrader.RecordTargetEvent(partner, "auditFailure")
            end
            State.AutoTrader.Log("post_trade_audit_failed", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Full transaction audit mismatch · Auto Trading disabled")
        else
            State.AutoTrader.LastAcceptAudit = {
                result = "passed",
                stamp = fresh.lastSuccess,
                checked = expected,
                outgoing = audit.outgoing,
                incoming = audit.incoming,
            }
            if partner then
                State.AutoTrader.RecordTargetEvent(partner, "success", {
                    profit = completedPlan and completedPlan.win or 0,
                    seconds = tradeSeconds,
                })
                State.AutoTrader.MarkServerPlayerOutcome(partner, "traded", "post-trade audit passed")
            end
            State.AutoTrader.Status = "TRADE COMPLETE · VERIFIED"
            State.AutoTrader.StatusDetail = "Server receipt and fresh incoming/outgoing inventory deltas both matched the exact automated trade."
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
            State.AutoTrader.Log("post_trade_audit_passed", State.AutoTrader.LastAuditDetail)
            State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Full incoming + outgoing audit ✓")
        end
        State.AutoTrader.Render()
    end)
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
        State.AutoTrader.Status = "OFFER READY · AUTO ACCEPT"
        State.AutoTrader.StatusDetail = "Exact verified plan is present. Running the final acceptance gate."
    end
    State.AutoTrader.Render()
    if context and context.kind == "plan" then
        State.AutoTrader.TryAutoAccept()
    end
end
State.AutoTrader.BuildActionContext = function(kind, otherHash, inventorySnapshot, partner)
    return {
        kind = kind,
        otherHash = otherHash,
        mappingRevision = State.Mapping.Revision,
        inventoryStamp = inventorySnapshot and inventorySnapshot.lastSuccess or nil,
        database = SupremeDatabase,
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
    return main
        and safeFindPath(main, {"Game", "Leaderboard", "Container", "TradeRequest"})
end
State.AutoTrader.BindRequestCancelObserver = function()
    local frame = State.AutoTrader.GetRequestFrame()
    local sending = frame and frame:FindFirstChild("SendingRequest")
    local cancel = sending and sending:FindFirstChild("Cancel")
    if not cancel or not cancel:IsA("GuiButton") or State.AutoTrader.RequestCancelButton == cancel then
        return
    end
    State.AutoTrader.RequestCancelButton = cancel
    connect(cancel.MouseButton1Click, function()
        local pending = State.AutoTrader.PendingRequest
        if not pending then
            return
        end
        State.AutoTrader.Log("request_canceled_locally", pending)
        local player = Players:GetPlayerByUserId(pending.userId)
        if player then State.AutoTrader.MarkServerPlayerOutcome(player, "local_cancel", "request canceled locally") end
        State.AutoTrader.PendingRequest = nil
        State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
        State.AutoTrader.Status = "REQUEST CANCELED"
        State.AutoTrader.StatusDetail = "You canceled the pending request; no unwilling-player cooldown was applied."
        State.AutoTrader.Render()
    end)
end
State.AutoTrader.ShowOutgoingRequest = function(target)
    local frame = State.AutoTrader.GetRequestFrame()
    if not frame or not frame:IsA("GuiObject") then
        return
    end
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiObject") then
            child.Visible = child.Name == "SendingRequest"
        end
    end
    local sending = frame:FindFirstChild("SendingRequest")
    local username = sending and sending:FindFirstChild("Username")
    if username and (username:IsA("TextLabel") or username:IsA("TextButton") or username:IsA("TextBox")) then
        username.Text = target.Name
    end
    frame.Visible = true
    State.AutoTrader.BindRequestCancelObserver()
end
State.AutoTrader.TrySendRequest = function()
    if Destroyed
        or not State.AutoTrader.Preferences.automation
        or State.AutoTrader.SessionFrozen
        or State.AutoTrader.PendingRequest
        or type(State.CurrentTrade) == "table"
        or (isTradeVisible and isTradeVisible())
        or os.clock() < State.AutoTrader.NextRequestAt then
        return
    end
    local target = State.AutoTrader.SelectTarget()
    if not target then
        State.AutoTrader.Status = "WAIT · TARGET"
        State.AutoTrader.StatusDetail = State.AutoTrader.Preferences.ignoreFriends
            and "No verified non-friend target with positive known value is ready."
            or "No verified target with positive known value is ready."
        State.AutoTrader.Render()
        return
    end
    local friendAllowed, reason = State.AutoTrader.PlayerAllowed(target)
    if not friendAllowed then
        State.AutoTrader.Status = "WAIT · TARGET"
        State.AutoTrader.StatusDetail = tostring(reason)
        State.AutoTrader.Render()
        return
    end
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("SendRequest")
    if not remote or not remote:IsA("RemoteFunction") then
        State.AutoTrader.Freeze("Trade.SendRequest RemoteFunction is unavailable.")
        return
    end
    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
    State.AutoTrader.RequestHistory[target.UserId] = os.clock()
    State.AutoTrader.RecordTargetEvent(target, "request")
    State.AutoTrader.PendingRequest = {
        userId = target.UserId,
        name = target.Name,
        sentAt = os.clock(),
    }
    State.AutoTrader.MarkServerPlayerOutcome(target, "request_pending", "request sent")
    State.AutoTrader.Status = "REQUESTING"
    State.AutoTrader.StatusDetail = "Sending one request to " .. target.Name .. ". No other request can be sent while this is pending."
    State.AutoTrader.Log("request_send", {
        userId = target.UserId,
        name = target.Name,
    })
    State.AutoTrader.Render()
    task.spawn(function()
        local ok, result = pcall(function()
            return remote:InvokeServer(target)
        end)
        if Destroyed then
            return
        end
        local pending = State.AutoTrader.PendingRequest
        if not pending or pending.userId ~= target.UserId then
            return
        end
        if not ok then
            State.AutoTrader.PendingRequest = nil
            State.AutoTrader.MarkServerPlayerOutcome(target, "unavailable", "request call failed")
            State.AutoTrader.SetCooldown(target, "request call failed")
            State.AutoTrader.Status = "WAIT · REQUEST FAILED"
            State.AutoTrader.StatusDetail = tostring(result)
            State.AutoTrader.Render()
            return
        end
        if result == true then
            State.AutoTrader.PendingRequest = nil
            State.AutoTrader.MarkServerPlayerOutcome(target, "unavailable", "request unavailable/denied")
            State.AutoTrader.SetCooldown(target, "request unavailable/denied")
            State.AutoTrader.Status = "COOLDOWN · UNAVAILABLE"
            State.AutoTrader.StatusDetail = target.Name .. " could not be requested; cooling down for about 2 minutes."
        else
            State.AutoTrader.ShowOutgoingRequest(target)
            State.AutoTrader.Status = "REQUEST PENDING"
            State.AutoTrader.StatusDetail = "Waiting for " .. target.Name .. " to accept or decline. This request is not repeated."
        end
        State.AutoTrader.Log("request_result", {
            userId = target.UserId,
            result = result,
        })
        State.AutoTrader.Render()
    end)
end
State.AutoTrader.OnTradeState = function(localSide, otherSide, localEntries, otherEntries)
    local partner = State.AutoTrader.GetPlayerFromSide(otherSide)
    State.AutoTrader.LastTradePartner = partner
    if not partner then
        State.AutoTrader.Status = "WAIT · PARTNER"
        State.AutoTrader.StatusDetail = "Trade partner could not be identified."
        State.AutoTrader.Render()
        return
    end
    if State.AutoTrader.PendingRequest and State.AutoTrader.PendingRequest.userId == partner.UserId then
        State.AutoTrader.PendingRequest = nil
    end
    local allowed, allowReason = State.AutoTrader.PlayerAllowed(partner)
    if not allowed then
        State.AutoTrader.SetManagedPartner(nil)
        State.AutoTrader.RestoreTradeVisuals()
        State.AutoTrader.Plan = nil
        State.AutoTrader.Desired = nil
        State.AutoTrader.Status = allowReason == "friend status pending"
            and "WAIT · FRIEND CHECK"
            or "FROZEN · FRIEND"
        State.AutoTrader.StatusDetail = tostring(allowReason)
        State.AutoTrader.Render()
        return
    end
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
        State.AutoTrader.Status = "WAIT · INVENTORY"
        State.AutoTrader.StatusDetail = tostring(inventoryReason or "Waiting for verified local inventory.")
        State.AutoTrader.Plan = nil
        State.AutoTrader.Desired = nil
        State.AutoTrader.Render()
        return
    end
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
    local mappingRevision = State.Mapping.Revision
    local inventoryStamp = inventorySnapshot and inventorySnapshot.lastSuccess or nil
    local calculationSignature = otherHash
        .. "|"
        .. tostring(mappingRevision)
        .. "|"
        .. tostring(inventoryStamp)
        .. "|"
        .. tostring(SupremeDatabase)
        .. "|"
        .. tostring(State.AutoTrader.Preferences.winPreset)
        .. "|"
        .. tostring(State.AutoTrader.Preferences.preferDuplicates)
        .. "|"
        .. tostring(State.AutoTrader.ReserveTypeCount())
        .. "|"
        .. tostring(State.AutoTrader.Preferences.unknownTheirZero)
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
    local expectedDatabase = SupremeDatabase
    local expectedPartnerUserId = partner.UserId
    State.AutoTrader.Status = "CALCULATING"
    State.AutoTrader.StatusDetail = "Finding the highest-value market-safe offer that preserves the dynamic minimum win after reserves."
    State.AutoTrader.Render()
    task.spawn(function()
        local plan, reason, diagnostics = State.AutoTrader.FindPlan(otherSummary, tradable, generation)
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
        local safe, safety = State.AutoTrader.ValidatePlan(
            plan,
            otherHash,
            mappingRevision,
            inventoryStamp,
            expectedDatabase,
            expectedPartnerUserId
        )
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
        State.AutoTrader.Plan = plan
        State.AutoTrader.Desired = {
            items = plan.items,
            kind = "plan",
        }
        State.AutoTrader.Status = State.AutoTrader.Preferences.automation
            and "PLAN VERIFIED"
            or "SHADOW READY"
        State.AutoTrader.StatusDetail = State.AutoTrader.Preferences.automation
            and "Plan passed dynamic-profit and market-quality validation; reconciling one verified mutation at a time, then auto-accepting after the cooldown."
            or "Plan passed dynamic-profit and market-quality validation. Auto Trading is currently off."
        State.AutoTrader.Log("plan_ready", {
            receiveKnownFloor = plan.receiveTotal,
            unknownCount = plan.unknownCount,
            give = plan.total,
            win = plan.win,
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
    State.AutoTrader.PlanGeneration += 1
    State.AutoTrader.ActionGeneration += 1
    State.AutoTrader.ActionInFlight = nil
    State.AutoTrader.LastTradePartner = nil
    State.AutoTrader.ManagedPartnerUserId = nil
    State.AutoTrader.LastManagedLocalHash = nil
    State.AutoTrader.LastOtherHash = nil
    State.AutoTrader.LastCalculationSignature = nil
    State.AutoTrader.OtherStableSince = 0
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
    State.AutoTrader.RestoreTradeVisuals()
end
State.AutoTrader.OnNoTrade = function()
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
    if State.AutoTrader.PendingRequest then
        local player = Players:GetPlayerByUserId(State.AutoTrader.PendingRequest.userId)
        if not player then
            State.AutoTrader.Log("pending_target_left", State.AutoTrader.PendingRequest)
            State.AutoTrader.PendingRequest = nil
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
        else
            State.AutoTrader.Status = "REQUEST PENDING"
            State.AutoTrader.StatusDetail = "Waiting up to 12s for " .. player.Name .. " to accept or decline."
            State.AutoTrader.SelectedTarget = player
            State.AutoTrader.Render()
            return
        end
    end
    local target = State.AutoTrader.SelectTarget()
    if State.AutoTrader.Preferences.automation then
        if State.AutoTrader.SessionFrozen then
            State.AutoTrader.Status = "FROZEN · SAFETY STOP"
            State.AutoTrader.StatusDetail = State.AutoTrader.SessionFrozen
        elseif target then
            State.AutoTrader.ServerExhaustedSince = 0
            State.AutoTrader.Status = "AUTO TARGET"
            State.AutoTrader.StatusDetail = "Next eligible: " .. target.Name .. ". Ranked by expected profit/time plus verified inventory quality; one request at a time."
            State.AutoTrader.TrySendRequest()
        else
            local disposition, counts = State.AutoTrader.GetServerDisposition()
            State.AutoTrader.LastServerDisposition = {kind = disposition, counts = counts, at = os.clock()}
            if disposition == "WAITING_FOR_DISCOVERY" then
                State.AutoTrader.ServerExhaustedSince = 0
                State.AutoTrader.KickServerDiscovery()
                State.AutoTrader.Status = "WAIT · DISCOVERY"
                State.AutoTrader.StatusDetail = "No target yet; " .. tostring(counts.unknown) .. " player inventory/inventories are still inside the bounded discovery window."
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
                State.AutoTrader.Status = "WAIT · TARGET"
                State.AutoTrader.StatusDetail = "No target is ready yet (" .. tostring(disposition) .. ")."
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
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local info = State.Profile.totalsByName[player.Name]
            local verified = type(info) == "table"
                and info.source == "GetFullInventoryVerified"
                and not info.stale
            local total = verified and tonumber(info.total) or nil
            local rawStats = State.AutoTrader.TargetStats[tostring(player.UserId)]
            local profile = total and State.AutoTrader.GetTargetProfile(player) or nil
            local score = total and State.AutoTrader.GetTargetScore(player, total) or nil
            table.insert(serverCandidates, {
                name = player.Name,
                userId = player.UserId,
                verifiedTotal = total,
                score = score,
                profile = profile,
                stats = rawStats,
                friend = State.AutoTrader.FriendCache[player.UserId],
                friendMeta = State.AutoTrader.FriendCacheMeta[player.UserId],
                serverState = State.AutoTrader.ServerPlayers[player.UserId],
                cooldown = State.AutoTrader.CooldownRemaining(player),
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
    for _ in pairs(State.AutoTrader.TargetStats or {}) do
        persistentStatsCount += 1
    end
    local payload = {
        format = "SV_AUTO_TRADER_SUPPORT_V5",
        version = CONFIG.version,
        generatedUnix = os.time(),
        generatedClock = os.clock(),
        supportInstruction = "Paste this entire block into ChatGPT when asking about Auto Trader behavior.",
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
            maxOfferSlots = CONFIG.MaxOfferSlots,
            exactStateLimit = CONFIG.AutoTraderExactStateLimit,
            beamWidth = CONFIG.AutoTraderBeamWidth,
            exactQuantityLimit = CONFIG.AutoTraderExactQuantityLimit,
        },
        database = {
            status = DatabaseStatus,
            lastDatabaseLoad = LastDatabaseLoad,
            catalogItems = #Catalog,
            gameDatabaseSource = State.GameDatabaseSource,
            mappingRevision = State.Mapping.Revision,
            mappingEntries = mappingEntryCount(LinkedImages, State.Mapping.ItemLinks),
        },
        status = State.AutoTrader.Status,
        statusDetail = State.AutoTrader.StatusDetail,
        sessionFrozen = State.AutoTrader.SessionFrozen,
        target = State.AutoTrader.SelectedTarget and {
            name = State.AutoTrader.SelectedTarget.Name,
            userId = State.AutoTrader.SelectedTarget.UserId,
            score = State.AutoTrader.SelectedTargetScore,
            verifiedValue = State.AutoTrader.SelectedTargetValue,
            profile = State.AutoTrader.SelectedTargetProfile,
            stats = State.AutoTrader.TargetStats[tostring(State.AutoTrader.SelectedTarget.UserId)],
        } or nil,
        serverCandidates = serverCandidates,
        serverLifecycle = {
            jobId = game.JobId,
            placeId = game.PlaceId,
            joinedClock = State.AutoTrader.ServerJoinedAt,
            disposition = State.AutoTrader.LastServerDisposition,
            exhaustedSince = State.AutoTrader.ServerExhaustedSince,
            hopInProgress = State.AutoTrader.ServerHopInProgress,
            teleportInProgress = State.AutoTrader.TeleportInProgress,
            teleportQueued = State.AutoTrader.TeleportQueued,
            lastTeleportReason = State.AutoTrader.LastTeleportReason,
            recentJobs = State.AutoTrader.RecentJobs,
            playerStates = State.AutoTrader.ServerPlayers,
            lastAnyMovementAt = State.AutoTrader.LastAnyMovementAt,
            watchdogArmedAt = State.AutoTrader.MovementWatchdogArmedAt,
        },
        pendingRequest = State.AutoTrader.PendingRequest,
        partner = partner and {
            name = partner.Name,
            userId = partner.UserId,
            friend = State.AutoTrader.FriendCache[partner.UserId],
            friendMeta = State.AutoTrader.FriendCacheMeta[partner.UserId],
            serverState = State.AutoTrader.ServerPlayers[partner.UserId],
            cooldown = State.AutoTrader.CooldownRemaining(partner),
            profile = State.AutoTrader.GetTargetProfile(partner),
            stats = State.AutoTrader.TargetStats[tostring(partner.UserId)],
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
        },
        recentLog = State.AutoTrader.DebugLog,
    }
    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(payload)
    end)
    if not ok then
        return nil, tostring(encoded)
    end
    return "SV_AUTO_TRADER_SUPPORT_V5\n" .. encoded
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
UI.AutoTraderLauncher = makeButton(
    UI.RootGui,
    "AUTO TRADER",
    UDim2.fromOffset(112, 32),
    THEME.panel2
)
UI.AutoTraderLauncher.Name = "SV_AutoTraderLauncher"
UI.AutoTraderLauncher.AnchorPoint = Vector2.new(1, 1)
UI.AutoTraderLauncher.Position = UDim2.new(1, -18, 1, -18)
UI.AutoTraderLauncher.ZIndex = 1500
UI.AutoTraderLauncher.TextColor3 = THEME.blue
addStroke(UI.AutoTraderLauncher, THEME.border, 1, 0.15)
UI.AutoTraderLauncherScale = create("UIScale", {Scale = 1}, UI.AutoTraderLauncher)
UI.AutoTraderPanel = create("Frame", {
    Name = "SV_AutoTraderPanel",
    AnchorPoint = Vector2.new(1, 0.5),
    Position = UDim2.new(1, -604, 0.5, 0),
    Size = UDim2.fromOffset(350, 620),
    BackgroundColor3 = THEME.bg,
    BorderSizePixel = 0,
    Visible = false,
    ZIndex = 1450,
}, UI.RootGui)
if type(State.AutoTrader.Preferences.panelPosition) == "table" then
    local p = State.AutoTrader.Preferences.panelPosition
    UI.AutoTraderPanel.Position = UDim2.new(
        tonumber(p.xs) or 1,
        tonumber(p.xo) or -604,
        tonumber(p.ys) or 0.5,
        tonumber(p.yo) or 0
    )
end
addCorner(UI.AutoTraderPanel, 13)
addStroke(UI.AutoTraderPanel, THEME.border, 1, 0.1)
UI.AutoTraderScale = create("UIScale", {Scale = 1}, UI.AutoTraderPanel)
UI.AutoTraderHeader = create("Frame", {
    Position = UDim2.fromOffset(0, 0),
    Size = UDim2.new(1, -54, 0, 46),
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    Active = true,
    ZIndex = 1451,
}, UI.AutoTraderPanel)
UI.AutoTraderTitle = makeLabel(UI.AutoTraderHeader, "AUTO TRADER", 12, THEME.text, Enum.Font.GothamBold)
UI.AutoTraderTitle.Position = UDim2.fromOffset(14, 9)
UI.AutoTraderTitle.Size = UDim2.new(1, -18, 0, 18)
UI.AutoTraderTitle.ZIndex = 1452
UI.AutoTraderSubtitle = makeLabel(
    UI.AutoTraderHeader,
    "FULL AUTO · BACKGROUND TRADE · SAFETY GATED",
    9,
    THEME.green,
    Enum.Font.GothamBold
)
UI.AutoTraderSubtitle.Position = UDim2.fromOffset(14, 28)
UI.AutoTraderSubtitle.Size = UDim2.new(1, -18, 0, 14)
UI.AutoTraderSubtitle.ZIndex = 1452
UI.AutoTraderClose = makeButton(UI.AutoTraderPanel, "×", UDim2.fromOffset(30, 26), THEME.panel2)
UI.AutoTraderClose.Position = UDim2.new(1, -44, 0, 8)
UI.AutoTraderClose.TextColor3 = THEME.red
UI.AutoTraderClose.ZIndex = 1453
UI.AutoTraderEnabled = makeButton(UI.AutoTraderPanel, "", UDim2.new(1, -28, 0, 30), THEME.panel2)
UI.AutoTraderEnabled.Position = UDim2.fromOffset(14, 52)
UI.AutoTraderEnabled.ZIndex = 1451
UI.AutoTraderIgnoreFriends = makeButton(UI.AutoTraderPanel, "", UDim2.new(0.5, -17, 0, 30), THEME.panel2)
UI.AutoTraderIgnoreFriends.Position = UDim2.fromOffset(14, 88)
UI.AutoTraderIgnoreFriends.ZIndex = 1451
UI.AutoTraderOpeningAnchor = makeButton(UI.AutoTraderPanel, "", UDim2.new(0.5, -17, 0, 30), THEME.panel2)
UI.AutoTraderOpeningAnchor.Position = UDim2.new(0.5, 3, 0, 88)
UI.AutoTraderOpeningAnchor.ZIndex = 1451
UI.AutoTraderUnknownTheir = makeButton(UI.AutoTraderPanel, "", UDim2.new(0.5, -17, 0, 30), THEME.panel2)
UI.AutoTraderUnknownTheir.Position = UDim2.fromOffset(14, 124)
UI.AutoTraderUnknownTheir.ZIndex = 1451
UI.AutoTraderPreferDuplicates = makeButton(UI.AutoTraderPanel, "", UDim2.new(0.5, -17, 0, 30), THEME.panel2)
UI.AutoTraderPreferDuplicates.Position = UDim2.new(0.5, 3, 0, 124)
UI.AutoTraderPreferDuplicates.ZIndex = 1451
UI.AutoTraderProfit = makeButton(UI.AutoTraderPanel, "", UDim2.new(1, -28, 0, 30), THEME.panel2)
UI.AutoTraderProfit.Position = UDim2.fromOffset(14, 160)
UI.AutoTraderProfit.ZIndex = 1451
UI.AutoTraderStatusBox = create("Frame", {
    Position = UDim2.fromOffset(14, 196),
    Size = UDim2.new(1, -28, 0, 102),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
    ZIndex = 1451,
}, UI.AutoTraderPanel)
addCorner(UI.AutoTraderStatusBox, 9)
UI.AutoTraderStatus = makeLabel(UI.AutoTraderStatusBox, "IDLE", 12, THEME.blue, Enum.Font.GothamBold)
UI.AutoTraderStatus.Position = UDim2.fromOffset(10, 7)
UI.AutoTraderStatus.Size = UDim2.new(1, -20, 0, 17)
UI.AutoTraderStatus.ZIndex = 1452
UI.AutoTraderTarget = makeLabel(UI.AutoTraderStatusBox, "Target: —", 10, THEME.muted, Enum.Font.GothamMedium)
UI.AutoTraderTarget.Position = UDim2.fromOffset(10, 27)
UI.AutoTraderTarget.Size = UDim2.new(1, -20, 0, 15)
UI.AutoTraderTarget.ZIndex = 1452
UI.AutoTraderTotals = makeLabel(UI.AutoTraderStatusBox, "Them: —   Plan: —   Win: —", 10, THEME.muted, Enum.Font.GothamMedium)
UI.AutoTraderTotals.Position = UDim2.fromOffset(10, 45)
UI.AutoTraderTotals.Size = UDim2.new(1, -20, 0, 15)
UI.AutoTraderTotals.ZIndex = 1452
UI.AutoTraderSafety = makeLabel(UI.AutoTraderStatusBox, "Waiting.", 9, THEME.faint, Enum.Font.Gotham)
UI.AutoTraderSafety.Position = UDim2.fromOffset(10, 62)
UI.AutoTraderSafety.Size = UDim2.new(1, -20, 0, 34)
UI.AutoTraderSafety.TextWrapped = true
UI.AutoTraderSafety.TextYAlignment = Enum.TextYAlignment.Top
UI.AutoTraderSafety.ZIndex = 1452
UI.AutoTraderPlanTitle = makeLabel(UI.AutoTraderPanel, "CURRENT PLAN", 9, THEME.faint, Enum.Font.GothamBold)
UI.AutoTraderPlanTitle.Position = UDim2.fromOffset(14, 306)
UI.AutoTraderPlanTitle.Size = UDim2.new(1, -28, 0, 15)
UI.AutoTraderPlanTitle.ZIndex = 1451
UI.AutoTraderPlanRows = {}
for index = 1, CONFIG.MaxOfferSlots do
    UI.AutoTraderPlanRows[index] = makeLabel(UI.AutoTraderPanel, "—", 10, THEME.muted, Enum.Font.GothamMedium)
    UI.AutoTraderPlanRows[index].Position = UDim2.fromOffset(18, 322 + (index - 1) * 19)
    UI.AutoTraderPlanRows[index].Size = UDim2.new(1, -36, 0, 18)
    UI.AutoTraderPlanRows[index].ZIndex = 1451
end
UI.AutoTraderCopyDebug = makeButton(UI.AutoTraderPanel, "COPY SUPPORT SNAPSHOT", UDim2.new(1, -28, 0, 28), THEME.panel2)
UI.AutoTraderCopyDebug.Position = UDim2.fromOffset(14, 401)
UI.AutoTraderCopyDebug.TextColor3 = THEME.blue
UI.AutoTraderCopyDebug.ZIndex = 1451
UI.AutoTraderReserveTitle = makeLabel(UI.AutoTraderPanel, "DON'T TRADE BELOW THIS MANY", 9, THEME.faint, Enum.Font.GothamBold)
UI.AutoTraderReserveTitle.Position = UDim2.fromOffset(14, 437)
UI.AutoTraderReserveTitle.Size = UDim2.new(1, -120, 0, 15)
UI.AutoTraderReserveTitle.ZIndex = 1451
UI.AutoTraderReserveCount = makeLabel(UI.AutoTraderPanel, "0 reserves", 9, THEME.muted, Enum.Font.GothamMedium)
UI.AutoTraderReserveCount.Position = UDim2.new(1, -114, 0, 437)
UI.AutoTraderReserveCount.Size = UDim2.fromOffset(100, 15)
UI.AutoTraderReserveCount.TextXAlignment = Enum.TextXAlignment.Right
UI.AutoTraderReserveCount.ZIndex = 1451
UI.AutoTraderSearch = create("TextBox", {
    Position = UDim2.fromOffset(14, 456),
    Size = UDim2.new(1, -28, 0, 27),
    BackgroundColor3 = THEME.panel2,
    BorderSizePixel = 0,
    PlaceholderText = "Search inventory to set reserve counts...",
    PlaceholderColor3 = THEME.faint,
    Text = "",
    TextColor3 = THEME.text,
    TextSize = 10,
    Font = Enum.Font.Gotham,
    ClearTextOnFocus = false,
    TextXAlignment = Enum.TextXAlignment.Left,
    ZIndex = 1451,
}, UI.AutoTraderPanel)
addCorner(UI.AutoTraderSearch, 7)
UI.AutoTraderReserveScroll = create("ScrollingFrame", {
    Position = UDim2.fromOffset(14, 489),
    Size = UDim2.new(1, -28, 0, 116),
    BackgroundColor3 = THEME.panel,
    BorderSizePixel = 0,
    AutomaticCanvasSize = Enum.AutomaticSize.Y,
    CanvasSize = UDim2.fromOffset(0, 0),
    ScrollBarThickness = 3,
    ScrollBarImageColor3 = THEME.border,
    ZIndex = 1451,
}, UI.AutoTraderPanel)
addCorner(UI.AutoTraderReserveScroll, 8)
UI.AutoTraderReserveContent = create("Frame", {
    Size = UDim2.new(1, -7, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    BackgroundTransparency = 1,
    BorderSizePixel = 0,
    ZIndex = 1452,
}, UI.AutoTraderReserveScroll)
UI.AutoTraderReserveLayout = create("UIListLayout", {
    Padding = UDim.new(0, 3),
    SortOrder = Enum.SortOrder.LayoutOrder,
}, UI.AutoTraderReserveContent)
UI.AutoTraderReservePadding = create("UIPadding", {
    PaddingLeft = UDim.new(0, 5),
    PaddingRight = UDim.new(0, 5),
    PaddingTop = UDim.new(0, 5),
    PaddingBottom = UDim.new(0, 5),
}, UI.AutoTraderReserveContent)
State.AutoTrader.UpdateControls = function()
    local prefs = State.AutoTrader.Preferences
    UI.AutoTraderEnabled.Text = prefs.automation and "FULL AUTO TRADING: ON" or "FULL AUTO TRADING: OFF"
    UI.AutoTraderEnabled.TextColor3 = prefs.automation and THEME.green or THEME.yellow
    UI.AutoTraderEnabled.BackgroundColor3 = prefs.automation and Color3.fromRGB(30, 55, 43) or THEME.panel2
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
        UI.AutoTraderProfit.Text = "Base Win: +"
            .. formatNumber(minWin)
            .. " · Current Floor: +"
            .. formatNumber(effective)
    else
        UI.AutoTraderProfit.Text = "Base Win: +"
            .. formatNumber(minWin)
            .. " · Dynamic ≥ "
            .. formatPercent(CONFIG.AutoTraderMinWinPercent * 100, false)
    end
    UI.AutoTraderReserveCount.Text = tostring(State.AutoTrader.ReserveTypeCount()) .. " reserves"
end
State.AutoTrader.RebuildReserveList = function()
    if not UI.AutoTraderReserveContent or not UI.AutoTraderReserveContent.Parent then
        return
    end
    for _, child in ipairs(UI.AutoTraderReserveContent:GetChildren()) do
        if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end
    local inventory, reason = State.AutoTrader.GetLocalInventory(false)
    if not inventory then
        local label = makeLabel(
            UI.AutoTraderReserveContent,
            tostring(reason or "Waiting for inventory..."),
            9,
            THEME.faint,
            Enum.Font.Gotham
        )
        label.Size = UDim2.new(1, 0, 0, 30)
        label.TextWrapped = true
        label.ZIndex = 1453
        return
    end
    local search = normalize(State.AutoTrader.ProtectedSearch or "")
    local shown = 0
    for _, entry in ipairs(inventory.entries) do
        local searchable = normalize(entry.name .. " " .. entry.itemId .. " " .. entry.itemType)
        if search == "" or searchable:find(search, 1, true) then
            shown += 1
            local reserve = State.AutoTrader.GetReserve(entry.itemType, entry.itemId)
            local row = create("Frame", {
                Size = UDim2.new(1, 0, 0, 30),
                BackgroundColor3 = reserve > 0 and Color3.fromRGB(47, 37, 42) or THEME.panel2,
                BorderSizePixel = 0,
                ZIndex = 1453,
            }, UI.AutoTraderReserveContent)
            addCorner(row, 6)
            local label = makeLabel(
                row,
                entry.name
                    .. " x"
                    .. tostring(entry.quantity)
                    .. " · "
                    .. formatCompact(entry.unitValue),
                9,
                reserve > 0 and THEME.text or THEME.muted,
                Enum.Font.GothamMedium
            )
            label.Position = UDim2.fromOffset(6, 0)
            label.Size = UDim2.new(1, -116, 1, 0)
            label.TextTruncate = Enum.TextTruncate.AtEnd
            label.ZIndex = 1454
            local minus = makeButton(row, "−", UDim2.fromOffset(24, 22), THEME.panel3)
            minus.Position = UDim2.new(1, -106, 0.5, -11)
            minus.TextColor3 = THEME.yellow
            minus.ZIndex = 1454
            local count = makeLabel(
                row,
                "Keep " .. tostring(reserve),
                9,
                reserve > 0 and THEME.red or THEME.faint,
                Enum.Font.GothamBold
            )
            count.Position = UDim2.new(1, -78, 0, 0)
            count.Size = UDim2.fromOffset(48, 30)
            count.TextXAlignment = Enum.TextXAlignment.Center
            count.ZIndex = 1454
            local plus = makeButton(row, "+", UDim2.fromOffset(24, 22), THEME.panel3)
            plus.Position = UDim2.new(1, -26, 0.5, -11)
            plus.TextColor3 = THEME.green
            plus.ZIndex = 1454
            local rowEntry = entry
            local rowReserve = reserve
            minus.MouseButton1Click:Connect(function()
                if Destroyed then
                    return
                end
                State.AutoTrader.SetReserve(
                    rowEntry.itemType,
                    rowEntry.itemId,
                    rowReserve - 1,
                    rowEntry.quantity
                )
            end)
            plus.MouseButton1Click:Connect(function()
                if Destroyed then
                    return
                end
                State.AutoTrader.SetReserve(
                    rowEntry.itemType,
                    rowEntry.itemId,
                    rowReserve + 1,
                    rowEntry.quantity
                )
            end)
        end
    end
    if shown == 0 then
        local label = makeLabel(
            UI.AutoTraderReserveContent,
            "No matching resolved numeric inventory items.",
            9,
            THEME.faint,
            Enum.Font.Gotham
        )
        label.Size = UDim2.new(1, 0, 0, 28)
        label.ZIndex = 1453
    end
end
State.AutoTrader.Render = function()
    State.AutoTrader.UpdateControls()
    local status = State.AutoTrader.Status or "IDLE"
    UI.AutoTraderStatus.Text = status
    UI.AutoTraderStatus.TextColor3 = status:find("READY", 1, true)
        and THEME.green
        or (status:find("FROZEN", 1, true)
            and THEME.red
            or ((status:find("WAIT", 1, true) or status:find("PENDING", 1, true))
                and THEME.yellow
                or THEME.blue))
    local target = State.AutoTrader.LastTradePartner or State.AutoTrader.SelectedTarget
    UI.AutoTraderTarget.Text = target
        and ((State.AutoTrader.LastTradePartner and "Partner: " or "Next eligible: ") .. target.Name)
        or "Target: —"
    local plan = State.AutoTrader.Plan
    local summary = State.AutoTrader.OtherSummary
    if plan then
        UI.AutoTraderTotals.Text = "Them: "
            .. formatCompact(plan.receiveTotal)
            .. (plan.unknownCount and plan.unknownCount > 0 and "+" or "")
            .. "   Plan: "
            .. formatCompact(plan.total)
            .. "   Win: +"
            .. formatCompact(plan.win)
    elseif State.AutoTrader.Anchor and summary and summary.slotCount == 0 then
        UI.AutoTraderTotals.Text = "Anchor: "
            .. State.AutoTrader.Anchor.name
            .. " · "
            .. formatCompact(State.AutoTrader.Anchor.unitValue)
    elseif summary then
        UI.AutoTraderTotals.Text = "Them known: "
            .. formatCompact(summary.knownFloor)
            .. (summary.unknownCount > 0 and (" + " .. tostring(summary.unknownCount) .. " unknown") or "")
    else
        UI.AutoTraderTotals.Text = "Them: —   Plan: —   Win: —"
    end
    UI.AutoTraderSafety.Text = tostring(State.AutoTrader.StatusDetail or "")
    for index = 1, CONFIG.MaxOfferSlots do
        local row = UI.AutoTraderPlanRows[index]
        local item = plan and plan.items[index]
        if item then
            row.Text = tostring(index)
                .. ". "
                .. item.name
                .. (item.quantity > 1 and (" x" .. tostring(item.quantity)) or "")
                .. " · "
                .. formatCompact(item.unitValue * item.quantity)
            row.TextColor3 = THEME.text
        else
            row.Text = index == 1 and "— no calculated plan yet —" or ""
            row.TextColor3 = THEME.faint
        end
    end
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
            local pending = State.AutoTrader.PendingRequest
            local player = pending and Players:GetPlayerByUserId(pending.userId) or nil
            if player then
                State.AutoTrader.RecordTargetEvent(player, "response", {seconds = pending and (os.clock() - pending.sentAt) or nil})
                State.AutoTrader.RecordTargetEvent(player, "decline")
                State.AutoTrader.MarkServerPlayerOutcome(player, "declined", "request declined")
                State.AutoTrader.SetCooldown(player, "request declined")
            end
            State.AutoTrader.Log("request_declined", pending)
            State.AutoTrader.PendingRequest = nil
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
            State.AutoTrader.Status = "COOLDOWN · DECLINED"
            State.AutoTrader.StatusDetail = player
                and (player.Name .. " declined; ignoring them for about 2 minutes.")
                or "Request was declined."
            State.AutoTrader.Render()
        end)
    end
    local startTrade = tradeFolder:FindFirstChild("StartTrade")
    if startTrade and startTrade:IsA("RemoteEvent") then
        connect(startTrade.OnClientEvent, function(_, partnerName)
            State.AutoTrader.TradeBeganAt = os.clock()
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
            if pending then
                local player = Players:GetPlayerByUserId(pending.userId)
                if player then
                    State.AutoTrader.RecordTargetEvent(player, "response", {seconds = os.clock() - pending.sentAt})
                    State.AutoTrader.RecordTargetEvent(player, "trade")
                    State.AutoTrader.MarkServerPlayerOutcome(player, "trading", "trade started")
                end
                if type(partnerName) ~= "string" or partnerName == pending.name then
                    State.AutoTrader.PendingRequest = nil
                end
            end
            State.AutoTrader.Log("trade_started", {
                partnerName = partnerName,
                pending = pending,
            })
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
            local partner = State.AutoTrader.LastTradePartner
            local localDecline = os.clock() - (State.AutoTrader.LocalDeclineAt or 0) <= 0.8
            if partner and not localDecline then
                State.AutoTrader.MarkServerPlayerOutcome(partner, "trade_declined", "active trade declined")
                State.AutoTrader.SetCooldown(partner, "active trade declined")
            elseif partner and localDecline then
                State.AutoTrader.MarkServerPlayerOutcome(partner, "local_cancel", "trade ended locally")
            end
            State.AutoTrader.Log("trade_declined", {
                partner = partner and partner.Name or nil,
                localDecline = localDecline,
            })
            State.AutoTrader.ClearTradeRuntime()
            State.AutoTrader.Status = localDecline and "TRADE ENDED" or "COOLDOWN · TRADE ENDED"
            State.AutoTrader.StatusDetail = localDecline
                and "You ended the trade; no unwilling-player cooldown was applied."
                or (partner
                    and (partner.Name .. " ended the trade; ignoring them for about 2 minutes.")
                    or "Trade ended.")
            State.AutoTrader.Render()
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
                    local acceptKey = State.AutoTrader.AutoAcceptSentKey
                    local tradeUpdateAt = State.AutoTrader.LastTradeUpdateAt
                    task.delay(2, function()
                        if Destroyed
                            or not State.AutoTrader.Preferences.automation
                            or not acceptKey
                            or State.AutoTrader.AutoAcceptSentKey ~= acceptKey
                            or State.AutoTrader.LastTradeUpdateAt ~= tradeUpdateAt
                            or not State.CurrentTrade then
                            return
                        end
                        State.AutoTrader.Freeze("Both-side acceptance did not produce a server completion signal within 2s. No acceptance retry was attempted.")
                    end)
                end
                return
            end
            if success == true then
                local partner = State.AutoTrader.LastTradePartner
                local completedPlan = State.AutoTrader.Plan
                local audit = State.AutoTrader.LastAcceptAudit
                local tradeSeconds = State.AutoTrader.TradeBeganAt > 0
                    and (os.clock() - State.AutoTrader.TradeBeganAt)
                    or nil
                if partner then
                    State.AutoTrader.RequestHistory[partner.UserId] = os.clock()
                end
                State.AutoTrader.Log("trade_completed", {
                    partner = partner and partner.Name or nil,
                    receivedItems = receivedItems,
                    plan = completedPlan,
                })
                State.AutoTrader.PostTradeAuditPending = true
                State.AutoTrader.RestoreTradeVisuals()
                State.AutoTrader.ClearTradeRuntime()
                State.AutoTrader.Status = "TRADE COMPLETED"
                State.AutoTrader.StatusDetail = "Server confirmed the fully automated trade. Starting a fresh-inventory audit."
                State.AutoTrader.Render()
                State.AutoTrader.ShowSuccessNotification(partner, completedPlan, "Server completion confirmed")
                State.AutoTrader.RunPostTradeAudit(audit, receivedItems, partner, completedPlan, tradeSeconds)
            end
        end)
    end
end
State.AutoTrader.CancelIgnoredRequest = function()
    local pending = State.AutoTrader.PendingRequest
    if not pending then
        return false
    end
    local player = Players:GetPlayerByUserId(pending.userId)
    local tradeFolder = ReplicatedStorage:FindFirstChild("Trade")
    local remote = tradeFolder and tradeFolder:FindFirstChild("CancelRequest")
    if not remote or not remote:IsA("RemoteEvent") then
        State.AutoTrader.Freeze("Trade.CancelRequest RemoteEvent is unavailable for the pending-request timeout.")
        return false
    end
    State.AutoTrader.Log("request_timeout_cancel", pending)
    local ok, err = pcall(function()
        remote:FireServer()
    end)
    if not ok then
        State.AutoTrader.Freeze("Pending request cancellation failed: " .. tostring(err))
        return false
    end
    State.AutoTrader.PendingRequest = nil
    local requestFrame = State.AutoTrader.GetRequestFrame()
    if requestFrame and requestFrame:IsA("GuiObject") then
        requestFrame.Visible = false
    end
    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
    if player then
        State.AutoTrader.RecordTargetEvent(player, "ignored")
        State.AutoTrader.MarkServerPlayerOutcome(player, "no_response", "request timed out")
        State.AutoTrader.SetCooldown(player, "request ignored", 75)
    end
    State.AutoTrader.Status = "COOLDOWN · NO RESPONSE"
    State.AutoTrader.StatusDetail = player
        and (player.Name .. " left the request pending for 12s; request canceled so the bot can pursue a faster target.")
        or "Pending request timed out and was canceled."
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
    State.AutoTrader.Log("idle_trade_decline", {
        partner = partner and partner.Name or nil,
        idleFor = os.clock() - (State.AutoTrader.LastTradeActivityAt or State.AutoTrader.TradeBeganAt or os.clock()),
    })
    local ok, err = pcall(function()
        remote:FireServer()
    end)
    if not ok then
        State.AutoTrader.Freeze("Idle trade cancellation failed: " .. tostring(err))
        return false
    end
    if partner then
        State.AutoTrader.MarkServerPlayerOutcome(partner, "idle", "trade idle/no response")
        State.AutoTrader.SetCooldown(partner, "trade idle/no response", CONFIG.AutoTraderCooldownSeconds)
    end
    local tradeGui = State.TradeGui
    if not tradeGui or not tradeGui.Parent then
        tradeGui = PlayerGui:FindFirstChild("TradeGUI")
    end
    if tradeGui and tradeGui:IsA("ScreenGui") then
        tradeGui.Enabled = false
    end
    State.CurrentTrade = nil
    State.AutoTrader.RestoreTradeVisuals()
    State.AutoTrader.ClearTradeRuntime()
    State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
    State.AutoTrader.Status = "COOLDOWN · IDLE TRADE"
    State.AutoTrader.StatusDetail = partner
        and (partner.Name .. " made no trade progress for about 35s; trade ended and player cooled down.")
        or "Idle trade ended automatically."
    State.AutoTrader.Render()
    return true
end
State.AutoTrader.Tick = function()
    if Destroyed then
        return
    end
    State.AutoTrader.BindLocalDeclineObserver()
    State.AutoTrader.BindRequestCancelObserver()
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
            State.AutoTrader.PendingRequest = nil
            State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
        elseif State.AutoTrader.Preferences.automation
            and os.clock() - State.AutoTrader.PendingRequest.sentAt >= CONFIG.AutoTraderPendingRequestTimeoutSeconds then
            State.AutoTrader.CancelIgnoredRequest()
        end
    end
    if State.AutoTrader.Preferences.automation
        and State.AutoTrader.ManagedPartnerUserId
        and State.CurrentTrade
        and not State.AutoTrader.PostTradeAuditPending
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
        State.AutoTrader.SavePreferences()
    end
    State.AutoTrader.Dragging = false
    State.AutoTrader.DragInput = nil
end)
connect(Players.PlayerRemoving, function(player)
    if State.AutoTrader.PendingRequest and State.AutoTrader.PendingRequest.userId == player.UserId then
        State.AutoTrader.Log("pending_target_left", State.AutoTrader.PendingRequest)
        State.AutoTrader.PendingRequest = nil
        State.AutoTrader.NextRequestAt = os.clock() + CONFIG.AutoTraderRequestSpacingSeconds
    end
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
    Enum.Font.GothamBold
)
UI.GiveTitle.Position = UDim2.fromOffset(10, 7)
UI.GiveTitle.Size = UDim2.fromOffset(100, 14)
UI.GiveTitle.ZIndex = 1002
UI.ReceiveTitle = makeLabel(
    UI.ValueBox,
    "YOU RECEIVE",
    9,
    THEME.faint,
    Enum.Font.GothamBold
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
    Enum.Font.GothamBold
)
UI.GiveValue.Position = UDim2.fromOffset(10, 23)
UI.GiveValue.Size = UDim2.fromOffset(120, 23)
UI.GiveValue.ZIndex = 1002
UI.ReceiveValue = makeLabel(
    UI.ValueBox,
    "0",
    18,
    THEME.green,
    Enum.Font.GothamBold
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
    Enum.Font.GothamMedium
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
    Enum.Font.GothamBold
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
        Enum.Font.GothamMedium
    )
    nameLabel.Position = UDim2.fromOffset(10, y)
    nameLabel.Size = UDim2.new(0.55, -10, 0, 17)
    nameLabel.ZIndex = 1002
    local verdictLabel = makeLabel(
        UI.SignalBox,
        "—",
        10,
        THEME.faint,
        Enum.Font.GothamBold
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
    Enum.Font.GothamBold
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
            Font = Enum.Font.Gotham,
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
            Enum.Font.Gotham
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
local function discoverMainGui()
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
    if not force
        and State.TradeOffer1
        and State.TradeOffer1.Parent
        and State.TradeOffer2
        and State.TradeOffer2.Parent
        and State.TradeGui
        and State.TradeGui.Parent then
        return true
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
        return false
    end
    local tradeCommon =
        commonAncestor(offer1, offer2)
    local hostGui =
        nearestScreenGui(tradeCommon)
        or nearestScreenGui(offer1)
        or nearestScreenGui(offer2)
    if not tradeCommon or not hostGui then
        return false
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
    return true
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
    if not SupremeDatabase then
        return
    end
    if not State.InventoryRoot or not State.InventoryRoot.Parent then
        discoverMainGui()
    end
    if not State.InventoryRoot then
        return
    end
    for _, descendant in ipairs(State.InventoryRoot:GetDescendants()) do
        if looksLikeItemCard(descendant) then
            decorateCard(descendant, {
                showValue = CONFIG.ValueBadgeOnInventory,
                showInfo = CONFIG.StatsButtons,
                compactMode = false,
            })
        end
    end
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
    local ok, status, data = pcall(function()
        return GetTradeStatus:InvokeServer()
    end)
    if not ok then
        return false
    end
    if status == "StartTrade"
        and type(data) == "table"
        and data.Player1
        and data.Player2 then
        State.CurrentTrade = data
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
        Font = Enum.Font.GothamBold,
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
                    Enum.Font.GothamMedium,
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
                Enum.Font.GothamBold,
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
        table.insert(
            State.Profile.connections,
            connection
        )
        table.insert(
            Connections,
            connection
        )
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
State.TradeDescendantConnection = nil
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
    table.insert(Connections, added)
    table.insert(Connections, removed)
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
State.Profile.FetchRemoteTotalForPlayer = function(player, force)
    if Destroyed
        or not SupremeDatabase
        or not player
        or not player.Parent then
        return false, "unavailable"
    end
    local remoteState = State.Profile.remoteTotals
    local userId = player.UserId
    local now = os.clock()
    local lastSuccess = remoteState.lastSuccessByUserId[userId]
    local userJitter =
        ((userId % 17) / 17 - 0.5) * 1.6
    if not force
        and lastSuccess
        and now - lastSuccess <
            CONFIG.PlayerValuesRefreshSeconds + userJitter then
        return true, "fresh"
    end
    local retryAfter =
        remoteState.retryAfterByUserId[userId]
    if retryAfter and now < retryAfter then
        return false, "cooldown"
    end
    if remoteState.inFlightByUserId[userId] then
        return false, "in_flight"
    end
    local remote =
        safeFindPath(
            ReplicatedStorage,
            {"Remotes", "Extras", "GetFullInventory"}
        )
    if not remote or not remote:IsA("RemoteFunction") then
        State.Profile.MarkRemoteFailure(player, "remote_missing")
        return false, "remote_missing"
    end
    remoteState.requestSerial = remoteState.requestSerial + 1
    local request = {
        serial = remoteState.requestSerial,
        done = false,
        expired = false,
        ok = false,
        data = nil,
    }
    remoteState.inFlightByUserId[userId] = request
    task.spawn(function()
        local ok, data =
            pcall(function()
                return remote:InvokeServer(player)
            end)
        request.ok = ok
        request.data = data
        request.done = true
        if request.expired
            and remoteState.inFlightByUserId[userId] == request then
            remoteState.inFlightByUserId[userId] = nil
        end
    end)
    local deadline =
        os.clock() + CONFIG.RemoteTimeoutSeconds
    while not request.done
        and not Destroyed
        and os.clock() < deadline do
        task.wait(0.05)
    end
    if Destroyed then
        request.expired = true
        return false, "destroyed"
    end
    if not request.done then
        request.expired = true
        if remoteState.inFlightByUserId[userId] == request then
            remoteState.inFlightByUserId[userId] = nil
        end
        local failures =
            (remoteState.failureCountByUserId[userId] or 0) + 1
        remoteState.retryAfterByUserId[userId] =
            os.clock()
            + math.min(
                120,
                20 + failures * 10
            )
        State.Profile.MarkRemoteFailure(player, "timeout")
        return false, "timeout"
    end
    if remoteState.inFlightByUserId[userId] == request then
        remoteState.inFlightByUserId[userId] = nil
    end
    if not request.ok or type(request.data) ~= "table" then
        State.Profile.MarkRemoteFailure(
            player,
            request.ok and "non_table" or tostring(request.data)
        )
        return false, "request_failed"
    end
    local applied, reason =
        State.Profile.ApplyRemoteInventoryData(
            player,
            request.data,
            true
        )
    if not applied then
        State.Profile.MarkRemoteFailure(player, reason)
        return false, reason
    end
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
    if Destroyed then
        return
    end
    if State.AutoTrader and State.AutoTrader.FlushTargetStats then
        pcall(State.AutoTrader.FlushTargetStats)
    end
    if State.AutoTrader and State.AutoTrader.SaveRecentJobs then
        pcall(State.AutoTrader.SaveRecentJobs)
    end
    Destroyed = true
    State.TradeHelperGeneration =
        State.TradeHelperGeneration + 1
    if State.AutoTrader then
        State.AutoTrader.PlanGeneration =
            State.AutoTrader.PlanGeneration + 1
        State.AutoTrader.ActionGeneration =
            State.AutoTrader.ActionGeneration + 1
        State.AutoTrader.AutoAcceptGeneration =
            State.AutoTrader.AutoAcceptGeneration + 1
        if State.AutoTrader.RestoreTradeVisuals then
            State.AutoTrader.RestoreTradeVisuals()
        end
    end
    State.TradeInventoryRefreshGeneration =
        State.TradeInventoryRefreshGeneration + 1
    State.Profile.scanGeneration =
        State.Profile.scanGeneration + 1
    State.Profile.visibleRemoteGeneration =
        State.Profile.visibleRemoteGeneration + 1
    State.Profile.remoteTotals.generation =
        State.Profile.remoteTotals.generation + 1
    for userId, request in pairs(
        State.Profile.remoteTotals.inFlightByUserId
    ) do
        request.expired = true
        State.Profile.remoteTotals.inFlightByUserId[userId] = nil
    end
    safeDisconnectAll()
    clearAllTradeHighlights()
    if UI.RootGui and UI.RootGui.Parent then
        UI.RootGui:Destroy()
    end
    removeInjectedChildren()
    if rawget(_G, GLOBAL_KEY) == Controller then
        rawset(_G, GLOBAL_KEY, nil)
    end
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
local function refreshResolvedViews(discoverInventory)
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
local function jitteredDelay(seconds)
    return math.max(
        0.2,
        seconds * (0.90 + math.random() * 0.20)
    )
end
local function startPeriodic(baseSeconds, backoff, callback)
    task.spawn(function()
        local failures = 0
        task.wait(jitteredDelay(baseSeconds))
        while not Destroyed do
            local callOK, result =
                pcall(callback)
            local healthy =
                callOK
                and result ~= false
            if healthy then
                failures = 0
            else
                failures =
                    math.min(
                        failures + 1,
                        3
                    )
            end
            if Destroyed then
                break
            end
            local multiplier =
                backoff
                and math.min(
                    2 ^ failures,
                    4
                )
                or 1
            task.wait(
                jitteredDelay(
                    baseSeconds
                    * multiplier
                )
            )
        end
    end)
end
State.QueueNativeDatabaseWarmup()
rawset(_G, GLOBAL_KEY, Controller)
connect(script.Destroying, function()
    Controller.Destroy()
end)
task.spawn(function()
    pcall(reconnectGuiWatchers)
    pcall(State.Profile.Bind)
    pcall(updatePublicUiScale)
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
            if databaseOK then
                refreshResolvedViews(true)
            elseif databaseError then
                warn("[SV Public] Initial value database unavailable:", databaseError)
            end
            if linksChanged and SupremeDatabase then
                refreshResolvedViews(false)
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
startPeriodic(
    CONFIG.RefreshSeconds,
    true,
    function()
        local ok, refreshError, changed =
            fetchSupremeDatabase()
        if changed then
            refreshResolvedViews(false)
        end
        if not ok and refreshError and not SupremeDatabase then
            DatabaseStatus = "Unavailable"
        end
        return ok
    end
)
startPeriodic(
    CONFIG.LinkedImagesRefreshSeconds,
    true,
    function()
        local ok, _, changed =
            loadLinkedImages()
        if ok and changed and SupremeDatabase then
            refreshResolvedViews(false)
        end
        return ok
    end
)
startPeriodic(
    CONFIG.PlayerSweepSeconds,
    false,
    function()
        if SupremeDatabase then
            State.Profile.QueueRemoteLeaderboardSweep(false)
        end
        return true
    end
)
startPeriodic(
    CONFIG.InventoryRefreshSeconds,
    false,
    function()
        if SupremeDatabase then
            refreshTrackedCards()
        end
        return true
    end
)
startPeriodic(
    CONFIG.InventoryDiscoverySeconds,
    false,
    function()
        if SupremeDatabase then
            scanInventoryCards()
        end
        return true
    end
)
startPeriodic(
    CONFIG.ProfileRefreshSeconds,
    false,
    function()
        if SupremeDatabase then
            State.Profile.QueueScan()
        end
        return true
    end
)
startPeriodic(
    CONFIG.TradeRefreshSeconds,
    false,
    function()
        if SupremeDatabase and isTradeVisible() then
            scheduleTradeRefresh(0)
        end
        return true
    end
)
startPeriodic(
    5,
    false,
    function()
        updatePublicUiScale()
        return true
    end
)
startPeriodic(
    2,
    false,
    function()
        State.AutoTrader.Tick()
        return true
    end
)
startPeriodic(
    1,
    false,
    function()
        return State.AutoTrader.SampleMovement()
    end
)
do
    local lastTradeRecovery = 0
    startPeriodic(
        1.5,
        false,
        function()
            local currentGameDatabase =
                getGameDatabase()
            if currentGameDatabase ~= State.LastGameDatabase then
                State.LastGameDatabase = currentGameDatabase
                if SupremeDatabase then
                    refreshResolvedViews(false)
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
                if now - lastTradeRecovery >= 3 then
                    lastTradeRecovery = now
                    recoverTradeStatus()
                end
            end
            return true
        end
    )
end
warn("[SV Public] Supreme Values PC Public Helper loaded.")
