local calculator = {}

calculator.calculate = function()
    local tup1 = vim.api.nvim_buf_get_mark(0, "<")
    local tup2 = vim.api.nvim_buf_get_mark(0, ">")

    local line = vim.api.nvim_get_current_line()

    local calc = line:sub(tup1[2] + 1, tup2[2] + 1)

    local function powMatch(str)
        return "math.pow(".. str:gsub("%^", ", ") .. ')'
    end

    local function eMatch(str)
        return str:gsub("e", "math.exp(1)")
    end

    calc = calc:gsub("abs", "math.abs")
        :gsub("pow", "math.pow")
        :gsub("%w%^%w", powMatch)

        :gsub("log", "math.log")
        :gsub("ln", "math.log")
        :gsub("lg", "math.log10")

        :gsub("cos", "math.cos")
        :gsub("cosh", "math.cosh")
        :gsub("acos", "math.acos")

        :gsub("sin", "math.sin")
        :gsub("sinh", "math.sinh")
        :gsub("asin", "math.asin")

        :gsub("tan", "math.tan")
        :gsub("tanh", "math.tanh")
        :gsub("atan", "math.atan")
        :gsub("atan2", "math.atan2")

        :gsub("rad", "math.rad")
        :gsub("deg", "math.deg")

        :gsub("pi", "math.pi")

        :gsub("floor", "math.floor")
        :gsub("ceil", "math.ceil")

        :gsub("fmod", "math.fmod")
        :gsub("modf", "math.modf")

        :gsub("exp", "math.exp")
        :gsub("%We%W", eMatch)
        :gsub("frexp", "math.frexp")
        :gsub("ldexp", "math.ldexp")

        :gsub("min", "math.min")
        :gsub("max", "math.max")

        :gsub("sqrt", "math.sqrt")

        :gsub("inf", "math.huge")

    local fn, err = load("return tostring(" .. calc .. ")")

    if not fn then
        vim.api.nvim_command([[echo ("]] .. tostring(err):gsub([["]], [[\"]]) .. [[")]])
    else
        local ok, res_err = pcall(fn)
        if ok then
            line = line:sub(0, tup1[2]) .. res_err .. line:sub(tup2[2] + 2)
            vim.api.nvim_set_current_line(line)
        else
            vim.api.nvim_command([[echo ("]] .. tostring(res_err):gsub([["]], [[\"]]) .. [[")]])
        end
    end
end

return calculator
