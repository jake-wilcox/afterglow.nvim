
local colors = {}
colors.get_colors = function()
    local mycolors = {} ---@type table<string,string>

    if vim.o.background == 'dark' then
        mycolors = {
            vscNone = 'NONE',
            vscFront = '#d6d6d6',
            vscBack = '#2c2c2c',

            vscTabCurrent = '#2c2c2c',
            vscTabOther = '#3a3a3a', -- Assuming this is a slightly lighter shade for non-active tabs
            vscTabOutside = '#202020', -- Assuming this is for even less focused elements

            vscLeftDark = '#1c1c1c',
            vscLeftMid = '#636363', -- Using bright black for mid elements
            vscLeftLight = '#cacaca', -- Using normal white for lighter elements

            vscPopupFront = '#d6d6d6',
            vscPopupBack = '#3a3a3a', -- Using a bright background assumption
            vscPopupHighlightBlue = '#7eaac7',
            vscPopupHighlightGray = '#636363', -- Using bright black as a gray

            vscSplitLight = '#d9d9d9',
            vscSplitDark = '#1c1c1c',
            vscSplitThumb = '#3a3a3a', -- Assuming thumb is a slider or similar UI element

            vscCursorDarkDark = '#2c2c2c',
            vscCursorDark = '#d6d6d6',
            vscCursorLight = '#d9d9d9',
            vscSelection = '#7eaac7', -- Using blue for selection for a lack of direct equivalent
            vscLineNumber = '#636363', -- Using bright black

            -- Adjusting to match the Alacritty colors more closely
            vscDiffRedDark = '#74423f', -- dim red
            vscDiffRedLight = '#bc5653', -- normal red
            vscDiffGreenDark = '#5e6547', -- dim green
            vscDiffGreenLight = '#909d63', -- normal green
            vscSearchCurrent = '#556b79', -- dim blue as a placeholder
            vscSearch = '#8b7653', -- dim yellow as a placeholder

            -- Git colors can be adjusted based on preference, using Alacritty's normal colors as inspiration
            vscGitAdded = '#909d63',
            vscGitModified = '#ebc17a',
            vscGitDeleted = '#bc5653',
            vscGitRenamed = '#7eaac7',
            vscGitUntracked = '#86d3ce',
            vscGitIgnored = '#636363',
            vscGitStageModified = '#ebc17a',
            vscGitStageDeleted = '#bc5653',
            vscGitConflicting = '#aa6292',
            vscGitSubmodule = '#7eaac7',

            -- Other UI elements, adjusting based on Alacritty colors
            vscContext = '#1c1c1c',
            vscContextCurrent = '#2c2c2c',

            vscFoldBackground = '#202020',

            -- Syntax colors, matched as closely as possible to Alacritty's definitions
            vscGray = '#828282',
            vscViolet = '#aa6292',
            vscBlue = '#7eaac7',
            vscAccentBlue = '#7eaac7',
            vscDarkBlue = '#556b79', -- dim blue
            vscMediumBlue = '#7eaac7',
            vscLightBlue = '#7eaac7',
            vscGreen = '#909d63',
            vscBlueGreen = '#86d3ce',
            vscLightGreen = '#909d63', -- reusing green for lack of light green
            vscRed = '#bc5653',
            vscOrange = '#ebc17a', -- using yellow as orange
            vscLightRed = '#bc5653', -- reusing red for lack of light red
            vscYellowOrange = '#ebc17a', -- using yellow as orange
            vscYellow = '#ebc17a',
            vscDarkYellow = '#ebc17a', -- no dark yellow in Alacritty, reused normal
            vscPink = '#aa6292',

            -- Low contrast with default background
            -- Low contrast with default background
            vscDimHighlight = '#B2DFDB',
        }
    end

    -- Other ui specific colors
    mycolors.vscUiBlue = '#084671'
    mycolors.vscUiOrange = '#f28b25'
    mycolors.vscPopupHighlightLightBlue = '#d7eafe'

    -- Extend the colors with overrides passed by `color_overrides`
    local config = require('vscode.config')
    if config.opts.color_overrides then
        mycolors = vim.tbl_extend('force', mycolors, config.opts.color_overrides)
    end

    return mycolors
end

return colors
