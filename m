Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2F9CA0EFC
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Aug 2024 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3mqhVkl08ioNdCikdV15SGpL7CYybtenU7uadDL61J8=; b=jaIWLJf9EW58J/
	lWQ4Gsb/SHOL4Kwd286rlQ7Uk3oeHaEek+RylfOqzVeUoX4OBrqq4jH476LKB/E7Tl1Vq9GSuSWVX
	uSa8+FJrIqxM9nutGa6Jo5s8NsrSdVFNNFZEA/25j6aZ6ArmCAwPK486X9fEjeg5udpHADsOy/fwL
	mXrXP58Cnjw7fnY7IQFHDhn4tac5ZUTxh+UOPAyYrxcOZm6p/xRWWgPd1AyPk7SYh+gV3aILFKZ3J
	35tFqSJ8CwZelcj4CQrgL5pF/6i6PGpZ/pXCUAAqQevVLbTpKgH9MllgUtUnrRYKwN5VFdzlIUV/j
	f7o36uLQIFxuyhiY3MuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjz6N-00000005sQ9-29LW;
	Fri, 30 Aug 2024 10:43:35 +0000
Received: from mail-sgaapc01on20629.outbound.protection.outlook.com ([2a01:111:f400:feab::629] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjz5H-00000005s8M-0Svs;
	Fri, 30 Aug 2024 10:42:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oFLnGQKB+qP4bo9LNpbZkuIeVCsATdlxpQkoYjN65r8MH9c72Yq8pzyide39vN/g3fr7xc3KOro56RgQpeo+BlpJ2eH7N951/WKCPioKivHkikOSlso4XLal0KR5LDRY5qaQBNLg/FGJkLV+xmFI99Zb4JLSVTXCstJ62jldNpNjm8B+r6r68+ssXpcM2lOFzBkRqkfgJU3o6GV/f//b0y1evN8h7Bv0NM3JgvMrVAyMCXScfpRxkZxAPHoRHFofUFbU0eKwqoD6WQ2SfmZ8+kqBYHpoZ19uciWS+ulZyVt3gN5NH85iKeC0/YorpKUw/kyl7ZI61cebfk19cDhhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoSg951d4hN+Kz3rGrXbbuuuqLUc2mHcmPWSJYlHgT8=;
 b=yNq7gT6708l87v58bz9ee3NvOIPNXKRnySQ56EBsR3lS2qzAK40qSovcuevg5AYCxIWuFnSxFa/8yQeOdpYtsuJCdTlln/Gl7J+gqOaClv+0D3Re18dvVh5euCaFPoiHg+LDoMib0GkZr1eBFZCuAzpEu1VCtDJxEWAOMxP+LwjBbdGszRFaFseb00sj8GF2h3mLdAqQluwK5x6Hbt/45smITUIBY6tyFUhniGBS4XpllKihFToHIv63CmkM+GPfR3cgdyFf4Qv80fC7SSq9nqWWG3poHXfOFye+vsdZsLqlyvzR4svyym5qFXpeVKXwjRZNpSoHFkiS4G8xJUZZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoSg951d4hN+Kz3rGrXbbuuuqLUc2mHcmPWSJYlHgT8=;
 b=bQrnA5Zcfx6v14yyI9q2P4h2c25vh4dehftXJKC2rMClAgNVNdSu4d5gA7KJRpStDdWIyKi/tR0QE/cl1Xn1ohIUnANSuHNAwg65NmrXTJ98V4YGMojthx28uHSbl0ApPPFs8YCzwNQpQTZyFUu1B1dDGwusdo9DlAwKPJWKBqe74ie2E23u82hsQ3qCraRxAZhjEDhg/9mvaG5YN6TOAGp5JH10Fig8/DgSBv+dlEb91VpVynwE9BtnXVdVptMl0/kbLxDlXtFgs/okhR59SB5yrsV1+uUfFGIAF70sdRsgCuTW0a1KpeBCetjNfdhqVAwkLPY7VIVFzHRlExWq+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14) by TY0PR06MB5235.apcprd06.prod.outlook.com
 (2603:1096:400:204::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 10:42:12 +0000
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f]) by KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f%7]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 10:42:12 +0000
From: Chen Yufan <chenyufan@vivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Chen Yufan <chenyufan@vivo.com>
Subject: [PATCH v2] clk: meson: axg-audio: Use dev_err_probe() to simplfy code
Date: Fri, 30 Aug 2024 18:42:00 +0800
Message-Id: <20240830104200.20519-1-chenyufan@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5487:EE_|TY0PR06MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 157035a5-e751-438b-956d-08dcc8e0680d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|52116014|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v71kZ1gTg2vcM77N59j5kcA/6MrJF2AJqj3F3rDatGGEpexJ+cLs977v9Nv3?=
 =?us-ascii?Q?SR5UQbxEhuSGi6Vt8saLxDJBWfrS0a+OhodDiFBwZVQDPzuVxiyupCg9zb2q?=
 =?us-ascii?Q?ToZPRMUNzQCJLscNUKyGqCvBUC3rTgDFnZ9UHMvOBCXDz/KoQ4Ec8yOkC8to?=
 =?us-ascii?Q?Fruoq+FSV03qjUvaUwmA6GqS0I8j/6dyfFCFlg/VIbnvycL0EXjyT5dycyJ9?=
 =?us-ascii?Q?no/gyTCIioFBkXGusyBYf81TjnvXeXR5gjywtfoAFo0Ct1GQiOz5qaE16B8O?=
 =?us-ascii?Q?Wkc29ngWIBryhtiRKsT4f6d5fcQqA6C55KvOFz6lDmrncEMcky8faK05oGpr?=
 =?us-ascii?Q?ZscvARcPHNfnIjYeoGl2KkIvn55EM53gL2Ah7K8P84KmO0w/ayqupykKbxt8?=
 =?us-ascii?Q?764GO4hIB6OUvQJ5AhlKh8DaEcYjko+qCZ60rhKOxtIP8TNwRUt83iuEtQwE?=
 =?us-ascii?Q?yvUkG1fBA7QXn7Q4OFlE4iuea0zLZPeOvz/WTNPE3YepomXppP+dWQas0GoR?=
 =?us-ascii?Q?VmJYzckCk5j/UukXwVyJWIXMt+VwmKMeofOp08S0geCZ+slRFdpl9QrQaZdG?=
 =?us-ascii?Q?TXw6Fi7SHEhViwovOUyg8midyAaZiOeDqKnYQcJ1gMkHGahandMqQLkbzLgF?=
 =?us-ascii?Q?S4Cx1m5YcAEwJSJgHRV680RnkW29y3SLxZuc3DWfMOZ14YD14jfpZcH93iSY?=
 =?us-ascii?Q?EYyj+TnxNm6+iBdop0GyDeqPHSyUWmDdmxXONcV5/o/gww4b1pXjJPpxiBkr?=
 =?us-ascii?Q?jdGhOOTT7BwrkokwXrKqXA61e90Fwcd1p81Z9yCbFXCEoYdHXsublYvgh+Vg?=
 =?us-ascii?Q?zGcW36cZoigkeV7ELgG2laTVE6CUS97B9MGFQn1kjXT0YYR6sGnmG8yRq3gq?=
 =?us-ascii?Q?++731U+RW17VahmV9dZge64d71ljFCKjuhbIDApcviPmOABrvpqJDGmkmdlg?=
 =?us-ascii?Q?jgt5QSaQh3tXXgAfOMteCa2kDElozc9+X7NP2sEiJovVlo/sbcsKDbVLSTCE?=
 =?us-ascii?Q?GmwQIrgeHRxOwjHVMAvFReqSfnVwittbWTPdF7uo7Na3cx3BQxPRSoj3xW96?=
 =?us-ascii?Q?xlC2kEuP8OM5CJUsUQ2HqE11EzwqE5VvxIMYzp2JagSppwxtkojYOa4VDhsm?=
 =?us-ascii?Q?BZpG8RLNBoqTxaQgmH7RfBzJWrY7FVt865Xes9krZlpNWa8of1hKUho4CPtv?=
 =?us-ascii?Q?hcmYpi8a1WnRqVHgBsSlEbQEo7mgGCbO8COyAqINpiyjH0Y4Q4e2f4w8aJRd?=
 =?us-ascii?Q?FsXLNiD68qQGs2JnFnRAkt6hJhX86nWySXiGRJw+KLByVwGQUgZdHXeuxVzk?=
 =?us-ascii?Q?Ud1XfNYqaQiKcxq7yeKah0ulU/CqaHyRlZZYUWnXbuEUBYRbtU0JBOAuHtV1?=
 =?us-ascii?Q?66Lxm7ZPTLbS4UYs2wh/JkkoJ/a97G7p4Hc+aFdcnb6rbxac0raVcASUBNNu?=
 =?us-ascii?Q?6BoPccMotZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5487.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZzOCbY5YHUiGTOYj3CuNxFFkuD59yzJvIig9ofS7ZzagZmiVaTBJnSY42Lpn?=
 =?us-ascii?Q?2m/omeBQ9Jfsgced4NNATvtD3j1qYNONCIEz8kiTMyZNhhqAzYL7AOAyisGE?=
 =?us-ascii?Q?84aFeM8lHjxIWl4rzti98q8uKCW/HCcpQgmJ48Ss9H8fqrkW645igayDf/Gx?=
 =?us-ascii?Q?Mf/Xjf0ffF7xtXPQn6WOH5O9F2FJSbCscXNUzxrsng2j+sUCzGjj46cFjDlf?=
 =?us-ascii?Q?W1AhWq3WK+PODGPWI3x2mjLHCspW3y9SDRbNSwBo7uBqx77i5yvLCHyltGFb?=
 =?us-ascii?Q?QNi0grscpIqTD/dhdQKNRnzZ1I8XimYZ+AVm6jgfR+nC3A3tzun8bfUVi7wy?=
 =?us-ascii?Q?TWRW3Z2AKp/feMh1n9oztV7ndZZ/sqKanbdLXuFyW5D9RHv/InmGZLIIJa3W?=
 =?us-ascii?Q?4roMbVIRvu/ITgoHVP1+djQkpRB9axL9N60nBh9yEQpgLpTgA01eYU2MlhQS?=
 =?us-ascii?Q?kRliDaXiUY/w2VfyDANxOpqrE6L7FZrb4Gqt/+g9Gib0Ba0grcMrOLLoiI4K?=
 =?us-ascii?Q?0QeNdF+7mAXIvDbiztTu5piOqqCrcPwwl7C1OBuXuhZ/ej67Vn7B5XR9CcDp?=
 =?us-ascii?Q?TqOo6BEb7bQrVmQtopRvy00T4j+26oy4xcv+2iK2WBcF/ds80LP9x9PQ45M1?=
 =?us-ascii?Q?g0zB3cKcduQOWvUztDX/havDC7yMA+xnqVv9RzsbXJslu/wQpZoB9K3yaqRS?=
 =?us-ascii?Q?D85Bt+lSRxgR6++ow+DhKES/Cfy+L9+wulR5iVpdkePdtvnjhozFIuA9rIXo?=
 =?us-ascii?Q?lcaGd3plBfAKpnNCuMNyTba5E5j4ghFfxt9qaUrQDNxKwqAF+wLADYsZn5ip?=
 =?us-ascii?Q?tiUqZtyFr0ben9nkdwjpkA4Td+7oCekFgC8damnSLVTj2hLHfb2BH2efk2pk?=
 =?us-ascii?Q?HIXBrUHyK5Zg7JaMB82vQzSFf2ACVZA5pq4ZhYMsPnb9RaJaslrdxGGabKAq?=
 =?us-ascii?Q?+QI8jMh4mzAC5wEKb5N7Jnot/YTcXQIOzdmfOVeY/4/W146ww7iUA6syzlo2?=
 =?us-ascii?Q?OsraoJCgoTfB4UGoq5vfv2k/P546Fwo5i79IgfbNozoTBRh7LTHIoM2XZ7e3?=
 =?us-ascii?Q?Vsf6x4fdzPHCu+aU2Xk9VUwIHHPPwZQmlvSqKtnqA/MAu/1B82Y+Wtz2UGCG?=
 =?us-ascii?Q?1L2CtiUdI3bQE6FdnTMX61N9RVtPV8Wze8VO/SLKpkOlrt7/rE1dnmt5WQuq?=
 =?us-ascii?Q?0Vt4Wxb3O6uKz2s0U07ia93yzjabEgZPcfOxpp6yMqEABWR5g5VOl5zGi/Ii?=
 =?us-ascii?Q?0ELv9TDzrKZ6TewacQJWiad08q5yWYnOPiJyClvC+lODGv4/iuXh5/h+bf+Z?=
 =?us-ascii?Q?e6u+Y8U8HCFpiIwitPV8nEdOWmC88ON7j7N3sR6TrZWDMhlTaAn2ZlF0dsdt?=
 =?us-ascii?Q?Sn1CH0xsX9I7bniqct1x4ltD/XpfOg9Qh6FGV5fX2iYX52fKFxEyFOUDf3le?=
 =?us-ascii?Q?0lWh/i4H4+SUwyXbBfVkwMJo/ietDJ1K69xVShli4J7RlhC0u/g3/cQlrycz?=
 =?us-ascii?Q?M48H3Tu3J98h59tUsJLrZQE+LLntAdgiSHtjlklrovQvGigbdb20T+PLCfuj?=
 =?us-ascii?Q?Z+oFIWo//aP/5qJ+hOC0a+EWGzlbmkp9drJRXTIb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157035a5-e751-438b-956d-08dcc8e0680d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5487.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 10:42:12.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ9xkqoRKtSpJXDzeOpJfWi3Z9EV9QWYZwFP+Ce9ozw16oDyVSNNH+ew2eK//JjJ4P38W7GoIYdYjSOM1KthcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_034227_584746_346999BB 
