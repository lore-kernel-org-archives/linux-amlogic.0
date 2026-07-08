Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26862C43458
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2026 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBMIurkT7+fBCxUbhlEUophPJY95ptTT0stKegMI2PQ=; b=ujDM18bCVWZ4oe
	781O5azwRIA0g3fKfAGbOoWHAN2FQ/kiLcrEWCusewrFzx/t+sjxD6Z7eiP0lhs1JTtiZvNxCUoOn
	YzB9FUvwZDV2kokyAu8PXte96sxBUXfv3VTS1PUoei7T9WMMzPw3ouiOTvk70UYmHb7OtbLTb523y
	arNkrSlX0RSPpKCp2VQLCQPRrEYfeUN1O3HzGn/Q5gFJT3TrRz9NcGyH6+HWctvUQF4jsOKf4No7+
	YkU9F/uNhmTOItYnFXF4eMqyXy/aRxSMwAbKcqSbLlTA+ErAcwSl+gu4P7BQEKQULOgdbI7DUQgb8
	BvE8P2b5sVqxaz25vFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRFV-0000000H6dA-2hFW;
	Wed, 08 Jul 2026 12:19:33 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whRFS-0000000H6cY-2UOM
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Jul 2026 12:19:31 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6683v2pD1543079;
	Wed, 8 Jul 2026 07:18:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=XGJUac9104TObIpNWbR9EWZ0V9tMEEp8kOa0oEcOx3w=; b=
	IkZBJ+raRb1vzrWXS3GjkgQwqZGv/I9JJhUN2fegKX7hcUbkRPfOq2Q/YyCjxh2Z
	2pstUZ5d45kPgW4C24jxT+3sSvqWVcYD+NBlOw2MiNaLfzg/9F2EA0w1jkmbvepx
	O+MIQ8ccSqWy10Ywkku/hOukZnqaCkg3daVJNw0/Nobz6sDAyuvWj5+nn6Ghcv3C
	UkekfD0ACRFmOp1mOT+wp5wJFQjOlMVZMlZ/wuY0dyNCqG4XGNIol/OjoaMIsIL0
	0ZQevavqyy0O5znxxDG35YwBYBKBTi1Pi98Wsif/ATgZAkS41POfPPTBTHfR6P5I
	m+Pz17YEduFt3YO4h7p8Dg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022099.outbound.protection.outlook.com [52.101.43.99])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjp7dc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 07:18:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9+bhCkCbuOc3/UcYF0LR6rNM9qrKmI2e9d7Yu2iETdiXtYp4zwh4geTLI/hWFFFd4YMGNGnurZsQhlyCiMQcYxgsPR3cvUmfluIXGcTyOd9dxHS3d0Ld5ftBXm6W/lUsLM3+XmmDG4iiCznRe4tQxXC4p829J+MuYj0RVX18D5DFzRv5D5u9VEnOdRtmDhcXn7wpyq/QnIuCTTC5k6N7zfVx2YzAJs8psryb3gCNSJNzKgyT9hgvSAW08YF9Evt/iEjwg0Rd9DSTd/hxjFr18IHnjnIsrKNxzlKHzVX1lO8tjgwNcLxeg9j8A8go0HVJ97B74do+NrW9OxMftVLvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQz++E58YQqpGecUeeqhedx547eJTWVzup9T6XFgHeY=;
 b=A9E8XtVqAjoMOFgURC0EgXOhuE/653+hFlZ8xBRI84jmC9Z6vMbczK+Itojj8gh19RjCbAIcfWoSEIiQ+yyevmLo/ENREvHXxq5Zi4iOAhNPr2ZiHSYykGhMGXz7AaOzar6EqcdNZ8Xfa+yPXS2gJc5gLNTs3l3fCbGy5h4ns2ySL8dL15j0WPZK4YkMlwLL0kqv+wOt24qhtpZvpQ0AYjJIY8+IL1zpBWnwxp407NLu6Q6zFRnRVCo5wgzkUd7mxzqrA63CtL8luGHHSXrLAG+tIvz2cp1x9i6xAAU+/7F7bh1uh+NkkxkqHWBNOJAD/GdH0UvwwyQ7oAqN1IKl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arm.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQz++E58YQqpGecUeeqhedx547eJTWVzup9T6XFgHeY=;
 b=xBxoOesSJUSbT7He9w4P77Knb4Q7VuH2vcE/koEN7BkjC1Pub72vvzUS4q0tAOpd/iI7CJeXkwk1s57BiKCXMmDGyl7M0ttDKCfpuzK91UsvkjLyxv/HZ1yrguCsGR0w9xrdBPqnNVrTUMiYi6qxPCsD5kt/Gw9KsMNUyHp5re0=
