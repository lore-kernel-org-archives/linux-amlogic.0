Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0D5C3A59E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:35:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3392054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 12:35:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g2vNLq9r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="HD7yEtEN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3392054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZLxwbV4bcWndwlk3KleqKyNWDtxIsr9ZAzI+7+wAiBs=; b=g2vNLq9rJhyb2H
	/1qoXlZLHF90Xx8u8DtUf8XF5UoAN7DjK7sNoD3VIj++qMn0iL57Ro80dFhDNj23Kmo7ICosBNc6l
	DW5knM1l6zopZ2x8AXkizktGG45UwnIUvy2twqjBE5bJ/RWhcA/spbCgHfVdiKgDEoef1QqjhLhF6
	ffy2S3jH8DDvPsqkegFZ2s9/7xVRiu/DUBjIr8XkA+wcSv//NHAzsF+VitvGPIqyAb4ioQK2wrCZN
	b6xvOTN55gqSDbJJYNKHMSATU+lxJeiF8eoMSOv2z2SWnVPbxGxg+bdEcGXNV6o7k5W8Hjj2DN2H3
	/BDHKPwUAdJdjYReHlIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i03M7-0000MX-5O; Tue, 20 Aug 2019 12:35:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i03M5-0000M9-GZ
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 12:35:18 +0000
Received: by mail-wr1-x444.google.com with SMTP id s18so12238876wrn.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 05:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0GMZ30YIFAvd4BpzkWj3t3CsrOU2xIx+D0MV3qKWwM=;
 b=HD7yEtENDDCyJ+cTYqoAme6M2J6NtjGhq3AGudkN57sTS1uopnxxw53ihlT7+XQbad
 G0b8SvorSPr4kQJuFsmCTOhR85ICveNvh11HAO9OU8S5Wz+/tkj/pS5wucxjNWbO88Xv
 Yy/G6oJj+9ZYe61x+QPhpQ80+3p6OoL/xE8cxWKtaDJaB68e+QF1hZhtTSPdP3ydrwHp
 qbcS9Xh6Pj06txoXkIAid4SNhHjSKQVwpdrYW13DD4UC3BoPvBECBdHoDc7qBUn6kf20
 O5H0+oA/DsxyyAYvX4QqjC2mr4tOQKHza0WP75F9hL3lbAnv0+v6csDHodJDSSqhP6/n
 SLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f0GMZ30YIFAvd4BpzkWj3t3CsrOU2xIx+D0MV3qKWwM=;
 b=R0ndYZV9FCQQ9dGy0jVfVdsdwHJOke9ESnVEEFkdA+wOd8Mr8HpN3d9oe/7BC6qvov
 +gCEC+0NPrCtrKg+8ascrl9Wuak4rc5z6qe7uMej0Fjvd9+/Su6xQJmYQ7XrGZGAPbG7
 kwZ9ikcVufqFL9hAeuevzdK0MfCgNLn3l+LC1fNSWty+rJmYIDpZOm+PzQlaZndokRyk
 mixoI2yLcjWM2icHzwppm10axfc9EaLJdddd6JH4HvFW3OF0aca7y637UF2GQmt2oDwU
 M99w3Gh6Qdk/a8MDYih/6GgNzzViNO3kSQESSOHDk1wPRzfxcfmFC+8ea70YmMhKKdiy
 1qUQ==
X-Gm-Message-State: APjAAAUI2ekuXnPbioDtf9gSIXBcThJHJS49qg+cRtNPen3Yw7V9x6J1
 BtB47io/Hm+6/sFGuAOh/wB3YA==
X-Google-Smtp-Source: APXvYqx2gGA189ZOi44f1fTFmoVy+zzWIEPmaIN3RmlvE4ZjcSTl6+IoA4dhS0VzFiEIp/piWYqVWw==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr7166603wrt.249.1566304516138; 
 Tue, 20 Aug 2019 05:35:16 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id m23sm29661097wml.41.2019.08.20.05.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 05:35:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: g12a-tohdmitx: require regmap mmio
Date: Tue, 20 Aug 2019 14:35:10 +0200
Message-Id: <20190820123510.22491-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_053517_554041_84FA934C 
X-CRM114-Status: UNSURE (   7.41  )
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

The tohdmitx glue uses regmap MMIO so it should require it.

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 63b38c123103..2e3676147cea 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -87,6 +87,7 @@ config SND_MESON_AXG_PDM
 
 config SND_MESON_G12A_TOHDMITX
 	tristate "Amlogic G12A To HDMI TX Control Support"
+	select REGMAP_MMIO
 	imply SND_SOC_HDMI_CODEC
 	help
 	  Select Y or M to add support for HDMI audio on the g12a SoC
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
