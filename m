Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90011CCF9FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Nov 2025 02:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Myntn40n7j/EAPZRrOGESkEM/rGa4vAfDys4mSoB+Mc=; b=ihKbFsjUXdzt+e3GtquMIJTH7e
	Vc4omWR6PtoKcUKDzXBtv2Eh2XPOStMbNC3mxApIDyiNci/0F9BkP78PHiAaUVXxjZvmRrr6vOTsq
	PAWzjYTr3lZe2qR57Z0nsrcwKOSnfI7om/NlXG6KXClfHO69JhwRXjlIzA5E5SsNGbWH7f2RsgsrQ
	cymgQp0qDfSEcFRz9yoPa2LGDNtklTGZvrvpgOOLrnL8AZTUFjv+wmDYNniBnm5YNP2bFjZMuA11C
	Webm6rlwgB6UV2O2DfELdI0g9Qtt5sT2vO50tBn4ZjXya3covjG4HpN37KK/lVBAsiisvmdlDciTs
	ZUl8lWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF1K1-00000006zqd-3YPE;
	Sat, 01 Nov 2025 02:26:29 +0000
Received: from mail-northcentralusazolkn19010007.outbound.protection.outlook.com ([52.103.20.7] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF1Jz-00000006zqF-0YNP
	for linux-amlogic@lists.infradead.org;
	Sat, 01 Nov 2025 02:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOoXXzbdn600BN99t2YuYsDV/cdoYbzirCjR30q4vxr8ix9KKY7sInt99xiLJk1woE5BhhyAJuovKz7TK9NCu/bELfw/r1EByZwSvSV309SQD74nANzEIQqQ7Wex/8TjgfsxpzSxmpf2znIF7Z9xglhXR4apatB5wCMS3JB64uD6ydIEwpA5T/s4UNLsqE4RE6KRZZXSdbclai4b17+10bc0u+Fz9PW7vxWmZSx2QJfmrIkbHiuF0O7dWgU5LS542ChnVxYGXv+ZQ6PBFkfN8rZVOhkynkEGR/TkrRpA4cPA7YneR8zG18bZdaz5aZgz2L/JM3tQX6OjebyO+cd7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ELHh/4CC4lU5ByrRHEryThhZdDg9bLlY0xVymjzJ0c=;
 b=R3v70Wa75nzPqvQ00otrGLEE417oOpM0EIuZTGmYBA4xxhhq2fAAa8qJdhIc+TH8Gd1E7Kzs17KNeOCRkvtsDqf0salQbQZCIFmgVJvR3f47dHfWLLDFDDNqP7QzZa3icdAm7qdyW0QQ2QJKWqTSHDRdEQzwBOD5uzlnVSnh+dnCRo1Lo/irMlfbxfkjW9QjzL0cpar1o+oR5Emt237XeFovvauxcbIWz1AwcSvbLJQuTHrY0xVHQHRFICXWYxlfyEhUh8YiRz6oPmGmOt3bPy8K/dolXtwVrlmz1ySo2x19Al3Dq3dL5ZDhTkJcOl8kpbvTCR9XbIVBTU5LipWlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ELHh/4CC4lU5ByrRHEryThhZdDg9bLlY0xVymjzJ0c=;
 b=uNW/ynlEADWJk9hfBOX0nVXmhmD31T97/xZJ9b6hmlzZeANF3no5BXIAXFWiO8JqgoB7M0xDc+AjCKBP3MQpqeY4nEHQT0B8okkAN5QWyF6qaWPSIAqOmUm7UdBzuAwd9gOO2SA/UmUkEd56Tq917jzFCd5emsYo8EOiLx1kg4nHWvR93Gbi47cyFluoqrwYrkiDduXLA9hs9iyNb0ECGeezCTJ6762FrPibd80yAY2ZyHLw+jLVesqprL7svdaGX7sVSnYQuL2GQfuDBjTyA1o2InPKjfofh7jCkB8Ue9FYWoyPTvzU7O8A62CTY3PLzx35gPplymj4k2IBzaO4aQ==
Received: from DM4PR05MB10270.namprd05.prod.outlook.com (2603:10b6:8:180::11)
 by DS2PR05MB998331.namprd05.prod.outlook.com (2603:10b6:8:32e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Sat, 1 Nov
 2025 02:26:25 +0000
Received: from DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c]) by DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c%5]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 02:26:25 +0000
Message-ID: <DM4PR05MB102703CA8E86DFA6C43B03582C7F9A@DM4PR05MB10270.namprd05.prod.outlook.com>
Date: Sat, 1 Nov 2025 10:26:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <DM4PR05MB1027077E1F4CD8B1A7EDADF1DC7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
 <20251031161323.GA1688975@bhelgaas>
 <agqyqr7c6wwkr4fewt3szomd7c57eeujkal7modj46ssbngxf7@f7t56i723mvx>
