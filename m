Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C81BC54EE9
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Sep 2022 15:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JISACaVBJ5/QU08LUSJRcx2nyqEq5yBHPe8fVy0gi7c=; b=S54+OLJl6zg/rf
	zrVopjRnGuYtiRGABtlvOMHAkB+ec5o+dhvBWgClqUsUZncZHrJKhfZ3RX9cUgDMFL++8OS+4sP7f
	R3cMck3wru+CkA/zqQJom2KSFZuBgY4vLejxX1gRgIdoTXBzqfmQvTosqcu5LexG0EKq3bAYjL6DJ
	in1KugJ6Za3o+jav3A/yS3SK0TrdW3klcIxYFM9XTrn/4vNqbpwHi5AE+q09SGbSfNUnggT5a7OP7
	xHL6+s5DonZDPGYiChgO3WK7utrgOXkSio1Z1+5B0lRswpYc3QsqFLJRRj2+kPumAQbpNkUQWAHeg
	NgsJ/E5oAEsIpO7VmqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJrv-005Sh0-59; Thu, 08 Sep 2022 15:55:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJpt-005R29-Ke
	for linux-amlogic@lists.infradead.org; Thu, 08 Sep 2022 15:53:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id bj14so13561808wrb.12
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Sep 2022 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mathembedded-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Id2LT9k8G/ueokdbdHl7YXqytu8/y6ruSySCO+cIye4=;
        b=FbGJ0HnY4ZWiobqMTTrJue3DCqjoaHBrQak+nZQCY+tJLvNVkKIwjOui5eJjViNsui
         uQAe+7gXaPenOLZjT5PvgVgaJx8IVvUBgn13j6h8ZykUi+HvID7YFTqvb9uBJaaWhV/E
         VUwv3Oy8VJRgZ9rP4FJlaiqSKst4oRigwRG+M4942x6FyBPJURlkrI+GqoJ33QkZaC95
         /yozL6BpULlb5IDwselUfaCAoYm6DqQ0UbxT2NrgTEmyT6LbRAP13aQhohoGp74VqY5V
         nnHxgwYCz2bcPrgIOn2Z7foXQNJp665D0zffWhCbJ0gpeK4FvRQkPsefIsYubuS68euH
         pKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Id2LT9k8G/ueokdbdHl7YXqytu8/y6ruSySCO+cIye4=;
        b=TrZATidGgBJ4xDQA/qTtkrcIqs6XkgdU5nMGB8c9xknxBqZ6CqLNaXKJav8cPOAlfA
         +LcotGCqzkBF+yqng6tyiWhaYeGlKw+6fva/6j//MvMWVB6+4OrOA+3gcPbgWftNuODZ
         FJ2dXH5HLtnGfq5zAMPCdxzFw005R1rKpLnY5oIuMuiwbfa5lTClYm77o8le0Yv2WxFC
         9HdEe7ijnNOCOUbOQ4SQH4EDWSWKf4KxpWes5UaU5K0Qe/dsHgghxFfOzxQ+MfY915sU
         PSPU9Z8NIiaNH+Tc6V1ICe7liC5CqRePSMyGmmeFe3r0etUeLlNd3qasjHxJPoDpcWV5
         cyKw==
X-Gm-Message-State: ACgBeo1KB+iMU4MfOptmvwfLDYZYWd/3hJ0fBRqEMqRFe1IBeR/tZ/pb
	i6O5YMWGu5puogFTibzA+YOaoOHzNSV2TA==
X-Google-Smtp-Source: AA6agR6uJvDyNQbO1hDU/VqkhLQhPvaLY4b6d5vG9v7he13nxHtrQpwcSj76LjhNXSy4cKJXysQ0qA==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id u10-20020a5d434a000000b0021daa7eb1bbmr5876689wrr.619.1662652379494;
        Thu, 08 Sep 2022 08:52:59 -0700 (PDT)
Received: from opal.home ([2a00:23c6:200d:d301:4971:140c:41b9:e178])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003a845621c5bsm3793665wms.34.2022.09.08.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 08:52:59 -0700 (PDT)
From: Stuart Menefy <stuart.menefy@mathembedded.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org
Cc: Stuart Menefy <stuart.menefy@mathembedded.com>
Subject: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Date: Thu,  8 Sep 2022 16:52:43 +0100
Message-Id: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_085301_716209_98FB2D13 
X-CRM114-Status: GOOD (  12.35  )
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

VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
not 16-28.

Without this the output tends to have a pink hue, changing it results
in better color accuracy.

The vendor kernel doesn't use this register. However the code which
sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
different style of registers for configuring some of the other matrices,
which do use bits 16-28 for this coefficient, but those have names
ending in MATRIX_COEF22_30, and this is not one of those.

Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 51df4de..876ffe0 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -94,7 +94,7 @@ static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
 		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
 	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
 		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
-	writel((m[11] & 0x1fff) << 16,
+	writel((m[11] & 0x1fff),
 		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
 
 	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
