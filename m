Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AD8C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyQIS/DQNT8Wdri6xZF40sv5ZRL18HWji3XL7unoKC4=; b=QcFfz/EscCWOz89XW/34y7ULRf
	L9GCX3NNnU77rvKRluc3vZhT0yM5YaJP/WbFSYDVzW04Bhl0AYseMXejgCl3bX5/u4mcrlRI5hTke
	wtTKQ5AiIzsIWHx+e7hNC89Fn4QgCfUkIGkpSFTRdSGuOaZaOv7mruEN2i2FR5KhJOQWSVy+KG/js
	mPNoy1Jhj0e/xTC3cQ95/ESY8j6n97CwjEf1s8h5GhljvZfCESJ677sjrQKTt6BCPFNgJAbZt2Jnr
	hUmE5miJ1dvoXLKxuQQFVxFrdFXVV37QCGiNmMWwCKoCduDj429zs/zh3LSAyUjGkxoY8ivfw8xVX
	WTuz7PKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQft-0000000FpFX-2z47;
	Tue, 30 Jun 2026 05:06:21 +0000
Received: from mail-japanwestazon11022098.outbound.protection.outlook.com ([40.107.75.98] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weQfp-0000000FpEN-3KY1
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 05:06:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=me09H6YOhuzgiYDF58cX47ZC66puEz8pf7pJwMc+2JXF5bCAJ1swZpVSC9q3vBjlHk72eBBkTjDCSolpK8TbUK0ifbxLe6ytvOFPE21uka83OX8J4lddCzx/PhmH8jZtBY5pX2CnQVSfAw/kiQiWErxas2ni7woqw96qs8LoWwyy44nAC+ggkan/aHwVvdLrb3xGg8WKDMQvoZOdO1Xcx3PS2U8XYpmidIlDc17QhOkU0nJwIuiSSGHMxpW1x84Cvr5YwgPLNCNPi1J6F9Xxs698esIzpiGI7Ix+ITjPF7XdrngSmc9SHnCFJSYgTi7SRwg/cP4lXkQqfTqcz+HxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQ7C16HrP2j1mthSLx1Eg1bsSs41WNDPL6XB8fKpEpY=;
 b=NdEwZS+TnciiL4UgdYsYtYViZ4WWQxPaReNGmTmM/jy363bHoHFi2y4dpEYmgIWLuGq6uQGZRFLY+9yDHN2IS0V6Yd/uMXy9RsYSKPnItOyqgMZtwykmZxf9IiJB4/OVaXCcnY1EsolnIE4so9sAdOLtY3SiDiVt7r66BsO1YX9iozhBUfknq0N0WXo+sWRedJLKFDOpSgJF2Br5Ov6PHMitxYv/2MfpvA29UEVhOvMpEH3SAYJhZ3vG+GytQMp5Pr085Dz2Dofs2ZbaaPeFy63EzIK93xDJRxUvDvB5ewsLjHGIIE2kxvB43/IKI4gQ7SxySYJHMvBonIc3CGOaYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQ7C16HrP2j1mthSLx1Eg1bsSs41WNDPL6XB8fKpEpY=;
 b=sHs+C+loHZggHMQ3UaSLf+Ax9K7GGeBc+eD1Ngk4yHCuYJgnEw8a63gpu9smmxtcw8SG3epiO1i01IwbfDZX9nojohl8cpdL20z/fJnaZrH8Zrzpqmhl5RU5Vfkn2oWohe6HCd8iIIqRKSRJhHGKs5wMXGpYkt73SdJXAFYqf/nB3TvaqNAH1xDQXkuYS1eGr+QV3Q5Hf088mC7qJGZgh+yd3YMddcakwDoO7UBbrFhanX0x4fZ9TpCBH7x8jdzyXqYZd9q2NZE4En56CFAva2pMT/WpdqTlLi6vr9CfDPeQOsOKeK7iLB4e6cS0C7O2LIW/nxNWxhAaj3afDu1hjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUXPR03MB9667.apcprd03.prod.outlook.com (2603:1096:d10:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 05:05:49 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 05:05:49 +0000
Message-ID: <dfa55ecd-f86a-4452-851d-8138b250912f@amlogic.com>
Date: Tue, 30 Jun 2026 13:05:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/3] dt-bindings: dma: Add Amlogic A9 SoC DMA
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev,
 Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Frank.Li@kernel.org, robh@kernel.org, neil.armstrong@linaro.org,
 conor+dt@kernel.org, vkoul@kernel.org, linux-amlogic@lists.infradead.org,
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20260626-amlogic-dma-v9-0-558d672c4a95@amlogic.com>
 <20260626-amlogic-dma-v9-1-558d672c4a95@amlogic.com>
 <20260626055033.061BD1F000E9@smtp.kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20260626055033.061BD1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SI3PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:295::12) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUXPR03MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: dee818d5-6a65-4e93-07ec-08ded6654012
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: BezhAcUsM0lK0g1eAl3AofRfcCwy2kvFHpCrdZYER80ZOxkAFHi6QKwHCp1fq4IThODX2aTGpb2MTKs8vJTMAjs9UXzKPWfW8uijOMwL1qSxfoLAQNBdz6YA/4R21p5MIsByY1KSJeLAma31YZGgy7lt14b3iMyUwxbNunrt4WlVOz9cFIWdpoLS+DYrMIF5bu91IOS5jykRatdLLF8bwu2xQz1BL75m6h3bPxzZke4gpRUrKYp0Y+PfTTb3ITqXd1k0znNk/5oVa2v94lDr3VmkAK1P3laUE+S8+8FbxfFkzcz25XkDDa3rbEkCt0KfUa5Xuz3LwAcNqJXMnaGAvRtMwtSIkxdkUphrXItxXFVNVDUNbF1s3r06SUmpUqTtlHBmpG2YPHKL7bAixQsOqEjSfG6jjqFwnKKC/tNPysC0sr2MLZ9t6F7nWgge4PSNycTAEAInTWh6Cx5/CvfWbs4QlE9pUskzexdbRWgZZsxlP+I1kdqiKAslcgjQz8NS0KW6iaokGBZ3Itv8BX9QtiGIsJTeQkobTWYT+FfhnJOGZUATrEhqejDUqi/wlmPwLmhN06NolGbMFXIEEOeacqrmhbeI+rEKjrgpjkCYJpE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2JiNTBxMXJOK1E5MWhrVFc5c3ZSbW9oT1VKRXhUTzI0M3JSRHl1ZUNkNmcx?=
 =?utf-8?B?d1VEZ2RkZVlNRWxhdXJzaWYvUHdYTk1MSUlaQ0dPLythWDFXY0NzcUpKNDRk?=
 =?utf-8?B?Qk8rQmJjZjI0eVhqNkxVSmI4ZlN2NWZBSlBlM2JNYi9zQ3FlTkNHeGtOSUFi?=
 =?utf-8?B?OGRkUnJjbmhQVVl5azJpcTNsWlh6b05rNHZVL3Z1VDVNbzRnaTlBc2tyVUZV?=
 =?utf-8?B?Z2pPS1BIVSszM0JJZmFmV0hpMHJvUmhKMEl5c0c4YUJ6Tms0Zm5ZV0FtYUFR?=
 =?utf-8?B?bVYrZ1VTWlJ5aWVTNjZHR0xWcU5nRkRZbnEvenFRM1g4S0o0VjNNU0JpblR0?=
 =?utf-8?B?dFRKR3FVVjJrL1NhdkxObnNhUlZQTHZrL0c4Tmh0aXpqR0FON1hoTHJucHgx?=
 =?utf-8?B?Qnc5Z3lYbXE0eGJWVnVGUW51RjRFdHlkdEhqdFdVMktMMFBrUTRzLzcycjYw?=
 =?utf-8?B?T3FvRWVGdEljVkhRWDJOWi9nKzRacmdZVW1pSzY1ZUdObW1DV1BHQjZmREx5?=
 =?utf-8?B?TnRrL3B2N2Y5czgraE4yRjA3bHM1WWRieWlObEhnOWN0eDE3ZEZNbmg1SHhV?=
 =?utf-8?B?K3cvZ2JSSVkzdUxVOE4yVEl2WnBHL0ExYzhjNFI2N0g1N212bzdNaUg4Y1Jq?=
 =?utf-8?B?WEl3R1ZudXNIQ0liL3lTdklnV3BQS1Q0L1BQeE95NHBySjhXN2ZJUlltaFF1?=
 =?utf-8?B?dFFldGRCa1FBdW0xT2N4aldManRqS3FCaUlsWFBhWTVLcjh2TTlqbkx0TWxG?=
 =?utf-8?B?RWVwZjNoYTJaS2trYUVOS0V3M3FNVjNxcnQxZGlycktrK2NWQmNvNHZiaXY4?=
 =?utf-8?B?VlV0RmZXTEFiTVpDbFI5TlBWbVNISERPQzE3Mm5HOVVJdS9mZkpxSTFrN3ZM?=
 =?utf-8?B?OG54TUNXdElubjI2WjdUOGFZcU12TjBUMzdqaitzeU5PcWVTWGxyUXh0cjcx?=
 =?utf-8?B?b1VJSVNNYU9DMVZsZ1VrMGZudDA4ZW51RUd2OGh0dWFTei8wOEJldStwREo4?=
 =?utf-8?B?dkJkZCtZVEtJY3UrMGM5RVdyU0hIbHJWRWhHV0xVYW8vdWhIQXZ6QlE2WFJZ?=
 =?utf-8?B?RjRUckxsTnUwQm5DSW9Rby9IZUhKZTRzek9YUnZLVXhxbWRxTlBaNmpvQkdP?=
 =?utf-8?B?WWlTRmRkWXA0Y294T1Y0dC9sdjFXR1hqTDJwbjZRQUd5YXVZc3hyelVxOG1Y?=
 =?utf-8?B?QnlGR05TV1JVUk5rUzZzT0hCVjVJY0pGMmlRYTJOSjM5dXpWbSsyeElyNFYx?=
 =?utf-8?B?NXYxK2VBbUxCWlZ5bGt3VGxLRm5PVTBzYkFVeW5xODB2bjBraldBcmhZMlI0?=
 =?utf-8?B?eU9ZTlpIV1V2VTUwUDZPK21pVVhQb1dhY1U3alI3RjFaTWxZQ21YSEZUMGVY?=
 =?utf-8?B?Q0FjV2dqSDl4OUw1MVcxUm1xUk51UkNIcWd2UHpRYi9NMWwvZ01iRHdXZDBj?=
 =?utf-8?B?amx1d1hWUmFBT2JNTHErbDJzZExKc0ZNTjRmUlNVR1ZOZ0l2d1N2V2lRRllS?=
 =?utf-8?B?ZVRKMU00OEdjSUtjaGxQelJodFMwbDRTN051QVgvQVlsVDFQUWhnZ2FsVk9P?=
 =?utf-8?B?bmtXamRqeG9lb1IrTEFSYlhSakUxb1FGcEtJeDJ6bnNEcEdKREkzRmszOW93?=
 =?utf-8?B?ZUgzQithVndlbkJ6RlFnRHMxT01TWnR4N29IT05NRzBjLzNZNE9pMTVDZGQ4?=
 =?utf-8?B?eE5ENVVNVjhkcDVnVWtPTVFHbzY5WmRUbjg3MEU0OTZCNnhYZER0b204bHg5?=
 =?utf-8?B?RlpHVmRJVjk2cXVzdkZZbEF2UXc5Y0xsUlpRM240L3ZKYkg3SjkvcDJRMEE1?=
 =?utf-8?B?MzZQNmVoQjlXNUdzWEtRb3Y4Uzl3OUJWbFZmMjdaNHNYSHU0bFZyQ2gwUlRR?=
 =?utf-8?B?REdKM21UOUZWTXdoQzdubG9tZHRIaERzRVJ3anBjU2RUbjh2WE1NdC9zNEJB?=
 =?utf-8?B?dUpocUsrQ0F2SlJhQmE0c0c1bjQ5ZEs5R0wrSUluem1OZ1FwTWlUS3I1RU40?=
 =?utf-8?B?NUFjZ3VVTldody9XY3NYaVJrUFdZZXRRS3JCcFVja2g4bFlmcHdaZHQzOW5u?=
 =?utf-8?B?NlJhTXRLVnNtTFlwaHVtcjRvUGZna25RbjhhblpiK28yNHJjS2Rnd1ZnSW42?=
 =?utf-8?B?WGJvaW1FaWNaWlNXbmVqdkE4aHd3YzA5Tm9SSEtQTUpmSUJjR3RWSng0YytO?=
 =?utf-8?B?UklCb2htOTVHT25TY25aa2lWeUFOWnhpY2RjSVdiaUlTb2hZWDUyZlZjblBv?=
 =?utf-8?B?bmFhS05tR01SQTBvUExUcGRQSDgwajRkR3RzTVNnNnhXNVBtYSsxMzl4TlZR?=
 =?utf-8?B?L2ZYUEc4aTlqd3FxNE9qRmN0a2dVOCtadWx1M1RsRzEyY3BBREhsdz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee818d5-6a65-4e93-07ec-08ded6654012
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 05:05:48.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fOTSvxBR3849hP+kpwOYf91s3JEUQZrGq6PK4oqLLBBLiu5NguWty0RjjghGMBfupQ/BWu4fGwT1tCBwKrDs7laGvnWkydWcv/YD54Ptvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_220617_848566_6BE20F26 
X-CRM114-Status: GOOD (  18.12  )
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

