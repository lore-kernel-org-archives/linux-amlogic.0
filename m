Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44247C77B73
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVEZy+w2k1fL6kpbkbWjaL3+QYXF1ofwiunNeOPv2Zg=; b=wMBEhUZKB5U3kuAnhUCXr6wJhJ
	b+0jSFvMmzATmcS2UvHm+Y/Z9k7+D31sGsK8phh9dKqATRdTtMW1nACUzXBvbIbrdoD9DzAJ2lkyl
	ZQ4Bp6a6hNesvteSlD9dMdwkOdz2Ub89J9ghGrq+Ttzg8LX+4X0byHZzwEmxKvjkUZro0+cZDlm3V
	6648dPLMrEtTFPGaT1siYgTeieotMnYc6cdcYcV+wxtweYRJ7tuwLCQUqhpjO2RGHqUtQr438TtRX
	JZMl70OiswgDV+aExBTkk+VRE3puSLuiPrbJusHEPMwglSGb2B4F559CI13Y+AIHU+9oBuaPrzCkD
	GR6qAiHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prxnn-005xqm-35;
	Thu, 27 Apr 2023 09:20:35 +0000
Received: from mail-tyzapc01on20728.outbound.protection.outlook.com ([2a01:111:f403:704b::728] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prxnk-005xpJ-07;
	Thu, 27 Apr 2023 09:20:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIhJSU8nBnwbgJauLAfwnoYv19LGI5Bvxx4NxYqR0/0xkKtLX6PFtATdWP4odgTOoNhllulHBf+jFZZjGVesSAGG9AOp8azXjErHvO8LBZoqKi7xFPTIIh1Z798Pd985pxkHbDYGGXWzvOOwpaxqNvSrATNQWz9OeYzbWpgPeCj4Yqhawz/ZPRd44RbvuRiNuzeH+Ugptk2aI1HGjdbtS1B8S38TS6/XkWA59uOJzhGlfbUhUGfltUQrXNqxm6q7oD0poQklg2AtYzzA28GraPRt9NtCWjPYi5NNy6UKeG2wj5KlopBbR7howWIttpPRE3CNiyWcguP05bTyXSK+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8exmd1+omkDoErTskZyQXrcxPmfsDZT/+2gSDP+y2mQ=;
 b=TvBIALwN6BW5TYcEyIl4KkY8zan1pBx2/4lF5Ady7LGbmoXKCftwEStS1q7RMy5QjJrFfPkixPDvYqTtvVARx2CGCwQpAeSCaC3HD7xTXqt8HEGgItnbGrDo2KbNYeEQUaabhDXWnf5kuUzqPmf5JKxXKod1S2TxxThjEb6Nj9htPutuKAtR56sl75+xnrFBHTWhlZ2HWVmS7skYq1r+2CRmX8YnXCNVnJvWtePOnW5u0jv3ZeVfhNYAqMVElQpGTPKnIgbYhMCo/Waz4w97XFuZrtxbS2UnlVUhT2LXbl837K9ELCWbrvJWliR2YQ7vLOIVbcS2IXgZiEqleY4JOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8exmd1+omkDoErTskZyQXrcxPmfsDZT/+2gSDP+y2mQ=;
 b=mzMj0FZoXp12yZt5khyCXCW1E4NumkIWx5wE9W00masuykSkvh/43r/Nl3WCdunHkozYb3jz+G+PPPt0D3NCMopfwb7uFyLVNnzx2C5y0rN+mSJaLDVPiKoMbt1tD6zzRpCFxP+pZgDEWApgwBsRhPCyqyR1pS2/ksvwRXdxG0Svnp6VOUsGBM5vGfTJGVIpT8vlluhJSQSa8QdSZo3+UmXGHAhJ/Wv/mtKDEbpEt7Gv3IA11PWztONjyep6/i3wdimT3Nzg/julwrOwcvJN9fYGEC3GQ2Da9dcZ6Jamy30vTSMPZv34LsbNOv6+kAFTOkwgpatqz82eXo5wmriiCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com (2603:1096:101:e2::14)
 by TYZPR03MB5648.apcprd03.prod.outlook.com (2603:1096:400:56::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Thu, 27 Apr
 2023 09:20:25 +0000
Received: from SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086]) by SEZPR03MB7033.apcprd03.prod.outlook.com
 ([fe80::9d77:7adc:25da:b086%3]) with mapi id 15.20.6340.020; Thu, 27 Apr 2023
 09:20:25 +0000
