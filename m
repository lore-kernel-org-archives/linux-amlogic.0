Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4B2C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 10:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT/KgQ4njwv16I2CfIIKTl5rtc5JlXdJCL+wIeGIgFg=; b=U+U8eVigq7hDZjDA2yXLwI+z+6
	0UV0QqyAKOUrV7WVnJZLIIHbimfsVHxZk+7sRDyCOA6zTgOfiUeWoWLoDIm2Pou4y0IxylMU8k97M
	Ojw08YnJtwQWzr2CkILleKQCUP7OGQ6Vbnwb55v/uMDCzAdR4+s8jGKc7EqD4JTr+u9T+MbUCi4Xa
	rIejmYz9IVIXbGNC6HXiZQMgFcQcbvAM12msQJvX7xF7BP4yaxrYWWxdPPqBq4qysbMdu/4t3afuG
	bS/i7t9psky1Uip+kb/0l8meihn4c1PNrSL/Ga0GJWGzzdNXRTP1Fc+Ln1qedIhEiYUwwEMLV67zC
	te3Pm6Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkj1I-009kyn-00;
	Fri, 07 Apr 2023 10:08:36 +0000
Received: from mail-sgaapc01on2072d.outbound.protection.outlook.com ([2a01:111:f400:feab::72d] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkj1D-009kxu-13;
	Fri, 07 Apr 2023 10:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KF8AjjuvJg418m/kz7kgmam6E6OF1FvvYAzXuq8Tbg8PGJNPaAkgTCBaqciTHSMyAL6PCvPPTu3eevF28iON6YnBnoNXBZn6eBFllc8PukEv9NmD8Tb8t0ikZEY9WLvU7UMiIL6x5lUTGMj84FZ2VP4CqdzwLREypIEZOEEWlGwCJAza+o9iKBlGAO7oPRFVI+XlNI8bT7Eed4lOZLokgr9gDwbRplr4efzDJXVGo9pXQgF+qBTL0AfuS11X8GCiEHnJJ6dGWCF24AGgS3bGLIDUW5ZPm2LSDnTmHb2hOSYk+cTarz1/Ae7PicKfVH/KccALC3GxVcNPdj2DDMPwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3JU+YZvAf2iuW88Ac/wo2w/ZdeMLumyrkd/qm1Ub/P0=;
 b=DgITWUexVMXGZYGWQsDJFti9t14a9Yaf+VL6c5pCqAKY74yP5z6PTIJ0snEjQBOxKFqv1KR4Ja+whEeTSJshpXDY9bMAsoAOb1chG7/aTKulJULi33tP+K/88KXEoQRUO4MU8cv3mmD6lVsvbd7wcaoyaYuzKIlttZPDR7hHRKb0jNJvGudxhoV11N6DvWsE/0xjcvpY73nDfFfcNT9ELQIu+ATVC6+DrYL5E1e84RGlm+A2YtDw7WIlMLi9+sFhEUMdhfWgQLGBNb6MZ0fJDXX63cSlqlZpmiWErwC5Bz2yyanHlxJr8C3d7Hm44rOFgznHoRYoHw/96wr7CT3Gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com (2603:1096:4:1d5::9) by
 SI2PR03MB5971.apcprd03.prod.outlook.com (2603:1096:4:148::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.33; Fri, 7 Apr 2023 10:08:18 +0000
Received: from SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1]) by SG2PR03MB6730.apcprd03.prod.outlook.com
 ([fe80::e116:7d2a:af78:fcf1%6]) with mapi id 15.20.6254.034; Fri, 7 Apr 2023
 10:08:18 +0000
