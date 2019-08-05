Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0840C32754
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8309F20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 13:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l7nyeyOJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VKzwCZsY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8309F20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AidVGTjnJ6ccJMlsfpuw2sA1ZT4Dd/XU+lfo5icUhtk=; b=l7nyeyOJfmdjUd
	sEoL7y3bgYDUTsihIKwj83ADx9vlVZT9E9EYSokJ+RTPabqC85XKQ6UNNBS1Bd4jVhkKFfsCFGOIr
	zwJxWMhukqlKOjNalrX5wfWeYZ5OVGAE4cyv5GFls5r/h2UTTOhYm1KbCdF+LMETNpTNCD5pWUIGU
	nn8d3ymRbS40TIeY1snopdBxlhkJr2XTsepQX+wvD3Ek71xOLF5dzNfLZD1QlCLk1d2DOhsRNvL5B
	zr1r2UfXc9Ygjz8uK1WXNSY4ro0j/xPxvG7gapdY5BodUekIPlIYgG0gFL4Khr+jHUYU39VQrpr0n
	aGKiKmLH8W0r08bxrMsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hudEc-0000Zl-VU; Mon, 05 Aug 2019 13:41:10 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hudEZ-0000Yv-SR
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 13:41:09 +0000
Received: by mail-wm1-x344.google.com with SMTP id g67so68952266wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 06:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3FggyWEk7iag/gjHOv9EP41vPE6V1cAArTG8uYr8XE=;
 b=VKzwCZsY5ujaTHwBT2AdabMwz/1j90BaDaa/VIhk7cwlJO/n264xa2vUQOchFf6hn1
 iu24xUGNF3exhSvC8sOfcU/WP7MHEpYz/JQi5vY4N0rpFRQ82yUIc7fT6QjSg4sLApfW
 AFtp86CS+jmu0DbCb5QFeDCGFqmNTB0si0PY8C4SC39LwW5U15uabg5vrEjne46KEZIn
 L0vhnpzT/HAVWyLSZ88RB448nF5GfiMbcwdmRxymXqDL7tAB/BT8Bp2NaS+NI1QbEYFg
 5zNSN1uU0r3p79VVyvXzjFIKCtqRQOHtpk4qkXtx1dPs1l1ks7l5kqR4qlp9VVFwooHF
 yjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3FggyWEk7iag/gjHOv9EP41vPE6V1cAArTG8uYr8XE=;
 b=OCNGzCSUGGLIF77+Qk4/N8UKrfu2wGGxZj8Cvl2I+ApLLq1+2PvcOKQRr2zgz4PU/s
 NEGzMmh/Lp2sB2epEJcASO79IrEnn+ssHr+Atlnm4cec/2uOMWchgGwFfR3QYGGqqXk6
 Xgr9quAF0uqW3XNhJV/cXwGqD1kqTewgXBbATHfi9jjqzB1LRX11PkKJFxaGLrlVxOuI
 GpFBQL9V6v5N+A6+QT3QxTi4Nt0jNZlWMCeA+XICePrJSUEEU/wsxvFVBQCflQsiP3uf
 mwZXFqlxQQUS+mHFv2m1obgDl1J21d/Hh+Ppg3Jfm6RYmnBT+Y66YW2t+Ef3/7NTB5Ft
 Nq7A==
X-Gm-Message-State: APjAAAVrYdWS7r6L4I66Oq9CQ98aHAVPDpJCpsS5v6xrXaqgYFL2AX4+
 hYgeswQlANjw0v4MAWkPYIb6Vg==
X-Google-Smtp-Source: APXvYqwF6PGarFPBjk3nNJY6M7XmmSODW9OY5CMXn6Qo4jDotnjtLtsU/m8nGsyE18j0hM+jq4UcTA==
X-Received: by 2002:a1c:5f09:: with SMTP id t9mr19859634wmb.112.1565012466102; 
 Mon, 05 Aug 2019 06:41:06 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm99040534wrn.11.2019.08.05.06.41.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 06:41:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/8] drm/bridge: dw-hdmi: improve i2s support
Date: Mon,  5 Aug 2019 15:40:54 +0200
Message-Id: <20190805134102.24173-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_064107_976446_E7143DC1 
X-CRM114-Status: UNSURE (   8.71  )
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The purpose of this patchset is to improve the support of the i2s
interface of the synopsys hdmi controller.

Once applied, the interface should support all the usual i2s bus formats,
8 channels playback and properly setup the channel number and allocation
in the infoframes.

Also, the dw-hdmi i2s interface will now provide the eld to the generic
hdmi-codec so it can expose the related controls to user space.

This work was inspired by Jonas Karlman's work, available here [0].

This was tested the Amlogic meson-g12a-sei510 platform.
For this specific platform, which uses codec2codec links, there is a
runtime dependency for patch 8 on this ASoC series [1].

[0]: https://github.com/Kwiboo/linux-rockchip/commits/rockchip-5.2-for-libreelec-v5.2.3
[1]: https://lkml.kernel.org/r/20190725165949.29699-1-jbrunet@baylibre.com

Jerome Brunet (8):
  drm/bridge: dw-hdmi-i2s: support more i2s format
  drm/bridge: dw-hdmi: move audio channel setup out of ahb
  drm/bridge: dw-hdmi: set channel count in the infoframes
  drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
  drm/bridge: dw-hdmi-i2s: set the channel allocation
  drm/bridge: dw-hdmi-i2s: reset audio fifo before applying new params
  drm/bridge: dw-hdmi-i2s: enable only the required i2s lanes
  drm/bridge: dw-hdmi-i2s: add .get_eld support

 .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 20 ++-----
 .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  1 +
 .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 59 +++++++++++++++++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 37 ++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 13 +++-
 include/drm/bridge/dw_hdmi.h                  |  2 +
 6 files changed, 107 insertions(+), 25 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
