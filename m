Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E87C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 10:36:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259C6206C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 10:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tcw2XtsP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fSI2jfZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 259C6206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p4Fp1AoQ/Yn6e1q5AElOI2n6hbBNJPlORL8bzIyk4TY=; b=tcw2XtsPlGmUTk
	yJRFWMrfdPSUHB+l8vmZtm21TJhq+QL4FBB1ifDfZapkK4PFJHKoZ3EEfg+o/N6e6qRN16MN4oSsA
	aZcvd035Dp2fyEQDIUlksGX8FzA818FsQjf02B0X3JruptzQ+FN8OaBdOysZYO5plwByB5zadoFtx
	Q+N/BeUC+V2+TTnSmohW2C2QjH/wPj+51bRvR8CIPGq4Hre6nilMVPvbpGlh4P0bNHa5TMuh744+C
	5fiV1kryf7sReCaIhyvpeUj0PJXCFCSC7sH5UzrMi1rz0RrCPxL5HS5k2ploAt3vYzf11KW+cvwyZ
	ED37iQbbQ4LFxG2KJ12w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjiYt-0000fC-Sw; Wed, 16 Jan 2019 10:36:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjiYq-0000eC-1Y
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 10:36:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so6359687wrw.1
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 02:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsK0iqTrTmHE1gYUMSazLmzu2N46hv/xsJSaDrfAhtQ=;
 b=fSI2jfZkye1lTqYpa4tD7/vmAKbUkBlsRcznhPzW7810s9GuPMQKkvVVQco37EIBzJ
 gHPpc634E79AGt9ScTs4i9IA/mL297KKrixYkIbaheFqjb/xU0ST5RAM7ifMcJcdUF/S
 FtAWdR0iJirC5jEVkFOf2r4a2UvNi15OONMww8XPIEKmzyo+iqzjrc6kKCBx82IOj+mm
 0Xzbz+9kMsTS8W/n7optcnwIEma0i1TqRA2xM6lDg0IHCTWWA/NbNhOu1AxJ0TrGD/r+
 Hk6+hgSE3sCUmgUgdAReQEP2g+nBog3p7pDR/tGNM0a/MNV9pnXIemozvx6TxGxN0hea
 ebBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NsK0iqTrTmHE1gYUMSazLmzu2N46hv/xsJSaDrfAhtQ=;
 b=uN8FR8dw1LY9yOMYEsyf3uPWuoDAZFQDANKmyZIhPXHgvI3iQuf7fHI//pLP3fNnrI
 GBY0ZGyyNIJfI3aoKam2zVZftSis1WD8qB/Q2gOwZyB6WxeYfFVKbTVdI6zCYTEry2+n
 2DjSbmihNzzJJnrzj/gJXT1ONumhLGgQ1x+ozDcEFEsd38lmDjbzdwWyq20lj5SN6oNd
 5VoAmpwnIJ79jg+XR1z65ierfkpjTwLc8EtGgqD2mCi0rSPXX8ok/KQWNEDskCTbR9yM
 gXbgkFIubFf6+Dmw7o+wJtBRo9vvUJxlYSk9SAQTxoVY7jAZGaYkM9yRknHQYP6+16/c
 GcEA==
X-Gm-Message-State: AJcUukemsHw4rtgRy9W7RznIZGlUDFF8dAHqdMV3iuPC4Uiphu2TdpyS
 /X7T7ZdUUnO+cwatroDzPker4Q==
X-Google-Smtp-Source: ALg8bN4f1ho6Zvypun6/17vluUZ+LgKMT9PKuHHUnuewspsGprVm69PeKc4mAY8Jt7fCmsF1LiOXTg==
X-Received: by 2002:a5d:4586:: with SMTP id p6mr6733708wrq.69.1547634997868;
 Wed, 16 Jan 2019 02:36:37 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id k19sm116232430wre.5.2019.01.16.02.36.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 02:36:37 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] dt-bindings: reset: meson-axg: fix SPDX license id
Date: Wed, 16 Jan 2019 11:36:32 +0100
Message-Id: <20190116103632.17754-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_023640_219743_CA94134A 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Yixun Lan <yixun.lan@amlogic.com>, linux-kernel@vger.kernel.org,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As reported, the SPDX license id is not placed correctly and the variant
of the BSD License used should be specified.

Fixes: c16292578ffa ("dt-bindings: reset: Add bindings for the Meson-AXG SoC Reset Controller")
Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 Sorry for the delay Thomas.

 Regards
 Jerome

 include/dt-bindings/reset/amlogic,meson-axg-reset.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
index ad6f55dabd6d..0f2e0fe45ca4 100644
--- a/include/dt-bindings/reset/amlogic,meson-axg-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
@@ -1,12 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause */
 /*
- *
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  *
  * Copyright (c) 2017 Amlogic, inc.
  * Author: Yixun Lan <yixun.lan@amlogic.com>
  *
- * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
  */
 
 #ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
