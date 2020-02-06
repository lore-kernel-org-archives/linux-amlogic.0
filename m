Return-Path: <SRS0=So4j=32=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E1D8C352A2
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D6E9217F4
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Feb 2020 19:18:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWrleHpi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DxnTXJPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D6E9217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=anqRLQ7cf/cbPnsnV8GV1HXHd0KdDG9jgeTwUzCsT1M=; b=bWrleHpi3JONG6
	n7TrUFTqQyJl1/MDQKeO457a5jkGyx9fxJuu5jNJpFpepkGSwxVXLjHiXs6mgjU6g1LkC9aPYz02X
	Ce1uqHAwQGy2LvVgELGm3Ose+rFNFqATksN40ioEKfrkPYV//cqwPQfPMvC8zqBhQKY8uNg55Ys75
	2C9Q3YRcwuq5IWy2BCWFnUu2jacgtmzsWZZi39cXqbeT1jloH6L4IHDcf0CeDhgsLPip5a674ARjk
	Ol54IxxIwDFnvsU6HEQ0Tw5n3FIrY9rblBot2qWPjyklbMzLyazXkCpxCIi/FYBzIj4tWHC90QJPn
	iXpDZUOE7PfAy5RE19rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izmfj-0008Fs-Su; Thu, 06 Feb 2020 19:18:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izmff-0008Da-Gx
 for linux-amlogic@lists.infradead.org; Thu, 06 Feb 2020 19:18:41 +0000
Received: by mail-wr1-x441.google.com with SMTP id w12so8598008wrt.2
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Feb 2020 11:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7C4Ha7zAXoHJLeQuNXMkRQPbmeP4ogREDDVwBdo96PU=;
 b=DxnTXJPqXXPnizJLFNrqa8GwJ8gMWT/axeWYGzcs3ljXjPgGTyKNnBVVA21YieyHxn
 k6v/3pUpzARJ8UF8hbtsbjgwA5koasldIhE9esnWmv9fb8wrU30l7FpIa2j9RZLV21nM
 NQjz6sWEVlRvKoNM9icc+5FvS9SOzdX5tWCRYpAigUOBi1QUUh+f8YhLwrw+zvOyEecl
 ppc45FZOr/DBqaSDGmVBYBlRWqs1Q0h8ACoyqG1Oglt2yIRBAB92tqdBciC2LQEBu6hm
 DF49GWWLO91Z3pIJDuBYpqgB/w8lx5C5sV0p+/R7MhYxbVu2s7Vs+bUszVITV2jVje+G
 Cf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7C4Ha7zAXoHJLeQuNXMkRQPbmeP4ogREDDVwBdo96PU=;
 b=EJhaQKgokb+P6foRElVc0yEn1voN7CxHt+The/SA1g2FBS6sAsabEHMcv+jIL6UeoZ
 la8T46i/cv4/ZXPAwT8KS43prxN9Ygpllq7SM04TbC124McIx/mlTT4jOfTZt89CQHgx
 T1BqKKPTeaDU5T6lNVevD7Ei/JJgvB9FWKvhbQ72+a2VAs46CEaN0jB8I1q2VG2OTd6S
 B5ruZ8IiLa5rcjEk6oBNUVnMWEugsQS0tFUw2+Qh4zTwFghk3YOnVR1+YFBCTjaDHwdp
 GivgIyOwlqiEDYjx8QM76FP8l8zu2uZSiwLGV6dvtdQ2A/tjTl2cuv9aarzCaEFzwhPn
 dzBQ==
X-Gm-Message-State: APjAAAWwTc7RFNzD4ernGB8uUYvLD9ViXaqYRebFRJF1Rgenbx9QDFT9
 FqFMODg6Ii2pSwhQ1uL+7whpiw==
X-Google-Smtp-Source: APXvYqyUIKBo5GX0ik0zx1IEIcuY8em6EMApdnkWu4ZdvEAKTEYUUM/sB0yoLyYs2WmHo5wQQH3+Fg==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr5608872wrx.403.1581016717398; 
 Thu, 06 Feb 2020 11:18:37 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:7d33:17f7:8097:ecc7])
 by smtp.gmail.com with ESMTPSA id m3sm272662wrs.53.2020.02.06.11.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 11:18:36 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH v4 00/11] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Thu,  6 Feb 2020 20:18:23 +0100
Message-Id: <20200206191834.6125-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_111839_625921_8E51890E 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is based on Boris's v10 "drm: Add support for bus-format negotiation" at [1]
patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

Changes sincd v3 at [6]:
- Added "Plug atomic state hooks to the default implementation" on drm/bridge: dw-hdmi
- Also added these atomic state hooks in meson-dw-hdmi in patch 7
- Rebased on latest drm-misc-next including patches 1-7 of [1]

Changes since RFC v2 at [5]:
- Added fixes from Jonas, who tested and integrated it for Rockchip SoCs
- Added support for 10/12/16bit tmds clock calculation
- Added support for max_bcp connector property
- Adapted to Boris's v4 patchset
- Fixed typos reported by boris

Changes since RFC v1 at [4]:
- Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation

[1] https://patchwork.freedesktop.org/patch/msgid/20200128135514.108171-1-boris.brezillon@collabora.com
[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
[4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com
[5] https://patchwork.freedesktop.org/patch/msgid/20190827081425.15011-1-narmstrong@baylibre.com
[6] https://patchwork.freedesktop.org/patch/msgid/20191218154637.17509-1-narmstrong@baylibre.com

Jonas Karlman (2):
  drm/bridge: dw-hdmi: set mtmdsclock for deep color
  drm/bridge: dw-hdmi: add max bpc connector property

Neil Armstrong (9):
  drm/bridge: dw-hdmi: Plug atomic state hooks to the default
    implementation
  drm/bridge: synopsys: dw-hdmi: add bus format negociation
  drm/bridge: synopsys: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: add bridge and switch to drm_bridge_funcs
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 302 +++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 200 +++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 +++++--
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |  10 +-
 drivers/gpu/drm/meson/meson_venc.h        |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   6 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 8 files changed, 548 insertions(+), 75 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
