Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB1DC4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C64520896
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbkDC4zF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SCQbuMXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C64520896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVgO6ReiJZ6tvu6epAsytknMorXb9zmIg2fLoaCOYYE=; b=pbkDC4zFkgwW39
	OrrP3rBbuk0eZi36SyD0fakwX7ds6tD0HSZiPc3OBYdwDwZNBHM7MCWFWeX2eHfI3ngkPt4HObpcK
	dOqbgoc1TJLbeL1r2dwZpMdCHLCz97cU5BrSKgk5NBJYLbD7ZGVLmkP6TN/OD35lYNZ9fvgppxIP7
	dKKQaDAYLCbGQS4WVFwbqHgQ0F2HPa27nctVXWvW7Se+nBRdjCa5QKzg+6i4NyUNo/y2865m3pkEm
	6LUe8ioYq7mM2a6dVbIgt+Nu0zpeTizLa+KVYGNuv1QB3aCwitoDdxzfI/KlkUDg9Y2eEa/lJQCzB
	33VYhLTeJ1eKtf8i14Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QRC-0007x4-Et; Mon, 25 Mar 2019 14:18:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QQx-0007fI-9V
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:45 +0000
Received: by mail-wr1-x442.google.com with SMTP id s15so10335054wra.12
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wk5eCyYYv31k2oS3w2ZiDp1VuybJTj9k6eSCZMRaQZw=;
 b=SCQbuMXB5jIJeL76+Af2Bo0bADhuPEvmbfzePjCIbGxKi9AD6BwIfAtm/x2N5LnoGw
 cLIzarD0HfS2d1tB6fN5UNnw+Lhv913ZZ9ZSinSThfmVfVGQGABVD6dhgTXXwVFJgLJZ
 Dud+AB+DI+8NDJWzUWqiV677+C0wh/wB06nHk+otX+ylcn4hKddffgEtWKc7/mkXDqS3
 mObj1YKDn4domlVxb2+XgKC2tXRCq4B+I0RfI+gFyE2Wjswk8rdmAKIw+9M8t2HeSjlf
 IFi+GKcg8NJyJIIL9ZcS3QoUunEAHgQtM5qfffyv8dFgoUtxZnmwBXk6wiousy1/29os
 qn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wk5eCyYYv31k2oS3w2ZiDp1VuybJTj9k6eSCZMRaQZw=;
 b=Kb2XJOD3AwUjsnQ3TjOGrNf74Ouky1GoCSorWY+LV4uP+i7m/9xda0YMjmWFk5AuVG
 8Q5cCkNBpjhBbayRrVexjFaPc/i5jcY1/70BzWNOcCtk3GyZH1bpvCiOi+QlunC6tJXX
 zZi2leA5ch1EDJxDGF4WjqnMfu7wG/XAAejp4WLnakhr4iFNRP2t9ry5Hh/UYyAQzWDA
 P6X/cMn14wr4/zc2gAtz8iydF1YFRj+IrEwzfJZ3EtD7in4dCPIeQHZIZFio0bR3aRW5
 QJ3y5AE7qhhnVa6snSr2/ziZ0O0J5aF+JuCH1ULrDitPtgQS2qaxEneUtXtSYRhhpXSk
 jlHg==
X-Gm-Message-State: APjAAAW4YFBYdTVPNnqApnIbI5AJrD+g1G/YS0DsaJ1zvhWkljroDwLC
 eECofRmWRWR+nKoT6im8ys8xjA==
X-Google-Smtp-Source: APXvYqz8LLIbUN5C5n2zF5H4AYmB1ystJrAyAxQH1Kht9XphIAFYGviyXT3lZZru5qGA58Z+gEwzuw==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr15648482wro.152.1553523511285; 
 Mon, 25 Mar 2019 07:18:31 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/meson: Add G12A Support for VPP setup
Date: Mon, 25 Mar 2019 15:18:16 +0100
Message-Id: <20190325141824.21259-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071839_326846_6555044A 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A needs a different VPP setup code, handle it here.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vpp.c | 51 ++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
index f9efb431e953..8c52a3455ef4 100644
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -112,32 +112,39 @@ void meson_vpp_init(struct meson_drm *priv)
 		writel_relaxed(0x20000, priv->io_base + _REG(VPP_DOLBY_CTRL));
 		writel_relaxed(0x1020080,
 				priv->io_base + _REG(VPP_DUMMY_DATA1));
-	}
+	} else if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
+		writel_relaxed(0xf, priv->io_base + _REG(DOLBY_PATH_CTRL));
 
 	/* Initialize vpu fifo control registers */
-	writel_relaxed(readl_relaxed(priv->io_base + _REG(VPP_OFIFO_SIZE)) |
-			0x77f, priv->io_base + _REG(VPP_OFIFO_SIZE));
+	if (meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu"))
+		writel_relaxed(0xfff << 20 | 0x1000,
+			       priv->io_base + _REG(VPP_OFIFO_SIZE));
+	else
+		writel_relaxed(readl_relaxed(priv->io_base + _REG(VPP_OFIFO_SIZE)) |
+				0x77f, priv->io_base + _REG(VPP_OFIFO_SIZE));
 	writel_relaxed(0x08080808, priv->io_base + _REG(VPP_HOLD_LINES));
 
-	/* Turn off preblend */
-	writel_bits_relaxed(VPP_PREBLEND_ENABLE, 0,
-			    priv->io_base + _REG(VPP_MISC));
-
-	/* Turn off POSTBLEND */
-	writel_bits_relaxed(VPP_POSTBLEND_ENABLE, 0,
-			    priv->io_base + _REG(VPP_MISC));
-
-	/* Force all planes off */
-	writel_bits_relaxed(VPP_OSD1_POSTBLEND | VPP_OSD2_POSTBLEND |
-			    VPP_VD1_POSTBLEND | VPP_VD2_POSTBLEND |
-			    VPP_VD1_PREBLEND | VPP_VD2_PREBLEND, 0,
-			    priv->io_base + _REG(VPP_MISC));
-
-	/* Setup default VD settings */
-	writel_relaxed(4096,
-			priv->io_base + _REG(VPP_PREBLEND_VD1_H_START_END));
-	writel_relaxed(4096,
-			priv->io_base + _REG(VPP_BLEND_VD2_H_START_END));
+	if (!meson_vpu_is_compatible(priv, "amlogic,meson-g12a-vpu")) {
+		/* Turn off preblend */
+		writel_bits_relaxed(VPP_PREBLEND_ENABLE, 0,
+				    priv->io_base + _REG(VPP_MISC));
+
+		/* Turn off POSTBLEND */
+		writel_bits_relaxed(VPP_POSTBLEND_ENABLE, 0,
+				    priv->io_base + _REG(VPP_MISC));
+
+		/* Force all planes off */
+		writel_bits_relaxed(VPP_OSD1_POSTBLEND | VPP_OSD2_POSTBLEND |
+				    VPP_VD1_POSTBLEND | VPP_VD2_POSTBLEND |
+				    VPP_VD1_PREBLEND | VPP_VD2_PREBLEND, 0,
+				    priv->io_base + _REG(VPP_MISC));
+
+		/* Setup default VD settings */
+		writel_relaxed(4096,
+				priv->io_base + _REG(VPP_PREBLEND_VD1_H_START_END));
+		writel_relaxed(4096,
+				priv->io_base + _REG(VPP_BLEND_VD2_H_START_END));
+	}
 
 	/* Disable Scalers */
 	writel_relaxed(0, priv->io_base + _REG(VPP_OSD_SC_CTRL0));
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
