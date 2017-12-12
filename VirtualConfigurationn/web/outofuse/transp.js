function addComment()
{
		var parameters = location.search.substring(1).split("&");

		var temp = parameters[0].split("=");
		l = unescape(temp[1]);
temp = parameters[1].split("=");
    p = unescape(temp[1]);

		document.getElementById("BRAND").innerHTML = l;
document.getElementById("MODEL").innerHTML = p;

}


function addCommentR()
{
		var parameters = location.search.substring(1).split("&");

		var temp = parameters[0].split("=");
		h = unescape(temp[1]);
temp = parameters[1].split("=");
    m = unescape(temp[1]);

		document.getElementById("rambrand").innerHTML = h;
document.getElementById("rammodel").innerHTML = m;
}

