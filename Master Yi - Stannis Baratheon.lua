--[[

	[Master Yi] Stannis Baratheon by Lillgoalie
       
    Instructions on saving the file:
    - Save the file in scripts folder

]]

if myHero.charName ~= "MasterYi" then return end

require 'VPrediction'
require 'SOW'

-- Ty Bilbao for encryption <3
assert(load(Base64Decode("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cmVkaWN0aW9uAAQPAAAAVGFyZ2V0U2VsZWN0b3IABBEAAABUQVJHRVRfTEVTU19DQVNUAAMAAAAAAMCCQAQFAAAATWVudQAEDQAAAHNjcmlwdENvbmZpZwAELAAAAFtNYXN0ZXIgWWldIFN0YW5uaXMgQmFyYXRoZW9uIGJ5IExpbGxnb2FsaWUABAsAAABNYXN0ZXJZaUJMAAQKAAAAT3Jid2Fsa2VyAAQEAAAAU09XAAQLAAAAYWRkU3ViTWVudQAEAgAAAFsABAcAAABteUhlcm8ABAkAAABjaGFyTmFtZQAEDgAAACAtIE9yYndhbGtlcl0ABAcAAABTT1dvcmIABAsAAABMb2FkVG9NZW51AAQKAAAAIC0gQ29tYm9dAAQIAAAAWWlDb21ibwAECQAAAGFkZFBhcmFtAAQGAAAAY29tYm8ABAsAAABDb21ibyBtb2RlAAQXAAAAU0NSSVBUX1BBUkFNX09OS0VZRE9XTgADAAAAAAAAQEAEBwAAAGNvbWJvUQAEDwAAAFVzZSBRIGluIGNvbWJvAAQTAAAAU0NSSVBUX1BBUkFNX09OT0ZGAAQHAAAAY29tYm9XAAQSAAAAVXNlIFcgYXMgQUEgcmVzZXQABAcAAABjb21ib0UABA8AAABVc2UgRSBpbiBjb21ibwAEBwAAAGNvbWJvUgAEDwAAAFVzZSBSIGluIGNvbWJvAAQLAAAAIC0gSGFyYXNzXQAEBwAAAEhhcmFzcwAEBwAAAGhhcmFzcwAEBwAAAHN0cmluZwAEBQAAAGJ5dGUABAIAAABHAAQRAAAAYXV0b21pbmlvbmhhcmFzcwAEEwAAAEF1dG8gTWluaW9uLUhhcmFzcwAEGQAAAFNDUklQVF9QQVJBTV9PTktFWVRPR0dMRQAEAgAAAEEABA8AAABhdXRvaGFyYXNzTWFuYQAEIQAAAFVzZSBBdXRvIE1pbmlvbi1IYXJhc3MgaWYgTWFuYSAlAAQTAAAAU0NSSVBUX1BBUkFNX1NMSUNFAAMAAAAAAAA0QAMAAAAAAAAAAAMAAAAAAABZQAQOAAAAIC0gTGFuZWNsZWFyXQAECgAAAExhbmVjbGVhcgAEBQAAAGxjbHIABA4AAABMYW5lY2xlYXIgS2V5AAQCAAAAVgAECgAAAFVzZVFjbGVhcgAEFQAAAFVzZSBRIGluIEp1bmdsZWNsZWFyAAQJAAAAbGNsck1hbmEABB0AAABVc2UgU3BlbGxzIGlmIG1hbmEgaXMgb3ZlciAlAAQQAAAAIC0gSnVuZ2xlY2xlYXJdAAQMAAAASnVuZ2xlY2xlYXIABAUAAABqY2xyAAQQAAAASnVuZ2xlY2xlYXIgS2V5AAQKAAAAVXNlRWNsZWFyAAQVAAAAVXNlIEUgaW4gSnVuZ2xlY2xlYXIABBAAAAAgLSBBZGRpdGlvbmFsc10ABAQAAABBZHMABAQAAABrc1EABBEAAABLaWxsc3RlYWwgd2l0aCBRAAQMAAAAZXZhZGVPcHRpb24ABB4AAABFdmFkZSBEYW5nZXJvdXMgU3BlbGxzIFdpdGggUQAECgAAAGF1dG9MZXZlbAAEEgAAAEF1dG8tTGV2ZWwgU3BlbGxzAAQUAAAAIC0gVGFyZ2V0IFNlbGVjdG9yXQAEDwAAAHRhcmdldFNlbGVjdG9yAAQGAAAAYWRkVFMABAUAAABuYW1lAAQGAAAARm9jdXMABA0AAAAgLSBEcmF3aW5nc10ABAkAAABkcmF3aW5ncwAEDQAAAGRyYXdDaXJjbGVBQQAEDgAAAERyYXcgQUEgUmFuZ2UABAwAAABkcmF3Q2lyY2xlUQAEDQAAAERyYXcgUSBSYW5nZQAECgAAAHBlcm1hU2hvdwAEDQAAAGVuZW15TWluaW9ucwAEDgAAAG1pbmlvbk1hbmFnZXIABA0AAABNSU5JT05fRU5FTVkABBoAAABNSU5JT05fU09SVF9NQVhIRUFMVEhfREVDAAQOAAAAanVuZ2xlTWluaW9ucwAEDgAAAE1JTklPTl9KVU5HTEUABAoAAABQcmludENoYXQABF4AAAA8Zm9udCBjb2xvciA9ICIjMzNDQ0NDIj5TdGFubmlzIEJhcmF0aGVvbiBieTwvZm9udD4gPGZvbnQgY29sb3IgPSAiI2ZmZjhlNyI+TGlsbGdvYWxpZTwvZm9udD4AAAAAAAMAAAABAQAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhADQBAAADAAAAAwAAAAMAAAAEAAAABAAAAAQAAAAEAAAABAAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABwAAAAcAAAAHAAAACAAAAAgAAAAIAAAACAAAAAgAAAAHAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACQAAAAkAAAAJAAAACgAAAAoAAAAKAAAACgAAAAoAAAAKAAAACgAAAAoAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAwAAAAMAAAADAAAAAwAAAAMAAAADAAAAAwAAAAMAAAADQAAAA0AAAANAAAADQAAAA0AAAANAAAADQAAAA0AAAAOAAAADgAAAA4AAAAOAAAADgAAAA4AAAAOAAAADgAAAA4AAAAPAAAADwAAAA8AAAAPAAAADwAAAA8AAAAPAAAADwAAAA8AAAAPAAAADwAAAA8AAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAAQAAAAEAAAABAAAAARAAAAEQAAABEAAAARAAAAEQAAABEAAAARAAAAEQAAABEAAAARAAAAEQAAABIAAAASAAAAEgAAABIAAAASAAAAEgAAABIAAAASAAAAEgAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABMAAAATAAAAEwAAABQAAAAUAAAAFAAAABQAAAAUAAAAFAAAABQAAAAUAAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABUAAAAVAAAAFQAAABUAAAAWAAAAFgAAABYAAAAWAAAAFgAAABYAAAAWAAAAFgAAABYAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAGAAAABgAAAAYAAAAGAAAABgAAAAYAAAAGAAAABkAAAAZAAAAGQAAABkAAAAZAAAAGQAAABkAAAAZAAAAGgAAABoAAAAaAAAAGgAAABoAAAAaAAAAGgAAABoAAAAaAAAAGwAAABsAAAAbAAAAGwAAABsAAAAbAAAAGwAAABsAAAAcAAAAHAAAABwAAAAcAAAAHAAAABwAAAAcAAAAHAAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHgAAAB4AAAAeAAAAHwAAAB8AAAAgAAAA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EAAAAEBvYmZ1c2NhdGVkLmx1YQAVAQAAcgAAAHIAAAByAAAAcgAAAHIAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAcwAAAHMAAABzAAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHQAAAB0AAAAdAAAAHYAAAB2AAAAdgAAAHYAAAB2AAAAdgAAAHYAAAB3AAAAdwAAAHcAAAB3AAAAdwAAAHcAAAB3AAAAdwAAAHcAAAB3AAAAdwAAAHgAAAB6AAAAegAAAHoAAAB6AAAAegAAAHoAAAB6AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHsAAAB7AAAAewAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfAAAAHwAAAB8AAAAfAAAAH0AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAH4AAAB+AAAAfgAAAAMAAAADAAAAX2MAAAAAABUBAAADAAAAYWMAAAAAABUBAAADAAAAYmMAxAAAABQBAAABAAAABQAAAF9FTlYAfwAAAIEAAAAAAAokAAAABgBAAAdAQAAHgEAAGwAAABeAA4AGwEAARgBBAEdAwQCGAEEAh4BBAcYAQQDHwMEBAQECAEZBQgCBgQIAwcECAAGCAgBBwgIAXQGAAh1AAAAGAEAAB0BAAAcAQwAbAAAAF0ACgAbAQABGAEEAR0DBAIYAQQCHgEEBxgBBAMfAwQEBQQMAQYEDAB1AAAMfAIAADwAAAAQFAAAATWVudQAECQAAAGRyYXdpbmdzAAQNAAAAZHJhd0NpcmNsZUFBAAQLAAAARHJhd0NpcmNsZQAEBwAAAG15SGVybwAEAgAAAHgABAIAAAB5AAQCAAAAegADAAAAAABAb0AEBQAAAEFSR0IAAwAAAAAA4G9AAwAAAAAAAAAABAwAAABkcmF3Q2lyY2xlUQADAAAAAADAgkADAAAAABERMUEAAAAAAQAAAAAAEAAAAEBvYmZ1c2NhdGVkLmx1YQAkAAAAfwAAAH8AAAB/AAAAfwAAAH8AAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIEAAACBAAAAgQAAAIEAAACBAAAAgQAAAIEAAACBAAAAgQAAAIEAAACBAAAAAAAAAAEAAAAFAAAAX0VOVgABAAAAAQAQAAAAQG9iZnVzY2F0ZWQubHVhADwAAAABAAAAAQAAAAEAAAABAAAAAQAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAAgAAAAIAAAACAAAAJgAAAAMAAAAsAAAAJwAAADAAAAAtAAAAMQAAADAAAAA0AAAAMgAAADYAAAA1AAAAOQAAADcAAABEAAAAOgAAAEkAAABFAAAATwAAAEoAAABTAAAAUAAAAFsAAABUAAAAYQAAAFwAAABiAAAAYQAAAHAAAABjAAAAfgAAAHEAAACBAAAAfwAAAIEAAAAHAAAAAwAAAGNhAAEAAAA8AAAAAwAAAGRhAAEAAAA8AAAAAwAAAF9iAAUAAAA8AAAAAwAAAGFiAAUAAAA8AAAAAwAAAGJiAAUAAAA8AAAAAwAAAGNiAAUAAAA8AAAAAwAAAGRiABkAAAA8AAAAAQAAAAUAAABfRU5WAA=="), nil, "bt", _ENV))()