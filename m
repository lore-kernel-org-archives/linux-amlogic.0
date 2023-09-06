Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5274BEB8FAF
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Sep 2023 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaEUABgxLzCDZrqrqgTYKAMfnnTtgumMU6cjppVOszw=; b=tYJU5/+bbEBA1mMkOUImTBZTYn
	4OAweHi16epR/OK3/7ZzBtAd5OH7l0jc8FsC56ecpTP14CJiL/70vLD5rotkUhYaMbnm3f93V8Yw8
	12ryPu7p2LA2YLo2VA/mIhx0o5e5xcNAIt2WmYagnqW6q2xcSYOcsUdWtm3X+wYB2R89w6ugc2/At
	NvwyI6akRl4qzgsbCraFo3dt4HbGkiyFmDz306WlDcVA4n7rsSa4oXMFj3HyURZX/6WHbpVMo80Fj
	D9V00FIcLmRW/DCrcEX5yyH66j6gHe5/S5CIEVLHh0j/Klso6Y6wySVT67cejn22ll8ycp4VnUNU8
	6+kBgw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpvE-008DpP-0V;
	Wed, 06 Sep 2023 10:38:08 +0000
Received: from mail-psaapc01on20720.outbound.protection.outlook.com ([2a01:111:f400:feae::720] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpvA-008DmI-1v;
	Wed, 06 Sep 2023 10:38:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VI4aPFal3DUzBX2jdxqY63uP1OM34Znq6QOgFhFRzeTi6XFb4U9gwaIdzONFxQE5sbqbG/3+hOERRPDnfqPNr8TF07q5vbCJTb2tONaH1p++BYGa6HVM4h3F2gIYIxVoDocCRz3Zwsgkl1BuhgGgH2nRS4aiYH/NWRUVIbhMY4GkAbI+uvmJ0Jm5GN4f3ijr0FrpCsk88ugdj08JIHQT2pOQ+CIDqLoelfTJyB3/ijiAYn8k+W159jbqVbTEHm3c753DDlBbfEmGN2vrtj+XomABEuvUHn38XvRjujd8a+C3skLsnL35vP9RBNZ/2EIkFUGX7XsX+gpuWEQQ/2/TRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTYf+hxJV8raGQHE+pyWeYlqTu26hT5MIuFEZV9IUcQ=;
 b=Gv6gnZw5w6ZBQhNWyzXRfcCsReoHJFqzPNwGOiBO0/UKCXbJ223a0K7y31zEI6nIn/l7ahjk+P/kS9PFp9FmHxz1RUM7Eqfm9epUtX3WPT2qTwC+exkHvbQUIpb5f7ZhqCgsCg0YTSwjC7/zrDof4xBz3iiFp4GfWB42DBH8a/r5lRVdYe0NKDd1Vl6GSfUtEgUXTWpwbA/tj1nen9VeCM+rV1gpx/n4+gkU1XJqB6+yoyY3MeFw5YNTZ5+ldY3xm/iLQ+Q57b8nbLM+wy2b/ljc614phIeLjQRVwzncZAMbZ1uVxLeZAi9DBoRhC1z0cmiVzvC2WgQ37/HmgA+RBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTYf+hxJV8raGQHE+pyWeYlqTu26hT5MIuFEZV9IUcQ=;
 b=ULGeuiEdqJRXtlIfuF5DIpAVOYkesTF+Fccawx218TIdWCmDcCQU4QX9TVBNJNVKi0C3KClsMiOhplzaYbQCpJIJhlXnJMFFvKpBV7HxAqi5dgb3XvsXYuOYSm7za7BeY/nB8P39T/EI4nhH5Mqnw13MfAFKrYjeZMCH44maBbQidO6x6VGXXefQtV82lRTwu+8v3MF1qilgHCRWbTkUZ/2yqDfXkgyMRJbLmOj5TTCb6ulvjcRxeYXc5b33V/LFerJ8yAFpr9kThIhG/UniH/+U7n8/P6OIXLrY+fioU1t4JlogqCFxv0v8c9npQKmlUAlLA/Go0D2NguRVJyU+hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
 by SEZPR03MB7328.apcprd03.prod.outlook.com (2603:1096:101:123::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 10:37:45 +0000
Received: from TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d]) by TY0PR03MB7240.apcprd03.prod.outlook.com
 ([fe80::1cb:e12:c7a6:487d%7]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 10:37:45 +0000
Message-ID: <448f6dab-4cfe-c840-8c70-adfa217cc7f3@amlogic.com>
Date: Wed, 6 Sep 2023 18:37:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] media: rc: meson-ir: support rc driver type
 RC_DRIVER_SCANCODE
