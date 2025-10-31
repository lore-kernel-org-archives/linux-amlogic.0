Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1CBCCF9E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Oct 2025 02:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2pFEZ+KMMRTwYmTbmI4WPhNUDaDFmEQeTttGQm4u04=; b=4FcPFTLaRX71ttBC1Yazr3RLdN
	M2HSMjfquiqfuBOKhvlaiUZcggJGS7nfJVmrP9RAiKoG6F9DpLXjbZFHnaB7aI1FviT72LlmGEVrz
	1/oZqrDIHF11QfmCR07JTOg1CRyj/pbBOMmI4ivnBQg0ICwotHG9HaeqARwOCCH7Z5Aw3W5fwUggX
	AXKCaso1N+CbLAKCNr5UWE1VjTX7uYG3rqmpmXcO9EdZBYQ5ifRGV76RW3khcicdxG417izm/rSZN
	/GC11/eik2smvPbYgfOYOLdFqc1AortRRg+DF8YKpIVHSZA8Ahiu/h9VkRZ93IwplewW8BpBORZJj
	DCImqAGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEewZ-00000005Gv0-10rx;
	Fri, 31 Oct 2025 02:32:47 +0000
Received: from mail-japaneastazon11023085.outbound.protection.outlook.com ([52.101.127.85] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEewW-00000005GuZ-2ncu;
	Fri, 31 Oct 2025 02:32:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHTc5HyDFYeyoZlGaMFW1+J/GeN8yjBMgadlINyrjh8ZPAHvkyjSasgceOfogsziKdMXCfEmvGOpljTqQClymoPmp3ijI4mbBtIgXtFWCOrpRozYbBQ/Rjg6P4uvOFtwREN1dtjmoCrk1s6k3wQHyf8jfVhqh2XMtKcnNl+pHB+/Sr7tKT49XSV4HUxOYgk2T6ny/Ao41YeiQOVkOC85I+IoG8HDXAo5+KUXnEzQ0H+O3iwiHIE9yhjcib9qDno7mhXceCk0JliHC62EWYlkr5wnk7Q1k2+/SUuGgig22ZliVNtKlVDFV9EaD/PSrjD9dq96H+LLg/pGH+4w8LYbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCv9aIRfsYqBIHlzbMW8hXmYnDDP/OviQnpDNfVXca8=;
 b=nbMGKx9/AlnskS1gPx7dgx94G+ZojTm7uiYzoCrPoByLEG/eQOrkXoQ1OYRwIao0QQuRPjY+sRYosKX8A7pD7PlxVGYr4I/Twc9ogGV+afpqXEhUPawiJbS3TZyrlD4TquVXQ8tfPlUEXyyjpAPRMw09ZBw84LqIC3pla4rYg3Qs/9JsJZD0Bxmm7XP1Ebm+dd1HnLp2JgfmWOlArcfbFVSR1M56VECDNdk9e+190pkUR0pl4dpH0wMWPgS0ph0+2N7h/xOVkBeR4Ecj6UwG6eWrjoDTcvXlmzf+NCpnvFejlj5t4wMuOZGOCc+pHg2S41CTH7bUXmcx6lIrkeir3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCv9aIRfsYqBIHlzbMW8hXmYnDDP/OviQnpDNfVXca8=;
 b=C1nbT910MecjwpHPU89Jlsqo8wp5aLyGmJXAMHqjmfWIs6TZmn+BGq32Y6pzoZL1FR4N+UvANJXRo85zS4W0HjRT/kgv97KFxAIUC8owNLuFtKT0+TzCbZCwdxsF4/e9KBUE8VuxQTH+p1h3KqihJ4rIflmyiQ3HUOGVeoLtEy2RpIDcPIjqMATjOwm/Ax8GX7l3AnKIdYpA3XPfP2y+hY4pl1jlG4Dm4GLqZkjJQwnmGaylQ/5Z2mwiwPuaxQ78GvYkce+O0n33cXfy5AQanFKp2Znitg9ajyBWSPUSgocwlT72V3ZkiPUgVNjQeGHpHXwCwU5wABNRCJQ7EJ5ngg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by OSQPR03MB8482.apcprd03.prod.outlook.com (2603:1096:604:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 02:32:36 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 02:32:36 +0000
Message-ID: <731eb8c3-00db-460b-9b28-11472e8b639f@amlogic.com>
Date: Fri, 31 Oct 2025 10:32:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
To: Ferass El Hafidi <funderscore@postmarketos.org>,
 linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
 <B9A578FB-BF95-47E1-B202-B59897C2C898@gmail.com>
 <9a8e0391-c73f-4913-88e1-0a278d99f90d@amlogic.com>
 <t4xy6q.vhi5j58gpfcw@postmarketos.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <t4xy6q.vhi5j58gpfcw@postmarketos.org>
X-ClientProxiedBy: SG2PR06CA0194.apcprd06.prod.outlook.com (2603:1096:4:1::26)
 To KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|OSQPR03MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: 442dd936-1e5a-405b-26da-08de1825c0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmhERmhvWnJaNlFhdlU0ZTFROTJNRjBmV3dIUm1jMmZISXFNZWR4elhZZEhw?=
 =?utf-8?B?ejU1bGM5ZjEvSUo3VDZJVFlpSG1jNzIrSzF0ZzRXTmwzQWx1cE9yNnNmd0VR?=
 =?utf-8?B?eW1ZWWNVb3Q1MVZPMFdYMzhqbU9BRUF2TVQ4VE1aVy96bFRZRUp3RVExa3pp?=
 =?utf-8?B?SzlhSk9MTHhpSGxZeXlRTnBESVdKWmgzaytRejcrNlBXUHlkdjVET1pPc2Zn?=
 =?utf-8?B?UW9zUW9DNTkvbzM4bC94dFBCRjl1OXpFeWRucmlWNnFFWHYxakNwanJlazlh?=
 =?utf-8?B?dEYrWk1KcjRYOTNmVDluSTI5QXdHbjdyTWZqRU9tYkNick1IV0xMODdKTjhR?=
 =?utf-8?B?QVFqNG5HZ1ZvNm1SSGVoWktwWllsbzVYbG9vOG00Mk1ITHMvRm9QSnNWYXZH?=
 =?utf-8?B?end2RzB3N0NXdHQ4Wm9uUUZuZW8wbHZPN21oSFFUczVDQlU1QW9sT2UxaUF2?=
 =?utf-8?B?S2FnWTgycktQRmJZTG5OdTFmZmp5aUlzd2U5QzdQZ1ZnZlpoTWc3R3pXNHFw?=
 =?utf-8?B?dExmSGhCaWVSSkU0YUFaMEp0c3luWmdxeGtZOU5XQ2F3N2ZkdExQRkVydWZU?=
 =?utf-8?B?dUVXb293aThFTGJjcUFXR1hBL05sRzh6M1lrWm5IS0d4RkJEMFg3SkxIbmF4?=
 =?utf-8?B?bHdJR0VqV3FHUzZmUmIwcDZMR2hxUWxzMXdMbGN3cWFON0ZwTzB0REFBL1Qv?=
 =?utf-8?B?ZGVQOVFSb2o0NWJzVlJ4dUhCdEJ0QzN6bnhaV0FvZHZKRWc4VXhNV25FaTNC?=
 =?utf-8?B?eDk4SGtMaHEyeFQxS1ZmaDE5bnl3NlUyT05mZS9xMnVpWjFnbHI1Q0UzYnpw?=
 =?utf-8?B?SS9UMmxJYWsvWktma0dzdDU0MUtZUWVIdnh2S2FHdUVnWkF0MXF6SXY5bGQr?=
 =?utf-8?B?aFQyYnVpdnBRY2VmdjVBOE5ENkluTnJLS3VNSmNCdGxFbVh0MmRzcEx5ZXp1?=
 =?utf-8?B?WllFVzAxK3d4bkN1enJlMWdHSGV1bzF3bmNoVTFDTklXRy9TQlVoTTBRNmhI?=
 =?utf-8?B?ZWt3a2FQZUlnMnRYQTJDMHh3REY2OHp1Y2JRS0JnNWR0UTJ1QnBXVXBMNHk3?=
 =?utf-8?B?eHpYK2VIcWhZdUdIRCtzS1NhQVgzVytYUERaVER1d2dWNWIrNWpHOE5VZU50?=
 =?utf-8?B?MjBhODB4b3E1Y1F3M05JUEhObkhqLy9mdWxFY29KNnpGVFJLMUVtQXRWdVJj?=
 =?utf-8?B?a1BMbTBOL0VodXRkRS9nRW0zWmJOcXhzUjk3bkF4Qi8xcUlpMVBKTHg0TWpX?=
 =?utf-8?B?UzhHcEQ3VHZuMlVsZXd5aHliSVZaM0xQSFlvZjk3L0Z2QUxNQk9SQnB6VGJm?=
 =?utf-8?B?a3BXVG5od0cycG5DZFREb3lIRGFYQjc1a3R3Ujl5dW5pZ3JqdEFzekdNaG54?=
 =?utf-8?B?MjlyL213SzRKSnJZVWVJaEFGc1hPWFIzbFhyWXJ4U0xjQWtWdG1MbmVJbXlC?=
 =?utf-8?B?RGNLb09xWnFoYTlBZXc3NHpnYlNlZlI5V0s5bHVVcWhNYm9YazRZeHNESTN1?=
 =?utf-8?B?Syt2eThMdjl4ckJKWjNWcGgwU0N0VHdhbXFOUTdsQzlWci9rNXNwWDYwK2oy?=
 =?utf-8?B?WHBVTnBBdnBYVFE3RDN6aVFWMGNjZEFqR3M3cHA0K1lNWm1pWVExbWsvaW1k?=
 =?utf-8?B?UVVwaXEzZWlQUnRteVhCUWxzcUxVTW1IWVhOQWtldzk3bUQ1NVQrMzJ3UmIr?=
 =?utf-8?B?c2puZUVvN1dGdjZKTVMrUlZtWWc5eCtlNTRMMFdpeU9tcGhvQ214UGtGa25q?=
 =?utf-8?B?Q1lyQ3hkU2xqMnlJVlBWMkhRRVdGZkg4SDllQUdseUZHK1RTSi9LZHRQNVNC?=
 =?utf-8?B?TGhyTmFFQnRhWUcwcnA4N3R1TlJxK01PYVBWRDNZSncxa3pyTXYydFJPMlJV?=
 =?utf-8?B?OUlkZDAvbWdJeUVEeVNEdkhpdkVjMmlaR3E3UjliNTZCdXFWS2xxditFMytE?=
 =?utf-8?Q?XKtf8W8qkIqQUui5lFalqVpuH5cZsS5Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZZejRLTzhRV0dqTGlSSHM2Tnl1RFArNmEzZlNESFZKZEwvUHJ3THFMcHd4?=
 =?utf-8?B?aDVuQmNZai9yaTlSM0ljbmRXNVA2a2ZVenBYSDdNS2hISThzeVBPTWkxd0tG?=
 =?utf-8?B?VXNlOXZlMmpEbHZRZTB5cW1XczkwUGk1UGZFZnBvcHlqbmdVNEtaRlhueEVz?=
 =?utf-8?B?Q1RKVUJLWHNSRVpXYk84TlAybnJvOU1BRDY3YVdFaEVtenB5R3J6WkdOazVQ?=
 =?utf-8?B?blJGOCtTWER2Y0ZkWVAyWXBYbnU4L3NTS1lBelRySnN5cE0xa2xHUkNTOHVC?=
 =?utf-8?B?K0hhdHpBZWVmZng2WnV1RDZmb0RmNTVuSjVhTFBtV3d6NEVhdHk2d0kwSmR4?=
 =?utf-8?B?Z2d3OWxnYldFZW5JRHUra1UzSG16REcvQk1XbjM3RjZPTDlTRFplZVczNzIw?=
 =?utf-8?B?LzdKaDVTQ1pZZzlkWUU4ZmNrY0ZzZm9maFBWWE9qVjlsc1RVYzB4WFQ5M3VO?=
 =?utf-8?B?UXUxeVoxZU9DK2I1Rk1RK1JmUHFMR25jTjdlazdOMjNvT2lrSi9CV3B1UWJY?=
 =?utf-8?B?UmtLckVTU29DWlFrOUxORFVleTN4b2NadjloYXkwVmdtcHBLWVQ3S3N4bkxv?=
 =?utf-8?B?dzlZaGN6STFpWm90Z21xY2pDMlJ0OVRtMStkWU9SdENQNlhwZUllU2FrKytV?=
 =?utf-8?B?OEl6M0NITGNiTjdkMUswNmo4UVF4WE1tSlR3VWE0dUlBdjhTdk1HYWZ0bmR3?=
 =?utf-8?B?ZUhPaDlYK2VwSkdFelY3OVBRcWF0UlZ1VlNMVE5zSU9ZaG1CQ0oxcXV0a2FQ?=
 =?utf-8?B?RFZvREs5SHZ4Vm4rUjcrRWVoTVJFSm8ySVFVdkZlWXBoN3N1OFZpSDMvekN2?=
 =?utf-8?B?cytsY2tIMU5SSEhjeCt0RDZWcnFlVHd1VnZrY2F1OEVEenVwamErcGR0ZTdD?=
 =?utf-8?B?WlRFV0lyYmdOclErcmFtN2RrNGxaTFFidVRnY0ltZmdYVnhua0xjOU9kcFdr?=
 =?utf-8?B?YmRjdXR4ejhjNlkrZnR5Smx0aFJvakR2bERIWGt4MExCV3VwOXhtRnBuYXZ4?=
 =?utf-8?B?U3VvVWN5ZUpCU3pjeUlTM2lVRmtrOHJNanR6N0tmQjhtLzVOaGpNRjlNN1Y0?=
 =?utf-8?B?b3lYZjFCbFJaa3lsKzRsN1c4Y0NjK3BEQ2IrcmdidnZHbGlDUkVFTmR3WFJN?=
 =?utf-8?B?UEdVOWxqOHlrU1dnN3gzVHMzNmplSkl6SFFiNmpHYW1zOTFMSjNlSnNxNUtl?=
 =?utf-8?B?dmhqNHcyWGNhQ29RajQxc1lkaktMYU5OOGFUamdkRnZvb2xsTW95K0pQMG52?=
 =?utf-8?B?Q0tBbERRQVFvTk1nUnRBOExyNkt4RlEyS2pNWmt5bGViMU96cXdhTnA4YXJo?=
 =?utf-8?B?WWgvRkdaVk94NHR2ZzFtV000NElSWE9Pb1ltYkM4YXpIQnB5aDlma29UUlA3?=
 =?utf-8?B?WkpVU2ZlTU9JWkNpQjJhOHUwbkpRa0FNalNsbUdTMGg2bi9IVlVseXdPSE12?=
 =?utf-8?B?SWZZYjBqciswZWVkUkQ1SjhhcWxuWUN4cmwzb2F0Q3ZXbnZrcEJpOUI3Y1o2?=
 =?utf-8?B?RjRlRTNlMEJTaitIeDZYRWt5clkyaHpRVGhaMmlTVWI4U2hrc1poWWhCS2dF?=
 =?utf-8?B?T2VSV1NHdmtISW9nT0UxRE9BNGdGVHB0RGhBb0JnMEp0UllTVVozdWh4Q05j?=
 =?utf-8?B?d0FjMWZlYm9HZnUwS1ZzWWRaQkZnRlF1YXNxWmdJVlpqYkVlU2lrRkIzMTVz?=
 =?utf-8?B?QWRycE1oUXltM1JVL2xPQmJHZS9uM3lkcmhpNjFKQzk1UDAyWklYYVZVK3RT?=
 =?utf-8?B?dHJuUWhvRUk5ZXl5WU5pKzBNMmxjZ3h5ZkgxQy85SmYwRWdBWGxjRU1BdkxO?=
 =?utf-8?B?alRMSFNLR29Gd0ZlNElPY0R1UE9lcllGV1hoRUd3NEdvOWMvMUUrNTBoZkVR?=
 =?utf-8?B?QWlOcHN3aVJraVZKc2pZSTRtU1IrcnVac1BGMU5SWVBQTG9OVVJOVDlkbmRs?=
 =?utf-8?B?NlRYWjQ2WXZqNUJCeGZvUEtMcXVFVC9Vc2ZOYXpwWTBTS2w5Nnd6WjRGRzIw?=
 =?utf-8?B?VDVjeXg3TDJObXYzK1RyZjE0eXF5M3o3VUMvRnNKRTZsZGE5RW5NNDJ3MHMz?=
 =?utf-8?B?SExNQ2hEVlgrdnpDSm1wWGQ2WjNlOGs5c0RsMHdodWkxYktuSnI3bjBuVmZJ?=
 =?utf-8?B?UmdzYjRNQW11a2g3akZPUWx5UnBoT0E2WlgyV0NyVjBhNlUwbTB3dkIyM0dW?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442dd936-1e5a-405b-26da-08de1825c0e9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 02:32:36.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSJGO+aKMmW1sWgUgAfIBo0bVREc3RVx0bi6lE8sjcdArkhLp8RGg2ndSjDX+S0EFsWwoG+Nmkakv38rcqqB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8482
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_193244_902570_EAF1E787 
X-CRM114-Status: GOOD (  19.18  )
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

SGksCgrlnKggMjAyNS8xMC8zMCAxODo1MCwgRmVyYXNzIEVsIEhhZmlkaSDlhpnpgZM6Cj4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBmdW5kZXJzY29yZUBwb3N0bWFya2V0b3Mub3Jn
LiBMZWFybiAKPiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5B
Ym91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+Cj4gT24g
VHVlLCAyOCBPY3QgMjAyNSAxMTowOCwgWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMu
Y29tPiB3cm90ZToKPj4KPj4g5ZyoIDIwMjUvMTAvMjcgMjA6NTcsIENocmlzdGlhbiBIZXdpdHQg
5YaZ6YGTOgo+Pj4gW2NocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tIGFwcGVhcnMgc2ltaWxhciB0
byBzb21lb25lIHdobyAKPj4+IHByZXZpb3VzbHkgc2VudCB5b3UgZW1haWwsIGJ1dCBtYXkgbm90
IGJlIHRoYXQgcGVyc29uLiBMZWFybiB3aHkgCj4+PiB0aGlzIGNvdWxkIGJlIGEgcmlzayBhdCBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQo+Pj4KPj4+IFsg
RVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+PiBPbiAyNyBPY3QgMjAyNSwgYXQgOTo0MuKAr2FtLCBa
aGVudGFvIEd1byB2aWEgQjQgUmVsYXkgCj4+Pj4gPGRldm51bGwremhlbnRhby5ndW8uYW1sb2dp
Yy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+PiBJbnRyb2R1Y2UgaW5pdGlhbCBkcml2
ZXIgc3VwcG9ydCBmb3IgQW1sb2dpYydzIG5ldyB2aWRlbyBhY2NlbGVyYXRpb24KPj4+PiBoYXJk
d2FyZSBhcmNoaXRlY3R1cmUsIGRlc2lnbmVkIGZvciB2aWRlbyBzdHJlYW0gZGVjb2RpbmcuCj4+
Pj4KPj4+PiBDb21wYXJlZCB0byB0aGUgY3VycmVudCBBbWxvZ2ljIHZpZGVvIGRlY29kZXIgaGFy
ZHdhcmUgYXJjaGl0ZWN0dXJlLAo+Pj4+IHRoaXMgbmV3IGltcGxlbWVudGF0aW9uIGVsaW1pbmF0
ZXMgdGhlIEVzcGFyc2VyIGhhcmR3YXJlIGNvbXBvbmVudCwKPj4+PiBlbmFibGluZyBkaXJlY3Qg
dmIyIGJ1ZmZlciBpbnB1dC4gVGhlIGRyaXZlciBpcyBkZXNpZ25lZCB0byBzdXBwb3J0Cj4+Pj4g
dGhlIFY0TDIgTTJNIHN0YXRlbGVzcyBkZWNvZGVyIEFQSS4gVGhlIGluaXRpYWwgcGhhc2UgaW5j
bHVkZXMgc3VwcG9ydAo+Pj4+IGZvciBILjI2NCBkZWNvZGluZyBvbiBBbWxvZ2ljIFM4MDVYMiBw
bGF0Zm9ybS4KPj4+IEl0IHdvdWxkIGJlIG5pY2UgaWYgeW91IGNhbiBvdXRsaW5lIHRoZSBhZGRp
dGlvbmFsIGhhcmR3YXJlIHRoZSBkcml2ZXIKPj4+IHBsYW5zIHRvIHN1cHBvcnQgc28gcmV2aWV3
ZXJzIGhhdmUgcGVyc3BlY3RpdmUgb24gd2hlcmUgd2UgYXJlIG5vdywgYW5kCj4+PiB3aGF0IG1v
cmUgYmUgY29taW5nPyAtIHRoZSBjb21tdW5pdHkgd291bGQgYWxzbyBsaWtlIHRvIHVuZGVyc3Rh
bmQgaWYKPj4+IHRoaXMgZHJpdmVyIHdpbGwgc3VwZXJzZWRlIHRoZSBzdGFsbGVkIGRyaXZlciBh
dHRlbXB0IGluIHN0YWdpbmcuCj4+IFllcywgd2Ugd2lsbCBmb2xsb3cgQW1sb2dpYydzIG92ZXJh
bGwgdXBzdHJlYW0gcHJvZ3Jlc3MgdG8gc3VwcG9ydCBtb3JlCj4+IGhhcmR3YXJlCj4+IHBsYXRm
b3JtcyBpbiB0aGUgZnV0dXJlLiBUaGUgbmV4dCBzdGVwIHdpbGwgYmUgYWRkaW5nIHN1cHBvcnQg
Zm9yCj4+IEEzMTFEMihUNykgcGxhdGZvcm0uCj4+IFdlIGFsc28gcGxhbiB0byByZXBsYWNlIHRo
ZSBzdGFsbGVkIGRyaXZlciB3aXRoIHRoZSBuZXcgc3RhdGVsZXNzCj4+IGRlY29kZXIgZHJpdmVy
Lgo+PiBUaGUgbmV3IHN0YXRlbGVzcyBkcml2ZXIgaXMgZnVsbHkgY29tcGF0aWJsZSB3aXRoIHRo
ZSBvbGQgRzEyL1NNMQo+PiBwbGF0Zm9ybXMsIG1ha2luZwo+PiB0aGlzIHRyYW5zaXRpb24gZmVh
c2libGUuCj4KPiBUaGF0J3MgYXdlc29tZSBuZXdzISBCdXQgaG93IGFib3V0IHRoZSBvbGRlciBw
bGF0Zm9ybXMgc3VjaCBhcyBHWEJCCj4gKFM5MDUpLCBHWEwgKFM5MDVYKSBhbmQgQVhHIChBMTEz
RCk/IFdpbGwgc3VwcG9ydCBmb3IgdGhlbSBhbHNvIGJlIGFkZGVkCj4gb3Igbm90Pwo+Cj4gSSBh
bmQgcHJvYmFibHkgbWFueSBvdGhlciBwZW9wbGUgc3RpbGwgaGF2ZSBpbnRlcmVzdCBvbiB0aGVz
ZSBvbGRlcgo+IFNvQ3MuLiB0aGV5IG90aGVyd2lzZSBydW4gTWFpbmxpbmUgbGludXggbW9zdGx5
IGZpbmUsIHNvIGlmIGEgd29ya2luZwo+IHZkZWMgZHJpdmVyIGNvbWVzIGFsb25nIGZvciB0aGVz
ZSwgdGhhdCB3b3VsZCBiZSBncmVhdCEKClRoYXQncyBncmVhdCB0byBoZWFyISBUaGVvcmV0aWNh
bGx5LCB0aGUgbmV3IGRyaXZlciBzaG91bGQgYmUgY29tcGF0aWJsZSAKd2l0aCB0aGVzZSBvbGRl
ciBTT0NzLgoKV2UnbGwgZXZhbHVhdGUgdGhlIGZlYXNpYmlsaXR5IG9mIHN1cHBvcnRpbmcgdGhl
IG5ldyBzdGF0ZWxlc3MgZHJpdmVyIG9uIAp0aGVzZSBsZWdhY3kgcGxhdGZvcm1zIGFuZCB3aWxs
IHByb3ZpZGUgYSBmb2xsb3ctdXAgcGxhbiBmb3IgZnV0dXJlIHN1cHBvcnQuCgo+Cj4gQmVzdCBy
ZWdhcmRzLAo+IEZlcmFzcwoKVGhhbmsgeW91CgpaaGVudGFvCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
