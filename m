Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DBECCF9FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 12:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZzK8q4UuZmtyQ8fvyCwDWlF0E77TqUOmPNbvjKnsXE=; b=TxdVjvvPor3hp7u14N8NiBQRJs
	0LhUHwx0RJNqSCgNzeIq6GCQeB2bDxnbDubIzuBdl9t2ujG9Rsjos3svB5J3xsjWe4dJpW9nJVuzp
	RdhYPAcr11AkRukbzWRcU//WxopLYQt90cfxGhKzEEurQJcwoc6FD/NAHKc/dwGzVJQvqDPMWxwG6
	L3kaQp0qCGJlkK1gCp1HfoTI/G7+LlpQ3wt6k6KYtAYMTbiL46S53ZStWSNNXBfacd5aecySpuPTm
	tLVWThxYTBabwG5yqSBkByuhZnYdAX69nr2zropOJsC6V1NM/4B+GDr93D5+sM6Sysftosc0IcZkB
	eM3ZsWMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoDZ-000000064j0-0o8g;
	Fri, 31 Oct 2025 12:26:57 +0000
Received: from mail-eastusazolkn19011001.outbound.protection.outlook.com ([52.103.1.1] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoDW-000000064if-1UUe
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Oct 2025 12:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4Kb6kQHH7FkHcO9iWSdFW7jeWYgBFdaeFvVDNyoupxlGYNkhyPcCEm148JcKo3s9jY9SiFDMfKTdKfH7+iV+M6wxSep2GcaEVy9JWZacCOPmflNNL2ZhPrBCJFT+O4iR58+Xb2g1NYWKOD1+vICBQyYN3ZaQZX0x+jQ8BcRjJnDfiBFpELf/yLJyTb+RKTSTFYEOMZAk52P1asgT3T4huVvExverJEL7E5PzihtV7em9MM6jcb00xUQdPBLz8MC8Z9tCBz9qt/p13shXUYf2Xtw0I9nrEzOe+Zl8vaofCQYLGJqe/q9eC7tSTaYgy4oPr6riT6TIr3i/Jbjz2uPJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivStXU92dxeDbYsyxKKfAZGiaqEGqNGM5JByfQxJOv0=;
 b=lKoRT/cYThYa/K0WTypeRRRVSm49tXEt+XR+hBmR2Kv7FeSA1MdhqRdO65GFTPEyFTKkwcV+khqw0BQBfx9lRd5zvL0AXnGgPzOm6mO18KGSvPHyGmUAAn3Qo7L3KInDwfWWj0WuMJn5WuUd2ZNDVVRhBdXeT3Az905WjFWPTYS1isIslylnVmkTbItwBvWeB9LcuOqtXX4FIISoE2m2wt2owlhS4vAXt2BMGLUGb3vbqZXe4eB+LwDQ44CTKoK+Hz9Tk1wWZV5a3F+cILsyfv3KD8kXCAUEYixUL/sfXl7Z6hB7QuKM3rqqnnRLeZ00FZzTz2sjwMpcD4jlRUM4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivStXU92dxeDbYsyxKKfAZGiaqEGqNGM5JByfQxJOv0=;
 b=P06jWgOXJK7iK8NjqRfbEj+c3xXjpjLjrT/TiMaggDoE1zAFjITUsevzJCClrALO5bZk7iAS54pJK3fTZOTdUoCA+ox0urneSn5tih7q+iS/QMzgP+R/YIcixsZ0aEmkNoEds2ytXPyK7XvlvE3crS4/ILhzhuOr/o+0aPiUzZOADh2F7C1mNg/BAT+t0B6rt5y6JJOQ0cMcgKUgqdk7NvTEV94DFzmjJoMKpaJ/XmXn/zwGdSgzmM1dUacpFItI3WSU2itlwMk+LEBQlAWCgQUW1eEpdwH9oZchBx/kWWnKUX2LWAPFMheWZh0iE141tkpIwKDpDu9I48xAo28qJA==
Received: from DM4PR05MB10270.namprd05.prod.outlook.com (2603:10b6:8:180::11)
 by PH7PR05MB9286.namprd05.prod.outlook.com (2603:10b6:510:1b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 12:26:49 +0000
Received: from DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c]) by DM4PR05MB10270.namprd05.prod.outlook.com
 ([fe80::76f2:11b4:e433:a65c%5]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:26:49 +0000
Message-ID: <DM4PR05MB1027077E1F4CD8B1A7EDADF1DC7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
Date: Fri, 31 Oct 2025 20:26:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20251029171542.GA1566240@bhelgaas>
 <DM4PR05MB10270506AAC1FCE53C4915CC2C7F8A@DM4PR05MB10270.namprd05.prod.outlook.com>
 <59baecc0-bc28-4411-bf83-37ff9e7dd193@linaro.org>
Content-Language: en-US
From: Linnaea Lavia <linnaea-von-lavia@live.com>
In-Reply-To: <59baecc0-bc28-4411-bf83-37ff9e7dd193@linaro.org>
X-ClientProxiedBy: PH8P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::32) To DM4PR05MB10270.namprd05.prod.outlook.com
 (2603:10b6:8:180::11)
