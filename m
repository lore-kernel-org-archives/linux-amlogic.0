Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427B0C7EE2E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Cc7XrtxVQ4XbDyIM+pWomBD9aAVPbSioEoyLolrEis=; b=0EjLUk1WDGxnvI
	pndim7S/oXEd9Lxvr+Z2g7m0D4ODNtROxqLOHdpOPPe1F0AsSi3i+v7VNbIBB24JonWgfIB2lAv2o
	TCPU5A1zYDMN+zqEc52tig/EOARyowmoDk+HHuaTCIVwMm/6I3gFV1XJlAQ0QJfZrtz3ui8QHf8ij
	nT1PYRRt41U3GPKRdK4mtkw6rk4rs1W7RRj8jpiug640F3mDE+uSFbtsl1VKrn7oW0jL1AVJXiQHq
	9WGYm0YklbGrr+dH5fB2i1JaD5RV5lHGYm6TnUnoASMQdVwlxG1oBrKTu+A0jSs//aJTv1W8SEzAd
	0jpjgz8GA5JtSZ3CbgRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q90m8-007ZgD-0P;
	Tue, 13 Jun 2023 09:57:20 +0000
Received: from mail-psaapc01on20719.outbound.protection.outlook.com ([2a01:111:f400:feae::719] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q90lv-007ZZU-1z;
	Tue, 13 Jun 2023 09:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dof2h1n4hKnnxuKWJ9cPF7O8JY5/IlxQvB7L4aRejL+jNEe2VYZnZOapJh0BuZP7SraryR9coNF238OrMpeSXmJjNdBNyMiHXTXSmKsdz0oK0ldMZ1vj46sEUPuWhMe99BOyna0rFRzrWx4qRvrvX5wDLWbd9/WrnC6pQBQGVmBcuo+/eCr/Zod6qBE2olE+7+3dDjgo2YVC6Ldd6IS5WEP5QkdCw9hB/rfVibkdMrcVqy6wl1a4Q5CVJe/KtE7iFHegvuTnITM+MAmTAbPjbs5xYayk2vZfjJ/sPRywWc7/sqGtiU/hKwwnpQ2lIxmy906AOpYgDQSrbXWEBfv4sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jy+wdJ4SRgf2qsL63HDh5KAoa148kEROpkTGcT1sxb0=;
 b=VGVy7zusHJgsPEx2dNjT9ZDwanjN1edkRkjQYBVaabw2/WrNrwZ6qkIjCM2q1DfMaEZ2PwOnZhD8zhb+y4GBZASv5o50nR9mad7emkEg917K+k21NYE9ETlx+dvGcb16r3GhFhnOjm0E+zrEOzmYEoikA61KOSRBH52fyoDr/VxdLMY9OwZSMLSqzf0txh78gTRlPfa1TYifhoEZUOBfdKrj3FEnmF3CK4GsrCt9wpPAZ5+KUYvRffC7Nw74ehBuC575A1gHFZmIfetzWR+eJA15EG0JoQr434VJznJdno/JtLC8CAHXZYgEXtknFnIoWapi0bCGddoV6A/+JZYxSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jy+wdJ4SRgf2qsL63HDh5KAoa148kEROpkTGcT1sxb0=;
 b=Orcz2Mp+jHez8l4acJ0nNumFl+0f2PVCa9Y7/FfqYusrqNdwY0dPaMB6ONPpFxEgNdxcF+4+Ah/RfVfGInN6Ew4VxH4uwKYp/bJrXJDppVPdJI6Ee3KNvsg8U7DOMYAtiwIcdgds0pPXDQHA6N3WWVuS91c+qGiDhQqzUWJsJNOLfohFjNirD+Dtyn3c/EiLEHCvwNusOlpX6xiuMSsAlN8JCg9FsfF7DuEuojgGpH/13OsmOpHFrHpMycFAEVrCsgNxc288OLB7DrFZGozlh6jiBEgDd8RAI+WCBbwQNI3Drj4mINVja3nHL1sP2JhHzfLGOlj2rP+ALiyAIG6XmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4012.apcprd06.prod.outlook.com (2603:1096:4:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 09:57:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6455.039; Tue, 13 Jun 2023
 09:57:01 +0000
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
	f.fainelli@gmail.com
Cc: linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Yangtao Li <frank.li@vivo.com>
Subject: [RESEND 4/9] thermal/drivers/imx: remove redundant msg in imx8mm_tmu_probe() and imx_sc_thermal_probe()
Date: Tue, 13 Jun 2023 17:56:19 +0800
Message-Id: <20230613095624.78789-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230613095624.78789-1-frank.li@vivo.com>
References: <20230613095624.78789-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4012:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bdfa49d-535a-4611-6b74-08db6bf488c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QuPUHxyDyt82q5l/j54Qi6mgXIdgLSJSQDqpn7Ekq6TcbQdESI/2mXh6Y31oOh8d3VZt6ghplbg8AsLEg0DJXs2jYeKAq4oH4OBx35oU62VK0PMI4eMdRkJCevkGYnTDEWHevGt5pIyx0QmOQBC8od3f5FZa72u+mYqyc5mApRLoqi/lj25BnZiOop0ppHUyKyU2BwPOr/ZQ8zx4b8RdjsN8G+mlmEpNYrLEggGwR+jNxsq+xt/6/nEjR/3b4dGltGtqXC8wev+7OIbvlN14EruLbK+XhMJVlrhSgUL0lfc15Gb9lei7UbLRWqO62SkhjhatbsGdTnkrO7htG6MdRWVCkt2v1tr7tutAt0LeeFpbUexuur581bMNG8HXS0yyjiyZoy3U3sExKexMOqFe3m3kmWYC/Z44+Fd/3muqzGO6HlMilhPTgn4OyGlHmewCiUQlTvQ0ISaT7dyK7SD0+BB55KN81PtZTspxHTwoG/9BKbevEtB9QHvd/K1Hr7Sv0EqxdXjqv9SttmeDvBybQRMjfv82LioSkgJk02n8auwBfoiBSXZCTCBMQ+7JTXvr6/qrEzoVPinsShburNooiVLMQw0wPoSjWE8jtEBsFlYtGdAy12CK/s184NgpqBOM7OfrN/rxOsBWUlo0SGY4Xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199021)(4326008)(8936002)(66556008)(316002)(7406005)(7416002)(66476007)(41300700001)(186003)(2906002)(66946007)(478600001)(8676002)(5660300002)(6666004)(52116002)(6486002)(107886003)(1076003)(921005)(6506007)(6512007)(26005)(36756003)(83380400001)(86362001)(38100700002)(2616005)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xs3M4M0ia+hBnu0BA7ZHCAsvbZu8Ohy+QVSKOCKz3l11RO6xHC0gmDc6+EPW?=
 =?us-ascii?Q?tL7BhZELXrZ6DHJQWjjpRy6NDDAEW99AnslVx2pwOpqQr1gzC97Tq/k5SEZt?=
 =?us-ascii?Q?JAggKmSp+zalpO4YUVAALvXtkW7Iwwr9kv69nPbc5Igu4O5izI+l2IUpehvE?=
 =?us-ascii?Q?PFaGzxHOaR/C5jG4I9XfAID1IGS3GFSpmbdGEA/DMYyOsAtTZ4RkfA/ytG3l?=
 =?us-ascii?Q?hSKgTmndCbU9dQj8T80GK/xe69FgKtvDhp+nYv3AlE8/1iY/GaGq1bL4aSFc?=
 =?us-ascii?Q?dQhp/bRahQ32DgZc0+GL/5kI6j1gtC6xticvUyKOm73Lcscu4pVhgtDCcIGT?=
 =?us-ascii?Q?MxHKJEQzmN/NZY5JPewXCThT60LE+83YAYabtbW3lcAPgy3agW0rsKXD25vv?=
 =?us-ascii?Q?hDSRLj3EnS/gD1GWSwNXTcshBT3kabnsta9PDYR4zr+q77gKyWNtendbRstD?=
 =?us-ascii?Q?tgcqELe5FnXOJuk5Iu4ARfSyJ4UGUeLonWwcGKkq0SxTiT9XNDlU7DEtK6NY?=
 =?us-ascii?Q?V5r92QGHhZIBc4mhwtdI2AOsJnyfmdvy1BmmenWcE8nuqMXwYlbKQBmzdD1I?=
 =?us-ascii?Q?5w4D7ui3Mw1Iw/bdcZ1TX9/NozJs0mkEmvGfCLXviZLvquwloqAjL0Z12Ko+?=
 =?us-ascii?Q?0sxlsUw16Ot2cCk0qNYK2EItRYo+PMLhwwAxSUk+3B4v81EX+1iR6Pg1hpdR?=
 =?us-ascii?Q?CycadSRF3zTAb+X5HWXkEABjFblaNrQRxg2oEcbLho/WWvjnO0zNAAuSvmEa?=
 =?us-ascii?Q?QieUAILeOifIRctIu9BKD8mJrPhDOg3/jljG5GC0+0uRmzophvbO2WfYBqoC?=
 =?us-ascii?Q?2kwo2oq4TQrBAXiBkgnodzHsjJB16GotZ4J38TRsLF90lwgEsiW0U3bVuRhk?=
 =?us-ascii?Q?fpj6PNThuzioUGbfi6IjFl+X5DZFsOvzlApji8JFtW8HoLtpMyG8hZhTlOxo?=
 =?us-ascii?Q?Sp0UEl7A8mBrheV1JWzLlsnlSDNaDQenmmDAJIVTyzCE5kr7n78Ay5tC9NKS?=
 =?us-ascii?Q?dubYgzQj77HLT+6DzwYawa/sBCB0K9vJLw0l2vIwHi2DVjOyPFh8nZeSN6G+?=
 =?us-ascii?Q?ghUt3ISNVqlms/BWbaUGL7aQEpfGXvYXeM3No8y5Z0V7qTxhIax/BKRZ8O6y?=
 =?us-ascii?Q?7YS1erD14hwqI1hWEy4yZC/DKOmn3zPJ90PH0axoWLjAg4URCH7f9LQenPPD?=
 =?us-ascii?Q?O5Cq1ByXIoO5Vv5NaufoZSiQOKRx3sH9hA2wUH3uiDg8SvGS/bCbjzZpPuVY?=
 =?us-ascii?Q?bz39nMPABOaofoVup+lDLsOoUVLhI/TPFm8672m49QiMYFKgZBdYapI+ggUY?=
 =?us-ascii?Q?SsU6apKWXP+oHyKUFlNctE7rIRXmU1tj8789gD0G7xLbdUvft6JqqgfoyNOB?=
 =?us-ascii?Q?SiTjqj/MLXWcbqyvXX08XChus9VC8M0StpZ9MnhAhDrLL/CBNP/4Oz9NcsSV?=
 =?us-ascii?Q?Y3wwlH0QzM9G69paPlHvWJ0e/Okv2j/vY2d7SoEEpCDa2ELfh6yNfTrgtzrS?=
 =?us-ascii?Q?8Co/HrH3xNp5wMnrkD88qOAV6wH9LXIi36vlAMJfe1ApwXixd3Lavmk6WgQh?=
 =?us-ascii?Q?Szsv7KLfQPJdoyTH0jlCQUO1PI62M60D8ya+Dlgk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bdfa49d-535a-4611-6b74-08db6bf488c0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 09:57:01.5306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2cpkTIEoNWuM4x4GF37fxI6kWAUIe7Lo3pBYKH88Tv+s9dVz3dxeBcrI/QKk+AlYdIJKrcJ27KtHc0RVtIkEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_025707_656366_2E088CEF 
X-CRM114-Status: UNSURE (   9.73  )
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
 drivers/thermal/imx8mm_thermal.c | 3 +--
 drivers/thermal/imx_sc_thermal.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/imx8mm_thermal.c b/drivers/thermal/imx8mm_thermal.c
index d8005e9ec992..d4b40869c7d7 100644
--- a/drivers/thermal/imx8mm_thermal.c
+++ b/drivers/thermal/imx8mm_thermal.c
@@ -343,8 +343,7 @@ static int imx8mm_tmu_probe(struct platform_device *pdev)
 		}
 		tmu->sensors[i].hw_id = i;
 
-		if (devm_thermal_add_hwmon_sysfs(&pdev->dev, tmu->sensors[i].tzd))
-			dev_warn(&pdev->dev, "failed to add hwmon sysfs attributes\n");
+		devm_thermal_add_hwmon_sysfs(&pdev->dev, tmu->sensors[i].tzd);
 	}
 
 	platform_set_drvdata(pdev, tmu);
diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_thermal.c
index 839bb9958f60..8d6b4ef23746 100644
--- a/drivers/thermal/imx_sc_thermal.c
+++ b/drivers/thermal/imx_sc_thermal.c
@@ -116,8 +116,7 @@ static int imx_sc_thermal_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		if (devm_thermal_add_hwmon_sysfs(&pdev->dev, sensor->tzd))
-			dev_warn(&pdev->dev, "failed to add hwmon sysfs attributes\n");
+		devm_thermal_add_hwmon_sysfs(&pdev->dev, sensor->tzd);
 	}
 
 	return 0;
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
