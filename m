Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB4AC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:26:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90F1B61053
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90F1B61053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YmUlqMVMI4MOHaKNMHcLH2vLM/fVCagIBVr0NQs0D0s=; b=mYXqpOZLxK9Whm
	CjPEVGjkx6QsR8sLeITPrWKK5CmR2s0UBKQBEtrLyMeXu3lNpHtjtjNwnwvK3mzaIFwvzE1uyKstj
	0iXl32GIj23oT5eUDkVg/gj5jsESNpukcRgTMLKHWGOsQPmz3LUG6suKFuGBe132Om3aBeJCKjJww
	xzOhHOeQW/bEPQJMu6b2CkYmmYN5dqtlHhzYaMGcXV3E+xGJl9D8i3Kf9HqgYC1dFs3bP3cjd5tDU
	LvAuLCf/n6aViFLo26mvgDTDi96PHu5p6AxfiCoy331HV7a236jpBgj4zuQjif7QqBZP20/COU3QP
	AhVuz/vTF2Cx6kn4YPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb2cy-003dZt-A5; Thu, 14 Oct 2021 15:26:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb2cY-003dKf-SL
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 15:26:16 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v17so20644763wrv.9
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Oct 2021 08:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtNHoIxmbj/7YDvxGdvf8UnRLBtAOJ59R6fKnUV3dK4=;
 b=cZBtYzDwo24ybcZenK01f8LACa8nU2oln55UYRWGSq9wlUcuoTIWMvyZl23g70lWpA
 KlhT9ebBQNQtD5LSvFa4Rl7D8AE2R0NTicOI6EEs7DxApezBOWljjZnk+XS+csiY90Ng
 oPAi2Rr0eujFY9rmIykOgxXOFD+zlt94KCz4cq258jfzKXwGlmlXgKzD6wMPjlYnSk9k
 5a8MmDQ2mfQB1an9Kw9wCu2u6BtJv8uQdAFSRty9fvltXMkQ55Y4DFeD9xBGvaIx2pg+
 m/PwnuRpYWpjJ/7QH0zSVxsvD856qvTGeGE+qT6gP/+Rl46FG9SJXkYetCIAR65jQJL9
 dWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vtNHoIxmbj/7YDvxGdvf8UnRLBtAOJ59R6fKnUV3dK4=;
 b=Mfj5sKdWz2G53ZkO5zahQJIyLSa7GNVAZS+3WDM8bcLD08WaIXEoJwMhDkqonJH53c
 mp7/FU1xk+bBvdk5WLNWiyX94GwvO5ePeaarpJbELOPvK6wbNcpk3H5hMxh9+jcqzxOR
 +A4eZ5BkaVTv2WmucxpoifXCvzq9tGMpKI3493fPiwwy/HAeLmluNqhmHJwglEgeu+Y6
 Jl4fNxKj6RguDymjPNNg1yJRHySTl1tOMeR6Gft0s5Yt7rTw3nVUol4Mf81xXLvLgCAz
 YS/2ozAJefBjEoGB66e84LeE15pDr4DV9kVk8Cxehv1bVKBQscWb/c2TsEIxr92rc6w/
 aXGw==
X-Gm-Message-State: AOAM5302+FSD9OOaen4CCB8zH9vOCRUPmUnlCYh5tWEnvueUoZ/8kSJd
 70Z/zXAhW1IyIpoCsJ/RPWbv3Q==
X-Google-Smtp-Source: ABdhPJzASIqrQfvo9ajIKTAsQPp5MeFQvU/qWqa+T2hNix34pWnoqdCT/ncVqQAQdsslTsBRf5+9bA==
X-Received: by 2002:adf:cf04:: with SMTP id o4mr7498455wrj.129.1634225172185; 
 Thu, 14 Oct 2021 08:26:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/7] drm/meson: rework encoders to pass ATTACH_NO_CONNECTOR
Date: Thu, 14 Oct 2021 17:25:59 +0200
Message-Id: <20211014152606.2289528-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; h=from:subject;
 bh=tqvgfg0RoYJxjcu7H6VRSRZ/iXD37Rql9lvX/6yu3P8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEt9Cw6cshz+RwHFIN4X1WnWFtkszZAXlrQ6ZyBc
 t/zKeJCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLfQAKCRB33NvayMhJ0V2dD/
 oDU2tsprYEbhRvVhpew7mxpO3qSBGSoHOjBRNRiDV0OnJEaEp0k8VpO5a2t3xgJsBUAm7f3Rsut35C
 KEROqGXo6M4IjHUIj0QkWjPPMwn9kBQsNSrK8+M6wxYn3r/CI8UX86MGJKXFpcoJurLM25Mu/knaH2
 y4sNuvDHvFIt39BoQQEe9OYJIZLmFCCrb3dTtmWCgG9r8BQqPGZ6Dcu61Cw8jjq200lW2Ws3E1rVfC
 fJyVpzfwP18G7W3TI1SXsX6b8/RA22S7LHemc7JG8j32M4AgQVU9vKeK8CcLlhR1YutSAnCbtXAdIv
 0HWkPRTcqlISimSZrmwMe48UPR+I0XYXL1pbFQYvMqSdFdU8cW3qQaVtkqqpppQAeQdYvAUPF2aOZN
 UyyjkZiYBQebgUHmgbHAeTA5bm23NDw4W5mJg3PPIeQFEF6mggT0FQoKrd9U1MqSgm/uwH9f47JSVD
 KF+Sb77Tw0rbiN6bB1ezWGifD26Lrcv63Aafv4+7dw2yX/i7DQqciuLG+OcVabb5h4sDitdL6J4886
 um+3245e9KJ8W+zWlrHPCV5mYGzpjeiZAlY2koI7LJeq8Xp6EVWsrtrMFmgnS8meglyULA+A2oZxPT
 VmpqGrlqi7TQVXDrvDm8O7zFtHndr06E6h79MPllyXf6Y9I2vgnjO+Garlaw==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_082614_962495_0171EEA9 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

This will ease Martin Blumenstingl writting the HDMI transceiver driver for
the older Meson8/8b SoCs, and sets the proper architecture for the work in
progress MIPI-DSI support.

Finally, this serie will path the way to a removal of the device component
and use the drmm memory management.

Neil Armstrong (7):
  drm/bridge: display-connector: implement bus fmts callbacks
  drm/meson: remove useless recursive components matching
  drm/meson: split out encoder from meson_dw_hdmi
  drm/bridge: synopsys: dw-hdmi: also allow interlace on bridge
  drm/meson: encoder_hdmi: switch to bridge
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/meson: rename venc_cvbs to encoder_cvbs
  drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/display-connector.c    |  88 ++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   1 +
 drivers/gpu/drm/meson/Kconfig                 |   2 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +-------------
 ...meson_venc_cvbs.c => meson_encoder_cvbs.c} | 198 ++++----
 ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 436 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
 10 files changed, 679 insertions(+), 476 deletions(-)
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.c => meson_encoder_cvbs.c} (51%)
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h


base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
