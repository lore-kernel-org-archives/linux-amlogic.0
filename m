Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB9EC3A5A4
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4618721883
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 08:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZhUZ0zU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0VeKXm8A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4618721883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tNOaaIqir1xqX4/OBHObzzD/gqU8gK2iqjy3UwK0jXU=; b=EZhUZ0zUDnsep4
	MX1TP9pW2zpTTrZDPJ4UlcSEvlspPv4rvA6obryRizuFuVsovkcAqFn7hKEzyj0Q/5pQyeDorJNrS
	wkdR+OSiCje5R731FIeUfnLbRZxoeSD2m/L3WNI09cIqaOSiCoU7oAJF/upk9tG95foqINah6ZoRA
	CbfYo5J21G8Own9YU4wSHjy0LOkzrYAJSr5B7ReAc0nyeS0U9uEwrNb5mUXcWxBXvL+5eBXZdaT2R
	22HeSL1Ox2bIUVyRQVyqNac1Y9XMaOdoe3FhbNC2VEzbHzpMW+08VDv7/VnL8dw/RoeAIVU8iN3Z4
	2EtY2Ay8piHpVKhaT63A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Wcg-0003qA-Io; Tue, 27 Aug 2019 08:14:38 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Wca-0003ln-SE
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 08:14:35 +0000
Received: by mail-wr1-x444.google.com with SMTP id c3so17804915wrd.7
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKa+G+WNTHyk8o+xbr/dEWEAIM2ZkisNR8p1GVxWpVo=;
 b=0VeKXm8Af8pEVqLyMPQhZTzMrsz8jVxkUaD5N4qpJaKNrac9JiXxDZSi2OWY6CJWXH
 k5TbIKg5WQsbaPPeCNzPx5q65qXgXWpUZV626HZ+sCdW1tzeSmkqZVrkaEI7+Z+3zPbK
 UWO9sJlC4cwbiPfw8AoNHVhuCBhQl4gjU4uNNRNE8VIyHE7+6C1KSIxq6//YMwYgEOUA
 Y5gtfrxTpa+GeYTYY/8Ze3/m5eUSQrahDFgPWgCyd4xmDWJULzeglCAIyALZVUEMCX2b
 4UWdV38bJNagvtev1EUAI43EFYDNZyKZtN5fp51ZG77+1QiXjSdH0bWKye3oln5N1neH
 svkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZKa+G+WNTHyk8o+xbr/dEWEAIM2ZkisNR8p1GVxWpVo=;
 b=ebeGJl9PbbzobWY5NHqphN5owNKujm5mjbCsaf7mtWtACsQ9B0gwdXUxuBC3h8BS3F
 XeG5WJOVcGVqSUGTwM55voPt6xS+ADkVxDM8muiYalcViFtZuE/VIl6nKWcumtRH8Fxb
 +9Ah2dtwxozfsHcTXDBDSOgel/krK3Hef3sEWuf4VZigb+mH4HCI8JVStVXhKQ0rf/1I
 3SDqw+Vsz4+sQCq8bSJpa8ZkUHseMhk9FD4PLRSzAzIEOdBGBTa3A8AnfITGQx5yxHJh
 iqsvFU/2TqjgX4w3fSFTmpKVXJvJwkSuEsWzWODufvmTC6J5XnhqiRsHOBS2vJG1EuYg
 X42w==
X-Gm-Message-State: APjAAAVEL7H2hsRiayQOU7ZMi9P1/gqfGmPJQ/e8Z9SIuCVLL6Iv9hIb
 WxxZC0ryIZSsRlSHU9ofjya84Q==
X-Google-Smtp-Source: APXvYqzpBpaNw1HlOn1Jl1PNM6gfssXbj4UcMPr8NMqOQJ/Czl/iUduxSNiZP+V231WzJ3FtdGIAng==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr26198331wru.27.1566893668403; 
 Tue, 27 Aug 2019 01:14:28 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f18sm11911792wrx.85.2019.08.27.01.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 01:14:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [PATCH RFC v2 0/8] drm/bridge: dw-hdmi: implement bus-format
 negotiation and YUV420 support
Date: Tue, 27 Aug 2019 10:14:17 +0200
Message-Id: <20190827081425.15011-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_011433_057561_BE75CDA7 
X-CRM114-Status: UNSURE (   8.41  )
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

This patchset is based on Boris's v2 "drm: Add support for bus-format negotiation" at [1]
patchset to implement full bus-format negotiation for DW-HDMI, including YUV420 support and
10/12/16bit YUV444, YUV422 and RGB. The Color Space Converter support is already implemented.

And the counterpart implementation in the Amlogic Meson VPU dw-hdmi glue :
- basic bus-format negotiation to select YUV444 bus-format as DW-HDMI input
- YUV420 support when HDMI2.0 YUV420 modeset

This is a follow-up from the previous attempts :
- "drm/meson: Add support for HDMI2.0 YUV420 4k60" at [2]
- "drm/meson: Add support for HDMI2.0 4k60" at [3]

Changes since RFC v1 at [4]:
- Rewrote negociation using the v2 patchset, including full DW-HDMI fmt negociation

[1] https://patchwork.freedesktop.org/patch/msgid/20190826152649.13820-1-boris.brezillon@collabora.com
[2] https://patchwork.freedesktop.org/patch/msgid/20190520133753.23871-1-narmstrong@baylibre.com
[3] https://patchwork.freedesktop.org/patch/msgid/1549022873-40549-1-git-send-email-narmstrong@baylibre.com
[4] https://patchwork.freedesktop.org/patch/msgid/20190820084109.24616-1-narmstrong@baylibre.com

Neil Armstrong (8):
  drm/meson: venc: make drm_display_mode const
  drm/meson: meson_dw_hdmi: switch to drm_bridge_funcs
  drm/bridge: synopsys: dw-hdmi: add bus format negociation
  drm/meson: dw-hdmi: stop enforcing input_bus_format
  drm/bridge: dw-hdmi: allow ycbcr420 modes for >= 0x200a
  drm/meson: venc: add support for YUV420 setup
  drm/meson: vclk: add support for YUV420 setup
  drm/meson: Add YUV420 output support

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 251 +++++++++++++++++++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c     | 164 +++++++++++---
 drivers/gpu/drm/meson/meson_vclk.c        |  93 ++++++--
 drivers/gpu/drm/meson/meson_vclk.h        |   7 +-
 drivers/gpu/drm/meson/meson_venc.c        |  10 +-
 drivers/gpu/drm/meson/meson_venc.h        |   4 +-
 drivers/gpu/drm/meson/meson_venc_cvbs.c   |   3 +-
 include/drm/bridge/dw_hdmi.h              |   1 +
 8 files changed, 466 insertions(+), 67 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