X-Microsoft-Original-Message-ID: <b6d6172d-4311-475d-bbaf-a2a77f538ce8@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR05MB10270:EE_|PH7PR05MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: bb28991b-4d5c-4f3f-5741-08de1878c3ca
X-Microsoft-Antispam: BCL:0;ARA:14566002|12121999013|15080799012|8060799015|19110799012|41001999006|23021999003|6090799003|5072599009|461199028|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG5Cc1NWNmpWQ3UvdGxFQ0xSWDg1NDhWSEpHTG9PT291SThxWmpDeWxWemJW?=
 =?utf-8?B?ZFlYQWVvbW8yRXRLcXFYdFdaeHVNUmJ6Y0Fidnd0RVQ1ckgzRTdReXFGMXgy?=
 =?utf-8?B?cFlUMGhaT3BFaEhZa2RhRlpWLzRla0VQTWlZVy9xNWE0Q2NiWFFGQ3lQL29a?=
 =?utf-8?B?dTNvSWJNa3o3Z0QzOUE0VVFLNlhTZ1pnNC9ITlI2aGhCZk9VVDZJYkdKUVgv?=
 =?utf-8?B?ZCsrL3UvbCtGRVR1aUFKejBHYVlmclVrblVsODN4TStLL3NVNU10bnNUYTR2?=
 =?utf-8?B?NjFmWGpZWVJQOUptTnBWUzlPbU9lZk9zUjc0K3djVWdWUGJ5VXYzY3dnUkR2?=
 =?utf-8?B?NjM1cnBDQVNoVkNRemE3eUJnVWlJbHQvOC9BaE50TEJISXk3Skd5K2VVa1Y4?=
 =?utf-8?B?amo1UG92WU5Ic0lYWkpLbDY3d3VjeXVJWnp4V3ZCZWMxQUU3QTVBUk0xUFJo?=
 =?utf-8?B?bEF5UW1VVXBtMmhFWGdkb1cvaGxDY3FjeVRjYkZlbkI0cnJhZngydis2SmRz?=
 =?utf-8?B?MnNqeENzSHhZTkpDeG9STGZNRzRMNm0rVWs5S3dNbytRQTZtYXVoQllJN3Uy?=
 =?utf-8?B?bGRQREV4T1RHY0RRL3VtNXUyUk9QY2s4QldPZm1GclA2NEIyaUlUaVJ2MjV0?=
 =?utf-8?B?MG9sY2phdllzQVA1MU1ZM09odExESFBqcXNDRG9qdFJEUzN6b0Z1Nm1UbGgw?=
 =?utf-8?B?S1RQTkhZbkw2WG5PTElUbFRRZUJWRHRKVnlMY05Gc3pzclc2RFcxR0NLUVlB?=
 =?utf-8?B?Q255eEtMSDNEeUNNNFN6dGVqelZQQWgwWGRycnFFM3ljeldSNUE5NXpCTWIy?=
 =?utf-8?B?MnRJbzRub0JkV2JwemxZZC9ZQ1pDV2piR2lIKzZKNEdtS0ZuSEFVU3pBRng5?=
 =?utf-8?B?N1Y0ZFFNVFBzVXpJc3FRUDkyWVRwenhCMXh3TmsvOEFoVU52aDJJNW9GUC83?=
 =?utf-8?B?MjhQSW9mTmJaMzdEQzYvbEp2eGtVZVRLY0NoTDJZUWVaRjkzTm9zUTBwMlhU?=
 =?utf-8?B?aU5ESGJiWTVnV1lEMlI4VjJuQU5JUWdTTjJTdEhMektnVytJQWc5YjJGSmJt?=
 =?utf-8?B?ZkZVYmNST0w3d0xNNGIyUVRHZkRRL0xwRWlxRWNtYys2OXk4SG5wbHpTbDVx?=
 =?utf-8?B?Zm1lMVpsaS8ySXJSZVI3aUdNcVBvakNkWXF1SGFoa2toczAvS1BPSnJVL25w?=
 =?utf-8?B?VXVZR0Y2YnpaZmRjK3c0VlZOcmsyU3pLcWV4d3diREJHWW9VVk16TG5LMUJl?=
 =?utf-8?B?TzMxMmFzV0Z5MFc3TURjU3E2bmFvVzBjelhBZDFvbGttT1NLVitibGpnS0xC?=
 =?utf-8?B?clB2Ym04QnFJaXNPblpFRDYyUmR6YlA5b296R1RDZnFramZaak9pTTRFNk5y?=
 =?utf-8?B?Ry9nUG9zRFowT0IxallHYU9wUkh1ZENjcmlkbXlrWjN1Rmw3TnJhb2tNcG5O?=
 =?utf-8?B?UERGNzNiMStGeUZBWnRsQXN0TXE5clB4bHJQSGgyK2UwOS9xSlhqWDZLdHhm?=
 =?utf-8?B?ZTRaZ3dNbXNXc0JIcmFUYk9aZEplTzk5MU5tcWdlOTZ6UUNBTDl6VlJKejZ1?=
 =?utf-8?B?MXZDV1R2Y0szNmc2dnpoQTV2d1M3VVoraHB2eE9NNEpuRU45Y25XYktxVkEx?=
 =?utf-8?Q?EBWZO65ztNJk/HjLtbQHezRBXpq6fYilvUTlUnuMZ26k=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZhUkdhL0hBR3NXYW11MDdMc2dhYjQyQjBwOE1uZ3ZDaTNBVlJwTElTZ09i?=
 =?utf-8?B?cEtWbURHNmV0aDZ5d0djS21YRmNoZkpMODdRRDJpY3RHRDVESXpTRkY2SldS?=
 =?utf-8?B?a2hSb24zbEpsdHFZQ2JnbVFBZ0FjekxkbDF3WGpmUWFoUmVmejN2dnpUSSty?=
 =?utf-8?B?SFhpUk5VdnRaV2pzK05yVWtlczVqZzc0ZDRCZllnbFNGMFZhdmZuSGFFa1B0?=
 =?utf-8?B?MjQ4RFk2NUhDUnJWMTk1eHltUGpxMDVHZHpvU1daYVlpeDk1dEZBN2xhTDBn?=
 =?utf-8?B?SDNhaUNoSFRRbXhMa21GYXgyZTJGSkJTWCs2eTc2WmlJZ0FvVEdobTJMbXBi?=
 =?utf-8?B?cHdiWTBPUnBpQWpWZTlJS2lzSjBhYjJJN1lvQ1YzZ1VadW5sYThic3czN0Nv?=
 =?utf-8?B?TzQ1UWxEUTNtdTNjOHRzNXozOVRmbkM3UnBLOGNUMXpiaFVrejVvSFArWlhC?=
 =?utf-8?B?NGRWeDFaaXZrVVNuc2o3Um84VDk0RE91eXJWdGtaN3ZkWkVuMTZBcnN2eWJX?=
 =?utf-8?B?N3RsbzFPUUE3QnJOUHcrY0g4Mk9Va2hrMUs1ekRIa0s4TXNWREVIZ1FvVG5M?=
 =?utf-8?B?S3hhbXRja3NhNDBVVjFtSGg2Nk1oOFdqSWc2a2dxZ2xNNDJPVkhZcGlVWWFE?=
 =?utf-8?B?T1R1OExuV1A2VWlFd2NFRXVzRVJzNGtXUGhsYXByc2NVZ2VTWis4YkRiMmtS?=
 =?utf-8?B?NTFEZWhiS3VCY0FUVXdzQm5HNm1KdTNITEI0NzFJWTB0QkVDZm50SmdjelZH?=
 =?utf-8?B?eTZkZVE0RFZIeEVJMmpiS2h2dUt6KzJtaVJBc3pmMjUvc05YcVdTcWZEZjV5?=
 =?utf-8?B?VkJ1ZlF0a1hMUUxJQTh5WFBYeUY4ODQrOFRvMW4vTTAzSHRXVW8vZWIyMHNr?=
 =?utf-8?B?aUtxSnRmc2MvTkk5Nkg4TytaRmF0V2JJcVdXeHBnNUluZXYwa0hSYWZUUFBV?=
 =?utf-8?B?MGlTWjBGQ1hWZEFKeW5ZVGFSZCtmN2NXNy9oYUtSUjQ3NXg1NE9nZkF3ODNZ?=
 =?utf-8?B?WVFqalVGbG1TZU5RYjhYS3BLdWhHaVBJU0luRXVuZndtSmJrOXcrTHFzTDQv?=
 =?utf-8?B?QjNxVkxKTS9WcjNzdm9TMjZJSzRNbjd2TzBETjZuRVI1VUlYZmxPY25NbUVQ?=
 =?utf-8?B?eHMzdzRrZkdhRHFrMmVjUEtLTU9Ham5lUjVrbWVLRVFlU29rZkRVTTZUalVD?=
 =?utf-8?B?MHFCKzVKVU9EdkUvbU0wUkNBR2MzSTRFMkcvZ3QyYm5HeWhQeUF1NkFQQ1dk?=
 =?utf-8?B?OGpSWTl3WWhJdGd1V2p4Q3Q1MU9VZzNTYlpsdnFCL0E4U2ZreTFrR1p2b2dT?=
 =?utf-8?B?anVCOU1OdTBoeVNTNFZkRFFwMmdEL1NPdUV2bWR4ODJ1TkowUFpMUVQ4ZVdh?=
 =?utf-8?B?bE1VNHNzSGxBd3JKekJ0SkwyODFiWlY5cjUycjh0YWVkeHE4bTIwc3FJNkVn?=
 =?utf-8?B?eWJrZEk0Vy9IOHp6OEJiMlludUgrbHo3aTl6aHBBMWVqYjJHY2llQ1RoeUtv?=
 =?utf-8?B?Zi9FRWxDSFRDRWI4bEM0RzNmc2Y0RGRKSHh3ZEwvTzUvVE5xSWVDRjlzbi9Q?=
 =?utf-8?B?OUFIYmFSYXRLdUpGMXdzWkM5Qk5aNTlwbEpLYWI0NFlZSWEwcnZmUUdzNGo3?=
 =?utf-8?B?WVErZEwvU2szTmd6a3M3TGV4TlphMjJxMlo2MHJxRk1rMXZEWGNvSjYyTkEr?=
 =?utf-8?Q?4bVYvb4FpESqffBtuL4+?=
