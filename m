Return-Path: <SRS0=WmWE=PD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D0FC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 14:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A6E60FDA
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Oct 2021 14:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29A6E60FDA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y24uKCQ+fzxj7i8sWLi5YiSdMz8PAbZDnIM+9rXDjbE=; b=ace6byI//T5mgX
	SmZpSGAZp4owErs92e11pnR92F+B5y1YftNj8jox9fXwu6zRBwYWiDvGj+cgqsAvyf3Kvo/gasTHr
	yB00OFP/KqqHN9BxTthtScJDKS2fSdMvb/k7mxoK4xuvPjH7ibAo3IONwRI8Cdx4e8iVlHoC0eRhh
	rSkaD7twdVqEXMtKu71Zh4NM858tsQICV3gIQNm6ZxGPLr4CdJszing9XietJ5Rz/Jvaqthq0fusq
	ZN6kRf3X0oo3NWVwCdpp6i6dkcCnSp1BDWbW54Sy4V8Y3m8nvprooRW4HcHUnZSA6Kv5uws0WJ05V
	h3NNevNFwHiCmgNuRITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbO4i-007Xul-3f; Fri, 15 Oct 2021 14:20:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbNvU-007Tpk-Ly
 for linux-amlogic@lists.infradead.org; Fri, 15 Oct 2021 14:11:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id g25so26657405wrb.2
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Oct 2021 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK5WSwXHZWoI/1ZBUvfDbCPhpcOUhghwxwipgWWDC98=;
 b=8B6JOltmwuzEfGkzrOKCjgmb6sk8JOnMULoXp871nvfb8vFUJ2EdlOZtTK7G4JrJcw
 eyBOHEMW5X/iGMIw6FR33U2jt+wak87HGpcNSIYzSFI3tRZUJ1lk2RvMtcy74/87tNFR
 ePFhvcDSKBfjBjTlE+CjEzSFbIP2aXyZslhj+ysU4Ie/YamccgSLDOeQ3d7dsvpsGWGO
 HoGNxI3wMYWQCUm2UjCG7kjyojNGGylze+ZNWWdhMzR10cLd6MocYdXwBnP8cqRDGz6B
 4rVVW77uPZ5I2YVVjmu2W3UanuyGTAkeUKVAXrlAcuNpTtNcBzlKmKZ/K85fT5YWNmY6
 VySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SK5WSwXHZWoI/1ZBUvfDbCPhpcOUhghwxwipgWWDC98=;
 b=bOXHKWB36Dwx0ZYokparcvIh63FqJFRXfYSjIzMzxrCMmF4yIZyg6WHnPVxKXa/8Te
 gLbKxkmukVeDpFaEgOI/KCeF3fuX8OSgnE51D9bTvmHn4yD1CanODfCFCArD9dEWXygo
 r3yrT/o52TXxjSjoHq0w6TICAD6Co4ot6KAa2HjvV4YWNj9PlWw3S5NYYuub/REV+da1
 vL+iIllGnicw0PJoZAOS1v1tIm2AyPYKDnUsU94eWmRpoQkjK6tAS9YMipGdGeY6yR3c
 OS9F1IeBswnDiJSZO0fTnkLJBJTxMRheR1JSrGcfprUiCdoWWRr34X01WJwtcFF2J98q
 RDLw==
X-Gm-Message-State: AOAM531txgtTvvZyhFKogwd/lANh0sAfECBeSGh11yOrpiiU7+zUIigL
 vWY2yEUxlN89Kr6XnCPsWicsmA==
X-Google-Smtp-Source: ABdhPJw/1LkkObJ3ghkbZlL8mXeEQ65q7HmlYnmT+4W1ZJ1xvKR2Kc179nzGYBN3EYBY+dBTEAhtGA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr14612259wrs.80.1634307070511; 
 Fri, 15 Oct 2021 07:11:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f6e3:13bd:45ae:5eeb])
 by smtp.gmail.com with ESMTPSA id f15sm4971434wrt.38.2021.10.15.07.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:11:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/6] drm/meson: rework encoders to pass ATTACH_NO_CONNECTOR
