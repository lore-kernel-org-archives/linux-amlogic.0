Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83189C6FD18
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Apr 2023 02:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:References:
	In-Reply-To:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATPEyIsarn+bxKhWZ4OpIlJdy2RrqECh4ZJc43EUnnM=; b=B/EfAff2E/SXTF
	/KHRkH8+cX/5UGo8LQJ39UgjJ6MfFbYapuvJ4ew+otWjCtc9JKGrSBStZwofP9MytMkfISBjAPFPh
	IbKk++qYS50oSzz8QEFlFgvEXi/B79gpRMLINkxpaLNFVcpaeaSCUxfvce4sNBPznppQoMuS9W80z
	y9P5ga9PYdMJNDNNQ5UfXtQzb1Z+16yl2ZR05m19dEFdiTPlGkO55l5Bt2O7Nlv1eApYhlKalyjGO
	joPUw7e8cwnkrQM/5PY6zXwNLYNPmP08LlHl+KJJg+7jZupUJJLWNJ4i6VUrBV9ODlLaEXJCxuSwq
	SVAKHB+BFCIc1B17Worg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqm4g-00F7z6-1q;
	Mon, 24 Apr 2023 02:37:06 +0000
Received: from mail-os0jpn01on2071a.outbound.protection.outlook.com ([2a01:111:f403:700c::71a] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqm4e-00F7wa-2W;
	Mon, 24 Apr 2023 02:37:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGwG0PGDW49jRFKmNXGofoLEP3qq4J12WemiISrTPnHXLwVnvQERKe6crqQn7Qm7K/mOIzPr9lM7SvwjS7Q7CArUZn/oay8pMVLc73E5NoO7WZ23l4fKo57DxBb6G+woOoEpwmOT4JOpYkrmaxQpiI4Ljde0lMWaDOK9smnraiW6QaPO+MTMaJ6lqfzgJTXPrPBY/U5Bqpyl1oGlwSe6UKVRFIgMAmlUbT9teFOUtszOhzRvu8UyxNZX0fmHk0oHPAI2H3hWEQdnA3sX0pA0m/yz6AwzquD7WYdxF5le1APbeGwVr8VevuWHE4jdyX5wiRXmvkk3Vf5o2dowDm7GUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJelzOKSG6hyaWuHYx6SIJ93S6WZv/09MTEXHcfo/pU=;
 b=X4sWx+ot0yj4peNCaAwBimzEIIKF0RRavRS01u1kB4PiyMIAVa8/sysbbPDFKaSMj1yBrwQwlncqbkh/F6nir7sJ5M6//uEQPXqbM/PHJ39vPGQ5Xc5mWJ7Xs79F2GooYBahhfy0qGXrl2jO6yJ9kXgH9l8XypQQDSbY2xGkPFCEJF2PDhkAsN4Rv46DgHa3vuP1aXQwtd3X56tUYnluevDTy2BhHktToFyvk7MMlkY2GiT8EcQX8AZXl8qILHKUibrDhmpNEeNK/qSdA6/r6aCFBHBNYItC50awFFzs8I6ofj9CurLNjHiFH329B2ecNouLnBh1UalEoR/0O1jOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJelzOKSG6hyaWuHYx6SIJ93S6WZv/09MTEXHcfo/pU=;
 b=ZNl7JFDFyyTxWygYWV3Rz5hJvtT5FUTyraKwGhNmx2EBo98cM4OpI/7weoWdsg3gQQ6Cp7ahhWOkbZ5gfA2z+lA8Ui+z8i02B0OSRDFzWk+HS9fi7QIDw9pU3HvBMjlbIbZIB50SFnRjLv6VScVjxa+0DW5I3BrrkVmZAsMgefE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11070.jpnprd01.prod.outlook.com (2603:1096:400:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:59 +0000
Message-ID: <87zg6yypit.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/13] ASoC: meson: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Date: Mon, 24 Apr 2023 02:36:59 +0000
X-ClientProxiedBy: TYCP286CA0249.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e4835e0-8c3c-4e98-a6c9-08db446cc742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ldFIieaSU3gwe/ZU5SkNQ8XDchv8oJEwMgXLVAA7pQG2Slu95ZiCYoZ8+4XadEOxIcMZDGvwRaffymMg3FPc4l74GUQK5PzGbor5//O4AIAG2U+ApsutoFqvID1wCl8ufCWwEfsHPJfu/4arGOXjeTbf9dFmxDP215OClnKFRAiRPOzkUV1wSlelJOD9Ae6YqiIbS5OzVLiKBJ5Joyz6A5a5/rvs+wHaWvkEBVgT+HyA8Y4LGT3RlvSacmMLRqtDFn3SnjJBnOqNbFkAqJBMPSM7wI3jpE6AzarjtBcQSoCPogM/NzefmOmbcPkgx75U73zobmpzQAD12fdQ0AvdaHRsWg/f6F+nNwDuVeBdmWygbFkFzshr9NHnsofxC/uF2lQEySwCLkDl+Y6ZUmqdiOxU3IbIFlS+7vlSc1DZzibSbyVSp4sAHuAp4YS9LbJ8+Av6NU0BtBkCGc3+xpEa+y/GC0ZtXjQH52VBJCcVX4q9i8rW7tNMZ0JWV7QA0FafNP2Vs0wuiGDAMR74faAu+ODgxGgJgye4fxYMpdM25UT/NnDEOQFHVhtItZUbOonRjAIuepCvPwdUhHxL85Zb9xz5tXzOGPXbGQ+nacYghqW6S9YlEegW/+L86F5TLdHy
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(2906002)(66476007)(66556008)(66946007)(316002)(4326008)(7416002)(8676002)(8936002)(5660300002)(41300700001)(36756003)(86362001)(6512007)(26005)(186003)(38100700002)(38350700002)(478600001)(52116002)(6486002)(83380400001)(2616005)(6506007)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ZFpaVkrdjR/G6uxRwXEBUT38ouP05SXaMynshO+oT40IDZ5j/EFRNIgKvWoa?=
 =?us-ascii?Q?BfwBT/oanN9Y/9CXxlfgF4IZXY85OY/Zf2lvwe40qGrLWA4zvI4SYWyoEE0i?=
 =?us-ascii?Q?azX15uEKlx1qy7LZgkWmmnP3Gjccww6v3m19wa2a+fUSyn6WybFhn+nD7c08?=
 =?us-ascii?Q?VrNtCXu4ics2GNqzrUuSP7gaTNwN2IR+mjwjTIxi+ZAP2Gh5kD8vXX9OChW6?=
 =?us-ascii?Q?wxdeRqW5th/9rl4J9+sln8OkLumM8VyMF6O/KuvMxreIs250yXLNL9BijNBZ?=
 =?us-ascii?Q?41xjmzrDgGB6/jBdlym3UFtjzI31Uy++NqDYIY7Va3HAwQbgrWOAOpsP7LTS?=
 =?us-ascii?Q?kpDeL1F+YhtvcK8mz9ljm+lR33jXs6H+Ws3dkANLRv0/RxmrCOvOZe9PCUlS?=
 =?us-ascii?Q?zO6C+UesKPcyL3WH+TKeAcpG0Q3ZysgusVuWzZ9iLOrh3upNe9PMv5WrKBlp?=
 =?us-ascii?Q?R0z1IGlWcZNEtfcwBpzRjyjqV65Z6Szffk5gWPvshtC9f+IEpxWiS0R0N6PF?=
 =?us-ascii?Q?PDA8skCXZeVcgsWC5L8nCuLSP8V5aQ1G7PF18RBQiaMUcBgkNU+1AkZQDXlR?=
 =?us-ascii?Q?w7jzs8Xt1rmy3zphdjuNu3ofP3aY6Mqmp/ZWGDSOFPFUhzHBOcAJ1q0YgZZc?=
 =?us-ascii?Q?roLk1wspTbEjnw0KXvUJ4NErdBt6XDY5TDtJLVfnng0DO0t8PlA7/57UnXGi?=
 =?us-ascii?Q?742qx6/Mkv30vdbaEncjVkC7WlopDeYxG0Bto7iNqyceq0lhcO4H1orFKcFL?=
 =?us-ascii?Q?xGKFeP8iR8Ou5lbHhDaMWumjCw8N5kX7aBQies+9jdLMjtspjDj5WuG9km1y?=
 =?us-ascii?Q?GrJaSSlk5RLpfiEg0vj6SjkKHEW/KwNnLTOjbb8g4lGSbEKKxjoktrvPbT8Z?=
 =?us-ascii?Q?AnieJG0jaCxshuphSpkW3RJqT2LFrnebWBc/rnJXn+Jn5/mvfCu3oWbNyoN8?=
 =?us-ascii?Q?CeDGwfgdlr5DN3uQvULZ5pDyFlgsWOcaR3i0FKGIc8itoTxt8Xo6dqRH5+xv?=
 =?us-ascii?Q?HETsQvM8w7+D/vy+qDATz4zssP9ityN9EKtiFQIhCn5lrUSm61+mMEGWixrO?=
 =?us-ascii?Q?kN3hjjO4ZspEiuu5s1JuERjPFL+He8IcAU1kzUrbPtUxwk0vIKgIY+NGQTm2?=
 =?us-ascii?Q?wUcXxXJJgxIBA9hPFPByexwbVEymhpMql3HIf55om1JLCurn3xRUfMuxrRJK?=
 =?us-ascii?Q?qzTSYXHX6dJyKsSO0gXKYHvmxw33v1zCeNVmay58IFubB3Iia4SLs/02sz63?=
 =?us-ascii?Q?YIaNc+5duiSg3mAUUngruwm9fYtmYwApIk5yCCYvc6Hdavq53iADpgjOyHXn?=
 =?us-ascii?Q?IdpNebLHEAQsa7boXlD+uwnl/rniRM4q3wywBl7NIJ0+74bymVNzHXR/8xco?=
 =?us-ascii?Q?QCXnsiNvv34Qtc4MT2PFiUGEOMi6tdr6LvNM2s0INpInGlARdYBKeUjHLpqw?=
 =?us-ascii?Q?OhctBMeQk861962ocShPJ4Eg+6pDVe4gV4Rf6hPzFXqPFhEx9aIea8EqGHmT?=
 =?us-ascii?Q?boPufSehLua0D5LJ4QEXqJaS9/3NLnNIUaCmPzR1smsFsoXB/GeChRCvJK4p?=
 =?us-ascii?Q?Q3lpHu2A2htiNoxSZq4MTjK2WtdXSm1XUCUzPH1pQZz3UVAtzY5x5gy1oz2E?=
 =?us-ascii?Q?esNyvAIw/VjUqJ0MsWRIunI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e4835e0-8c3c-4e98-a6c9-08db446cc742
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:59.4197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSE1s1WJ+lWOTw7PX6wIGEVrYoSbAH2MmziR560LexmLzUTKKu7Sa6oNgYSVN11otTjOgTO+nlvzZnQ7Ow5qf15rdZfMEqTvKgOBY4D4AUOKw4qgX1ZKztHhh92bi9MX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_193704_821573_D1F67BED 
X-CRM114-Status: UNSURE (   9.30  )
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
 sound/soc/meson/axg-card.c         |  8 +++-----
 sound/soc/meson/meson-card-utils.c | 10 +---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a25c397c66c5..74e7cf0ef8d5 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -120,20 +120,18 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	if (!lb->name)
 		return -ENOMEM;
 
-	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
 		return -ENOMEM;
 
-	lb->cpus = &dlc[0];
-	lb->codecs = &dlc[1];
+	lb->cpus = dlc;
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