Message-ID: <2e68acd1-f3d1-adbc-5ed2-66c40e006579@amlogic.com>
Date: Fri, 7 Apr 2023 18:08:13 +0800
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
 <d403dda4-e3db-4f26-6996-090a8c520b94@amlogic.com>
 <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1j8rfp6u0h.fsf@starbuckisacylon.baylibre.com>
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To SG2PR03MB6730.apcprd03.prod.outlook.com
 (2603:1096:4:1d5::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB6730:EE_|SI2PR03MB5971:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b64b51-9b48-4fa9-c6d4-08db3750021c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pMfad8yfv+LUTa1kIkVUpLMnjYAUjk39XTvecf6RAb4EJhGwjii8qAUztEzMVql+MYdSG7mf4Dudq3S65iC3HXu7wXLFENaTrzlsFBcjpDniWeSMsuUPuQ3sTioSUJmrfXStwHRVwCtgeYSPvihjH4biogRt1o8qG8Dnq80xVt+x2rlucfyIcUJMkEyBLMQO6ByzMutypUgUVT9xI1yJ9WvW1cjWJPXb4y+22TTmamvs/jeMDOjBjs32wWp3w3Kfgu8i2fPcJu5sG+61l7IMIEYY7kMdUbQjiWg2TpMNkLSgCrFvi6fVmh+75pMiswW0/9gpDiCANn0o+u6E0qmqcue2MATI3ArI6jceiPdjP46PfODk2x4QizukkNrTL+xAKjjTyJn6vLUM89RZxNehca2C2zvz16AbULqtmfS6P41W/mcN8ivdSWS9I94JLM9uSw0M8Gwt/UWFtI7n17+bydyO5+C+Lrpn1Ja3yjGv/7sO+gu9ssM9hIe4LRhNKNIA7Ugczfc9tmO8Slk0QhC7aNBp3gKkCEQqrLEhzBXgZXMMRV7zRLR7yWZo3rlqTKDnNcZ89PATNWh8Qs2RBBCZ8ZA15kYPOIKeeeib4SJfYscNpL+IdczQTS5aLEl5QbVaRm2KpoczAFy8r1ZpdJO4o7rfCvYfcojiHjQ57UvfKY2jKc55ZooCkAgq/tx46nV+1+cNVDV6nP2fjgUgHmGH3w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6730.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(366004)(346002)(376002)(136003)(451199021)(31686004)(36756003)(38100700002)(5660300002)(2906002)(7416002)(44832011)(31696002)(8676002)(86362001)(66556008)(66946007)(66476007)(41300700001)(4326008)(8936002)(83380400001)(2616005)(107886003)(110136005)(26005)(6506007)(6512007)(316002)(53546011)(54906003)(478600001)(6486002)(186003)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?REFRTzlidVk3THppWTg2UkZnVDIyMmJHb2NPcjJLK0g3Mm1HMHRGOFpjL1lt?=
 =?utf-8?B?S2tKdGoyVlRKVzRaNHdaWGU1MGJpNko3bWJQTE82anZWTWxCYzRhODJGMDJB?=
 =?utf-8?B?eDFRUVdYa05SeVA3NVpMTExQSU15QmRQaUdwbjRJOG11Skk5MHBOWUFNcExv?=
 =?utf-8?B?MEVyNjgzbmhwTEw2OUM1akhTMkxIUlBsdXVzVElMd1IxMnlNazUybC9BSDlJ?=
 =?utf-8?B?ZHNzV0E0QU5kSmVtRk5VMkFGUkZVTTBTbzNTdUliME03bzh6M0c0elg1TFMx?=
 =?utf-8?B?TkNqVnpUeFp1ckJSbDR4RjlCWkdRTjdHTWVPVXZrdS9jdVpCN1IxS3JQQTNj?=
 =?utf-8?B?c0lrU0xUSUFKam40Z0pRZ3k0R29MekQzSTlIMTF1WGxVMWJ6Y3pvaDFqSkRC?=
 =?utf-8?B?T05RREJJaWpEVWJEMyt2azBJOEdtSXlYdDgzcHovTTBubXExVXNJR2RzMWVh?=
 =?utf-8?B?Mlg5MGVyUG1YUW9qRzFmY2I3ZHdDcWFiVFgyT0NpdisxUFRxTzg3SXR0OGpn?=
 =?utf-8?B?MTZrZXlqU0hKY2g2WkoxRFR4ek1aWEFMN0lqVzVCNzZDUmR0WVlnVEhaTVJk?=
 =?utf-8?B?NVBDTlg3S2VPeEs3cHdPallLaVk2VmJaNFJKbFVWd2F2S0tMd1d0NlBjMVM4?=
 =?utf-8?B?anJ4TXFtWUFLRUZqVlJBdmZDSkt4dGpMKytqNzJ2UnBweWZMK0Ezdkc0SnBo?=
 =?utf-8?B?dmxZV2JzaHNRTE0rZk9oT0N1eWh5VHZ0ZW0xVlRHb01LZkpXWC91ZnlPSEpj?=
 =?utf-8?B?ZjdMT3FWdFRrUE9NUTRCcHoyVzZBR1NKK3IzVmpiYlE3UXZzQVRHMlJCK0xL?=
 =?utf-8?B?aFA3WUxtdFQ2b2w3L1o4QktLMDh5NnQrQlV1Nkoxamc4VHFqNDdpWktyb2F5?=
 =?utf-8?B?OXkxVTVseVE3REhURE9uekJ4djhnMTNmN1ZUOG5FMzIrMzVjRnJTMWJ0czJO?=
 =?utf-8?B?KzVCdTZFTkI4QWtTN1BhUDRLUytQT2xyREpJcnZmUGdlYlhsQlc4RXMrc3du?=
 =?utf-8?B?RURIaXJrSDhjUEJpYnN3ekYzZ0wwZytTV0FsY0R1U1Q5YUxydVVRUzVSMUY1?=
 =?utf-8?B?V1MyRVZwSmtMSE9jSjJnQkVxTGpkOXBhQm4yY3JJUGFmU3k1VWxEOVd3NFlJ?=
 =?utf-8?B?ZWxDQURTMnFMbnBtVXJYbDU4QkYrYTVGWG8rTkd5RVpkR1JrcElaaUVpZnM2?=
 =?utf-8?B?RXA1NkdzMGFYUjBFRkJUNFcvUlZJUEdlT2VDc1VveFVvZjBuVDhrMENFQ28z?=
 =?utf-8?B?VHZqeDBWQTlwODdoU0ZlQTlpbWJackljZUhmYjNscjZFSExkT2JrUVFDbjhK?=
 =?utf-8?B?bUYrZ0Vhc3lIa3F0K0R0U0J2cXVCR2RBakFFWnVSbldLei9qZ0RZMllLcitL?=
 =?utf-8?B?T0JpRWtqMk96R29HTEVFOC9oaEx5bFd6T0gxTzQxcUkzQmJiYllIVjZRY3B3?=
 =?utf-8?B?OVFOemdPSE5rWnBHdDB0bGNHSXdvb1BMT3NPU1pMdU5Wbm9tNW1FK2tScTUz?=
 =?utf-8?B?c3BmTjZ0RUs5OXQ2eFVPWTkyQk9Rcms1ajU3RmcvRUM1QzIzNmlrbnkrVzBD?=
 =?utf-8?B?S1dsWm9FdzNjZURYS2JtUWhIRG1rQ0pCMGR5TnE5Y0tIa0NJWTNXUCtvR1lp?=
 =?utf-8?B?NVB0Y1NLb0o2MlFQbHk1OEZ0RlVkbWJ1aERaMUtaQndmdElLUldOTUpLa1Fx?=
 =?utf-8?B?S0RtY3dJcitpaWNEY2t4cllIVHZxUWl6MEk0bGdnKy9lNURFVndOdnNOcDFY?=
 =?utf-8?B?VDdpZ1REYmk1NVIvWWxpOElhN000Y2RhVVBUdDBaeDZnTHRsL2owV3lVRFY3?=
 =?utf-8?B?RW9TTkhmN3dRZG5sd2hGaW1waGFaTnA2dnpncDRRdjQ4a00rT3V0bThNT1J1?=
 =?utf-8?B?ajlXdGovZFhvSmNwbXBiYWRXOWpGZ29IZ1laak9nOWd1UkFSKzlZeG9SVVFH?=
 =?utf-8?B?bmkxWXpWRElVYTBSNXlQOENrNVU4bzArUUF3a3l5aERCYldvL3ZIcWIycGxx?=
 =?utf-8?B?Zi9OeWczK1BTSHlvQ01vczBaSmJIRlhlbFN3M1ozZFpacHNIS2kxdFI4NnhB?=
 =?utf-8?B?T1pDMkp2WDMvS0p1MXhlSFRFbDBHenpNV204cHJxZkRKQytCOU9BN3RmaEw0?=
 =?utf-8?Q?xHs7MIkpDoc0iqCjpMbhAg6DT?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b64b51-9b48-4fa9-c6d4-08db3750021c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6730.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 10:08:17.7127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR04uRXufwlpS0yCUsjJ5Ml178rnbnoNl4N8PbNAa+GViSZq5nRkGhhq3PDat2g0N0DFZf4gqFb1vY32ApVUNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB5971
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_030831_395278_7A1B5A0E 
X-CRM114-Status: GOOD (  37.98  )
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

CgpPbiAyMDIzLzMvMjIgMTY6NDEsIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4gWyBFWFRFUk5BTCBF
TUFJTCBdCj4gCj4gCj4gT24gV2VkIDIyIE1hciAyMDIzIGF0IDE1OjQ2LCBZdSBUdSA8eXUudHVA
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+PiBPbiAyMDIzLzMvMjEgMTc6NDEsIEplcm9tZSBCcnVu
ZXQgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4gSGkgSmVyb21lLAo+PiAJVGhhbmsg
eW91IGZvciB5b3VyIHJlcGx5Lgo+Pj4gT24gVHVlIDIxIE1hciAyMDIzIGF0IDEwOjI5LCBZdSBU
dSA8eXUudHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4KPj4+PiBIaSBNYXJ0aW7vvIwKPj4+PiAJ
Rmlyc3Qgb2YgYWxsLCB0aGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCj4+Pj4KPj4+PiBPbiAyMDIz
LzMvMjAgMjM6MzUsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3JvdGU6Cj4+Pj4+IFsgRVhURVJOQUwg
RU1BSUwgXQo+Pj4+PiBIZWxsbyBZdSBUdSwKPj4+Pj4gT24gTW9uLCBNYXIgMjAsIDIwMjMgYXQg
MTI6MzXigK9QTSBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
IFNpbmNlIHRoZSBwcmV2aW91cyBjb2RlIG9ubHkgcHJvdmlkZXMgInJvX29wcyIgZm9yIHRoZSB2
aWRfcGxsX2Rpdgo+Pj4+Pj4gY2xvY2suIEluIGZhY3QsIHRoZSBjbG9jayBjYW4gYmUgc2V0LiBT
byBhZGQgIm9wcyIgdGhhdCBjYW4gc2V0IHRoZQo+Pj4+Pj4gY2xvY2ssIGVzcGVjaWFsbHkgZm9y
IGxhdGVyIGNoaXBzIGxpa2UgUzQgU09DIGFuZCBzbyBvbi4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBZdSBUdSA8eXUudHVAYW1sb2dpYy5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4gcGxlYXNl
IGRlc2NyaWJlIHRoZSBjaGFuZ2VzIHlvdSBkaWQgY29tcGFyZWQgdG8gdGhlIHByZXZpb3VzIHZl
cnNpb24ocykKPj4+Pgo+Pj4+IEknbGwgYWRkIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4+Pj4K
Pj4+Pj4gWy4uLl0KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxs
LWRpdi5oIGIvZHJpdmVycy9jbGsvbWVzb24vdmlkLXBsbC1kaXYuaAo+Pj4+Pj4gaW5kZXggYzAx
MjhlMzNjY2Y5Li5iYmNjYWIzNDA5MTAgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9t
ZXNvbi92aWQtcGxsLWRpdi5oCj4+Pj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi92aWQtcGxs
LWRpdi5oCj4+Pj4+PiBAQCAtMTAsMTEgKzEwLDE0IEBACj4+Pj4+PiAgICAgI2luY2x1ZGUgPGxp
bnV4L2Nsay1wcm92aWRlci5oPgo+Pj4+Pj4gICAgICNpbmNsdWRlICJwYXJtLmgiCj4+Pj4+Pgo+
Pj4+Pj4gKyNkZWZpbmUgVklEX1BMTF9ESVZfVEFCTEVfU0laRSAgICAgICAgIDE0Cj4+Pj4+IElu
IHYxIHlvdSB1c2VkIEFSUkFZX1NJWkUodmlkX3BsbF9kaXZfdGFibGUpIHdoZXJldmVyIHRoaXMg
bmV3IG1hY3JvCj4+Pj4+IGlzIHVzZWQgaW5zdGVhZC4KPj4+Pj4gSSB0aGluayB1c2luZyBBUlJB
WV9TSVpFIGlzIHRoZSBiZXR0ZXIgYXBwcm9hY2ggYmVjYXVzZSBpdCBtZWFucyB0aGUKPj4+Pj4g
cmVmZXJlbmNlcyB3aWxsIHVwZGF0ZSBhdXRvbWF0aWNhbGx5IGlmIGFuIGVudHJ5IGlzIGFkZGVk
L3JlbW92ZWQgZnJvbQo+Pj4+PiB2aWRfcGxsX2Rpdl90YWJsZQo+Pj4+Cj4+Pj4gSSBhZ3JlZSB3
aXRoIHlvdS4gUGVyaGFwcyB0aGUga2V5IGlzIHRvIHVuZGVyc3RhbmQgd2hhdCBKZXJvbWUgc2Fp
ZC4KPj4+IEkgYXNrZWQgeW91IHRvIGRlc2NyaWJlIGhvdyB0aGlzIGRpdmlkZXIgYWN0dWFsbHkg
d29ya3MuIE5vdCByZW1vdmUKPj4+IEFSUkFZX1NJWkUoKS4KPj4KPj4gT0theSEgSSBtaXN1bmRl
cnN0b29kIHlvdXIgbWVhbmluZy4KPj4KPj4+IFRoaXMgZGl2aWRlciB1c2VzIHRhYmxlcyBvbmx5
IGJlY2F1c2UgdGhlIHBhcmFtZXRlcnMgYXJlICJtYWdpYyIuCj4+PiBJJ2QgbGlrZSB0aGUgZHJp
dmVyIHRvIGJlIGFibGUgY29tZSB1cCB3aXRoICJjb21wdXRlZCIgdmFsdWVzIGluc3RlYWQuCj4+
PiBXaGF0IEkgcmVxdWVzdGVkIGlzIHNvbWUgZXhwbGFuYXRpb24gYWJvdXQgaG93IHRoaXMgSFcg
Y2xvY2sgd29ya3MKPj4+IGJlY2F1c2UgdGhlIGRvY3VtZW50YXRpb24gaXMgbm90IHZlcnkgY2xl
YXIgd2hlbiBpdCBjb21lcyB0byB0aGlzLiBUaGVzZQo+Pj4gdmFsdWVzIG11c3QgY29tZSBmcm9t
IHNvbWV3aGVyZSwgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCAiaG93Ii4KPj4+IFRoaXMgaXMgdGhl
IHNhbWUgYXMgdGhlIFBMTCBkcml2ZXIgd2hpY2ggY2FuIHRha2UgYSByYW5nZSBhbmQgY29tZSB1
cAo+Pj4gd2l0aCB0aGUgZGlmZmVyZW50IHBhcmFtZXRlcnMsIGluc3RlYWQgb2YgdXNpbmcgYmln
IHByZS1jb21wdXRlZCB0YWJsZXMuCj4+Pgo+Pj4+Cj4+Pj4+IEFsc28gSSB0aGluayB0aGVyZSdz
IGEgZGlmZmVyZW50IHVuZGVyc3RhbmRpbmcgYWJvdXQgd2hhdCBKZXJvbWUKPj4+Pj4gcHJldmlv
dXNseSB3cm90ZToKPj4+Pj4+IEl0IHdvdWxkIGJlIG5pY2UgdG8gYWN0dWFsbHkgZGVzY3JpYmUg
aG93IHRoaXMgdmlkIHBsbCB3b3JrIHNvIHdlIGNhbgo+Pj4+Pj4gc3RvcCB1c2luZyBwcmVjb21w
dXRlICJtYWdpYyIgdmFsdWVzIGFuZCBhY3R1YWxseSB1c2UgdGhlIElQIHRvIGl0cyBmdWxsCj4+
Pj4+PiBjYXBhY2l0eS4KPj4+Pj4gICAgRnJvbSB3aGF0IEkgdW5kZXJzdGFuZCBpcyB0aGF0IHlv
dSBpbnRlcnByZXRlZCB0aGlzIGFzICJsZXQncyBjaGFuZ2UKPj4+Pj4gQVJSQVlfU0laRSh2aWRf
cGxsX2Rpdl90YWJsZSkgdG8gYSBuZXcgbWFjcm8gY2FsbGVkCj4+Pj4+IFZJRF9QTExfRElWX1RB
QkxFX1NJWkUiLgo+Pj4+PiBCdXQgSSB0aGluayB3aGF0IEplcm9tZSBtZWFudCBpczogImxldCdz
IGdldCByaWQgb2YgdmlkX3BsbF9kaXZfdGFibGUKPj4+Pj4gYW5kIGltcGxlbWVudCBob3cgdG8g
YWN0dWFsbHkgY2FsY3VsYXRlIHRoZSBjbG9jayByYXRlIC0gd2l0aG91dAo+Pj4+PiBoYXJkLWNv
ZGluZyAxNCBwb3NzaWJsZSBjbG9jayBzZXR0aW5ncyBpbiB2aWRfcGxsX2Rpdl90YWJsZSIuIExv
b2sgYXQKPj4+Pj4gY2xrLW1wbGwuYyBhbmQvb3IgY2xrLXBsbC5jIHdoaWNoIGFsbG93IGNhbGN1
bGF0aW5nIGFyYml0cmFyeSByYXRlcwo+Pj4+PiB3aXRob3V0IGFueSBoYXJkLWNvZGVkIHRhYmxl
cy4KPj4+Pgo+Pj4gZXhhY3RseSAuLi4gb3IgYXQgbGVhc3QgYW4gZXhwbGFuYXRpb24gYWJvdXQg
aG93IGl0IHdvcmtzIGFuZAo+Pj4gd2h5IGl0IGlzIHRvbyBjb21wbGljYXRlZCB0byBjb21wdXRl
IHRoZSB2YWx1ZXMgYXQgcnVudGltZS4KPj4+Cj4+Pj4gSW4gZmFjdCwgcGxsIGFuZCBtcGxsIGFy
ZSBhbHNvIGZpeGVkIHJlZ2lzdGVyIHdyaXRlcyBjb3JyZXNwb25kaW5nCj4+Pj4gdmFsdWVzLgo+
Pj4gVGhhdCBpcyBub3QgdHJ1ZS4gVGhlIHBsbCBhbmQgbXBsbCBkcml2ZXJzIGFyZSBhYmxlIHRv
IGNvbXB1dGUgdGhlaXIKPj4+IHZhbHVlcyBhdCBydW50aW1lLiBQbGVhc2UgaGF2ZSBhIGxvb2sg
YXQgdGhlIGRyaXZlcnMuCj4+Pgo+Pgo+PiBBZnRlciBjb25zdWx0aW5nIHRoZSBlbmdpbmVlciBv
ZiB0aGUgY2hpcCBkZXNpZ24sIHRoZSBjbG9jayBpcyBhIGRpZ2l0YWwKPj4gZnJlcXVlbmN5IGRp
dmlkZXIsIGFuZCB0aGUgZnJlcXVlbmN5IGRpdmlkZXIgaXMgdmVyaWZpZWQgYnkgdGhlIHNlcXVl
bmNlCj4+IGdlbmVyYXRvciwgd2hpY2ggaXMgYml0MC1iaTE1LiBiaXQxNi1iaXQxNyBjb25maXJt
cyB0aGUgc2l6ZSBvZiB0aGUKPj4gZnJlcXVlbmN5IGRpdmlzaW9uLgo+IAo+IFRoYXQsIHdlIGFs
cmVhZHkga25vdy4gVGhpcyBpcyB3aGF0IHRoZSBkYXRhc2hlZXQgYWxyZWFkeSBnaXZlIHVzLgo+
IEl0IGlzIHN0aWxsIGEgYml0IGxpZ2h0Lgo+IAo+IFlvdSBkb24ndCBzZXQgdGhlIGJpdCByYW5k
b21seSBhbmQgY2hlY2sgdGhlIG91dHB1dCwgZG8geW91ID8KPiAKPiBUaGUgcXVlc3Rpb24gaXMg
aG93IHNldHRpbmcgdGhpcyBiaXQgaW1wYWN0IHRoZSByZWxhdGlvbiBiZXR3ZWVuCj4gdGhlIGlu
cHV0IGFuZCBvdXRwdXQgcmF0ZT8gSU9XLCBmcm9tIHRoZXNlIDE3Yml0cywgaG93IGRvIHlvdSBj
b21lIHVwCj4gd2l0aCB0aGUgbXVsdGlwbGllciBhbmQgZGl2aWRlciB2YWx1ZXMgKGFuZCB0aGUg
b3RoZXIgd2F5IGFyb3VuZCkgPwo+IAo+PiBXaGVyZWFzIG90aGVyIFBMTFMgYW5kIE1QTExTIGFy
ZSBhbmFsb2cgZGl2aWRlcnMgc28KPj4gdGhlcmUgYXJlIGZpeGVkIGZvcm11bGFzIHRvIGNhbGN1
bGF0ZS4KPj4KPj4gU28gTmVpbCBoYWQgbm8gcHJvYmxlbSBpbXBsZW1lbnRpbmcgaXQgdGhpcyB3
YXkuIFNvIG5vdyBJIHdhbnQgdG8ga25vdyB5b3VyCj4+IGFkdmljZSB3aGF0IHNob3VsZCBJIGRv
IG5leHQ/Cj4gCj4gMSkgTmVpbCBkaWQgd2hhdCBoZSBjb3VsZCB0byBnZXQgY29tcHV0ZSB0aGUg
cmF0ZSAoUk8pIHdoaWNoIHRoZSBsaXR0bGUKPiBpbmZvcm1hdGlvbiBoZSBoYWQuIFlvdSBhcmUg
dHJ5aW5nIHRvIGV4dGVuZCB0aGUgZHJpdmVyLCBrZWVwaW5nIGFuCj4gZHVtbXkgYXBwcm9hY2gu
IEl0IGlzIG9ubHkgZmFpciB0aGF0IEkgYXNrIHlvdSB0byBtYWtlIHRoaXMgYSByZWFsCj4gZHJp
dmVyLgo+IAo+IDIpIEJlY2F1c2Ugc29tZXRoaW5nIGhhcyBiZWVuIGRvbmUgb25jZSwgaXQgbm90
IG5lY2Vzc2FyaWx5IGFwcHJvcHJpYXRlCj4gdG8gY29udGludWUgLi4uIHRoaXMgdHlwZSBvZiBh
cmd1bWVudCBoYXJkbHkgYSB2YWxpZCByZWFzb24uCj4gCj4gSSBkb24ndCB3YW50IHRvIGtlZXAg
YWRkaW5nIHRhYmxlIGJhc2VkIGRyaXZlciB1bmxlc3MgbmVjZXNzYXJ5Lgo+IFNvIGZhciwgeW91
IGhhdmUgbm90IHByb3ZlZCB0aGlzIGFwcHJvYWNoIGlzIHJlYWxseSByZXF1aXJlZCwgbm9yCj4g
cHJvdmlkZWQgdGhlIG5lY2Vzc2FyeSBpbmZvcm1hdGlvbiB0byBtYWtlIHRoZSBjYWxjdWxhdGlv
bi4KClRlY2huaWNhbGx5IHlvdSBhcmUgcmlnaHQuIEkgYW0gY29tbXVuaWNhdGluZyBhbmQgY29u
ZmlybWluZyB3aXRoIHRoZSAKY2hpcCBkZXNpZ25lciB0byBzZWUgaWYgdGhlIGdlbmVyYWwgY2Fs
Y3VsYXRpb24gZm9ybXVsYSBjYW4gYmUgZ2l2ZW4uIElmIApub3QsIEkgd2lsbCBleHBsYWluIHdo
eS4gUGxlYXNlIGdpdmUgbWUgc29tZSB0aW1lLgoKQnV0IEkgaGF2ZSB0byBtZW50aW9uIHRoYXQg
dGhlIFNPQywgYWx0aG91Z2ggdGhlcmUgaXMgdGhpcyByZWdpc3RlciBidXQgCmFjdHVhbGx5IGRv
ZXMgbm90IHVzZSB0aGUgY2xvY2suIENhbiB3ZSB0cmVhdCB0aGlzIGFzIGEgc2VwYXJhdGUgcGF0
Y2ggCnRoYXQgd2Ugd2lsbCBjb250aW51ZSB0byBzZW5kIGFuZCBleHBsYWluIGxhdGVyPwoKVGhp
cyB3YXkgSSBjYW4gY29udGludWUgd2l0aCB0aGUgb3RoZXIgcGF0Y2hlcyBvZiBTNCBTT0MgZmly
c3QsIGFuZCB0aGlzIApjbG9jayBzdGF5cyB0aGUgc2FtZSB3YXkgYXMgdGhlIEcxMkEgZmlyc3Qu
IExhdGVyLCBhZnRlciB0aGUgcGF0Y2ggb2YgCnRoZSBjbG9jayBpcyBjb3JyZWN0ZWQsIGl0IGNh
biBiZSBjb3JyZWN0ZWQgdG8gIm9wcyIgYXMgCnJlcXVpcmVkLk90aGVyd2lzZSwgd2UgY2Fubm90
IGNvbnRpbnVlIG90aGVyIGRyaXZlciBwYXRjaGVzLiBJIGRvbid0IAprbm93IGlmIHlvdSBhZ3Jl
ZT8KCj4gCj4+Cj4+Pj4gQnV0IGV2ZXJ5IFNPQyBpcyBkaWZmZXJlbnQsIHNvIGl0IG1ha2VzIG1v
cmUgc2Vuc2UgdG8gc2V0IGl0Cj4+Pj4gb3V0c2lkZS4gVGhlIFZJRCBQTEwgaXMgYSBmaXhlZCB2
YWx1ZSBmb3IgYWxsIGN1cnJlbnQgU29Dcy4KPj4+Pgo+Pj4+PiBCZXN0IHJlZ2FyZHMsCj4+Pj4+
IE1hcnRpbgo+Pj4+Pgo+Pj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