To: Sean Young <sean@mess.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com, kelvin.zhang@amlogic.com
References: <20230825115310.39993-1-zelong.dong@amlogic.com>
 <20230825115310.39993-2-zelong.dong@amlogic.com>
 <ZO2gvMl2IS70ve3T@gofer.mess.org>
 <b6e9fc91-0c99-5635-235b-76bc6db55f75@amlogic.com>
 <ZPGahNKlq/31MXbh@gofer.mess.org>
From: Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <ZPGahNKlq/31MXbh@gofer.mess.org>
X-ClientProxiedBy: TY1PR01CA0200.jpnprd01.prod.outlook.com (2603:1096:403::30)
 To TY0PR03MB7240.apcprd03.prod.outlook.com (2603:1096:400:276::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR03MB7240:EE_|SEZPR03MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: 06043cc9-30ed-477d-f5d5-08dbaec54e42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/iz1bUad+hDe/AH0KkOTm35cc3Y6P2dnbtXV6r7JzRX8r2daacNAsfAjpDDJ5GnTBSOTUhOBr8HmCXbPhTRrQiW1VglypgNRsWJ20OqL+FQ6J1+Yd5hra7gqzimXVIbfx0nFU8AcVZdiw+mD5VBkgRoTbDBxx03c5e/5B/ltyTf3opoBiOV1Dik8LE1sAR1k6yeD3JBBnSFQB+X/B9ScJ1UAGfbZH7YpXfUOIGN+G0XCaVqdRYUt8qlrS25o0AoAtxJpHsECnPsoTnrmK/mbVVG9L8QCqo8FCNWhmA71l7v8gStOCqKYGJlBe8seBrqqKfgAIwA4ESGauqLjJlUsbN1RDoFbcjRPLe77UZ3dJ856Sv5Ww8OC49WwrAtUHH1T43OgnLP3O1s0vdt7pPD0zPLTc97o1rlMpIfdECBYFyELIE+Ad33RDjhd8WGSiGQtMJlCM78AdqDt58PQuCMJRQvP6a9/nSDhHjApUKPqbk//ge9njgaC42oT1QimZ3lnaNCFx4XQ7wyzoZG2YFhu7iXjV4aTRTEMROZoNB8yyeaV7P0umjac/4Rqtb7WRcQBcbwSb3MMihJzAdzF79plOeW1POMfAcwGQK52bwjpmqgAhTc0Bs1w4rWwzayGPCz6PSvyGRtFrbGCoEOHPwnNrhj9qwLDoSAw6sMYd0bB8qnhqiAfrK7RpyhKLMQQ5WnXqSKQ44gNYQbNOzqTbxLJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB7240.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(346002)(376002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(107886003)(478600001)(83380400001)(2906002)(2616005)(26005)(7416002)(66476007)(54906003)(6916009)(41300700001)(66556008)(66946007)(316002)(5660300002)(4326008)(8676002)(8936002)(36756003)(86362001)(31696002)(38100700002)(31686004)(66899024)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0VtbXhNeUtBbS8zbDN4ZUdZTStXU2F2cDdMVnlmRnRtc1FFdWFLVjdWT082?=
 =?utf-8?B?WVZOQlJwOE1MbEZwSWJQbEFnaUE1R0xQbHN3WE4rQ2VFSS9VdHJxQkhrdmFs?=
 =?utf-8?B?cS9PUlpWSHlWTUEzclJtb1FPWU5qV1l3YWt4UXZtYzc5UldhaWVCdHViNmZG?=
 =?utf-8?B?aEJLV054ZzRrS1JYK2lKQjdvcENBYmZtMUJxUzZlaCtKaXFLSEFyM1JLU2hp?=
 =?utf-8?B?TWdNRElBTC9kTkhqcFV3UlZJTDhLWkFMNEFiejVKT1RMV2t3eGIxZEVoNzIw?=
 =?utf-8?B?aXRFYzJrUGZyNUVWMUo1RHpKaGtEZHpOOHBwaW5YUy9qb0VGWWFUdERMU08z?=
 =?utf-8?B?eklqK2QwY0QxL2JuRzdueC9Oa01MN3BudVpmVlA1TVlqOGU1cFNpRTd5Wlhv?=
 =?utf-8?B?S3g0Q0lpZ0NWVjJ3ZVpHbkNYck93NytKRUI0SkRWZUJKaDZwQVF2ZlUvdFBX?=
 =?utf-8?B?QWZYL2Era3NqSHppckRHdnlUWW9iQitvTDJSN25OWUcvbFdEVWozL052VE50?=
 =?utf-8?B?VUdZbFBmOHpJRzRvVFZ5cHRnYVJucForbzBVOGFUYmtPM1hWTGp3S0JaOTV3?=
 =?utf-8?B?OG1nV3l1dm1yRE9HRFl4UlNTcjlSNEo0VjArSlp4SXYxRlNxS0FiM3NWNklM?=
 =?utf-8?B?ajI3VUIxeHNsWDVjc1M5b1pHN0NOeUd1OTBoVUcyT3p5QlNmWEZ2RTArYVF4?=
 =?utf-8?B?UkI3RHFqbERyRWp6aUp2RHZtbjRaeTdEUlp1aUxGU0FPeEhMbmswNUg3VTZh?=
 =?utf-8?B?UUc5dXpMU3k3cjVXVVBsclZtZkFMQy9pMzFLVndJdk1raEVoR0s5OCtQMENn?=
 =?utf-8?B?YVF2ajZRVWQ2MnVHaHc4T3I5aGwwK2hDMWpLR1ljSmJsd055L29lb3o2dURv?=
 =?utf-8?B?dDJ6TE9oZFY5T3JZaXhTaGMrRjZ0cy9MZmRQejlCNVY5bGFiL21wc05JSkkv?=
 =?utf-8?B?WWZoc2w5TXF0czlDV2t3SjlCSzJMYjBhWTZOTDIyTlhSK1BlZjVwQ0o4ZjFz?=
 =?utf-8?B?ME1WbmN6K1hBTXNrYnZOL0JDWkZ2RHIrTCtTRk94aG5ubWJoNkxwZldQYTlE?=
 =?utf-8?B?U3NzSTVoOXBqbkJYTVZ5Mlp6c2lVTnljaWp5NllXWWlZdmo0bm42Skp4RytV?=
 =?utf-8?B?aURuTFc3cXQxbFEzcW5ORTh0dE9keVUraWZGdnFNeFVmT1ZwMTVlcUNBVEg3?=
 =?utf-8?B?SFY2MGZrNnZRMFh1OGMvR21kd2NGK2wrUmtac251c3Z1MDZFM0dzU0JleDFy?=
 =?utf-8?B?TnZEWmNGZ2RBeTgyUVdia051WmFQWVowakQ5Y29NdlVvNzFUcEZkWkNtN3BG?=
 =?utf-8?B?Y3Z6Qzh2VGNHRHZ5V1gvRW9Ddmk5TlNMcnpxeEQ1NGNZZ1hPTWhocjkzVWNH?=
 =?utf-8?B?d25YUEtaUmM4MFpISnpGZk9BRXMza0lVRmRmS1EzWmJOaEZ2WWFNSU1COXUr?=
 =?utf-8?B?V1VweG0vbElpMTFWak5QdUd4VWhaeVJZUzhQK2lrZkxzRysrRC9mOHJkcUIz?=
 =?utf-8?B?R3FQVTdHYkVWcm9MaGlKZEZsMnNwMGNtOFBocDF6UU0zSkhtYVZkaEV5T3Ru?=
 =?utf-8?B?TVkvQWNMNnVjaDN6Qnh5NHNoTWkxVkpCQWlnaldKU2Z3dEc0NlFIRHhDRzJl?=
 =?utf-8?B?a2MwVTdqOGxsallrVEpjRXpXTjNjd2dDNnFUMng0cHRzMjEwTG9aYmFwN1NG?=
 =?utf-8?B?R2wwREZwRlBwb294Tld0VlJsTVMydmo0MGlPakRGQitGK0Y3aHEvUmhIYkh2?=
 =?utf-8?B?dXdFV1pWOFk5Wm9ic0dUaVlYMndYMHBEMUd1UG1Jc0twdjh2bEhFazQxTmh5?=
 =?utf-8?B?T2JKSnM2MksxSzkzLzdYSzlPNG15YU1hVTI5dHorc050eGRJNnJMYXMweW9T?=
 =?utf-8?B?WjZZSUZORzU2bkdyNXpWbWR6RDdQOWZIS2NMemhtRkdNRVRiOG9BdGMya1Zn?=
 =?utf-8?B?VG5UNTIrZlZud1gzUDdzaWdqOHBKdExmNE9wYWdWUUwybkNSTjFvSkhCQSt3?=
 =?utf-8?B?NjJxeEx0ZUl4YXFJYm9TQnpyTkVpQkhQd0NiajE0cUUzNHVrb1M5REdvSVl2?=
 =?utf-8?B?NjlWLzBzd1lFMTZ3a0l2UWxvdGlmNFBxZjg3R0NCMXpsYUtuTUwwY1MrbG10?=
 =?utf-8?B?c0pWZ3liTURlVC9ua3htM1h2NWdBamN0V1pVWDBmM096a0RMZy9SV3NMZWVP?=
 =?utf-8?B?UFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06043cc9-30ed-477d-f5d5-08dbaec54e42
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB7240.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 10:37:45.0969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJn38tD7iJBMlBe5dd3MMNkBlklnclbog4JfkPUuG525AYS5fDYlRrcNfjFitkWxR9gwKXLDxDBqO9S8hIzbXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_033804_695148_787DE041 
X-CRM114-Status: GOOD (  23.11  )
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

5ZyoIDIwMjMvOS8xIDE2OjAyLCBTZWFuIFlvdW5nIOWGmemBkzoKPiBPbiBUaHUsIEF1ZyAzMSwg
MjAyMyBhdCAwODoxMzoyMlBNICswODAwLCBaZWxvbmcgRG9uZyB3cm90ZToKPj4g5ZyoIDIwMjMv
OC8yOSAxNTozOSwgU2VhbiBZb3VuZyDlhpnpgZM6Cj4+PiBPbiBGcmksIEF1ZyAyNSwgMjAyMyBh
dCAwNzo1MzowOFBNICswODAwLCB6ZWxvbmcgZG9uZyB3cm90ZToKPj4+PiBGcm9tOiBaZWxvbmcg
RG9uZzx6ZWxvbmcuZG9uZ0BhbWxvZ2ljLmNvbT4KPj4+Pgo+Pj4+IE1lc29uIElSIENvbnRyb2xs
ZXIgc3VwcG9ydHMgaGFyZHdhcmUgZGVjb2RlciBpbiBNZXNvbi1TNCBhbmQgbGF0ZXIKPj4+PiBT
b0MuIFNvIGZhciwgcHJvdG9jb2wgTkVDIGNvdWxkIGJlIGRlY29kZWQgYnkgaGFyZHdhcmUgZGVj
b2Rlci4KPj4+IE9uIE1lc29uLVM0LCBvbmx5IHRoZSBoYXJkd2FyZSBkZWNvZGVyIGZvciBORUMg
Y2FuIGJlIHVzZWQgdXNpbmcgdGhpcwo+Pj4gZHJpdmVyLiBEb2VzIHRoZSBNZXNvbi1TNCBoYXJk
d2FyZSBzdXBwb3J0IHNvZnR3YXJlIGRlY29kaW5nPyBJZgo+Pj4gc29mdHdhcmUgZGVjb2Rpbmcg
Y291bGQgYmUgdXNlZCwgdGhlbiBhbnkgcHJvdG9jb2wgY291bGQgYmUgc3VwcG9ydGVkLAo+Pj4g
bm90IGp1c3QgTkVDLgo+Pj4KPj4+IEFsc28sIG91dCBvZiBpbnRlcmVzdCwgaXMgdGhlcmUgYXJl
IGRvY3VtZW50YXRpb24gYXZhaWxhYmxlIGZvciB0aGlzCj4+PiBoYXJkd2FyZT8KPj4+Cj4+PiBU
aGFua3MsCj4+Pgo+Pj4gU2Vhbgo+Pj4KPj4gWWVzLCBJUiBkcml2ZXIgc3RpbGwgc3VwcG9ydHMg
U1cgZGVjb2Rpbmcgb24gTWVzb24tUzQuIFRoZSBkZWNvZGUgbW9kZSBjb3VsZAo+PiBiZSBjaGFu
Z2VkIGJ5ICdzdXBwb3J0X2h3X2RlY29kZXInLgo+IAo+IFRoaXMgcmVxdWlyZXMgY2hhbmdpbmcg
dGhlIHNvdXJjZSBjb2RlLCBpdCBjYW5ub3QgYmUgZG9uZSBhdCBydW50aW1lLgo+IAo+PiBJZiBJ
UiBDb250cm9sbGVyIHdvcmtzIGluIFNXIGRlY29kaW5nLCBkcml2ZXIgd2lsbCBiZSByZWdpc3Rl
cmVkIGJ5Cj4+IFJDX0RSSVZFUl9JUl9SQVcgYW5kIGFsbG93cyBhbGwgcHJvdG9jb2wuCj4+IE90
aGVyd2lzZSwgZHJpdmVyIHdpbGwgYmUgcmVnaXN0ZXJlZCBieSBSQ19EUklWRVJfU0NBTkNPREUg
YW5kIG9ubHkgYWxsb3dzCj4+IE5FQy4KPj4KPj4gNDg5ICAgICAgICAgaWYgKGlyLT5yYy0+ZHJp
dmVyX3R5cGUgPT0gUkNfRFJJVkVSX0lSX1JBVykgewo+PiA0OTAgICAgICAgICAgICAgICAgIGly
LT5yYy0+YWxsb3dlZF9wcm90b2NvbHMgPSBSQ19QUk9UT19CSVRfQUxMX0lSX0RFQ09ERVI7Cj4+
IDQ5MSAgICAgICAgICAgICAgICAgaXItPnJjLT5yeF9yZXNvbHV0aW9uID0gTUVTT05fUkFXX1RS
QVRFOwo+PiA0OTIgICAgICAgICAgICAgICAgIGlyLT5yYy0+bWluX3RpbWVvdXQgPSAxOwo+PiA0
OTMgICAgICAgICAgICAgICAgIGlyLT5yYy0+dGltZW91dCA9IElSX0RFRkFVTFRfVElNRU9VVDsK
Pj4gNDk0ICAgICAgICAgICAgICAgICBpci0+cmMtPm1heF90aW1lb3V0ID0gMTAgKiBJUl9ERUZB
VUxUX1RJTUVPVVQ7Cj4+IDQ5NSAgICAgICAgIH0gZWxzZSBpZiAoaXItPnJjLT5kcml2ZXJfdHlw
ZSA9PSBSQ19EUklWRVJfU0NBTkNPREUpIHsKPj4gNDk2ICAgICAgICAgICAgICAgICBpci0+cmMt
PmFsbG93ZWRfcHJvdG9jb2xzID0gUkNfUFJPVE9fQklUX05FQzsKPj4gNDk3ICAgICAgICAgICAg
ICAgICBpci0+cmMtPmNoYW5nZV9wcm90b2NvbCA9IG1lc29uX2lyX2h3X2RlY29kZXJfaW5pdDsK
Pj4gNDk4ICAgICAgICAgfQo+IAo+IFRoZXJlIGFyZSBvdGhlciBkcml2ZXJzIHRvbyB3aGljaCBj
YW4gZG8gaGFyZHdhcmUgZGVjb2RpbmcgYW5kIHNvZnR3YXJlCj4gZGVjb2RpbmcuIElkZWFsbHkg
d2Ugc2hvdWxkIGhhdmUgYSBtZWNoYW5pc20gdG8gc3dpdGNoIGJldHdlZW4gdGhlbSBhdAo+IHJ1
bnRpbWUsIGJ1dCBhcy1pcyByYy1jb3JlIGRvZXMgbm90IHByb3ZpZGUgZm9yIHRoaXMuCkFueXRo
aW5nIGVsc2UgSSBzaG91bGQgdXBkYXRlIGZvciB0aGlzIHBhdGNoc2V0Pwo+IAo+PiBEbyB5b3Ug
Z2V0IE1lc29uLVM0IGRhdGFzaGVldD8gUGxlYXNlIHJlZmVyIHRvIGNoYXB0ZXIgMTMuNSBJbmZy
YXJlZCBSZW1vdGUuCj4gCj4gSSBkaWQgbm90IGdldCBpdCwgdW5mb3J0dW5hdGVseS4gQW55IGhl
bHAgd291bGQgYmUgYXBwcmVjaWF0ZWQsIHRoYW5rcy4KU29ycnksIHRoaXMgZG9jdW1lbnQgaXMg
bm90IHB1YmxpYyBhbmQgSSBkb24ndCBoYXZlIHBlcm1pc3Npb24gdG8gc2hhcmUgCndpdGggeW91
LiBQZXJoYXBzIHlvdSBjb3VsZCBhcHBseSB0byB4aWFvaG9uZy56b3VAYW1sb2dpYy5jb20gZm9y
IApNZXNvbi1TNCBkYXRhc2hlZXQuCj4gCj4gT3RoZXIgdGhhbiB0aGF0LCB0aGUgZHJpdmVyIGRv
ZXMgbG9vayBmaW5lLiBOb3RoaW5nIHRvIGhvbGQgdXAgbWVyZ2luZyBmb3IuCj4gSSdsbCBhcHBs
eSBpdCB3aGVuIEkgY2FuLgo+IAo+IFRoYW5rcywKPiAKPiBTZWFuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
