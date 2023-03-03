Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54ED4C64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ObQ3yAv/CQ3cnCfFymKkEYpD+R+mLXNnxON1upSsOAo=; b=Dl43IuWsbQWfeg
	BO8Z494zW76xj831LA0JOOcWYwKpWedVehjUHTl1SQVeZd6V1BQaisWa21ycnaLLqrHqQLQ0nhSp8
	tZeOLCiquSSSv8lvXADs5FnAq7XBx13BEx8xp4UnXFwRVHYAe5TVqfGNxu6cXuUjjKdPRYacQSGhm
	UtzGU/q9U8HRXEozGnFOeQ0CAoyH7FRPFqOq8TTN89OwQ2lle1eN5v9mZCRPeIpTwELUWznTiGyjw
	FYY6cSPvTi6ijJSbcJy3uzhDPPGRN+1yzCg9emmuLYVPvAbji7xCIJ/5SOh4V6VkblkBD8L4StRLV
	emTFG8jkt8+nvRqfhKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4bD-006KGm-Tp; Fri, 03 Mar 2023 12:33:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4b9-006KFR-Q6; Fri, 03 Mar 2023 12:33:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so3801298wmb.3;
        Fri, 03 Mar 2023 04:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Avma0LmG3fMmIscRMsl03VxGDuG4kqyX0ebqajTjKu4=;
        b=op6CjDXgDJ8a3+SDEW4qqMibSd2A7N87rbpRy0+ig5Ka2OsHB58hCe9vIdPQNmI3iC
         tqGR9j+dXu95LJYj7a39UPGPMnW2jXsN1htZ4XH4ww8B7u4jDfj9NH4jp1KSG0PAhxEj
         2YBkjgbmVYy3/1Q2ODMkrp6ghd8lEZTdyR4z7W0HyBmB9CQ80av8pPk6EvriYfWa/Oc+
         liiFN7UtGEhsZdhGJLCekO7uuhBEG7Fzu2PykVstObcy0FrnLcuu1cNcM+33ILxOzreT
         ehtEpoKXAabODtiDvCieyMfxU1ISOz6VE7niJuQThx5Hlg1FL4YymwtPvonXcneMwh4R
         lOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avma0LmG3fMmIscRMsl03VxGDuG4kqyX0ebqajTjKu4=;
        b=HHWNKDig5/lVlHvo4V/UoxaqLAc9tRYMq3ee2r3/j2/k7OIFni42OkCcE+URA/WVgh
         2jXT4u5Y3ifquvDEF16XLv8SQt8OWD2G2mqd1iD8fYm4UPepQRaKKIPA7waMruYHvDMF
         vQ+NZDECaczEe14+0Of5/EzvpwSLKOdA2yFQr6QFqjvf5vesikk64gwtV/dPd1SS7rxJ
         IRAfsuW2AhNl5Q4fsPxbG7z0FsS4WmL3EMgitTF9DzrtJ2S96IksMcOKFfK8rXRsW6vv
         bD1L1rBTA91O5Qm5Snk7gN0lBAAeb2Ow5gLiGaX5oioJ9EybFdDrLoBXj4QD6pxfp/BI
         H1pw==
X-Gm-Message-State: AO0yUKWnvbXbEzLebNbN0IzAdmtvsfZQSABe+/YcVTbt26og7snQtaPA
	jalFUC44RD+oUMmLM/ofqpY=
X-Google-Smtp-Source: AK7set/VvJ0ig87ojREiKZi3IdQswYQr5HOSJLhyb99jMuarDimDTnncr/lSElyahvpK/qQE9qMubg==
X-Received: by 2002:a05:600c:4f90:b0:3ea:d620:57a0 with SMTP id n16-20020a05600c4f9000b003ead62057a0mr1430142wmq.3.1677846796891;
        Fri, 03 Mar 2023 04:33:16 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003eb192787bfsm2258437wme.25.2023.03.03.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:33:16 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/meson: fix 1px pink line on GXM when scaling video overlay
Date: Fri,  3 Mar 2023 12:33:12 +0000
Message-Id: <20230303123312.155164-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_043319_883630_1A53D501 
X-CRM114-Status: GOOD (  11.24  )
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

Playing media with a resolution smaller than the crtc size requires the
video overlay to be scaled for output and GXM boards display a 1px pink
line on the bottom of the scaled overlay. Comparing with the downstream
vendor driver revealed VPP_DUMMY_DATA not being set [0].

Setting VPP_DUMMY_DATA prevents the 1px pink line from being seen.

[0] https://github.com/endlessm/linux-s905x/blob/master/drivers/amlogic/amports/video.c#L7869

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Change since v1:
This time I sent the right patch from the correct branch; the wording in
v1 is incorrect and the change to meson_registers.h is not required.

 drivers/gpu/drm/meson/meson_vpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_vpp.c b/drivers/gpu/drm/meson/meson_vpp.c
index 154837688ab0..5df1957c8e41 100644
--- a/drivers/gpu/drm/meson/meson_vpp.c
+++ b/drivers/gpu/drm/meson/meson_vpp.c
@@ -100,6 +100,8 @@ void meson_vpp_init(struct meson_drm *priv)
 			       priv->io_base + _REG(VPP_DOLBY_CTRL));
 		writel_relaxed(0x1020080,
 				priv->io_base + _REG(VPP_DUMMY_DATA1));
+		writel_relaxed(0x42020,
+				priv->io_base + _REG(VPP_DUMMY_DATA));
 	} else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
 		writel_relaxed(0xf, priv->io_base + _REG(DOLBY_PATH_CTRL));
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
