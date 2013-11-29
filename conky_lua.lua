function conky_format( format, number )
--    return string.match( conky_parse( number ) , "%d*%.?%d*")
    return string.format( format,string.match( conky_parse( number ) , "%d*%.?%d*"))
end
