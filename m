Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF0CEB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jul 2023 18:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Cc:From:References:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwBsP+/Bj2qRVtdSYELauXz330XO8KlVnpfnpGT2LbQ=; b=Wmka6wI4uvKw57MLft6Rn5Zg63
	wSmmNEj5gtD6xWbpVmbA0PBz+U7SbxZEpZYWJhWjaOMEjAIyb+foitOT8SL92Sri8OAo+4loXvgt3
	Edf/HXXZIpzmYEUtcLdRibx4GsJsQs8U1Bcb1rRzbB8HwAq5HRNQsW06biLtHijgUVoXEbv40eyW7
	gLFdwf+B4iXUWng4fLH8rlF1JQ98AWn21EmxShJB2kxObUlTatUBhsNbLnMd0U9qiax5YUblOVRS2
	5828Z9Db2DEvAJZSBihG8G12+SwHvrMMJ4shekwmOp+iCJ0Cpff3yNCCinTmb+tjwaTjt1rxuYAKe
	V8HrBOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXwa-00Bqqx-0j;
	Thu, 20 Jul 2023 18:00:04 +0000
Received: from mail-psaapc01olkn2082a.outbound.protection.outlook.com ([2a01:111:f400:feae::82a] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXwX-00BqqA-1y;
	Thu, 20 Jul 2023 18:00:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQie4DeeNSr5iwCLYQ2bfCpxSr2qcSP8Ld+6dvpRijR0uO5kfudqnBUAYkYtRBPrGl8WH+rL3awrQv2lf1RNOFvJFE+rAe/glvzACQavViBq0GNQQj1StcZQnJ+vzIRL5g6Yibo9fvnXoltdx0Gm+14zHg/I+AZiy/IGbzc16/ooFIg8uy+noBwex+wejxVA1++53iMOCi25glnlCDxxRxfJIyAF0To+E1GB+BkVsLERDjXTZ8pvWza0D5NeyoP/k6UYrErQH48FVSUwSrVjdesP3cNWSDVi7NmMaNIi8dXyURNWkmrGDV/EQ4p2BabC5LRq8zNoRTn9DquqRHgv+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dln/R/Y0womQgi/U2vrnlyvGevvfnzeMr+HDqhV4YG0=;
 b=OMOlM4/MoOIxdd6QZlD0nKRf3DssoZuUSVCysROmAGObVqiNVNNffZ2r4Wq/L3fDH1gt/ffeewzHBbnXOUjDeZuhk7cnEg1p6ZWZmru+Hmcj61pchOhgb0tDH77Lu2zdJ5ohhuJpUpTRsNcP97BI5ZwwSw+xuHCr5Skud2JWAee0hjmqMCAt+Ke2lDFd5IREPwKfl3yieWQwzvjUJsh03HTEAsONwz531rn2dG+y3v32igd7TuMdjU9czEAWIxfCgZi94INlg4W3DbiwLCOOjmaImerdIArL0tE3h6hmpK90P+ki1yUO5/mg44ooU9BkTKTzCyN5yRxGu6boas0bng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dln/R/Y0womQgi/U2vrnlyvGevvfnzeMr+HDqhV4YG0=;
 b=GhP+Q3qcKnlSLR3s1Esvo/dwyyUBd4MuZsxQPMIiC0se63yqdrQeTJ1w0SQvflDLAgWFH40gFwQ+HwpypiRTANzwYYeirWV/ysY6PqXeqZsReMSKTR0FqCPp1Gx5z9GZuTGzvccXhS8lzbNEDtshxahRAFQlRZBkdT6BnonCBmqCyiYIwrG02Qyt2Cpj3b7MvJNbfhZNdYx0k0/kGbSIFLRxX3ByzcaqdJpcQAPcykq1rPFCLiGizobpUEwfKk5i74oVNUiIyA7qWwGik1SJqib5FFuCtN/zUPTSeb012rUgHiuTRhzlMPr8CSu0WvKd0FE7pulOdDQF35a1SAiklQ==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by KL1PR01MB3809.apcprd01.prod.exchangelabs.com
 (2603:1096:820:41::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Thu, 20 Jul
 2023 17:45:12 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::e01e:6b99:522d:65e8]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::e01e:6b99:522d:65e8%6]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 17:45:12 +0000
