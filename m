Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D36C6FD1C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+c55zKgtRK15OYy/+okMcTIqzVKvcAaq2+q2JyehCn8=; b=ajxBadl5JzsvMoF1zPJvIvSKY1
	F/F9RLCH4kMRDAnkLYpc1Ol7zzcKcFeyAgHoBthQLk64NaZcA3u8a0GbIMJKePTtoJaADdmuq6t3A
	yPKg0Z2cTFSLXR0o4k5dtL4DUEhnacYiabWLwnRDmOsjJi9bNJKx8Qmlo+nxNbppB3kYO0WFIdqhs
	Cc2eBZ+BZPCNJ/3afvtPUCbl8fUH8oEHkimfe1iqDS48DIarBau8Iodbyi1jmzOWHlYKaxbn8DkZX
	+d3gdGnDZePUieYe42p2LkhJBgyrazQU5XxI+hAJkqsiUJpLX8ZLe6JAli52HyosBPhPGZbEMx+O2
	kB4Wr+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1petB6-00F319-09;
	Wed, 22 Mar 2023 07:46:36 +0000
Received: from mail-psaapc01on2070b.outbound.protection.outlook.com ([2a01:111:f400:feae::70b] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1petB1-00F2yI-2C;
	Wed, 22 Mar 2023 07:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dm1tRkYvo0XDzx1kYEp/4dQ+pKg2eDcWV+ezWu2r1sFrwOFFFn1VLGEbLckilDnNhgSo/XHje6PHxK/41+guK3hPgEKR59h4reGzCGMyB/RXkLMd2UhGhZMpTzWaPfS+ItAYjQN/oC/z2EEFWNVFpfBXjec83Mvkuo/Wep3iXfZ4dpcQQ2IWTCrzcsG1VyhWmMd9wk/4LqIEvrNmxE6tqiEcq5xzwy7H3bxU5TrU59T0nM1ULn8mwXODjS5gPR9gy66mN9WwlzxDa9r4zLu/i3aW4C8jYhc6utellDoCGD10XtjoB9e6UvFrSJi+3SXyrXyGEadp1nDdU4A4EPJ7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dg3e+nbqaB4EjGFuSk/oGwyeaKBflpxfE0oSZwEW0s=;
 b=leZHhNZ6l5i2Hmtaxn/5Ogz9Nnem4Gk2vNzPVecziLhxn149w+eWWjdFHTct+AjJKyNe9RwA6bb9JmUY8OYnRFoQECCwWeP7L/IRhKyE33XPZRImIQl71VdTxggObonBebD0QsqzCKpDzh9JA+BdJ8NXUPL+I8WFtaIuQbzuQBfpIRTJwH9vtpt1M/liLtFRv2h8yPKLHX7t2LdnhUZYNjimAXaHD593YQzi2BkId2UOfIe4A8Js9E35RwfSd9cy5KjBLALLQsE4BJXB2gxFjnSZ5Oa/HP6wc4NeK4hrkRxmZeCwStp0bYv1qjiaCmeLkrrIENBvnxqXqrudgt5C2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PSAPR03MB6329.apcprd03.prod.outlook.com (2603:1096:301:5a::9)
 by KL1PR03MB5522.apcprd03.prod.outlook.com (2603:1096:820:56::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 07:46:23 +0000
Received: from PSAPR03MB6329.apcprd03.prod.outlook.com
 ([fe80::3262:d4e7:7c19:dcc1]) by PSAPR03MB6329.apcprd03.prod.outlook.com
 ([fe80::3262:d4e7:7c19:dcc1%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 07:46:22 +0000
Message-ID: <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
Date: Wed, 22 Mar 2023 15:46:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
 <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
 <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jsfdy77n8.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR01CA0164.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::20) To PSAPR03MB6329.apcprd03.prod.outlook.com
 (2603:1096:301:5a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR03MB6329:EE_|KL1PR03MB5522:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c97c4b-cda2-4aec-d31c-08db2aa987c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c6n1Jt4/GhBW9UdkW6d/zJ/WkTKwjO+Nj00QQJW0WlMzozEtS6YVti0xAhBSY39FQb2PUeis2MlxVR0eYyXq40eJTdtazuV/QDwuAzSMaZSSvDnGWk38lDtY7vMejVkLsTByI1De98vG0UMRRXfCRHyiO185GxD6i2/9hXLXon5JnVPKHYafmivG2mUgyJ89dBDpM9O4vc8FldN4FQScWjdAo4yyEoVotnaWZCsAahoToNBBZ6BOUlQDXHBDjZWIEoCcrsr9uncG9uNstTizSW+V9gzH25eNwbNVL/2aJSiURLqsJDMXkpxMdH3/TCTO3d856KkVphsBMI4QtmK8LK752tqFY0vRMgImQLZH/MXtsaWsq2AVaDIrl6tnw2DeUu0OlDy3/dbAp4NYegUg+5OdaAa7JwMiKIi/BCPFxRWhOna6j1QxKrfbG9ZtYPfQ81KuSWpCPRHyiMy2Wz3/R5dhQg3i1K70ISLb3b21jZqmtwuU5wupJylYPFvmimRLpuLGPcAA5VgRT/f8eGFqkASKqeAWj7hcrNL9+fX1YSU9D7ITPeSwwXxoWk4yjN8iU5r4lT7XEnepcf+PdMGI/FTYTMIxtE2tLZ1jpAUhcOwCbE3pSR/rsuiht7dccx/OYeD/Nt+xMr7yJ518GTgFbg1wspcFx8M2pqeD/LZa9nG8k+x98gaXOCmF5OWpCEBlFGVdAXbxKGLhLFJ9bIYdgsWRD/WF1Yz/OR4zrDcgjdw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6329.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(136003)(39850400004)(376002)(396003)(451199018)(53546011)(186003)(2616005)(31686004)(107886003)(6666004)(6486002)(6512007)(6506007)(26005)(38100700002)(110136005)(316002)(31696002)(478600001)(2906002)(86362001)(83380400001)(44832011)(54906003)(36756003)(7416002)(4326008)(8936002)(5660300002)(41300700001)(66556008)(8676002)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SCt1ZkZ5dldyNXFJUEJiNFpMRUZKWFhhQW5tSmxBVElST3lDSjJXc2oxSno0?=
 =?utf-8?B?TlhzSGlCZ0RkSXVYWElhWXhKYlJnVDBrbW1RU2thTDFOWVBWaGs3di96d2wv?=
 =?utf-8?B?aHdRWjVPRTEzNUh5RlVCdWtHMHRsS041ZllOVVQ3c2Zib21oWXJzak11am14?=
 =?utf-8?B?TEc2Wndsc2FDSFh2V1lrbWl6UmVMQ0sveGY1YjlBRm5BZGVJVmZVdUFlakVE?=
 =?utf-8?B?QVYrS0tVTERaSWVHbVRKWEI1aDl0MXVka3loTmJKb3NWSzNSRzRBcmgxMkJa?=
 =?utf-8?B?anJKT2FXWGY0R0dabUJxRUoxZ0IxejZJbldkUjIvRCtaS3YrZURsZDN2bTgx?=
 =?utf-8?B?K29sc0dhVWtYb3grQWU5Z2crU1c0a3VZUitHb0ZSay80dUJVYjdzTGZieWlB?=
 =?utf-8?B?RllqY2VYdUpjL005RnoxcHZEN3htUDhSZGFhYWhsbG4vcjFpNUJyY0t3cjZF?=
 =?utf-8?B?TlVMMk5yMXlFWGZmanV1SFpRdk85clN2YW5IaVBtQXR0V1pFRlljNlpFemli?=
 =?utf-8?B?MjBRSytiYWxtVmY2YmthVEh0VmYrazh3Zk02VVVab1ZLMHN0N0tOYkhqRVRT?=
 =?utf-8?B?OVlmV1NFMGNma0ZvQWg4d3BmMENCeVNhbkx1aTc0ZWUraWNkck84b2JEdEdD?=
 =?utf-8?B?NC8rOWszUDIzcDNCV3FvYkU2RzdyV0hUaTJpdXh2QTQ0YVhYNWZiMEdZZHdH?=
 =?utf-8?B?SkthTFN0dTZhcExGZS85SUdid3NHeTY2elFQVmYxVG5rTFVnY3lneUxSNHpw?=
 =?utf-8?B?cTAyQVRuZEM0UlB0VGZIR1ZhMnlZTUQzbHdDdTFOR1JpZlc3UXIvN3NiblRq?=
 =?utf-8?B?SFQvM293OTNpdlBYRXRpR1ZSb0dIdlNCcFI0eUZXUU9BMWlYdmF0eFAyK1hq?=
 =?utf-8?B?cmNCRmxFc3JXQkp4QXRCaHNEL3kzcXFldlFMd05xaGNMSTB5dXNNVWVMcVR5?=
 =?utf-8?B?REVva21aeXJlODluMjd5TS9sS1IvakcrMTMrZFZ1alNlUEg3OVoyQ2I0MmZo?=
 =?utf-8?B?TXAwQnkvb0VFTHJTaTg2UW0zTjd2WWhYUGNqdUdxOVNmd1pLMVFia1pEVmVy?=
 =?utf-8?B?WGpQUVM4b1ZNcEtnSEpXRHhleno4ZlpvRWFIdTZXWU15SUtvYW5CREowbWIw?=
 =?utf-8?B?VHN1QlZObTdVRGk2YkpOUnpTY0ZGMlhVUXpLbzRqeG9hRWthWjJaaGlvajFL?=
 =?utf-8?B?ZHZ6MTA1QWZ5azVzczd2SkZnUitOak1heDFXRTRjQVlsb2puOVlzT0xiaURY?=
 =?utf-8?B?WUk3RC8wdG13cXNBVjJkcXpCV3JxMWtBSWpHRStOOC9DcUU5QXRWZVNvNzho?=
 =?utf-8?B?VGhaS1lKTmhBcGx4UDhISEtqVnh5MnFnV2N0Q28zbVc4TmZDMmNTdGVPdUtT?=
 =?utf-8?B?cjBaM1pHa2Myb3lwNEZ0WGoxOWpqYWp5dE83Nlg3cXF3SkFVTkt2UkQvcWMz?=
 =?utf-8?B?YzNFSGVoZDJ0QTYzcTFnQWxpTmFpTk52Wk0vZTBRSk1tQkorUmhOdzBtRXJS?=
 =?utf-8?B?ZzZRZUpKZGoyVUNJbGU3ZlZtTlhiVUkzTVFmUHpmTWhKbjR4ZGsrRkI0dWVn?=
 =?utf-8?B?RURhdUJxbHNEU1dFNFFKcms0Qy93S293RFJCV0xoTC8rV1JwUXJQSkFuSzg5?=
 =?utf-8?B?ZnlPVVM2aitQVkJvRys0VGZ3YkFLNkhjZ2J3eEN4dGxIK2xXUng1TnA1MnRy?=
 =?utf-8?B?bmIybDQyMXVZWUdxaEVzWGhHSzlkLzgwazRFNkNNbXhwUlZKNmhZVnE1VSti?=
 =?utf-8?B?MjZxSVBtMUlxYnBSL0YvRkdUK0Jpb1RuNCtLeURzRUU1RHlBcWlPV2t0N05h?=
 =?utf-8?B?eEdUaGZjRysrZVJMcTltUFlrZCtVZnJjdDROMmhkV3p4c1lWTXF2bG4yWGVh?=
 =?utf-8?B?Mm5kSzlDTEhOcmd1aVdsTjRqL1BiRWlhbGh6blFwWllyWU5KeFBHKzRSVUZZ?=
 =?utf-8?B?SytqSkxRQ1pJeXRQaWNIWnMwdnBWYnFBSTU5bEtIQjU4TzFTaVZHeWRITVk5?=
 =?utf-8?B?S3dUNzByQzcxM05zblpYUlJCMmplWmV0RlpIc0lyaHExT0d6OWJCdE9KdnhQ?=
 =?utf-8?B?TWthc05wR2c1RjIzOEdaRE1UYWNYN202S1VoWXY4OUx6OWRhNEhEUjY3cHVp?=
 =?utf-8?Q?aGxBp35NzJr3kFZrtydhj6PPJ?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c97c4b-cda2-4aec-d31c-08db2aa987c9
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6329.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 07:46:22.1547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXF0JHVrCs8jYQZANYBZAFAD3QzAvROObfMXlwDap/oX+tu1w+4l85yaDYqOhHp7K2tG+J+o1U/3v46M977fpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB5522
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_004631_721544_348E8145 
X-CRM114-Status: GOOD (  28.71  )
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

Ck9uIDIwMjMvMy8yMSAxNzo0MSwgSmVyb21lIEJydW5ldCB3cm90ZToKPiBbIEVYVEVSTkFMIEVN
QUlMIF0KSGkgSmVyb21lLAoJVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+IAo+IAo+IE9uIFR1
ZSAyMSBNYXIgMjAyMyBhdCAxMDoyOSwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToK
PiAKPj4gSGkgTWFydGlu77yMCj4+IAlGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgeW91ciBy
ZXBseS4KPj4KPj4gT24gMjAyMy8zLzIwIDIzOjM1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3Rl
Ogo+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+PiBIZWxsbyBZdSBUdSwKPj4+IE9uIE1vbiwgTWFy
IDIwLCAyMDIzIGF0IDEyOjM14oCvUE0gWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToK
Pj4+Pgo+Pj4+IFNpbmNlIHRoZSBwcmV2aW91cyBjb2RlIG9ubHkgcHJvdmlkZXMgInJvX29wcyIg
Zm9yIHRoZSB2aWRfcGxsX2Rpdgo+Pj4+IGNsb2NrLiBJbiBmYWN0LCB0aGUgY2xvY2sgY2FuIGJl
IHNldC4gU28gYWRkICJvcHMiIHRoYXQgY2FuIHNldCB0aGUKPj4+PiBjbG9jaywgZXNwZWNpYWxs
eSBmb3IgbGF0ZXIgY2hpcHMgbGlrZSBTNCBTT0MgYW5kIHNvIG9uLgo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+IC0tLQo+Pj4gcGxlYXNlIGRl
c2NyaWJlIHRoZSBjaGFuZ2VzIHlvdSBkaWQgY29tcGFyZWQgdG8gdGhlIHByZXZpb3VzIHZlcnNp
b24ocykKPj4KPj4gSSdsbCBhZGQgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4KPj4KPj4+IFsuLi5d
Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmggYi9kcml2
ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oCj4+Pj4gaW5kZXggYzAxMjhlMzNjY2Y5Li5iYmNj
YWIzNDA5MTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYu
aAo+Pj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL3ZpZC1wbGwtZGl2LmgKPj4+PiBAQCAtMTAs
MTEgKzEwLDE0IEBACj4+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgo+Pj4+
ICAgICNpbmNsdWRlICJwYXJtLmgiCj4+Pj4KPj4+PiArI2RlZmluZSBWSURfUExMX0RJVl9UQUJM
RV9TSVpFICAgICAgICAgMTQKPj4+IEluIHYxIHlvdSB1c2VkIEFSUkFZX1NJWkUodmlkX3BsbF9k
aXZfdGFibGUpIHdoZXJldmVyIHRoaXMgbmV3IG1hY3JvCj4+PiBpcyB1c2VkIGluc3RlYWQuCj4+
PiBJIHRoaW5rIHVzaW5nIEFSUkFZX1NJWkUgaXMgdGhlIGJldHRlciBhcHByb2FjaCBiZWNhdXNl
IGl0IG1lYW5zIHRoZQo+Pj4gcmVmZXJlbmNlcyB3aWxsIHVwZGF0ZSBhdXRvbWF0aWNhbGx5IGlm
IGFuIGVudHJ5IGlzIGFkZGVkL3JlbW92ZWQgZnJvbQo+Pj4gdmlkX3BsbF9kaXZfdGFibGUKPj4K
Pj4gSSBhZ3JlZSB3aXRoIHlvdS4gUGVyaGFwcyB0aGUga2V5IGlzIHRvIHVuZGVyc3RhbmQgd2hh
dCBKZXJvbWUgc2FpZC4KPiAKPiBJIGFza2VkIHlvdSB0byBkZXNjcmliZSBob3cgdGhpcyBkaXZp
ZGVyIGFjdHVhbGx5IHdvcmtzLiBOb3QgcmVtb3ZlCj4gQVJSQVlfU0laRSgpLgoKT0theSEgSSBt
aXN1bmRlcnN0b29kIHlvdXIgbWVhbmluZy4KCj4gCj4gVGhpcyBkaXZpZGVyIHVzZXMgdGFibGVz
IG9ubHkgYmVjYXVzZSB0aGUgcGFyYW1ldGVycyBhcmUgIm1hZ2ljIi4KPiBJJ2QgbGlrZSB0aGUg
ZHJpdmVyIHRvIGJlIGFibGUgY29tZSB1cCB3aXRoICJjb21wdXRlZCIgdmFsdWVzIGluc3RlYWQu
Cj4gCj4gV2hhdCBJIHJlcXVlc3RlZCBpcyBzb21lIGV4cGxhbmF0aW9uIGFib3V0IGhvdyB0aGlz
IEhXIGNsb2NrIHdvcmtzCj4gYmVjYXVzZSB0aGUgZG9jdW1lbnRhdGlvbiBpcyBub3QgdmVyeSBj
bGVhciB3aGVuIGl0IGNvbWVzIHRvIHRoaXMuIFRoZXNlCj4gdmFsdWVzIG11c3QgY29tZSBmcm9t
IHNvbWV3aGVyZSwgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCAiaG93Ii4KPiAKPiBUaGlzIGlzIHRo
ZSBzYW1lIGFzIHRoZSBQTEwgZHJpdmVyIHdoaWNoIGNhbiB0YWtlIGEgcmFuZ2UgYW5kIGNvbWUg
dXAKPiB3aXRoIHRoZSBkaWZmZXJlbnQgcGFyYW1ldGVycywgaW5zdGVhZCBvZiB1c2luZyBiaWcg
cHJlLWNvbXB1dGVkIHRhYmxlcy4KPiAKPj4KPj4+IEFsc28gSSB0aGluayB0aGVyZSdzIGEgZGlm
ZmVyZW50IHVuZGVyc3RhbmRpbmcgYWJvdXQgd2hhdCBKZXJvbWUKPj4+IHByZXZpb3VzbHkgd3Jv
dGU6Cj4+Pj4gSXQgd291bGQgYmUgbmljZSB0byBhY3R1YWxseSBkZXNjcmliZSBob3cgdGhpcyB2
aWQgcGxsIHdvcmsgc28gd2UgY2FuCj4+Pj4gc3RvcCB1c2luZyBwcmVjb21wdXRlICJtYWdpYyIg
dmFsdWVzIGFuZCBhY3R1YWxseSB1c2UgdGhlIElQIHRvIGl0cyBmdWxsCj4+Pj4gY2FwYWNpdHku
Cj4+PiAgIEZyb20gd2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB5b3UgaW50ZXJwcmV0ZWQgdGhp
cyBhcyAibGV0J3MgY2hhbmdlCj4+PiBBUlJBWV9TSVpFKHZpZF9wbGxfZGl2X3RhYmxlKSB0byBh
IG5ldyBtYWNybyBjYWxsZWQKPj4+IFZJRF9QTExfRElWX1RBQkxFX1NJWkUiLgo+Pj4gQnV0IEkg
dGhpbmsgd2hhdCBKZXJvbWUgbWVhbnQgaXM6ICJsZXQncyBnZXQgcmlkIG9mIHZpZF9wbGxfZGl2
X3RhYmxlCj4+PiBhbmQgaW1wbGVtZW50IGhvdyB0byBhY3R1YWxseSBjYWxjdWxhdGUgdGhlIGNs
b2NrIHJhdGUgLSB3aXRob3V0Cj4+PiBoYXJkLWNvZGluZyAxNCBwb3NzaWJsZSBjbG9jayBzZXR0
aW5ncyBpbiB2aWRfcGxsX2Rpdl90YWJsZSIuIExvb2sgYXQKPj4+IGNsay1tcGxsLmMgYW5kL29y
IGNsay1wbGwuYyB3aGljaCBhbGxvdyBjYWxjdWxhdGluZyBhcmJpdHJhcnkgcmF0ZXMKPj4+IHdp
dGhvdXQgYW55IGhhcmQtY29kZWQgdGFibGVzLgo+Pgo+IAo+IGV4YWN0bHkgLi4uIG9yIGF0IGxl
YXN0IGFuIGV4cGxhbmF0aW9uIGFib3V0IGhvdyBpdCB3b3JrcyBhbmQKPiB3aHkgaXQgaXMgdG9v
IGNvbXBsaWNhdGVkIHRvIGNvbXB1dGUgdGhlIHZhbHVlcyBhdCBydW50aW1lLgo+IAo+PiBJbiBm
YWN0LCBwbGwgYW5kIG1wbGwgYXJlIGFsc28gZml4ZWQgcmVnaXN0ZXIgd3JpdGVzIGNvcnJlc3Bv
bmRpbmcKPj4gdmFsdWVzLgo+IAo+IFRoYXQgaXMgbm90IHRydWUuIFRoZSBwbGwgYW5kIG1wbGwg
ZHJpdmVycyBhcmUgYWJsZSB0byBjb21wdXRlIHRoZWlyCj4gdmFsdWVzIGF0IHJ1bnRpbWUuIFBs
ZWFzZSBoYXZlIGEgbG9vayBhdCB0aGUgZHJpdmVycy4KPiAKCkFmdGVyIGNvbnN1bHRpbmcgdGhl
IGVuZ2luZWVyIG9mIHRoZSBjaGlwIGRlc2lnbiwgdGhlIGNsb2NrIGlzIGEgZGlnaXRhbCAKZnJl
cXVlbmN5IGRpdmlkZXIsIGFuZCB0aGUgZnJlcXVlbmN5IGRpdmlkZXIgaXMgdmVyaWZpZWQgYnkg
dGhlIHNlcXVlbmNlIApnZW5lcmF0b3IsIHdoaWNoIGlzIGJpdDAtYmkxNS4gYml0MTYtYml0MTcg
Y29uZmlybXMgdGhlIHNpemUgb2YgdGhlIApmcmVxdWVuY3kgZGl2aXNpb24uIFdoZXJlYXMgb3Ro
ZXIgUExMUyBhbmQgTVBMTFMgYXJlIGFuYWxvZyBkaXZpZGVycyBzbyAKdGhlcmUgYXJlIGZpeGVk
IGZvcm11bGFzIHRvIGNhbGN1bGF0ZS4KClNvIE5laWwgaGFkIG5vIHByb2JsZW0gaW1wbGVtZW50
aW5nIGl0IHRoaXMgd2F5LiBTbyBub3cgSSB3YW50IHRvIGtub3cgCnlvdXIgYWR2aWNlIHdoYXQg
c2hvdWxkIEkgZG8gbmV4dD8KCj4+IEJ1dCBldmVyeSBTT0MgaXMgZGlmZmVyZW50LCBzbyBpdCBt
YWtlcyBtb3JlIHNlbnNlIHRvIHNldCBpdAo+PiBvdXRzaWRlLiBUaGUgVklEIFBMTCBpcyBhIGZp
eGVkIHZhbHVlIGZvciBhbGwgY3VycmVudCBTb0NzLgo+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4g
TWFydGluCj4+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
