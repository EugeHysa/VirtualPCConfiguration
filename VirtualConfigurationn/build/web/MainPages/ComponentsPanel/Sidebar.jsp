<table id="configTable" border="0">
                            <input type="hidden" id="temp" name="temp" value="<% out.print(mbcod); %>">
                            <tr><label>Motherboard:</label><input type="text" value="<% out.println(brand + " " + model); %>"  id="mbField" disabled="disabled"></input> </tr><br>
                        <tr><label>Cpu:</label><input type="text" id="cpuField" value='<% if(retStr!=null) out.print(retStr.replace("-CC-", " ")); %>' disabled="disabled"><input type="text" class="hidden" value="<% out.print(price); %>" id="cpuPrice"></tr><br>
				<tr><label>Ram:</label><input type="text" id="ramField" disabled="disabled"></tr><br>
				<tr><label>Graphic Card:</label><input type="text" id="gcField" disabled="disabled"></tr><br>
				<tr><label>Hard Disk:</label><input type="text" id="hdField" disabled="disabled"></tr><br>
				<tr><label>Power Supply:</label><input type="text" id="psField" disabled="disabled"></tr><br>
				<tr><label>Case:</label><input type="text" id="caseField" disabled="disabled"></tr><br><hr>
				<tr><label>Price:</label><input type="text" value="<% out.println(price); %>" id="priceField" disabled="disabled"></input><br></tr>
			</table>
