Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591DCC10F0A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 285AE21773
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 10:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LTkKplJ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jc5/ErcR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 285AE21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cc658BgWTIAvLltG3yhf6V12pIPlrXz2ICnSuuSIaYs=; b=LTkKplJ/ea135H
	jmRTvQ/Cbll7I17/Qr7HnjTUA0mCl6CNRpP+e+woiP0c6yCWH+mK9ggoCOInDz72q9+pZGnlIbP01
	IWn8qYmt6bJF8mdhOxmFAdzwYruZ4bxaPRmmEQtGOM3J8U2T/udhqErDQQhWhu0nKrN6E5x5nGG7r
	3XRcQhfPYEdVNo45R0VXbnbTdFSJBTS62Zg8pQWGvbzk/oyD7bX4LuEjPS0GcKvmYT1TWh8ZFzL/h
	zFgzwqzinVjdd25xMb6JM5iBSfwbjNpZXTtq8upvyZFX17GXysQb80xiUEqxph1DCVHhn3hwrTb6V
	T9kQOI6JEJ8+Mg30cnJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9oyK-00044C-UO; Fri, 29 Mar 2019 10:42:52 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9oyC-0003vM-Vi
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 10:42:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id w10so1982287wrm.4
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 03:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xjoUxT2gkADqHwB+nNuWWmWXvp2B9McV9Ra5Ovdxhsg=;
 b=jc5/ErcRbqTGWc9QbkN1Y6HPztAcnWwu8U9zfE/caCAKzasJm4w88E9CN1Ep9q/D7F
 InpIeAcNXTu8p8ceBfTR73GOpIAKg6NH+wd+8b21uPS0SJ29kuw6jgOvyU95ZzMXq67K
 k8WWBAeFjPH4iXY3mn4mQQs5Q//sjdqu589v43/75QBvSWYqcVhoVxIBONBAAITZIXLs
 nfDVO2XIdBZmfqM6uCBlUU+3lT0aiX8FJcd67eSqSNY2SsNPbycBCbkjTUyfySdgmxeZ
 lmxVaNtuCXdFG2/2D4k+Kbku48BUmCon4d3EW1CoJnz1SOj6kRtM1wquzdlziaBiftlm
 5lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xjoUxT2gkADqHwB+nNuWWmWXvp2B9McV9Ra5Ovdxhsg=;
 b=P2Bhma1OH/3VuA2trCrR9OFTrVL4xtkNTP+gd3GNv58/jcv8lrclQ7xUm92HT3ydDq
 MSbB4D4mnwe2DoIueEX+4yXYER5Ela316krrVa8n7IGNo5mf3ovfAzXaIyGtC0lUPzeI
 yQw/8TJXhAVjQc2YZqZw+0+kuSEY4yjvAGRmEp7vg+r4RVwcm3oIWnQLQcKG8vyMNGW7
 d+7/F6YuE9LQqCflOrfp4T5paPioDE6L0rkbkoiLUA9HwUl7SXXt8yAGFjSgDBiDgAto
 LPMtEe86+voAv1hIjtBIk/R7DQCX0NA+hdl/QnPsIC8+fCqRs7a/j1PF0YWKgEm/2TNj
 ZYxA==
X-Gm-Message-State: APjAAAX5dUn6OUxCjqb1fFoj2S4OJXo7BytHReZxCYHrQNxlW6+LkoAn
 xVdStkI2eqrexUSCQY+QDpMIRLrBF3oNng==
X-Google-Smtp-Source: APXvYqyWb9L4wJ7B4TwT3YXN62UrChbKBqVp9DXuulQ+v/QLIQ0nGS8u4lI1P+KeBfI8cUT3mZ8s3Q==
X-Received: by 2002:adf:ba81:: with SMTP id p1mr29266278wrg.192.1553856162947; 
 Fri, 29 Mar 2019 03:42:42 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o15sm1632826wrj.59.2019.03.29.03.42.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 29 Mar 2019 03:42:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Subject: [PATCH RFC 0/5] drm/meson: Add support for HDMI2.0 YUV420 4k60
Date: Fri, 29 Mar 2019 11:42:35 +0100
Message-Id: <20190329104240.29585-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_034245_160005_6CD01284 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Cc: jernej.skrabec@siol.net, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>, maxime.ripard@bootlin.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Synopsys DW-HDMI CSC does not support downsampling to YUV420, so
the encoder must downsamle before, feeding the controller with a YUV420
pixel stream.

The encoder must declare the new bus format enc encoding the bridge, in
order to take it in account.

To solve this, a new format_set() bridge op is added, permitting setting
a new input bus format and encoding to the bridge chain.

This solves YUV420 setup, but also solved setting 10bit, 12bit or 16bit
input bus format in order to support HDMI >8bit depths.

The DW-HDMI controller is updated to dynamically select a coherent output
bus format depending on the input bus format and on the internal CSC
supported modes.

The DW-HDMI is also updated to support the connector display_info bus_formats
entry to permit forcing a specific output bus format to force, for example,
an YUV444 output format instead of the default RGB output bus format.

Only the meson DRM dw_hdmi glue allows ycbcr420 modes, so no breakage
is expected here.

The remaining patches adds support for 4:2:0 output and clock setup for
the meson DW-HDMI glue, and how YUV444 output can be forced.

Neil Armstrong (5):
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/bridge: add encoder support to specify bridge input format
  drm/bridge: dw-hdmi: Add support for dynamic output format setup
  drm/meson: Add YUV420 output support
  drm/meson: Output in YUV444 if sink supports it

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 127 ++++++++++++++++++++--
 drivers/gpu/drm/drm_bridge.c              |  35 ++++++
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 111 ++++++++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++++++++----
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |   6 +-
 drivers/gpu/drm/meson/meson_venc.h        |  11 ++
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 include/drm/drm_bridge.h                  |  19 ++++
 10 files changed, 358 insertions(+), 55 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
