Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09AEC61DD3
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Sep 2026 07:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H74SjCr5NaRycD3yuDIFRShlnVrPEGLr7zT1JuC5F3I=; b=PRSwPiry6qFBgYjDqnacGmCeFJ
	sbyDVNcT49GZqrbFa0NokJ4cJtI4jR/bAh2oj0CwEekcfyOVKdTFf7A45rkZ84f30RVgC9BTLLCvQ
	L7VdlQfV/qY6HxE6Syy9R9iyjKHe7RmpGGAhSqGqPREnGBUK+mJKJiSo7kmxgc2QnI3XDH05Nn4cn
	tzK6LJGARZvieMsLEH7eAXHmHPxmECEC21+N/8Qc761+lDuUEB3poZF95+1KGtB2d5l7Do5/P9RJK
	FTYG4sz2LaNy2ZQchtJdPGzVlzlMWoadY0d2zciQi5P0+ZmJjdP0NcmovgqshXc1rXr4x7cVwy4h3
	ScveXCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x225U-0000000GeJt-2YqL;
	Thu, 03 Sep 2026 07:42:20 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x225O-0000000Ge1n-2ryG
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Sep 2026 07:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czdlml64KRGSg0tnE7zuwRgpKD9KUUZWcQoc2+ql1OIIPog1sDeY1bcrcfDpIM0ChTpMiP4o7zIsc39pnmjyyzTyLN6IbS1+vqk9kgBEaCbucp5z9rqo/8xJir2rxzGFCLbBjPErTk4jNwjwnHO92yJVUDAp+luo3rQ0dKt2GAeLifseYYfRInUQXDahqCQU+sotzgCScr0OFjurKQTS2QsnnjJdYcO7mzGV6ZTzG1JoqARFzq0DmlvPPatXdkVsaomh+AUqG2JWdBoN1XgKplASXtYRNWWQHvX8fizoAl/82y9674bHiQmyzfCOXT6X5f8lHDA+f7sVvlUHEF1v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqlvDruJqYy23NDOTzURE8KzQWOgKafR8a6foB5tMwk=;
 b=Jsnq+tOB1d6nz/jmhaxnAfkKlPyJpc45FfhbyLqSxgGpuviNghTm66Fiis8jDbG8P2IF8JD/darWQv6Y3LjEbiytmyFtOV2adK2X6g6NzqkC8lZTZlTyI/pphpub80nT48vG/UT5RdK2LVnzIo0edq8nyrE7mz0XmzajQ6xvGheVkZN/gob1xzuO0ps2Ov7wonKXhxyR4AZwaAA6SDoSJR5GfHqj0QZyAVh1EjxS2ghlm8VPAx2bF89DNLc+PjLGbpCqpBi8rvgAumiywm7BzSUPdCCLXqu5AuoR+mKbVPDxfF2kRF/0erZiCKOSKaG2Z9abpHWz/M9CdOd+cZDdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqlvDruJqYy23NDOTzURE8KzQWOgKafR8a6foB5tMwk=;
 b=i1gZzXpR8yOayYRkvPNJaefArtao7lTTIOg2wg4uh1rh6FIS4Ccsudph8mYwH2EzXvtZs+6XLctThCyeZyL6SOhopXjO9BH0nLH7gb4fITRp8pGk5kPxyiF9V+0jb28yOR+k0ZqNEh1TYo9HaH/WPtdAG9Eawrv9iu5h4tHUCnsS5VzkbNMHjRVoVD4Gsw9KtG3+3W0wIWmkbXux/eICQjpZKlCb54Xxa43F4/ywbgKrcFjOeg0SSEp7HDmTjSx/ZQcfz0KOjLK272VYfG8Xjv+M4YFzLMPTKS68cubRtUB0sDBfnh5mSeGB953EU1Aw9/O2wf8kOKofbck/iGnBXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by JH0PR03MB7446.apcprd03.prod.outlook.com (2603:1096:990:1b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 07:42:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 07:42:05 +0000
Message-ID: <369a2699-52fa-45ec-b55a-99f2a8fbca4f@amlogic.com>
Date: Thu, 3 Sep 2026 15:42:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260903-amlogic-dma-v12-0-f769bc344056@amlogic.com>
 <20260903-amlogic-dma-v12-1-f769bc344056@amlogic.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260903-amlogic-dma-v12-1-f769bc344056@amlogic.com>
X-ClientProxiedBy: JH0PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:990:5::19) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|JH0PR03MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd65545-3ef7-4d02-7d75-08df098ed9bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|11063799006|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: M1nEeNHXx7FPLM55pLB7K2aqiKxWmz4V4aMSZY5+tjwOs+ElFjjnqPQmFRn4QWKXNvPbl+mYs36uIuDDzYeAKUDcPNE1+3hzaUG5DFi4rlA3pqis3ulp7FyHsiP2L0uqXygoXtuQWjH44PyRVM4pWLNrvnioPLFHEgNcxxoLPnbdHJDNvlNXArGZ5teDR4VhiEkoFXdea4jPNLmAogGDmv10dO8g0MBo6lHEHDp9A0xkl01ESshNtsSZclJwp2f5s92st32Y5Xy3qU9u+t+zdKP/9cJ3eNiTiuLz/NINPNJAZUW9E3YmCG/+7b+uXT8pTQDiNy8Tyc5QsEPb3JE/4o+LRLnxXSuBij+AfPS8CN1lf325bRlzY9c6lz/Y0fz3mzntL0SzE7qlinvJ01CxNSHxYBbE+uGQ5nnnAQbT4DboDx+tcju3rLpCI02msYJ3oWSblMjoo3p6XM9Zl9afSJye3PNSCy4JbgYkgIpkc78DhNOShpgsLqIE6hf+Buv0YGHnsPZSSXbOy9kbKMTWY3ZL6/fcuod+fsFvyCm3Czf8G0vcmEPQik5yz3utIhvpOBUPxVZ+3Vq2+3JwEAFwJfEBg4nxfnpeagAJJ88q364rzOp8Yr5gxaSv4UhQ/mVY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3RlaEF2RnpRWUZqZ3N0cTB2d0tUUStTT0NaSmtUWVVLazR6MFZHdjQzNVhu?=
 =?utf-8?B?TkcyN2FJaldGQW52U2ppRFNUT0c1d1ZvZ2F3bGdXYmwvcTlLanBpR05VaTQx?=
 =?utf-8?B?aVlVTTlGQ1hQMmxpRW5pcUpsQkRDN0Z1dG1CbGVrM2crc0hZR1pKQm5yaEwz?=
 =?utf-8?B?aFcrQnROVHpWdERIZXk2cmpHeTZSTTU5MDFtMjBSRzlPUVYwSXErMCtTdFZX?=
 =?utf-8?B?Z2lnK1QvbEhKMHpkWWRPK0V5YnpRY3NDYmowM0k2WE1xZGtxWVY5VU5aYnVK?=
 =?utf-8?B?b1NlS1BkbkpMQVBLcXYyRk1FMTNUOTBxZlpUaitDc1psNlRTV3hheUJZdGVk?=
 =?utf-8?B?RU8zNkxGeXpNMlZzY0hTVjJ3akMxR3dub1RjaFFUdE80OFNjOWpBTm5PUTFR?=
 =?utf-8?B?ZFd3QXlTRVpPRFNTd1FVYUlxcWJjR0loWkJhS0hvZjJkUS92MlZoMUFjNnAz?=
 =?utf-8?B?RHJDVXBONGljb2V5bkVKcEVGbW9ESFJ5UTBOYmFVQk85YUNtU1FhbHRQWGow?=
 =?utf-8?B?bkdVTno3bWlZcCtDOXFCMGt2WnhWZWFHNlM5YzFOM2E0QVFiZjlZTlRDbEkx?=
 =?utf-8?B?dDJKZGkya2RpeENzOVAzUTR2MDlEanhQRVFtQWNEKzNJbWt0NERBblM5UVpa?=
 =?utf-8?B?dzhKdVhmRysxd3NLMW03eUlsY241SWl4TDJGWWx6SVNXYit6UjBtaFdONjdr?=
 =?utf-8?B?VzlNZ2QybTdqRTUxWlB4TFhJQll3RUE2bVoxcFJCMzRJOGtPV1dMWnFvc09l?=
 =?utf-8?B?b0h3a2hZYWNISk1ybEFkSFpyWHRJSzhKL2tQN1M5S2puL2tBcWFmeGxsMnJ6?=
 =?utf-8?B?Sm5WWHFKKy9JTDZwSmFnZGxPeVlsdG4xVEhmZWd4S2VoZ1g3R0hGQ245KzVC?=
 =?utf-8?B?UHRqZ0ZKTm5hNmpidkpndnlPZlBOTnEzckMzN0dIQzF2WlE5MzZqbUN2djRT?=
 =?utf-8?B?aFIvbmQ3djBjT2lCbVI2YjJzNGtQL0Rwamt1Y2ZkRE55U2dBejRyaGxRNE1t?=
 =?utf-8?B?cEVVdlB1V0lWMjF6bGpXdlpkWXRDQTVUbmFhY0pOQVFsWFhBRkF3QXoybFpk?=
 =?utf-8?B?bDdGbkVqNys1d0hnZXdGbHhyM0hhVlROTGRibnhFL1pxcWVrODdGWXY1OGVa?=
 =?utf-8?B?L2JheFIzVFI1VmxHR3NKV015R0VSb1NwdFVRL3RYQlJwMG5aaGVpdUhOQ0ox?=
 =?utf-8?B?NytqQjc0RDduYTZ3QlRVVmY2RThYRSs2OEYrMWVoNXBYU0Fkd3JEYlUyanVY?=
 =?utf-8?B?bFVlNVBvZnE3UEkyK1VnZTh5cFBsbFVRMXpRQVUwL2NiUGd1eW93WjI2NmhB?=
 =?utf-8?B?QUlWMWFBbnEwc0czV1RzYmtOb3lsNktxNHZRYnVYN1dwbXVWSjNmTmlFa2wx?=
 =?utf-8?B?UHJwbFd2d2dpSHRyR1NTdFFFeUpLbjB2bjFJWTFWN1JlVStOY1hYNFZRdkQ5?=
 =?utf-8?B?czA4Vmg4dWlVZG9xY3IzWUtJT1hxRTQzanFWd3dUK0s3cUI2QVlCL3hPMkVZ?=
 =?utf-8?B?VnR1a3p4NjVBcHBXUkJmbmFyNFZ2TlYwNXlFdi9hRWdvUTBQSFM0VUdBRXRX?=
 =?utf-8?B?aUhTSUU2eTV5OHVmK0paclNsRVA1TlUvMXVLTFQrNTR2VkpOT2hzMS9FcmFm?=
 =?utf-8?B?Zndlb21SVWk4ME53MlV4bFBtSmNFUmpEaHVuSlFFK1JKcUcxb01jMnM2Rm9T?=
 =?utf-8?B?RjdzWVNRNENXZzlXdVVmOWxNNkRBRXVLSXc2QkxZZnQ1ajZOa29MTExKMWpz?=
 =?utf-8?B?dlIxNmllK0xmL0syQThjUjJxNVpnUXZqWFBraGN3QzhyVlU3MEo2Rml2UzAw?=
 =?utf-8?B?MFRmOExYWnBtcjErT1Z2ck9sNUtxZDFFRGcwd0RYY3hCVkRSMEJHOUhSMHdS?=
 =?utf-8?B?a0c5OE1sUnZlRG1qYVVOSzNCTzJWSHhQdXZFL3JqVkVSL1hIWVZValFLRVdB?=
 =?utf-8?B?VjlsZG1PclUrQjhkbmdNaVhkUWNyMU1MSTlpL2hjZFBJblFtblJ2eFdqYlRX?=
 =?utf-8?B?UjdQbG1EWWRaSG96VkdIVWdSMjM1Y2UzcjJSRXorZlpBaGYrUDB2amkzR1Zk?=
 =?utf-8?B?TzR5WndrWFpyUjRWRVdnWTRLK0lCbmYzY0xFVThzMkFiNVdRbnQybnNFNVVN?=
 =?utf-8?B?c1JhY214N24wVGNlaDdROE5NM25PRFppZmJmby9aT29SZzVtMHN3Q1NYWWd4?=
 =?utf-8?B?QjIyTWdyMkRvRkR2cDczS2NjV0tBQlFrbGpvRHExT1RzQXdlTVE4ZitlZnZR?=
 =?utf-8?B?czExZnhhYUE4ODdZSkNzM1BtbXlLWk83U1FaUjlkcUk0b2h6WHU1NTVXejBa?=
 =?utf-8?B?cVdOdWFXZTkwN1B3SmJCcGl5OFptYmxBVGFCdUMwNFZvemxLM2VPUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd65545-3ef7-4d02-7d75-08df098ed9bb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:42:05.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ICMt2QqjzPNKwLpiQG0L2WRzMb4dwwlTB1ImiYQ9n4R4gIWEg39Q8uhKGb2NJWJrTVCmmrAFTImTDeWWHm7qY6DWyaRdZ9R8G4RAeD1EwQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_004214_764925_C07C5F42 
