Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566B5606A31B
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n5IZUmiB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=IpSele/O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vFnSuBASzAiRx0uzYNf4RMvvsDTz1zNuyUc4+BWD8vw=; b=n5IZUmiBt6tynhczRgla4fTYpi
	yABQ0AFVtduF3idyiem1fUagoX2aLo/znit/lZKIMMBrtAefb5b1a/TsT9ZP7wwM/bRYpStVR382a
	b29/2+dOiuqnV9Zx5cZWq6ef4UwHtSfSU+rn4c7W7g7sFHFP1YNbGb1P2pqUpcAOhB0/7+sWhfn5i
	H7GSagdhoDz/ALUOfdY/CjJJscIZipG0RWsLz9Sa+TplIdnLz11+n/4r5oiUbKj0tMkGyC33e9gik
	sbixbgqqbOJvlhJ8tz7lkblz1X94JIgwHhMVCrnwX8rg6mg05q/G3iClux1X4k5ejzhVSv1hudX80
	rpi0veSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXm3-00000003gu8-0Ucg;
	Tue, 27 Oct 2026 03:22:55 +0000
Received: from mail-koreacentralazon11023105.outbound.protection.outlook.com ([40.107.44.105] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLXlz-00000003gtZ-48fz
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 03:22:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P6XvkjqX3oR6O1KpStKd9Ga2Ixk4Wg0cGHNyPUjpkzAmYTLPmcfC/WR7gvvSydYoFq3SHYIqFZDPykcclbXNkAbNUB10dgMufshmBl1qQhv0vQtCB1Vww91yGV+6L5KHUtiVwPaVsa0lLMGpqjmkqjC2c0EqK61ETPMyjOSPHD1XlyS9aWcAHFcECu+7HaPGZQ/FW6CbiNY5N6uuo/g3YgDdJP51Gkp5Cq4OGtjrP6LftLqlFVFxN47J6GkEAodLp/JHFVs/J5s5/KCGHkLwSIkBHePDOx9nUZmxdNYtK2J+UoR45akXk6+MCSl41s3b7rmmvz152CLIRRTlJjDV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIGKO/w0+8SnQsbqd5ZDjAs6opde3OsE70XYcXtG4K8=;
 b=x8GzXHDaHN3cIDMan7WWEnFI1RPzMZGpKkucAsZiDTS6hkThwqp7MIR0Zc85bmVVjTlt4YBKcjAD/RLkDT2ca0earpMuBng/Rl9wM+9Q4wo1tUttv4jc2xpxbDXDtM6ZzQiW5eVpbjzwbyEoSodhl4jFshV5yXacgduJhkIa/IccEgOwb2JGRdcoP53CPXg0mJ633E4581XgZEDrnQuZVZlOyWI4eNtOFxAUjYmaOIv4MR3t6iRRqXV2WQ/E0eZkrFlfUgqu4O/i7AV21yYkdSxa7S1ul10FdkiNSz9OvCjj2kiUHuNHZGbna97sDw3M9URjkZQFUOSl5TOO4Y6zRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIGKO/w0+8SnQsbqd5ZDjAs6opde3OsE70XYcXtG4K8=;
 b=IpSele/OgGMODLgIN0Wzu9iQ6KA4/ZebA6ZNr9QF4H8S9lfsAkoxKRh6xV6TYiRvCqkZKckvCMOHYiSiuu36IeLdaJpO6CTu7Wr8JR4BLwVrqYscjp2yKk/zvl04Ffr+dxcPACcztI0SpNK17fA5wErnq0zPmvQ/Sp6OOA1EUOQgmSiQV9fUXarVqdldyPdJm+upfvkKpErzAlGCK3BKQMxfMjFWCFu5l7RCIAqw6YhvfiXauhee/RHIOv9Gqba4Ka/hAwgNCkxty5WaG/bUVBuWmd3LDQu7af660fXXylhXoa6NjkhXLZ966+uKbSDLpC09Lc1FBUpQNw70VIXuFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUYPR03MB9928.apcprd03.prod.outlook.com (2603:1096:d10:8e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 03:22:32 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 03:22:32 +0000
Message-ID: <c836dd3c-1ec5-4442-b892-53f849a2d31f@amlogic.com>
Date: Tue, 27 Oct 2026 11:22:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: amlogic: Fix missing destroy_workqueue() at
 error path in aml_dma_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org
References: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <13a835b1770e360af7991bb4c91ce52a8d01e331.1792785154.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: SE2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::11) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUYPR03MB9928:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fc28b0-e0fe-4b66-0790-08df33d989cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261022105027099003|261021123027099003|261021121427099003|260925021311599003|260925022911599003|10067099003|260925021911599003|56012099006|261026121527099003|6133799003|22082099003|18002099003|11063799006|261026140227099003;
X-Microsoft-Antispam-Message-Info: G2ddHIo5+wzQY3PonpTVXulmgmM202rKs5ggseS5oiZFUKh5OJTPmLEbpnNyHbOHvP7RGxbDE5+a2gMbvvc5CrgFVl/TOTcSacOeT3Ysr5SrdZEFUdyU3NgQxszcKBfZwgbRePDobT57pxTXs/1XtT0woT8QDJdBsfw9ZYSehHUMtg21ia4rzLnde6W8959dLD9aqZZxZayHvtb2KdGj2b1WQGuTfxwt7DdBNmboS4y3wXRn6c29ptuF4yhshOMunirMaa/s3H5dJU5N83d2f3ZY9tFwPK9ojAnbNb+xbQG75/AgeVQhHHF1LisyM0TdrgZ64fNUjfq5lInCaDJVf61HuShG44YbwPY0zufgc6D0nma1xfG58YD7SLBIPI2ZHbHCzducF4nTlxXPSO4bLylSEk1RuXqKYzPsrzNFSUnernu7AGpHhT529/i0xdMv8v5WiHb9ZdGmYoNUr0hRj4NhDtSe6/+eNPKz5PGAzdD+nLzgUZEuZL2hBzctE7zAbKH2loM/8bWBLJK1pTE5Ttm9qikNjt5F2hI9bliKSGhVobUPUH+ocESOvzkHpc75hMt20zhj1vJX63Vf/UqH/AnHwhYG+IW/BEwFfiUgHnlKL/m6rkouRNpFoqGC5Z0N
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(260925021311599003)(260925022911599003)(10067099003)(260925021911599003)(56012099006)(261026121527099003)(6133799003)(22082099003)(18002099003)(11063799006)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWczdmJaT0JZRE9BVHJSWitBUlIvQnZsRkhpQUFYRzB4V3RUTGdXMk5pUzBC?=
 =?utf-8?B?dk03ckJBRndhY0dHSGdPZ0FhQ3J6a3FzTnU0ODgzcElnTDZQWnVQcFNrU2hV?=
 =?utf-8?B?WWFrVThPR3A4MVdKK2x4R0ErWGtnOXl3VTk2KzhNZTNHNkRXbitIek1jdnYr?=
 =?utf-8?B?OXdjQkVyQWtqVEhTc2dIZEw3K3ZBRWo5TzZtSFRMd2p4Mmh2SjNHb045ajVw?=
 =?utf-8?B?OWNNVlYyMzB6cUZpMjR2WmJ5OU5MK3htczVIdjRiZmd1cWJOMFlsYjBkQXJl?=
 =?utf-8?B?WFhTRmU2ZDMyVHNlL3gzNHl3MzlXQlVYdjR3eHA4bU5aOWlZbjdBa2Y3Mi85?=
 =?utf-8?B?eXJUVFBqVUo4K09YaklJV2l3SDlyaTdRS0JOZVhaM21YMVBaZnR0bURYWG9R?=
 =?utf-8?B?UXFlU2pZOHFUajZyaXpQVjl1K3k4Zkkrc0dRek1ZMDJDQS95NDJRb29UK0li?=
 =?utf-8?B?aHFaMHF4YmxRc2pDQ0FJZGxZdDRseWVpR1ZTNHhSOTAyVTlkNEozdmJmdmtr?=
 =?utf-8?B?eldYajEvK3RyczVpdk9EbWt5NUxhSTQ4TXFneHRZNGY4YW9RNDhScGc2N3VW?=
 =?utf-8?B?VlcwUmc2T2tTY2wvblBkZHUvWnBmM0xObjhkbklKb0h5YU1vVCtIZzBSL1Ew?=
 =?utf-8?B?UStKMkJrN3d5RE9yY0g2eHI4N1VDWExkb2VmRVNZMGFQODhlRWtpaDdXYldT?=
 =?utf-8?B?Y1JvUXlFd0ZzK3BvcDdPMnM5cUlUMGZyY3pvcjVwM29CMVRzeHdDNEhIdkZR?=
 =?utf-8?B?ZjltTzlzSTNhNlVTbUV3QUgwU1JoTmVTQWZUWmdPZEk3cXRaVnl4M25EK3lv?=
 =?utf-8?B?T2JNSlRHOGlGMHZ5enV5YXA3dTRCQStaekJyVUloWUV2OFdCUzVENXFXOUQy?=
 =?utf-8?B?UEhlcVRnNHpGMmVJNzBFMURVMk9QRmJTamhZQUtvRlhoWmY1bldnaHJUQnA3?=
 =?utf-8?B?MjJiNkpqb1Z6anNvdmRQS1I2SldDaUlaQjdybENhOWNGMWFVWmVzZ1FUTFdB?=
 =?utf-8?B?U2RwQmtQMVFHZXhSeUc4TUp5QkZMTHVIQmlhVTlEZmdMcmZSLzRveXdSQWcr?=
 =?utf-8?B?OEtEZEZOd2ZFSU16U0k1N2pWTTdiS0hldGd6UCs1bmRLTDZXU21xNy9ST1lh?=
 =?utf-8?B?NjhBNmZyamVPZStKUkU3dkprVldSOE04MXNrSHJvYUM1MEk4elpTNDY1a2U2?=
 =?utf-8?B?eUhYVVJlakxlNmJ3TU5xWUN1TVVIQWo0TU41N2JLM2VFcExpbFRTaUFBN2Jx?=
 =?utf-8?B?aGhjTHdON1lJaU0vT2ZZTC9TWlhtOVhlT0lIRzRxZ0xkQjlscHlxeFBsS0s0?=
 =?utf-8?B?YkdabzhzdS9adm1hTkdGMEd4Z1RuOWFGRk5MWllOYk4rdVU2VjVvWlR5YkJL?=
 =?utf-8?B?REJhVDJ4QmJoeXFiL0xaY1I1NE9pRzlBbkVqWlVwL0FGYmN5SUM2eEpWNlB2?=
 =?utf-8?B?UXFMSkpFdzdka25EV1dXMjlXM3NzeUVNQnZnR0pCb2lCQnFMTlBTc2krZVk2?=
 =?utf-8?B?SjJDK3UxYStCbWVXWDNna2tjakNuNmhwV1FFZFJuN2NjWjNVVHIwZnNHNC81?=
 =?utf-8?B?NThibG1ENG1EbkNOTmczRnd3RnhESkI1QndOYWJYOGd5OXJHSXh2UzhLR3Z4?=
 =?utf-8?B?VU42QlVjeGoxL3ZJMDAzNjVBSGw3RTBPZkRrSTUwZVBiUVRlMGZRMFMzcFhY?=
 =?utf-8?B?cjFVSExZKzFDb2toZ0JFaHBNZndCQmlrSmZMNVVkWkZrMWgxVlhYWXdWMjBs?=
 =?utf-8?B?QXgrZkdLcEY0Q2dpbFlOUnhzazYxK1F0Z2JEL2hxaGRSWlJSZEx6RWJvL21G?=
 =?utf-8?B?ZXlkMTIzUVJMU0pPdG5JYVZUOE93NHYvN3M3WjMyZGx3bWdHVjRnOXF4VmlR?=
 =?utf-8?B?dWdNMlkrMEZlb2ZPY1ZJOXJyZThDWm1HSDBHSGc5eFdYUXplc1QxNzRqMDYw?=
 =?utf-8?B?OThjcTdCWlBCWFE4bk9GVXIzb0RxeS9Ld2p6Q1hXZGdXRmZOZ1VBZDBDMkho?=
 =?utf-8?B?WmhWUzRJclhlTlVaSEJtRVQxV2twWk83b2REczFMQk5XT3FpWU01ZFFKLzFm?=
 =?utf-8?B?SDZ3Q1cyMEYyNWlUZEJaLzdTWkJjeFprbXVlZzVJM1dUZFNoZHZSaTNFVHdy?=
 =?utf-8?B?QlY3VmptVTRSNWhWeGdmc3NOcjlzUStQd3BXUzFlM2tTcGJqakVPN0VVL3pR?=
 =?utf-8?B?SzRxdGJOdEVMQk92a2tFOXc5S2J5U09IYk9FRTdtQ0xRNkpXTk1IeHFuZTJn?=
 =?utf-8?B?aCs5cEJjYklDWEEvRVpiR1cwZ2NidW83cHN2YWlWQ1lFYisrWUZ2SktNMmxZ?=
 =?utf-8?B?SW9RdFhaT0pqT1gwT2xGekpJenFkVU13Z21oVXVnVVQ0bU4vM1d2Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fc28b0-e0fe-4b66-0790-08df33d989cc
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 03:22:32.3730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPljzRXjMnrv4i8vVmtKPV4lA3OlbMBQiE+ZcjMghbNtRvVy/NF0N9LulHXOMulFB+fBstJYH1/1vlBXod6tLtuuPDC6ajX7wD4CHoDG0GE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR03MB9928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_202252_040105_3E6C4958 
X-CRM114-Status: GOOD (  16.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

On 2026/10/24 17:05, Christophe JAILLET wrote:
> If an error occurs after the alloc_ordered_workqueue() call, the
> corresponding memory is never released.
> 
> Use the managed version instead, as already done by most functions in the
> probe and simplify the remove function accordingly.
> 
> This avoids the leak.
> 
> Fixes: b84b5197e344 ("dmaengine: amlogic: Add general DMA driver for A9")
> Signed-off-by: Christophe JAILLET<christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only.
> 
> Changes in v2:
>    - update the subject   [Franck Li]
> 
> v1:https://lore.kernel.org/lkml/93183551770e260aff993bb4cf1ce5ba8dc1e732.1792785154.git.christophe.jaillet@wanadoo.fr/
> ---
>   drivers/dma/amlogic-dma.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
> index 684121d13fca..791bd82743d3 100644
> --- a/drivers/dma/amlogic-dma.c
> +++ b/drivers/dma/amlogic-dma.c
> @@ -620,7 +620,7 @@ static int aml_dma_probe(struct platform_device *pdev)
>          if (!aml_dma)
>                  return -ENOMEM;
> 
> -       aml_dma->free_wq = alloc_ordered_workqueue("aml_dma_free", 0);
> +       aml_dma->free_wq = devm_alloc_ordered_workqueue(&pdev->dev, "aml_dma_free", 0);
>          if (!aml_dma->free_wq)
>                  return -ENOMEM;
> 
> @@ -712,7 +712,6 @@ static void aml_dma_remove(struct platform_device *pdev)
>                  if (aml_chan)
>                          tasklet_kill(&aml_chan->vchan.task);
>          }
> -       destroy_workqueue(aml_dma->free_wq);
>   }
> 
>   static const struct of_device_id aml_dma_ids[] = {

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