Received: from BN9PR03CA0421.namprd03.prod.outlook.com (2603:10b6:408:113::6)
 by DM8PR19MB5287.namprd19.prod.outlook.com (2603:10b6:8:d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.15; Wed, 8 Jul 2026 12:18:38 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:113:cafe::a7) by BN9PR03CA0421.outlook.office365.com
 (2603:10b6:408:113::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 12:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 12:18:37 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4C309406541;
	Wed,  8 Jul 2026 12:18:36 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2948282025A;
	Wed,  8 Jul 2026 12:18:36 +0000 (UTC)
Date: Wed, 8 Jul 2026 13:18:35 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Chen-Yu Tsai <wens@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        patches@opensource.cirrus.com, linux-rpi-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
Message-ID: <ak5AG3ReEVvDsAAC@opensource.cirrus.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM8PR19MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e629d72-4b2f-4077-95c0-08dedceb0a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|23010399003|61400799027|5023799004|56012099006|11063799006|4143699003|18002099003|16102099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4eeotML4jH9ywbG/b6Gm14SRA+BaLI5CiYEVhTfvT+iyYCrq8aNwQ0b53tLgi+hbOqYQg8I5Xd//6WqYdtB69vuQjOnyL9j8bCrC8aVyib+//jgE0jMoCyGhZsYbwAmmfIRb4y2o53pMgl8hxPEMx81bmSjLQc7DMtgjQ0zxFygfi6ebriohUjp7vHe40gfPwz2n2Rz1Sx4nSbAWNcg4VV/Jt1MUnAS39Vm5VG2xuT+Rpxq5jVKSEcKFFqYfT3Fk4nkH5fAnYsqvGm2TRnUDzS49yJFWhj43QzEMZGJjQS9uW/nUmi1SHFnq8Y12GT+YrPj+c0unb+NL7Zta2RARqP5Mtxwy5Mp0FE0xobboJMcUMk4umk8P7uFAOysIogDIF5ohsyl0JspQW/HpoLj36utaoMg/EcR6wOtasWm9pMvteJw42VMXPipsJlHF8UaN4HbC3XdKGEspIX5IBcjh4wtY2cjLpVvIss8fyonUNXEOd4WjdYdWAwni0IYAExwPFooYQa4nhpD0uHnlzN0MdH5C8ol55oTV65lviPnsQ0+mxhe4KdnITxRooYePwKmUqn37gp6E+cqxqUjezMPOJBEGehbnSFR0leudMd/Dd4z4MaTYzNIgYPO2Weqvia2hmUM7nKb6qsTQUwD5EXPFmsLE2bZThuORtr1tYtzkLaTATMOZUD88mzETJ/fTA68l8mCIlmLJ2kr7KITJCKdG1Q==
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(23010399003)(61400799027)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(16102099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NjAS7ig8Unt3Dewex+D5v0aFKETjmyA/G0fIueOx30hrKxarKWDueB7ZeLf73u24XeAdsu3vojzhjgAZXrr/6wUH4+hpQ7Aso10/7PSv0wZuWFbJ+3rnK+1Ux1wvVD+Bbn4FNdbatLX9I2zKXtJgQfUwFRPl8HuHMCWeVVerZd+hgYmciWC75ke6igp49wFQtVI7/QQ/nvh7G+VUqURJqNgj+Re8cX6u5NPJAbjkm6nts5KgPMXT3ZOAlElGlRZvjSKGh45/JopcKa/40F5UCanLnV2cDIQwg08CyccCGFHnZ37kxR8XghPwxh9T6W7/41krfFIzYN6BJ09IDP+Fq4egkMTlQNyXEUZJ4bI8oaNhHuKfTFB2uJJ1Sk1XKJ+6rqCVRfOICHhVKn7b01cKy39UY7vUgHGPJCZUG0bYcBjLvi7t/NMH9zAKw1CRkHIa
X-Exchange-RoutingPolicyChecked: pgXYzTXQ7VHbyW7MGX//Ngmki9PB6TPQ8wChl/GSnezC4iTnloYk4GdZUCFaOzKNcrY9FnqL3rravHPVkldQIEqjcM5eav8zHCTN40SJqYIps8+PrLfJ2/4jYq7Jp6MWlYQRQ7wamGSaKojRfJPeRbZpYCJT07+Rn+KHhrqKbgOsrWkh0UPx9T6HGJo13HbPcCjXBmHhHrr0KmAH++NAvVMTvAWAq5DRT4YOOKGliQWB7T1akx9sNRBdzwTwuoO2k4iDDJebMmYoYHFKzmjsws5xpKTq1rjOH9+9Jw1rZMCyBRFCpBFKpAvY4icY0+WWJVjOe3mBLGmTAjplLD7uiQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 12:18:37.7330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e629d72-4b2f-4077-95c0-08dedceb0a2d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR19MB5287
X-Proofpoint-ORIG-GUID: Y5u0PxmnXE9FfiEfPGHYYU_rSk9dmXNW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX1LMGHk4Y/RxU
 zGtotSIPj2BGu3qkWcupl1VrCcD1Vn2VifyL3YUFU8lhv59AHbZt87CPGmy8808vGXKFT5X7KLZ
 cMIdKQt+N05E4/5Alp6LIESpUQq3osA=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e4023 cx=c_pps
 a=MyZQQtGQDv4zT9mHdzB88A==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=Dc1nfGASFo0QrZ5EXQ8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMCBTYWx0ZWRfX+0GPVH7KQRxC
 jQbWwmZoQ8F5TYe8HOY8vvLNmLl4bueBcCYfpTJaKAOlvHMb99W0096b81Bfmn66dFyCYSsiowT
 hPz0LXk8v7HcYAlPjaW104JBFVhklQ3MW7YIFtjc8yYCNh8wAcKjqsamJOPJy7+Cy/ngDTIDEaO
 Pr+KT/5Obb7a6qhqy84uZ4eutRTow0ZuaeOD6gRB4730tpkR7oUd1MJftQbq0VMvlg4r9VkV/z+
 YmYOx57RdP54Fxu8x6ELVpcLMlsgOw1uZEzQt+gFlIF15rdIU1HN2ODJf/uBa6AxOWkMirJtz4N
 GDSgZdMjY8KjxO7q51pHTf0Z7muSiGRbVMmfEBT8Ts07MKuqhJlOJBkKRowR+zkMovit40DL6tF
 LfcOC/fhFWKgC+XhcrMSa7ovxfgGnHpxkoIi80dcFTb1f59GNC2fDBt2whF650vt6Jn+1p4Nn8T
 FQdxjBdtcSKsjW/+Tig==
X-Proofpoint-GUID: Y5u0PxmnXE9FfiEfPGHYYU_rSk9dmXNW
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_051930_741882_6305F4C6 
X-CRM114-Status: GOOD (  13.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 08, 2026 at 01:15:28PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> =

>  - no comma after the list terminator;
>  - a comma after an initializer if (and only if) the closing } is not
>    directly following;
>  - no explicit zeros in the list terminator;
>  - a space after an opening { and before a closing }, a single space in
>    the list terminator;
> =

> Adapt the offenders accordingly.
> =

> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
>  drivers/mfd/arizona-i2c.c      |  2 +-
>  drivers/mfd/arizona-spi.c      |  2 +-
>  drivers/mfd/cs40l50-i2c.c      |  2 +-
>  drivers/mfd/cs40l50-spi.c      |  2 +-
>  drivers/mfd/cs42l43-i2c.c      |  2 +-
>  drivers/mfd/lochnagar-i2c.c    |  2 +-
>  drivers/mfd/madera-core.c      |  2 +-
>  drivers/mfd/wm831x-core.c      |  2 +-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
