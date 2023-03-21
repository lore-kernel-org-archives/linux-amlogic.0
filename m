Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1CBC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0nwdtwuRwyIXGwqPfEwuWAXSrfIyFBVpbcMGtRqFCk=; b=y706KI+97ptL1WhXDCBZ5JkPa7
	FpkvE7hrB9qws7p5PqCzlQIL6/KcaXt2LnVlRewm0t1rVEnDG1gQFttfa/g6RBggRVfeuplpi2teT
	y5LlBtk1KjiXFbhzIulnHttHr2IXGQ4T9ggdQxAYaxY7uQctCsKhsOKATLuYNiM4H6qUwwZ5w2Rq2
	qweefoGzWc/IuGJEbDWtNTKzVlKerh38RnnA0KeYbbLOdR700uEprg8toPBJVxGzRwSKv3sLVvXah
	3qtYtdY/yoppVPGjhqvBhZ584Z976pac5zc1jRgcPWGm79t8tueA2VAuB8vySkRvge+6DIbs6U231
	DOnLmiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRlW-00B0z2-0a;
	Tue, 21 Mar 2023 02:30:22 +0000
Received: from mail-tyzapc01on20727.outbound.protection.outlook.com ([2a01:111:f403:704b::727] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peRlS-00B0yS-2E;
	Tue, 21 Mar 2023 02:30:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPxW1nLp92zAA4RL1/eB2KQn1lYwo9sSrjs2qVmQjtwRh1SpbYeilRSV/+6j7TwlUMtryXFuJ9z0rukA0SZNeoGz9Lb2TEIalKk2MiitHm8s4soEr6bBxj4uVaSny9HliLkqArn79TJuCDoXtiNMaOLbmYTLUyW0jmjopTVQttNkFppPul0Eb37DvYZ8mFEhSQ+UBS5K+mNaD6yZ22RivGR20EeML4gw/glf/eH80tlq9jmAENg6tjbS9lK/1QzAFgcu45wyEGomwqIx5YrM/0tm6CV9zPTeK8jFrfS9PCMZNOuXz49NzOdodd2BoYON3bUydtIffI//qkor9SU/AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7xCt5bGts4l07TSUXTI5HH6jdlNYjXViQGoWIFmhqw=;
 b=JcewCIVqqybln2eFDpZmgoaIbvXhrlPi6sKKptBHylfEygAET7kjMN2VFQ+zWW8OKO4IXVohF9ZsJbgHiP3btvZHpLxl3w03thf9xxTZ9Op8bhMoVKs/rD2x7dwpWLj1ffEhYzbtSlsDxtEe5fcud7ATAsN+p+IgKw+hB+LgoS+3u1ZIHoEBjS9e0LxRe0Nj9c533hkTJFs50829h6z4OTz4x5b65GnDkW0g40ZVadUgISzxNZxR6FvsHjCAT27zTgWtMjhCAT5F4reNTIs4zpwDxVApiDpCRTZo/75L2AdlP86KlxbUDRM2UU6wZ1X7Bi/X2AzBWzgy3CULD6P3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PSAPR03MB6329.apcprd03.prod.outlook.com (2603:1096:301:5a::9)
 by KL1PR0302MB5204.apcprd03.prod.outlook.com (2603:1096:820:43::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 02:30:09 +0000
Received: from PSAPR03MB6329.apcprd03.prod.outlook.com
 ([fe80::3262:d4e7:7c19:dcc1]) by PSAPR03MB6329.apcprd03.prod.outlook.com
 ([fe80::3262:d4e7:7c19:dcc1%9]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 02:30:09 +0000
Message-ID: <b5e647e2-4561-e6c1-016f-2c3b260916bb@amlogic.com>
Date: Tue, 21 Mar 2023 10:29:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230320113445.17260-1-yu.tu@amlogic.com>
 <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
Content-Language: en-US
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCAE-ihq9oeXc=GqUEHVKUYM+n_e+2_5+gDMTGQcEEhRtg@mail.gmail.com>
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To PSAPR03MB6329.apcprd03.prod.outlook.com
 (2603:1096:301:5a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR03MB6329:EE_|KL1PR0302MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b65780d-c081-4568-0d99-08db29b42fb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2C0spAM9Ci61ur+DH2qMJ+S6UH3aHvis9AP3xEV8J07b5wkJOb0HSAxoL1j4K92vVou55Z+1zuywZXZCVkdLmZ2YEmpye53KDb23gHukfnW9cMWvTN6SVffvEvCZzEz2ctlyyEGMqf9AX/v5+CjJFVHwOZ82b39k36MbyTr3s8lVXg6LpO5lL25QUgF0WhTB/cEGVML7vYA8dPZmq7G87bKGKDCoeJRy5fUxw1EzjsGaWw/31d5e+1BH50SVe2TOFNQ3t6TpjK0DZ0IDiz6r1utYVDQSem5zgGo54t6nNfrsuJow67vOBHXgJo+5tb5fVmO1Ja4MHiJ3rTsJu/3NIVyH58DnkbWuwiIe1bahHdGiJBa6rM5/PGY0+hdGsuZcTu7z7qpmc3Pcl4Y7PIa0sX939r2Rvgf8bI47qHoN0gp/ZTH5te2HlAomyJaz9ByRZYloef4hDkUyK7tTF+CSIIuZKcvUFeUQ5Rva8smrZX7VImZ/6wfzdqOMZ3Sm4aLpjTcIohwBARd9T87Jz0wrR3UxuvFyNzYIoZJgisAnDAxVf42is1/Neo7Kzp0VR3hsy3Ol1XxrrQEcAjk+dS0yjMNqh8Ah016BoeXVVIWBlnPls6Mq8wzgZXQbze5dnfb5M7c/+QY6EK0n52HoLGfZB8SQ93fr2UsL9IpRkW90hqQ5Q9m5TjnDJHasIdd+M+5G6OC9p/SP9J6pYxHXw5mj7IifATD4LpikkwlaafpTZtcnOOAzpksiwKUXy/RnL2mLaR/c4iZDg8OHn2xpOA18qOzVsmLvAQYgiRMpmsyPniQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6329.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39850400004)(366004)(376002)(346002)(136003)(396003)(451199018)(44832011)(41300700001)(8936002)(7416002)(5660300002)(4326008)(6506007)(86362001)(36756003)(31696002)(38100700002)(2906002)(107886003)(6666004)(83380400001)(478600001)(6486002)(2616005)(6512007)(26005)(186003)(53546011)(31686004)(54906003)(316002)(66476007)(8676002)(66946007)(6916009)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UzJHZFRNdEdza2dQblBRZVR5TGFyTzVITW9xZG9HUnNsSE91Q3NnSlkvalF5?=
 =?utf-8?B?NDBtQnp5UmtkRkV4bmdGbi9aUTVURzQ2STlzM1VITFNENCtEc2tPU3cxMjd3?=
 =?utf-8?B?Q1RFUng3V3pzampDQ1RIeGJmUmRBM2VhOEkyaGZlK2hwN1AxaUVKTnJoVm8r?=
 =?utf-8?B?QkgyT1FTcG1RbUhRek1hRG9XTWZXY010UmJBVzE2dlFMMkxhZWwzck9NbXZt?=
 =?utf-8?B?Mk51Z0tMRGhvS3JuZ1l5aGIvYStzTzlTODlFZHpZdXBSNW9sbXBJUGZtZkl2?=
 =?utf-8?B?WlN6VkZTQ2lTaVhnNnk5cDJVN1hGek41c1prOVJFT1U2alBqMklpanNaZEow?=
 =?utf-8?B?akZPcXNzRU1rMldNSVZ5c09kaUtNeUExaTQxQTZYYk80OE1RZHlRQ2puSkJn?=
 =?utf-8?B?NTRDTGFZWUJZS1RoaDNLTVVFd1YvM2xYYTJWeVUwczNIWDU0QzdWZEg4MHhY?=
 =?utf-8?B?S2JYMnk3d1lMMHdYbWk0VHBYd1dlTndGODNVb2x4ZUltbjBhRGNwWm0xVUtF?=
 =?utf-8?B?c3lmSjEydXRuUjhuekdQYkFvbnZDU3BlN2lrQ0dWYXdaVGJDV0lSU1hSSDN6?=
 =?utf-8?B?cW1iL1VlVGM5YWdkZzlzbnVVaFlWQjRIOEhlalRjMkN2QXpoSUFXNFptWUlj?=
 =?utf-8?B?YTNHSTdTSFVoZmMrek9xU2pKWm9MMHZaV1dqNnIrcFUxTFcyQUMrdis3UUs0?=
 =?utf-8?B?azNTbVRlNm1HUko2UVczZ1ZvOStKQjhhQUJnVkdkOG5uYTNYcUh6OGJhQVJn?=
 =?utf-8?B?clpXU2tEa2I1bGorY0txR3JERVZrVm1GL05DVjJZdzNQOFJNSlVwa1VIb2Q3?=
 =?utf-8?B?dThJTFpCbVZXNUl0YThLSVhMYmV2T1dIVmMwb05QWllpSUlGN0lZZjlYckdX?=
 =?utf-8?B?K2ZWSldsY3A3NWtDRmZ6ejhNeUxFOStmNjJOZ0RTb1pNS3dvWlJUMXloYWxj?=
 =?utf-8?B?RGpSbVIvU3hINnM0cVRISlBQQ2FJODVoR0ZBeUNsTnVkTXZFT1hUWUVXN1R6?=
 =?utf-8?B?TU11YUpYanEzNm13MUZWZW5XYW1EVmtMRnVreDZhdXI3MkNOcWUxbHZ2WmFB?=
 =?utf-8?B?aUNtZ3IrUDhQSzFCc2lPSFdnamtuLzNiaFFzZU9qdUlOaU9leXBuakM0VTBt?=
 =?utf-8?B?Ykw3KzdtSkdyRmw2QzlNd3ArOFlpeFByYVR4dVBDakEveGFlbkI5VU9HVkpF?=
 =?utf-8?B?Y1JVM211VU9BZ1ZwekpvS2M0L1lnNERmMzRPVnl3THBTa1kzMlpiQkkrM1pW?=
 =?utf-8?B?U1htU3VrZi8vSFdJY3JzUHlkTDhHQ0NGUm9SdGZkOEdaZnR0UUE4b2JXUDQ5?=
 =?utf-8?B?SWY2OU5WdUpYWTdTYU9uUlduRXNnV3NlL0RxbU8wcm5DbUx4eTRkMk5kaVhQ?=
 =?utf-8?B?Mm80TGdteU1YaTUzT0ZlZmgzSTRzWGliZlJmR3JBVVEvZkJiV0hzRVFoRloy?=
 =?utf-8?B?OG80TzRYQWdxQmhpeUJKNnQxcGRLNldEMjNzMTBzVmpGNjJJQmpGbndlbE5B?=
 =?utf-8?B?cERrZy9ZRnFVY0ZwdDUwdjFPS2N3SjA5cnFOYUxRcnFERDJFd25jdHpjZ0NR?=
 =?utf-8?B?QitFL2xWSXVJc01pUXF5aXRLUW5nZUwvdU4xM3dyQ3Y0MFNCK25xVFdRQ3VD?=
 =?utf-8?B?OFR3dTRNRVN5MmtjN1ZpWGRxM2VkNllJZUZmdHBxNkhlUGpRRklnQ25zL3NL?=
 =?utf-8?B?VWdxckZkK3lML0V6Z2t2MDBadE1QOFdsN05wc0F4YzZ1eXJubWRHajRHQW94?=
 =?utf-8?B?ZS9EMExHZWovYkpDSFF5enJtZDIra2lGY21lTzVmZndqVm5ZcEZ2NUdvcHJs?=
 =?utf-8?B?YXdiWitwNmwxWTRHbjZOem9aMStSZEw4bnc2RlRUa3pDYWZZUkdCKzZmbXpU?=
 =?utf-8?B?NzdrdHdUaG5PZm54eDRmZmkyRnl4ZHhRVVhJSFYySTN4Uk80T21CN20yMXN0?=
 =?utf-8?B?emxZWGs2aVUxc3k0ODBKN0Q3R3BJMmx3NFdsNWZQdzhHRnJ0TWtVYnMrdkc3?=
 =?utf-8?B?V0MzMlZGRVpvQ0hUd2RlcTJNRDdFUncyNDgwUjNrWkxnWCtrdCtSOEUzejZn?=
 =?utf-8?B?KzU3dkR4cWJpUndWcFBBOWlnQy9RdGtydXUxS3dzc1dYczlYOUFOME8rbjJh?=
 =?utf-8?Q?+DJoVrrSjTqgAUk0chEbf8Hn2?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b65780d-c081-4568-0d99-08db29b42fb7
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6329.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 02:30:07.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qysil+Zs4eISICnIpOdeD9tdirY+re/pLQKk58DhfjqCKqwIosa5w10hqxK29t8qiC2nupS0iI09+7GbaNCn+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0302MB5204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_193018_751986_DBE2FC2A 
X-CRM114-Status: GOOD (  20.58  )
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

SGkgTWFydGlu77yMCglGaXJzdCBvZiBhbGwsIHRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KCk9u
IDIwMjMvMy8yMCAyMzozNSwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBbIEVYVEVSTkFM
IEVNQUlMIF0KPiAKPiBIZWxsbyBZdSBUdSwKPiAKPiBPbiBNb24sIE1hciAyMCwgMjAyMyBhdCAx
MjozNeKAr1BNIFl1IFR1IDx5dS50dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+IFNpbmNlIHRo
ZSBwcmV2aW91cyBjb2RlIG9ubHkgcHJvdmlkZXMgInJvX29wcyIgZm9yIHRoZSB2aWRfcGxsX2Rp
dgo+PiBjbG9jay4gSW4gZmFjdCwgdGhlIGNsb2NrIGNhbiBiZSBzZXQuIFNvIGFkZCAib3BzIiB0
aGF0IGNhbiBzZXQgdGhlCj4+IGNsb2NrLCBlc3BlY2lhbGx5IGZvciBsYXRlciBjaGlwcyBsaWtl
IFM0IFNPQyBhbmQgc28gb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFl1IFR1IDx5dS50dUBhbWxv
Z2ljLmNvbT4KPj4gLS0tCj4gcGxlYXNlIGRlc2NyaWJlIHRoZSBjaGFuZ2VzIHlvdSBkaWQgY29t
cGFyZWQgdG8gdGhlIHByZXZpb3VzIHZlcnNpb24ocykKCkknbGwgYWRkIGl0IGluIHRoZSBuZXh0
IHZlcnNpb24uCgo+IAo+IFsuLi5dCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi92
aWQtcGxsLWRpdi5oIGIvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaAo+PiBpbmRleCBj
MDEyOGUzM2NjZjkuLmJiY2NhYjM0MDkxMCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jbGsvbWVz
b24vdmlkLXBsbC1kaXYuaAo+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5o
Cj4+IEBAIC0xMCwxMSArMTAsMTQgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVy
Lmg+Cj4+ICAgI2luY2x1ZGUgInBhcm0uaCIKPj4KPj4gKyNkZWZpbmUgVklEX1BMTF9ESVZfVEFC
TEVfU0laRSAgICAgICAgIDE0Cj4gSW4gdjEgeW91IHVzZWQgQVJSQVlfU0laRSh2aWRfcGxsX2Rp
dl90YWJsZSkgd2hlcmV2ZXIgdGhpcyBuZXcgbWFjcm8KPiBpcyB1c2VkIGluc3RlYWQuCj4gSSB0
aGluayB1c2luZyBBUlJBWV9TSVpFIGlzIHRoZSBiZXR0ZXIgYXBwcm9hY2ggYmVjYXVzZSBpdCBt
ZWFucyB0aGUKPiByZWZlcmVuY2VzIHdpbGwgdXBkYXRlIGF1dG9tYXRpY2FsbHkgaWYgYW4gZW50
cnkgaXMgYWRkZWQvcmVtb3ZlZCBmcm9tCj4gdmlkX3BsbF9kaXZfdGFibGUKCkkgYWdyZWUgd2l0
aCB5b3UuIFBlcmhhcHMgdGhlIGtleSBpcyB0byB1bmRlcnN0YW5kIHdoYXQgSmVyb21lIHNhaWQu
Cgo+IAo+IEFsc28gSSB0aGluayB0aGVyZSdzIGEgZGlmZmVyZW50IHVuZGVyc3RhbmRpbmcgYWJv
dXQgd2hhdCBKZXJvbWUKPiBwcmV2aW91c2x5IHdyb3RlOgo+PiBJdCB3b3VsZCBiZSBuaWNlIHRv
IGFjdHVhbGx5IGRlc2NyaWJlIGhvdyB0aGlzIHZpZCBwbGwgd29yayBzbyB3ZSBjYW4KPj4gc3Rv
cCB1c2luZyBwcmVjb21wdXRlICJtYWdpYyIgdmFsdWVzIGFuZCBhY3R1YWxseSB1c2UgdGhlIElQ
IHRvIGl0cyBmdWxsCj4+IGNhcGFjaXR5Lgo+ICBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kIGlzIHRo
YXQgeW91IGludGVycHJldGVkIHRoaXMgYXMgImxldCdzIGNoYW5nZQo+IEFSUkFZX1NJWkUodmlk
X3BsbF9kaXZfdGFibGUpIHRvIGEgbmV3IG1hY3JvIGNhbGxlZAo+IFZJRF9QTExfRElWX1RBQkxF
X1NJWkUiLgo+IEJ1dCBJIHRoaW5rIHdoYXQgSmVyb21lIG1lYW50IGlzOiAibGV0J3MgZ2V0IHJp
ZCBvZiB2aWRfcGxsX2Rpdl90YWJsZQo+IGFuZCBpbXBsZW1lbnQgaG93IHRvIGFjdHVhbGx5IGNh
bGN1bGF0ZSB0aGUgY2xvY2sgcmF0ZSAtIHdpdGhvdXQKPiBoYXJkLWNvZGluZyAxNCBwb3NzaWJs
ZSBjbG9jayBzZXR0aW5ncyBpbiB2aWRfcGxsX2Rpdl90YWJsZSIuIExvb2sgYXQKPiBjbGstbXBs
bC5jIGFuZC9vciBjbGstcGxsLmMgd2hpY2ggYWxsb3cgY2FsY3VsYXRpbmcgYXJiaXRyYXJ5IHJh
dGVzCj4gd2l0aG91dCBhbnkgaGFyZC1jb2RlZCB0YWJsZXMuCgpJbiBmYWN0LCBwbGwgYW5kIG1w
bGwgYXJlIGFsc28gZml4ZWQgcmVnaXN0ZXIgd3JpdGVzIGNvcnJlc3BvbmRpbmcgCnZhbHVlcy4g
QnV0IGV2ZXJ5IFNPQyBpcyBkaWZmZXJlbnQsIHNvIGl0IG1ha2VzIG1vcmUgc2Vuc2UgdG8gc2V0
IGl0IApvdXRzaWRlLiBUaGUgVklEIFBMTCBpcyBhIGZpeGVkIHZhbHVlIGZvciBhbGwgY3VycmVu
dCBTb0NzLgoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
