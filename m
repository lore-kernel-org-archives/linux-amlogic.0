Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C37AEB64D9
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jul 2023 08:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T5zRfw6mnowSVDvmIFpd9MrxQCBi2hRqlRDH4+a3wwk=; b=4DF0jZAuLWtoSB
	9Gs8zsAmqqgV1mxYRB9MPER6qrmhcHBNi7d5u1YJrHC9FfUbYteA5t9KV1lH04gJFRSQZ10+/zBZI
	P4l8JSGyXUEbHqNUUtsRXy4wwIMh61aTCYX3X/hAUEh5F855/lqr6vQz2flZmR5dEQdjIKudAQKDc
	JZ5Knl9Teg2UESWT0D8UJDv1nyIawjFRBdZJfhEp/Ef1V3KsaQkDYs8pNFa2Q+zM75FRrxzgkYe8f
	Wza4eKBaiCTPxdUiVSuMkyT2FCiYXJ8ROGsRqs3zVj9J3g/iH1p4cD1tmRTurGTo5YrIjvsL6/rNG
	y9t81ckKDSRBOpIUNBMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUz3-00GsNO-1T;
	Wed, 12 Jul 2023 08:14:01 +0000
Received: from mail-tyzapc01on20722.outbound.protection.outlook.com ([2a01:111:f403:704b::722] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJUyy-00GsLy-2l
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Jul 2023 08:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fK0CQch+cV9vjOIaZQoMc70Msn2PkWmSVE9dtHNUrzxSQ2gjwDCgaMCkGlu1eDgVs55I36EkAfLnjvZs/0ZdBujKTzsILNhyqpKU2TPgutRK6mXAWK0xxp37mXlQOZkhrTaMhOFDLi3sDSglHe/o7yVklZePo5fXQPPfMlBwhI5P1YoWXfL3BiPyURo/miSwgO/suaCg8xtE331NuvQKSIf8ZN13jp480LB9XHzGb1wy+f2TfkcemDKXalGdNpke1VJsi8soOvXPHgPvdH8xAT7mNkvEdTeShaR40/EMLp6h8q67Yo6hPnAz1yd4BxTc3+oYME8xMS6y8y2p2e+A3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vgvj9i8WuHJ3VFRZLwvhoKTz+hGp5LXPh+342T76Zic=;
 b=ZV1jwq6ZPdTUd6WtvmcCq6Jj86ETtblQU4zNgtyqCEvtpAYiOTgfb2W9r5TyxS5zNpThDhDqihf0yj+lHqm3IHq7BHnx61Mvlq3YuJJHVakZ9yfq9WSYWf/qmTbERzPfL15eBfj2LwQaHHSRfdZxNLZgEJjTsAvlZV7vnAyyHXHKljCJD5nUHzIqw6FHjAw7aQKICWrSz2oLGRPopGEDPgNfRHrjDqQ3ecpja5lPBHFhzrmDVmq5vZ70O2f4FyeCDxNFE4sBvmHbJ2uwxjPR3qVq5hvya/AZlNNSUskX4uaOxhg6i+CyoTTxiN82WI7tYL0uw7ePjRn0qguU7u3eiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vgvj9i8WuHJ3VFRZLwvhoKTz+hGp5LXPh+342T76Zic=;
 b=Vdu0LxHgoY1fy0BfJIoF24gmwhp8vCQnrlDJ84FSZBEe/9AJwXK4+NGxqvlIdjrNO1ncqTRTcvBWz4sl/f2D1a5bxIq3dzKQYlbPAecpc48yVOFCOhiAZsjoEjbJL+PZUABkWqUp7BuiEkT2LAxVCGU5WFjNXgcZG3wI8502iN+JCgG0NAnNqQNurnSFc22dcscH+1luH/J29hLrDLD9/khZUDTQlI8lQ7pHX3nO0VGrOCH2/q41zgkGRHO1sCpfIk6w3hpcKOWFRXiMO11XfLAPKYEhVBTYxkmZC2E84VyI906Nyp1y198/6IyEnQ+GLXGBerWu1iOoWLSKYCjV5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5382.apcprd06.prod.outlook.com (2603:1096:4:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 08:13:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 08:13:45 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/27] thermal/drivers/amlogic: Convert to platform remove callback returning void
Date: Wed, 12 Jul 2023 16:12:32 +0800
Message-Id: <20230712081258.29254-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR04CA0208.apcprd04.prod.outlook.com
 (2603:1096:4:187::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5382:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4091b3-856e-4c91-7e81-08db82afe915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YaVQ5HxBs/7drPtb4H+hFYP4ih46/4guW80n1zFNN5z36G8VEZmKdi9b8x61qLzUOlSH1ess5DtG3q833bf+sj/ar9PbRYuLn4oX87ri5yiDxZIePesu8CW2R+CR3l5p2q3c1i/4Q0W8lmOAoVI+us2zBg+5d8+thE8a+aW+mTzL1mdVfAMJs1xhLPEM+vlVEy+bQS+NC+h6pe/21z1ku4A+6KBqtNmJQmsEIPXylhJeLXZ0ffqCrZeiZolauQVK9YRNISHAjScAijtPQztSEPB9XVpmZH4BzOvqX7/JRts4xkP1QqGxL3cZCs4d5XcMGWg8gCR3gWsu5L7GXMRe8DiS0zD0V6BrT+2i4ssw9V0i+z/e0MEw0VEyNh2CH0g1LBwsGR8NHF0h/XY5WxUII/EbmlMiIiAixMKdyrt8fWLYkqeNAJsxRdGFYIjhHtiXBccHDDIjuhen3cCskAZPf7UGhPWqGzEX3CjuKCM4emN267RCHyxKZnZLuO61MrDixA42lcBaUcagjpBGlaUnTIerLThvzJOdiSy4XcMZSZ5KCb/xB9PtkkOA8a1JE4cAsSmS5o3tvTDM8FCnBAaqaQN8DOKkM9I7DkkcVFxJPSBcDHdFyXW3o2Z8b+DV+Y/t
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(6666004)(52116002)(6486002)(478600001)(54906003)(110136005)(6506007)(1076003)(26005)(186003)(6512007)(2906002)(66946007)(41300700001)(66476007)(316002)(8936002)(66556008)(4326008)(5660300002)(38100700002)(38350700002)(8676002)(86362001)(36756003)(2616005)(83380400001)(66574015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytNS0dQeWpqSUtqeGI3b2t1NTh5VmVlT2xobnhkRER2Wk9ZSW1kOUg2Q2sv?=
 =?utf-8?B?YVBHcWxidzY4UlVEOUhJa0ZNNGwrcnZ1V0ptRi9mcHJDY2pFUkNnUUlockU1?=
 =?utf-8?B?aEZ2V2dQRWo1YlhsR25lM29XdDdkUmpKRi9zRzU3ZEVZTzN4c0lMREJyQWZK?=
 =?utf-8?B?VlNCWFpOYjhWTTVqSEtQY1hDWXoxWnQyT0JIZXdBQVdsc0l6RUR1dEpNQzNp?=
 =?utf-8?B?Q1Zpc01FSHlHOTZqWWs5clgrczhtclpIckFLOTI0ZGRaSDB4N0hkWnFzb2oy?=
 =?utf-8?B?SVBRY1lEZG81MllSVzE2cnBIWC9mUVNCczcwVTd0TDFwSEE3Zis3eWRsZ3Zp?=
 =?utf-8?B?eUhGaHA2cHQ1MFUvQktHbG81THZxSmNxK1JRT3B3d01DUU1Xb3F5dWF1d2Jk?=
 =?utf-8?B?R0dpM0NkeTM4TmJpVTJQSUVzdHZHMUYyenJPZVRkblFzVnRJQXUwcGpVN2Fs?=
 =?utf-8?B?NStYTVBXRWpDZmJIV0VqaGZTckVveXE3aWxybnFSMXZSbE5GdTRQaWkvVUV6?=
 =?utf-8?B?U2hWb3RiODlsV3RPLzdNL1k5MDdZWVEyanMrUFBUc0pKd0RBZXJWaHFWOUlG?=
 =?utf-8?B?MzB5U0RDL1FzNlFBM1VXdzZZOUZXbkM3TzZoeEJPQjBQd0xjRlJia0dISFFn?=
 =?utf-8?B?U2R1MXhaM2YyTWtidVRoVVJPMGwzR3BSR1IvL0NtL2RHN0NRTlJYWGpMVU10?=
 =?utf-8?B?djhxN1UyVCtvRENQQ3FIa3NTZENXOVdLaHJ1WUhwWE1PdGxpcVJNeDYxNC9U?=
 =?utf-8?B?N2h1am56UWt5MXp5bFJPdldQNG5lekg0NzVrVXhwZkFZbEEvV0o4d3ExLzhs?=
 =?utf-8?B?QmFxVGxqZ0FhUnI5VnNWbi9aSWgrSGhZRTlSNkJ6Y2JleTZPbmNXVXp1NEE1?=
 =?utf-8?B?UWdWTmcxT21FK3BxUllMcVRPRENkSGZlM3plaVBvZUpHcnBYODl0MmJLdUUx?=
 =?utf-8?B?SmVOU2pFdEhDMXpwSjdpS3VZS0RhamNRRjVTV0d3RFYxY1dweXFsRElwZnVG?=
 =?utf-8?B?U2pON0h1em1BTFMzK3RiUXVFZDJQa2FSbC84azFna1A0enFxeHI2ZHdrSTdX?=
 =?utf-8?B?WXhJZExkMXFvY2Q0RFlROFZqNnZFcjBmc2EyRkFEOTRYQjlVWWJzaS9rbjVi?=
 =?utf-8?B?MXhuVDNLWVJlREZCMnZwS2lzMW9JV1gxOTU4Ump2ZHhYSm5ZMHBtZTR1Smkv?=
 =?utf-8?B?c1VsK0FFUVRYcGh0QkwrUWVkczQ2TjFTWEp0NHNEZGZuZzF6R0hlN1pzTUVZ?=
 =?utf-8?B?NzNUYWtVU2NVTUFRZlBQcGQ0UjdHbkZPTmhrc0VjVWFHcjQ4SEJwbDh2UHdw?=
 =?utf-8?B?MnNoeDZZUDJEL1V6bHNEL2JESElSQ01yWHZ2TndqT09YYTlzNmFJbnRSR3Nn?=
 =?utf-8?B?TVFZbmppQ2Z6TEpPV25yVUNmOTZ6WUJXR1hocUtSYUxjMHQrdGVKc2daSit2?=
 =?utf-8?B?UnMxdXdCQ3kyaUxqQkRYdmxuNHFCM296cWNIck41UEpUVGxRaW5tMS96WEkx?=
 =?utf-8?B?RlVEOTNERERXZzR2ZnF4VmZYRVVlbkVUdXI4QUNUZDMrU3d1K0VYMlJ3dHVL?=
 =?utf-8?B?cWZRQko4T1d1REpLMHp4VEdXeWVacGJtT3lwRnVDTlRhc2RTck8rWk9ZZUVw?=
 =?utf-8?B?cWIrSngxT05sQnR4M3djVTJ3bmtvcWExMDlsVC9ieGd5azhxRFN2Zlh3b1Jp?=
 =?utf-8?B?clhZRm1sOEFrVmlJVTFhUUMvdXpJSEdsTXdNbk5PNzMwVFptZU9RcEs0S0xM?=
 =?utf-8?B?U2RZem1xTlh5NUVuaGdkMko4MTRZQkNKbHV2WGR4Yng5alBsMkhjb21HVjVL?=
 =?utf-8?B?NU9PM3B1K1ZDcndRZ2NqVXFVaEpTUVpWZzE0NUZnRlhnNnJ0OWlZbnhodzF5?=
 =?utf-8?B?ellHSXpHM2xtY3lPUEEvL0FEWGdsRUNqcVNZWWlhVnFVSjk2L2R5WG83ZDVz?=
 =?utf-8?B?ZG9rdTg3bXJuLzdNanBqSU9kVS8zZWpHTkoyb1UrSm40V3h5SnNqVnFzcjBh?=
 =?utf-8?B?d0ZhQkhqWkI5eUdIMGF1UGR6TDUzSXpSTjRwa0Z6WExjV1BqWXVTRGxMeWVK?=
 =?utf-8?B?S3RMTWhOT3U2STlqT2NxbjM3VXRzOWVld2tEODNJcWxnazN5TE5BMmEyd292?=
 =?utf-8?Q?xs/8wuCfXwMRzDFxDqV9I/gKz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4091b3-856e-4c91-7e81-08db82afe915
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:13:44.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BciyjHRJpLHa5vuFCzM08WPHN5NGoox5vGoe9OxnxrTnsHmXLGjD3c8dYavKMYIh1Dp5md4uaSLL2vStBNGcbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_011357_927039_9E27DF84 
X-CRM114-Status: GOOD (  13.38  )
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

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMKbWFueSBkcml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBv
c3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5CnJldHVybmluZyBhbiBlcnJvciBjb2RlLiBI
b3dldmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCmFuZCB0aGlzIHR5
cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUg
aXMgYQpxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRo
ZSBmaXJzdCBzdGVwIG9mIHRoaXMKcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAu
cmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwp2b2lkLgoKVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQpj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KCkNjOiBVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBZYW5n
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190
aGVybWFsLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFs
LmMgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKaW5kZXggNzU2YjIxODg4MGE3
Li5hOTVjODk1OWU1YWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9hbWxvZ2ljX3RoZXJt
YWwuYworKysgYi9kcml2ZXJzL3RoZXJtYWwvYW1sb2dpY190aGVybWFsLmMKQEAgLTI5MywxMSAr
MjkzLDExIEBAIHN0YXRpYyBpbnQgYW1sb2dpY190aGVybWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIGludCBhbWxvZ2ljX3Ro
ZXJtYWxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCitzdGF0aWMgdm9pZCBh
bWxvZ2ljX3RoZXJtYWxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJ
c3RydWN0IGFtbG9naWNfdGhlcm1hbCAqZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYp
OwogCi0JcmV0dXJuIGFtbG9naWNfdGhlcm1hbF9kaXNhYmxlKGRhdGEpOworCWFtbG9naWNfdGhl
cm1hbF9kaXNhYmxlKGRhdGEpOwogfQogCiBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIGFtbG9n
aWNfdGhlcm1hbF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKQEAgLTMyNCw3ICszMjQsNyBA
QCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhbWxvZ2ljX3RoZXJtYWxfZHJpdmVyID0g
ewogCQkub2ZfbWF0Y2hfdGFibGUgPSBvZl9hbWxvZ2ljX3RoZXJtYWxfbWF0Y2gsCiAJfSwKIAku
cHJvYmUJPSBhbWxvZ2ljX3RoZXJtYWxfcHJvYmUsCi0JLnJlbW92ZQk9IGFtbG9naWNfdGhlcm1h
bF9yZW1vdmUsCisJLnJlbW92ZV9uZXcgPSBhbWxvZ2ljX3RoZXJtYWxfcmVtb3ZlLAogfTsKIAog
bW9kdWxlX3BsYXRmb3JtX2RyaXZlcihhbWxvZ2ljX3RoZXJtYWxfZHJpdmVyKTsKLS0gCjIuMzku
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
