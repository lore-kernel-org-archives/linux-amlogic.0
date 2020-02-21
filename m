Return-Path: <SRS0=5fWL=4J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C77DC35647
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:23:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 415B824653
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Feb 2020 12:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+cNlrl9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h+fnNkSE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 415B824653
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40C6HyvD/lLZJwcyKTFEnIssyDXGODZ3vKTuUJw0r+o=; b=G+cNlrl9J/AbXp
	WPsPx3B6ZSbo43H5Jh/jjDTWae2gZaz93HLha8XkkmQlOgI0wXFLLDx/bmUkEk5v6azo20BL3KA+K
	KkyFuh4VRUKjZdbW4MMTMMAcAtRLGWb6CwPwHXntji0PEpYAXMQ7bf0PRGgT9MKWvYOimd9ljOK8Y
	bLD6TMnwhrQNhwXi6iQbPCYWg43nTB22/n798tE8QOZAQ62Ux96o81boD+IGwylGfmFAgCUkgYszl
	ZwCoMKWI3tUQITIB6nE0woM3P67Ya9vpVGXA7LuDI2GeMfOaKOO8MaIkTNz75zasnGjp1CuvXS7U5
	smZ7dX58zf3HjJa0kCAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j57Ka-0008Sn-CS; Fri, 21 Feb 2020 12:22:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j57KX-0008Ox-52
 for linux-amlogic@lists.infradead.org; Fri, 21 Feb 2020 12:22:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id m16so1801590wrx.11
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Feb 2020 04:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=h+fnNkSEO/98hXd04jWTDTvmFmrA5X04DN9GsSlTWb278VjQ4P84W9tyESgWeXKauk
 pDWX73mWc9x2mEm2j4qVjO9TRaM/zXOBrZ+Oqk2N66I03EhrNvbPIkpUHEv4PXMaXKOb
 xgmHB4/UJmQ3zKfW/Nkt3qcG2bdRqbFpPQnOdB+m1mes/eIzwWwDvmclqx3LULkwOIGy
 dUgQdVtJ1HGg4Ss0fs/kSjOQ1BEhyLIM6HkdByUE3WaPPyP12P21vVjRe7nu10fr7PoN
 G+MgD/56pXnelfkAr3ncqIxHumcsfYQjL9uWd1BggVHYq24XSuG4zhc6wlV5SdRIlq68
 j13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eFN2VKHrE+JD0cGAI+3A9MIQDzvF5Lgt98hOYp/CejM=;
 b=X9rULMjyAvr3fVeiy6CXJZ+q76qos+i/VpXSZ5tdoDwj7MedwQgjNjTOtF95RlaPbD
 P2paNBt/aqL2m29jePVvfIMmB3PMO/1W8Z202kkYuyEqI6/ymJQz6NJSMAZKD6aaQOAp
 /jRzAgYhbI6k/Lb29tVGz4+ne44EdrmaJuBmkQ3+ua4SdzjPFoUl6tC9lbrEpLv8bJI4
 vw01fPcwUReBn7Pqc7Gn4gQUaCzn7XjlaVhtVDm4Y2DW0pzWhis9mtdtEgS2nQEjhk5S
 3WsuhbxtI6l70VyrCtgY3zde3kgzlgsXifA+Oy//viuMi6jdGA5iPYoeHB5D/9xw6Sms
 tg9w==
X-Gm-Message-State: APjAAAXWA38K4a0JsDLPU97hOACwAE2DjURa8uCVglzK1s6setgsEXt9
 lCQsKqxnmHKXBi3aNdu+UJZH4Q==
X-Google-Smtp-Source: APXvYqyFpTaJFZg3SDWkgDp7ebkoEJ16w8vW9gMh5UJodOeQoZziNCQEeKl5uKjGXqwqFZdLufdOvQ==
X-Received: by 2002:a5d:5752:: with SMTP id q18mr50518201wrw.277.1582287771687; 
 Fri, 21 Feb 2020 04:22:51 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p26sm3454653wmc.24.2020.02.21.04.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 04:22:51 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/3] ASoC: meson: axg-card: add toacodec support
Date: Fri, 21 Feb 2020 13:22:42 +0100
Message-Id: <20200221122242.1500093-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221122242.1500093-1-jbrunet@baylibre.com>
References: <20200221122242.1500093-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_042253_189248_C5690049 
X-CRM114-Status: UNSURE (   9.96  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Make sure the axg audio card driver recognise the dai_link as a
codec-to-codec link if the cpu dai is the internal dac glue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-card.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 372dc696cc8e..48651631bdcf 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -303,7 +303,8 @@ static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
-	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx");
+	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx") ||
+		of_device_is_compatible(np, DT_PREFIX "g12a-toacodec");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
