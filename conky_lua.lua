function conky_format( format, number )
--    return string.match( conky_parse( number ) , "%d*%.?%d*")
    return string.format( format,string.match( conky_parse( number ) , "%d*%.?%d*"))
end
function conky_sformat( format, arg)
    return string.format(format,conky_parse(arg))
end
