Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA2DC43458
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nY1My4G6bBFs2BoSnkvMp1bz6BDy/6Lh5OAhCciD2Ks=; b=yuroYjNVEH0NQf
	7DVt2qoXxfgBrFBTnY+cNpWxQq2QRw3zH7OEkgGGX5BlGCXxe6YTBV83ugeTOzc1N24+pDtkCYyiQ
	7v6NA/JKzJYA2FuWTt9E6+Q58nRfJS7c62X+2TQbPCj+tEpCQvE5YG5UXpptpMghfAWbaHa2m0/Tp
	oIEwHoX9/jpEpINDWid9GqQe2gapw0R6WsNaXJaejal1lRh1Q94kGOEDc+ths/9vsRmTRzbrpNwnX
	TNF+uGhHlRkLPQHk8CQOYLQp7Tp5eHMAvsHlDIPkLc1tfQl/r4ky49dEKvoz/dCd6bmzr5Z18Sk80
	9L+dHHf+8dwrcvCi7SOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEVu-00000005OUe-2fKE;
	Fri, 10 Jul 2026 16:55:46 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEVr-00000005OUB-3QHc
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 16:55:44 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEoqRc2198195;
	Fri, 10 Jul 2026 11:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WsfF+mbRDPD+GsPWqxzNZj+dFo6F1e9HzKDlJXCosvc=; b=
	GE9u7lhURyNL+eTo/OdMcVkqkDFiwsWZlR+aDNVMTBARCjC2zqdI8W+BULvhCWu3
	j3Rbbp3pPiMtI73Xgs3sUPdhUeRmMzhTZNEB13UMWCU/hIkjrrMmfI+OTXm3aFpc
	63cX4lxcX047b4cwgMJkLJe0UdSMcQcY4zo8B83yEijUZwBODV14il+1ILRxbN5K
	UPoMng1CArzavq1MzwbbQCfp2M97jbiNf5mOsesepWNZwx7IFQVtwpShzRsFbVjB
	HHz9Re6tc7OcnJ1UwV5sMUMBgpaRvyaEi7h5K+QPlzPjnWPceQbH+hRZYoqDsXXM
	x2W8es3UmIIJGGpAW3i80A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023128.outbound.protection.outlook.com [40.93.196.128])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fb2uv8729-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 11:54:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bdju2I5oRh8RlDzx3p8NMICqJmXOl30FOGLUPkZqFcwUlaXzR8ur0uXJBVpCX5QvZDhs+QZ3EvphJQNlHjZNIvWF9JC1DXY4gIHZbbPKlPQItb5vpz/GHil1ML+g9ZITXxKY3Xt9qgRM+MAqKNUUtwukLGH4X+pg6jJ3VsFp5WdAiMCKPJXEk/0QYxI3+cxP53Km8U608u7jaoqNJXrk8Cw1YcCdmTGwpqdL0wFZoYxa14psbW6CqwjaD3glyvtmqTsfnvDbKAFtbKWwxNMS42mJctE6xN9bBbTScqIyMEfPu2jwrDIBAjpIX2HXwPpumvbnwBBmHNgjIqqlg5muNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYaBMSvSvX6TdwuniTCPEburPNpHEzqff4k2rv+0oJo=;
 b=jz5THsObs73Dc9FWEjzV10HhKxp6vHqUb0K78hACLMc+exJIFES3maHY0OttvSV8J3Mo37ctOY3BQNY4BzmDg25RxdQ25DuajcSd630XbB9kWSShS7fy4UG9bXZ14OKJ00663dPwYMoLNXXpTBE1qZzImAnnk+DU7iQw8tv/6g/T7RpzXfLLvxQSJALLeShJ5xfzh+7q45z1TfROMJ/mThAlH0udFIKTjAAcT8YvEE489U2eHwL0rMvqH78rqO8Kdql2JUKFWcXTjZzdDimDiqXPA3V+d8no0whHoxXMcY+FPHJL59dCfgkqOWZekm1e1TNWSdMCDVw2xiJ51SoD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=arm.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYaBMSvSvX6TdwuniTCPEburPNpHEzqff4k2rv+0oJo=;
 b=piIz7mDT96dCdvMPHGgKmg8TxMRUY7sCNlcF0ANVRkfI5MK+h6Bu/V/osG6ZGJV/xqMY8/FHnZxwvJu2nK2jB2DA71jsfRLhCmqos99x9ILemFN3LLcX9EURAf9OaCALXeucoHMNVZh3UF5obI38gHJ+z05GcXoKMnI1PCtRxM4=
