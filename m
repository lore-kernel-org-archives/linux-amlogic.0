Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D0CCD4F54
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2026 03:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jf7wRKZ6xpSVeFhYTMEjj9Qwu0/9484qS3Hp92EIpVc=; b=Xox0B2BKOGwduaP3KE1DnW1DXP
	6TitPyTqOjvcl6y/10/l4OwrPaCizYlbwlshi2ZNXJDOAyXkROBZoHo8dHGGTM7zj4zmQCHVGs3wb
	q++UOtOC2LOAB4rEdw3oTysA4RKsMTPD4wccl+HU9HHEEZeqh0zW/obD2UU5f9xr7DtTUNbaYRhaR
	GFLcw+KZKMONCJoJadWag0MzDkMt1fqz5qnlZfd9AmmBPm66vDluIAMpdwSUygN5/J0/HNvrx9fP6
	xMSktEfuJsBy1bWhEPF0oNV+ZzUBINLYX3Ufbj0zUZId+KXI3HJ26h5bvJgO7slIfEadEikO57eb/
	gN/hUAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXio-00000003PQX-0HkK;
	Wed, 20 May 2026 03:35:50 +0000
Received: from mail-japanwestazon11022129.outbound.protection.outlook.com ([40.107.75.129] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPXil-00000003PPt-1aXN;
	Wed, 20 May 2026 03:35:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6E8E0/o1d6+Kc1sLiz7JD/JuAsDwv/Psoi3YQ2hYdAZPnQWu+LcySBHPaHTdpi3+mcCH9bQZ1T1Lq2vozag+J3Z08eRHTAe7f3x+h18XstaB87qTjJ1xWA+qRwrmuWDbOAkEoz0gZ5J/pjLk3DJrXXhWSEek7NXEm8HGd2+n453bJz2I7u9iknQUDlq+zpogaEaMUHR8YYu51lH8w0V/JFPOVhBQ7sEz6JseLTy/xvFWF1t7lJEnPpQX6kFljWk3kOCNsU22e9lA1pRU+Yw3TruBZssC7zaMaGGbhK+7W4L8iK1nyJAHtxOCKLc6iW1ia/kcy+NNrBKNjpi34XEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96n6m6KpdgGs25hChwiLvbclSj5PoFykxSJyeDGjbaM=;
 b=b3qjQ1tiYh/k2i8o7GwFwCjKFmBRBgoUbCy7cH3LAa9n0DIr1lv7besktrpxfRi+M/tGu2Iz/rPc9Cq4KSpccEvelrEKyEOFFpbsuUIb//x41KXd9MPxoOymSCutlYuaIzzclqsG+xEUeP46s+X4AIN/UnneK2BlTLuBNECGrp//B+1qzqkXnlDt3L2WOLXkZnI2aKdoho05wasolyKWHnqxJaG4OqFYlOoPD+7SPyISBUYr5NwdXVUM1ev94rvH0W117q37KD+4Y54FK4Zh1Fl5c4sJtaPn+ONuFuPQ8+ntTvRTVhRfh3NpoQvclmmvIa0W3cd7hZRxsYbQWmv7wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96n6m6KpdgGs25hChwiLvbclSj5PoFykxSJyeDGjbaM=;
 b=IW8qMaMxrFlBl7h1sVLZv2/YbV+Kaby1/4esn5vwAiHkbsRDzvHyiX1n/JFaAUzYz+V8HT4SkYtVRKW+VYD3KzjKVp4RblZ2QSJPg2YIf7ZjAM7rMchNfiazqoezPtxBSZZy/RHQK1fOTrVKUnuC1cTpg+2IIzBZDe7kIsHIwGDikaxn9SLerZh2Gqj3pnikxo0H5qBZ+idn5yj3UrN45aHHCW/9HgDx6AvGfmAUBfvW1KkpNa3qZUWWw4ppmwAaB62SdWGXMPkoockB0BUZ2ylv+OJiZhnf43VeDdi/gPhpKOwarQsH9RJOwvf58TuPn5lKpocdUDt8TSANHPuxJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYPPR03MB9422.apcprd03.prod.outlook.com (2603:1096:405:314::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 03:35:33 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0048.010; Wed, 20 May 2026
 03:35:32 +0000
Message-ID: <26738e81-97cf-406a-94e6-b4a02f0b9609@amlogic.com>
Date: Wed, 20 May 2026 11:35:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
To: Jerome Brunet <jbrunet@baylibre.com>,
 Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
 <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jmry26my3.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SEWP216CA0012.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::18) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYPPR03MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 328ea365-d038-49fa-47ee-08deb620d8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|4143699003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: a+DoxzDQ1qGkKRHiWsdHfTRpNId/3aSmJgwJOfj8eiV1WPQLRUZacp9rwbIQGJAuGzfV2zUuvFFv4hIxHtbF/165ue45WNNl+ODkWhYu30ObhzRmocWgHH5S1a9JEHcrfE00FbSzu5Mf76vjzwR3XaOvX8RmEfxSlyjIsZVZabZYfgN48UhNNpKJsyC++6FI9YNzYnQpBbEBPXyXLOUbwPkrScgvmDPuAfEB2r9EMWhlyiMDPLKc6D+GluazAjHwtUPczJ3hZv70H1FDAYvQ7C5Wvpx2HO37+YWFywr0U4Oh2CLoigPQWG6IFwjUxzQ782v/V0M3GmogB6gMq076EYt/H4Jqa6aHcCgDYX5QLPc/gDVrqjgou/IB5KVo3pRPhCVstXHO6SHG0E6kMd53U1vJHIk0AtpNu8ZIX60lVVEDMKN0pkg+p/tmfaLDJPcCGkfIPnJUaltd9G7cRr/3HmHABXebfs25Tiq9ja0UwsmjgRyslvjORvfT2HV3lFqnIt6+MvtUD0qF75W901CxMdgvDk4dOfBVRz0TpboW20Z9H061F8xCzJmlkdyPBvNHHnsdU54iY8AR+KZWggR8Bn2PaK9qZTZ7CyZb2PWk5Lua6+SeNAwJ+nMLOlDMhRkHyYptbjxyRvb4lIzIKVof4RCPKZEliCx/LwWEm9VNRwllCeWJ3padauOBratgW/vJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBialM3cTROYW90bFlabGg4anRwVjNGRmVYN1pla0dzeFJ0QzBTYWRvYnNv?=
 =?utf-8?B?YWs0dHBYby94WVAwQ2h5ODhscmc0aDQzTCtRdFR1VDZvOGF6MmtuZlUrK3N6?=
 =?utf-8?B?UjRRb2xjalJhaUpvU3g0bjFZelhwbFdPOVc2RW9Sd0ttZ0xsUDR4V0NrRDRJ?=
 =?utf-8?B?VTZuWEU3RUdZRHAvZ1VVZjJQWExTSEpGQ2c3Z1JmMzArVUM5NDFjbVRJTFFw?=
 =?utf-8?B?MHJvdUVlUXBHN0VPUjgxVXBVYmM3MEpESDk0ZzhRTmlqZlFDWUhCeHdIendQ?=
 =?utf-8?B?QVhYMjExMHdYbU5VaEx1d3ErT29ZS2wxb1RKLzFaNkRXZkh2M0xzVkQ2YlVp?=
 =?utf-8?B?dURickRqMWVKZ2pGM1VHM2IrdkRINytxWTlMMkVMbUo4dnMycWNaMUVzUVVR?=
 =?utf-8?B?MXhOZ2Z5SmErTFQ4dlQwTXJXRU5udm1Wb1RoZGdiYkMrTlpKMEowU1FXYVUv?=
 =?utf-8?B?SktUQUE5V2Zsa3FuVSs5QWJ5VTBLT04wK05uYkRMSS9wQW9NQmlLbmF3MTB2?=
 =?utf-8?B?eDhPWE4rV29sMEoxdTFSZFB2YVpmcS9EVWJnZ2NEVDBoZ0JlN0NKL2hiN0pK?=
 =?utf-8?B?UDFCeG9CUVZIMkNiU0xmTlJqamg3UnNseC9HRSs5UGs2RlFETEtoaWIrOGpr?=
 =?utf-8?B?cS94NVJBblhXdERPSEVOOHRRMDV6UUdJdll5ZHNUMHVBcS9rOWFnSjBoSXlp?=
 =?utf-8?B?VXpoQkZadll6aWhSTjZERkorNUFCZmREalkwMzdnbnpvNGt1SDQ5ekxwcGVI?=
 =?utf-8?B?WEVacTB2VllZMFU2cGlUM1UycjgzdllnRFBJYTNvaEk1eDgzU0FhSTY3RXdi?=
 =?utf-8?B?cWVmYkpmYmlTZXlRZjVSNGpjVFhWaFVKVEJiNHdDMUYyOGNFd1daR2xTSlBC?=
 =?utf-8?B?ZVg3UEtDdEpTRUxxUnpjMWZGdmhkZ05XN1NCakJIeDFCSXRjWmN2T1hBSjRP?=
 =?utf-8?B?dDc1MHQ2U2MwVE5qZW01S0VLUDVjRXM3R3lHekVvMDlHdzc2YnROaXQ1cUtl?=
 =?utf-8?B?R2pHUlMwdzdUdktjL281cjlsQmluL29jTTBZWUtlL3hmbDVsRFFLSVVRUzBq?=
 =?utf-8?B?amhhMzc3ZGp1aHIvaXVJbWtXWm5zQnhTRXpyOU1WV0ljdXNVQWdEZnF0bkt5?=
 =?utf-8?B?Sm1QZ1FobWxGS3V4ZWdMR2VBYXlLVGptaENwc2phZGJVTVVFMFdqVWloUlZt?=
 =?utf-8?B?UElJaGtFTHAvUDBrVC81Uk9Rd3NJTlpONGx6MzI2c3FicUthK3hXYWdvK205?=
 =?utf-8?B?c1ZpSVNxVDBHQkREOFFqQjl1azhJLzltS1pDTjQzQUt4VEhGZHV3YVNPeWFp?=
 =?utf-8?B?djRHaEdNR20zTFhwS29INzR5RGdhSkY2d1MyWFRGU3JhN3Q5THRhbThmTVZp?=
 =?utf-8?B?ODZqaFE0TUZyNTZJYndaY1JVR0tXQW9Dd0ZHS1Njc1U4aUhHdXhCeGNVc3RL?=
 =?utf-8?B?dnUwN2R5R2JkMDlMdXRKYTVyUWU1UjJEci9peDdnM1owU0ZhZXg2VXhnV2hx?=
 =?utf-8?B?Wkw0NGppbWF4bEdtRmpvTDRBaFNoUjV0bldlQzFwa1lWcGRQWnZDVld5bXVZ?=
 =?utf-8?B?ODk3RVAzdldrR2RzZ1NyN09wWXgrSjkyd0x6WDRZQU1EM3RoQm8rV2R5R2RU?=
 =?utf-8?B?YWIzbkk2T095S3k1eE1DZUJnQTlISFlWMFU2ZlMwcTlrWC9iWU1KMWxJU002?=
 =?utf-8?B?dDNabWNicEZSUDA0ZHN3ZWpnK3VOWEhOVEgzQm1iMzFjZG81NHRTdWJDMFRU?=
 =?utf-8?B?RkR3THdYU1kxZzAzOW9XY20zbU42dGdjYWQwM2JoVTVKbDZUSlphaW9yZzF3?=
 =?utf-8?B?OEtudVZNdnFET29wM09LUUNNbThRSzNxOEVwcjFNdG9pYnpBNU5oT2NMUlor?=
 =?utf-8?B?L2diSVExTFJQNmVNSTNKYjRZTzk0cXpSSGZLeXRMT01DcmJmeFRBK3VWSll5?=
 =?utf-8?B?eG5Lc2VRWkIwOEpCcm00OTBLSkVZTE9SZnNyRDgwR3VQcllkSGpSc0xkODcr?=
 =?utf-8?B?UUpXcnRYNGlCTkROdjNlTi9TN1dpZ0hQVytNNFp4WkUxZTBoMzFzM3lGN3RB?=
 =?utf-8?B?ZlAveDY0bUI4UC9LaG5TNlBJTDUvaC9jKzRBQkxvR3NSWlFIU1NlQUtXWjY5?=
 =?utf-8?B?T0NuSno2WTU1b1lPekhnZHpVUms4OStSQzBRSlZqdUZXRVRJYkZwRlVCMDEw?=
 =?utf-8?B?R1VmNW9lMkh1UFhLRHNFa241cVRMaExxUW1RNHJtcGN2Q0ZYdnpJbG1WNUp5?=
 =?utf-8?B?cytMWmcySjZYbUdCaDFZN2E4TmFZaWhGSCswUFB4LzhUblF3eWxRK3dVYWt5?=
 =?utf-8?B?KzVseDBGNlZsL1lxTjZ4OUJ0eEtOT0VKSFQ1K2tCVDUzOW90bmk0Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 328ea365-d038-49fa-47ee-08deb620d8d1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 03:35:32.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkUGZ7S7UGuk8rsxCDdJCD0nrntorTbREoQRFUE3yWoY+pmz/5HOjvDDH1JYvk+hToIHGEbygpGL7RtE6wZ/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR03MB9422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_203547_424690_27D7A888 
X-CRM114-Status: GOOD (  16.05  )
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

T24gNS8xNC8yMDI2IDExOjE2IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Cj4gT24gbHVuLiAxMSBtYWkgMjAyNiBhdCAyMDo0NywgSmlhbiBIdSB2aWEgQjQg
UmVsYXkgPGRldm51bGwramlhbi5odS5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToKPgo+
PiBGcm9tOiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Pgo+PiBJbiB0aGUgQTkgZGVz
aWduLCB0aGUgUExMIHJlc2V0IHNpZ25hbCBpcyBjb25maWd1cmVkIGFzIGFjdGl2ZS1sb3cuCj4+
Cj4+IEFkZCB0aGUgZmxhZyAnQ0xLX01FU09OX1BMTF9SU1RfTicgdG8gaW5kaWNhdGUgdGhhdCB0
aGUgUExMIHJlc2V0IHNpZ25hbAo+PiBpcyBhY3RpdmUtbG93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmggfCAgMiArKwo+PiAgIDIgZmls
ZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9j
bGstcGxsLmMKPj4gaW5kZXggNWEwYmQ3NWY4NWE5Li44NTY4YWQ2YmE3YjYgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNv
bi9jbGstcGxsLmMKPj4gQEAgLTI5NSwxMCArMjk1LDE0IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xr
X3BsbF9pc19lbmFibGVkKHN0cnVjdCBjbGtfaHcgKmh3KQo+PiAgIHsKPj4gICAgICAgIHN0cnVj
dCBjbGtfcmVnbWFwICpjbGsgPSB0b19jbGtfcmVnbWFwKGh3KTsKPj4gICAgICAgIHN0cnVjdCBt
ZXNvbl9jbGtfcGxsX2RhdGEgKnBsbCA9IG1lc29uX2Nsa19wbGxfZGF0YShjbGspOwo+PiArICAg
ICB1bnNpZ25lZCBpbnQgcnN0Owo+Pgo+PiAtICAgICBpZiAoTUVTT05fUEFSTV9BUFBMSUNBQkxF
KCZwbGwtPnJzdCkgJiYKPj4gLSAgICAgICAgIG1lc29uX3Bhcm1fcmVhZChjbGstPm1hcCwgJnBs
bC0+cnN0KSkKPj4gLSAgICAgICAgICAgICByZXR1cm4gMDsKPj4gKyAgICAgaWYgKE1FU09OX1BB
Uk1fQVBQTElDQUJMRSgmcGxsLT5yc3QpKSB7Cj4+ICsgICAgICAgICAgICAgcnN0ID0gbWVzb25f
cGFybV9yZWFkKGNsay0+bWFwLCAmcGxsLT5yc3QpOwo+PiArICAgICAgICAgICAgIGlmICgocnN0
ICYmICEocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfUlNUX0FDVElWRV9MT1cpKSB8fAo+PiAr
ICAgICAgICAgICAgICAgICAoIXJzdCAmJiAocGxsLT5mbGFncyAmIENMS19NRVNPTl9QTExfUlNU
X0FDVElWRV9MT1cpKSkKPiBBZ2FpbiBub3QgYSBncmVhdCB1c2FnZSBvZiBiaW5hcnkgb3BzLiBX
aGF0IHlvdSd2ZSB3cml0dGVuIGFib3ZlIGlzIHRoZQo+IHZlcmJvc2UgdmVyc2lvbiBvZiBhIFhP
Ui4KPgo+IFRoZSBjb2RlIGR1cGxpY2F0aW9uIHJlbWFya3MgYXBwbGllcyB0byB0aGUgcmVzdCBv
ZiB0aGUgcGF0Y2ggdG9vCgoKT2ssIEkgd2lsbCB1cGRhdGUgdGhpcyBhbmQgdGhlIG90aGVyIHNp
bWlsYXIgaW5zdGFuY2VzIGJlbG93IGluIHRoZSBuZXh0IAp2ZXJzaW9uLgoKSGVyZSBpcyB0aGUg
dXBkYXRlZCBjb2RlIGZvciBpdDoKCiDCoCDCoCBpbnQgYWN0aXZlX2xvdyA9ICEhKHBsbC0+Zmxh
Z3MgJiBDTEtfTUVTT05fUExMX1JTVF9BQ1RJVkVfTE9XKTsKCiDCoCDCoCBpZiAoTUVTT05fUEFS
TV9BUFBMSUNBQkxFKCZwbGwtPnJzdCkgJiYKIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIChtZXNv
bl9wYXJtX3JlYWQoY2xrLT5tYXAsICZwbGwtPnJzdCkgXiBhY3RpdmVfbG93KSkKClsuLi5dCgoK
QmVzdCByZWdhcmRzLAoKSmlhbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