X-CRM114-Status: GOOD (  10.21  )
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

Use dev_err_probe() can make code a bit simpler.

Signed-off-by: Chen Yufan <chenyufan@vivo.com>
---
The modifications made compared to the previous version are as follows:
1. Change missing dev_err() to dev_err_probe().
2. Remove the extra "%ld" in "dev_err_probe
(dev, PTR_ERR(map), "failed to init regmap: %ld\n")".
---
 drivers/clk/meson/axg-audio.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index e03a5bf899c0..c3d2d483c61b 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1761,10 +1761,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	map = devm_regmap_init_mmio(dev, regs, &axg_audio_regmap_cfg);
-	if (IS_ERR(map)) {
-		dev_err(dev, "failed to init regmap: %ld\n", PTR_ERR(map));
-		return PTR_ERR(map);
-	}
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "failed to init regmap\n");
 
 	/* Get the mandatory peripheral clock */
 	clk = devm_clk_get_enabled(dev, "pclk");
@@ -1772,10 +1770,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		return PTR_ERR(clk);
 
 	ret = device_reset(dev);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to reset device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	/* Populate regmap for the regmap backed clocks */
 	for (i = 0; i < data->regmap_clk_num; i++)
@@ -1793,10 +1789,8 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		name = hw->init->name;
 
 		ret = devm_clk_hw_register(dev, hw);
-		if (ret) {
-			dev_err(dev, "failed to register clock %s\n", name);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to register clock %s\n", name);
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