X-OriginatorOrg: sct-15-20-8534-9-msonline-outlook-d08a8.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bb28991b-4d5c-4f3f-5741-08de1878c3ca
X-MS-Exchange-CrossTenant-AuthSource: DM4PR05MB10270.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:26:49.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR05MB9286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_052654_435874_8112A54E 
X-CRM114-Status: GOOD (  21.40  )
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

T24gMTAvMzEvMjAyNSA0OjUwIFBNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAxMC8zMS8y
NSAwNjozNCwgTGlubmFlYSBMYXZpYSB3cm90ZToKPj4gT24gMTAvMzAvMjAyNSAxOjE1IEFNLCBC
am9ybiBIZWxnYWFzIHdyb3RlOgo+Pj4gT24gV2VkLCBPY3QgMjksIDIwMjUgYXQgMDY6NTA6NDZQ
TSArMDgwMCwgTGlubmFlYSBMYXZpYSB3cm90ZToKPj4+PiBPbiAxMC8yOS8yMDI1IDY6MTYgQU0s
IEJqb3JuIEhlbGdhYXMgd3JvdGU6Cj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kv
cXVpcmtzLmMgYi9kcml2ZXJzL3BjaS9xdWlya3MuYwo+Pj4+PiBpbmRleCAyMTRlZDA2MGNhMWIu
LjljZDEyOTI0YjVjYiAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+
Pj4gKysrIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+Pj4gQEAgLTI1MjQsNiArMjUyNCw3IEBA
IHN0YXRpYyB2b2lkIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEoc3RydWN0IHBjaV9kZXYgKmRl
dikKPj4+Pj4gwqDCoMKgICogZGlzYWJsZSBib3RoIEwwcyBhbmQgTDEgZm9yIG5vdyB0byBiZSBz
YWZlLgo+Pj4+PiDCoMKgwqAgKi8KPj4+Pj4gwqDCoCBERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQ
Q0lfVkVORE9SX0lEX0FTTUVESUEsIDB4MTA4MCwgcXVpcmtfZGlzYWJsZV9hc3BtX2wwc19sMSk7
Cj4+Pj4+ICtERUNMQVJFX1BDSV9GSVhVUF9GSU5BTChQQ0lfVkVORE9SX0lEX1NZTk9QU1lTLCAw
eGFiY2QsIHF1aXJrX2Rpc2FibGVfYXNwbV9sMHNfbDEpOwo+Pj4+PiDCoMKgIC8qCj4+Pj4+IMKg
wqDCoCAqIFNvbWUgUGVyaWNvbSBQQ0llLXRvLVBDSSBicmlkZ2VzIGluIHJldmVyc2UgbW9kZSBu
ZWVkIHRoZSBQQ0llIFJldHJhaW4KPj4+Pgo+Pj4+IEkgaGF2ZSBhcHBsaWVkIHRoZSBwYXRjaCBv
biA2LjE4LXJjMyBidXQgaXQncyBzdGlsbCB0cnlpbmcgdG8gZW5hYmxlIEFTUE0gZm9yIHNvbWUg
cmVhc29ucy4KPj4+Cj4+PiBTb3JyeSwgbXkgZmF1bHQsIEkgc2hvdWxkIGhhdmUgbWFkZSB0aGF0
IGZpeHVwIHJ1biBlYXJsaWVyLCBzbyB0aGUKPj4+IHBhdGNoIHNob3VsZCBiZSB0aGlzIGluc3Rl
YWQ6Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9w
Y2kvcXVpcmtzLmMKPj4+IGluZGV4IDIxNGVkMDYwY2ExYi4uNGZjMDQwMTVjYTBjIDEwMDY0NAo+
Pj4gLS0tIGEvZHJpdmVycy9wY2kvcXVpcmtzLmMKPj4+ICsrKyBiL2RyaXZlcnMvcGNpL3F1aXJr
cy5jCj4+PiBAQCAtMjUyNCw2ICsyNTI0LDcgQEAgc3RhdGljIHZvaWQgcXVpcmtfZGlzYWJsZV9h
c3BtX2wwc19sMShzdHJ1Y3QgcGNpX2RldiAqZGV2KQo+Pj4gwqDCoCAqIGRpc2FibGUgYm90aCBM
MHMgYW5kIEwxIGZvciBub3cgdG8gYmUgc2FmZS4KPj4+IMKgwqAgKi8KPj4+IMKgIERFQ0xBUkVf
UENJX0ZJWFVQX0ZJTkFMKFBDSV9WRU5ET1JfSURfQVNNRURJQSwgMHgxMDgwLCBxdWlya19kaXNh
YmxlX2FzcG1fbDBzX2wxKTsKPj4+ICtERUNMQVJFX1BDSV9GSVhVUF9IRUFERVIoUENJX1ZFTkRP
Ul9JRF9TWU5PUFNZUywgMHhhYmNkLCBxdWlya19kaXNhYmxlX2FzcG1fbDBzX2wxKTsKPj4KPj4g
TDEgc3RpbGwgZ290IGVuYWJsZWQKPiAKPiA8c25pcD4KPiAKPj4KPj4gVGhlIGNhcmQgd29ya3Mg
anVzdCBmaW5lLiBJJ20gdGhpbmtpbmcgdGhlIEFTUE0gaXNzdWUgaXMgcHJvYmFibHkgZnJvbSB0
aGUgZ2x1ZSBkcml2ZXIgcmVwb3J0aW5nIHRoZSBsaW5rIHRvIGJlIGRvd24gd2hlbiBpdCdzIHJl
YWxseSBqdXN0IGluIGxvdyBwb3dlciBzdGF0ZS4KPiAKPiBZb3UncmUgcHJvYmJhbHkgcmlnaHQs
IHRoZSBtZXNvbl9wY2llX2xpbmtfdXAoKSBub3Qgb25seSBjaGVja3MgdGhlIExUU1NNIGJ1dCBh
bHNvIHRoZSBzcGVlZCwgd2hpY2ggaXMgcHJvYmFibHkgd3JvbmcuCj4gCj4gQ2FuIHlvdSB0cnkg
cmVtb3ZpbmcgdGhlIHRlc3QgZm9yIHNwZWVkID8KPiAKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKHNtbGhfdXAgJiYgcmRsaF91cCAmJiBsdHNzbV91cCAmJiBzcGVlZF9v
a2F5KQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc21saF91cCAmJiBy
ZGxoX3VwICYmIGx0c3NtX3VwKQo+IAo+IFRoZSBvdGhlciBkcml2ZXJzIGp1c3QgY2hlY2tzIHRo
ZSBsaW5rLCBhbmQgc29tZSBvbmx5IHRoZSBzbWxoX3VwICYmIHJkbGhfdXAuIFNvIHlvdSBjYW4g
YWxzbyBwcm9iYWJseSBkcm9wIGx0c3NtX3VwIGFzd2VsbC4KPiAKCkkgY2FuIGNvbmZpcm0gdGhh
dCByZW1vdmluZyB0aGUgY2hlY2sgZm9yIGx0c3NtX3VwIGFuZCBzcGVlZF9va2F5IG1hZGUgQVNQ
TSB3b3JrLgoKV2Ugc3RpbGwgbmVlZCBhIHNvbHV0aW9uIHRvIHRoZSBvcmlnaW5hbCBpc3N1ZSB0
aGF0J3MgcHJldmVudGluZyB0aGUgY29udHJvbGxlciBmcm9tIGJlaW5nIGluaXRpYWxpemVkLgoK
TXkga2VybmVsIGhhcyB0aGUgZm9sbG93aW5nIHBhdGNoIGFwcGxpZWQsIGJ1dCBJIHRoaW5rIGl0
J3Mgbm90IHN1aXRhYmxlIGZvciB1cHN0cmVhbSBhcyB0aGlzIGNoYW5nZXMgZGV2aWNlIHRyZWUg
YmluZGluZ3MgZm9yIFBDSWUgY29udHJvbGxlciBvbiBtZXNvbi4KCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIGIvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaQppbmRleCBkY2M5MjdhOWRh
ODAuLmNhNDU1ZjYzNDgzNCAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWcxMi1jb21tb24uZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tZzEyLWNvbW1vbi5kdHNpCkBAIC0xMzgsNyArMTM4LDcgQEAgcGNpZTogcGNpZUBmYzAw
MDAwMCB7CiAgCQkJcmVnID0gPDB4MCAweGZjMDAwMDAwIDB4MCAweDQwMDAwMD4sCiAgCQkJICAg
ICAgPDB4MCAweGZmNjQ4MDAwIDB4MCAweDIwMDA+LAogIAkJCSAgICAgIDwweDAgMHhmYzQwMDAw
MCAweDAgMHgyMDAwMDA+OwotCQkJcmVnLW5hbWVzID0gImVsYmkiLCAiY2ZnIiwgImNvbmZpZyI7
CisJCQlyZWctbmFtZXMgPSAiZGJpIiwgImNmZyIsICJjb25maWciOwogIAkJCWludGVycnVwdHMg
PSA8R0lDX1NQSSAyMjEgSVJRX1RZUEVfTEVWRUxfSElHSD47CiAgCQkJI2ludGVycnVwdC1jZWxs
cyA9IDwxPjsKICAJCQlpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8MCAwIDAgMD47CmRpZmYgLS1naXQg
YS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaS1tZXNvbi5jCmluZGV4IDc4NzQ2OWQxYjM5Ni4uNDA0YzRkOWUxOTAw
IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYworKysg
Yi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYwpAQCAtMTA5LDEwICsxMDks
NiBAQCBzdGF0aWMgaW50IG1lc29uX3BjaWVfZ2V0X21lbXMoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldiwKICB7CiAgCXN0cnVjdCBkd19wY2llICpwY2kgPSAmbXAtPnBjaTsKICAKLQlwY2kt
PmRiaV9iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAi
ZWxiaSIpOwotCWlmIChJU19FUlIocGNpLT5kYmlfYmFzZSkpCi0JCXJldHVybiBQVFJfRVJSKHBj
aS0+ZGJpX2Jhc2UpOwotCiAgCW1wLT5jZmdfYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZV9ieW5hbWUocGRldiwgImNmZyIpOwogIAlpZiAoSVNfRVJSKG1wLT5jZmdfYmFzZSkp
CiAgCQlyZXR1cm4gUFRSX0VSUihtcC0+Y2ZnX2Jhc2UpOwoKPiBOZWlsCj4gCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
