Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BFBCA0EE6
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Aug 2025 04:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tiBTBybdDvj6lYqsuUI1Anx1SY1SoI2r/zGlvFZtoEk=; b=TNcKmeYWvPYXAH
	LhoaJFExnBMvC5Zn81CeasHD2AkrSsKqdK7JezpGHmSDgsfowltN0l7zTKUAirZnl64derXZsWlZv
	QQMiGPvacRUQvRlNq5mleUa/wdNS7BTNzSurTXh2+moqbcxAvIuwyZZpsb0ktSEnPqbSbTWP6Lrkt
	up0oSVYFKnPvZLPcQD6p4iwOm8R+6ur1VjJfiByRLRHwmdvFzepR3eIe5ftxPpXOeCzX+xpMh/dP2
	qHKb2XZAClZNT1Vq9PMaLfegMhdTKpH0RGFUEztL/gsU4JdqoEMKmb5qCIxpMVexu6qSrD/uhRlMJ
	Nu6rgMTQXpjjtNxNpleQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDlK-00000009MVA-273i;
	Tue, 19 Aug 2025 04:15:54 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDYp-00000009LMj-0FNZ
	for linux-amlogic@lists.infradead.org;
	Tue, 19 Aug 2025 04:03:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOi4VmF/gTq6phv5/z9+LONI2fhtP65DTnDsXYnAqKNpjU2boAe6djtVY0oqjTydy8UrHNDNcFnmhymXxTXJaifo5OCGkDZaHLUzSEjDMsexvuC+RbPquFU+PzgcDRro2F+p+SVTIb9bg/w0dhdGPkwmCO6ojwgm8vcXLEzMdEp6e8q5CwK1FuY4q6OK8gE15Il4OWd1Y/Mj58fKiOpIom67eXATfxX/MoaGqE/t1gjTYcwKo6BKLH1oJPGXNIPyqK2DqVY9W/awpNYjwliktcDLlV4uBk5XCXoONBAqKwA8WyX1jOzKwCHEtuVnVwZtp+sR2LowKJx/x6oGVZW+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pr4TT6Qp9tjSkZhq8ypun54ebhuviXym4la/3JJeYyM=;
 b=Jp1w7dv564rvMJsCD4rDFMz1XRXrshQjucNDxZUcDNVvlKGw4+ymKSwn+xr7DJuUQoptY4GkpEDwSY9TzK7Hoo6uTdhtDveJuW9K0vETO0cLfgqG6iXNMWcTvRt0zA2/fh4nfRyiTmZ9VsJhKtFcRrP5AtTwapxhf2PT02EsU2/Ad9PsCnPfZWJ+6nx75cbCDHLozybltSOS9eZpgSk/J1nly/uTU020OUkVx7NhVwbX4v6lPZoYNjdU/+W01UaXKuoKz0sFMV2LfS1METoY+j+oozzRAafwL9F74NqLWF9gJ2D1nAGEgQ0qbkFe3brIRk9GGRw9/AnoD2SKdnd1HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pr4TT6Qp9tjSkZhq8ypun54ebhuviXym4la/3JJeYyM=;
 b=E9irF5XLzIxONH4MTf+fhZeF5J2YjWT1NfjFrfUf/0xUQO4DcpC/OhctE9k6M+jzR1nmx+gt8YQiK9IXXZ4nffuisIeegmCL7Lb0jQAS0j1TJ0zpSjodxCuG62yc1NyX6hiR/4IoIc5l1jGmHQBe9+/k57Q76oUorFoVP5VZi6T62YK/zL0RezyHkeaCqh6mgu5KwMlB2vf1GLFwyvsUPsvkkkNrcMlUebwL7zyu0s8DetkFGqEbZ4qJou4zNa0LAAjK+ScKFUIyZAXutgl8bwCSFTkiigBdVODsuC596pl+f102imv+tPwUWOx0LrToktZx8MSutZ3EyC12WWZL/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB6591.apcprd06.prod.outlook.com (2603:1096:820:f8::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.24; Tue, 19 Aug 2025 04:02:48 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 04:02:48 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] spi: SPISG: Use devm_kcalloc() in aml_spisg_clk_init()
