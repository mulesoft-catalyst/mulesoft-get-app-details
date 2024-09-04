%dw 2.0
import * from dw::core::Strings
fun returnJComparablity(exchangeResponse:Object,extractAttribute:String) = (
    (exchangeResponse.attributes as Array) filter (
        (item, index) -> 
        item.key contains extractAttribute
        )
).value[0] default ("FALSE^")

fun convVersionStrToNum(versionNumber:String): Number = (
    10000*(substringBefore(versionNumber,".") as Number)
    +
    100*(substringBefore(substringAfter(versionNumber,"."),".") as Number)
    +
    (substringAfterLast(versionNumber,".") as Number 
    )
    )

fun convVersionNumToStr(versionNumber:Number): String = (
    floor((versionNumber/10000)) as String
    ++ "." ++
    floor((versionNumber mod 10000)/100) as String
    ++ "." ++
    floor((versionNumber mod 100)) as String
    )