CgpPbiAyMDI2LzYvMjYgMTM6NTAsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6Cj4gVGhh
bmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQgMyBw
b3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Cj4gLSBbTG93XSBHbG9iYWwgZHQtYmluZGlu
ZyBoZWFkZXIgZGVmaW5lcyBnZW5lcmljICdETUFfVFgnIGFuZCAnRE1BX1JYJyBtYWNyb3MsIHJp
c2tpbmcgbmFtZXNwYWNlIGNvbGxpc2lvbnMuCj4gLSBbTG93XSBUaGUgYCNkbWEtY2VsbHNgIHBy
b3BlcnR5IGxhY2tzIGEgZGVzY3JpcHRpb24gZXhwbGFpbmluZyB0aGUgbGF5b3V0IGFuZCBwdXJw
b3NlIG9mIGl0cyAyIGNlbGxzLgo+IC0gW0xvd10gTWlzc2luZyBzcGFjZSBiZWZvcmUgdGhlIG9w
ZW5pbmcgYnJhY2UgaW4gdGhlIGRldmljZSB0cmVlIGV4YW1wbGUgbm9kZS4KPiAtLQo+IAo+IGNv
bW1pdCBhN2I0ZjVlNGU2MjA3ZTcxMzRmMGIzOTlhYmM4NTNkYjkyOTA4MzgxCj4gQXV0aG9yOiBY
aWFud2VpIFpoYW88eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+IAo+IGR0LWJpbmRpbmdzOiBk
bWE6IEFkZCBBbWxvZ2ljIEE5IFNvQyBETUEKPiAKPiBUaGlzIGNvbW1pdCBhZGRzIGRldmljZSB0
cmVlIGJpbmRpbmcgZG9jdW1lbnRhdGlvbiBmb3IgdGhlIEFtbG9naWMgQTkgU29DCj4gZ2VuZXJh
bC1wdXJwb3NlIERNQSBjb250cm9sbGVyLiBJdCBhbHNvIGludHJvZHVjZXMgYSBuZXcgaGVhZGVy
IGZpbGUgY29udGFpbmluZwo+IHNwZWNpZmljIHByb3BlcnR5IHZhbHVlcyBmb3IgdGhpcyBjb250
cm9sbGVyLgo+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2RtYS9hbWxvZ2ljLGE5LWRtYS55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+
IGluZGV4IDAwMDAwMDAwMDAwMDAuLmVmZDdiMjYwMmMzMzYKPj4gLS0tIC9kZXYvbnVsbAo+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1h
LnlhbWwKPiBbIC4uLiBdCj4gCj4+IEBAIC0wLDAgKzEsNjUgQEAKPj4gK3Byb3BlcnRpZXM6Cj4+
ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IGFtbG9naWMsYTktZG1hCj4gWyAuLi4gXQo+
IAo+PiArICBjbG9jay1uYW1lczoKPj4gKyAgICBjb25zdDogc3lzCj4+ICsKPj4gKyAgJyNkbWEt
Y2VsbHMnOgo+PiArICAgIGNvbnN0OiAyCj4gW1NldmVyaXR5OiBMb3ddCj4gSXMgYSBkZXNjcmlw
dGlvbiBuZWVkZWQgZm9yIHRoaXMgYCNkbWEtY2VsbHNgIHByb3BlcnR5IHRvIGV4cGxhaW4gdGhl
IGxheW91dAo+IGFuZCBwdXJwb3NlIG9mIGl0cyAyIGNlbGxzPyBXaXRob3V0IGl0LCBkZXZpY2Ug
dHJlZSB3cml0ZXJzIHdvbid0IGhhdmUKPiBkb2N1bWVudGF0aW9uIGNsYXJpZnlpbmcgd2hpY2gg
Y2VsbCByZXByZXNlbnRzIHRoZSBjaGFubmVsIElEIGFuZCB3aGljaAo+IHJlcHJlc2VudHMgdGhl
IGRpcmVjdGlvbi4KPiAKV2lsbCBhZGQgaXQuCj4+ICsKPj4gKyAgZG1hLWNoYW5uZWxzOgo+PiAr
ICAgIG1heGltdW06IDY0Cj4gWyAuLi4gXQo+IAo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiAr
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+
Cj4+ICsgICAgZG1hLWNvbnRyb2xsZXJAZmU0MDAwMDB7Cj4gW1NldmVyaXR5OiBMb3ddCj4gVGhp
cyBpc24ndCBhIGJ1ZywgYnV0IHNob3VsZCB0aGVyZSBiZSBhIHNwYWNlIGJlZm9yZSB0aGUgb3Bl
bmluZyBicmFjZSBoZXJlPwo+IE5vcm1hbGx5IGl0IGlzIGZvcm1hdHRlZCBhcyBgZG1hLWNvbnRy
b2xsZXJAZmU0MDAwMDAge2AuCj4gCldpbGwgYWRkIHNwYWNlLgo+PiArICAgICAgICBjb21wYXRp
YmxlID0gImFtbG9naWMsYTktZG1hIjsKPj4gKyAgICAgICAgcmVnID0gPDB4ZmU0MDAwMDAgMHg0
MDAwPjsKPj4gKyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDM1IElSUV9UWVBFX0VER0Vf
UklTSU5HPjsKPj4gKyAgICAgICAgY2xvY2tzID0gPCZjbGtjIDQ1PjsKPj4gKyAgICAgICAgI2Rt
YS1jZWxscyA9IDwyPjsKPj4gKyAgICAgICAgZG1hLWNoYW5uZWxzID0gPDI4PjsKPj4gKyAgICB9
Owo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9kbWEvYW1sb2dpYyxhOS1kbWEu
aCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1hLmgKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uYzU5YzJmZDRiOTU2MQo+PiAtLS0g
L2Rldi9udWxsCj4+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvZG1hL2FtbG9naWMsYTktZG1h
LmgKPj4gQEAgLTAsMCArMSw4IEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAgT1IgTUlUKSAqLwo+PiArCj4+ICsjaWZuZGVmIF9fRFRfQklORElOR1NfRE1BX0FNTE9H
SUNfRE1BX0hfXwo+PiArI2RlZmluZSBfX0RUX0JJTkRJTkdTX0RNQV9BTUxPR0lDX0RNQV9IX18K
Pj4gKwo+PiArI2RlZmluZSBETUFfVFggICAgICAgICAgICAgICAgICAgICAgIDAKPj4gKyNkZWZp
bmUgRE1BX1JYICAgICAgICAgICAgICAgICAgICAgICAxCj4gW1NldmVyaXR5OiBMb3ddCj4gQ291
bGQgdGhlc2UgbWFjcm8gbmFtZXMgbGVhZCB0byBuYW1lc3BhY2UgY29sbGlzaW9ucyBzaW5jZSB0
aGV5IGxhY2sgYSB2ZW5kb3IKPiBvciBTb0MgcHJlZml4PyBUaGVzZSBuYW1lcyBhcmUgYWxyZWFk
eSB3aWRlbHkgdXNlZCBhY3Jvc3MgdGhlIGtlcm5lbCwgYW5kCj4gZGVmaW5pbmcgdGhlbSBnZW5l
cmljYWxseSBpbiBhIGdsb2JhbCBkdC1iaW5kaW5ncyBoZWFkZXIgbWlnaHQgY2F1c2UKPiBwcmVw
cm9jZXNzb3IgY29sbGlzaW9ucyBhbmQgYnVpbGQgZmFpbHVyZXMgZm9yIGFueSBkcml2ZXIgb3Ig
RFRTIGZpbGUgdGhhdAo+IGluY2x1ZGVzIHRoaXMgaGVhZGVyLgo+IApOTywgdGhlIG1haW50YWlu
ZXIgcHJlZmVycyBubyBwcmVmaXguCgo+PiArI2VuZGlmIC8qIF9fRFRfQklORElOR1NfRE1BX0FN
TE9HSUNfRE1BX0hfXyAqLwo+IC0tCj4gU2FzaGlrbyBBSSByZXZpZXcgwrdodHRwczovL3Nhc2hp
a28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA2MjYtYW1sb2dpYy1kbWEtdjktMC01NThkNjcyYzRhOTVA
YW1sb2dpYy5jb20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