Content-Language: en-US
From: Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <agqyqr7c6wwkr4fewt3szomd7c57eeujkal7modj46ssbngxf7@f7t56i723mvx>
X-ClientProxiedBy: SG2PR06CA0238.apcprd06.prod.outlook.com
 (2603:1096:4:ac::22) To DM4PR05MB10270.namprd05.prod.outlook.com
 (2603:10b6:8:180::11)
X-Microsoft-Original-Message-ID: <58b9e249-ebb1-45b8-ab75-ec0164cc5729@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB10270:EE_|DS2PR05MB998331:EE_
X-MS-Office365-Filtering-Correlation-Id: efb8b267-8adf-408e-6eb3-08de18ee0e17
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|8060799015|41001999006|12121999013|23021999003|15080799012|5072599009|19110799012|6090799003|1602099012|40105399003|440099028|4302099013|3412199025|10035399007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clY2Mjd3UXZackZEWkVvems1WFdMYm4zS0t4UjY3ZXZNVUd5cEY2OElRbHdq?=
 =?utf-8?B?NWtnWml0SExaVG5hT1k5enJoM1NrMCtwMUo1M3RlaTFHbk45cGZNREJ2S3lZ?=
 =?utf-8?B?RngybEF6dm12cjlhSEthaDVwWlJ1a1pLazVmRGg4ZkJYU3NvS2d5M2luYjdC?=
 =?utf-8?B?SWx0Qmt4STBORy9lQTF2UXBpWnFNVG0zRVBpbGcwY29YQXhsZmEwS0dxZWNz?=
 =?utf-8?B?UXRkWkFwSzQvOTVYTmhzbE4xT1l6SkZmRXJoQ3BONGYyci93N0VKQ3FIanpG?=
 =?utf-8?B?bUV6QUx6S21rZnNlZ21uemF4VGVoZC9tNXludGM1QzBTa01sQWpFRUIwbks0?=
 =?utf-8?B?YTY2UmN5MDZoZ0FsY1RzTmZ3bFhtZnlNTitYOUluVjl3cWpmb1hYUEZlZTRL?=
 =?utf-8?B?SFpJNmxUdHZhNExIdi9IbVpTaXJwUWs0WkxNWk5DeXdKR1VCbU1rTUJVZHlx?=
 =?utf-8?B?OFNmVWpBb1ljL2NhUjU3ZTlFY2RNWCtWbGlpTnF4ck12dkVjeWlwUnFNTE1x?=
 =?utf-8?B?a3IxYS9oajlWMEtkbElDRGF3dUVGL2xVK0FHZzVuZFVBN0haaHhHYzUrdkVT?=
 =?utf-8?B?WnF1S0cyWXlKRUoreTFUR1M3aEdKdEthWlBBUEwwbEVZTGtIKytnR1p6bGo1?=
 =?utf-8?B?VlIxZ0t5bDdPZ1dLTHFXQUovQThGMlgyang3QlpvTStrNkVoNGM2RTFtV0ZT?=
 =?utf-8?B?cUpIZXdUTEorbVhpeEJyU1NJTVBvZkxibkZCaWJaSnFOb293RnUvOFlQcWFK?=
 =?utf-8?B?cjNNZUpVb3RXZzRXZXp4NWIwREZXaURVanliTXYzSjlBS2dodEE2OTR2b1Zm?=
 =?utf-8?B?Vzh1b3doS3MxbWxPUDB6Y2xUam9adUJlVWpickJUMWVJdTVodnRNUjdYalJm?=
 =?utf-8?B?Q2d5M3FyUHJYRTdxUTA4WnFuYmV6MXR0OGJNdTI0Q1dNNjQzU2Mwd1pkbXRS?=
 =?utf-8?B?cFZXNkRDeVhUWVlzWjU4S1pYbjR4WTZad2hYLzM3dzRkSTA4VktVTXpHNDNN?=
 =?utf-8?B?ckF3TlpvVnZTN25yclJacThOY2VuUzg1OVpwTW45TFpGOUtSalJPNUlYUm94?=
 =?utf-8?B?UzV1TWdmdEkzVHJEZ1JlL1dhMDVvbTdTS2ZsR0hGUzd0OTlWdTAyYWM0b1pq?=
 =?utf-8?B?cVpmRzFCczhtVDIrWnIyMXlHVzNEcjFTWmRJc0tTNllMa0tVaFpEcEtiU2c5?=
 =?utf-8?B?Sm5pNEh4SHRidVJ3RzN0WnFDMEdkditYUmJQeDZDRmVyb2U4RXVOdkZKU3dD?=
 =?utf-8?B?aGp3ckdqTWJVL1Vod3l2NEFCaUNWL1FxWlB5elZkOFlGd1YyK0xEMkZadzg2?=
 =?utf-8?B?UVFhdDc5emRVSlRQQlVTVER4Sks4cGxJNm9objdvRW9leWxScFZyb1pZMEVV?=
 =?utf-8?B?NlZzamkySkZXc0pNRG50QnFVSHJQeUdKZjB0YUdMaHdmRzNyTFZLNEN5b05S?=
 =?utf-8?B?QWxHSm5xeTFMekF4OVdYcC9GZHFrYmc3TUNYVDZjVzFtQTlRaVZkVGQ0ZVZu?=
 =?utf-8?B?aDVTdTAvTG5pZXlCNWR4UFVQZU5CZ3BabzRlR2xFeDQ5UlVkWGw4VTI1ZVJG?=
 =?utf-8?B?cmZtWmdERjhxK0lZNndOMGl4dmxvdmFzTXY4TFdnK2tCb01pbW4xd3FwZGlm?=
 =?utf-8?B?T0J5YndvS21lOVFlUCtvSnpPYmVXYm5qaGJTVmlSU2FzOUt5cTlTVlFxaWxz?=
 =?utf-8?B?TllvZi9pZmdCSk1ZMlVrMGZsRDNNaDJjWVgxOTNsYjIwaUQwc21qTkNyN0NT?=
 =?utf-8?B?bFM3SERBRERUK3drTXZIMGk2aU43WUxUWUdtTXJ2Si81NHZVVEFGbVhPcUkr?=
 =?utf-8?B?NG5JNFFyV0E5NEdHbHQ2ZEY1dTkxbDkwY1NoMFRpaTgyaUN5TzQwcEhmK3k4?=
 =?utf-8?Q?brvNof98f6LcO?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW5ycG5kNlJMY2lKY1oxZFEwUTUzYVBHSjl3YkdnbW1JMGJOSTRibFkyaU9L?=
 =?utf-8?B?UFl1ZEhuQkZDaUJRZUtDTlFGUXBxd3lWeVpEUkNhVzBQVWw4V0Y5bTh0b0ts?=
 =?utf-8?B?Y1EzTHNvemw3S084ZGdVSGNJK1NvaDd2UCtwcjVTL2UzZWJQWmxqQmVab09U?=
 =?utf-8?B?SnNjRjN4UmVzNTZKWVpiZElYRXg5WHJIUU9kZHhBc2JqWHNUUzgxbEYxNFA5?=
 =?utf-8?B?akh3OUwzQUNLalR6NVByWCt0dWxpQmNkNkRSK3BpalliRTk1RXhhR1k1SHhn?=
 =?utf-8?B?R0ZkUERpQXE2cExvUlNQTHNDVW1VOWU3ZGUvTHdpMmc4M3U3WVZYRHNvR1Yz?=
 =?utf-8?B?b09GbzM2SWlqQlJwWEYyV0lIb1hUVWpkZzBVTmpibXo4cll4bDB5Wm9HZUJz?=
 =?utf-8?B?UDkwVHo4eVhCQUwrdmtTN2d1RFREZWVkUCtQR1F6c3I4UThmTEt0NUJsbDh3?=
 =?utf-8?B?Z292OHMxZHZnbEhLS1NiSm9XTDJPYXA5bTNvSk5jaDBadE54RklUVFBEMXJo?=
 =?utf-8?B?VXpHNUdoM2xmSXI5QTFQZjF5dXdmcHpteUswTFNBMFpCT1dqQkk5eWp4Um02?=
 =?utf-8?B?RzlkWE5yTGxmbE9VTHA1K2x5Y3lmbWJNVGIvUU96NXZpWjdUa1Y0Z3B2aVE0?=
 =?utf-8?B?SGh2TFF6ZCt4NStCdzl1MjNzaHFtVm9NRGV4VnExRUk4YTVoWVZtT3NUbUsx?=
 =?utf-8?B?TUdIMDhaUE1XTW9IbkUrWVcycis2aFBvQnpiTDZxd0c4bU1RdUVYZktrRzRB?=
 =?utf-8?B?cE5xNmpqbExuM2tZVGNMVlA0cUpteEswakpwdG42Nld5UjlaSVZZMHFNd3p4?=
 =?utf-8?B?NTZSd1ZvR1FZTWpZZE5YNzdzQjNmRm9nM2xpVUVMSjVVRkpPODRyVnZZYUx1?=
 =?utf-8?B?VUhkRGRaTW1WNnFmMStNZUpENE1STWtiblI4RnZidlJMVlcxcDF0Mm9Pa1Jl?=
 =?utf-8?B?UzNENmZ6QWZrc21MbEk2RExqM1FLakI5ZjExSFl0KzlPTndDa3FEZHlUQ1U3?=
 =?utf-8?B?N3NIK002cjZOMmpDQzI3b3JJQzBZNEhlS1cwc0cvUzVyRENDU3RaRTg4UHlX?=
 =?utf-8?B?NDVWS2lnT1RsbklPVm53TFNGc0Z4YTZkWDRkV3dOSVJYVmhwL2hkc1J0OHY3?=
 =?utf-8?B?U3VOelpHaXJqUWNaUW5GZ0VXcFlVOG0zTm50UC95UjU0VmlNYm4rbStic2NO?=
 =?utf-8?B?ZlZMT3RacHVPbVlzK2RnRERFM1VCSXFqRjkyZmNCVEZxejNUYy91K0R5Zzhm?=
 =?utf-8?B?b3VCUk4xTmYrN2s5SWN0THpmL1lES1V3ZlFHM20xeS9lTmNHNU9uQ09tcUpr?=
 =?utf-8?B?NWU5cTNtY0xpeVpVYm9uRnFZZnJyL0hZY2JaR2RZOGJ6RFhsdmcrT3NLWjBZ?=
 =?utf-8?B?M1pDSEMzM3FVUFNEYXE0dHI4U0VpRGxkZXVKNkNLSVMwem1NTllSMDRCMDBk?=
 =?utf-8?B?SExlWEFYU3pwYjNrYTkzZkFISmtUMlprZFJtc1kwMzJOWHRSQTgwSVpVbVh1?=
 =?utf-8?B?enRPOUd3NGhwWDlyd2RGRG9HUFcrYzE4anJKbDF1UzROdnFaUmNMWnhIb0lV?=
 =?utf-8?B?STU4L2FMbmNvMjhvOGFaaHk4bHAxQ2lSTWE4di9hamYzbVpDY1pyZGxRUWNs?=
 =?utf-8?B?RVdvVnlDWmZ2d3dCdmF2cmYrS28wckdSektXUERDT2ZXd3ltSlc2eXlYWEwx?=
 =?utf-8?Q?nRa6M4mCWgdQJqNOxzK/?=
