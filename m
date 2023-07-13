Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADE6C001B0
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jul 2023 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCtA8SxAow0Q74RNUjV69nS0UESLS/a9pA5RAJh/xFo=; b=gLdZYq64QUTq9F
	21/tWEDS/jI1BLm3mUZlCiOtHRY6/JayCYIBaS1FwNvbNJoYFJzFQ2ogsmikBSfD5gxKlyE+ekrhM
	pZ5IBP7Trmrfbv6gwa0ugVLuvinS2Y5k5PMQdrZliPjhNygOSE5NZH+HXFfRnSSHnw33JLj8YMEpT
	PAM9q5Tt36VoBCcaqPYtQG6IimFek9joTZaWhAwfqgZ2cOaHixq3G4mfd+csxNbQvUnAx/7GKOH44
	j6H/Ur7Fy8jLh5+v/Ml/qdf4aht74SmqyqhgqgRnc/rgictt/UKVX9fI564dPHz7+o0OsfGTUPZHE
	KGOXh3ODOQw/yJbGoQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrNk-002NHk-0A;
	Thu, 13 Jul 2023 08:09:00 +0000
Received: from mail-sgaapc01on2072c.outbound.protection.outlook.com ([2a01:111:f400:feab::72c] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrNg-002NDy-0a;
	Thu, 13 Jul 2023 08:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOgCy39PpsGvv6V5D/LyVp2oAQ0IcjqlbjHfCLtP+XeFex2BBP0G8NwsF6PCRG00Dsft4wmFVagjGRawxsxEBhZcmcmbgivBxnm820iQSORdDDpqagE7AgCEJH/u7Z2bYlP7ZCUQElDuO6HtTG6rWRePkAENfIfECcx7UL2L/yYPsjSkWpsz/Dy+1jB7mzmj2bqXeGVe6K52TxeRgu4pOGwzDCDlq8n9uj6AjShlR6JHQQNcU4UgK63B0flRI3LXa1zuKXb9pUD2Z1zCL+fx4eGkbO13GU+9THx16Wo9kKvP8Hvo9qD7rDy+vOg3A347OMNgCfpNlklk0hjpf4bYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJmqNg0QneXTVaXei41tdTyNv8PCANAb8lCgdK9ikdg=;
 b=ZdvyroEy+lP6VsZhku70d1UtWeJKO0yXX038wXOQ9tuBBk5hBEwqUVwndHMOqCgL3mv9MoR2YVhrazOWPe7Gb8uii+wU7ZBTS80snxTkElyLPhTvBSzJIYsyse/TeNjjF6DkhULcSsk4UW3OFrPV6px+VjLmPhwz5OsxzZWicNCyx277huPUPZ5hgVlTxgC4kUClnhYhTDemSAgQG9BDxwGde+w8ROsMw6bv1ZSdfwe1SEZutIgZsZaDD0a+VDQHiLKigV72VqmFUPOksQfz62Y48WrldHtpsP9YCwB7tbW5Y2tSzhyLF6od9fWt4+xwqBsQtDS0LSoH5XIcLdKXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJmqNg0QneXTVaXei41tdTyNv8PCANAb8lCgdK9ikdg=;
 b=YcnfxP9K0d/WKHpzKVllSw2/5rOS53+3k9w+Sy3qjAJ7totNKQtQzk8+q+2PiFXxoIeRk7zjVFuWgt7SwsEgf7tvIzU+UYrVIKbsImaJmfnqpcdNPYCzUKULhvlulGSafVbtugvXhX9fwGZddk6i29FjvUW7BJR9FFG09CsmcDX8mJwVUtIntTsQKg7IECgcz56hzAy8WWazKWGE/DxdGpOblTPOVBoeNsM2xMbPCq99R8n1nkuysLvaffpRhX4sU28baDog4gZWRhUXUO4DUJcO3qq2gFYu7LWwHRgkO0qP+SzngRs1iWZEirz/xApk+N2p1G7IpUZd5anS2TPzUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4371.apcprd06.prod.outlook.com (2603:1096:820:74::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22; Thu, 13 Jul
 2023 08:08:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 08:08:51 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/58] mmc: meson-gx: Convert to platform remove callback returning void
Date: Thu, 13 Jul 2023 16:07:27 +0800
Message-Id: <20230713080807.69999-18-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230713080807.69999-1-frank.li@vivo.com>
References: <20230713080807.69999-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0091.apcprd02.prod.outlook.com
 (2603:1096:4:90::31) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bcc5f0-125e-41a1-fd33-08db83786499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gaXHu4hn4rtQ1qTn2+bI5YjoNz9+/QPpQAZVBWHoZsBjHBqIJM35PqNonsPlL/zbtj2FpEmOCBTbdgXIg36uR2D6Pe1lZdOU9wDSGMLP6cBq88lLeN6o76B7+4mpPjsQvYrAqrn7XwlKMu1hGIm6cVIzJQI84ei9nWiyR7e1vuM6qO+y06pSuGulA5i1Dz8G0H7SEiGrX8GFIA8mUnvWbjezbqOnjXDzyTgiESHC3wJbhM/WF3xAktYkUo1XMAhwiFRAxEvDBvJwMurBLLPXHXyUdIEtMx51g47a6hnLaaGnTaHlmV9+ySXKIZ2o53yipWJpae5R3o6FpyF8Y+Ik4jDPxbxWhvEyHu1zuIyRDuIGUYiGpVwIYzgD+uVy48rLzOvUFxFWttXgIDg88iAL1gmb2Gtzju4cfQNfM72UK1GK2Vfj7l95QxfdoFOraKHKF8XUE0n1Ay9FMcZlM6bNT0yQ8jdqcV05ZNfTGNOtfBL1/sqakkhGcySAKFTckVeVueHpWQBZ5c/LmGxCw/xbAfD96Q3AdMTbnUwgNanGJqFHb/3Dfh1IGHMCXhK/HhAbihnVt7wRox01iNDA/7A5G8J3GXo5AnGX9Lawo7amUnNOq2nezd/TX1UCNUCZ0OFCOPQEbEMmXfpJwjIL/oRvO1KSg/DebAdGnR7KKz5Z4PA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199021)(38350700002)(38100700002)(478600001)(4326008)(6666004)(86362001)(52116002)(110136005)(6486002)(54906003)(66476007)(66556008)(66946007)(316002)(6512007)(41300700001)(83380400001)(186003)(2616005)(2906002)(36756003)(8936002)(8676002)(26005)(7416002)(5660300002)(6506007)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5PR1QyeDVLQ2E5a3BodGJHMTJ1clY3TGkvTmpNVHE1bjNFUjFrNll2bWtu?=
 =?utf-8?B?czNJcTlQbkl2bG00L2xPazZtNU1uSmlqekhTYjVQWHhvNC83T2d5OStJYTFO?=
 =?utf-8?B?M1NrRGJLZy9sb2tuU2ZFQ1RLOG54RHpoZ0lnMjJyOS9xM1psOG9SaGI1djZ1?=
 =?utf-8?B?SXdRY3VpY01Kdm9lQWFGQUFrZlF4UHF1cXZqVTFpQkRuS09XMGZZMkZsTUZC?=
 =?utf-8?B?aTFzT2VjbzRDdXBGTXA1d283YkdmbkVDUklsQzNWcUVWZUtqbU5hNjBBMGNS?=
 =?utf-8?B?QzE1aXhXSlZlQVBwdktuTU1oN1BaaU11aDZpZXZ2SnBHUkV2SEVENm9xZWNW?=
 =?utf-8?B?RzJzR004cnFXOVh6MFFqcFIraVBhSmhOV2xwNCtVSTFHR1czUVRHaDJ6ZERs?=
 =?utf-8?B?V2lEZnJENk95RjdCS2hrYy9ENGpNTGNoQ2pSRjhPUytxOFRFWnNkaWoyVmVu?=
 =?utf-8?B?RGRYVVMzSTJ6WWtGc05OWFZuNUliMVc3ekh2VHdOWlhqODcyL3BXT3drYUE0?=
 =?utf-8?B?eVdPK2lWQWdFOWJpUjZpdUp4eVNsK0lNUUtDaktXeHA3Qm1IcVJtL3EvVXJL?=
 =?utf-8?B?RTdmOGtwSHorSDI4ckR6UUF2L2JyTnNPL25VdUJ1VjZTOGtqQ0tvcUh2UUNy?=
 =?utf-8?B?cGRqVENrcE1OMGUwS2piUldPb2s4cjVEWVVOZzFKQzcwVWJUOGYycEZTT2lS?=
 =?utf-8?B?YVI3MDlBMUxwb1pxNWNuN1NWaEJLekh1aWo1VGF0emR2aVJCQ3BiTjZRRkE5?=
 =?utf-8?B?UllIUVZBTEZwdXhrNVcvM201S0J6Yzh0Tzg2WUplallIRDdsNmNNY0RYT2VR?=
 =?utf-8?B?WW92VU5wdkFtQ0x1c2VjZFNUL3ZGbUhHTWNzenc0TExvT2UzRFZtK0Jub0J5?=
 =?utf-8?B?N2p5c1RHdlNHRURxd3dqNTBzcHhhbGU4Wk1odXNCcG1POU0zZGsvVHZGQnl1?=
 =?utf-8?B?S0dQcHdTajhjQTVkcUhzTmNyNmxYVndIRmJUTU9ST0xDVGU3WWVWQStkc2lK?=
 =?utf-8?B?TVoxWjQzT292ZkdKSXNkSGRrS00wN0VUektjeTBYVUYyTmFCb1JiQ3lCUm92?=
 =?utf-8?B?eVRPU2UwRFd6dnVzMmd1b1VIeCtYeERUWnRoUkxSUHpWY3lHVHB6MTc5ZlJl?=
 =?utf-8?B?SjFieUlJSVliV0Q0Y3A3bFpXeUxOcjJHc29vdWtsQWd6dEZyVE1YNUJmMHND?=
 =?utf-8?B?bStxTFlxbWRCRHkxQ2RjWXg2UE8xdFRjdVV0VlptekF4am5FVVpLaml1UjA5?=
 =?utf-8?B?cEpVNFpuZ3ZFUEpOZDZESXRlZ0NZeFVhZW9mWno0Z1lDZHJYRTVvanNSNVFH?=
 =?utf-8?B?S0hTUFh5UjRWQzJzRGZtM0cyM1UzaGxRRENTTGhYY1crVmt0ZU5nSWEwZmtC?=
 =?utf-8?B?OS9QUkhPbWs5b1RCb1I0aHE4SUNGdzloaWdxd1JQb1FiYWViRWpRTG1ZeWlC?=
 =?utf-8?B?V3pEMmZrSkFRNXBrYy8vMU42R01xeVl2czYrM09jZXdqYWRwdFdiM0JCT0pi?=
 =?utf-8?B?NlRpbEVzdWRDQVpOTVpiM1VmZzBlYk01NXBqVFM1dVpoV1VCbTNHTGZITzd3?=
 =?utf-8?B?cTJhV3BZUXZiTHNiTXR0WE9zajNkanFIWG9hZnNVcWllSzJESExRTnozVGpI?=
 =?utf-8?B?ckxtMU9nQ0hpN0kzdTVON3Rtb2hpNmZqSWkwdGNOWWJpd1FJYVBzZWsySDRt?=
 =?utf-8?B?ZlF3dXV2YlFsZllHSWZYR3d6N3Yrb09nQUFvNnlZdWtRN0pYWFRTbFFzUHM3?=
 =?utf-8?B?VTFTRGErMlBoWnJmb3VaQzJPbW1oTUIzOXFBV3ZlUm8vOTZ1aDE4TnU3dWFI?=
 =?utf-8?B?MUREU3h4R1NRS2JBdUdDVkpZelBQV1FwdDNpbXdqMlJGNUJ3ZVVEeDFRSmQr?=
 =?utf-8?B?bkFRV2M1NXRabm1QOGtXWGtrWll2MW0rbG5GTUsyQjJTamVTU3JsT2ZCN2x0?=
 =?utf-8?B?ME50Sm5uRVR1Z3dKaGdNcXg5UmZOUXZGMXQ3VHhjaHQrcnlnbWRwME1VK0pl?=
 =?utf-8?B?SGtEVzB5a0FXdHppaUVoWVFuelRYam94Z2hBS05VRHhva0phb3A0M3JkLzM3?=
 =?utf-8?B?eEdCanF0L1JlZ3AwRHpJWml5QWJMWGRjVFlocWFmWndhK0N2NjhaelUreTYr?=
 =?utf-8?Q?+n+J4QSfKUI33WsY9fH/vbpRE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bcc5f0-125e-41a1-fd33-08db83786499
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 08:08:51.1516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgytmeNpYFPSQeD7l0zJpWHAUh0s6rn6Dt3ddBa/IFXfZ3o7PFM93QWp68Wn2hBg/5AuaXui9dxtVEvvGNDTbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_010856_231204_C9BD1B39 
X-CRM114-Status: GOOD (  14.07  )
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
dGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4
LW1tYy5jIHwgNiArKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyBi
L2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKaW5kZXggZWU5YTI1YjkwMGFlLi4xMDZl
YmMxZmQzNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKKysr
IGIvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwpAQCAtMTI5Nyw3ICsxMjk3LDcgQEAg
c3RhdGljIGludCBtZXNvbl9tbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
IAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IG1lc29uX21tY19yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKK3N0YXRpYyB2b2lkIG1lc29uX21tY19yZW1vdmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3QgbWVzb25faG9zdCAqaG9zdCA9IGRl
dl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsKIApAQCAtMTMwOCw4ICsxMzA4LDYgQEAgc3RhdGlj
IGludCBtZXNvbl9tbWNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZnJl
ZV9pcnEoaG9zdC0+aXJxLCBob3N0KTsKIAogCWNsa19kaXNhYmxlX3VucHJlcGFyZShob3N0LT5t
bWNfY2xrKTsKLQotCXJldHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG1lc29uX21t
Y19kYXRhIG1lc29uX2d4X2RhdGEgPSB7CkBAIC0xMzQwLDcgKzEzMzgsNyBAQCBNT0RVTEVfREVW
SUNFX1RBQkxFKG9mLCBtZXNvbl9tbWNfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBtZXNvbl9tbWNfZHJpdmVyID0gewogCS5wcm9iZQkJPSBtZXNvbl9tbWNfcHJv
YmUsCi0JLnJlbW92ZQkJPSBtZXNvbl9tbWNfcmVtb3ZlLAorCS5yZW1vdmVfbmV3CT0gbWVzb25f
bW1jX3JlbW92ZSwKIAkuZHJpdmVyCQk9IHsKIAkJLm5hbWUgPSBEUklWRVJfTkFNRSwKIAkJLnBy
b2JlX3R5cGUgPSBQUk9CRV9QUkVGRVJfQVNZTkNIUk9OT1VTLAotLSAKMi4zOS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
