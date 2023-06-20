Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBCEEB64D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 09:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbhGO3Drlp9hOoAJ4fXSLJjQ2rnS2gwzqTGtIhrGOJg=; b=4LYOKeClRsb+E4
	JhFRv/SfFocL0sqxlThByTYbyijEv1uZmxax+R8PcgRwaLb1WJlI8G38fQqfT8d8Y1+n+CqVJb07p
	4CUkpuASOYq9+fQ1H9AKieu6BM7vgt1ovfq7OD2RzJsJcyphuGHhG3yjeXsrA7xgcvEJJcIoH+EbQ
	23SdGX7xYG8TrrF3TSCBxjqJZZOSnhMxaTMqNktjlQ0mulR7v1nLZjYlYpuUOTD6tpp7Q1aeh3LEB
	aCWAutD6h5EMmHP33As2PQoAGCc602oIn7cO+brN6Hj44XoD8K+VbZlYPNX5kQkbphtKZrrWxlemI
	QsLcD4gFXoW+kK4M5N2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBXOr-00AgES-2Z;
	Tue, 20 Jun 2023 09:11:45 +0000
Received: from mail-sgaapc01on20719.outbound.protection.outlook.com ([2a01:111:f400:feab::719] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBXOf-00Ag3v-2m;
	Tue, 20 Jun 2023 09:11:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOpntg28zWfkFRtSwnK71Rf+8IdFLAKlB/puHFErguFru/qiaodKbSjV5M8vUl/P9yUr+c2CzlDi2BIwhSHMFStQ2Awx9zRlp8bY2DOvpSs+gLSE04Po4UBrvDniYbwAh7nZFGuGJIDWXRNNg8CWNiUqMzHcvhFqOf4ywmU0deVjOCcvqxV+W0RZX1CdVgHGxFcEFtKpTOwaL/2AkDM1jcQIi8MmMXRw3y7tfhRCmcG//blKvOykywEd+jRNkU3Xlzo3MngOzCHC1T6ZD2nQTVlkJCtKWFSzB3w/Bsj2wCH9qe8BLMakFV40ik8OTb/ijYhxx4taA5tvDvU6dNjHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++scUHKfsZEh9T42bK/jWLT1eewDohfz3H5KcioCgI0=;
 b=klCz91XnD9Pf424Ts6NCjzOnnRX0u2xGFxPHt4wThSbEQRUMvLNOqHWLgTPWgCNe9CHLKxDUT2S4qrbnmSqtK4DN0xMKjPpfn3axbaTYKEY7YXBz/7R2mG6I+/EDS93uCQWrn7aQoPjWbJUaEMl9+Pco4oPxDvBoGd7ONvsLIZjxgaQlsbj066g6+U1AFenkUkqa6/tWpid1aneZ0YiPstuXulrvkchskY4d6iu2DvAcpWWEGNQkNlHraiXLpjT1wCqCuWjz0UEljeaYPYDRi4kJiq2MS/sHx1n4D2beECzYPRNj7Ymc9MBI24yzewYoSMebjOx3ClMRqIYQn8RgdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++scUHKfsZEh9T42bK/jWLT1eewDohfz3H5KcioCgI0=;
 b=PbpYAThd8qcRilhu3oXp65IoexQf+yeyPC5JEzYcbNIKIeKqrfLnGfBiJsSok2UYyLlB4ob0J3U+pFTxJ9E5Asmx6lAO69KrahKrdvPwWC4mzkUvsDC9ACRUmoyBebHNqH8OR6lUqEkUHtHsDRx73CnLY1dhGy0jvT9+ATnPVwE1JnGU5dUvPpFyDtxzQb82eGOO5mSXsj60s6E6dphWidLegTgaQzgrMPr/2mBH5SOZ57mVhqBKOyeooUW+1eFoQTy4khGPE14SMNCDXCXYKjoxHASroHLLx2AY0KpGCdASQa5heiRdG30ojrEnYThVoe/G8aW1C1PRovskTOXGQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4510.apcprd06.prod.outlook.com (2603:1096:400:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Tue, 20 Jun
 2023 09:11:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:11:27 +0000
From: Yangtao Li <frank.li@vivo.com>
To: glaroque@baylibre.com,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	thara.gopinath@gmail.com,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	edubezval@gmail.com,
	j-keerthy@ti.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	f.fainelli@gmail.com,
	niklas.soderlund+renesas@ragnatech.se
Cc: linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Yangtao Li <frank.li@vivo.com>
Subject: [PATCH v4 06/11] thermal/drivers/tegra: remove redundant msg in tegra_tsensor_register_channel()
Date: Tue, 20 Jun 2023 17:07:27 +0800
Message-Id: <20230620090732.50025-6-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230620090732.50025-1-frank.li@vivo.com>
References: <20230620090732.50025-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: e594f022-a4b1-41e3-2295-08db716e53e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXRtIbzCOLKT90vok3NBE5/qGSubiJ/KPUL/GC3MKmi/QbVNxMfcjFj0boZ0AtZafZP9bi+EqPVHLNYa+5rvDfsspkMmQWaSu2AlbGJ2Pcm2vinG8ncVY4wC8inAPBS+Qu5laBcJlYpuBje3429m1Pn//e25+ahCefF4uWwiKFhy2dVZJOXDPUkLztwXEnss7hja1Mdbm7Il1REIp1vC+/LjHdesNelsUbMG5G29kGwWjcOPlJmNEMv7cH1QyVm31PqKcYWGez6QG3RDHDLE3k+0wWBGY5gJEy+x5wE2tpw+ESDLf5ut50jSfOh8g7h5r5JOjAfS+0b03+j2hAUF8wI2ZXY8nsxbJRSYhyfIh40XB+OON8vdO3s2wsn4C9RDDdfR9Nu4ZRfXyMTVJDuNlEjaRCWSBL+5XFTmWrcSKI5f7PHdpUEL+46aPKeu1Dg0UcgLWm/4DgZQP39ibPT83cFGdG97ikgNa27MohV82R8cWOL/rBtuYcSG4+Fw5jZdR38spoNaYvszI+uBGr6fkpNwiRpTZ2i1t5/grLH8Nzg1KoX2YlWXiJRCvxuCvZ1grS10IQuILKZH1hLvAv7v6edUwcg5S6eiRaemq/S8Mjh1D4oA2tEddyfnBpRl/f3jmAJDb6BcQ6Z3QU0eRLLm4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199021)(478600001)(52116002)(6486002)(921005)(5660300002)(8936002)(8676002)(36756003)(4744005)(41300700001)(2906002)(86362001)(7416002)(7406005)(38100700002)(38350700002)(66476007)(66556008)(316002)(66946007)(4326008)(107886003)(26005)(1076003)(6512007)(6506007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9N6ut4mZm6YgA9huxjmsgTd9F5VVQWrect0OfgQ9nS8H5TvKwUE1hzsS1x09?=
 =?us-ascii?Q?dkvyLFxJZ5pkKeU7s7Nd9k1nA3mS+2DjxCZo0xuI8OnKiqwBR1Czv69pch+6?=
 =?us-ascii?Q?OndoZsv76lZ4qkoWtbVNuNytJNvHXDbx7aoZngp6CnoQ2rs/I92Cj9WcB/fU?=
 =?us-ascii?Q?UDJFxqJoWz5nUWnDz+awOQ77WsutxRNKtXLkZtRsKDmrfcfgcQvrutpNVt4r?=
 =?us-ascii?Q?YKDip3XELqs5K/+3dnaed5xwlKWLHd3VWacxhtQ3XWyJPkwwE0GKfu6dmEIQ?=
 =?us-ascii?Q?yz/gpWbGmcIdrcodavwmOIPhiiF/Bfv96/nfleR3xztJTKgbUG9B1lmzT1uG?=
 =?us-ascii?Q?/50tr7hfMGCIODfpwkc/mkJ2zUQ1rtE80aPvIkjGkruGg85fxWowtbYHmnVv?=
 =?us-ascii?Q?G9E82ErsEy3gW4titbUhuvIUWSqFhp63LZUy9TaiFzLylZ4rBfMBM5fUOene?=
 =?us-ascii?Q?XoAivnwy0wJwqdEKDL7Dr0GU3SJdZ9vLevcSsU/Z3vsLh46UDmRi76Bmzmol?=
 =?us-ascii?Q?gis9ZdwuuSZqBDVtT32IuV+ayejam4j5AffbP1jh5A+4SrXTVxS5Y/3neq28?=
 =?us-ascii?Q?d/UO4ICe35FJ8sy1Ukq6eJ4VPaVjtZFZ2KUIHZVc5gYgVDVZ3AKo/DEkeDrB?=
 =?us-ascii?Q?Lf800ec6uUVN3weU258Mxv7zEcZjp2sxbOaDqa+Sfnn/oHC1xVY3mKxwIA1D?=
 =?us-ascii?Q?B6/jQ8sgQPl0hGjQfQDk1H4rZV6SYvZ3c8ogKpipdLnsTAWRYdNS2AWzqX6J?=
 =?us-ascii?Q?7myEJHq3O2QZkVnWrhencpBq4O7pRxkANAYzoawQSaNu7We3uioYHZR06D/R?=
 =?us-ascii?Q?PnclaWOx6hBi4TzDAe2oMLrvY+ZAcKAneCpXJiE4fFibVj6nWl3a7IELMdkA?=
 =?us-ascii?Q?hnNjlsvWjPG58VP6fnGvQ/tBLHyWYk/t6eGZcUDGKxkh1+p8iaD/hY/1Dvld?=
 =?us-ascii?Q?0rcMWprkL6FgOgVMPP+svit7KASUJpmppfplG5LDb+xtPZCafQUNO/p4o6K8?=
 =?us-ascii?Q?bDqGLH01pp+vh8/aB9yMGqF0F2Yz4WGRrtDb3WHjHdKrUKNBs0vvmAqYaz7u?=
 =?us-ascii?Q?Z7rC6HZ08MnOH36xMyLFmtwLhEggvf847zjaEsUcFEvB26JcS2L96w40FJfc?=
 =?us-ascii?Q?uUZVYzZl4lMkkqNCogdb5la9tmS3AcanZEDhM318/yGM6TKGu2sPARy+VuJW?=
 =?us-ascii?Q?gSWi/kuIT6Fn4T9DVxFOXEzhR6F0tDtzsZc81niWMWpSDCbAx1inwJZ8W2w5?=
 =?us-ascii?Q?SUXaMnIGhhIcGDQoZeK3hKJeTFWqgsuvzTEJAne5iWEH4yk/6dcGkS9A9kqh?=
 =?us-ascii?Q?LscEs3iew6nkbKNFlausH5DT/uRk2hh6CUw8cpSmfRIt2OQzo2IZ/cYQrEq1?=
 =?us-ascii?Q?k8jjj1JKj7QjzNKbFzkZ+49/f7BxzC6WwHRB33jVdKE0LYPbbWN2iccOqc27?=
 =?us-ascii?Q?xrae8FC4vOEIjzJOH4+e/OnpZSXeSf1RItFFoA/CdIb51J+g6+TxqM5Rjwmn?=
 =?us-ascii?Q?TWNbS5xhYSpocLFPmn0JuKOdQiGGSEg8lY/i8PMYX14vmXj37+LVR2xPPQTx?=
 =?us-ascii?Q?1zuPY4ABnpmYKSYI5XLE9JNNsiD2l85vzWAvb8Hu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e594f022-a4b1-41e3-2295-08db716e53e7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:11:27.2768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6HXrDPJE5eUogeMk6xeXLdRgZk33KibVPzO2h7hwC6hBWowbWR8LSQSNdG0mf7U+X2U2I1XIE868/ptgDC0bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_021133_932736_664048B4 
X-CRM114-Status: UNSURE (   8.12  )
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

The upper-layer devm_thermal_add_hwmon_sysfs() function can directly
print error information.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/thermal/tegra/tegra30-tsensor.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index cb584a5735ed..c243e9d76d3c 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -523,8 +523,7 @@ static int tegra_tsensor_register_channel(struct tegra_tsensor *ts,
 		return 0;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(ts->dev, tsc->tzd))
-		dev_warn(ts->dev, "failed to add hwmon sysfs attributes\n");
+	devm_thermal_add_hwmon_sysfs(ts->dev, tsc->tzd);
 
 	return 0;
 }
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
