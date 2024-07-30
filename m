Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613D2C3DA7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jul 2024 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUY/1tzxDjG4rj0Vmri5Tb7RypV7p2edFd91QlH6uP0=; b=CH6uih5hYHk2I3
	KHP0MDZKlGZBzU/iJPaA5dE7E01h/omizOMfkoRGnmU7FQnZTkDqKGMqCKvRUw8untIOMcE3Rkano
	VoYj/HVj8JOKRgdMjU9Qxjvj4OkRDP8MSOK8iivyVFx8mi4+/IM2BywGnv6f/JCgKZ2V42v3T+CAV
	xrhnrgBFW1J7CmaO2czloAnSWb0gvrMfVQiCrGdsj0+FMOHV3Zf3Td8nHFgP4qKwNsWi332NxWXkc
	Ge8deJ2nBPmIEbm72Mw70s0x5JywCcjjhF6h6v1l81fCuc88JfT/6JFYJm43LXXRD7hDXMQ0CXM5h
	ZUFpv2SDhVGv1jpnV2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJb-0000000FA8y-1UZA;
	Tue, 30 Jul 2024 12:50:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYmJQ-0000000F9wn-00Wi
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jul 2024 12:50:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so25844055e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jul 2024 05:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722343841; x=1722948641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3moEF5UgUPlJrvGfGCZqAdn43td07ni9TXGHevs5IwU=;
        b=TZMd73lKDlXNxmmY+GmNRBiDW+9EKhcTVd+f5sgVvvkqAZvBOKAZsPBIfIT22rWrRW
         VFKM4tEyWclNuNaq+5o6SjBy1ddodbqSl/7hE34fHzOzQsl7Ot0qZCB9SQZ5OZ0wzQ4t
         mQyYOLhjTnjX79c4OJLW1GZp5YhmEom9JOshPwCgm9rupAaZvo9xWjMO6ZYsZw15HDHv
         Nj10mWMPQ3gJuqnaWYDtbsDXVWBvPtEayel3f543vL/HsRTNKk7yQMb2D8c1R4J2vaWi
         n3/3UGTS55lF+oIYvWZaqb1uSjBsNa9QA27XyOBCR/V+i7r1sRDMzUinMemXUyCTvDR9
         v/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722343841; x=1722948641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3moEF5UgUPlJrvGfGCZqAdn43td07ni9TXGHevs5IwU=;
        b=o+cUcsIXMPPZGQt1lc6GNtBcLZBoco6dCj3XnBVlA+pobPu/utyb2JjWRic1nHWQx2
         61zGposHfBMdaTC8TW97gK0Wy4Xghvksl1YYWeoCZhaF8ysMhrCar+6SK9DpGLgN8A++
         xxNJwL9GPMJO0yLTSbS5nM7YdActgDsn/v5BN/isHjURP2JRmpoBeJW4oYgwP3W75OFH
         tGlhpt3TyPecEzUN9CQf2LRwCE4KWhJ4soQauAOukbsH4T/M6RxruJ2qPP5P6K+HYGUV
         3DWQZRFOGxJtdto8V5pahGqBKJl3WFTZfsVW+KSqE+PTen5mYazklhTsx21VqbncZVe9
         sgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVX4DbhEagegyZJSLT2cblQyIB3wlBqTqTGHV604Xhj6JVe/pzEOXkjRNnAsifiwVnwTrc6la3jMV5lOZ8+RChD9vwfmh1hjH4ooI2BdgORgdc=
X-Gm-Message-State: AOJu0Yxn6YPP1tK7arjDShfNg9pujTiwWIkV/VQKGn177YhnazC96aNg
	ilDjNK90thFmKu33kyArkA4iuD1q078J3BGXD9WcEyupxHSIfQFw0SUpAxMF4S8=
X-Google-Smtp-Source: AGHT+IE4w+wikVhp2vCBwTP2wSRMRyso4c+p6a52Ji4CPU43wbv4hy3g2InI/NLX3kHSQY2Kj2YIpA==
X-Received: by 2002:a05:600c:4ec6:b0:428:1eff:78ec with SMTP id 5b1f17b1804b1-4281eff7a44mr41585485e9.18.1722343841397;
        Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:291e:4a48:358e:6f49])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42805730e68sm216521405e9.9.2024.07.30.05.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:50:41 -0700 (PDT)
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
Subject: [PATCH LATER 8/9] drm/meson: dw-hdmi: don't write power controller registers
Date: Tue, 30 Jul 2024 14:50:18 +0200
Message-ID: <20240730125023.710237-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730125023.710237-1-jbrunet@baylibre.com>
References: <20240730125023.710237-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_055044_082405_3B87B5BD 
X-CRM114-Status: GOOD (  12.45  )
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

The HDMI phy has a power domain properly set in DT.

Writing the power controller register directly from the hdmi driver is
incorrect. The power domain framework should be used for that.

HHI is a collection of Amlogic devices, such as clocks, reset,
power domains and phys.

This is another step to get rid of HHI access in Amlogic display drivers
and possibly stop using the component API.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This change depends on:
 * f1ab099d6591 ("arm64: dts: amlogic: add power domain to hdmitx")

Time is needed for these changes to sink in u-boot and distros,
making this change safe to apply.

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index ef059c5ef520..6c18d97b8b16 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -111,7 +111,6 @@
 #define HDMITX_TOP_G12A_OFFSET	0x8000
 
 /* HHI Registers */
-#define HHI_MEM_PD_REG0		0x100 /* 0x40 */
 #define HHI_HDMI_CLK_CNTL	0x1cc /* 0x73 */
 #define HHI_HDMI_PHY_CNTL0	0x3a0 /* 0xe8 */
 #define HHI_HDMI_PHY_CNTL1	0x3a4 /* 0xe9 */
@@ -423,9 +422,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
 
-	/* Bring HDMITX MEM output of power down */
-	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
-
 	/* Bring out of reset */
 	regmap_write(meson_dw_hdmi->top, HDMITX_TOP_SW_RESET, 0);
 	msleep(20);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
