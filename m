Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57880EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 04:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/0XUyxC9MeTIkGGRhWF6tee/8KwQYRSJkxx61ZXYP8=; b=2bbebhNpUx4PeS
	cRUPrmvH69ogDAxi2aqblwPAZUyEKCfKEHSqJYeBuosQRBzt8TzWLe1ZjbxXeI6KAk5+REtk3dERq
	vZpJnP+Lh182B5aIPOPW6Z+sHxYxBjUkF1DNa3Ko332J4GQqGDw5DmwSbD6bbhaFkfKh5h7X7T0HB
	8CZoMmMyUnaqg/+EmE9an4So11Y1eM4V5dHqmPwVY0ntdRAMliZ4aGKgo9y0Sf6fnQol6snrD+u3W
	+9BX0i8WSG9uq0GuYUeA100iUYS45Ze8zpI3EBLHr40IMk1ufPFPyS7wlggKh8UgUmHpSSGufoskX
	nSOD/K1haZW6hxj+vswA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHGFR-000K5Q-1H;
	Thu, 06 Jul 2023 04:05:41 +0000
Received: from mail-psaapc01on2070a.outbound.protection.outlook.com ([2a01:111:f400:feae::70a] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHGFN-000K1r-0a;
	Thu, 06 Jul 2023 04:05:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ik8h5F11U0KcatljsPWGN4Ebi+4SfmBBJWM3fcUYIa32bRBTzTRa/w4zWBz5xG4zmdY6r6mB/JcMtpo52/lctRpQK5LVu2v+s1xtvEv0ExiVT3UX0tv2ILyHqfRekcbEByVGP6n8s4dOzk7CpReCwRxjKkgX94MIVPrdsacd9em7vRtsa0MtJkkCSmCgvdIFzUg9lnuZY9diz4uiL/R93Z7o/UXRL6AQF196dJBdFLtSHPXo7Vp7XQE3paJ+vnxJUp8XnSO/IIlASetpVri0M7W3dezd+Dhn9AOpuHWlqF6CU1k1Gu2V7YH8eCn81b5Zg9WsPoSQpwBJVXhSEaTldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zHhX2g1E8S3p0kvzrKDtwKLqNP2IrKxYRUxYn8U2ao=;
 b=gBlAA+SIp9TP+HK1prNJxLCFPkwUh2bdZh+A+sQlZiO2FQlh0im+0GqlkOGuUSFsYWdVu5BHm6RHR77l6LfulsmxkcPYx5KUf4rFyr9GXbOaS5T3XWs/350uzbuZ1iNg4h76bMxAQtWNl3uiPmB3cqzEmePo+EHGw59qJEyw3SkqdYldIwWEEzhzdlBDA+97i5bxHu6KHz7gxd/t9HLi9d6jbACwa7CRej2jNW3wm1hFo5CNBgvp1QAp3QHJecKULaHLk+4PCncXP3LpaBtuGIv5wRUj0Sn21ISs7/TW+CxEFkw6jV9U1Smt/J+UpWekOYjlOv9PTY3rBUSYmWElOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zHhX2g1E8S3p0kvzrKDtwKLqNP2IrKxYRUxYn8U2ao=;
 b=X9sICrErOGUKwgcDYG9C270O5UkS/7RaGYNV1/NfQjBe/quo2FAXv3PVtBXaHas+/tApqGPJ07Xiqx73aQuuVtSE9Jjm+EhnKHOJRWU7j9+tO1EQ+C+glPgVGTNeUoX4ci+IheblILOS7QVrd55RfmVr9dRBtH4eDham1w6KUVmVIfMAWeybITVDRj+WS8QUaBIQXf3WkoWHH6zdU2XoN94L2/nu4iPu01e8v8UFFO9BZZSUXL/67TZVibgq3tXIY8UuogbDoGzPmFqzqgLrhrwnYGXiilnijB5QPmCnLH9ELsQ8dwtAO/5yheRRm20dj3+TTNzIvFssXyI+eyyS4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB4548.apcprd06.prod.outlook.com (2603:1096:301:a7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 04:05:19 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 04:05:19 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] nvmem: meson-mx-efuse: Convert to devm_platform_ioremap_resource()
Date: Thu,  6 Jul 2023 12:05:00 +0800
Message-Id: <20230706040504.34057-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230706040504.34057-1-frank.li@vivo.com>
References: <20230706040504.34057-1-frank.li@vivo.com>
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a253ce-40e4-457f-2d03-08db7dd6364b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BQuN8YsQlm2uNWf0U3ocj+NaACsylTqNTurApVm0aN1p4oJn17cMIIgL+a9sAwfOMCUyOU2yrLdR9lVu7q1lK7Q0KCBWGMR/Fde19VLrJ1Loe3MTIBikBn9ejqgCgtaRsMGGIRtsAr79GmySN6xGszs+4GVJhFFTUyH44nlZhwJ0afUNY/gQmWCAPw2VBk2MMAwNXcBFoSrGJ82x8e9hyNvDD+XNGyAnYTHg6wqh+y1eBwmMeYluWZRfG81IFHo/bU3Y8oWnyQhoR4mW7FEMSdplXn4TZNtnyJuyTB2eoujYzIbTtkQBdIgvb93+jWCqi1LDolfZQEpV2w5YdGv76UB0R87EWA0Rb8dwhaRNdlSyWcecKv7xFUmDHT/dk/sxOUeS3i3ssd+ben8IBl96vk7oy68RtrJ6UAbyj6OzTSr7lkzsSglOiHE9QrzrCs0jZplr8sEFLo6UaZmo5YZ7hMA4SfMK6YjMaVfu1eGO/RwNWXNowrIR/rI0v0zQ7PpnHDmzDx1WKgvMOid8C8LCERlDogoNL4uy1vZ7iM3Cy+VDWls7XkucteCHx8KyuGoWrjRlmi0bgqwtQEx7T+1CiwpCHqtBxMZsfQ3cx/GhAmTFzZhUBJMHKXZe6EVGhn4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(41300700001)(8936002)(8676002)(36756003)(110136005)(4744005)(316002)(5660300002)(2906002)(6486002)(66556008)(4326008)(66476007)(6512007)(6666004)(478600001)(52116002)(38100700002)(86362001)(38350700002)(186003)(66946007)(2616005)(1076003)(83380400001)(6506007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fx4KQVUPcLSSKIL05ZltOIF/Oz87aEBb5B7mySgU8nE2/h+4aWfAkxlq2JQ1?=
 =?us-ascii?Q?QkRsllvU6WhsPn1J82QmaGaKHsS3F7tezkRX4RYmlTw4zlycZaqxoa+vwQDl?=
 =?us-ascii?Q?nG1yeLzWFVNikau4Hb6bh4quDaAF70aYQx6ssphblf1VOFrNBP0/lZUQqHVQ?=
 =?us-ascii?Q?InU/ED9lIemIe1zvfhwOswtH8JzwZ0qi+R6NvqyfASynWepdmR0dEfgXMMP0?=
 =?us-ascii?Q?SX71UspiGSZfHxN4aFdSD+aLFETPv+CDOUlV8z1fWTn4+JbqP4O/8C8CMukb?=
 =?us-ascii?Q?67eUnXOrnBuQUZld8G24+PHUuhCF5r+kqV107BK8FwbYp2L7Hp+dhgse1Q9Y?=
 =?us-ascii?Q?9R+3JktlCNg7qq7gyLS9SMS1w/TUjTTVWAV+SjlCW186+QhXhvKEIQAUbEC7?=
 =?us-ascii?Q?NzeiJ+kBXsbQlss7lEqSDvfOMbBnu7XYPgvKIceg4vI60Gb2Jf5Xy8zsEL0j?=
 =?us-ascii?Q?jd+5rW0tBeSWhKEM1J4ALe49aoOLHln6oMR8p5p3Xmvx0103PnRVLjKQ3t3g?=
 =?us-ascii?Q?C/7M/WFBiqPbnO+XL1bppVaKRshHWxdLDJOQUun8ZQvUFkuBuvLDMy3WWuqy?=
 =?us-ascii?Q?4S1MzCHzJf3Q+ilHxknZ3ygjil4jGJIK4I8P3o9DKNrhW/fxILRrt0TfE4UP?=
 =?us-ascii?Q?7K8Ad5GcVdG5smZATUSLTcjwjccb6hjvpq7j6COCPhYlsz9iwRkSyYCtGVGL?=
 =?us-ascii?Q?ODwGhWBRcerimd5vYEYftVjLCwuyU3n2InBqu63gvGxL1TUd/lupZyN6q5Ty?=
 =?us-ascii?Q?WyPoRz2VuKjj3e503yfWLlLQmslW2V8ydfAs2HkfoC3PbflOFdTffi4J6c3M?=
 =?us-ascii?Q?RfDYCpx8NXm1cazt+L/47P+j7JgaxHcvtOwfGWODPUBiyYI9plsYvtr+v7Mf?=
 =?us-ascii?Q?557kCuwHEhgVJFIOBhaZ3DPSclzh3w7rOSBZwt0v+m6O0KvKm6i+jABZXQ7s?=
 =?us-ascii?Q?BI6X46I1W36AXGQQuy4OzSVP89WcUYPvf2BCCaJpq22CLS8jyN/3jSxhXjpN?=
 =?us-ascii?Q?hhT4Y+WTbHa81NrY37jQHrisswNAuyifogQBjHhsIRJxUDR8gxrB6XhmrBaz?=
 =?us-ascii?Q?3Elt/6r2lesVmi6NQqX9hKS/IZj8sf/P9dI53iAXpoKz2GXBjAe+0Rd0Yc4L?=
 =?us-ascii?Q?6ZyK9ZH89+tBpFwCA3rX6cPojRC6ZELeoebTv7JREY5I6v89uv1TJsn9Ad7z?=
 =?us-ascii?Q?CVi2KRTYtKiREkanfRz0feP6kaxASIGn/wNNFJZbmynTEesZtQrI8QaJ9BMN?=
 =?us-ascii?Q?DWsrysCJ1H7yDNmBJz/3fI07qe1XD2jv0Ip0KwOTSSrWJJqH13EoDoD1saOW?=
 =?us-ascii?Q?wk/S+CiZ+7ME2ptdiUEICqIiKvQdMLeX0jqY3Ui49x0kld4FEQmD1lbrv2a8?=
 =?us-ascii?Q?9KrxAap24/g8lDBSqdVA/kEJ5TuSi5qVY4thPnUjjAz3xkye0t8jIDCa6nDc?=
 =?us-ascii?Q?Li2IONe/0iBB1XCVfsTNvlWkJLFiORx4aE21FQik/kqcF8+IAf4+kuBQF60w?=
 =?us-ascii?Q?P3tKYibZ/Dsar82yLuyq0T4jXftG3DTuOjp5231SCcwVCg1v9EfQvX6UELAs?=
 =?us-ascii?Q?soS+5UP7W/V5TPHJjhhky9GV0yfNSslgnZZa86Bc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a253ce-40e4-457f-2d03-08db7dd6364b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 04:05:19.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9aYEg0+1zbIHQ/PfsqZ8H5Avhhhgxpn+xVhuuAX2aU0qwxo4Ebw5wdmGfNpbfmCWtXoGWbQ/NMriXdTOI4Fmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_210537_222627_7391EDAA 
X-CRM114-Status: UNSURE (   9.93  )
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

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/nvmem/meson-mx-efuse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 13eb14316f46..461e3ad87bcd 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -194,7 +194,6 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 {
 	const struct meson_mx_efuse_platform_data *drvdata;
 	struct meson_mx_efuse *efuse;
-	struct resource *res;
 
 	drvdata = of_device_get_match_data(&pdev->dev);
 	if (!drvdata)
@@ -204,8 +203,7 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 	if (!efuse)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	efuse->base = devm_ioremap_resource(&pdev->dev, res);
+	efuse->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(efuse->base))
 		return PTR_ERR(efuse->base);
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