X-OriginatorOrg: sct-15-20-8534-9-msonline-outlook-d08a8.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: efb8b267-8adf-408e-6eb3-08de18ee0e17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB10270.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 02:26:25.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR05MB998331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_192627_253948_0633F97D 
X-CRM114-Status: GOOD (  37.93  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTEvMS8yMDI1IDE6NDcgQU0sIE1hbml2YW5uYW4gU2FkaGFzaXZhbSB3cm90ZToKPiBPbiBG
cmksIE9jdCAzMSwgMjAyNSBhdCAxMToxMzoyM0FNIC0wNTAwLCBCam9ybiBIZWxnYWFzIHdyb3Rl
Ogo+PiBPbiBGcmksIE9jdCAzMSwgMjAyNSBhdCAwODoyNjo0MlBNICswODAwLCBMaW5uYWVhIExh
dmlhIHdyb3RlOgo+Pj4gT24gMTAvMzEvMjAyNSA0OjUwIFBNLCBOZWlsIEFybXN0cm9uZyB3cm90
ZToKPj4+PiBPbiAxMC8zMS8yNSAwNjozNCwgTGlubmFlYSBMYXZpYSB3cm90ZToKPj4+Pj4gT24g
MTAvMzAvMjAyNSAxOjE1IEFNLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+Pj4+Pj4gT24gV2VkLCBP
Y3QgMjksIDIwMjUgYXQgMDY6NTA6NDZQTSArMDgwMCwgTGlubmFlYSBMYXZpYSB3cm90ZToKPj4+
Pj4+PiBPbiAxMC8yOS8yMDI1IDY6MTYgQU0sIEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4+Pj4+Pgo+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9x
dWlya3MuYwo+Pj4+Pj4+PiBpbmRleCAyMTRlZDA2MGNhMWIuLjljZDEyOTI0YjVjYiAxMDA2NDQK
Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9wY2kvcXVpcmtzLmMKPj4+Pj4+Pj4gQEAgLTI1MjQsNiArMjUyNCw3IEBAIHN0YXRpYyB2b2lk
IHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEoc3RydWN0IHBjaV9kZXYgKmRldikKPj4+Pj4+Pj4g
IMKgwqDCoCAqIGRpc2FibGUgYm90aCBMMHMgYW5kIEwxIGZvciBub3cgdG8gYmUgc2FmZS4KPj4+
Pj4+Pj4gIMKgwqDCoCAqLwo+Pj4+Pj4+PiAgwqDCoCBERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQ
Q0lfVkVORE9SX0lEX0FTTUVESUEsIDB4MTA4MCwgcXVpcmtfZGlzYWJsZV9hc3BtX2wwc19sMSk7
Cj4+Pj4+Pj4+ICtERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX1NZTk9QU1lT
LCAweGFiY2QsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+Pj4+Pj4+PiAgwqDCoCAvKgo+
Pj4+Pj4+PiAgwqDCoMKgICogU29tZSBQZXJpY29tIFBDSWUtdG8tUENJIGJyaWRnZXMgaW4gcmV2
ZXJzZSBtb2RlIG5lZWQgdGhlIFBDSWUgUmV0cmFpbgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSBoYXZlIGFw
cGxpZWQgdGhlIHBhdGNoIG9uIDYuMTgtcmMzIGJ1dCBpdCdzIHN0aWxsIHRyeWluZyB0byBlbmFi
bGUgQVNQTSBmb3Igc29tZSByZWFzb25zLgo+Pj4+Pj4KPj4+Pj4+IFNvcnJ5LCBteSBmYXVsdCwg
SSBzaG91bGQgaGF2ZSBtYWRlIHRoYXQgZml4dXAgcnVuIGVhcmxpZXIsIHNvIHRoZQo+Pj4+Pj4g
cGF0Y2ggc2hvdWxkIGJlIHRoaXMgaW5zdGVhZDoKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wY2kvcXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+Pj4+Pj4gaW5kZXgg
MjE0ZWQwNjBjYTFiLi40ZmMwNDAxNWNhMGMgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3Bj
aS9xdWlya3MuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+Pj4+IEBAIC0y
NTI0LDYgKzI1MjQsNyBAQCBzdGF0aWMgdm9pZCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKHN0
cnVjdCBwY2lfZGV2ICpkZXYpCj4+Pj4+PiAgwqDCoCAqIGRpc2FibGUgYm90aCBMMHMgYW5kIEwx
IGZvciBub3cgdG8gYmUgc2FmZS4KPj4+Pj4+ICDCoMKgICovCj4+Pj4+PiAgwqAgREVDTEFSRV9Q
Q0lfRklYVVBfRklOQUwoUENJX1ZFTkRPUl9JRF9BU01FRElBLCAweDEwODAsIHF1aXJrX2Rpc2Fi
bGVfYXNwbV9sMHNfbDEpOwo+Pj4+Pj4gK0RFQ0xBUkVfUENJX0ZJWFVQX0hFQURFUihQQ0lfVkVO
RE9SX0lEX1NZTk9QU1lTLCAweGFiY2QsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+Pj4+
Pgo+Pj4+PiBMMSBzdGlsbCBnb3QgZW5hYmxlZAo+Pgo+PiBJcyB0aGF0IGJhc2VkIG9uIHRoZSBv
dXRwdXQgYmVsb3c/Cj4+Cj4+ICAgIFsgICAgNS40NDU4NTNdIFsgICAgIFQ0OF0gcGNpIDAwMDA6
MDA6MDAuMDogRGlzYWJsaW5nIEFTUE0gTDBzL0wxCj4+ICAgIFsgICAgNS41NjA0NDhdIFsgICAg
IFQ0OF0gcGNpIDAwMDA6MDE6MDAuMDogQVNQTTogZGVmYXVsdCBzdGF0ZXMgTDEKPj4KPj4gSWYg
c28sIHRoaXMgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIEwxIHdhcyBlbmFibGVkLiAgSXQgbWVh
bnMgdGhlCj4+IHF1aXJrIG1hcmtlZCB0aGUgMDA6MDAuMCBSb290IFBvcnQgc28gd2Ugc2hvdWxk
bid0IGV2ZXIgZW5hYmxlIEwwcyBvcgo+PiBMMSwgYW5kIHdoZW4gd2UgZW51bWVyYXRlZCAwMTow
MC4wLCB3ZSBzZXQgaXRzIGRlZmF1bHQgQVNQTSBzdGF0ZSB0bwo+PiBMMS4KPj4KPj4gQnV0IEkg
ZG9uJ3QgKnRoaW5rKiBMMSBzaG91bGQgYWN0dWFsbHkgYmUgZW5hYmxlZCB1bmxlc3Mgd2UgY2Fu
IGVuYWJsZQo+PiBpdCBmb3IgYm90aCAwMDowMC4wIGFuZCAwMTowMC4wLCBhbmQgdGhlIHF1aXJr
IHNob3VsZCBtZWFuIHRoYXQgd2UKPj4gY2FuJ3QgZW5hYmxlIGl0IGZvciAwMDowMC4wLgo+Pgo+
PiBUaGlzIG11ZGRsZSBvZiAiY2FwYWJsZSIgKHBlciBMaW5rIENhcGFiaWxpdGllcykgdnMgImRp
c2FibGVkIiAoZWl0aGVyCj4+IHRoZSBMaW5rIENvbnRyb2wgc2hvd3MgZGlzYWJsZWQsIG9yIHNv
ZnR3YXJlIHNhaWQgImRvbid0IGV2ZXIgdXNlIEwxIikKPj4gaXMgcGFydCBvZiB3aGF0IG1ha2Vz
IGFzcG0uYyBzbyBjb25mdXNpbmcuCj4+Cj4+Pj4+IFRoZSBjYXJkIHdvcmtzIGp1c3QgZmluZS4g
SSdtIHRoaW5raW5nIHRoZSBBU1BNIGlzc3VlIGlzCj4+Pj4+IHByb2JhYmx5IGZyb20gdGhlIGds
dWUgZHJpdmVyIHJlcG9ydGluZyB0aGUgbGluayB0byBiZSBkb3duIHdoZW4KPj4+Pj4gaXQncyBy
ZWFsbHkganVzdCBpbiBsb3cgcG93ZXIgc3RhdGUuCj4+Pj4KPj4+PiBZb3UncmUgcHJvYmFibHkg
cmlnaHQsIHRoZSBtZXNvbl9wY2llX2xpbmtfdXAoKSBub3Qgb25seSBjaGVja3MKPj4+PiB0aGUg
TFRTU00gYnV0IGFsc28gdGhlIHNwZWVkLCB3aGljaCBpcyBwcm9iYWJseSB3cm9uZy4KPj4+Pgo+
Pj4+IENhbiB5b3UgdHJ5IHJlbW92aW5nIHRoZSB0ZXN0IGZvciBzcGVlZCA/Cj4+Pj4KPj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNtbGhfdXAgJiYgcmRsaF91cCAm
JiBsdHNzbV91cCAmJiBzcGVlZF9va2F5KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoc21saF91cCAmJiByZGxoX3VwICYmIGx0c3NtX3VwKQo+Pj4+Cj4+Pj4gVGhl
IG90aGVyIGRyaXZlcnMganVzdCBjaGVja3MgdGhlIGxpbmssIGFuZCBzb21lIG9ubHkgdGhlIHNt
bGhfdXAKPj4+PiAmJiByZGxoX3VwLiBTbyB5b3UgY2FuIGFsc28gcHJvYmFibHkgZHJvcCBsdHNz
bV91cCBhc3dlbGwuCj4+Pgo+Pj4gSSBjYW4gY29uZmlybSB0aGF0IHJlbW92aW5nIHRoZSBjaGVj
ayBmb3IgbHRzc21fdXAgYW5kIHNwZWVkX29rYXkKPj4+IG1hZGUgQVNQTSB3b3JrLgo+Pgo+PiBJ
IGRvbid0IHRoaW5rIG1lc29uX3BjaWVfbGlua191cCgpIHNob3VsZCBoYXZlIHRoZSBsb29wIGlu
IGl0LCBzbyB0aGUKPj4gbHRzc21fdXAgYW5kIHNwZWVkX29rYXkgY2hlY2tzLCB0aGUgbG9vcCwg
dGhlIGRlbGF5LCBhbmQgdGhlIHRpbWVvdXQKPj4gbWVzc2FnZSBzaG91bGQgcHJvYmFibHkgYWxs
IGJlIHJlbW92ZWQuICBUaGF0IG1ldGhvZCBpcyBzdXBwb3NlZCB0byBiZQo+PiBhIHNpbXBsZSB0
cnVlL2ZhbHNlIGNoZWNrLCBhbmQgYW55IHdhaXRpbmcgcmVxdWlyZWQgc2hvdWxkIGJlIGRvbmUg
aW4KPj4gZHdfcGNpZV93YWl0X2Zvcl9saW5rKCkuCj4+Cj4+IFRoZSBsaW5rIHdhcyBjbGVhcmx5
IHVwIHdoZW4gd2UgZGlzY292ZXJlZCAwMTowMC4wLCBzbyB0aGUgIndhaXQKPj4gbGlua3VwIHRp
bWVvdXQiIG1lc3NhZ2VzIGZyb20gbWVzb25fcGNpZV9saW5rX3VwKCkgYWZ0ZXIgdGhhdCBtdXN0
IGJlCj4+IGZyb20gZHdfcGNpZV9saW5rX3VwKCkgYmVpbmcgY2FsbGVkIHZpYSB0aGUgLm1hcF9i
dXMoKSBjYWxsIGluCj4+IHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkKCkgb3IgcGNpX2dlbmVyaWNf
Y29uZmlnX3dyaXRlKCkuCj4+Cj4+IFdoZW4gbWVzb25fcGNpZV9saW5rX3VwKCkgcmV0dXJucyBm
YWxzZSBpbiB0aG9zZSBjb25maWcgYWNjZXNzb3JzLAo+PiB0aGUgY29uZmlnIGFjY2Vzc2VzIHdp
bGwgZmFpbCAodGhleSB3b24ndCBldmVuIGJlIGF0dGVtcHRlZCksIHNvIHdlJ2xsCj4+IHNlZSB0
aGluZ3MgbGlrZSB0aGlzOgo+Pgo+PiAgICBwY2kgMDAwMDowMTowMC4wOiBCQVIgMDogZXJyb3Ig
dXBkYXRpbmcgKDB4ZmM3MDAwMDQgIT0gMHhmZmZmZmZmZikKPj4KPj4gYW5kICJVbmtub3duIGhl
YWRlciB0eXBlIDdmIiBmcm9tIGxzcGNpLgo+Pgo+PiBDYW4geW91IGRyb3AgdGhlIEFTUE0gcXVp
cmsgcGF0Y2ggYW5kIGluc3RlYWQgdHJ5IHRoZQo+PiBtZXNvbl9wY2llX2xpbmtfdXAoKSBwYXRj
aCBiZWxvdyBvbiB0b3Agb2YgdjYuMTgtcmMzPwo+Pgo+Pj4gV2Ugc3RpbGwgbmVlZCBhIHNvbHV0
aW9uIHRvIHRoZSBvcmlnaW5hbCBpc3N1ZSB0aGF0J3MgcHJldmVudGluZyB0aGUKPj4+IGNvbnRy
b2xsZXIgZnJvbSBiZWluZyBpbml0aWFsaXplZC4KPj4+Cj4+PiBNeSBrZXJuZWwgaGFzIHRoZSBm
b2xsb3dpbmcgcGF0Y2ggYXBwbGllZCwgYnV0IEkgdGhpbmsgaXQncyBub3QKPj4+IHN1aXRhYmxl
IGZvciB1cHN0cmVhbSBhcyB0aGlzIGNoYW5nZXMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIFBD
SWUKPj4+IGNvbnRyb2xsZXIgb24gbWVzb24uCj4+Cj4+IEkgYXNzdW1lIHRoZSBvcmlnaW5hbCBp
c3N1ZSBpcyB0aGlzOgo+Pgo+PiAgICBtZXNvbi1wY2llIGZjMDAwMDAwLnBjaWU6IGVycm9yIC1F
QlVTWTogY2FuJ3QgcmVxdWVzdCByZWdpb24gZm9yIHJlc291cmNlIFttZW0gMHhmYzAwMDAwMC0w
eGZjM2ZmZmZmXQo+Pgo+PiBhbmQgeW91IGNvbmZpcm1lZCB0aGF0IGl0IHdhc24ndCBmaXhlZCBi
eSBhMTk3OGI2OTJhMzkgKCJQQ0k6IGR3YzogVXNlCj4+IGN1c3RvbSBwY2lfb3BzIGZvciByb290
IGJ1cyBEQkkgdnMgRUNBTSBjb25maWcgYWNjZXNzIiksIHdoaWNoCj4+IGFwcGVhcmVkIGluIHY2
LjE4LXJjMz8KPj4KPj4gSWYgaXQncyBzdGlsbCBicm9rZW4gaW4gdjYuMTgtcmMzLCBhbmQgdGhl
IGR0c2kgYW5kCj4+IG1lc29uX3BjaWVfZ2V0X21lbXMoKSBwYXRjaCBiZWxvdyBtYWtlcyBpdCB3
b3JrLCB3ZSBoYXZlIG1vcmUgd29yayB0bwo+PiBkbywgYW5kIG1heWJlIEtyaXNobmEgaGFzIHNv
bWUgaWRlYXMuCj4+Cj4gCj4gV2UgaGF2ZSB0d28gaXNzdWVzIG9uIHRoaXMgcGxhdGZvcm06Cj4g
Cj4gMS4gRFQgcmVwcmVzZW50cyAnZGJpJyByZWdpb24gYXMgJ2VsYmknLCB3aGljaCB3YXMgd3Jv
bmcgYXMgYm90aCBhcmUgZGlmZmVyZW50Cj4gYWRkcmVzcyBzcGFjZXMuIEVMQkkgaXMgYW4gb3B0
aW9uYWwgcmVnaW9uLCB3aGVyZWFzIERCSSBoYXMgUm9vdCBQb3J0IGFuZAo+IGNvbnRyb2xsZXIg
Y29uZmlndXJhdGlvbiByZWdpc3RlcnMsIHdoaWNoIGlzIG1hbmRhdG9yeS4KPiAKPiAyLiBEcml2
ZXIgcGFyc2VzL21hcHMgdGhlICdlbGJpJyByZWdpb24gYW5kIHN0b3JlcyBpdCBpbiAncGNpLT5k
YmlfYmFzZScuIFNvCj4gdGhpcyBtYWRlIHN1cmUgdGhhdCB0aGUgY29kZSBkZXBlbmRpbmcgb24g
dGhlICdwY2ktPmRiaV9iYXNlJyB3b3JrIGFzIGV4cGVjdGVkLgo+IAo+IENvbW1pdCBjOTY5OTJh
MjRiZWMsIG1vdmVkIHRoZSBFTEJJIHBhcnNpbmcgbG9naWMgdG8gdGhlIGNvcmUgY29kZSwgYW5k
IGl0IGFsc28KPiByZW1vdmVkIHRoZSBjdXN0b20gcGFyc2luZyBmcm9tIGdsdWUgZHJpdmVycy4g
QnV0IHNpbmNlIHRoaXMgZHJpdmVyIHdhcyB1c2luZwo+ICdwY2ktPmRiaV9iYXNlJyBpbnN0ZWFk
IG9mICdwY2ktPmVsYmlfYmFzZScsIGl0IHdhcyBub3QgY2F1Z2h0IGR1cmluZyB0aGUgbW92ZS4K
PiAKPiBJJ3ZlIHN1Ym1pdHRlZCBhIHNlcmllcyBbMV0gdGhhdCBob3BlZnVsbHkgd291bGQgZml4
IHRoaXMgcmVzb3VyY2UgcGFyc2luZwo+IGlzc3VlLiBQbGVhc2UgdGVzdCBpdCBvdXQuCj4gCj4g
LSBNYW5pCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDI1MTAz
MS1wY2ktbWVzb24tZml4LXYxLTAtZWQyOWVlNWI1NGY5QG9zcy5xdWFsY29tbS5jb20KPiAKCkFw
cGxpZWQgb24gdmFuaWxsYSA2LjE4LXJjMyB3aXRoIEJqb3JuJ3MgcGF0Y2gsIFBDSWUgbm93IHdv
cmtzIG91dCBvZiB0aGUgYm94IG9uIHRoZSBib2FyZC4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