Date: Tue, 19 Aug 2025 12:02:38 +0800
Message-Id: <20250819040239.434863-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f69da9-bd10-48b5-93d0-08ddded5424f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?05gC/NtwiLaBe7jrl7m1TC/IOa7Q1Erx5HYsANcC4XOszIkJG48/r8al4pHV?=
 =?us-ascii?Q?zrpFiRsKLaXRuomsCJG5/K9NyrKxAV14N746Xr4N0vRbXs9SX1x8Rwy62ucp?=
 =?us-ascii?Q?xOPyutR0Q1+ZV8gvT7fHgzutHUlFPf+Jk13sQCoP0N7zuyOybPOmANuTZJGg?=
 =?us-ascii?Q?5bW0hsMaCcp7joJleupesa5WCj6LwinqFhfRb5P/WTb8Xv1919v2F+5nK5hd?=
 =?us-ascii?Q?ZGvYf9tIUoOSaKK56pZwAmdwSQFjGWg48xQRv81vqLnigA+P/0P4iqOWeOqB?=
 =?us-ascii?Q?9hsr8Ur0zXgZakIbPJi/mWajxv7t2TA1vp/4c3HXX8+7ApjjyJzI6McYUypA?=
 =?us-ascii?Q?rK7ATpLsE4KAvI1k8+7buPLypA73Iy+wL3M6aKk/G+U5TSaZhxthbSqUaal2?=
 =?us-ascii?Q?HJ+sNhzYhAGmGu5Cq9WKOaN0es/BXR6NlIagSEHMqFxSdCiilA73kYEc7jhc?=
 =?us-ascii?Q?d/MOjw7d4Py8MhljwfCH0qqi9r5PDOMaOkPNwFweXGZa7EYDaiqyw4GTymPn?=
 =?us-ascii?Q?xQ6nIHu+pNcX1f3e+g9r/imPtpDEpAZxLo33UrcH8GxtYgjFJG3CFfYxJ/TQ?=
 =?us-ascii?Q?ykfVJxJfAvx2nCT6r4wikIS7Zttk+LeTi/pw9vW3glg0NksTHi3QFPJ1bj77?=
 =?us-ascii?Q?C5QjrRCLl/FF/4aSZvUyu3O644xHYnI8uNp2p++FHoscuNw9gcjeKuPDrHkm?=
 =?us-ascii?Q?mKH/OYKwVegzatKh9xA/9wkMsdnbToYGMITCFx+dmAKfz3H2kg0b+CbUH5OW?=
 =?us-ascii?Q?cIyyweOpdCFiUkoFatkkmDtRHylCYThBFCn3WAtrYkR6Hyqw+JiVyq6s45/y?=
 =?us-ascii?Q?pv1JcyJ/WZm2wXaA9fBxSzW4wtDYcfMhCj12fWsQeoDZFgaIKO06/cmn1qrW?=
 =?us-ascii?Q?HkJ1Ac5QuS+zrWOBRelmpb0tcjxJSvymnr8xiBgyaNPtzQKt1KihPc2kzW5F?=
 =?us-ascii?Q?vgewH7nxiMI216gGU1UNAu4ChG6GpZ6hw3GJJn33oy/pfhDp5VOq0igOq5Mo?=
 =?us-ascii?Q?I9ZN+LFFXJmI0dakQbqM5TvOkZElUTiWIhPy9SUDZDTUcoYAMRJRo5AmmdLB?=
 =?us-ascii?Q?Z+6jYuA2NKKg4QosLyFcUVVdvCPhqqsQa39XvbBP/Rn+uvhGUbb68ZB6VXPr?=
 =?us-ascii?Q?U8a4gwhubOPE1dBN1xAV1pOcdywBOqyoi0sYdbxJhEj6mconKC09Dalq4ZFf?=
 =?us-ascii?Q?t0BuDxaknXFYtyBa0I9DjFdi8+la0V6sw/o4U/VOz82fjTiE0cAILSFvdXpw?=
 =?us-ascii?Q?okC5k1Y92hSM8iBBPLM3CSWjO84ibCHTf8CLFp7E0zcC4prC5Rf4Mp8s0loj?=
 =?us-ascii?Q?MmFZyicTuaxcYvNZDCaLWBiffsZo4FWxOWYjNqILCZkwqtEYzBNQx5q6xRs1?=
 =?us-ascii?Q?lqzhBvB8NXkw6oPYx6tOotHLVc6ZOszet7VzeBltZZ0flVyhzHmtah1Zbz+7?=
 =?us-ascii?Q?QYRmOqMW3HqzKDaNHZyt7BhtWwpaEbIM9JjWLGy3w9wUM0rrredx3jHXY0g5?=
 =?us-ascii?Q?r/o/gHDGro/UjkM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbwjBpS7AgiZm9rqjOsNwc4yfZwgbgKpA7pKDLhx7JJ//AdwPgY73GWA0nYG?=
 =?us-ascii?Q?bYglWBMnOd2VwHukdySvrgq6UV5GPNe6V/sehB+/ID8aVlDzujjLlabtAzHV?=
 =?us-ascii?Q?nOTlFNRQDx94920dtQqzRJ4geF3rhoY63WLGjpNFYPfsVgcpc7nMIN2afsIP?=
 =?us-ascii?Q?TCtWBcMSH0Eu9NXOkQFfWHPYEXfj1wjGcKBcnxHsx2E6vWgouoFkOaKgFdYz?=
 =?us-ascii?Q?g1fMFIGcIo3T4lyaKfxRfAsqzkoNO5QPMM8YNyz+ifyDipounaYuAyb7gJrY?=
 =?us-ascii?Q?mtfL6/GU+nitx3Ruk7V76NrPlmVvFp4GTNPXY1V5Pu090kC4Kguz4nqlFGDG?=
 =?us-ascii?Q?rY3DPaVFTDFgrPl0qg1AmDcGUyoTrrIV8WdsszXBi9y+QUY1lfA4MOvSLwcp?=
 =?us-ascii?Q?MqhRZqFLsgccieJe3iqB9526VMrATagp53zGTTLrWV+REHPW0bJQ82LIwt1o?=
 =?us-ascii?Q?9dbwTmRGFhL6MKBeU0zKNloSJzGMX1J181wXuZqhFq0jLsKuvkQsk5BtMQgs?=
 =?us-ascii?Q?ZsVvrLT7BJWyuM//QCxD260NzC0hDscJjEcGm0QHy4hJEKeMQxCOTaO4l1z2?=
 =?us-ascii?Q?iUv6sSP11KjImhJCwikU+bN+PX0FlrJmWr4sBK807AxMUz4Zd68P+m95Na5u?=
 =?us-ascii?Q?7yBv49Okhkhs+qeHFY3gH3eTY+OHJbnKKLCFiYAMaDkzQBkViJOpuqgOuTXb?=
 =?us-ascii?Q?0VEeET+mu9DAS1sX5zgCaX8wCroR6k7Bc83gapNiV+mdd1stLdeVRUq/JOzu?=
 =?us-ascii?Q?YmI5boS/qUSN1v0BjBAoihEJF7bev/ECr8RbFQfUgB71DIco/7wOyAxemZ18?=
 =?us-ascii?Q?x8jXus5LlXl5QXpPttimPnXkrSiywIqVeovhCUotK2JldbGcKvikkOKf3zT5?=
 =?us-ascii?Q?YJz6lIlqhZCX/CZXpvqXgR/fHoQUD3oDLGTwSxDGZ7wGK3hcX+wwuoYV2c3Q?=
 =?us-ascii?Q?E1t4ugzBidGN0Y0a5JBC1zIny1epuUnJwbrgdhR49NlqiUMz2nQxwiAVYEq+?=
 =?us-ascii?Q?2R7bka+2F0kd+FOi89DssGmJT+f07jI/Wwpcz0FlXibUJU18AujHBjb2s2OV?=
 =?us-ascii?Q?7heW0aQIaS7ie9bElHoatRW3IInc9wsLyYeEEVQVePip7/O9dzzyzw/IVeHs?=
 =?us-ascii?Q?fBAeBqPmaZf+q284G5IUWLhj5GHAMbjG89zqKPoMEMhoS614f+qH/K9eODh1?=
 =?us-ascii?Q?Bxxx/EWYexSvs/v8hDXo8R6y2EE10HSMd14FFzXBfVsthMAn2/wUa3Gmqgyd?=
 =?us-ascii?Q?L7V9XAIzVvy5uA0srMYOhvT3Qkmgtc/atzM/FbnY3GFiHGFCXSRNpxiQ46BB?=
 =?us-ascii?Q?iLJ48yal0pNWN0lnyl3OHrryi3aIcn7Vld85cyGZe5mSq0ZPnT/4eRtWDwBb?=
 =?us-ascii?Q?pmgV3aL7nmfa6Y+pwqHRjgOw0wtHYpYtAFTLgCJpLg49x1ksApzuhymYA0Zl?=
 =?us-ascii?Q?p5UT8Ahk98uJGqz8JcrsTB+nZGNd4GYLahEz1AMHylJ7qdJE3NDtP87GoZdU?=
 =?us-ascii?Q?pLBQSZXKZ3uTZMfBRYOsj9L85eOPRD0ESVsNqI3DxDoROOwjBxWHBWsN39e6?=
 =?us-ascii?Q?ofWCDKr8Zu/qMk7NzJKpYStzaJuXU+Iu6OsTn85U?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f69da9-bd10-48b5-93d0-08ddded5424f
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 04:02:48.0229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X0OLeO4AVXr9C55Sq9apDW0lPkagmezsDRdO8k6zRUGuRj+vIkCDjn8/Pnkl1lKH86OwDeq+A5GeStBD1SSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_210259_098250_299C6BCC 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Replace calls of devm_kzalloc() with devm_kcalloc() in aml_spisg_clk_init()
for safer memory allocation with built-in overflow protection, and replace
sizeof(struct clk_div_table) with sizeof(*tbl) to shorten the line.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/spi/spi-amlogic-spisg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 2ab8bdf2a676..64244a0bd408 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -662,7 +662,7 @@ static int aml_spisg_clk_init(struct spisg_device *spisg, void __iomem *base)
 
 	clk_disable_unprepare(spisg->pclk);
 
-	tbl = devm_kzalloc(dev, sizeof(struct clk_div_table) * (DIV_NUM + 1), GFP_KERNEL);
+	tbl = devm_kcalloc(dev, (DIV_NUM + 1), sizeof(*tbl), GFP_KERNEL);
 	if (!tbl)
 		return -ENOMEM;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
