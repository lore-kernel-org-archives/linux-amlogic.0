Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A77C77B72
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Apr 2023 00:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:References
	:In-Reply-To:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8AMXlIILHZEyqAR1ItK0cPEdh12YelMgsTumVQ98iE=; b=jUJxj3sufIm5aq
	Y/DuyN+7UTO4nOUzIpRMSdY8J4uq/xvcvM9h+3/w0fhRAHzUsbVeTa2dQLv73JpHutqHQkBy9p6wX
	XCev+lA8d9BxRIGjey2LvIndp0EAnEVWjBRCJRLsTziaaYrOVE27caOPFx7B7jTtW7nt3+hf3PvWs
	+CC6qA6AHVeYfwxHrsNBoZKk+cmS8VxrXruo2trM0dOPJgTaP5L4ePqPqAvduebYyfUacggd9cSEv
	YoK1W7CdlOufeUhv4pt1kfLb11KixyK8yT+PGNtzFJu2EJ+6JfTnEM9cQi4grHoONH6yFjkLyPDJ+
	Nw6prLsyCXfREHdx+4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poZCh-000V8d-06;
	Tue, 18 Apr 2023 00:28:15 +0000
Received: from mail-os0jpn01on20724.outbound.protection.outlook.com ([2a01:111:f403:700c::724] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poZCd-000V7T-1y;
	Tue, 18 Apr 2023 00:28:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWYzgOPSEn/YRXZWvT1zAu9DsXrT5T4kwayDan1Bj01DA1XQpoHbuS5vz3iWnfcwcDPcF2HOiWQcqqn2o8Hv+V36b4BWSp8Ny3yAK4KJUeZY02EczkJsERksl1KAFGTWlxVB+n6vKJXHYsckNHNUKx161ko9H6jrcpRR/J8VITM5qtHAYK2/6WFz05QCugZwyWvrAVsW5g6Qqa4K2Dyggq+tb6hSfppDgMK/IIrPYoQc36hanZtVKuSFngcy7U6fcaefKYIR5qL/AU/rWcti3ORVaeT331/V/jZ28K+GEhriRFqoS8dVGpAIru7Qcdx6cc/MkbZnKR6NfV8wobvHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toPofxRYG5O42jQiDJA/TzsU3o8U1GGGFIcrip1VUOk=;
 b=G9qK8/rM/ll1m6ocUjvzKfsidDFPCn0gPktFpF8MiY/H2Q4v6pUXAfFoE2hAmvjc4VOh3gmx+Qfy17Wa67BNcVSo8095yVXaL6I/YT1O6oeKLMy42OjObDlQiix5EmLcKEiF7MLWYrT2oK668NO1W5SiCwHyuRYWFBXGqcYZPo5U0dLCpsSO5iLdPibbgQLdAgycJiTAIRqDELl83MbvceCddzBqZZgKWedmpPlb00rzOm1TwCuPmMpj2ydd8pxvbX0IHEh01HgZOzDpCA3x2RfhYPCKxr/tXstr9i3MENmw2mzpbZsG3BxAnORI2E1DxxFGwrJgAv2jY3lMLPtGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toPofxRYG5O42jQiDJA/TzsU3o8U1GGGFIcrip1VUOk=;
 b=YZQK8MhSVOqLBJfPyO8VT1Ypl40nsdKGgE8kcgTPoh+8EFcwiWpJGq/EV9aFXK/qY33TLZccSCajyIes44FWHlUJpo6VVkjTBrRpvr22NoMhlggUA/H/DqffD4iDCgSkXKRSrvkXDAdPj2xXna6DM1X8j601EaQRXoXwAe02Pm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:28:06 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:28:06 +0000
Message-ID: <87pm822fvu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 10/11] ASoC: meson: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Tue, 18 Apr 2023 00:28:05 +0000
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c847da6-00b1-428e-438d-08db3fa3c75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jQO5huvuj6woWbyVgiJKb2dCqPxj4wfYqHSnHMkn0gTeI/RTNilb9+FK4/gqqcNtioBIcRb1ySo83sEZj/J7sqQ/4dLcPpaCbU/JXAFwaofnJBY2XqvslGax3GLJYKqF14VYYDfKloLzch9ynM7xNVEtwwxxioK1hxsJZJemmjiNcSRD5O7wlOwe7hGuqowYYfuKWea1045PADvPMM/LnStS4AKV+JV95gBzCemWaKGcQf+PoSvKkTGQKCy8+askRTjt9+dt/9lRhOE8cLLpq5T4fQ6S7CsRBJiS3C3ArSg8knjdFPsNBMiojA1vyPGfvYBRCf+ouKfV75Re+sePMkD2a7Ra9YQomxBOpsX2qBveodBkeyik8Mwh5XAyakDn886KYay4TmyCfzo8EqHLqHUaY9qrl8RZ4aNZaPzzo+Gsdk8+owz8erhUDjqotquAh57BLwyJ7yooPxLGpbzzzpyHaOajRJiRcPH1DmT+luv7hcW553OebK4ylgOt23CI+56WzM+QY9u9SLobrIfbZzV6l8YjPC2YY4JVFS7zpXfr0Is7OfMwV2xQ8o0CDxwMn8UQla4sn0rmpzcOJshXN27l5VQlOlwqjDFbmwUNG46/jSG8aUsvoWcuagD4jOBG
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(2616005)(83380400001)(86362001)(186003)(26005)(6512007)(6506007)(38100700002)(38350700002)(8936002)(8676002)(54906003)(478600001)(6486002)(52116002)(41300700001)(316002)(36756003)(66556008)(66476007)(4326008)(66946007)(6916009)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ddsSPMRYGm9fNWlCSjqubmRtGtcb24Ne5tluTg667CK9Ai6Ag0WC9UDXs+Gq?=
 =?us-ascii?Q?gWHKUJuEgxUMZDwahFfCSVctsQZ+SIjKjn4byaDdfXVRG1pCLSoqKvmepUTV?=
 =?us-ascii?Q?YMFSPeHCRxwRGLM7W3F+7Daeh+hgHU9BF5dCGZuq3vUE72iHxapcv42oEDU7?=
 =?us-ascii?Q?NLmWzrOWiFHltFUEgz5NUuioC2jMQBh+XX9yy0/LQ2gmptxQBDzzg2P9BW3O?=
 =?us-ascii?Q?Is2Drto34eCxzJsLRvEk4smth4Zp6IOoavE+SuBqEl9dBRphd4nszbVOpWV2?=
 =?us-ascii?Q?w3Z+AJANZy8bdCZdIczVZRYuuyPR/C24xktV9PerrizzT34FEV99v1XIj7E3?=
 =?us-ascii?Q?2EqrBVPEprlT5dzuHhKkNBDwYZPRTAnQUagdIexsvfNQY421OZj2UO4FAdeo?=
 =?us-ascii?Q?wdzsfah0Xm/aPkbSCYCnrUN5EuMBldeiA27WRFQIvgRLTvrjB46USca8gJa7?=
 =?us-ascii?Q?hUp4fbBkU87wVwda0c2dUBkryQqP8zgs8eD20CdWLY/jvodXqIiCaL+wf/6f?=
 =?us-ascii?Q?Ht120Fzlo48w2QbmNqguDKdZsoFSi003qPtR3qRLNp+CmuIqJ1pPrvOaKyIR?=
 =?us-ascii?Q?72TxWPCUTx8UhfcNpAiHsHpLOCI9b2nRI/HSmFxFGyoo5zkdn+ZoL/+GsAO9?=
 =?us-ascii?Q?BWdoLgyaPacB6m5FUOaEU28vW4vUbJR84RFXMNhNHVd9s+qbiaz6lN7aFBTp?=
 =?us-ascii?Q?Yh/SuKB2/Ti7dZyuvnt3edhl0uBj3xqyNUSEOkKm/+WHHhRJhXR9LmNdngkc?=
 =?us-ascii?Q?pD/vNRAtoZPJvFzPFUkhQsZ0uMBPZFGbOZftzeVtqkEjX+wjp6w2yfB25Dc9?=
 =?us-ascii?Q?OCB+BuNRCD0PsfCsIlYm0diGKZfIqtf6ose4ltinOxySDsCRyPTxJkSYFpX/?=
 =?us-ascii?Q?n4OTNvD9SRuXjZ+6F9NbwrnEUeTQXWIU3jxkUKHBQ2UeJHuCbLi4XCtQchOA?=
 =?us-ascii?Q?BGzx8YvmuRa9gSD77zL2J7i0CDZ7R4DBGSEtTHYZN1IDrehT0lMs3EenFKB6?=
 =?us-ascii?Q?r/5jX7PitZVvRccmJdJDaQR8Q46fl/mufOZA5d30/0zQFLyUs/gRTtEwX68p?=
 =?us-ascii?Q?wgNU6pLxHuVomlv4D7goc9C2qRtE92BQFUlabGcHzxdpMREw32SiwMihhwaJ?=
 =?us-ascii?Q?MRYVUaH68siaZ2lzM45HoVOPTFKbdOa8fpELGYylYdJx2yTtaJ/kTxwQePZZ?=
 =?us-ascii?Q?g2muzBjaCl+iAvKIvp1ZkZSEt/NNlhYNaB/vGbv/OfACsvSxwHOckxWOwwGs?=
 =?us-ascii?Q?NHWn4GTj4hH5voR0R5Nd/dU1ndNTzCl8bGvMkyGStGMtCIAnirIoE9SOl6Bb?=
 =?us-ascii?Q?Q2lKcTcrBiITpQW8n8kZWRL6GFGDmaIWLCpdJPOt4C5qWobebIsP+tzSURSv?=
 =?us-ascii?Q?Kfhcbk4vy3v9nEf44YoBB9+ufxXxsy1XmdrMqeO26yVTRyIYoxXhY3FCfcj3?=
 =?us-ascii?Q?Jh9lwOlVjpJO1kHkYhfgO7vM9tFS3Rtb+BOMGP/xMUIEJlpJMzkIXrPhRJya?=
 =?us-ascii?Q?UN8a8htN6ZOtEhmv2NOxOY17VVbXKA4fJ2DNB5YKK3XXK4LIu3HjegytbSmL?=
 =?us-ascii?Q?GSmM9zKZ5LKzLJL2AE7X7AqB99Ifbq/haSdEmxHAUMZ0ThpQXSzIgAK2NqhO?=
 =?us-ascii?Q?Zd8DvyrhB3zmLOh34brmlxM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c847da6-00b1-428e-438d-08db3fa3c75f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:28:06.1346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTGRC8y//5qVuup294OdPRn3PABiKFNIwz3IbJO31EIqOEGQ0p5Pc7jlAIAH6ehK15y6ESC03Xg5h7ktONDzD0yzZVufPeFyRhdOYIEGx7A5BbaXwng8w1b8BggGfF/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_172811_651022_22D46C45 
