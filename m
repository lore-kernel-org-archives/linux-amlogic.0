Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17788606C607
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Nov 2026 07:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W/TWS1TI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=W9hwvmBZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OkY0smdOyDYC2BPhte859U5TJUGDhZNjCyVd4bTM3xE=; b=W/TWS1TImGdepVoGV6xjhCjaJk
	rKppuZvpJbriH47vDvDEqTz7GVUQv/JjS/nE+NtOh6SknLzpS51I/NWGKUNKxTaGpxjzt6tC11ahr
	eq1Rsj25HWZoiczBVtUFpG241GHUNQlK+B27EtTe7AadhLHniX4EWJfxpita1x4zjfxkgH4A0YlFo
	kSkgbnAxLY5QRIbWSZmCp/AsxjC1goU3kSCHztviTwBoXWg6XZGoQd0S+ad9/uapk1eeiGhHoug0G
	AdMiIyMl7FVSVLnlzasSEUNQhbZU6UTvDhiAoe4yxIjb/afWwR8As36Oi15N5xK8OfRdpd4V1ZZNt
	8T8T9T2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgcN-000000031MH-1GOg;
	Tue, 10 Nov 2026 07:50:11 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgcK-000000031LW-1hqD
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Nov 2026 07:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLRh8BASSiVgB7I2p4WzPbChs/geLyzfh7Ou9K4znaG2Ns3vci7UZAeC0J/dpfke2Ty1OO/u6iKydzMbZ6N3qssm8pdMtNsvR3fwF3iQL5T8ERSk6J3feQvztaWQZJGPrLcrHTNOllGaP63ZumK5L+MjfW+FC/rvb3pnYzq8cNZm8DDntdhTr+YIRMvqFUfnlnsrZg5QZZ1+t2+v5pjnXux9f6wlCoiDWSEMlaqp6S5HaD4NiDgeWDeqS2wTa2W8gFF+5d4wEbMkEsE4DT+HGfaXGfM2+AIFL7Ee0Z/P1xQVARbZIdgDtTTjwa7IsiYhIxIIRAwDJ8gsW37ULt35Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMHpmUuWKY73B5veocOHy9lnhzSZRfbXUuD8JsLBBaE=;
 b=WjCoxpBY9o8iq00vI6qHC1QjiHNcfkfBoTr7lfYH6Ddg2dugiHLoGrj7cODu13uRDWhmcERup34/61keyudoWRLCmzmSyyjB2afGqH1YX+jbAg5Tlxe3XGffX1n1OXjTJ7OVQlC3H1R8sk2RE5xAKEIS4fnhlkHatpHRmlmhrJEUUUt/+9wp1cIsIKO97n7+xvbRkUpDHh0A0am9YL1nHhTbdF3G8yxmgRpopVz2oCycn/bNjkJkEl78vpzqilSsiZnrJ4/dN/9Onufd2HATt/STBKY7WF6K7IcxzVYGyEL+ftZKk1Vi7AP/BmS5GwPDAChUv7HgLCnkmtelbt7J5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMHpmUuWKY73B5veocOHy9lnhzSZRfbXUuD8JsLBBaE=;
 b=W9hwvmBZmZafvEDFGcZoc9AL2J0krSxQx7lKS713tNLkKxwE+cwczUX5ptV4wi7trNqakis1Od446OuMTJyNh7kN130ifnm80OZatVjb1DT//PckvQackLJZu3X7ZO2n2UXLKUtHq5Y0GDAd+2niP0dfXSjhvfCLY6tWxd6A5IUgnX6uyI0yvioGS07aYmylwFD8JPSDwiAf61/LBvS6788S7yZmhZziy87SSqJVLpBX0oqQpK01L/ly8te2eWRwqebPf9bE8mufIELsif1yoGfzg+CnNrCDbPPw5ClTjyrfKoYQ3ZoxGRrZMGbiSy8f2QsscDuVZ8ncxL2jQ+GbYA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by KUZPR03MB9453.apcprd03.prod.outlook.com (2603:1096:d10:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Tue, 10 Nov
 2026 07:49:58 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 07:49:57 +0000