Message-ID: <74973567-dd00-1480-288c-3fa3a567df3f@amlogic.com>
Date: Thu, 27 Apr 2023 17:20:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 1/2] arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: =Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
 <20230419073834.972273-2-xianwei.zhao@amlogic.com>
 <20230419131416.cns3xvkbzjeyrnux@CAB-WSD-L081021>
 <661cea17-a4dd-75d1-6a7e-16efa5aea52b@linaro.org>
 <20230419160405.d7qfir3nv6tlxx2a@CAB-WSD-L081021>
 <427e79ef-156d-027e-9296-6f4e6513a04d@linaro.org>
 <20230419170043.auzfa32weevmrt4e@CAB-WSD-L081021>
 <1c7322c9-8d2d-1cd1-95dc-dd9ec861981f@amlogic.com>
 <9037aa40-c441-b610-ed7b-2c9840dff751@linaro.org>
From: Kelvin Zhang <kelvin.zhang@amlogic.com>
In-Reply-To: <9037aa40-c441-b610-ed7b-2c9840dff751@linaro.org>
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To SEZPR03MB7033.apcprd03.prod.outlook.com
 (2603:1096:101:e2::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7033:EE_|TYZPR03MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce69f11-9c4a-42f8-0b07-08db4700a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OD4TdhYXFCYdLVG2MUmFutnMqmIIijr3+Woxm3xly1Iy3XTzatQQBUuDfjhSduK7RUrGZPl2lZOnYAxXQRcCTioUcLzihdlhsHSaWUaLPcbp/2c/LFg6t1QeQzDuFoKl7L1td4+TtgbdbskUT4Cxx8usmM9hgH8KuQRXxWLrbaMf8SIEUaSGjk0ygrErzBgnNWw9lmfg/JwHrnWicI8SLNHv6YV6JIgHFwmaYuSvjKyhiNLqcFfBrgBRIrRkuBCchscaT4r9Iikzi+jwX3JgSVIv++pLUMqqB9CgYP1/VrurujSu0Cp54Chqht438/Ssiv9/S39Vmo/x9xuWRdqdAZTgvfM+vjXGglHIxK/6FGBMMyO0JJYDPGOHArVkXP0f/YUD4lWDvhYOGvcrXKY5VLvZfBqPm+iXLUibbwTUkP7d8Bbk1WsyPG4E+2fFnX2z5wEFzDGrXQnDm2FXNqPuT9HJf9AlicSW8tF/DMoVFdFNkRbpDY5wq9bqkbyKc5sU2+6I4X2ey2XP8abzXsMG1aF2YRfwrM2buMqZVpbUVvGO3Pxe7g/9A5FhsHOBK6SmtxRGt1jzf47lHue1RI3MrYy4m0wYmnGc1//oeqNSc+PFWDQ4R8eKXwoFYIyyR5gVDiPZb67WQYzdFsXdcqMpkQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7033.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39850400004)(376002)(366004)(136003)(396003)(451199021)(44832011)(38100700002)(7416002)(5660300002)(2906002)(8936002)(8676002)(36756003)(86362001)(31696002)(6486002)(6666004)(966005)(26005)(6512007)(6506007)(54906003)(478600001)(2616005)(186003)(31686004)(66946007)(66556008)(53546011)(66476007)(316002)(41300700001)(4326008)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Q3ZKZ3I0M3ppTmZoTkJpcm1TVWVReW45dFl5bmo3eVBrbFpmTDE4MmtBT2kx?=
 =?utf-8?B?WTQ4MVRLRlZHQWZmR1dYMVd4Wlgvc0pNL21WUXJQWU5wUHdLd2FwUkZGZEZJ?=
 =?utf-8?B?aFUxRXdZLzZ6ZGVOZlBnaVQ5RUFneWlYM29nOFQ3VEJSZ3J4NGhNN1NOdTJw?=
 =?utf-8?B?Y2N2YzI4cHFPbnFFNDlQcWpDY1l4NVhuYjJDaXNSQTlLMFROMjMrYk0wcjRi?=
 =?utf-8?B?bTZZMDg1MlMxYjFJVlc1U0QxTHBNSUh6MG1zZ2VxVThwdzJYbUFBV2dJWVhX?=
 =?utf-8?B?NnpzcEU0RTBSbTc1eWlYc0xrY1l6N3A1Ym9TM0xXbS9UOWMzYjZORUxpZlVP?=
 =?utf-8?B?eGFubnh6YWpWMkg4aUZHY3BFQkxYdFFJVFRCUkplUlZ5MHYrdGZWQ0dqMWcx?=
 =?utf-8?B?Snc5SHAzQlNLSnQ5clVZT0ZvWTNHZVlldUhGU1BEc3RGQUh0MUVENXBsY2VP?=
 =?utf-8?B?aDliL0F6UUhkNXNJOVN2WERKMU56S2RxeVlZZEErQVVjcVo2SjhyekVjYXhV?=
 =?utf-8?B?QWZNRkhRL0dqM3VlUXd6UlpydGtUZTJSS0lYc21mV0w1SUtaUy9LcmlYMmg0?=
 =?utf-8?B?dVBtUVV0QmVaaDFnUnA4bUVJV1MzYzZEdmhMZi9mZExLaG11dW10TXM5QVNn?=
 =?utf-8?B?VTBLWkl1d004bzgyQXdnY3AyNkpxaDJRKzNrMHNmS0srVEt0Y0dtdDNCcGYx?=
 =?utf-8?B?WWp6eTdiTHJoZEVsWUVSOVcvMWNvR1ZQazBTVTRLWmJGTDByWkFJMWwyRzZv?=
 =?utf-8?B?cUJFelh2Yzg2Mzd6MHgrWDNxMTJtalRkM0QvV1hZQkF6MXVLeklWUFZKa3M1?=
 =?utf-8?B?Zi85dFBWRGN6M1ozcFZnYmswQ282WE11eUdOMDFLcVlLMHF2elNRK3dDRTl3?=
 =?utf-8?B?SXczbjRUcDJscUFtOWVBbk1LV3B0eStzRzNxR1NYOUcyZDZPWVY1dm5iYjJa?=
 =?utf-8?B?cmEwZWx1Ky80S3lHdStYUTlkMzVXNWFYSkd1Sk5GMFVIYzhMWmxVSkQ3Tkoz?=
 =?utf-8?B?cFdPZ2hZN2x3MzMzc3JidzNraHhZTVhjQ2ZYTjFORjZaK01LV2xxeGwrcW54?=
 =?utf-8?B?dTQwb05zUDFlZi9LRjFCdVJ0YzdwK251VWRCSVB1Yytnd2huY1c0WnFPWnFu?=
 =?utf-8?B?WkN6MGltWUpOWWJ1eUFzN2Z0VGVqU01jblBpZHIxeDQ0aFJxQWRvcllBbDcx?=
 =?utf-8?B?SExzTG5oZ1l5S2RzZ1RIM1hxMXpiYUNVREYyTGhQVEg0NUFNakc4Unpzb0d3?=
 =?utf-8?B?QkdIbU5mZHJlZVc3RUY0NG1JUXdkTWZvT3FMNFFSeFhiNnpQTDU3bW15NmFT?=
 =?utf-8?B?RklpTUMvVHJNN0hVdFo0V0szQ0VPZzl5aktFVzR3SDA5dXhUaXN3UEN6ZjRt?=
 =?utf-8?B?c0NYZVZGeHJaZkNsQWw0MFhGNzdobFVBQzBkQlVXd21kWnlKSFJUUlRtSUxy?=
 =?utf-8?B?RGJKdjE5QldyZ2JOT21ZdFVZcWpGTHRjSDhPMG1XNXowYUtRVFhsbXk3TFhY?=
 =?utf-8?B?YnlLTnR0aFFyaGlrQkxqL1daaXo1U1VYODVteFUyQUhuVXlTTTAveXFHMDlX?=
 =?utf-8?B?aUpzbW1NRFVPOERkbU45WGRoRlNlVGpqTmIzaEprazJOaHZiWHNXSTBpTTdD?=
 =?utf-8?B?b0pDTm56UEY5Q0F2Mkg3NllxbTNLRk8zekE2RjZMZ2RyN2FlODRZdDMxakVU?=
 =?utf-8?B?VGlMclNLQmc2ZGpzd2tDNHV5UEQrVXN2S3FYTHRmbTFvLzg1bHh0VnhBVnVV?=
 =?utf-8?B?K0FRZE9nNVEyMGk5UjZqV0F4cTFwTFBRMjR0NHVyeko2RkQ4dzNCTldqVWJV?=
 =?utf-8?B?eUxpNlpzOTZSOU5DaXhvTGNWUnVXVmtnSXd5ejQ2eDhGSUhISXFTM1dVVzZV?=
 =?utf-8?B?K0t4TkVPRUNpa2I0NHVibTZLYzRiN1czOENnUXluOE9lWi80YTBYQ0wwZ0tn?=
 =?utf-8?B?VXN5Mnl0UEVrZDdDQVhRQ0xvbVlMSERCL3FGRGxBQnZGZitOSFcvY2FoR01S?=
 =?utf-8?B?M1ArLzBhWU5HUXFvTUtjSGJzR2ExNTJJOHFKWFJOVWJWMXdXQ2JRZ2NKV3A3?=
 =?utf-8?B?N21ZOTRKc09PZmdDcDRxWUd3WGpZQ1dWVFQ2U0RkWGJxTlhRNitsdjJiZ290?=
 =?utf-8?B?WVFIMlBaMWcwUzN6dmNaV1BVRGlqZmpHcm5DMG9hTUxDN0pFeUZFRlc4dWtH?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce69f11-9c4a-42f8-0b07-08db4700a21b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7033.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2023 09:20:25.1029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyEf1onJHL41JqV8GorGmCz/zbWpQKObWHBX/FGn6rAJdmf7AfJp6HL3sK10VvWgH4FjOdCh6nUKiwyNqur5woq6e64Z0F+/dqcRaHiH5gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5648
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_022032_235396_585A7E61 
X-CRM114-Status: GOOD (  35.15  )
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

CgpPbiAyMDIzLzQvMjAgMjA6MTgsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+IAo+IEhpIEtlbHZpbiwKPiAKPiBPbiAyMC8wNC8yMDIzIDEwOjQzLCBLZWx2aW4g
Wmhhbmcgd3JvdGU6Cj4+IE9uIDIwMjMvNC8yMCAwMTowMCwgRG1pdHJ5IFJva29zb3Ygd3JvdGU6
Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4+Cj4+PiBPbiBXZWQsIEFwciAxOSwgMjAyMyBhdCAw
NjoyNTowN1BNICswMjAwLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+PiBPbiAxOS8wNC8yMDIz
IDE4OjA0LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPj4+Pj4gT24gV2VkLCBBcHIgMTksIDIwMjMg
YXQgMDM6NDM6MTJQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4+PiBPbiAxOS8w
NC8yMDIzIDE1OjE0LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEFwciAx
OSwgMjAyMyBhdCAwMzozODozM1BNICswODAwLCA9WGlhbndlaSBaaGFvIHdyb3RlOgo+Pj4+Pj4+
PiBGcm9tOiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gVGhlIEMgc2VyaWVzIFNvQ3MgYXJlIGRlc2lnbmVkIGZvciBzbWFydCBJUCBjYW1l
cmEKPj4+Pj4+Pj4gYXBwbGljYXRpb25zLCB3aGljaCBkb2VzIG5vdCBiZWxvbmcgdG8gTWVzb24g
c2VyaWVzLgo+Pj4+Pj4+PiBTbywgQWRkIEFSQ0hfQU1MSVBDIGZvciB0aGUgbmV3IHNlcmllcy4K
Pj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhlcmUgYXJlIG5vdyBtdWx0aXBsZSBhbWxvZ2ljIFNvQyBzZWll
cyBzdXBwb3J0ZWQsIHNvIGdyb3VwIAo+Pj4+Pj4+PiB0aGVtIHVuZGVyCj4+Pj4+Pj4+IHRoZWly
IG93biBtZW51LiB3ZSBjYW4gZWFzaWx5IGFkZCBuZXcgcGxhdGZvcm1zIHRoZXJlIGluIHRoZSAK
Pj4+Pj4+Pj4gZnV0dXJlLgo+Pj4+Pj4+PiBJbnRyb2R1Y2UgQVJDSF9BTUxPR0lDIHRvIGNvdmVy
IGFsbCBBbWxvZ2ljIFNvQyBzZXJpZXMuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlcyBpbnRyb2R1Y2VkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFu
d2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+
IMKgwqDCoCBhcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIHwgMTIgKysrKysrKysrKysrCj4+
Pj4+Pj4+IMKgwqDCoCBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIHzCoCAyICsrCj4+Pj4+
Pj4+IMKgwqDCoCAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgCj4+Pj4+Pj4+
IGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+Pj4+Pj4+PiBpbmRleCA4OWEwYjEzYjA1
OGQuLmJmYmM4MTdlZWY4ZiAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9LY29uZmln
LnBsYXRmb3Jtcwo+Pj4+Pj4+PiArKysgYi9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zCj4+
Pj4+Pj4+IEBAIC0xNjIsMTIgKzE2MiwyNCBAQCBjb25maWcgQVJDSF9NRURJQVRFSwo+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBNZWRpYVRlayBNVDI3
eHgsIE1UNjV4eCwgTVQ3Nnh4Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgJiBNVDgxeHggQVJN
djggU29Dcwo+Pj4+Pj4+PiArbWVudWNvbmZpZyBBUkNIX0FNTE9HSUMKPj4+Pj4+Pj4gK8KgwqDC
oMKgIGJvb2wgIk5YUCBTb0Mgc3VwcG9ydCIKPj4+Pj4+PiBOWFA/IERpZCB5b3UgbWVhbiAiQW1s
b2dpYyI/Cj4+Pj4+Pj4KPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiAraWYgQVJDSF9BTUxPR0lDCj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4gwqDCoMKgIGNvbmZpZyBBUkNIX01FU09OCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoCBib29sICJBbWxvZ2ljIFBsYXRmb3JtcyIKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgIGhlbHAK
Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgdGhlIGFy
bTY0IGJhc2VkIEFtbG9naWMgU29Dcwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHN1Y2ggYXMg
dGhlIHM5MDUsIFM5MDVYL0QsIFM5MTIsIEExMTNYL0Qgb3IgUzkwNVgvRDIKPj4+Pj4+Pj4gK2Nv
bmZpZyBBUkNIX0FNTElQQwo+Pj4+Pj4+IERvIHdlIHJlYWxseSBuZWVkIGEgZGlmZmVyZW50IEFS
Q0ggZm9yIEFtbG9naWMgSVBDPwo+Pj4+Pj4+IEkgY2FuIGltYWdpbmUgdGhhdCBpdCdzIG5vdCB0
aGUgTWVzb24gYXJjaGl0ZWN0dXJlIGF0IGFsbC4KPj4+Pj4+PiBCdXQgbWF5YmUgYSBiZXR0ZXIg
c29sdXRpb24gaXMganVzdCB0byByZW5hbWUgQVJDSF9NRVNPTiB0byAKPj4+Pj4+PiBBUkNIX0FN
TE9HSUM/Cj4+Pj4+PiBJdCBzaG91bGQgYmUgY2hhbmdlZCB0cmVld2lkZSwgYW5kIGlzIGl0IHdv
cnRoIGl0ID8KPj4+Pj4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgdGhlIEExIGFuZCBTNCBmYW1p
bGllcyBhcmUgbm90IGZ1bGx5IAo+Pj4+PiBjb21wYXRpYmxlCj4+Pj4+IHdpdGggdGhlIE1lc29u
IGFyY2hpdGVjdHVyZSwgYW5kIHdlIGhhdmVuJ3QgcHJvdmlkZWQgYWRkaXRpb25hbCBBUkNIXyoK
Pj4+Pj4gZm9yIHRoZW0uCj4+Pj4gVGhlIEdYQkIsIEdYTC9HWE0sIEcxMkEsIEcxMkIgJiBTTTEg
YXJlIGFsc28gbm90IGZ1bGx5IGNvbXBhdGlibGUsCj4+Pj4gYnV0IHRoZXkgbGllIHVuZGVyIHRo
ZSAiTUVTT04iIHVtYnJlbGxhIHdoaWNoIGNvdmVycyBTb0Mgc2luY2UgdGhlCj4+Pj4gTWVzb242
IGFyY2hpdGVjdHVyZS4gSXQncyBhIGZhY2lsaXR5IHRvIGluY2x1ZGUvZXhjbHVkZSBBbWxvZ2lj
Cj4+Pj4gZHJpdmVycy9EVCwgbm90aGluZyBlbHNlLgo+PiBHWEJCLCBHWEwvR1hNLCBHMTJBLCBH
MTJCICwgU00xIGFuZCBTNCBiZWxvbmcgdG8gbWVkaWEgYm94Lgo+PiBTbywgIk1FU09OIiByZXBy
ZXNlbnRzIHRoZSBtZWRpYSBib3ggc2VyaWVzLgo+PiBVcCB0byBub3csICJNRVNPTiIgd29ya3Mg
d2VsbCBmb3IgYWxsIGV4aXN0aW5nIGNoaXBzIGV4Y2VwdCBBMSBhbmQgQVhHLgo+Pj4+IElmIHlv
dSBjb21wYXJlIGl0IHRvIEJDTSBvciBOWFAsIGl0J3MgZGlmZmVyZW50IHNpdHVhdGlvbiwgdGhl
Cj4+Pj4gZGlmZmVyZW50IEFSQ0hfKiBhY3R1YWxseSB0YXJnZXRzIHRvdGFsbHkgZGlmZmVyZW50
IFNvQ3MgZnJvbQo+Pj4+IGNvbXBsZXRlbHkgZGlmZmVyZW50IEJ1c2luZXNzIFVuaXRzIG9yIGZy
b20gY29tcGFuaWVzIGFjcXVpc2l0aW9ucy4KPj4gRmlyc3RseSwgdGhlIG5ldyBDIHNlcmllcyBp
cyB0b3RhbGx5IGRpZmZlcmVudCBmcm9tIHByZXZpb3VzIE1FU09OIAo+PiBzZXJpZXMuCj4+IMKg
RnJvbSB0aGUgcGVyc3BlY3RpdmUgb2YgYXBwbGljYXRpb24sIHRoZSBuZXcgQyBzZXJpZXMgaXMg
ZGVzaWduZWQgZm9yIAo+PiBzbWFydCBJUCBjYW1lcmEgYXBwbGljYXRpb25zLAo+PiB3aGlsZSBN
RVNPTiBzZXJpZXMgaXMgZGVzaWduZWQgZm9yIGh5YnJpZCBPVFQvIElQIFNldCBUb3AgQm94wqAg
YW5kIAo+PiBoaWdoLWVuZCBtZWRpYSBib3ggYXBwbGljYXRpb25zLgo+PiDCoEZyb20gdGhlIHBl
cnNwZWN0aXZlIG9mIGFyY2hpdGVjdHVyZSwgdGhlIG5ldyBDIHNlcmllcyBpbnRlZ3JhdGVzIHRo
ZSAKPj4gc2Vuc29yIGludGVyZmFjZSwgaW1hZ2Ugc2lnbmFsIHByb2Nlc3NpbmcgdW5pdCwgRGV3
YXJwLCB2aWRlbyBlbmNvZGVyLCAKPj4gbmV1cmFsIG5ldHdvcmtpbmcgcHJvY2Vzc2luZyB1bml0
LAo+PiB3aGljaCBNRVNPTiBzZXJpZXMgZG9lcyBub3QgYW5kIHdpbGwgbmV2ZXIgaGF2ZS4KPj4g
U2Vjb25kbHksIHRoZXJlIGFyZSBDMSBhbmQgQzIgYmVzaWRlcyBDMy4KPj4gTW9yZW92ZXIsIG1v
cmUgb3RoZXIgc2VyaWVzIGFyZSBvbiB0aGUgd2F5LCBzdWNoIGFzIFQgc2VyaWVzLgo+PiBJZiB3
ZSBhbHdheXMgc3RpY2sgdG8gIk1FU09OIiwgcGVvcGxlIHdpbGwgZ2V0IG1vcmUgYW5kIG1vcmUg
Y29uZnVzZWQuCj4+IFRoZXJlZm9yZSwgSSB0aGluayBpdCBpcyB0aGUgcmlnaHQgdGltZSB0byBh
ZGQgQVJDSF9BTUxJUEMuCj4gCj4gVGhhbmtzIGZvciBzaGFyaW5nIHN1Y2ggZGV0YWlscywgd2Ug
YXJlIGFsbCBoYXBweSB0byBzZWUgQW1sb2dpYydzCj4gY29tbWl0bWVudCB0byB1cHN0cmVhbSBv
ZiB0aGVzZSBTb0MgZmFtaWxpZXMuCj4gCj4gQnV0IGFzIEkgZXhwbGFpbmVkLCB0aGlzIEFSQ0hf
TUVTT04gZG9lc24ndCBkZWZpbmUgdGhlIFNvQyB0eXBlCj4gYnV0IGJhZGx5IGRlZmluZXMgdGhl
IEFtbG9naWMgU29DcyBzdXBwb3J0Lgo+IAo+Pj4+IFdlIHNob3VsZCBoYXZlIG5hbWVkIGl0IEFS
Q0hfQU1MT0dJQyBzaW5jZSB0aGUgYmVnaW5uaW5nLCBidXQgd2UKPj4+PiBjYW4ndCBjaGFuZ2Ug
aGlzdG9yeS4KPj4gU2hvdWxkbid0IHdlIGRlc2VydmUgYSBjaGFuY2UgdG8gbWFrZSBpdCByaWdo
dD8KPiAKPiBZZXMsIHNvIHRoZSByaWdodCB0aGluZyB0byBkbyBpcyB0byBtb3ZlIHRvIEFSQ0hf
QU1MT0dJQwo+IAo+Pj4+PiBJbiBteSBvcGluaW9uLCBpdCdzIGEgZ29vZCB0aW1lIHRvIHNwbGl0
IHRoZSBNZXNvbiBhcmNoaXRlY3R1cmUgaW50bwo+Pj4+PiBwcm9wZXIgc3Vic2V0cywgb3IgcmVu
YW1lIGl0IHRyZWV3aWRlIChtYXliZSBvbmx5IGNvbmZpZyBvcHRpb24KPj4+Pj4gQVJDSF9NRVNP
TiA9PiBBUkNIX0FNTE9HSUMpLgo+Pj4+IE1FU09OIGlzIG9ubHkgYSBjb2RlbmFtZSB0byBkaWZm
ZXJlbnRpYXRlIGZyb20gb3RoZXIgU29DIHZlbmRvcnMKPj4+PiBiZWNhdXNlIEFtbG9naWMgdXNl
ZCBpdCBhcyBhIGNvZGVuYW1lIGZvciBhIGxvbmcgdGltZS4KPj4+PiBDb21wYXJlIHRoaXMgdG8g
QWxsd2lubmVyJ3MgInN1bnhpIiBvciBRdWFsY29tbSdzICJtc20iLgo+Pj4+Cj4+Pj4gVGhpcyBj
b25maWcgaGFzIG5vIGZ1bmN0aW9uYWwgbWVhbiwgaXQncyBvbmx5IGEgY29uZmlnIG5hbWVzcGFj
ZS4KPj4+Pgo+Pj4+IFJlbmFtaW5nIGl0IHdvdWxkIG5lZWQgcmVuYW1pbmcgaXQgaW4gYWxsIHN1
YnN5c3RlbXMgS2NvbmZpZy9NYWtlZmlsZXMKPj4+PiBhbmQgd2lsbCBjZXJ0YWlubHkgYnJlYWsg
YnVpbGRzIHdpdGggY3VzdG9tIGtlcm5lbCBjb25maWdzCj4+Pj4gaW4gdmFyaW91cyBwdWJsaWNs
eSB1c2VkIGJ1aWxkcyBsaWtlIEFybWJpYW4sIG1ldGEtbWVzb24sIExpYnJlRUxFQywKPj4+PiBE
ZWJpYW4sIFN1c2UsIC4uLgo+PiBMZXQncyBnZXQgYmFjayB0byBBUkNIX0FNTElQQy4KPj4gV2Ug
anVzdCBuZWVkIHRvIGFkZCBBUkNIX0FNTElQQyBpbiB0aGUgbmVjZXNzYXJ5IHN1YnN5c3RlbXMg
Cj4+IEtjb25maWcvTWFrZWZpbGUuCj4+IFRoaXMgY2hhbmdlIHdpbGwga2VlcCB0aGUgZXhpc3Rp
bmcgTUVTT04gcmVsYXRlZCBjb2RlLMKgIGFuZCB3aWxsIAo+PiBuZWl0aGVyIGludm9sdmUgcmVu
YW1pbmcgbm9yIGJyZWFrIGFueSBidWlsZHMuCj4gCj4gVGhlIGdvYWwgb2YgbWFpbmxpbmUgTGlu
dXggaXMgdG8gYnVpbGQgYXMgbXVjaCBhcyBwb3NzaWJsZSBhbmQKPiBiZSBtb2R1bGFyIGF0IHJ1
bnRpbWUsIHRoZSBvbmx5IHN1cHBvcnRlZCBjb25maWd1cmF0aW9uIGlzIAo+IGFyY2gvYXJtNjQv
Y29uZmlncy9kZWZjb25maWcKPiBhbmQgYWRkaW5nIGEgbmV3IGNvbmZpZyB0byBkaWZmZXJlbnRp
YXRlIGFuIEFwcGxpY2F0aW9uIHR5cGUKPiBkb2Vzbid0IG1ha2Ugc2Vuc2UuCj4gCj4+Pj4gU28g
aXQncyBwb2ludGxlc3MgdG8gY2hhbmdlLCBhbmQgZXZlbiBhZGQgYSBkaWZmZXJlbnQgb25lIHNp
bmNlCj4+Pj4gaXQncyBub3QgYSBmYW1pbHkgZGlmZmVyZW50aWF0b3Igc2luY2UgdGhlIEtlcm5l
bCBpcyBtb2R1bGFyCj4+Pj4gYW5kIHdvcmtzIGFyb3VuZCBEVCB0byBkZXRlcm1pbmUgd2hpY2gg
ZHJpdmVycyB0byBwcm9iZS4KPj4gUHJvcGVyIG5hbWVzIHBsYXkgYW4gaW1wb3J0YW50IHJvbGUg
aW4gdW5kZXJzdGFuZGluZyB0aGUgY29kZSwgcmlnaHQ/Cj4gCj4gWWVzLCBidXQgc3RhYmxlIGNv
bmZpZyBuYW1lcyBhbHNvIHBsYXkgYW4gaW1wb3J0YW50IHJvbGUgZm9yIHRoZQo+IHVzZXJzIGZv
ciBtYWlubGluZSwgYW5kIHRoZXJlJ3MgYSBiaWcgbnVtYmVyIG9mIHVzZXJzIHJlbHlpbmcKPiBv
biB0aGUgc3RhYmxlIG5hbWluZyBmb3IgYWxsIFNvQ3Mgc3RhcnRpbmcgZnJvbSBNZXNvbjYuCj4g
Cj4gU28gaWYgeW91IHJlYWxseSB3YW50IHRvIGdldCByaWQgb2YgdGhlIEFSQ0hfTUVTT04sIG1p
Z3JhdGluZyB0bwo+IEFSQ0hfQU1MT0dJQyBpcyB0aGUgcmlnaHQgdGhpbmcgdG8gZG8sIGJ1dCBp
dCBpbnZvbHZlcyBkb2luZwo+IGEgdHJlZXdpZGUgbWlncmF0aW9uIGFuZCB0aGVyZSdzIG5vIGVh
c3kgd2F5IHRvIGRvIHRoaXMgYW5kIG1ha2UKPiBzdXJlIHRoZSB1c2VycyBzdGlsbCBtYW5hZ2Vz
IHRvIGJ1aWxkIGZvciBvdGhlciBBbWxvZ2ljIHBsYXRmb3Jtcy4KPiAKPiBTbyBhcyB0aGUgQW1s
b2dpYyBBUk0vQVJNNjQgU29DIHN1cHBvcnQgbWFpbnRhaW5lciBJIG11c3QgbWFrZSBzdXJlCj4g
YnJlYWthZ2UgZG9uJ3QgaGFwcGVucywgYW5kIHNvIGZhciBJIGRvbid0IHNlZSBob3cgYWNoaWV2
ZSB0aGF0Lgo+IAo+IE5vdywgeW91IGNhbiBwb3N0IGEgUkZDIHNvIHdlIGNhbiBkaXNjdXNzIG9u
IHNvbWV0aGluZy4KCk9LLiBMZXQncyBjb250aW51ZSB3aXRoIEFSQ0hfTUVTT04uCgo+IAo+IE5l
aWwKPiAKPj4+PiBOZWlsCj4+Pj4KPj4+IFRoYW5rIHlvdSBmb3IgdGhlIGRldGFpbGVkIGV4cGxh
bmF0aW9uOyBpdCBtYWtlcyBzZW5zZSEKPj4+IEFjdHVhbGx5LCBJIGRpc2FncmVlIHdpdGggY3Jl
YXRpbmcgYSBzZXBhcmF0ZSBBUkNIIHdpdGhvdXQgZmlyc3QgCj4+PiByZXdvcmtpbmcKPj4+IGFs
bCBvZiBpdHMgc3Vic2V0cyAtIHRoYXQncyB3aHkgSSBzdGFydGVkIHRoaXMgZGlzY3Vzc2lvbi4K
Pj4+IE5vdywgSSBzZWUgdGhhdCB5b3Ugc2hhcmUgbXkgcGVyc3BlY3RpdmUgYW5kIGJlbGlldmUg
dGhhdCBDMwo+Pj4gc2hvdWxkIGJlIGFkZGVkIHRvIHRoZSBBUkNIX01FU09OIHN1YnNldCwgc28g
SSBoYXZlIG5vIG9iamVjdGlvbnMuCj4+Pgo+Pj4gWy4uLl0KPj4+Cj4+PiAtLSAKPj4+IFRoYW5r
IHlvdSwKPj4+IERtaXRyeQo+Pj4KPj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+Pj4gbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