Received: from BN9PR03CA0174.namprd03.prod.outlook.com (2603:10b6:408:f4::29)
 by LV8PR19MB8623.namprd19.prod.outlook.com (2603:10b6:408:265::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 16:54:16 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::21) by BN9PR03CA0174.outlook.office365.com
 (2603:10b6:408:f4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Fri,
 10 Jul 2026 16:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 10 Jul 2026 16:54:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E1B92406541;
	Fri, 10 Jul 2026 16:54:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BEE57820244;
	Fri, 10 Jul 2026 16:54:14 +0000 (UTC)
Date: Fri, 10 Jul 2026 17:54:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
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
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>,
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
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
Message-ID: <alEjtTiSvVTpc67y@opensource.cirrus.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
 <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
 <315a0aec-99e8-4d03-a04b-613acfae1f52@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <315a0aec-99e8-4d03-a04b-613acfae1f52@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|LV8PR19MB8623:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec0a9f4-fb57-4440-dbf5-08dedea3e074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|61400799027|7416014|56012099006|11063799006|5023799004|4143699003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info: xHdWP6BFiAX7wCil4BOH2THJG8Em0VV1/40paxl4bGXVAoFqZM2acrhHAMYMqDyM+2JtYek8vjukpJNWBToA/VGGWw0E/Ouq/J3+y21RYiOnTFBtKN/R3aF6W15vm4IGEguDRf75P6O/fAAzPqq7JCQgjckMTTa+maCdu2Sn7fpcmGrDM/2uYPYCYJ0pTKUawtIIEflKELH3zHK2SYJ4JcCfAmprq76Xg3o48f148gQ6iY+p/JNNgNSLPTFudxzHkOOgGnYkwPee7JZK35rpxMhVW7kxbp6oEbTeKVn7ATjBEBkjo2CVsggII0Z2xrtSYySma3iZxyOmcqSe1KwJWKnqY5yx448dEJ1uNlHiQK9JZ53zTYmQ8GY1IvO4kuSm2naHPdlHJ3AiBEmMOrBTzYxSmq03pGXb/uQ6PIhAt7oSu9MpKTPoTyoBb0TpwvJNf2429Gad/ephxKtesOKsrxphGur4G8dacjgVxAZdzuywdiMN6L2HuqIO2dTOY+P/cHglaMWrJK2olChodERU/4tBsPnFd2GycdOxh4pqEw1FwiMkxD3ySZSgXuwTmD8aH5595/8tgo6aFIPQgAiitiVxeNkq649ZfkkhizFBBvJ0F8BLmWG4uMtVFKqn+DTxPskwscxi6e2GslvWi7s6agqcKF0W/+pUgKU2Ndl8nRe9aNg4/DCBLDKsiYXc4GGFgWmO3NGB4rOEtVfT5s7dxg==
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(61400799027)(7416014)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i/SW3mqNUJuXlKojgY2ssCUUqiLxe29+W7MoTyrFJeqCpX34Vs3Os3vkAXQmZjDLoY2kojndVJF5C4sKfLl57Lu+AW9GULpId8YlMwhs+VaTpawPIX0LBS5qxI5EHuoLmXtBoeUghDy/4+a+z4Zcghb8uwNySeb+RCNiEbQN25TC5ihRQtvTSafqmoUX1T/2ErSFHFpOd4qwUREJ8vuU8SjWGvjOzwqUN3RZQX1PFQ2zSTd7ZLpl6mG1i0RQlaudrY4GJoqh9h8k/43VgS4vwdNp0hw7Eh7poXGdkINSLNtmaqlEpIv4PP/XGUMAD+2cVu6FORAfK2MP+0h2gszgZhVtkEYO70EFp/trVL4NKZI8bbfNdVU0+lIYAM2ybG0hIAMH/rArVqH1mt8RJAPgH7ZPUcbAS0joP2XbOXiVeb9mdZtixry9+/XnYiMJIsoZ
X-Exchange-RoutingPolicyChecked: XXjbSfkf80Q1cCmYZIXIfgpdR+tmmOWxUsgdiLUdS2huNbsREdgfktgcBc4zVkdSXjz7F6XyjAH9lEV0WYOv2cxAWO1AYwX5+FVgkdX3CDeNtL3ZGdxXqloyZzHTbxQAZOtfrfm+nN51sxs2ZqenYWiyDC/ZpwGjmrCrFAumiCm7VfVc6OjZIgYv3/JY1x8HQ+nzHSVdlqC58iNNhKYAoXkz9vOxWMbrcjBhKzNk0rykAio5kSgbKyvm/i04Eo0oVEN/DFRz/naOCddgEAXrSa+s/9JyxzgGClZXtKQe+il966FK4rC2TvB2yBE3oHoXi6+58bXupjmgvRwXu67SSg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:54:15.8051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec0a9f4-fb57-4440-dbf5-08dedea3e074
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR19MB8623
X-Proofpoint-GUID: JLAIj7Q6KBsy4Jxk2m3cvPJSotDP8xmA
X-Proofpoint-ORIG-GUID: JLAIj7Q6KBsy4Jxk2m3cvPJSotDP8xmA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2OSBTYWx0ZWRfX2t0vl7B/Vjwd
 OhMWG02j+Iw8DWSBsGsmpxYWVQQEYOU1GX4XWiPLiIBF+lFkseNNNbduN7WyOretr0yoK2pe34d
 Bwhe5/k0BASVSlD5uBEB2Z0ssnAq0AQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2OSBTYWx0ZWRfX61hC5wN0xFiX
 kTIk9bwpQsVsM4r3YucR4XBDQxGpCdcijNCdY8O3zIrBXdjPbWoFuQ4MMqAFOeyyvtjNhIG9eeO
 JKC03N8PxrrfbBOMGrFaZ4wL2c2jMeMbPznoyfpTaTNLHAHgl161Uu4ZHAiwVNjcomfxexw1EmF
 bTJNvqCHGYE1zS8oMk8/vGO3DQr0fgWOQNsxzg7hkn7XXICkYxTVeTPi++F0zKVVH6VffV7NdbN
 WGFQ/pQhgnDKd2EdabqItPXtxRm5Mbdq6uOsEBb7YzaDLPfbNohFlOF/b0vl2rIveCEF9lEVeN3
 IqpkX4+pUeRo07kBBFPIyxirSpqY39DZ2EO167uQeeK+sLrnUUh0fJjIIPjfBy6vGurxigawRro
 IrrYpC1XOtg8mrxpdoDmOFs/2LCgHOb+03/5E1spMQoJe78bxcuwmqWgAEUJ7PASaDp0+KgQ4gD
 sEJxEpNstA/Mjo4vLvg==
X-Authority-Analysis: v=2.4 cv=b66CJNGx c=1 sm=1 tr=0 ts=6a5123be cx=c_pps
 a=7mMRTYqth7La13Zyv/ERAg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=tVKXKcanaTD3nCZxYbUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_095543_854508_EE473A5A 
X-CRM114-Status: GOOD (  20.40  )
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

On Fri, Jul 10, 2026 at 03:15:17PM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 15:00, Mathieu Dubois-Briand wrote:
> > On Thu Jul 9, 2026 at 6:58 PM CEST, Uwe Kleine-K=F6nig (The Capable Hub=
) wrote:
> >> These arrays already mostly match the most used and generally
> >> recommended coding style. That is:
> >>
> >>  - no comma after the list terminator;
> >>  - a comma after an initializer if (and only if) the closing } is not
> >>    directly following;
> >>  - no explicit zeros in the list terminator;
> >>  - a space after an opening { and before a closing }, a single space in
> >>    the list terminator;
> >>
> >> Adapt the offenders accordingly.
> >>
> >> Reviewed-by: Andr=E9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> >> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> =

> Thesr are all Acks, not reviews. Entire commit will now carry multiple
> review tags, implying it was reviewed by 3 or more people but none of
> these people actually reviewed the commit. None!
> =

> They looked at one line out of 100.

Technically 16 lines out of 375 ;-)

> This is ridiculous.
> =

> Quoting:
> "Reviewed-by:, instead, indicates that the patch has been reviewed and
> found acceptable according to the Reviewer's Statement:"
> =

> Not piece of a patch. THE PATCH.

More than happy for it to be switched to an ack if that is the
preferred process when reviewing parts of larger patches. I have
always just indicated the parts of the patch reviewed whilst
responding, apologies for my ignorance of the process. Would
probably be an idea to update the docs with a specific comment
for this case I am not sure that is as obvious to me as it was to
you, and it is very common to be reviewing a part of a larger patch.

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
