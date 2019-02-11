Return-Path: <SRS0=yrQE=QS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B0EC169C4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45892070C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Feb 2019 20:54:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qkc+ocjk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VVrBNx7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45892070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uq43tqWtVnsSEETFpM+20ywKr/ZR9xfXSjFx1F34HUU=; b=qkc+ocjkv2GIOZ
	Y5kjng8/7U4Q1H7mk33p4jC4s5vpaVexcCEuQEmc13kfNdmfW2d6BRnyo6V8PheQqYXNz26jh3nXW
	f8ysIW8b6eZT27DT4wiVcGTAp+EZ2yKc4saXoL9qWacmjmg1AspLbEtR0EQTMr14KuE1f+H3f4kwo
	FcawQGtx9btyuUxWZQASdt26Kow3MCDhDslQ/n5jy7uRPDskhY72k6ILzllDAYCvjofuruieC/Mut
	9yTGivnua241rNqRZDKfBImdB3tzO9dWb7E+RgClY9ZjC4wZUDVN53Zt4TSSr6iXetmLev3pM/pdc
	zrZnxku/R/JORgJ+XXAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtIb0-0003ao-WD; Mon, 11 Feb 2019 20:54:31 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtIar-0003Tl-7l
 for linux-amlogic@lists.infradead.org; Mon, 11 Feb 2019 20:54:23 +0000
Received: by mail-pg1-x543.google.com with SMTP id d9so136397pgl.1
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Feb 2019 12:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=Wfc/DSrRvPXv7xnf5yfxBlKgTT0jWFdmHZK7MdXTdjI=;
 b=VVrBNx7+AkHMfVB+SX3uITW9fVyF1bs7wE0MYGi2OTHloJoRtFBRvJK8xo7FmSwTJY
 ZSRUOnFoYeaJAQmS4hlbYa/rNlPH73CFF4hhsHtlyYChHykoDmjVxME3smpI9It817D2
 SI6wMhnxqffiuuwsV8t6zUB3lNXF8vC9rSfiodMg00E/NzQIlHkCgTqHdg1/mtKpJCMP
 Q0wh3cuzG/CGzBuZNqqVJ7/Guf5VEPwcsgctbQd1tEjK3adKZwBfWZTVLCCSQE280ecD
 4wFPNNnKyWkEbR5FAWbUmpuaK+iCWXR3nSfBrCRVcnQ0Htuy40W3W2PCHD2P1lF4qIt4
 cjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=Wfc/DSrRvPXv7xnf5yfxBlKgTT0jWFdmHZK7MdXTdjI=;
 b=LE0CNwYnSF3hQCUquPpec2CCpgC1qHohua9DZ6qitAShm/zK77Ltx5yTbW560C5sMl
 ELgnQSmFVUYiCg3aZehpnWVWLgKMxY7Ks6wUZkJeI0d9WAc8aJwh3w3xLb4uusqiQoQJ
 hgjmligBGJ6R16FXkca2CZZuW2rR4zmGP4NMnVs0DpZcWYUFEyRwkC/QrUvdP0+aRXGN
 OuK6+dvQloMAMI17cU/r541IOrfmU2oR2Was7DxSrwWv1UHVPyVQQHYD2RDRCBvev1Gx
 SvqU3Td/Z1cN9HrJ5uJ7WCNXoEag8d8UdWY36nUBkd+olTaKZ341eJdLbsLwO3WSoXAn
 WjWg==
X-Gm-Message-State: AHQUAuZ0FjnlrlY2JYdGy37ziQO6Z7SJkQCMfEA85aMnAEZT05+CQKTC
 2GhRoEOeKF0qn4OU9ViUemZvcQ==
X-Google-Smtp-Source: AHgI3IalDYDqgtX7TE+6YlzK7l8eqEosZ8U4TrvFglU8QnxJzdenhZu5a5zSPMp5+t8GF4DHKNY1jQ==
X-Received: by 2002:a63:b24a:: with SMTP id t10mr131795pgo.223.1549918460218; 
 Mon, 11 Feb 2019 12:54:20 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1d1:285e:6b85:3bfc])
 by smtp.googlemail.com with ESMTPSA id o2sm15942014pgq.90.2019.02.11.12.54.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 11 Feb 2019 12:54:19 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] arm64: dts: Amlogic updates for v5.1
Date: Mon, 11 Feb 2019 12:54:18 -0800
Message-ID: <7h8symdp1h.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_125421_280659_9EC8EA3E 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to d3aa4ce87348b59d7b240ae356559313a8db2f58:

  arm64: dts: meson: add g12a x96 max board (2019-02-08 09:44:06 -0800)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.1
- new board: G12a-based x96 max
- G12a: add peripheral clock controller and clock measure support
- s400: fix SD/eMMC max rate issues
- s400: audio: add sp/dif in support
- GX: support simplefb

----------------------------------------------------------------
Jerome Brunet (10):
      arm64: dts: meson-axg: add spdifin
      arm64: dts: meson-axg: s400: add spdif-dir codec
      arm64: dts: meson-axg: s400: add spdifin to the sound card
      arm64: dts: meson: s400: enable sdr104 on sdio
      arm64: dts: meson: s400: fix emmc maximum rate
      arm64: dts: meson-axg: add efuse device
      arm64: dts: meson: fix g12a buses
      arm64: dts: meson: axg: add clk measure support
      arm64: dts: meson: g12a: add clk measure support
      arm64: dts: meson: g12a: add peripheral clock controller

Kevin Hilman (2):
      dt-bindings: arm: amlogic: add amediatech x96-max bindings
      arm64: dts: meson: add g12a x96 max board

Maxime Jourdan (3):
      arm64: dts: meson-gx: Add canvas provider node to the vpu
      dt-bindings: meson: add specific simplefb bindings
      arm64: dts: meson-gx: add support for simplefb

 Documentation/devicetree/bindings/arm/amlogic.txt                        |  1 +
 Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt | 33 +++++++++++++++++++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.txt                    |  1 +
 arch/arm64/boot/dts/amlogic/Makefile                                     |  1 +
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                           | 30 +++++++++++++++++++++++++++---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                               | 25 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                       | 28 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi                              | 62 +++++++++++++++++++++++++++++++++++++++++---------------------
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                                | 23 +++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                              |  6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                               |  6 ++++++
 11 files changed, 192 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/amlogic,simple-framebuffer.txt
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
