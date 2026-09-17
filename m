Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351CC982CC
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 03:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLc0uJF83dHotfki39TTzEnCpva5XQ8/lXedRVwfmqc=; b=W3mQXBQy8ikTMKy8AG1WlTCZ7+
	sRBUVTW/5ZhRxcYxbVbdFweBYfrgpEWntTzdNBbsuUsQNU5QuzNYLrc9oaMua6wBBD0AVXq0703aB
	qrbtigEYMq9Ye46NXMer3FnjJrzVNha8ScVH6bMbf4EwXacWckl6/WMTAZp2Tnu2Tj5ZEkS/FcF9u
	DbH3ni0VdTIoD+eqIS0P8DOgukjSNB3GAFknDBc6ocVL/ibgq8iGSYuXl+Jkmbcv0NjB5J/bgYA1e
	r9khpcJ+iaOFS8zHgFLEa6qPfbNSxhM7zrRprh3aypxwzmAN3R0WkHS8cVTTEvbU68/LY8IsBFtlG
	8OY33PQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72TL-0000000AVTq-2pww;
	Thu, 17 Sep 2026 03:07:39 +0000
Received: from mail-japanwestazon11022072.outbound.protection.outlook.com ([40.107.75.72] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72TI-0000000AVTK-2WPp;
	Thu, 17 Sep 2026 03:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcnip0W/pDzoRD/TXGCRm4ieIEkRTdLhVcybq2r2r0u58aZaZL7g2Iz2Q40RzeZVU5lT4ILAwR1/ZurlT7YLk4APS8RvRXjp6h6S0Ed+JoPXU3Bg1TfvfD3gcvS1oeeWgLo/eW9VJZIcWIWe7EJV0ZoQcRMADP2wndYv4f2qBuYYcBz8xUQW0WAXtMLTtTRPr11eY6JIVHofuTxmKU45KATn+bK5acEi2d0FDTo7fNPIF/+m4TixWXXiA17CS9z9cOCClupNM+UE47Kp1OLgzYzpW9Sq0iqeakPwbYeVQZEHwZbZbE4rqU3ZcVNv1W1yKXHJpN80R6zIRrDhF7yXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/Br1j44rWw4aWXxj20HxUCf8rvxxOPSrGp031/z63o=;
 b=myoofK/fbNzWYwd8a6Us6bReK2+YPG0T7ZzY/PEM7Bkqj9aV4Dt4lM7SHcBL3pbqTqOVa0XgLp8t1RecZ01yj7NHR2jEvfwBYb25znhwa66OBzrQZezfevuRZA8NhmhXxQphZBCyfJaridgfP5y9rAJOFqmawPym7q8XlCZUW8eqeBSisggh+xdpp+kp9HyHikZ+Ll+SsDC+8aaZdwxLtLQpao4e603V6i26SMDlOqK901L94rBa2C5N3dijdCQlB0vXufB+YmJ5QER2kgcrMzZVOTbvmupoDAIcESd9ZP11SdvIOf/h7Ctf+Z7Z6IpcC/sqSJE383VHQLJuTkVO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/Br1j44rWw4aWXxj20HxUCf8rvxxOPSrGp031/z63o=;
 b=fOh1M8xuAJ64DyMGyui0plFxxKu2ibI+Hqg0kiTRaqYa6tLd3aXN/ZAiMU0MSJniWX7xrDl/PIbjOm2x75jt5PBonDpsOEh7BmPxNZCP+++bbSOhz4MdY1qVh1AlTCzkD53v6MnJbmPxw2Lr6BSaYOcQs3w8XHuOfT/+zUkHCiDzpk+WV9moxh9QMzbkVJhrhYJP2YxxcImzMJx/mu/4iKOPEkxBLvZAdyhQBWI+z6993gRqYbJRLPRXJrM8CmVpGY3ORaNYGx8lyGLFTBVjv9Z0CBovzz7IRqffoggrm9tQzMj1iT/2xBTh9Xl4uf2kTZAnPwqTj2eU/VKJqzrz0A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SEYPR03MB6628.apcprd03.prod.outlook.com (2603:1096:101:81::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 03:07:15 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 03:07:15 +0000
Message-ID: <37bbcf5c-644a-4388-ba8b-11608f444ae3@amlogic.com>
Date: Thu, 17 Sep 2026 11:07:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] media: dt-bindings: Add Amlogic V4L2 video decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20260914-b4-s4-vdec-upstream-v9-0-72fdb0d71b02@amlogic.com>
 <20260914-b4-s4-vdec-upstream-v9-3-72fdb0d71b02@amlogic.com>
 <20260916-fat-enthusiastic-termite-44b2e2@quoll>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <20260916-fat-enthusiastic-termite-44b2e2@quoll>
X-ClientProxiedBy: SE2P216CA0089.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c2::15) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SEYPR03MB6628:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0ac331-2330-43c7-a711-08df1468c6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|4143699003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: ZQMhwo/irEERRfV8w857VXmy28Lumlo/mKBm3n1k8ePcweYpDQTXW98cHYCxgHZ5AWzuXARwnjGBqJdWceUNQQdKvLojUnMFq100B8+BMtrgiVI8CoKaDt+f04CDvZL+9CIUEBCD0sJlKJvHE48WcYEAtQHS46lKQh7nn6DG8XVyWYx14qcRLr/3Do1Py1jcSkx3uZcPL6BKCXqV0xKPLQ37XKeyaVS4yiArAmDc2wiOf8q4ZEgc2D+BFzh8MuxlFOsUxIriwtoEeqfq3+Co3oRN5bVujsYgGGnyaIim5PkZSAlwwO59PFM598jNKSV2mXRceTix+UydwdDCCQyWSV1ZW4eQkuuQB1xGhU70TpSmiVOfDcpj4YGmleiOZjZ4maNU2Xt9cDTACrbQYt7ZzxmK+tqrWkrkBgBfSR1IdooCVDBNO+iWpj2ZUWZWsHUIYrFQyj7HLo0Z94Y62iFHJ2riyUHT6SzgheBZTMFZBnt/IFUmdbloqUMga21eAFhWUrehjAhpWDS5sF+ya0dOtPAGWv6KwhGc34dS1UCDABSXRKkuYaEBUXyaSrp3FZSg0trUaQVQB96uyuJYuCXvzIfKbb1+7UzG/nYjnDWY7mfdReqFDz/SfA3PnOpXJ4UR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(4143699003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDRHSHROTmR2YUVic1Nzc3BiLzl0K29SdzhGSnNDbHNDRTdIQ042VjdiNTNt?=
 =?utf-8?B?NU4rRVM2QUZhSFp4RlRWMlExaSswQmNtdDZkRnA1Sm0rUVdHQStydGFEcXR1?=
 =?utf-8?B?VmViN2E2TTNsa3ZQQi9oWkQwcWEyR3FEamF0YVJseHdrOWwzRTlETHJnMnBW?=
 =?utf-8?B?N1lTMFI4U1Z3WFVoeXBYU1RnNlZ5bno3M1hvRjdzcGxJMDRqeUhQNjVyODBR?=
 =?utf-8?B?akNpbjBkdWNJRHo0am82aGVwbUV2aUl1S2syQ0dPcUpLK1RiM1JuaGs5VWtR?=
 =?utf-8?B?QUptdlhJZzZHazBCWC9Ca1JYR0pSSkd3UWNYbHFUSkh0SjZYQnlXNTdDUTcz?=
 =?utf-8?B?OUMxcmVhQ3FVdnBTaUR2YkdkaU10N2JzdkNOMGtieFU3WGs2UWxib2tEMjlB?=
 =?utf-8?B?NmMxdysrTmhpdFdiZGEySFlpNkNyRTcya3UzajRmTlR6a0E4SEpEbVBPL0ZO?=
 =?utf-8?B?TlI2ZzVqQUJidEJFbHlsb09tZkNMVk5vbmsvY0ZqUDQwa254WjJManIvb3Z4?=
 =?utf-8?B?SUhFcnpzSkJjSkQ0ZnN0V2trQ2hOVnZ0azd0aHltRUhGR2srNy91a1J2QnRu?=
 =?utf-8?B?ZWNjc3F3RGtZMVl2QXJtcnJUMm0xaG1ZcDJHTWtwOWhId2s2NDZxVmpBT0dw?=
 =?utf-8?B?VkJyaU9WMEpMbnRtaGcxRlp4L29SbnZ0Ly9sclFmanpZSjloY2xHR3VHelhB?=
 =?utf-8?B?dlpYRE5oTGNCSmRrRU8va0NqNU9OMFk0bVFiS2UzMFYweVpVTm9HY0R5OS8y?=
 =?utf-8?B?ZW1Gd3UzRWQ4VjdUSkU0SHNhYmJlcklLNHBKMWs1UFdWeEpCV0xLTnV2RW5H?=
 =?utf-8?B?WEZjd3pKd0ZsWit4V0pkdkkyeWFrVWk3ajB4T0pNaGhxamRkaDE5ZjIwVVVy?=
 =?utf-8?B?SnY1WThpZkZWVnFrMyt6SjdvYnpDckZXUFh0QmJKN2tSamlySXJ3QXQzbDNs?=
 =?utf-8?B?blk5YjZqTzFEazVhaTNqMExURk9IS0JsTXZCMXJHMEJ3MnQwSnpaeVl4dWkv?=
 =?utf-8?B?Yk5ob0FkNlVQTDRndXhrQjlnOHdYMFJTejBBRVNxaGRDTjBkZ1B2QjZoUmlk?=
 =?utf-8?B?dFNVVk55ZFo1L2o4TTVVRHNjbU9KVEs4RC9YdlJsQmlSTWl2RVhjdWY0eFh5?=
 =?utf-8?B?YWowR2t6RE83R0E0UFZPVld4bGZsRXNlRzdGWWsyanY4WnRrNmEvdzdrR2xR?=
 =?utf-8?B?ZmRwN0IrMWwwSkNEYTgrek42VmpXSVo4cmQ0Mm1zN0xWNUZ0dWQ2dlpiTnFZ?=
 =?utf-8?B?c0o5N0x4T1FGcTBSL3ExS3UyNFRKcDhTRGhhYU5jMVl2ZSt0citRNTNyTmlW?=
 =?utf-8?B?citTZk5DZHFDSDJkVDNIODhsV0E5MHA3ZTdRU3Y3OW11cnVuMGZYL0xqcGNk?=
 =?utf-8?B?ZEZaSU4zZW5ENTBGb0l0a0NUMm42SmNNRkRucXVyMEVDbTdNeVlNdXdlUCtL?=
 =?utf-8?B?RTVDOGN0Y29QekswVCtWSStvK0d3Tkswb1QzU0tja0RxeWh2MXV2cmExT01U?=
 =?utf-8?B?dXR4TmJVNGxUR3pZWmlmTVVoL2lNMUo1eXlsdEgzNGRDWmxTMm9jbTFJK25m?=
 =?utf-8?B?LzYvYUV3UGJKL0RoMEoyQ05QWXdsOEpGVFZBSXVyRzRUeXZEaWw1VGp3a0Np?=
 =?utf-8?B?amdETWZ6ZHZvUmM0SUVHWklkbEFpRWhXa095eEQxR2dJT1NaMllCZmcrZzZL?=
 =?utf-8?B?RHEweWpaNlhkM2ZJY3pueWE0dXpzY3RJOU9ZTTJSNEQ5alYvZXp4U2ozMEhu?=
 =?utf-8?B?L2l1cDdRU2tDZzdMV0ZrbEV4MXBkeVdmQ2lOZ0gwbnp6UlpHM3NyZjdPUncy?=
 =?utf-8?B?Z21yZGQ3YmVXY0toY2JSWFFWSi90M2tkK2Ewc3VJMjB0M0xYTVRDdHh4NGxD?=
 =?utf-8?B?OXQrTk54N211R0VZQmI5ekJKYUlCbHUxNmEyeWNYZUYxN2FFWjBPMnJ4bFM0?=
 =?utf-8?B?ZEZUYzFTaUhpbUgzV2c5Zi9iVlhKbTFRNENudW1CaUdPaWV1SHBuaGhxbUI0?=
 =?utf-8?B?UE5hT1ZCMXB4K0tEejJJNEQ5c3craWozVVJjdlZnY1lGTzIxb0pvaTdVSWNI?=
 =?utf-8?B?WHJZV2RvMlJGOU1SK2JMOGZQdEU0dDk0MWlTY0tUZURvQ1NkTmU1enVLclV4?=
 =?utf-8?B?ckJIYVJYRzl4QVo2TDB5eWxYZTRyWTk3UEpEYlJjSjg4Z3ZYQk1RODFQd2hI?=
 =?utf-8?B?dU04ZllWQnFlR25RN3VDVkJoSlV4WGM3dFN3UjBZdjFyR0s4Q3F2a0hGZHNt?=
 =?utf-8?B?QXZMbWlVWVd0d2xXWWFGdWdXcy9PS1JPRWJQOEd4amRPTzhTSTJLY3FMemQy?=
 =?utf-8?B?OTNCVmNWeS9oMTZob0ZHSnBGL1lOVGY3Q2xycU1JSEJ5UVdBbGJVQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0ac331-2330-43c7-a711-08df1468c6cb
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 03:07:15.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+GGjPVcR8qQE+tp55ZDpHaq7QTmMHZOXCFYU6vpRIaSuFJyz3Fqs51Z++t0D67xmSdJBXDpFeLxhDB6lhBhNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_200736_655130_29C4BD8A 
X-CRM114-Status: GOOD (  22.01  )
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

SGnCoEtyenlzenRvZiwKCj4gT24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMDQ6MTA6MjBQTSArMDgw
MCwgWmhlbnRhbyBHdW8gd3JvdGU6Cj4+IERlc2NyaWJlIHRoZSBpbml0aWFsIHN1cHBvcnQgZm9y
IHRoZSBWNEwyIHN0YXRlbGVzcyB2aWRlbyBkZWNvZGVyCj4+IGRyaXZlciB1c2VkIHdpdGggdGhl
IEFtbG9naWMgUzQgKFM4MDVYMikgcGxhdGZvcm0uCj4gRHJvcCBkcml2ZXIuIERlc2NyaWJlIHRo
ZSBoYXJkd2FyZSBpbnN0ZWFkLgpPS++8jGdvdCBpdC4KPj4gU2lnbmVkLW9mZi1ieTogWmhlbnRh
byBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgo+PiAtLS0KPj4gICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbCB8IDExNCArKysrKysrKysrKysr
KysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2lj
LHM0LXZkZWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9h
bWxvZ2ljLHM0LXZkZWMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmQzNTBiM2U2OGEzOAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbAo+PiBA
QCAtMCwwICsxLDExNCBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAt
b25seSBPUiBCU0QtMi1DbGF1c2UpCj4+ICsjIENvcHlyaWdodCAoQykgMjAyNSBBbWxvZ2ljLCBJ
bmMuIEFsbCByaWdodHMgcmVzZXJ2ZWQKPj4gKyVZQU1MIDEuMgo+PiArLS0tCj4+ICskaWQ6IGh0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sIwo+
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Cj4+ICsKPj4gK3RpdGxlOiBBbWxvZ2ljIFZpZGVvIERlY29kZSBBY2NlbGVyYXRvcgo+PiArCj4+
ICttYWludGFpbmVyczoKPj4gKyAgLSBaaGVudGFvIEd1byA8emhlbnRhby5ndW9AYW1sb2dpYy5j
b20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOgo+PiArICBUaGUgVmlkZW8gRGVjb2RlciBBY2NlbGVy
YXRvciBwcmVzZW50IG9uIEFtbG9naWMgU09Dcy4KPj4gKyAgSXQgc3VwcG9ydHMgc3RhdGVsZXNz
IGgyNjQgZGVjb2RpbmcuCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+
ICsgICAgY29uc3Q6IGFtbG9naWMsczQtdmRlYwo+PiArCj4+ICsgIHJlZzoKPj4gKyAgICBtYXhJ
dGVtczogMgo+PiArCj4+ICsgIHJlZy1uYW1lczoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0g
Y29uc3Q6IGRvcwo+PiArICAgICAgLSBjb25zdDogZG1jCj4+ICsKPj4gKyAgaW50ZXJydXB0czoK
Pj4gKyAgICBtYXhJdGVtczogMgo+PiArCj4+ICsgIGludGVycnVwdC1uYW1lczoKPj4gKyAgICBp
dGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IGNvcmVfaHZkZWMKPj4gKyAgICAgIC0gY29uc3Q6IGNv
cmVfdmRlYwo+IERyb3AgImNvcmVfIiBmcm9tIGJvdGguLi4gb3IgcmF0aGVyIHNvbWUgY29uc2lz
dGVuY3kgd291bGQgYmUgbW9yZQo+IHVzZWZ1bC4gQmVsb3cgeW91IGNhbGwgdGhlbSBjb3JlX3Yg
YW5kIGNvcmVfaCwgYnV0IHRoZXJlIGlzIGFsc286Cj4KPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsg
ICAgaXRlbXM6Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDbG9jayBmb3IgZG9zIGNvcmUKPiBj
b3JlIGRvcz8KClRvIGV4cGxhaW4gdGhpcywgSSB3b3VsZCBsaWtlIHRvIHNob3cgeW91IHRoZSBz
dHJ1Y3R1cmUgZGlhZ3JhbSBvZiB0aGUgCkFtbG9naWMgaGFyZHdhcmUgZGVjb2RlciBJUDoKCist
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rCnzCoMKgwqDCoMKgICAgICAgfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHwKfMKgwqDCoMKg
wqAgICAgICB8wqDCoMKgwqDCoMKgwqDCoHZkZWPCoMKgICAgICAgICAgIHwKfMKgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICB8CnzCoMKgwqDCoGRvcyAgwqAgKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSsKfCAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwKfMKg
wqDCoMKgICAgICDCoCB8wqDCoMKgwqDCoMKgICBodmRlY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwK
fCAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwKKy0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsKClRoZSBJUCBjb25zaXN0cyBvZiB0aHJlZSBjb3Jlcy4gRG9z
IGNvcmUgaXMgaW4gdGhlIGZyb250IG9mIHRoZSBJUCwgCndoaWNoIGNvbnRyb2xzIHRoZSByZXN0
IHR3byBjb3Jlcy4gVGhlIGFjdHVhbCBoYXJkd2FyZSBkZWNvZGluZyBpcyAKaGFuZGxlZCBieSB0
aGUgdHdvIGNvcmVzIHZkZWMgYW5kIGh2ZGVjLgoKRWFjaCBvZiB0aGUgdGhyZWUgY29yZXMgaGFz
IGl0cyBvd24gaW5kZXBlbmRlbnQgY2xvY2sgc291cmNlLgoKPj4gKyAgICAgIC0gZGVzY3JpcHRp
b246IENsb2NrIGZvciB2ZGVjIGNvcmUKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IENsb2NrIGZv
ciBodmRlYyBjb3JlCj4+ICsKPj4gKyAgY2xvY2stbmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+ICsg
ICAgICAtIGNvbnN0OiBkb3MKPj4gKyAgICAgIC0gY29uc3Q6IGNvcmVfdgo+IGh2ZGVjPwo+Cj4+
ICsgICAgICAtIGNvbnN0OiBjb3JlX2gKPiB2ZGVjPyB0byBrZWVwIHRoZSBuYW1pbmcgYW5kIG9y
ZGVyIG9mIGludGVycnVwdHM/CkFjdHVhbGx5LCBpbiB0aGUgaW50ZXJydXB0IHZlY3RvciB0YWJs
ZSB0aGV5IGFyZSBhcnJhbmdlZCBleGFjdGx5IHRoaXMgCndheTogaHZkZWMgY29tZXMgZmlyc3Qs
IGZvbGxvd2VkIGJ5IHZkZWMuIFRoaXMgaXMgaW5kZWVkIHRoZSByZXZlcnNlIG9mIAp0aGUgb3Jk
ZXIgdXNlZCBmb3IgY2xrIGFuZCBwb3dlci1kb21haW4uCj4+ICsKPj4gKyAgcG93ZXItZG9tYWlu
czoKPj4gKyAgICBtYXhJdGVtczogMgo+PiArCj4+ICsgIHBvd2VyLWRvbWFpbi1uYW1lczoKPj4g
KyAgICBpdGVtczoKPj4gKyAgICAgIC0gY29uc3Q6IGRvc192Cj4+ICsgICAgICAtIGNvbnN0OiBk
b3NfaAo+IFNvIHRoZXJlIGlzIGFsc28gZG9zIHZhcmlhbnQgdiBhbmQgaD8KPgo+IFByZXR0eSBj
b25mdXNpbmcuCgpUaGF0IGlzIGluZGVlZCBhIGJpdCBvZGQsIEknbGwgZ2l2ZSB0aGVtIG5ldyBu
YW1lcy4KCkFsc28sIEknZCBsaWtlIHRvIGFzayB5b3VyIGFkdmljZSBvbiB0aGVzZSBuYW1lcy4g
SSByZW1lbWJlciB0aGF0IGluIAp5b3VyIHJldmlldyBjb21tZW50cyBvbiB2NywgeW91IG1lbnRp
b25lZCB0aGF0IGhhdmluZyAidmRlYyIgYXMgdGhlIAptb2R1bGUgbmFtZSBhbmQgdGhlbiByZXVz
aW5nIGl0IGZvciB0aGUgY2xvY2svaW50ZXJydXB0L3Bvd2VyLWRvbWFpbiAKbmFtZSBmZWx0IHJl
cGV0aXRpdmUuIEJ1dCBhcyBzaG93biBpbiB0aGUgZGlhZ3JhbSBhYm92ZSwgdGhlIGRlY29kZXIg
CmhhcmR3YXJlIGRvZXMgaGF2ZSBhIHN1Yi1jb3JlIGNhbGxlZCB2ZGVjLCBzbyBkbyB5b3UgdGhp
bmsgaXQgaXMgCmFwcHJvcHJpYXRlIGlmIEknbSBhbHNvIHVzaW5nICJ2ZGVjIiB0byBuYW1lIGl0
cyBjbG9jaywgcG93ZXItZG9tYWluLCAKYW5kIGludGVycnVwdCwgdG8gaW5kaWNhdGUgdGhhdCB0
aGVzZSBhbGwgdXNlZCBieSB2ZGVjIGNvcmU/IEkgd291bGQgYmUgCmdyYXRlZnVsIGZvciB5b3Vy
IGZlZWRiYWNrIG9uIHRoaXMuCj4+ICsKPj4gKyAgcmVzZXRzOgo+PiArICAgIG1heEl0ZW1zOiAx
Cj4+ICsKPj4gKyAgYW1sb2dpYyxjYW52YXM6Cj4+ICsgICAgZGVzY3JpcHRpb246IENhbnZhcyBt
YWludGFpbnMgYW4gaW5kZXgtdG8tcGh5c2ljYWwtYWRkcmVzcwo+PiArICAgICBtYXBwaW5nIHRh
YmxlIHRoYXQgYWxsb3dzIHRoZSAxNi1iaXQgQU1SSVNDIGRlY29kZXIgY29yZQo+PiArICAgICB0
byBhY2Nlc3MgMzItYml0IG9yIDY0LWJpdCBwaHlzaWNhbCBhZGRyZXNzLgo+PiArICAgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPj4gKwo+PiArICBhbWxv
Z2ljLHNlY3VyZS1tb25pdG9yOgo+PiArICAgIGRlc2NyaXB0aW9uOiBVc2VkIHRvIGRlY3J5cHQg
YW5kIGxvYWQgdGhlIHNpZ25lZCBkZWNvZGVyCj4+ICsgICAgIGZpcm13YXJlIHRocm91Z2ggQVJN
IFNNQyAoU2VjdXJlIE1vbml0b3IgQ2FsbCkuCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+PiArCj4+ICtyZXF1aXJlZDoKPj4gKyAgLSBjb21w
YXRpYmxlCj4+ICsgIC0gcmVnCj4+ICsgIC0gcmVnLW5hbWVzCj4+ICsgIC0gaW50ZXJydXB0cwo+
PiArICAtIGNsb2Nrcwo+PiArICAtIGNsb2NrLW5hbWVzCj4+ICsgIC0gcG93ZXItZG9tYWlucwo+
PiArICAtIHBvd2VyLWRvbWFpbi1uYW1lcwo+PiArICAtIHJlc2V0cwo+PiArICAtIGFtbG9naWMs
Y2FudmFzCj4+ICsgIC0gYW1sb2dpYyxzZWN1cmUtbW9uaXRvcgo+PiArCj4+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpCUnMKClpoZW50
YW8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
