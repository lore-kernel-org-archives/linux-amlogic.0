Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E490CC88CB4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GTMkiotjHZO0cb8ISM7x+3KO5r+VC5bRBMzNKymnko=; b=is8388k2Z91htx
	PTEQVBzHI4T2BSc3Uzo3c7n2ggGKzpV4uNJ/4q4YQjjQwOfzLIHgn9MlVZ65ugyI2jS2Hekciz2hY
	xMtVmEv+q6vkfhFibxUs14sefr8/fGajsYikJJA4DFf3qyPi2Y3Y5zQlqqBOscSMEZQcEDsmZbJUn
	Fd1rhxIpnDGwNFznKxX+W/4ZOPjX6IhKt9qxCd/oRfgbER1u+0tKQFkjxegnAuCCP2mQiNXg0Tks8
	IMiNGNclVyN16Qs+be8lY9UYjx2wGrgXUpq0qAO6nF6U+8jnp2UoRVBMJWQT1LnM310iFk1KkszlS
	phyinprM/hj2J77Eb+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q92XD-007xvh-0S;
	Tue, 13 Jun 2023 11:50:03 +0000
Received: from mail-tyzapc01on20703.outbound.protection.outlook.com ([2a01:111:f403:704b::703] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q92X5-007xlR-1i;
	Tue, 13 Jun 2023 11:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaXN/eiEOQ2zxJOEzVZeVJ1wYlbptcLVT7eHiPJ1uqHWh4sroT6X2dBw1WvydnTUQqTPLIByH5J7ibbmnZwkKq9b94Xrtah10xIwH7QCA2Iv0v7dBTq8OvdSgeHhRF30CbiM6l0KMGqo9epPtAE0pervhcG/PWTcRrESqV/CrIQRlXRTKXdib2zc+SrIlFYs7cFT+uVBmregTOkiP/WykYv/B/OuBjL/vSEtkGyV97PVAz5iv/+UQTPQcXCva/OrmjWpRU7BkI57VV3pM/u37ApwpQcG4we7aC5KDSmKNJ0isojkw2NNt+D5cErlW03XcAQ/A5IqAmpwlD88eawRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFRIpDy9mxKf73VaQXtUPoyL7qnzSdTF1HT8l2XaQcE=;
 b=iF6g4pgugdJEe4hg0eyRO+ijqbJmMMrWJujlKnBrURreyIR4WCU8YMMOBuIIwhke1lYnrmyouyqptp94F3Sq1KHRY+6ovWKA7KAOqDij459sn2Ba8AyPlWFwp1XBJVTu3WU7YfN5VAw7HjYrPYF29WSMnqq5d2pii3RpQZeshgXrwA2jickz1+1jM69t8lkKVuBk4Seho6lqu24bY1ltyFnyrvCR3pznTeAwt4RRS7TZsDEJGIgp87n7DsbscxZI/w2eVYuDi/UxmjiNf0NP+I7HnF9dz22zHvI7/98WH5w/rmC7EaS1JJ75O7beCNTfAPF4JmpAt4737QALGkmIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFRIpDy9mxKf73VaQXtUPoyL7qnzSdTF1HT8l2XaQcE=;
 b=FxXk9OXPWZt8cZ7Q6qPt7TQTH1Mezvrpl39jPXzrupBYEUKG4ezgndet/rwBV/gj5z21n297VCB0TRAFZs3nNJogi73Nj3hIt5Bbo4iUgpwI8JIEJSF/TujUFsX84dbwRK4I0MVbeJQuUZuHdU58CRcNqKTKUNoocLPOURrYjjt9dh/5jck7pEg51Mz5wT+USWle6N+V42gfcZW7d+gHGa8UMtnMvqgTgJu5mYpo/1OSYzszJM1p+e561PiN3xHCoMBtfj1n6qsTKUpAYj2HdTkVQYVXvg/sosW9nuOZplLDh6a6ltYsS0GGCpz4PWQ042we6fmREfb6aZt9Y24G7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5315.apcprd06.prod.outlook.com (2603:1096:4:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 11:49:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 11:49:54 +0000
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
	thara.gopinath@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
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
	niklas.soderlund+renesas@ragnatech.se,
	wenst@chromium.org
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
Subject: [PATCH v3 07/12] thermal/drivers/qoriq: remove redundant msg in qoriq_tmu_register_tmu_zone()
Date: Tue, 13 Jun 2023 19:48:59 +0800
Message-Id: <20230613114904.15749-7-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230613114904.15749-1-frank.li@vivo.com>
References: <20230613114904.15749-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5315:EE_
X-MS-Office365-Filtering-Correlation-Id: f71cb07a-188e-43ba-aefb-08db6c044d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aR2B7kE0n+hJxG8I6qKbJPX31tatxPcwDp1FPmYEQbAN/1Wz1o/dtcIOBFIsnI+IcRz2jhD7QLzXo25qkg8YYcy0ANLr7m5ixC+1czAYRVZSLX8BaelX3p6kNdB3ZQRHapGCmoUlPcWJrnbcjBvb8WEYKg2hO7rCnlsZu5o6dOSDbDWTGSYL4KVFS5Y9+ADIAMhoAwviJ5xIVMOppbpt5SV4AGKXaxXTY07n8PqLHQ9J6fgwWuzelX+DdJfOJy5f9rSUz71XS07gJdSd+IiXoBR35OmGT1J2OqoB24trJrABbRXypTgr5CMqmf4rCckMpVQHtX3bdPS08E1jwitnOpmIiSCNLKuleH24cniej7ce206PfoksnS3UFPCMoZf8iWUyrWuZqBdp1f8P+EA2SLjnWLAc05ef/u+4gnqhEPTKwh240UTEecvGHEnNbK7ayNLsAR0zPVthXJx3ynw41iEY0D32hixzOl/Pe4/pEVjZt291aaiH8StDwziKoAWAVS989Z18O87MB9eEKSoxXeHBFsSiXtOSkSaU1vqCNSbZn34FIyjwvbZTXhV5Y4dnFADrrE11Djn3/64GmYuXYJcHK79/LDbKJkTG4SwqmCApIn3utecVugrZ7DuX8Q33DFRSMGRwUszxZ36lMQdyOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199021)(4326008)(8936002)(316002)(7406005)(7416002)(66476007)(41300700001)(478600001)(186003)(2906002)(4744005)(66946007)(8676002)(66556008)(5660300002)(107886003)(52116002)(6486002)(1076003)(6506007)(6512007)(921005)(26005)(83380400001)(36756003)(86362001)(2616005)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QOmC9NpsRMyfbQvAgaRVtOL0+ORUK/Tjq7sPD68NeEnMGSqG2cWTRMjFhrp?=
 =?us-ascii?Q?G4NJtOgxNsRCUnhV0LXAru2/yYV1bEtZE7aoixuKYQZbnELIvaNrLGlzKS68?=
 =?us-ascii?Q?lm99p41C2wvzLYLvZdOh5CofsLZO7PaDV8misXj0Pb5PT7inj0sZqG+Tm5j8?=
 =?us-ascii?Q?Kc2cm314pbDSHtcsaduzO14LHmFPImuTyj0Ty+0Vwsn5cwEbbzKxP1VnkYFy?=
 =?us-ascii?Q?HrkBmJ86FngUWLbk9v+K94ZfifUgCPtciV/+i4XwCqnopO/8HwuT8JrIOFru?=
 =?us-ascii?Q?Zk6CeqdtHcD0HiU9IkplQ2QNp8MfOJF6HnesUKGoLzlUjJURlfNDtkAFky+A?=
 =?us-ascii?Q?M5s+J2a/RYKdFAKJUnfyYqSLD7c+3ZL0S4fdngYOubcwb0WLsDZ3Pg040uTy?=
 =?us-ascii?Q?3+dGY5X04c8hb/V1VdY1fduWFTmxU5XBWAIapJ3oqio8OtYjEQwc4hj/poln?=
 =?us-ascii?Q?E2MEQ846yypt3FdFK2oRYCQGzbK05R62wQMXOE2jsqu2g4t0lhtuBuWS5m7e?=
 =?us-ascii?Q?kFkD3/N5SY+dwViQD8jsIQGcfH8nSdRhB6hcMAxaEPDq7H1Kbs+w/hC8f2r4?=
 =?us-ascii?Q?vB34GKt/Wvcopfp4ODqEXU58pzm9LXu0s74uWxzQebh574WliIEJRhvfbljz?=
 =?us-ascii?Q?IN2H/gaQevdzhPJrIhCd9fy9i4ysPwz68CEGYAcmipAdaMYl9gc8ZI2fKa4y?=
 =?us-ascii?Q?C9a4RRcothV0vI76Df4LEOb/jR2c2vvQNqlgEalWeabQTzheA7J32RRRrgTf?=
 =?us-ascii?Q?GNHcTtW7oL364PjNfUYZVmMmHF2vmf1Ut5fYIVeR0R2qJvaewKNbz/ydATy/?=
 =?us-ascii?Q?94C+vzYFaIJqFobTNwJ4EZ5YKD3jP5vcHWPXfXqMlzH1kYLmpj6NhscePlJV?=
 =?us-ascii?Q?QcQBicywB9MYP5UEp9lt/LSzJiGmuQcCkcG5VeDUvTPrsEXWvtqv/UeErrcs?=
 =?us-ascii?Q?UsJFmbKhw2tPlqE0Um4CvWm2zXvgrNsLuRl9EgoGuluJhosGu1I2RHk2Pgxt?=
 =?us-ascii?Q?4sqD60Y3uBzKxGUcq2B4QsTIDrEn4x0n3xHqx/jwuCudg2ZCUg3pykgusQgY?=
 =?us-ascii?Q?yIMOvIaBCkFSMF1WeifUBD4XS2N68TsiHpY4oYdhjUYA0YyW42mKD+NarwtI?=
 =?us-ascii?Q?1H69UW+ng1ypgNTqroQYcbe30+BiGws94/dY6RaP/7+kJE40fcgeN3T9f3Rt?=
 =?us-ascii?Q?SmmAhB4M5ar9ZuxELCbx3QXv5wTkXo4xX6HgjEEN38/uMm3mIsMV83i5rmYc?=
 =?us-ascii?Q?uQdNR3uo2aW6Q0NffvHZgs2RTWoyobb228/LCdTPyTY0YsCIH4D00YtY6xeP?=
 =?us-ascii?Q?Micuz31hpJK2hZbVz4H3yYmtJ17Ceyal9+EkOdTuF55OPxVGtOkCvHaiBfw4?=
 =?us-ascii?Q?w+td8RYSOR2Xy8lazISfDE9WwrxTIuFIK2Nw3nuT4L+F4Ixq1D/mmD4kcbmk?=
 =?us-ascii?Q?EJ14H1vBhrbMIMgYdDDDLt+ca766kzctJ9+ZbUIbUZidl7ourPWxVrSKVVyQ?=
 =?us-ascii?Q?TciHr64jn57LXizxWA8+5Xkjwahazcq9ayDgwWSMJxyIFO307XgGsi3F6BGW?=
 =?us-ascii?Q?4DPYgl/qBMwXD7zkSYsUS3A8w0hwRUlkNOIgmnTx?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71cb07a-188e-43ba-aefb-08db6c044d83
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 11:49:54.0912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0F9m1ju7izYQNmeN+kOx9hfYHh/+4GGgn8MXdFzNa7Fu4iBIXQ+b2XgFkfhTmKh6E6ad2L47bXAvadMJjSIlyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_044955_602035_F929BE34 
X-CRM114-Status: UNSURE (   8.30  )
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
 drivers/thermal/qoriq_thermal.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
index e58756323457..61b68034a82e 100644
--- a/drivers/thermal/qoriq_thermal.c
+++ b/drivers/thermal/qoriq_thermal.c
@@ -157,10 +157,7 @@ static int qoriq_tmu_register_tmu_zone(struct device *dev,
 			return ret;
 		}
 
-		if (devm_thermal_add_hwmon_sysfs(dev, tzd))
-			dev_warn(dev,
-				 "Failed to add hwmon sysfs attributes\n");
-
+		devm_thermal_add_hwmon_sysfs(dev, tzd);
 	}
 
 	return 0;
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
