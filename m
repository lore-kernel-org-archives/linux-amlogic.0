Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC9C77B6C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkIOVfHTLV6SP7Evu8bwCd8X+AyptbfwI25zVfzp+n8=; b=vyKeSzLW2SNtqKqOe3gkW58CV+
	LlHCgRNsZQgB2vwTIpsqbFW9JKb0VL1P1NE/DRqDOgTY5VfSk/FFmWVNnLBfxiT3ydqpbn8RreDde
	rBlbxY38iwzqs8N6TsU2cuwXFo1isyEbeW2ndWRtmvD+WHdS0/S8uUjndtjX7oLYVUkc1juWDwj8Z
	1M+6yYHnxgp+27+cCIo2oy6UViswcBts8jLnLq+Mryuphfs0LVFHVozt4eFdVqkGPrzjH7bUO6yHx
	uQCCxJC3EzQUoX7TTFaAL7dCl9Ycc8K94pOVSM4vdyjXzfnXLDDlXvquzCt5BTcnAYS8vGdlQjGIG
	VPPyNJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmspf-005UuQ-1t;
	Thu, 13 Apr 2023 09:01:31 +0000
Received: from mail-sgaapc01on20706.outbound.protection.outlook.com ([2a01:111:f400:feab::706] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmspb-005Usw-13;
	Thu, 13 Apr 2023 09:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxt0hLrvQ38nmwwsxE/sOeZPw5PYg72zw8RPO0ou0/wYTFy2/3Mp8jy7xTQu/+sXhMKPXZyMLfaOPZU5vL2Vfmob4zChhstLuehUvIzTezYKRozz1Cu4+V7MJDRuYkT+qCzfAisJOsqzLZ9XTxmzIK11jcI8HazM6f91HOM4pokTgoI+66ZSVeCy56OsB502zgZahfPfKXu2pxpyxjYXIYZsUpU5JRYRyo5FimSdvdOisZSvYJQOE3jTvbsCWzrTnyhifBYlog+ZuaP1RlWUZlg6n0jUt+xV4e5dCl1lFXhJnAFRu9dges0eH0AgdyRXjL2YJCInaTyUokrzaUMj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9JORRWECmz/90AJsKJpcuCuUahEX/sASbGgW/X8iTk=;
 b=iIcTY+m74/ZD2HIHK47Te5id7HTi8L2cdjg2pwxyV6PImXR13oLJbDMPnyi4/y5zKM/Kxpl9JeRUv8tT5F3RLkx3Jz1mJ4J4rXDv+0LnABlGey6TdQXGR+4cVHV183UbHDqJvgHpea6iN0ydmyHteXIh1AQJ/b3bZuyTklbBAXBXe+SxjZ7Hq+U3tJQzOSjbtVFfNfzUIdH+ve2G7P8K04MZ3cWSIc/9pcVhBCVBfQPQNtQ/Kh6Udqg2H1XvbhIaxtGLIfdHA+t5IsW6cAK6QLK6Lk3cc7r6ZKlKpiCOhTLLcLrIDi0Y4wKpChqjMg/DcQYskvco2tM2ohijt1hooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com (2603:1096:4:1d5::9) by
 PSAPR03MB5542.apcprd03.prod.outlook.com (2603:1096:301:4e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Thu, 13 Apr 2023 09:01:18 +0000
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1]) by SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1%5]) with mapi id 15.20.6277.038; Thu, 13 Apr 2023
 09:01:17 +0000