X-CRM114-Status: GOOD (  18.06  )
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

SGkgS3J6eXN6dG9mLAogICAgQmFzZWQgb24gdGhlIGJvdCBhbmQgVmlub2QncyBzdWdnZXN0aW9u
cywgSSBhZGRlZCBhIHByZWZpeCAKIkFNTE9HSUNfQTkiIGZvciBjaGFubmVsIHR5cGUuIEkgZGlk
bid0IHJlbW92ZSB5b3VyIFJldmlld2VkLWJ5IHRhZyBmb3IgCnRoaXMgY2hhbmdlLiBJcyB0aGlz
IGFwcHJvcHJpYXRlPwoKT24gMjAyNi85LzMgMTU6MzgsIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkgd3JvdGU6Cj4gRnJvbTogWGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4K
PiAKPiBBZGQgZG9jdW1lbnRhdGlvbiBkZXNjcmliaW5nIHRoZSBBbWxvZ2ljIEE5IFNvQyBETUEu
IEFuZCBhZGQKPiB0aGUgcHJvcGVydGllcyBzcGVjaWZpYyB2YWx1ZXMgZGVmaW5lcyBpbnRvIGEg
bmV3IGluY2x1ZGUgZmlsZS4KPiAKPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraTxr
cnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWGlh
bndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiAtLS0KPiAgIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sICAgIHwgNjgKPiArKysrKysrKysr
KysrKysrKysrKysrCj4gICBpbmNsdWRlL2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5o
ICAgICAgICAgICB8ICA4ICsrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEv
YW1sb2dpYyxhOS1kbWEueWFtbAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLjNlMWE0ZmJhMzA0Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwKPiBAQCAt
MCwwICsxLDY4IEBACj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBP
UiBCU0QtMi1DbGF1c2UKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6aHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZG1hL2FtbG9naWMsYTktZG1hLnlhbWwjCj4gKyRzY2hlbWE6aHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogQW1s
b2dpYyBnZW5lcmFsIERNQSBjb250cm9sbGVyCj4gKwo+ICtkZXNjcmlwdGlvbjoKPiArICBUaGlz
IGlzIGEgZ2VuZXJhbC1wdXJwb3NlIHBlcmlwaGVyYWwgRE1BIGNvbnRyb2xsZXIuIEl0IGN1cnJl
bnRseSBzdXBwb3J0cwo+ICsgIG1ham9yIHBlcmlwaGVyYWxzIGluY2x1ZGluZyBJMkMsIEkzQywg
UElPLCBhbmQgQ0FOLUJVUy4gVHJhbnNtaXQgYW5kIHJlY2VpdmUKPiArICBmb3IgdGhlIHNhbWUg
cGVyaXBoZXJhbCB1c2UgdHdvIHNlcGFyYXRlIGNoYW5uZWxzLCBjb250cm9sbGVkIGJ5IGRpZmZl
cmVudAo+ICsgIHJlZ2lzdGVyIHNldHMuIEkyQyBhbmQgSTNDIHRyYW5zZmVyIGRhdGEgaW4gMS1i
eXRlIHVuaXRzLCB3aGlsZSBQSU8gYW5kCj4gKyAgQ0FOLUJVUyB0cmFuc2ZlciBkYXRhIGluIDQt
Ynl0ZSB1bml0cy4gRnJvbSB0aGUgY29udHJvbGxlcuKAmXMgcGVyc3BlY3RpdmUsCj4gKyAgdGhl
cmUgaXMgbm8gc2lnbmlmaWNhbnQgZGlmZmVyZW5jZS4KPiArCj4gK21haW50YWluZXJzOgo+ICsg
IC0gWGlhbndlaSBaaGFvPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiArCj4gK3Byb3BlcnRp
ZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBhbWxvZ2ljLGE5LWRtYQo+ICsKPiAr
ICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHRzOgo+ICsgICAgbWF4
SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xv
Y2stbmFtZXM6Cj4gKyAgICBjb25zdDogc3lzCj4gKwo+ICsgICcjZG1hLWNlbGxzJzoKPiArICAg
IGNvbnN0OiAyCj4gKyAgICBkZXNjcmlwdGlvbjoKPiArICAgICAgVGhlIGZpcnN0IGNlbGwgaXMg
dGhlIERNQSBjaGFubmVsIHR5cGUoQU1MT0dJQ19BOV9ETUFfVFggb3IgQU1MT0dJQ19BOV9ETUFf
UlgpLgo+ICsgICAgICBUaGUgc2Vjb25kIGNlbGwgaXMgdGhlIERNQSBjaGFubmVsIGluZGV4Lgo+
ICsKPiArICBkbWEtY2hhbm5lbHM6Cj4gKyAgICBtYXhpbXVtOiA2NAo+ICsKPiArcmVxdWlyZWQ6
Cj4gKyAgLSBjb21wYXRpYmxlCj4gKyAgLSByZWcKPiArICAtIGludGVycnVwdHMKPiArICAtIGNs
b2Nrcwo+ICsgIC0gJyNkbWEtY2VsbHMnCj4gKyAgLSBkbWEtY2hhbm5lbHMKPiArCj4gK2FsbE9m
Ogo+ICsgIC0gJHJlZjogZG1hLWNvbnRyb2xsZXIueWFtbCMKPiArCj4gK3VuZXZhbHVhdGVkUHJv
cGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4KPiArICAgIGRtYS1j
b250cm9sbGVyQGZlNDAwMDAwIHsKPiArICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMsYTkt
ZG1hIjsKPiArICAgICAgICByZWcgPSA8MHhmZTQwMDAwMCAweDQwMDA+Owo+ICsgICAgICAgIGlu
dGVycnVwdHMgPSA8R0lDX1NQSSAzNSBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4gKyAgICAgICAg
Y2xvY2tzID0gPCZjbGtjIDQ1PjsKPiArICAgICAgICAjZG1hLWNlbGxzID0gPDI+Owo+ICsgICAg
ICAgIGRtYS1jaGFubmVscyA9IDwyOD47Cj4gKyAgICB9Owo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2R0LWJpbmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS5oIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9k
bWEvYW1sb2dpYyxhOS1kbWEuaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi5lYTdjOTAwNjM1NzIKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS9kdC1i
aW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEuaAo+IEBAIC0wLDAgKzEsOCBAQAo+ICsvKiBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKSAqLwo+ICsKPiArI2lmbmRlZiBf
X0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18KPiArI2RlZmluZSBfX0RUX0JJTkRJTkdT
X0RNQV9BTUxPR0lDX0RNQV9IX18KPiArCj4gKyNkZWZpbmUgQU1MT0dJQ19BOV9ETUFfVFggICAg
ICAgICAgICAgIDAKPiArI2RlZmluZSBBTUxPR0lDX0E5X0RNQV9SWCAgICAgICAgICAgICAgMQo+
ICsjZW5kaWYgLyogX19EVF9CSU5ESU5HU19ETUFfQU1MT0dJQ19ETUFfSF9fICovCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
