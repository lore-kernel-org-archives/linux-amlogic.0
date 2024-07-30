Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C24EC3DA7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhVwfoDlOJ3734Aunr/bOlGohPcDoXs5eT+3H3+kIT4=; b=DAcU3DTbdIz3Cv
	FDjmo8XJxfgk7ARLH44GaLt9dLJUdQH7mvmzdAQ3YLB5IuueQqfoBrYWSUDOPjNTUxaNQLTG0+xAz
	THgt5pjnavBfeGogncUJ3u8cGthJZKprCu5h7wnJOAvnn6TfGP2XW1HJ6+DzP8QIiCg9W/eeeTN2C
	BvG4o1zqg/4nyPcKzAqDY2zJlSHssTwtl/QzG2vREsXYbzijRy3lgPghRSifW+v69Sl2VGcJc2spm
	0qZFY07WHQQLXK//KgiyyiYUxooVU5AOKCPkiNxUUhL0BqP8cVz+jNWojph+QcZS77Fz83d24Cswm
	PyHy21jrFfFsn81GqLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJQ-0000000F9ya-1aFZ;
	Tue, 30 Jul 2024 12:50:44 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJK-0000000F9t8-0n0k
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:40 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3684eb5be64so2294681f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343836; x=1722948636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCAbjMiMPWRMzpCKATzPFm7RQ4gOtOLIXraRazPtH00=;
        b=MmpSVMc3ClWL06XmTtQmUQZoseohw9P6TtbZTf0IFRlEzcTv42PWb9m13Xid23fCWn
         Pip+6qOWHKzqvkxemVgFUUCrPUbQtPRbSXFcuae0Wvg+d6W6DZMMLQy04uGBxG+WxuH+
         yPFBhRoTWAACSEq2KFHKBpT7KtZJt2Hty6lwEZ/IG51YgZqGL0Fots03HkKDy/CXTucI
         RYgRyBgSTLwSaH/HOVeY9mPJb3J+9H8MBhjK89J7GscWsqmGH28uK8aPvswxaWJ+ygC+
         ApLp/t3asAWNH8ei4nLvVU2AUBO9efz98aGavaZ3YY4t3GjPKLoeYVNKK5I9fTe/qGg2
         fLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343836; x=1722948636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCAbjMiMPWRMzpCKATzPFm7RQ4gOtOLIXraRazPtH00=;
        b=fG9ETSsoUsGb3zAxmd0TgJApABH4dS3+oRD4Z9S7buorpPShHTP0IACOns1lMG9DvH
         b8iQ9Y11zj0h0DzoyJR2HQkDbtHX1gBntHA/s1aVJHCzYGukXXDdvlh5c4SoZM7a/fYV
         dt1OXMuR98ap2KPFBKk7uTXdgXqc+PjaymKmo6KWk6dIfDuRG9y/k52P3Eakdv5pHBn1
         hP+Wv1a/3oHrbUgZaEwYLbagrzESKXohBtK0tlIMNhuhFnwBCG9FEsCut+Ioufml+AZp
         i1uHE45GNfx6XbzFLnI0QBt//Ygcatb/agpjgSF2cs8u1rV3NtFLI2WLmyRj87OHzYXE
         lhkw==
X-Forwarded-Encrypted: i=1; AJvYcCVsyKNuzZ+iRipljYXQjvQrsFJ+YHL6RwUFAQ34R2NPdCYSVCJOyOZtxfSBa0rtn2hEReHrpysBx/QTERw8rubspQe4J24R0GUSTw9gAW8oPU4=
X-Gm-Message-State: AOJu0YywnL3VlXWSE7qG1WLaYvJYHzaSLKGQabdZe8jxWjWMBBr+l3yI
	qScpiVaGw5LdTg1SS8w4LJeSMeRVCD6zKnWsEn01WYieaNtwsnF7sbQgsJlIuUuV2qjlzOk+fht
	xaZmgTA==
X-Google-Smtp-Source: AGHT+IFrBziZT/58Vb7K/FmVwcAvFVRM7tFnePkyMs/HqsXtRR+PlZ++CrVSk74QOczD1bWAn9/67Q==
X-Received: by 2002:a05:6000:11c7:b0:367:8a9e:6bed with SMTP id ffacd0b85a97d-36b5d0baf47mr7921610f8f.61.1722343836141;
        Tue, 30 Jul 2024 05:50:36 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] drm/meson: vclk: drop hdmi system clock setup
Date: Tue, 30 Jul 2024 14:50:12 +0200
Message-ID: <20240730125023.710237-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055038_245773_13D24E22 
X-CRM114-Status: GOOD (  10.93  )
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

Poking the HHI syscon is a way to setup clocks behind CCF's back.
Also, 2 drm code paths, the encoder and the hdmi-phy, are racing to do the
same setup of the HDMI system clock.

This clock is used is used by the HDMI phy and should not be set by the
encoder, so drop those HHI pokes from vclk.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/gpu/drm/meson/meson_vclk.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_vclk.c b/drivers/gpu/drm/meson/meson_vclk.c
index 2a942dc6a6dc..bf5cc5d92346 100644
--- a/drivers/gpu/drm/meson/meson_vclk.c
+++ b/drivers/gpu/drm/meson/meson_vclk.c
@@ -813,14 +813,6 @@ static void meson_vclk_set(struct meson_drm *priv, unsigned int pll_base_freq,
 {
 	unsigned int m = 0, frac = 0;
 
-	/* Set HDMI-TX sys clock */
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_SEL_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_DIV_MASK, 0);
-	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL,
-			   CTS_HDMI_SYS_EN, CTS_HDMI_SYS_EN);
-
 	/* Set HDMI PLL rate */
 	if (!od1 && !od2 && !od3) {
 		meson_hdmi_pll_generic_set(priv, pll_base_freq);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
