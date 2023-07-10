Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72539EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RboZVLDHpJp2TDMCZ4Fo5wt7aZ0BAJzIxN4Mdq+rCnI=; b=nDBIkTsEsgeKia8TyvWU2HPyUS
	gBBQVk7Bahqv+gqCiMIeiP9tVDLGHkt4CIk93B1b6ee8MInkm4NAofmW0qHqPPxXbL4piBCBg6G5o
	2Wlsk1/1R6bgO4+7OYQDg8it5ChwrYMf8794pmGvDCsYhXkCTa1GkDuxVsZUiFLkjSko/+M8CrIN/
	LJszPY6++pKa6rgzj1qNE7qUdlHKP9eB9z17e5v8TpXmjTUUSDl173AmDM7MyZoPgf//HJaaHAyf6
	VWIyegn3Ybzs2D19J/BxEHO7+OtQ8WQqjrTqaalc4EV2o8hzNpxPaLgZMhcVHQBj8puYCfsKaesLC
	egAq5ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlrm-00Amg4-2F;
	Mon, 10 Jul 2023 08:03:30 +0000
Received: from mail-psaapc01on20701.outbound.protection.outlook.com ([2a01:111:f400:feae::701] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlri-00Amf0-2F;
	Mon, 10 Jul 2023 08:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myp7yOX15s8j1koUdJto8rh9u81QF17qe4Aho+C7DrYgF8TH7sp7RBQHg9etwdY5FR7n4BGwf8X/eEQHrqzRu6TiG7sZOBO7lvPn13voiLbBsuKrN1BQNnMDqWN6VqAMH+2ir0lmwSuaGFCHHWM9+io1fTf8T0McOGTTnDWTpdtqNua3YTSGw1+FhsvzIP0LrjCt2lRbUSszbjIOU1zfbZFPK+t1IRSs/RYxsSJe6S5PSKW+OXY3kVECmoCokzCnA6w8KKTSwBF+L7ghKue1ucTtkIZlr564NyokNzCvM/mEeeLFAW1M4eBEioJ7oMGToZxVw6g63bxWKAe9QO3FJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4pUByCV3tGE1SRtqrtixuF37WoZ829dnL4pXaeP7WE=;
 b=NSeuhsmqXDIf36SczIT1iWzlNoN3Dok49OvIBN4qoA+Kc+o9Euk8faZwUSGD/eGMb/u8A+pwMq/03qIdDR04reSfLfvJgvxJpMONEv4gF9jmXnfCf+hL11dSi7HIExflfnNsbouDbgCpheZAao1OVjdaPAUCwpprZPfoca6r+fw9pr7jZKbETyrkLBFlkWZjpxtgicXJ09CrPWJ9JPWqOwpjmJM6CIdY97d6pAPlciuhpfIJqF1QcbYc7STs7/q/JC46RSXViYgSs8QYDairGZmRz370LzZTSFtfi7aQFnf8II6z54Lsda7uhm9U6qZ8sZlfrDNB+HSXfly4Rxl36w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4pUByCV3tGE1SRtqrtixuF37WoZ829dnL4pXaeP7WE=;
 b=KPFNWO14vuZ9lxYanod4JOCge0sWOuNfJ9K8fOnfyhb5nzCsjFIxA7AFccS1wH5kBPJ6rEkKPRj1TefRwV9fenO79d4j68raJpFK9ab8vH+MZF4Hl7ITdcLa5kMH3+DYr2UWWn52H2F5u501seGIO4d8zWDVhWWV7tNKa0ztcohRJuH7KDIJRsnyuxws1kkd9kH9J6sqIqIqLk9VJVthZBV4Hto5PQdy4fzYMRzROMRQyARe6xkUdIDoifbjt/MUxhg0v0uR0ogIyUGe6uRoUw5saxeaYzOCVeX3t65KD8mSrQf2G2bRu0wfdNPoMTaGUbiMEI2CQuEQHbC+ALZhow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com (2603:1096:820:cb::11)
 by PUZPR03MB6985.apcprd03.prod.outlook.com (2603:1096:301:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:03:10 +0000
Received: from KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::66e9:429b:7b34:639a]) by KL1PR03MB7221.apcprd03.prod.outlook.com
 ([fe80::66e9:429b:7b34:639a%5]) with mapi id 15.20.6565.026; Mon, 10 Jul 2023
 08:03:10 +0000