Date: Fri, 15 Oct 2021 16:11:01 +0200
Message-Id: <20211015141107.2430800-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2607; h=from:subject;
 bh=fTkgFMlSB5Ej7MF+TequNqhZSjRHV4SIxj9PjVk81iE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaYoipSArcNV7nFCbup2fdmzNK3qHxA1qegi12EUX
 2eGrp7SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWmKIgAKCRB33NvayMhJ0dkcD/
 9qlX4Gb1Is7ynKt7PiVlO7GkGeshsI29vfmJIFP6+ArJtfQIqxGFcFobg23cGo8fvZ4wX8UoXB+8C9
 8MsuVXqNOoZnAmr2igGcYO2TvbazqG74mqzkStuvbmGEDLepBT315heMyfyDlyT0K/2pRu2MmNjINM
 mnT1zHtaNmS6gBH0zp+vGzojAIrhJMg7BzCEqDZ/3enp3saAazHP7+3fVcKf0KLOaXpzeZeRSfWlnp
 y11/5Gfx1PPbqLsQdb/pRHQrZGsvOxzgASt6l8A8UiGek3YD6CJqjmiejllwolyrkWl69zbpDqqbZC
 Y7RgjOhMcEMMls1oeLdikoSBtLAkasX+qzjlmjQzGbjVITun55XaFcRkqnnH9Xskkm85UF1PJk+WzT
 IpLxhMsvnrlGQw9JqHOdTYdzNLnZCeaRRpKq8sSwUAWmwEbRMkehxmMIhm87dG2mYDIWt8sh4hKSzj
 ks0VptYcTWLlMQlDxZRd7mgd3O/fxnP3nBGgHEbg9PdItyacSU5/FeMx5lwnvAnW2nK9kIESAduVFy
 cGK0TXiMG7qOpLzvLt/h8rCCPwxcmENXjHM6J8oKH5Wq+0vx948FXlmY5+afSZ9Ws+nOQkjAWHuBPh
 EVbGkLFvuTvjD59SJmDvli1PlO858luVua+adFk2PE3FKK6nMpD3N3p2tfFA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_071112_817458_CB11E9B3 
X-CRM114-Status: GOOD (  10.31  )
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

This serie finnally reworks the drm/meson driver by extracting the encoders
in their own file and moves to bridge-only callbacks.

This permits passing the ATTACH_NO_CONNECTOR bridge attach flag and finally
use the CVBS & HDMI display-connector driver.

This will ease Martin Blumenstingl writing the HDMI transceiver driver for
the older Meson8/8b SoCs, and sets the proper architecture for the work in
progress MIPI-DSI support.

Finally, this serie will path the way to a removal of the device component
and use the drmm memory management.

Changes since v1 at [1];
 - patch 1: added sam's review tag, fixed include order, fixed doc wording
 - patch 2: added sam's ack tag, switched to dev_dbg()
 - patch 3: moved mode_set to atomic_enable, removed DRM_DEBUG, fixed include order
 - patch 4: added sam's ack tag & applied to drm-misc-next
 - patch 5 & 6: added sam's ack tag
 - patch 7: added sam's review tag, stopped saving connector, moved mode_set to atomic_enable,
 	added missing atomic state callbacks, fixed include order, switched to dev_dbg/dev_err

[1] https://lore.kernel.org/r/20211014152606.2289528-1-narmstrong@baylibre.com

Neil Armstrong (6):
  drm/bridge: display-connector: implement bus fmts callbacks
  drm/meson: remove useless recursive components matching
  drm/meson: split out encoder from meson_dw_hdmi
  drm/meson: encoder_hdmi: switch to bridge
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/meson: rename venc_cvbs to encoder_cvbs
  drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/display-connector.c    |  86 ++++
 drivers/gpu/drm/meson/Kconfig                 |   2 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +------------
 drivers/gpu/drm/meson/meson_encoder_cvbs.c    | 291 +++++++++++
 ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 452 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c       | 293 ------------
 10 files changed, 894 insertions(+), 660 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
 delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c


base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