Message-ID: <TYZPR01MB555645E1C1100ED41B3D02D5C93EA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Fri, 21 Jul 2023 01:45:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mmc: meson-mx-sdhc: Fix initialization frozen issue
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <CAFBinCAJ1E6JKmFTuaJwGpd_MBzHMZ0mMj-1AE3TNeB2_72nZA@mail.gmail.com>
From: Ziyang Huang <hzyitc@outlook.com>
Cc: jbrunet@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 neil.armstrong@linaro.org, ulf.hansson@linaro.org
In-Reply-To: <CAFBinCAJ1E6JKmFTuaJwGpd_MBzHMZ0mMj-1AE3TNeB2_72nZA@mail.gmail.com>
X-TMN: [161d7Lqt2tlivRIhmLwNSrY4pr7hXdtsNq+cDhfcHDs=]
X-ClientProxiedBy: SG2PR01CA0135.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::15) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <2ab030da-6998-50ef-017b-1f5655cbdca2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|KL1PR01MB3809:EE_
X-MS-Office365-Filtering-Correlation-Id: 443b9e9f-4eb0-4b78-2a7d-08db89491152
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RRC8pmU8FQKoo0B+xIYbNqlWYBVra2cAaHJAMlm4w/OLq7yd6Wxh8bMs2DORMj+z3eghFlbm3ALQ9VNTj1tUQ9A9x1DqgSRoWBBnMILEPegBE0cB84PxxWFhtHcvijFyg6tXRZIfdA7pYaHkmDp/V1t/yIBcsBops96V/6qV6143hLbads6SfnTwfhoRC4/aSiaRBtfue7nx35KH9F82rLs2kKKPwYKNX5JfsjQoTvX+/85xaIsbOM5wcAkR7iIp4mBnPtTRJ5nuBciIf8ROgQ6yNgOPClSvUZ0TmXkTh2+7iTg9QpOhUhGaVBgcT+lkV8IsM3G2RndiULXEIpBDhqTdsByaHRuZzzLqpcRad9zViEoT+q5W6EbhW4w3So9PzAHIOFsC9Zu9+ZFM2HuhzJX8I46JbyE0zgAnB/y34mo9ItX44px9Ul7ZnJVHSrwSnH8smpiSa0w1Of+MeGfz46Z33rPD22tW1mvnNOCNmgr9fj4JNJlPydvgixcNLUrt/gDWgMD6N6e82B+k0sK9d+Zio0C+iY5wT7Bb8wkqh44=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWltTXNhT3k3TU90S2pDeElkRnZ2VzRkTTd2ai9UNUZJSWY5Z3lXZU5wamF5?=
 =?utf-8?B?NkZManVKbUs2VzdySXlFUnlYdDk3YTUrM3FyYTVRRjhrNEVQUUJ1a1FYaFRx?=
 =?utf-8?B?VitwUHM3Vm9rbWVOYVdtcFJuVHhpbVlnM0NPMzJyOEZGNjdNS2s5UFZRNExk?=
 =?utf-8?B?VEtVMFg4U254OStmWW1iL01CYkozTjZZdTZzemR3OTBnM3RwbnV5MnBPdmVS?=
 =?utf-8?B?a3UzMUk3eGJBR0hWSG5XMnA2WjNwWjZMS3NaeGIzMm5JZHgzSHhRelExUG1S?=
 =?utf-8?B?bDNGZ2ZpRXZuNFd5MVFKSkRnTlBOdTZuRnhWZWJQU0J0M2hOODQvVndYeXpw?=
 =?utf-8?B?Y0lCTm1qbmlYaTZidjhRQmwxRTl4ekJqbTlQdzlVSmNjWkh4K0FQbTl6UytM?=
 =?utf-8?B?endVWkRuT2tlNVFvMjd4bmxsU2FPN05iOUVCMTRHbXFyRnRJRDZoUXVOeEtM?=
 =?utf-8?B?VGhrZExwUGcyNmR5TzVVcDByWUpCZXRuNUFOT3BDK1lUaTdSbHlJRkorR2JE?=
 =?utf-8?B?ejlEK3hVVDF2NEl2ZTB4Nmx6bS9NSTQ2amdQVmpOYXNaZll6NHJhUHZ4Z0N5?=
 =?utf-8?B?T3FhSno5YXZOR3NVRFRpanc2YTJrWU9DY2FrLzBpYktNVi9oVXY0K1MyQlZT?=
 =?utf-8?B?QWJOaFpOeVhKUWF6cllxb3RjUUpvcE1XVjZhdk9wVkZUZjlhd21qR3Z1MEZn?=
 =?utf-8?B?R2d0VFFsWU1HOTZwOE5wbnNnaHNXMEpYQ1JyU3c4RGZiRmhIZ3FzYkFtSENq?=
 =?utf-8?B?bjJFREVSditNcUgzRG1xTFFqYk5yZUJEbkg2SlRoQWx0SWYxUUhmckpFa2dB?=
 =?utf-8?B?WHM4MUsyMEFWVzhCdFJ0UnRFekNwQU5TSjNTekdvNng1R2pOTm0wY0NjelNI?=
 =?utf-8?B?Z3YzTDdVcnRJeWZxNHlmbEF6ZGk1d252dXJ4ZjlpUFFycUdUZlVYZE1MTXVv?=
 =?utf-8?B?eU9qQVdGbVl1UWowOWZReGxTMWdZRG9qTUV0TGRteVpSS25DQ0QvYmhsY0Nw?=
 =?utf-8?B?RjZQM0thV24yZ3k0YnhsR01ZTWtVeFpFd2Uyd2U1MUExOTlzUWFyWmoveEwv?=
 =?utf-8?B?T1hxUExNa3M3NTk3Q042aWNZUjA1d0MxdVFUVmNNbGFralg1U1JnL2dUcUM5?=
 =?utf-8?B?Umt0S2NSWW9ySk5DMzNjcHlXT24rUEFwZUpXQ0tyU1BDWVpaSzg3ckYzU2hz?=
 =?utf-8?B?UEY1akRocDNmaE9RQS9nZmovbkVFMExQWmxaWDRoS0tZVXRXWWoxZURuajIz?=
 =?utf-8?B?UVZPRExRbUNySlAxVFlHYjNSRFp2QSs5TDJncHgzQ2o4U3p1UTFNMnU0Vk4x?=
 =?utf-8?B?TzV0eXFvOEgyRyswZ3FDbzVTNWtZdVZvSWZFOFgrNFViUUFlMTR2QUxMTWhn?=
 =?utf-8?B?T1RkWmdrcGtQYktBZTRVU204OUlJaFlyTXdKc1dnQVA2czgyOXVhQUI5K3l5?=
 =?utf-8?B?UWI1K1BUN0JJVDh6U3JJd1AzNGwzS1hsaVNpODhxV2doZDNXSkxOcStVQzJu?=
 =?utf-8?B?WjU2WmFBVmw0Qkw2a3BiaExHeC9BTUdEU2FYekgrSk1IRUlJMTAzclR0Q1Bz?=
 =?utf-8?B?WWE3K3FCdnUzcU1pVHR5STlTemlpQjQrcng3bGlFRkFLUFpLRmRFeXRpdWVv?=
 =?utf-8?B?aVlrQ2ZIbncrUWJORVhqUTkvV0x0QWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 443b9e9f-4eb0-4b78-2a7d-08db89491152
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 17:45:12.1951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR01MB3809
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_110001_682997_4A27A76F 
X-CRM114-Status: GOOD (  23.60  )
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

