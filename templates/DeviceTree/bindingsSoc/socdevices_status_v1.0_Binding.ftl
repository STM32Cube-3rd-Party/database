[#ftl]

[#---------------------------------------------------------]
[#-- FTL System bindings for SOC devices status property --]
[#---------------------------------------------------------]

[#--Bind status properties for Device nodes:
"status" and "secure-status" properties management--]
[#function Bind_nodeStatusProperties	 pNodeElmt]
	[#local module = "Bind_socNodeStatusProperties"]
	[#local traces =  ftrace("", "module="+module+"\n") ]
	[#local errors = ""]

	[#if pNodeElmt?has_content]
		[#--Generate status only if elmt configures a complete device (i.e. not a device section)--]
		[#if srvcmx_isBindedHwADevice(pNodeElmt)]
			[#--Ordering: "status" 1st then "secure-status"--]
			[#local resElmtsList = []]
			[#if srvcmx_isDeviceAssignedToTargetedCtxt(pNodeElmt)]
				[#if srvcmx_isBindedDeviceNonSecure(pNodeElmt)]
					[#local resElmtsList = resElmtsList + [DTBindedDtsElmtDM_new_Property_singleValueAndItem("status", "string", "", "okay")] ]
				[/#if]
			[#else]
					[#local resElmtsList = resElmtsList + [DTBindedDtsElmtDM_new_Property_singleValueAndItem("status", "string", "", "disabled")] ]
			[/#if]

			[#if ((srvcmx_isElmtTargetsFw(pNodeElmt, "TF-A")||srvcmx_isElmtTargetsFw(pNodeElmt, "SP_MIN")) && srvcmx_isBindedDeviceSecure(pNodeElmt))]
				[#local resElmtsList = resElmtsList + [DTBindedDtsElmtDM_new_Property_singleValueAndItem("secure-status", "string", "", "okay")] ]
			[/#if]
		[/#if]
	[#else]
		[#local errors = "empty pNodeElmt"]
	[/#if]

	[#return {"errors":errors!, "resElmtsList":resElmtsList!, "traces":traces!} ]
[/#function]
