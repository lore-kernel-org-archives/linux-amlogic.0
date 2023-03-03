Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9190CC678D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k1fy2e68gEZrRLPaE6JIZzHNAqNVWStVfw5/uSU3CeE=; b=J1tc4WcG5lHEVg
	EUNheS340iQV76RPqyq82vQeC2/65PsbhN2MqTfrkEHSzP9FQybK4UdLhXyF/B6ra2Ob8gKjDebOf
	ZdokuNErHhnCLgqjn+Jq07IyQW71l6656PLzBIJISeML/9b3GnZFqiVHW5pzuoD7aQtIq3SqeDt42
	TYapcqBbTPZQj7910+Of0WpHWy+XLlVBcZ3+mBRihY2QwjqvCew/HGX/QfrNIPLM2pMewooPyV3g9
	NDu7S0ynGNIvr/pLNFf89D4XOLy60i+2f//DhCWt3h+66/SKz/z5+MobbElDShx4Vj86dZF5DSfnr
	KMfVyoFQoQY28y2raSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4BL-006GhA-7C; Fri, 03 Mar 2023 12:06:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY4BH-006Gfv-KG; Fri, 03 Mar 2023 12:06:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id h11so2024456wrm.5;
        Fri, 03 Mar 2023 04:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4CVRkT00wDN2Fa83DiSDIePRGANN40JJ2ghpdtVgiE=;
        b=BIap55OlfFhERihj3vwiNDmo4umMdp82nwwLz8QsFoCnVYscUzxcBKiKGiS7wOBtNS
         Dr2iyyZz9h1GPzd1Fu/wTlnr/O1p0gQqlNIHun82LTkTmOkqrucXkQmt4aP3vGR4WJnH
         NHs5Q83GG+21uJKTP5vHgEbIlShJa2W9pmBUO9o736WWz/bH08e+I3EJipvToi4ZJXv6
         ojd1zvXUAsUHoS/YwMZNYvy2oL2WbHujiYOFsxYROk24t7qf9e6peOhLl3JuJYGeq5DS
         47EMnayvN+edKGykqK+br1n9AUn2SkblOs+x1701MCj84+FVpkm5tKUvZPyOo7PSjaNX
         00VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4CVRkT00wDN2Fa83DiSDIePRGANN40JJ2ghpdtVgiE=;
        b=mTNj50oCkL0iFSO0BDCFE5iQzI30off9t7nNslJN+SKN6RSNfVGz7V631R1LDRW35q
         /wiMCb0v0d53CmviC+Fp+E4N4z4dceh7cxv0E3QWpSmk9FDXHkr1vJmMO/4c31LWtdKo
         hLyo/x075iRyx+2tLpp+uuo72u0SxcqMpLjLXjbBQREt7eDO/M8D3TlXSstqX4+oC3Vj
         tfUkkrv8C/Fov8kVA6LqD4ytmM4S+Rzsg3RsPCXO8IYji2x1og0uDAeN/sXdDjmQ4EcI
         u0laHuVFYV7aql4yHbiw2uhvx9Le8FUM89ul5R5i59fsK0gsA3BGdqBXNX2ag7lJBSco
         5buw==
X-Gm-Message-State: AO0yUKXHx3DHHjw1CxBy8bRJYVJbMO2MzxDryX38qRVEUEUNbpzA6NAc
	724bVhxMgiAB/RcOBKieI+o=
X-Google-Smtp-Source: AK7set9vuTqZGxAGpdazzvzEOD3vfnTS3TDJdUdtJ0rfP/eI2tCbGtxxFPZiAd+Zc4NqumSjWhajBg==
X-Received: by 2002:adf:fdcf:0:b0:2c7:17dd:ed6a with SMTP id i15-20020adffdcf000000b002c717dded6amr1085313wrs.33.1677845190360;
        Fri, 03 Mar 2023 04:06:30 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n18-20020adfe352000000b002c567881dbcsm2030068wrj.48.2023.03.03.04.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:06:30 -0800 (PST)
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
Subject: [PATCH] drm/meson: fix 1px pink line on GXM when scaling video overlay
Date: Fri,  3 Mar 2023 12:06:26 +0000
Message-Id: <20230303120626.3281-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_040635_719302_7D3BA176 
X-CRM114-Status: GOOD (  12.34  )
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
line on the bottom of the scaled overlay. Comparing registers with the
downstream vendor driver revealed some differences:

- The vendor driver sets BIT(17) | BIT(13) for VPP_DOLBY_CTRL
- The vendor driver sets VPP_DUMMY_DATA

Setting those values prevents the 1px pink line from being seen.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 drivers/gpu/drm/meson/meson_registers.h | 2 +-
 drivers/gpu/drm/meson/meson_vpp.c       | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
index 0f3cafab8860..e4af333fd839 100644
--- a/drivers/gpu/drm/meson/meson_registers.h
+++ b/drivers/gpu/drm/meson/meson_registers.h
@@ -534,7 +534,7 @@
 #define VPP_PEAKING_VGAIN 0x1d92
 #define VPP_PEAKING_NLP_1 0x1d93
 #define VPP_DOLBY_CTRL 0x1d93
-#define VPP_PPS_DUMMY_DATA_MODE (1 << 17)
+#define VPP_PPS_DUMMY_DATA_MODE (1 << 17 | 1 << 13)
 #define VPP_PEAKING_NLP_2 0x1d94
 #define VPP_PEAKING_NLP_3 0x1d95
 #define VPP_PEAKING_NLP_4 0x1d96
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
