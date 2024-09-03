Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7C4CD3427
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2024 02:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kKahC49pIyDp4eB1ODp2PGxmhRHZRU1EkkSp7P30j5Q=; b=Q0t5PcikHrQZ8a
	Vpr9a1OV7RitmNPRAeGYZiwaTEKfPOu3WIADcTwTaCyQS2haaIugQET4rTzBq+JV1eZYyz6AJ8Nyl
	ANnloEX0/PwgL+yeshG5ZiDgS+afgNz/TVC2nFf2hbCtw6H7t55lIMWYTq/PKlG3rOqiD57Cl80Gq
	YSeG3IQrA4DAmMTAxsDvVBkdtaVIfqjJg5AfnpxbNKAN2opvttD0YBRi6e6R8iMIIOEX10Vip9kZU
	XovRAJpTMYK/ExmKtT8SvtTax7oZjFc7RZDjNQXj3oiwsSDkfETpceKQoGfxJbLgENhK8Cx0xWo70
	GbcLtXKFxhNqVIkxEwvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIrz-0000000G0Yy-0shY;
	Tue, 03 Sep 2024 02:02:11 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slIrt-0000000G0U1-40fU
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Sep 2024 02:02:08 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2f409c87b07so59857181fa.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Sep 2024 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725328924; x=1725933724; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jaon4WakhCpB6iL+hPLr96orgJfk9v1/Fqkvo3LCw0o=;
        b=GmJy917T70K0JZJg32klOp3N6w/+fgRnbiLnBtgUmlE+3T5gFSatBWZyYywta0CyIK
         qBxPKPlUcMikZ+X6x7gHsvI38sIJjNNAsnuarO2S5k0ovBm6PygZOkp0Ay70R9Yx8tB3
         Acp5Rle+2jwPrg0hH+86jsj3/5ikTiI3NpGOYNc2d6f/vdK/0EpGdm1HgiTUZ+EC/iG0
         gnQG3eeL3EIRTMuJs9Z4EkJQxy4dDxyl1DCnNQaWFVi5bQ6r4QyABNY6pEpi7ZHryrej
         Ja7ySBZjHxojrs556EbT4aF5WJ2C5ivj4XWKZxEXPkvZ9ho3KgTf2iUpQIXRXYRXjQ1k
         tB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725328924; x=1725933724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jaon4WakhCpB6iL+hPLr96orgJfk9v1/Fqkvo3LCw0o=;
        b=Dy4qlKJdUvON8OHQgpg2jmkrRjUl+qRuY1u/l0pmAYmwwvifBMSk0K1gsKwzZ3VE/v
         hbUkTOND7fQG87r3SifUUUtXOulfB3IfV02WcWcuKKtQ4ieoDJY/r7WNcMsWeNH06z8t
         +XEVUAJZXSRUsTKvo2To4Pg7/lFvY3HtiS58QNvO6BX66qeI6uDACJvmnRXu1UtAant0
         lzWmIov19uNfzQ5X0rWvp0FxEyY3O76KFKcswb6HRlZ/+WyjcakQNn++IdFIgh8ocu/x
         P4IZlxloT498kur+TY+JL8q+tXtQ4qWtfm1OdsOiCLGVyivnkhLgMEmGbf0qsantQ6Wd
         dASQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0PcGmuuUXtJsqfdYbCa2dIZghNlLOqomAyAhoQdDG8R3htRxLevn0/n6KUQUltu7LqtPbRk72bDmokYDG@lists.infradead.org
X-Gm-Message-State: AOJu0YwMHoumEIDoq/SnZBu5onbVe3E5NKWplVN7xuwEtqGArHXj+S19
	zr4S5apXYYOf3Bufi9nHQRcFUzZfv+D0y/zg/XWE7GG364ID8j8Pv5gsL764z2Q=
X-Google-Smtp-Source: AGHT+IH2ddOPWpP9vOPua5bV93XUii65ilyuJnbCbqXryT6U4fN0EdmF5ySMd7clEDi4r6Z/lY2Rhw==
X-Received: by 2002:a2e:4c09:0:b0:2ef:290e:4a39 with SMTP id 38308e7fff4ca-2f626bbbd74mr47016851fa.35.1725328922705;
        Mon, 02 Sep 2024 19:02:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm20827761fa.8.2024.09.02.19.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 19:02:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v5 0/3] drm: fix two issues related to HDMI Connector
 implementation
