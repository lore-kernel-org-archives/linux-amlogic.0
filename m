Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20201C7618B
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0FE21871
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GVcE2x7l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tU0u8Kzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0FE21871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MKqpV50bMvu08Nk3ATPTcHDoOrxm4syAJRwCl48Z9TE=; b=GVcE2x7lr4630O
	GLLVRf4Q53sncBvelc5k9RCFWWycbtW847UnbBPdBc2Fn+Knd8qyfyPj8hwqLHzcWAH/3XpsKaopS
	rf/foljZ/ypM55TKg7zG3r2F65bpo7eETOT+klY4yVSzT27CBpwseDfsQSlqpg5IEBaBfnS7dBeEI
	X7GYqx2DqqmsfaudVJFDRYycgbBaLN0iMeLD2XyigdCpG+ruT4L6rp/7d4hokIhWV73gLjqytMWKJ
	9VZQ8A0MDyQdNzDQvyVfqNbuM5fLXetcPy9hk2zUSuyJX6/L2oC/tDQghNXYa8nOum6v5SMHW9+ZV
	KFiVoPdvUYDLQUFdvCUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqK3z-00073x-QC; Wed, 24 Jul 2019 16:24:23 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqK3t-0006uD-NF
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 16:24:19 +0000
Received: by mail-wr1-x442.google.com with SMTP id n9so47740678wru.0
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UJ9KDGBOl8aIUqKuxRToZa5/dKJVoJYKCqFTu5LeV1A=;
 b=tU0u8Kzo4EqYFk+S/PB7XaSJUsAodzLIXYMpL2tWf18qebqFw73F789ZMYL9or9SsK
 dqKPqCfMrQm/8qtBnymmETaftmj2gXdDTqbZeXG94Gcn5Fb8vfeZiMuiL+siIEU4EZO/
 chX0PSxfTCfqr/6ho4HEP9cQJ2OvcSntdppRHBL7xpC02MhR5YZN537v2LeeBKtn3aS6
 B5HCEKhe4Bsa/xsFrKapjdoaJaoSFK7pS35WXAQ5rGtDx/6F5GLO3/LdkR2T/9mTXY2o
 RR5rolvIqI94A16zqWHC8eg7NqWQBgxATiaOGRqNE18Pf+VU9hDDWW9yyNX5nK4rWcRh
 S24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UJ9KDGBOl8aIUqKuxRToZa5/dKJVoJYKCqFTu5LeV1A=;
 b=UvrupKCONGJdx1gRrq35Kzj/ionBQOCwWouaXD+7Sg8Fn4UNL29MbwoxblDjnfAXuD
 A2pjvUQvEDP9IST2AvTFQIE4Ed7/9tXFO/k2g6X9QUqxwxqEYUBLYysz1D5yfXWiKfNe
 Iu0e67cZWPZLHO4clJ8aTQktZMOEb0dHczlebSLPloeC8//pNSCeMb7i3OlEGBkh7b14
 yR6X34XYRg6BVhaQDXDRHjxPUrqLVkjdfobKzmAFRAZBCsvpci/pmOXSmXrFJIGq4KyA
 s8ZFKphncT+cj3tdOyMgBA1U9fxnvKtSS1g6MtPliaKAvINa3JL5sgE1MPBoLD7xBIyL
 V8qw==
X-Gm-Message-State: APjAAAUeJ+XjgaIpMOXSNs7Vfzmr0W+t77X317RTcu0FfVJYMOYGg1U9
 MNCWc6dUbeNYNpf6f2eh0worLA==
X-Google-Smtp-Source: APXvYqzsz5R+uA08ZspQl/NwiF9hq2F7Y6DPHaohqRpu1K0XA0Ds+ppWxCNxwgiM91KqJEfr0XmU8A==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr57578825wrl.281.1563985455657; 
 Wed, 24 Jul 2019 09:24:15 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 6/6] ASoC: codec2codec: fill some of the runtime stream
 parameters
Date: Wed, 24 Jul 2019 18:24:05 +0200
Message-Id: <20190724162405.6574-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_092417_782949_405E1C90 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Set the information provided struct snd_soc_pcm_stream in the
struct snd_pcm_runtime of the codec to codec link.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index e0eedff5fe94..a6bc3eda275d 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3892,6 +3892,11 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			dapm_update_dai_unlocked(substream, &params, sink);
 		}
 
+		runtime->format = params_format(&params);
+		runtime->subformat = params_subformat(&params);
+		runtime->channels = params_channels(&params);
+		runtime->rate = params_rate(&params);
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
