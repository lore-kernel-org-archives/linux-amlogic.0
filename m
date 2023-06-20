Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31407EB64D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 09:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qx5OhkDN0UxJJ1+EwcavTm072l/gowA7vOMBRVDAMzo=; b=kBEgrsXfZT8Nhl
	ps0CwniBLyCpF1csbtfD37Pn7DOWCR9ExplJnlKuoerBxEo+HOQ7RW0klYwc4m+tOjIWGLDm1As6r
	uEg+4JcW5uI3loTa5bjPg0hbVYf5JOP9Rq/I3Me7cSF1phV4pYuDIc/Llq2J8f5TO6FY50haO39B3
	T/8wuMYiOjiQLndaTlSYHJWN5SuDI9ur+VnRzzG4OybTB82rjvx86AErkSTNHmodxv5ZVGW0gUrpO
	8e5EZMxla/9cmmKmGSn9foCmgFMlKHaU0kGLfVq011mLPg4NsaObIePowkxVJYZTIArqVnXJdKY6k
	Du9WWfQG71aIyPeOJenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBXOS-00Afx8-38;
	Tue, 20 Jun 2023 09:11:20 +0000
Received: from mail-sgaapc01on20707.outbound.protection.outlook.com ([2a01:111:f400:feab::707] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBXOK-00Afqd-35;
	Tue, 20 Jun 2023 09:11:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJJmkwHH1OAb2Zm74hxAKk+Pc4J4tJTW1oFfyEKrJGy+ns1Ifkqyvi9EAiAhe+nXYeykXJBdLOhjjg2IGT7HshpdnS2Klu6UVWi7iGvS8cHK+EnD8iYwmYRkjHj+YHwCy3uPp5JU6E4aSu0Gau2TOUV5rh+tXlJMscJ5gQTEAh2Y64bwso5ftMcVQnB8zcjg49bRDcNsDy0CdXOQr6Mv8kYB4h9eJJaR8LGddqnVRcKh345A4XvDqJTqzbQjumqdNx5dKrqgMA4xkeorlzfTBdjcBtH8ckQVNF4PEa1z7SRVpExe38fpoiM7oXeilJZBSy7TnLi9tphZxieN2KXgAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3OBtGY/5chd6gxnhXKVzWiME3BSs4Qa259qqbn6U0M=;
 b=K4daiKWSdqFyj+I3HwJEC/JGKHfIaFYXboK5A4Tu05Uo11Ha7xRqfXIka6iHMXcle0LQv4TBWlWdrvqyAys+yBnJQd74N2nKc1zK2KxEvuvD1LErJhaU7yTTQ9MVCdauZ4dAFOBXMvbrnvSUrnP1o2kARkOSWA94EfphjMlWgHrf7HK11pJtO7GRSdkkOZEBkLx5MHK7EDvk0BTDfVeiEEKrCDzhpl4K5I4Ttq25WfeJDPMFF0IWPpKXaHFhp8P/8E6Y+qH04XxevbwSwB/3r21boYetCwH8Q+IsPkuWljbAWzhpIn8fEHYZmVz+Ms1qQ1HgYK0CN3C78gM18jd3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3OBtGY/5chd6gxnhXKVzWiME3BSs4Qa259qqbn6U0M=;
 b=bUcxBPkm3uNJ0gWnrgroLLguRO1v3/+uk2824gws0gDUFsznt0za1AwQMBICyl4YJ9A6GnlrXslmm744NwDzgXQxHS7qzurbRZ9BZEgrwOcglm2cM5pWnc/1lZm4kwTlfFzJgF5ToQXP+cWORHRAcp7JqmfOXc4o9dHr5aGJd/kdbZhyFuYvIYKWhfvUConoYDQi5JO1FVi7GRbZUSnBequXuPv+hMSm4xAeCuIED/z1SbdoihOvZtr4rDUE6deFj/dTl7LgpY6JMsdJLlVMjVPqFSHn4rM1x9C46Y+9gXHS6Q8akEMzMsgIE3s4EyozM/5aN/lH5yVhR+yjlSpUTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4510.apcprd06.prod.outlook.com (2603:1096:400:65::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Tue, 20 Jun
 2023 09:11:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:11:10 +0000
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
	Yangtao Li <frank.li@vivo.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 03/11] thermal/drivers/amlogic: remove redundant msg in amlogic_thermal_probe()
Date: Tue, 20 Jun 2023 17:07:24 +0800
Message-Id: <20230620090732.50025-3-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230620090732.50025-1-frank.li@vivo.com>
References: <20230620090732.50025-1-frank.li@vivo.com>
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4510:EE_
X-MS-Office365-Filtering-Correlation-Id: 28995512-ffb6-4845-1856-08db716e49bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Qh4jydQLOAc4H6qywr2/6dLBoaLwD9eC4Vw93r3Cho+a3N0H6Ux+j0q5C7rs9t16jJ+iITuZp7z7TvfGpmqEB6S0Ohu2koScFkOIE69DMhq9LOF+SZuwCvC4AeXywTTAkls+E8vOeM3wPZo1tNNOwRx6S9NtSLh1fiBP8fkGyNGtZcfkkBbrLv/KiRsJsk98otSdUPzjn5ab9j+uBTF+8N56/Dmd2joaqqVLKFKzjqgSmblBh+pECW6a4bHkfCNAdlwA0HBTRFjyGCcUFHG2Tf3T9BAtJWlrr8YAJtQNva5KKseQAc/FkhZEvfKl7t42jdpBXMJ6k1mjUjwXjkp4XXg94/QwBbYADpACfOCYIKy9y3oKA74MKJxKuw2/y6Vd/ZXTNHtp38jk1/60GzOYdN9+7m0P4QI7WZE+iqYBeqNw20TxNxK+/O27BTFP0FAFuGsCRTqo4/oSi5U6hpIfsjwrFi6d94SruJmwzvOK+bCe0pJTLYBSZN19gWP54Rd/huetUHlIS7nzMjHGA/0s+vMNi+8pQldypnm6MxC4HXrb8m+eJ865MMv6qQotYu4piBzEqBDFLO6IsCdC9lsfrUH5W4nxnNBducN3pW+MU5LTFAvgIWciYM0S+BJxAUKHRIA91ObgcjrTPVI6F/p1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(366004)(39850400004)(396003)(451199021)(478600001)(54906003)(52116002)(6666004)(6486002)(921005)(5660300002)(8936002)(8676002)(36756003)(4744005)(41300700001)(2906002)(86362001)(7416002)(7406005)(38100700002)(38350700002)(66476007)(66556008)(316002)(66946007)(4326008)(26005)(1076003)(6512007)(6506007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F+h9MMbX/9WzfdI4vB5Z0Fe2wQalHh0S7epuxeD2TUBMwFaNztCka+pNB3mt?=
 =?us-ascii?Q?mMaFsP6w+r62qC2TG4tyP6p8D+fqHmHOeWn8aX1TnErTjjSljijBm84+YmQ1?=
 =?us-ascii?Q?Tb7XI0FwprT7LO6Nuj1UwmwV7ymk3hbDX9U4AKgEsGjNUDSosz1InRRrCXjF?=
 =?us-ascii?Q?qyCvsvt85ukzq6+TFlJUc1Vyw3UpYLx+Z9CgvuhByTdpfyGGRS58hvZrDzCo?=
 =?us-ascii?Q?R73mL81gKhhg1QrwH47+/5KN1wh2AIJx2TnEzP/DFCNPDoSTkZSN2P6YkxsV?=
 =?us-ascii?Q?gFKT3n1mGilX3EUqBJwzb2WJNeGQWQNufwPDZJmnXOVMFLn8pThQ4dUK52VT?=
 =?us-ascii?Q?woF5GfLq6cvg+aKGnfCFNWJ1GB9WE4CvGvSxx2MEu6uaFNghZgMMjXUSNVC9?=
 =?us-ascii?Q?OjQCp4dP3Ar3wMHrZrFZc9m7g+y9/shw+udV1YFxbmIDxU/jzHECf1LcLLSl?=
 =?us-ascii?Q?ne/sf5LLdSfAUCYhHj1Ayk6/tzWEj27sxhQU1wwcVoHSTnfi7xqIxcvzH/LZ?=
 =?us-ascii?Q?PeleSECvi5ToAVrX/wP4PP8UuD89NIfiaM7LT1r7VkdfZcdZGskdOCYHxlDz?=
 =?us-ascii?Q?O525zhVMDZN0zOVIG0ff3lu3yoki8HyE4gLCpL9Ro/VwSFz2TUC71UzF+ojP?=
 =?us-ascii?Q?7BjLX1WgemeQQhoyi0rWppm/jB5uzUAZu78pfeyfFcSY0qSJG3a6sv1MjlWT?=
 =?us-ascii?Q?nQ+5h4DwtW+lryHP5dwKjXycqKPLvtFMr63rNG+D6wgDDC2Lqn4mUDS7oc3i?=
 =?us-ascii?Q?aR7L1Pp52YhRyfXkgm3XZ0C5ewKan7/Hl76JWRxtsNQz2csMaSGEuulJ40aN?=
 =?us-ascii?Q?bullbjrIRRbU3JW5aHweZQVreF7Am1hMrlqLLuzNXw+cQzMyLBbskHUXn6yJ?=
 =?us-ascii?Q?hH1ePeYCQA4TpDPxtf9wIJ8bHE4+/dmWc8wrq1Z+3lRvSlHcCPst77UdLmGw?=
 =?us-ascii?Q?D7NKScf2cCyhmfNA2kxLw2DHIEr6Qh1/+TOzkkRfbnVjLXqfiwkJfo/pv1Bv?=
 =?us-ascii?Q?vuNmqrN9AphZuYbd8TsUm/kOgp3Yit4AsvDETDkjsW3EFxSMUfdAMC5y5uKj?=
 =?us-ascii?Q?sB/hzmfxVDlSDqqDCwnRfJYmYGthJmo0/migrjDYEQtiVtF7/SjmhRoMOlvT?=
 =?us-ascii?Q?P7qyEF0YqUW/GN9wZC0ld21jCviREuo7nWTc1Ycbxf77p0yYEi+prv9gQ8Em?=
 =?us-ascii?Q?xCY+MmGQrAJ+cAyIvjRrgimbB7l6uW8QmTjE+cLPZzRkex3o1HQV+Bv9GBHH?=
 =?us-ascii?Q?HVUx5Pws9y1adC7dh6QFic3VuJWzgiNwXzdBycYpS/E6oOl8kCHAfnIEhESr?=
 =?us-ascii?Q?XCzoEte0oWdId0iz5iv/veebDUq/niNKbIvZazxUQ+4v3iZL5ycrpk7fZZO0?=
 =?us-ascii?Q?2x1pyvvfYoIopRogf4ijrHXWHdbRBFJt3eKomVfkhV6YVLN1ivui/xQKbA0a?=
 =?us-ascii?Q?SavvNodnlAQQTDCpxR0riIBY7/dyLitUR2Cz/sm8vY+pUHukNeA0jdSq1G3q?=
 =?us-ascii?Q?+VxH9R5KtyKMoWfTXEacf+b1FTaZeJLMSRchyqDMLEp2Yda13Ce1wPBbkh5r?=
 =?us-ascii?Q?98S8kh0PYu9QQcJCmtIon6zDP5E8CFrOw46K/jo5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28995512-ffb6-4845-1856-08db716e49bc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:11:10.2206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U9W9xY7BMeCUxeGAIDDZqWV7gEtSSut3yI9QuquczF1Lk88++4VFqKp+Vp6gQmRTYwiw8FyWgBS2+zKIZOPVIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4510
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_021113_006588_D3FCF460 
X-CRM114-Status: UNSURE (   8.50  )
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/thermal/amlogic_thermal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 3abc2dcef408..756b218880a7 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -282,8 +282,7 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd))
-		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");
+	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
 
 	ret = amlogic_thermal_initialize(pdata);
 	if (ret)
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