X-CRM114-Status: UNSURE (   8.56  )
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

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         |  6 ++----
 sound/soc/meson/meson-card-utils.c | 10 +---------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a25c397c66c5..5c2fff1ff607 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -120,20 +120,18 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	if (!lb->name)
 		return -ENOMEM;
 
-	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
 		return -ENOMEM;
 
 	lb->cpus = &dlc[0];
-	lb->codecs = &dlc[1];
+	lb->codecs = &asoc_dummy_dlc;
 	lb->num_cpus = 1;
 	lb->num_codecs = 1;
 
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->codecs->name = "snd-soc-dummy";
-	lb->codecs->dai_name = "snd-soc-dummy-dai";
 	lb->dpcm_capture = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 2d8d5717fd8b..ffc5111f9e3c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -183,21 +183,13 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 			   struct device_node *node,
 			   bool is_playback)
 {
-	struct snd_soc_dai_link_component *codec;
-
-	codec = devm_kzalloc(card->dev, sizeof(*codec), GFP_KERNEL);
-	if (!codec)
-		return -ENOMEM;
-
-	link->codecs = codec;
+	link->codecs = &asoc_dummy_dlc;
 	link->num_codecs = 1;
 
 	link->dynamic = 1;
 	link->dpcm_merged_format = 1;
 	link->dpcm_merged_chan = 1;
 	link->dpcm_merged_rate = 1;
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-	link->codecs->name = "snd-soc-dummy";
 
 	if (is_playback)
 		link->dpcm_playback = 1;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