5ZyoIDIwMjMvNi8yMCAzOjUxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIOWGmemBkzoKPiBIZWxsbywK
PiAKPiBmaXJzdCBvZiBhbGw6IHRoYW5rIHlvdSBmb3IgdGhpcyBwYXRjaCEKPiAKPiBPbiBNb24s
IEp1biAxOSwgMjAyMyBhdCA3OjM24oCvUE0gWml5YW5nIEh1YW5nIDxoenlpdGNAb3V0bG9vay5j
b20+IHdyb3RlOgo+Pgo+PiBDb21taXQgNGJjMzFlZGViZGU1ICgibW1jOiBjb3JlOiBTZXQgSFMg
Y2xvY2sgc3BlZWQgYmVmb3JlIHNlbmRpbmcKPj4gSFMgQ01EMTMiKSBzZXQgSFMgY2xvY2sgKDUy
TUh6KSBiZWZvcmUgc3dpdGNoaW5nIHRvIEhTIG1vZGUuIEZvciB0aGlzCj4+IGZyZXEsIEZDTEtf
RElWNSB3aWxsIGJlIHNlbGVjdGVkIGFuZCBkaXYgdmFsdWUgaXMgMTAgKHJlZyB2YWx1ZSBpcyA5
KS4KPj4gVGhlbiB3ZSBzZXQgcnhfY2xrX3BoYXNlIHRvIDExIG9yIDE1IHdoaWNoIGlzIG91dCBv
ZiByYW5nZSBhbmQgbWFrZQo+PiBoYXJkd2FyZSBmcm96ZW4uIEFmdGVyIHdlIHNlbmQgY29tbWFu
ZCByZXF1ZXN0LCBubyBpcnEgd2lsbCBiZQo+PiBpbnRlcnJ1cHRlZCBhbmQgdGhlIG1tYyBkcml2
ZXIgd2lsbCBrZWVwIHRvIHdhaXQgZm9yIHJlcXVlc3QgZmluaXNoZWQsCj4+IGV2ZW4gZHVybmlu
ZyByZWJvb3RpbmcuCj4gSSB0aGluayB0aGlzIGlzIHRoZSBleGFjdCBzYW1lIHByb2JsZW0gSSBy
ZXBvcnRlZCBzb21lIGRheXMgYWdvOiBbMF0KPiBVbGYgaXMgcXVlc3Rpb25pbmcgd2hldGhlciB3
ZSBwcm9wZXJseSBzdXBwb3J0IDUyTUh6IGNsb2NrcyBjb3JyZWN0bHksCj4gc28gSSB0aGluayB5
b3UncmUgb250byBzb21ldGhpbmchCj4gCj4gU28gdGhpcyBpcyBhbiBleGNlbGxlbnQgZmluZGlu
ZyEgSSBjYW4gY29uZmlybSB0aGF0IHVzaW5nIHJ4X2Nsa19waGFzZQo+IG9mIDEgbWFrZXMgbXkg
T2Ryb2lkLUMxIGVNTUMgd29yayBhZ2FpbiA6LSkKPiAKPj4gU28gbGV0J3Mgc2V0IGEgY29tbW9u
IHZhbHVlIC0gMSBqdXN0IGZvciBpbml0aWFsaXphdGlvbi4gVGhlbiBsZXQKPj4gbWVzb25fbXhf
c2RoY19leGVjdXRlX3R1bmluZygpIHRvIGZpbmQgdGhlIGFjY3VyYXRlIHZhbHVlIGZvciBkYXRh
Cj4+IHRyYW5zZmVyLgo+IEFzIGZhciBhcyBJIGtub3cgdW5jb25kaXRpb25hbGx5IHVzaW5nIHZh
bHVlIDEgY2FuIG5lZ2F0aXZlbHkgYWZmZWN0Cj4gb3RoZXIgZGV2aWNlcy4KPiBJJ20gYXNzdW1p
bmcgdGhhdCB5b3UncmUgdGVzdGluZyBvbiBhbiBPZHJvaWQtQzEgb3Igc2ltaWxhciBib2FyZCB3
aXRoCj4gSFMyMDAgZU1NQzoKPiBPbiB0aG9zZSBTb0MgKyBlTU1DIGNvbWJpbmF0aW9ucyB3ZSBk
byBzdXBwb3J0LiBCdXQgb24gb3RoZXIgYm9hcmRzCj4gKGZvciBleGFtcGxlIE1lc29uOGIgRUMt
MTAwIC8gRW5kbGVzcyBNaW5pKSB0aGVyZSdzIG5vIEhTMjAwIHN1cHBvcnQKPiBiZWNhdXNlIHRo
ZSBlTU1DIGlzIGNvbm5lY3RlZCB3aXRoIDMuM1YgSU8gbGluZXMuIFNvIHR1bmluZyBpcyBub3QK
PiBleGVjdXRlZCB0aGVyZSAoaWYgSSByZWNhbGwgY29ycmVjdGx5KS4KClNvcnJ5IGZvciB0aGUg
bGF0ZXIgcmVwbHkuIEknbSBzbyBidXN5IHRoZXNlIGRheS4KCkFmdGVyIGNoZWNraW5nIHRoZSBj
b2RlLCBJIGZvdW5kIHRoZSBmb2xsb3dpbmcgZmxvdywgc28gSSB0aGluayAKdHVuaW5nc2hvdWxk
IHdvcmsgZm9yIGFsbCBjYXJkcy4KCiAgIG1tY19zdGFydF9yZXF1ZXN0KCkKICAgICAtPiBfX21t
Y19zdGFydF9yZXF1ZXN0KCkKICAgICAgIC0+IG1tY19yZXR1bmUoKQogICAgICAgICAtPiBtbWNf
ZXhlY3V0ZV90dW5pbmcoKSAgICAgICAgICAtPiBob3N0LT5vcHMtPmV4ZWN1dGVfdHVuaW5nKCkK
CkFuZCB5ZXMsIDEgbWF5IGJlIG5vdCBhIGdvb2QgY2hvaWNlLiBJIGNvbnNpZGVyIDMgdmFsdWVz
OgogICAtIDEKICAgLSBkaXZfdmFsIC8gMgogICAtIGRpdl92YWwgLSAxCgpNYXliZSwgKGRpdl92
YWwgLyAyKSBpcyBhIGdvb2QgY2hvaWNlLiBIb3cgZG8geW91IHRoaW5rPwoKPiBXaGF0IGRvIHlv
dSB0aGluayBhYm91dCBhZGRpbmcgYSBzcGVjaWFsIGNhc2UgZm9yIHRoZSA1MU1IeiAiYWN0dWFs
Cj4gY2xvY2sgcmF0ZSIgYW5kIGFkZGluZyBhIGNvbW1lbnQgdGhhdCBpdCB3YXMgZm91bmQgYnkg
bWFudWFsIHRlc3Rpbmc/Cj4gRm9yIHNvbWUgcmVhc29uICh0aGF0IEkgZG9uJ3QgdW5kZXJzdGFu
ZCkgQW1sb2dpYydzIHZlbmRvciBkcml2ZXIKPiBtYXhlcyBvdXQgYXQgNDcuMjJNSHogKHByZXN1
bWFibHkgYmVjYXVzZSB0aGV5IGxpbWl0IHRoZW1zZWx2ZXMgdG8KPiB1c2luZyBGQ0xLX0RJVjMg
YXMgaW5wdXQgb25seSAtIGJ1dCBJIGRvbid0IGdldCB3aHkuLi4pLgoKV2l0aCBzb21lIG1vZGlm
aWNhdGlvbnMsIEkgZm91bmQgdGhhdCB0aGUgbW1jIGNvbnRyb2xsZXIgb2YgUzgwNSBjYW4gCndv
cmsgd2l0aCBhbGwgZnJlcXVlbmN5LCBub3Qgb25seSB0aG9zZSBtZW50aW9uZWQgaW4gY29tbWl0
IAplNGJmMWIwOTcwZWYoIm1tYzogaG9zdDogbWVzb24tbXgtc2RoYzogbmV3IGRyaXZlciBmb3Ig
dGhlIEFtbG9naWMgTWVzb24gClNESEMgaG9zdCIpLiBJdCBzZWVtIGxpa2UgdGhhdCBldmVyeSB0
aGluZ3Mgd29yayBmaW5lLiBJIHdpbGwgdXNlIGEgCm9zY2lsbG9zY29wZSB0byBjb25maXJtIHRo
ZSBoYXJkd2FyZSBjbG9jayBpcyBjb3JyZWN0IHdoZW4gSSBoYXZlIHRpbWUuCgpGb3IgdGhpcyBm
dXR1cmUgY29tbWl0LCBJIGRvbid0IHdhbnQgdG8gYWRkIGEgc3BlY2lhbCBjYXNlLgoKPiBCZXN0
IHJlZ2FyZHMsCj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWFtbG9naWMvQ0FGQmluQ0QwUlQwcC1qazg2VzBKdU1UM3Vmb2hSaDFScVdDY00zNURLWkpw
dWMxMEhRQG1haWwuZ21haWwuY29tLwo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1hbWxvZ2ljL0NBUER5S0ZwUy1Vd2lhUlBNcVNwWDBtTlByUzVwPXlKenUzZzA9cEd5Q2tXSFNZ
eXFXZ0BtYWlsLmdtYWlsLmNvbS8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