Message-ID: <1df3be1e-ebff-cbd4-0739-2b919b840eac@amlogic.com>
Date: Thu, 13 Apr 2023 17:01:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support
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
 <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
 <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
 <2e68acd1-f3d1-adbc-5ed2-66c40e006579@amlogic.com>
 <1jleiyyk7k.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jleiyyk7k.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To SG2PR03MB6730.apcprd03.prod.outlook.com
 (2603:1096:4:1d5::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6730:EE_|PSAPR03MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 586879f0-ad7b-4062-9980-08db3bfda3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yfWNxpgowprm9Zn+VCy81IZZWkgp6Kq0c02DZwmD2fS0Z9wYK0FrNVSIoXPbflTfNHd2y88WTQNDg0fwguOJqpsLGrKl2w3TAUg0MzsgsRqU/u8WSI61iqFXqogO8VP+uYtSQ3ZuKBx5ay0gk8+B4UGWtf5gcut7qvhuQOCQLl5I6nwp4LZoyWpo/srnQPCOhWnR1tsK3NWC1p6q0XXVtwsEzS1qAjls7XnumON8y/dGoWLOz5k0lghrJT5sMFvmJYXHFWRuqaTTKiyAwyvzRrsg2wFGwJiad3HSXoJJj1JpStzcnLSQPopjk1z8qEVI7o//tIRUcFXAj/jFk9jthCg2VbxZS44a4sJnG2hZkovcg9jAsigxoXkxE8jMIPV4M/aoBQO0t88fQoI6Qx4BsJ6rHPjIGKF/PhULWSm8zpiZ2eyHiP7Q3NtEU6JLAnrxHQlqZZ+e5Nd/67N/c1lLkxAWRWZxZTCwDNTZ0vMax2Av9aRVCfshXwiAqb8+W4MeHi3xe0+qR109rEbWiMkx5dyipJ+lXRPMiLRNzFb+iWq7Cd9fHpEhV0tE+e8JCNbkIIfGPj7m2DViVtIM5Z8YQah5RzwIoNrAyZ7skuAmX5C8eeXGScpvzvZJVPFyhJO+qShTaUMrjjXcPtC7le5oIEcP9lNdJ3EenhEG+qt2Y+MuS2eKseCkg0iMtnAzjOrvVHyew/p8u74gHucwRPILdQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6730.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(396003)(39850400004)(451199021)(41300700001)(66946007)(66476007)(66556008)(110136005)(478600001)(31686004)(54906003)(6666004)(6486002)(316002)(4326008)(2906002)(83380400001)(186003)(26005)(8676002)(8936002)(2616005)(7416002)(36756003)(44832011)(5660300002)(86362001)(31696002)(107886003)(6506007)(6512007)(53546011)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dDA2RXc2dVdMWVI0cUxWUWpJZUZ1UGxiRzFKQytEd0FMdVluZW1oRkhoVW8v?=
 =?utf-8?B?S0YzWWFscnVlaFFIRkRPR25jeEkvMzhKWmRUeUpyd3AwN1ZSc3gyRFUyYlZE?=
 =?utf-8?B?RnhFMjc5d2xFdmNjMXJNT0l2SDAydEt4SEJLN1N2VHVWL0dEZ0JOVTFlWFc2?=
 =?utf-8?B?NTZIT2RGcTdvb2RZRkhoblZEampEUVJ6OXlWa3Q1eVpyb294TEY1OGVTT0pj?=
 =?utf-8?B?T0RxVEdTZ3VPdGt0YVNLK1JHeTVCL21ROHo4bXJKTlJVTHZzNmlJb21kSU1v?=
 =?utf-8?B?TTJKTjBuOFVHMW40aWRrdzJGTXlsZnJORWR3a3I4aFIxSnlvOTRkODJpRVJH?=
 =?utf-8?B?NFhGYnJZS1ZoNEdDSGpURW84NE1ZZEhzQ3A1ZTF1ZExHZFhjWUttNGQ1dThD?=
 =?utf-8?B?RzgvZ0ZROHpyWkllNm5pWk5mVmFJc3JPMkdrei9uVVA1cG12VFhtT3lYQ25D?=
 =?utf-8?B?UkorYVVoazF2cEpvbUdZTktwR1NuR09jaW14OHd1S09UbkExZGRHdTdUUVlN?=
 =?utf-8?B?R0x5Y29LeXBKaWExN3lUUjM0SjU4U045M0tEeGhjQUd1Ri9yanRVa0lSd2h4?=
 =?utf-8?B?MWFQWWRhYmtNTGFwSFF3SjNrWFV1RDlpUGE2ZnlQUGxlSU41UFFuWGYzUC9v?=
 =?utf-8?B?d3JOQlRwT3Rsazc2ZEV4cXJTdXV1dDErUUorcWU5cXNTOE10WmJ2ZVQ0SHpN?=
 =?utf-8?B?bmc1c0VaNXRNODVDQUNZN2Z5S0VSdVFmVGVKQUxuYzlyeGZxVzVlLzhLYktw?=
 =?utf-8?B?RFZMZjhoaW9IVUFhZ3NiTWk3WXo0QmIwWXRTNUFGZjc1ZmM1blFITGxUVDRm?=
 =?utf-8?B?VCtudWsrMGpoUEFGTmpLZ1ZxdUtEM0J0amdzZHRQeHNKZllkQ1N1QjhHYTQ1?=
 =?utf-8?B?cGZDYXJ0dGNqOFRkb0dpbVJJbGlyejFCWVNKT2NjN0tlOHpHQ0IybEdER2Va?=
 =?utf-8?B?YUUvdVBBUEcyaGRzTW94NkgzVnZLdFMvVVlxTXp4MUVzUTVZY2ExMEZQQ1c2?=
 =?utf-8?B?c0lPaW5HYmhHUGIxcS8vVnJ5enM1RzZlSkxYZ3NEbFpvWjVMaURlMDV6dXR2?=
 =?utf-8?B?dU1EZ3RnUFkrc1kwVDBtVEFFZGVFWEpHaG5zTDY2VUs2R1RrN0JyV29uSW0x?=
 =?utf-8?B?aEZZeDBKSWVIN2lyNGYwNlZzSXBIVkRHd295eDl4dXdMSkx3VUZZbWQrV1k2?=
 =?utf-8?B?aFFJWTdEVEs0Tkx5aHZwbUZ0NVp6V1RJMXpMZHBYT0FlWTZiZUNOQ05vb2Na?=
 =?utf-8?B?bmg2dDV0NXBEWWhHMit1WjduMmlhRksrSmQzWDZjdndiSXYyaWtBVWFzUThF?=
 =?utf-8?B?ZDVSWE1paElZRlZYYkNWZnhWcWhGUU83c3Qzd29VTzlDZUx0YlFuNFQ4Tldt?=
 =?utf-8?B?K2M3WURSY3M0QW1JSDBCZTkvREV5NWFvVDBYelFQVHhySWdVRG95dXp4NzBq?=
 =?utf-8?B?d0tsUFdqQlJ5a2hVRTJwVml1MFFMb2daTDNpNjArWUtUa1REREphUjA4MUJv?=
 =?utf-8?B?dnVPVllyUzN6OFE3UTRYb1VDeHpkc2QyY1o4NXRRQk5VQ0M4KzR4aXByS1Qx?=
 =?utf-8?B?MmgyM0dqQlNWMjRjbDhROGNOT2s3d0dxNC9YNnRVaFhyajAzWUlKbTlqaC9E?=
 =?utf-8?B?SWduWlZRbVc2SlE0NFZoVThJMmNhd01RbnZlc2tsek5ZbExEUjFsSHpPcXRy?=
 =?utf-8?B?Ni9udzhQbVVuaE16RVhNaGtuNEtuY3ptdkJpd3c3VnVnSnpkVDlZNDJTMk9n?=
 =?utf-8?B?dVp4TVdUT1VhcTRMUXJhZHp2L0FaRmcxbi91LzFXNGtYOXAvT1hJYTBtN3U0?=
 =?utf-8?B?a2t3a093SlVZRE5zYVJEaDZDN1dPdGpvYjR0aDMxN2NzQVlKem9ncFNSNk8y?=
 =?utf-8?B?Q3ErampBd1pBYmlUazRkU2JoYWtFRkh3NitEWXZTWEkwNmF6R3N2SjcycnU2?=
 =?utf-8?B?TjJ5Yk16UlVVcDZ5N1NXanNiR0ZNRTRiL1EvQ1VnQWVEYlppQlZzQmZtZEJi?=
 =?utf-8?B?eVFFcThjMFFWZXpaQlpVRmE1WmZBOG5WZi9TSkxGWmpMU3l5bDZSTlFsTXdU?=
 =?utf-8?B?RWhWRGo0YlFoZ0xqcitmYXprOG9ZRER4dnBWUFJlVHQ0eHNiZVR6MmYydlgz?=
 =?utf-8?Q?M9on7iTsP2SheaBUmmJ1GvHit?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586879f0-ad7b-4062-9980-08db3bfda3f2
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6730.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 09:01:17.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lE1R0meBRtQe43rDYotugdhfV7Xz3pt085MAHmkzOaiSMUXSgQyP4HC1kV7yO4JvJXnCpS7sM6jcp7TorU2DjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB5542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_020127_556858_A1F512DC 
X-CRM114-Status: GOOD (  32.02  )
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

CgpPbiAyMDIzLzQvMTEgMTU6MDIsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gRnJpIDA3IEFwciAyMDIzIGF0IDE4OjA4LCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBPbiAyMDIzLzMvMjIgMTY6NDEsIEplcm9tZSBCcnVu
ZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+IE9uIFdlZCAyMiBNYXIgMjAyMyBh
dCAxNTo0NiwgWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Cj4+Pj4gT24gMjAy
My8zLzIxIDE3OjQxLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+Pj4+PiBbIEVYVEVSTkFMIEVNQUlM
IF0KPj4+PiBIaSBKZXJvbWUsCj4+Pj4gCVRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4KPj4+Pj4g
T24gVHVlIDIxIE1hciAyMDIzIGF0IDEwOjI5LCBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+IHdy
b3RlOgo+Pj4+Pgo+Pj4+Pj4gSGkgTWFydGlu77yMCj4+Pj4+PiAJRmlyc3Qgb2YgYWxsLCB0aGFu
ayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pj4+Pgo+Pj4+Pj4gT24gMjAyMy8zLzIwIDIzOjM1LCBN
YXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+Pj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4+
Pj4+IEhlbGxvIFl1IFR1LAo+Pj4+Pj4+IE9uIE1vbiwgTWFyIDIwLCAyMDIzIGF0IDEyOjM14oCv
UE0gWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPiB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lu
Y2UgdGhlIHByZXZpb3VzIGNvZGUgb25seSBwcm92aWRlcyAicm9fb3BzIiBmb3IgdGhlIHZpZF9w
bGxfZGl2Cj4+Pj4+Pj4+IGNsb2NrLiBJbiBmYWN0LCB0aGUgY2xvY2sgY2FuIGJlIHNldC4gU28g
YWRkICJvcHMiIHRoYXQgY2FuIHNldCB0aGUKPj4+Pj4+Pj4gY2xvY2ssIGVzcGVjaWFsbHkgZm9y
IGxhdGVyIGNoaXBzIGxpa2UgUzQgU09DIGFuZCBzbyBvbi4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogWXUgVHUgPHl1LnR1QGFtbG9naWMuY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+
PiBwbGVhc2UgZGVzY3JpYmUgdGhlIGNoYW5nZXMgeW91IGRpZCBjb21wYXJlZCB0byB0aGUgcHJl
dmlvdXMgdmVyc2lvbihzKQo+Pj4+Pj4KPj4+Pj4+IEknbGwgYWRkIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24uCj4+Pj4+Pgo+Pj4+Pj4+IFsuLi5dCj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oIGIvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYu
aAo+Pj4+Pj4+PiBpbmRleCBjMDEyOGUzM2NjZjkuLmJiY2NhYjM0MDkxMCAxMDA2NDQKPj4+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaAo+Pj4+Pj4+PiArKysgYi9k
cml2ZXJzL2Nsay9tZXNvbi92aWQtcGxsLWRpdi5oCj4+Pj4+Pj4+IEBAIC0xMCwxMSArMTAsMTQg
QEAKPj4+Pj4+Pj4gICAgICAjaW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+Cj4+Pj4+Pj4+
ICAgICAgI2luY2x1ZGUgInBhcm0uaCIKPj4+Pj4+Pj4KPj4+Pj4+Pj4gKyNkZWZpbmUgVklEX1BM
TF9ESVZfVEFCTEVfU0laRSAgICAgICAgIDE0Cj4+Pj4+Pj4gSW4gdjEgeW91IHVzZWQgQVJSQVlf
U0laRSh2aWRfcGxsX2Rpdl90YWJsZSkgd2hlcmV2ZXIgdGhpcyBuZXcgbWFjcm8KPj4+Pj4+PiBp
cyB1c2VkIGluc3RlYWQuCj4+Pj4+Pj4gSSB0aGluayB1c2luZyBBUlJBWV9TSVpFIGlzIHRoZSBi
ZXR0ZXIgYXBwcm9hY2ggYmVjYXVzZSBpdCBtZWFucyB0aGUKPj4+Pj4+PiByZWZlcmVuY2VzIHdp
bGwgdXBkYXRlIGF1dG9tYXRpY2FsbHkgaWYgYW4gZW50cnkgaXMgYWRkZWQvcmVtb3ZlZCBmcm9t
Cj4+Pj4+Pj4gdmlkX3BsbF9kaXZfdGFibGUKPj4+Pj4+Cj4+Pj4+PiBJIGFncmVlIHdpdGggeW91
LiBQZXJoYXBzIHRoZSBrZXkgaXMgdG8gdW5kZXJzdGFuZCB3aGF0IEplcm9tZSBzYWlkLgo+Pj4+
PiBJIGFza2VkIHlvdSB0byBkZXNjcmliZSBob3cgdGhpcyBkaXZpZGVyIGFjdHVhbGx5IHdvcmtz
LiBOb3QgcmVtb3ZlCj4+Pj4+IEFSUkFZX1NJWkUoKS4KPj4+Pgo+Pj4+IE9LYXkhIEkgbWlzdW5k
ZXJzdG9vZCB5b3VyIG1lYW5pbmcuCj4+Pj4KPj4+Pj4gVGhpcyBkaXZpZGVyIHVzZXMgdGFibGVz
IG9ubHkgYmVjYXVzZSB0aGUgcGFyYW1ldGVycyBhcmUgIm1hZ2ljIi4KPj4+Pj4gSSdkIGxpa2Ug
dGhlIGRyaXZlciB0byBiZSBhYmxlIGNvbWUgdXAgd2l0aCAiY29tcHV0ZWQiIHZhbHVlcyBpbnN0
ZWFkLgo+Pj4+PiBXaGF0IEkgcmVxdWVzdGVkIGlzIHNvbWUgZXhwbGFuYXRpb24gYWJvdXQgaG93
IHRoaXMgSFcgY2xvY2sgd29ya3MKPj4+Pj4gYmVjYXVzZSB0aGUgZG9jdW1lbnRhdGlvbiBpcyBu
b3QgdmVyeSBjbGVhciB3aGVuIGl0IGNvbWVzIHRvIHRoaXMuIFRoZXNlCj4+Pj4+IHZhbHVlcyBt
dXN0IGNvbWUgZnJvbSBzb21ld2hlcmUsIEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgImhvdyIuCj4+
Pj4+IFRoaXMgaXMgdGhlIHNhbWUgYXMgdGhlIFBMTCBkcml2ZXIgd2hpY2ggY2FuIHRha2UgYSBy
YW5nZSBhbmQgY29tZSB1cAo+Pj4+PiB3aXRoIHRoZSBkaWZmZXJlbnQgcGFyYW1ldGVycywgaW5z
dGVhZCBvZiB1c2luZyBiaWcgcHJlLWNvbXB1dGVkIHRhYmxlcy4KPj4+Pj4KPj4+Pj4+Cj4+Pj4+
Pj4gQWxzbyBJIHRoaW5rIHRoZXJlJ3MgYSBkaWZmZXJlbnQgdW5kZXJzdGFuZGluZyBhYm91dCB3
aGF0IEplcm9tZQo+Pj4+Pj4+IHByZXZpb3VzbHkgd3JvdGU6Cj4+Pj4+Pj4+IEl0IHdvdWxkIGJl
IG5pY2UgdG8gYWN0dWFsbHkgZGVzY3JpYmUgaG93IHRoaXMgdmlkIHBsbCB3b3JrIHNvIHdlIGNh
bgo+Pj4+Pj4+PiBzdG9wIHVzaW5nIHByZWNvbXB1dGUgIm1hZ2ljIiB2YWx1ZXMgYW5kIGFjdHVh
bGx5IHVzZSB0aGUgSVAgdG8gaXRzIGZ1bGwKPj4+Pj4+Pj4gY2FwYWNpdHkuCj4+Pj4+Pj4gICAg
IEZyb20gd2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB5b3UgaW50ZXJwcmV0ZWQgdGhpcyBhcyAi
bGV0J3MgY2hhbmdlCj4+Pj4+Pj4gQVJSQVlfU0laRSh2aWRfcGxsX2Rpdl90YWJsZSkgdG8gYSBu
ZXcgbWFjcm8gY2FsbGVkCj4+Pj4+Pj4gVklEX1BMTF9ESVZfVEFCTEVfU0laRSIuCj4+Pj4+Pj4g
QnV0IEkgdGhpbmsgd2hhdCBKZXJvbWUgbWVhbnQgaXM6ICJsZXQncyBnZXQgcmlkIG9mIHZpZF9w
bGxfZGl2X3RhYmxlCj4+Pj4+Pj4gYW5kIGltcGxlbWVudCBob3cgdG8gYWN0dWFsbHkgY2FsY3Vs
YXRlIHRoZSBjbG9jayByYXRlIC0gd2l0aG91dAo+Pj4+Pj4+IGhhcmQtY29kaW5nIDE0IHBvc3Np
YmxlIGNsb2NrIHNldHRpbmdzIGluIHZpZF9wbGxfZGl2X3RhYmxlIi4gTG9vayBhdAo+Pj4+Pj4+
IGNsay1tcGxsLmMgYW5kL29yIGNsay1wbGwuYyB3aGljaCBhbGxvdyBjYWxjdWxhdGluZyBhcmJp
dHJhcnkgcmF0ZXMKPj4+Pj4+PiB3aXRob3V0IGFueSBoYXJkLWNvZGVkIHRhYmxlcy4KPj4+Pj4+
Cj4+Pj4+IGV4YWN0bHkgLi4uIG9yIGF0IGxlYXN0IGFuIGV4cGxhbmF0aW9uIGFib3V0IGhvdyBp
dCB3b3JrcyBhbmQKPj4+Pj4gd2h5IGl0IGlzIHRvbyBjb21wbGljYXRlZCB0byBjb21wdXRlIHRo
ZSB2YWx1ZXMgYXQgcnVudGltZS4KPj4+Pj4KPj4+Pj4+IEluIGZhY3QsIHBsbCBhbmQgbXBsbCBh
cmUgYWxzbyBmaXhlZCByZWdpc3RlciB3cml0ZXMgY29ycmVzcG9uZGluZwo+Pj4+Pj4gdmFsdWVz
Lgo+Pj4+PiBUaGF0IGlzIG5vdCB0cnVlLiBUaGUgcGxsIGFuZCBtcGxsIGRyaXZlcnMgYXJlIGFi
bGUgdG8gY29tcHV0ZSB0aGVpcgo+Pj4+PiB2YWx1ZXMgYXQgcnVudGltZS4gUGxlYXNlIGhhdmUg
YSBsb29rIGF0IHRoZSBkcml2ZXJzLgo+Pj4+Pgo+Pj4+Cj4+Pj4gQWZ0ZXIgY29uc3VsdGluZyB0
aGUgZW5naW5lZXIgb2YgdGhlIGNoaXAgZGVzaWduLCB0aGUgY2xvY2sgaXMgYSBkaWdpdGFsCj4+
Pj4gZnJlcXVlbmN5IGRpdmlkZXIsIGFuZCB0aGUgZnJlcXVlbmN5IGRpdmlkZXIgaXMgdmVyaWZp
ZWQgYnkgdGhlIHNlcXVlbmNlCj4+Pj4gZ2VuZXJhdG9yLCB3aGljaCBpcyBiaXQwLWJpMTUuIGJp
dDE2LWJpdDE3IGNvbmZpcm1zIHRoZSBzaXplIG9mIHRoZQo+Pj4+IGZyZXF1ZW5jeSBkaXZpc2lv
bi4KPj4+IFRoYXQsIHdlIGFscmVhZHkga25vdy4gVGhpcyBpcyB3aGF0IHRoZSBkYXRhc2hlZXQg
YWxyZWFkeSBnaXZlIHVzLgo+Pj4gSXQgaXMgc3RpbGwgYSBiaXQgbGlnaHQuCj4+PiBZb3UgZG9u
J3Qgc2V0IHRoZSBiaXQgcmFuZG9tbHkgYW5kIGNoZWNrIHRoZSBvdXRwdXQsIGRvIHlvdSA/Cj4+
PiBUaGUgcXVlc3Rpb24gaXMgaG93IHNldHRpbmcgdGhpcyBiaXQgaW1wYWN0IHRoZSByZWxhdGlv
biBiZXR3ZWVuCj4+PiB0aGUgaW5wdXQgYW5kIG91dHB1dCByYXRlPyBJT1csIGZyb20gdGhlc2Ug
MTdiaXRzLCBob3cgZG8geW91IGNvbWUgdXAKPj4+IHdpdGggdGhlIG11bHRpcGxpZXIgYW5kIGRp
dmlkZXIgdmFsdWVzIChhbmQgdGhlIG90aGVyIHdheSBhcm91bmQpID8KPj4+Cj4+Pj4gV2hlcmVh
cyBvdGhlciBQTExTIGFuZCBNUExMUyBhcmUgYW5hbG9nIGRpdmlkZXJzIHNvCj4+Pj4gdGhlcmUg
YXJlIGZpeGVkIGZvcm11bGFzIHRvIGNhbGN1bGF0ZS4KPj4+Pgo+Pj4+IFNvIE5laWwgaGFkIG5v
IHByb2JsZW0gaW1wbGVtZW50aW5nIGl0IHRoaXMgd2F5LiBTbyBub3cgSSB3YW50IHRvIGtub3cg
eW91cgo+Pj4+IGFkdmljZSB3aGF0IHNob3VsZCBJIGRvIG5leHQ/Cj4+PiAxKSBOZWlsIGRpZCB3
aGF0IGhlIGNvdWxkIHRvIGdldCBjb21wdXRlIHRoZSByYXRlIChSTykgd2hpY2ggdGhlIGxpdHRs
ZQo+Pj4gaW5mb3JtYXRpb24gaGUgaGFkLiBZb3UgYXJlIHRyeWluZyB0byBleHRlbmQgdGhlIGRy
aXZlciwga2VlcGluZyBhbgo+Pj4gZHVtbXkgYXBwcm9hY2guIEl0IGlzIG9ubHkgZmFpciB0aGF0
IEkgYXNrIHlvdSB0byBtYWtlIHRoaXMgYSByZWFsCj4+PiBkcml2ZXIuCj4+PiAyKSBCZWNhdXNl
IHNvbWV0aGluZyBoYXMgYmVlbiBkb25lIG9uY2UsIGl0IG5vdCBuZWNlc3NhcmlseSBhcHByb3By
aWF0ZQo+Pj4gdG8gY29udGludWUgLi4uIHRoaXMgdHlwZSBvZiBhcmd1bWVudCBoYXJkbHkgYSB2
YWxpZCByZWFzb24uCj4+PiBJIGRvbid0IHdhbnQgdG8ga2VlcCBhZGRpbmcgdGFibGUgYmFzZWQg
ZHJpdmVyIHVubGVzcyBuZWNlc3NhcnkuCj4+PiBTbyBmYXIsIHlvdSBoYXZlIG5vdCBwcm92ZWQg
dGhpcyBhcHByb2FjaCBpcyByZWFsbHkgcmVxdWlyZWQsIG5vcgo+Pj4gcHJvdmlkZWQgdGhlIG5l
Y2Vzc2FyeSBpbmZvcm1hdGlvbiB0byBtYWtlIHRoZSBjYWxjdWxhdGlvbi4KPj4KPj4gVGVjaG5p
Y2FsbHkgeW91IGFyZSByaWdodC4gSSBhbSBjb21tdW5pY2F0aW5nIGFuZCBjb25maXJtaW5nIHdp
dGggdGhlIGNoaXAKPj4gZGVzaWduZXIgdG8gc2VlIGlmIHRoZSBnZW5lcmFsIGNhbGN1bGF0aW9u
IGZvcm11bGEgY2FuIGJlIGdpdmVuLiBJZiBub3QsIEkKPj4gd2lsbCBleHBsYWluIHdoeS4gUGxl
YXNlIGdpdmUgbWUgc29tZSB0aW1lLgo+Pgo+PiBCdXQgSSBoYXZlIHRvIG1lbnRpb24gdGhhdCB0
aGUgU09DLCBhbHRob3VnaCB0aGVyZSBpcyB0aGlzIHJlZ2lzdGVyIGJ1dAo+PiBhY3R1YWxseSBk
b2VzIG5vdCB1c2UgdGhlIGNsb2NrLiBDYW4gd2UgdHJlYXQgdGhpcyBhcyBhIHNlcGFyYXRlIHBh
dGNoIHRoYXQKPj4gd2Ugd2lsbCBjb250aW51ZSB0byBzZW5kIGFuZCBleHBsYWluIGxhdGVyPwo+
Pgo+PiBUaGlzIHdheSBJIGNhbiBjb250aW51ZSB3aXRoIHRoZSBvdGhlciBwYXRjaGVzIG9mIFM0
IFNPQyBmaXJzdCwgYW5kIHRoaXMKPj4gY2xvY2sgc3RheXMgdGhlIHNhbWUgd2F5IGFzIHRoZSBH
MTJBIGZpcnN0LiBMYXRlciwgYWZ0ZXIgdGhlIHBhdGNoIG9mIHRoZQo+PiBjbG9jayBpcyBjb3Jy
ZWN0ZWQsIGl0IGNhbiBiZSBjb3JyZWN0ZWQgdG8gIm9wcyIgYXMgcmVxdWlyZWQuT3RoZXJ3aXNl
LCB3ZQo+PiBjYW5ub3QgY29udGludWUgb3RoZXIgZHJpdmVyIHBhdGNoZXMuIEkgZG9uJ3Qga25v
dyBpZiB5b3UgYWdyZWU/Cj4+Cj4gCj4gU3VyZSB5b3UgY2FuIHNlbmQgeW91ciBzNCBzZXJpZXMg
d2l0aCBSTyBvcHMgYW5kIGNoYW5nZSB0byBSVyBsYXRlciBvbgo+IGlmIG5lY2Vzc2FyeS4KCk9r
LCBJIHdpbGwgYmUgcmVhZHkgdG8gc2VuZCBTNCBjaGlwIG90aGVyIHBhdGNoIHdpdGggVklEIGNs
b2NrIFJPIG9wcyBmaXJzdC4KCj4gCj4+Pgo+Pj4+Cj4+Pj4+PiBCdXQgZXZlcnkgU09DIGlzIGRp
ZmZlcmVudCwgc28gaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBzZXQgaXQKPj4+Pj4+IG91dHNpZGUu
IFRoZSBWSUQgUExMIGlzIGEgZml4ZWQgdmFsdWUgZm9yIGFsbCBjdXJyZW50IFNvQ3MuCj4+Pj4+
Pgo+Pj4+Pj4+IEJlc3QgcmVnYXJkcywKPj4+Pj4+PiBNYXJ0aW4KPj4+Pj4+Pgo+Pj4+Pgo+Pj4K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