Message-ID: <84565a50-0c52-45ff-b43a-3d30902690df@amlogic.com>
Date: Tue, 10 Nov 2026 15:49:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>,
 Junyi Zhao <junyi.zhao@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20261104-a9-i2c-v7-2-b31f2b53faf4@amlogic.com>
 <01d3c9aa-ad7c-491f-b99b-aee731c1ad1e@web.de>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <01d3c9aa-ad7c-491f-b99b-aee731c1ad1e@web.de>
X-ClientProxiedBy: TPYP295CA0005.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::15) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|KUZPR03MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 341d3cb0-6360-4a03-03f9-08df3eff376d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003|11063799006|261102123227099003|261026121527099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: VFnWr/iy9bcng3s1FPh53Bv0BPGMuUyYxhxkR2QzC3btfVMBX4+AhJE4sEKwV6V2ZmxxIlEsQWFOrphARU5V9mvV6HofA5mKgF8Lfkwi40ODTVEKMYiNHQ8dG4NrybANBEgYIE1X0x7T1HUKhVPAUNoVpZpzePm1uyLSGE1cLPsXCk0olzBJepMcgojJvfMPn3GQeSK+PRENTaHar7GPhpgzREVVAXyfvZ2owjgwYQvtddeN3KAeLLgunPoteYHUu6q08Ifo6xyvatSxt7vnFc8bA4t6c+b0XV8dsfj4JAH9gOd/GFXyHW7kxr62Nj0w92D5ARDfs2Z9vBB2Ci3/oxa2WTR973abBoW+F6hMm4oPfdlSsEJlGxcNwsfsj9Vx+yI30cnWMn7uYYyTIq9ZJNOAKmXIhAKcEZAWvZ9WoKF9K8NXN9BeXrd8TSXC4DJFYq3V2+SqJmPh+JApaMj9bArXSRCeXYwtS713s8zJQho2I/rcEj8dpte5nvMve/gL2Bwrjl77fGtvcBowyACUunYWtMdOeqwuWh/4l3HpClechFM4J3Nu/CA7EQdojCKfgHxjS/QBvkFhb6/adPIq02Po1gkqcbn735/BNnnkDG+LDSdZp84u9MvE3hO1MnXI5DcUGyFDDv0SagC0kMyUz1Z1ueS3aynT11MwKSC3RJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU5KY3BWeDhuamdNSlYraUlTMlBXaG9XK084d2d1bHZSeitvKzFEZ3hvTE0z?=
 =?utf-8?B?eHNwRWdwdUZqUklqY1BJckw0YytOSzY5VHh1QU1hY0U1VjRJZGgyREl3S1o5?=
 =?utf-8?B?WU52cmpQTjVUU2ZEaFp6ZzRTQUIrZVhXRzcwRk5VcjFVaDJjRzFaK0tscDh4?=
 =?utf-8?B?alkyeW1sT0VlVUtadTJlcjJYbGtHd1JROGpMOE5KM3ZYclVRQ0hQNDNrRW5x?=
 =?utf-8?B?UUNIWVhzVE5DVUR0VWJDSjZkMEY0TnZQcWxMcW02VjQ5NWplUk1BWnN6NHpw?=
 =?utf-8?B?MmppQ2dOa2U3RCtJb1Bsd1A3c1VNaCsxRVJIdFUvKzlVUCtYSU01TnN2Q2N5?=
 =?utf-8?B?SExMWGI0Nm42VHhwUFh4NG9oWFlZTTJFSGlCTk5zK1hvZFYvOHI1bGRTTE1D?=
 =?utf-8?B?cXNlMXBjbUZDSTdrTXlqekJpdnJzQUJrUUFIS3o5NEZIaUNhOVRaOXlrTW9s?=
 =?utf-8?B?M3lnQWVCQXEvcTNoTjIrZlFEUkhKQnFDM2kra2Q2UzhzN3dpd1JmQTJvYUxs?=
 =?utf-8?B?RnRaSEZxWllkM3NZT2tDWVBENzZRNzFZS3lMcW55NGlKclN0TWZmK1FleUJ5?=
 =?utf-8?B?SFV2QVNJaDhkbk9BbEg2UkpTamdud0YyOVUzQUVRVWtEZkdvWjRwRWhlbW51?=
 =?utf-8?B?NDZIUkl0RkJURGVpYThYRzNoZ2VDUnVPQUZ5OGR6USt6d25FSnJ2UHJ4a0JX?=
 =?utf-8?B?cFF4L2hwUzcrY285U1JwbG9XbExuaHFjNWJwWm5JdUxiSkNkYTViZFhFdThG?=
 =?utf-8?B?cHNuMmVzWEZ1NVlMREZtZEJvMWJPR2xadGczT0RLM0ZvcklMTEdlWm51Si9E?=
 =?utf-8?B?VGlHN09BdjZEK1ZzWDIzWG5WdWttWWI0eEFqSWVqajNOd1RjZHRWRU5ocXha?=
 =?utf-8?B?OTBQOWlNQUd4azc2M0lFSjFyVnMvVUdSaDNOR1phNlI3U3Q3Rzc0bCsyc05o?=
 =?utf-8?B?bDQrRk8yditZZ2Q2T08ybzdRYVVzYUc3d3JhTmZWTEluQitmaE9oUGR1ZFZZ?=
 =?utf-8?B?T01LOUZEclJ1Q0U3Rkl5c3RzZ0xZMU5WWnFVSTJKV3FiQURPVVhvT3Q2dHRl?=
 =?utf-8?B?RDYybFJCYUhHRERFcEdrNldWTHMvMzhIR2JBTVAwdEJVS25lTncyYVJwV2w1?=
 =?utf-8?B?czFqOUVtRTh2Z1krRnh1Tm4yVVRpZkxUY2ZxR2NlU1hqM1J0Y2loelhsNHQy?=
 =?utf-8?B?c0ZuU1J6NUd0MXFGdFdUMFQrWUVSUml6TU1KV3h0Vko5a1RKNFQ5enNNL1Zy?=
 =?utf-8?B?ZEwvZS9YSUlUZStmd3RJT0Jsc1pFOTh0VjJPeTJQNFZ5bDRndE1uYzdoYWlp?=
 =?utf-8?B?eXFpYUdPQUNmSHdlUUgxcEF4WFNvN0ZnSVQvRE84K3drSGEySDlpQU1VSndk?=
 =?utf-8?B?Wk51U2laQ21jaThyME1TUUVmYUZsWHZSMVh4a0Zkamt2cDF3bm1MbW9NYXJr?=
 =?utf-8?B?RzdDMjJONlNSbm0wWHJCZFhQcGJpcmZObjRTbmpPOXh4bU9CYmVhMHg4eHRw?=
 =?utf-8?B?V3JQeG9nZENYVnM2VmVEOFllcEpYTXNWS3VWNFNtWUJKaDVrNy92bG9NU0dP?=
 =?utf-8?B?QVZKR2RmTFdvU1lXTURsdFJURDZTWVVWZ0Z6NFNrODlwTlhRMDhQUUxnWTh3?=
 =?utf-8?B?WDRsOHIxR3EwUUV5Vjd3dEZBM1FUMGtBT21pNjlvVWlyc0lKWFFqTzJRZVhP?=
 =?utf-8?B?ZENhNjZLZ2lGaXhzZGloZzdZU2tseXdNaERQSm9RMTV0bEg0YWIycDYxdHpa?=
 =?utf-8?B?V0QyQUZLcDhaYnFvVnhsZzNqaTBpODZ6YzNHQTUvK3ZMSDRjdnA4NS9UVFJX?=
 =?utf-8?B?dWVZbUd6UEM3djZ6dndvUnd3S3ZBSGJZNVEyWTJOb2IxaGJlM0JVRTBUOVZ3?=
 =?utf-8?B?SmRRWUlUclRHdytVYVpBcGd1d3JzeDBNOGZ6bjkyNDY2R1BoTUtuOGpudnpx?=
 =?utf-8?B?OEI5MlpPQ1owSUo5NUZMejdDdnRMb3BKOEpaY0RXdUZibXlzVytNNEJ2UVVO?=
 =?utf-8?B?ZWQ0WkcvMVNtWC9PNXIxVkZuL21KSFo4cXdBSEZxVVZ3R1VyMktaT3Nkb3dm?=
 =?utf-8?B?M1Q2Nng4NThRckxPQVZ5eWppZFZZVUtyblFkS1FvcDRTclhHRUxuQkRSVFlX?=
 =?utf-8?B?LytGTWxDTDcyM2lMY3p2YmdsY2lHQ2lQMWVzOVdPVDc4YlQvZE1CRS8wUU9J?=
 =?utf-8?B?S3JtSlJld3UxT2tySStjaWo2YlBlMW5UZ2RTMnY1QVhNNUk0ZmtrdHFYM3Fw?=
 =?utf-8?B?MjRNWGhPS1JmclE4ZGZlSkIwNjB3QmtUMzRqN2NWOUZuRkRDMHBsRVkzZnVq?=
 =?utf-8?B?QmcyeHRvaFovcURWWUhQK1ZMMjJNaEJlQnQrTXdlY0FWYmEyOTMwQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341d3cb0-6360-4a03-03f9-08df3eff376d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 07:49:57.8430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqSX7a6PDSna4VFq42ho9lsA1860l2bcLk2qm/+9ov5e+MmTDgNJJD2wVv4SmmlDIv4X4hfsS60m3j6H/QCMyq2a/mtGlUtnoU846m2AN7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR03MB9453
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_235008_476228_1C08A19B 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgTWFya3VzLAogICAgVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCk9uIDIwMjYvMTEvNyAwMzoz
MywgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cj4g4oCmCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtYW1sb2dpYy1hOS5jCj4+IEBAIC0wLDAgKzEsNDMyIEBACj4g4oCmCj4+ICtzdGF0aWMg
aXJxcmV0dXJuX3QgYW1sX2kyY19pcnEoaW50IGlycW5vLCB2b2lkICpkZXZfaWQpCj4+ICt7Cj4g
4oCmCj4+ICsgICAgIHNwaW5fbG9jaygmaTJjLT5sb2NrKTsKPj4gKwo+PiArICAgICBpcnFfc3Rh
dGUgPSByZWFkbChpMmMtPnJlZ3MgKyBSRUdfQ0ZHX0lSUV9TVEFURSk7Cj4+ICsgICAgIGlmIChp
MmMtPnN0YXRlID09IEE5X1NUQVRFX0lETEUpIHsKPj4gKyAgICAgICAgICAgICBkZXZfd2Fybihp
MmMtPmRldiwgImkyYyBpcnEgdHJpZ2dlcmVkIGFibm9ybWFsbHksIGlycV9zdGF0ZToweCV4LGly
cV9lbjoweCV4XG4iLAo+PiArICAgICAgICAgICAgICAgICAgICAgIGlycV9zdGF0ZSwgcmVhZGwo
aTJjLT5yZWdzICsgUkVHX0NGR19JUlFfRU5BQkxFKSk7Cj4+ICsgICAgICAgICAgICAgY2xlYXJf
aXJxX3N0YXR1cyhpMmMsIElSUV9BTExfTUFTSyk7Cj4+ICsgICAgICAgICAgICAgc3Bpbl91bmxv
Y2soJmkyYy0+bG9jayk7Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+PiAr
ICAgICB9Cj4g4oCmCj4gCj4gUGxlYXNlIGF2b2lkIGR1cGxpY2F0ZSBzb3VyY2UgY29kZSBhIGJp
dCBtb3JlIGZvciBzdWNoIGEgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4gCldpbGwgZG8uCgo+
IFJlZ2FyZHMsCj4gTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==