Date: Tue, 03 Sep 2024 05:01:55 +0300
Message-Id: <20240903-drm-bridge-connector-fix-hdmi-reset-v5-0-daebde6d9857@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABNu1mYC/53NTW7CMBAF4KsgrzvIHk9C3BX3QF0Ye0IsFbuyU
 QRCuXsHNi1iQ7t88/O9q2pcEzf1vrqqynNqqWQJ3dtKhcnnA0OKkhVqJN2jhViPsK8pyiaUnDm
 cSoUxnWGKxwSVG59ABx56P+rOeq9E+qosF/eW3YfkKTX5utxLZ3Ob/s2fDWggw25wFEPksP1M2
 deyLvWgbgUz/gNFQYfO6UjkDAZ+Qu0PutH4GmoFNbjXbA1S8PSE0i/UdK+hJGhvuCezCWN07gF
 dluUbDBv28dYBAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
 Edmund Dea <edmund.j.dea@intel.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3353;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EYI46Bz/nggRktCfUc4nuXKd2sUlD/7bxU6zar/vXO0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1m4YRSvsImJpHuC/wcLa1DcZOPuYqAiynu6nD
 hrSfiRv7eOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtZuGAAKCRCLPIo+Aiko
 1T8VB/4laRhXOUULaJ+JMQI12xMPUKXQH5ph8rJNcS9B/gmLgbcPLgMhO/fJS4iK0YjhNZoPI0W
 NJ70iNUleeMx0GBlB+RyVJuS/d1SFgtPXp/jx2RDS0Wm21hPh/X3Fm1nEQ2eqX6oz939nxLb2g1
 hrjPMsp+fy/DoJp+WyPqy/YwSqHBZlcYwPUPH1mctmZwJC1GkTrajvdYFKB188SS/N9bztPoBUy
 kG2weWvQkMNcYmSOjnh5gEtxQ6gHkWX2ve9pRhaVXOiHiWkM0q1mHZF6HXhCeGTAAhhiSv/+N17
 PRBvnlt91b/RQK3b1NoB53F/rapRdYsKJEf9cpwjn7/ZFhmz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_190206_236652_039547E9 
X-CRM114-Status: GOOD (  11.05  )
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

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
it's better to add drm_bridge_funcs::connector_reset() and call it from
__drm_atomic_helper_connector_reset().

Depends on https://lore.kernel.org/dri-devel/20240704-panel-sw43408-fix-v6-1-3ea1c94bbb9b@linaro.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v5:
- Rebased on top of drm-misc-next
- Dropped the DRM_MODE_PROP_IMMUTABLE patches, replaced with the IGT
  patch.
- Link to v4: https://lore.kernel.org/r/20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org

Changes in v4:
- Fixed DRM_MODE_PROP_IMMUTABLE to use MUST in the single-value clause (Maxime)
- Rebased on top of DRM_DSC_HELPERS patch
- Removed 'depends on DRM_DISPLAY_HELPER' (Maxime)
- Link to v3: https://lore.kernel.org/r/20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org

Changes in v3:
- Document the DRM_MODE_PROP_IMMUTABLE requirements currently exposed
  only via IGT tests (Maxime).
- Move drm_bridge_connector to drm_display_helper.
- Link to v2: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org

Changes in v2:
- Actually pass the flags to drm_property_create_range().
- Link to v1: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org

---
Dmitry Baryshkov (3):
      drm/display: stop depending on DRM_DISPLAY_HELPER
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

 MAINTAINERS                                        |  2 +-
 drivers/gpu/drm/Makefile                           |  1 -
 drivers/gpu/drm/bridge/Kconfig                     |  1 +
 drivers/gpu/drm/display/Kconfig                    | 25 ++++++++++++----------
 drivers/gpu/drm/display/Makefile                   |  2 ++
 .../gpu/drm/{ => display}/drm_bridge_connector.c   | 13 ++++++++++-
 drivers/gpu/drm/imx/dcss/Kconfig                   |  2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                   |  2 ++
 drivers/gpu/drm/ingenic/Kconfig                    |  2 ++
 drivers/gpu/drm/kmb/Kconfig                        |  2 ++
 drivers/gpu/drm/mediatek/Kconfig                   |  2 ++
 drivers/gpu/drm/meson/Kconfig                      |  2 ++
 drivers/gpu/drm/msm/Kconfig                        |  1 +
 drivers/gpu/drm/omapdrm/Kconfig                    |  2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig            |  2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig              |  2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig           |  2 ++
 drivers/gpu/drm/rockchip/Kconfig                   |  4 ++++
 drivers/gpu/drm/tegra/Kconfig                      |  1 +
 drivers/gpu/drm/tidss/Kconfig                      |  2 ++
 drivers/gpu/drm/xlnx/Kconfig                       |  1 +
 21 files changed, 59 insertions(+), 14 deletions(-)
---
base-commit: ca097d4d94d808409386fde414370900cc41adad
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