Message-ID: <d3accc39-0c26-c5f6-9437-bd26182aed55@amlogic.com>
Date: Mon, 10 Jul 2023 16:03:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V2 0/2] Add pinctrl driver support for Amlogic C3 SoCs
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com>
 <CAHp75VcEUre4RVAoMO0Tg1uRdeOBr-ZLeX9ppNx+Nc0ZdSrtiA@mail.gmail.com>
Content-Language: en-US
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <CAHp75VcEUre4RVAoMO0Tg1uRdeOBr-ZLeX9ppNx+Nc0ZdSrtiA@mail.gmail.com>
X-ClientProxiedBy: TYBP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::24) To KL1PR03MB7221.apcprd03.prod.outlook.com
 (2603:1096:820:cb::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7221:EE_|PUZPR03MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb993b8-da5a-44f5-346f-08db811c19e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QY2Cxzlv3joEl/zNo98jYtV6Q83QItbBXYGY7hBXoaqScBnwjSvB8QgsaDkqbM+Hp+pqeWGyvQZaQMvDhZa/j8PJNhZ8l2bGj2Un6A38AoIDJ2kANv23fOuMrGdGffCiLH8bjjOKQKLIruWnq79OQfQU5qZK3P7IKw89AzB+mh1Vdqq5OVVvd9chuvZiT6NOBl9BFOzaSba0AA3UT9fR+VGAX3OkwbstoGHS8wJT6nB9Klo4x/dU509uC+L3BStzo1Uc6fleKHbDeH2VveXXfgsaA1ncLAsmdXh/pccCKrzvvHwyNle4jgzDzkm3vF690ymtDl1VFWTBUs2NMnSSxl8nnl3weSmAjMM3WcBGFU8tgDPLH8QFO+9M8nWodrjN12Od8p7wAVHojKWjag0QUyv1JLfGyBUVEObcfe0O1i/cSrSJ0p17VkgPvTN8QsgHRdJO8bX0CcOlUcE5XX9HEviGRH9lhzDTF110LJdtsB6pp/NNREa09IuwTDaU5aoZDCUDhiNxjn+zFFB1RipAte00De8E1qZdGZlsrDox85S9job6tlwBlE3ueqX5fhd31uE2GH5ZT4iwbFDCUc6eV2eGuvCYVmsBFBDOmOvrr72eG7pvnt//IWmhKpcpwwqiZ6vPSE5MfoOiyMLq/bBDVU7O4kUld+VgD+z5wO7sGyd2HQqe2Dxo2APCYz+aqR8gB35rxjJ/SW2AI4KssTLDmfv3arYwfNougumWq1HlGHM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7221.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(6029001)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199021)(86362001)(31696002)(38100700002)(38350700002)(31686004)(36756003)(6666004)(6486002)(52116002)(53546011)(26005)(6506007)(186003)(966005)(6512007)(2616005)(44832011)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(4744005)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFJGT0pPbUVMbDFDTjZOY0kxRExreGVISkJkVGkvVjNhS0RXZGhoL3MyU0ds?=
 =?utf-8?B?SEFzcjc1RWJraEFhNldiTEtCMU5ZYmYvekJ0NlJJUW9ydVluL0FZd3Y2a2Fl?=
 =?utf-8?B?SDZZQ3AvTmh2SWVuTFMzeFA2eEc2ZXVGM2J4VWtNbm9CTTBlYjJaaVZJakZo?=
 =?utf-8?B?UE1YVk54NVhKb1dQYjdOL3ZneHdDWXU1WVJIcWZlNVE1UVA5cVROQjF4ampL?=
 =?utf-8?B?dEUwS0s3cHpNQU5GSlVZUzBwUG1kd3dFVkhQa2NZdXBlWkRJN0ZnYVlLUkVJ?=
 =?utf-8?B?MWVXaUVXYSszOEFhcklwOEpzYmlvQi9wUHB3ZkVuWGhZUVNQSllXSEZ3TmRp?=
 =?utf-8?B?aWxDME9NWmNpWHVocVd5NzhMYTg4Q0ExdDU3cGhPTTZMWWM3WTlxQUVvanJl?=
 =?utf-8?B?NDZGM0c4RmU1QTFDZUVlNHcybks2aG9XNHd4Qnc4Mm1vNDUzRm9va2NzM2hJ?=
 =?utf-8?B?V1JvMzE2bVhIWDJUWU52c281Rm9WRmlGdURKcEFEL25xY0t2Zi9wbjI2NVdK?=
 =?utf-8?B?bTdsQm9UUTJ1MVFZRlMyS25ia1h0SWJEY3Z4dmp1aEI5b2JhSUNxMzdWYXU2?=
 =?utf-8?B?b2tzTjVYOVVVZ2l1ck5oNk8xSGcwSG9kWkhvRFFYV0tPWkNxY0J6T1Zmcklt?=
 =?utf-8?B?cGZVbnoxREdRanZtZnRpTHZUZ3VTL0hUUStkdjZHL0J6WDlPVTNzdm5XYW1D?=
 =?utf-8?B?TjhYWkJRUkJtajhDZzd6NG9SREJjZTY5R2VGSE90K0lxQ3hKRnhZL3hMYkZH?=
 =?utf-8?B?cFNoSDlCNXNPdWJOM2x5WXEzalBaSWFnS0VVWWJDbHZXVVZod2RUWXMxb2NW?=
 =?utf-8?B?eHUwdWtRRkE1ZStVemVwMEc1NDVOK29qUkN1aXpSejRvRzQzNlZPd1pJS3Zn?=
 =?utf-8?B?N1drNUkwWUdteFh5dytXR1Fsc0l3Vk1UQ3JpU1JFalZSZTZWL21wMjM2TE5C?=
 =?utf-8?B?ek9jdi9Jd1llOThFMUxiODhqY2p6cHZXZC9hYU84SG8vcTRJOVFPdzgrUUFI?=
 =?utf-8?B?VnBDelRmTWtROVlsUmNYM1VQRlV6WHZ0cldTMEtSQU11QW1zeWQxNm9USlUy?=
 =?utf-8?B?TUZjeHJ1dHZpc2FqVm1WV3Z6OWRNcmRtVkpkVVN0NHVGbncrbDJTVGl3NlM0?=
 =?utf-8?B?cmIzVDlPYWFlVUlTeHlWZThqdHU5RW1WVXBKZzJuQ0tpRENxYUtQZU5Vc2hK?=
 =?utf-8?B?UjlCYzgycEZGWldUNXJLRzhZWEJVTUJqYUFJM2IwYnlZZEp4SGJ1cDJPY2Ux?=
 =?utf-8?B?RnFtWnpCeG9MaFZmbHpYSEpZTkxBN29DNjkrTEoyWWFFQUFWeCtyMjRjSHA2?=
 =?utf-8?B?WWJHT25IM2J0RzY4RHBSN1hMUkxBeWRjeEExV1lNTTJmSWVkTnFnaEFqck8y?=
 =?utf-8?B?Unp4Rm40VnBDZHFDZmpzQTN4L3lDWnFTbGZvclc4ZFlLTHlkVXRRYkR0SmIx?=
 =?utf-8?B?VHpvQldHSGljNzIrQmp2eDVRVmswZXBxTUxBMzIrejI1ZXdEeTE2QmhiKzRO?=
 =?utf-8?B?aUF4Q3NGc25aYXlvd3VVN3B0N1J6eFJEOWlySHhGNUlHL0d0OUNMbTluOWhV?=
 =?utf-8?B?ZHRrNnI1bkNWR3lna0xzVGdPZHJWWUJUMjRZa3lqbFQ3RlNaSTFHZGdaeTdo?=
 =?utf-8?B?SnE1UzErQm9WK1EvRHlCZG5Bb3paYjdqRmN3QlJEOXk1Nm9JVUpLcnJveGhp?=
 =?utf-8?B?VFVDYkYxZmEzRWU3MkdBQmh1aGR3TFo4c0lRYXRnUm4ybU1QS2dhM2FHU1cr?=
 =?utf-8?B?OHcwYncxWEUvNUxGWjJRMWNEQVR4djF2Q2lJUVVHYklVUTU2elI4bjZxUDhk?=
 =?utf-8?B?VU45K20yVEhZdUJVVjJOWTJBNFRzWXlyL3ZpU1JrQkJDOEdGaU1Na2k2MmlI?=
 =?utf-8?B?QWVuZlg0RUxNVVRuam9XSzZwNksvbW9ieitod0NITWxsbUN0bWpBUkdEVU8y?=
 =?utf-8?B?cUNDdE15aW0ralVIeHpXYWpVb1ZiS0Zzenk4VlltRkNLQmI4SUJLZlF4bHpl?=
 =?utf-8?B?cTdac1N0WERQMnFpZDMramx2cnVNVG1COFRhcXNxczluRWNmMmVmVEpyVUdF?=
 =?utf-8?B?cDNPbmVwMDhTVURDV0JnbENpb01vNFJkcjQvL2lMcFlSYkxkbE1Xa0ZzaFBi?=
 =?utf-8?B?S2FHSmsxSE5mcnlFL3I5WVhYbzlmOVRUVlg4ZE9ZUEJrVC9XM3R3ZGlOOGcv?=
 =?utf-8?B?V3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb993b8-da5a-44f5-346f-08db811c19e0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:03:09.8960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IeRV6fPyLLx4LseN+Z3Ya55XK8Qg+GPVuh/NI1uYSiO6f4Gx6l6cg2IBsdIGV8g7T9jY8eEOKCbTEbk/ibeAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB6985
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_010326_807157_3C6FCA91 
X-CRM114-Status: GOOD (  10.30  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW5keSBTaGV2Y2hlbmtvLAoKT24gMjAyMy83LzEwIDE1OjI2LCBBbmR5IFNoZXZjaGVua28g
d3JvdGU6Cj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBhbmR5LnNoZXZjaGVua29A
Z21haWwuY29tLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMv
TGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0KPiAKPiBbIEVYVEVSTkFMIEVNQUlMIF0K
PiAKPiBPbiBNb24sIEp1bCAxMCwgMjAyMyBhdCA3OjI44oCvQU0gSHVxaWFuZyBRaW4gPGh1cWlh
bmcucWluQGFtbG9naWMuY29tPiB3cm90ZToKPj4KPj4gVGhpcyBwYXRjaCBhZGRzIHBpbmN0cmwg
ZHJpdmVyIHN1cHBvcnQgZm9yIEFtbG9pZ2MgQzMgU29DIChDMzA4TCBhbmQgQzMwMlgpCj4gCj4g
TmVpdGhlciBoZXJlLCBub3IgaW4gdGhlIHBhdGNoIEkgc2VlIHRoZSBjaGFuZ2Vsb2cuIENhbiB5
b3UgZWxhYm9yYXRlLCBwbGVhc2U/CgpJJ20gc29ycnksIEkgc2VlbSB0byBoYXZlIG1pc3NlZCB0
aGUgY2hhbmdlbG9nLCBJIHdpbGwgYWRkIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgpWMSAtPiBW
MjoKICAgIEFkZGVkIGEgY29tbWEgdG8gdGhlIGxhc3QgaXRlbSBvZiB0aGUgYXJyYXkgYW5kIGEg
cGVyaW9kIHRvIHRoZSBjb21taXQgbWVzc2FnZS4KCkJlc3QgUmVnYXJkcywKSHVxaWFuZyBRaW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
