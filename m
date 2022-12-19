Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AA0C10F1B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Dec 2022 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YupgiR1GcC83v0YK5xtLBOlY6QVWUYjdtUCdfKupbt4=; b=tn4BL1boAl+zMS
	w3Yg5xI4gTgLgu5w7xNUCoi7inrcs2JDRKVRqdxAc55GFQf1R2M5LOM2Zi1RNQMNhvvUKJoTOSfPC
	8J4IA6q1zXyr9xBqqTH67z+LGIyqZmXC1zI8mmMpHCBKiGu5c9MNO2cHhCP6X7bBdHc3mxn155w20
	2QH1KrI6PshOVAEFI7T3A5DM4twnS/HYayoVVBDUFZ55ooyjb7izr2WgETlz/9A6iLhue1+7HQSsp
	Xa9LOaunuQHTXUwv3MGKxu23H03BJlTdlrEfBCUQ+4TGjo3kXSPkSXA80x14cysE6iiysDMXCxiBk
	j7Gpf5SpoJvpYgVYjaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7BkR-00Ajmt-QT; Mon, 19 Dec 2022 08:43:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Bk3-00AjTo-Hp
	for linux-amlogic@lists.infradead.org; Mon, 19 Dec 2022 08:43:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id ud5so19760937ejc.4
        for <linux-amlogic@lists.infradead.org>; Mon, 19 Dec 2022 00:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYYaE3bwqOZpjy9bqglp5kw8THeTMFyYTG3Pe3WusMY=;
        b=73G2LxFwIuXcJ8JfikxHBeTK8Ai8+099d7TsNEgBayS3aGnT3o3UhXd2w5UnDtt3Ia
         0sIi4pHg+1OyBNaU//uOizs1AYrUWG3CyYuYFuOI1PE5M5UPmWEfmAZhzFVLQro/CjuR
         nOevReLfQUP7X4vhPqEh1sfp38tL+m0m27GS4zbsfo5WkN1gzXKerBonhxbzgq4fiC+l
         5XQY4rvgo80IFX4GjhiUWF8UjdWrPH9ncuS0egroDJR7bwpeaLjA3a3sZe7nxggczXLQ
         dDh9f93/9dRvQWVcZAD7UwR/uJEhOqRZ0xeNv/HJN2ab/rZYMMolHOLoTxlxZqJKdebN
         v7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYYaE3bwqOZpjy9bqglp5kw8THeTMFyYTG3Pe3WusMY=;
        b=yT6GBANTK7dip0VufD4/rrSrAcNTwjnsiUJM4Rr+O7UMCgs3VustkihWlxqAcqQ+to
         nmqILpDYR1N6qAcdPFFoTtI4fmM1chEG3brgIuwJLI3WVXa2WlSq3feKkBe+aCSdj1Vq
         +lLS9RqgX8yUVvEkh27jatMePbAV7WbzqJSLZq9qQWU35CAfRvrjivq6tiyErO5JuOor
         dPrE4PCd9OUcmuTGtqceoYB3oCY/pyZoxiQN9yAZZQxBtdLiKBd7DsRSBWHEVsZDczLD
         gOcSMFXaYrGTJcsNA/ciEMcm94J369BDOJ6RwZyvqDAjoOv94Xl7gjrGQKN9oQgPevae
         +/dg==
X-Gm-Message-State: ANoB5plKj3m2AqRtWys6LHA9zF5Pqj7wz3DY9CjDcvmnboRCzc+SrPSa
	Tu6rpXvuZY+piABHPYijw/lBKQ==
X-Google-Smtp-Source: AA0mqf7famYNciIPKzFQ0QR5iYvihCH5RaB2lTsclMVvpvXA8pM9J4X8rlevPiqjboKSR8SeNzSmuw==
X-Received: by 2002:a17:906:8d08:b0:7c1:700:1e2d with SMTP id rv8-20020a1709068d0800b007c107001e2dmr55156347ejc.20.1671439397658;
        Mon, 19 Dec 2022 00:43:17 -0800 (PST)
Received: from [127.0.1.1] ([2001:b07:5d39:f336:a0ba:cfa5:2107:c2c4])
        by smtp.gmail.com with ESMTPSA id w7-20020a170906b18700b007c0b28b85c5sm4083755ejy.138.2022.12.19.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 00:43:17 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 19 Dec 2022 09:43:05 +0100
Subject: [PATCH] drm/meson: Reduce the FIFO lines held when AFBC is not used
MIME-Version: 1.0
Message-Id: <20221216-afbc_s905x-v1-0-033bebf780d9@baylibre.com>
To: David Airlie <airlied@gmail.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_004324_041032_61B3EED6 
X-CRM114-Status: GOOD (  15.03  )
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

Having a bigger number of FIFO lines held after vsync is only useful to
SoCs using AFBC to give time to the AFBC decoder to be reset, configured
and enabled again.

For SoCs not using AFBC this, on the contrary, is causing on some
displays issues and a few pixels vertical offset in the displayed image.

Conditionally increase the number of lines held after vsync only for
SoCs using AFBC, leaving the default value for all the others.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Fix display issues for amlogic SoCs not using AFBC

In 24e0d4058eff the number of lines held after VSYNC was incremented to give
time to the AFBC decoder to do its job. This is causing an issue (seen on
S905x) where the image (on some panels) is dislayed with a vertical offset.
With this patch we try to keep the fix only when AFBC is actually used
filtering on the SoC type.

To: Neil Armstrong <neil.armstrong@linaro.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/meson/meson_viu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index d4b907889a21..cd399b0b7181 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -436,15 +436,14 @@ void meson_viu_init(struct meson_drm *priv)
 
 	/* Initialize OSD1 fifo control register */
 	reg = VIU_OSD_DDR_PRIORITY_URGENT |
-		VIU_OSD_HOLD_FIFO_LINES(31) |
 		VIU_OSD_FIFO_DEPTH_VAL(32) | /* fifo_depth_val: 32*8=256 */
 		VIU_OSD_WORDS_PER_BURST(4) | /* 4 words in 1 burst */
 		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
 
 	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
-		reg |= VIU_OSD_BURST_LENGTH_32;
+		reg |= (VIU_OSD_BURST_LENGTH_32 | VIU_OSD_HOLD_FIFO_LINES(31));
 	else
-		reg |= VIU_OSD_BURST_LENGTH_64;
+		reg |= (VIU_OSD_BURST_LENGTH_64 | VIU_OSD_HOLD_FIFO_LINES(4));
 
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
 	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));

---
base-commit: 84e57d292203a45c96dbcb2e6be9dd80961d981a
change-id: 20221216-afbc_s905x-4baf5fdc9970

Best regards,
-- 
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
