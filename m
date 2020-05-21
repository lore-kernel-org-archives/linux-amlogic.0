Return-Path: <SRS0=Ru2C=7D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EE0C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2020 21:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED25A204EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2020 21:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qLP10Z9M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VtcOVpia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED25A204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:To:From:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bzKTe3lmDjUTemJ2gj6GUZvAAR+HtGOOpqSA3dHNjnI=; b=qLP
	10Z9MD/Ym/b9mspvfHbpY+PqBmZjEbp9envGbtoQ8U+KIrWvF1IryX/8V5BwzGUOFYajAzH44tFCB
	OhSxXvknefonvMxujmFgGXUGVKGOtWGov7wQP/TKs+zZnB7KcndPzs03ODwKawyxlF0mD3ufX9W39
	j0wZ+ijXrry7L8FOp8igfEfV7FBSw3P99U68FsIwFgLJWyrUGqIXOwHcTcnJrLwf4Dli163AVUQ78
	dQVkomQb/zOv6jggygfrDxiFF7UIEp2rtAQ4XJE8y6RaiungBMJd5/gWam6rJtCE8rNipCosPd1di
	rKXutAmA+ZHbDlMPYrrtZ0YrIw80AAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbswF-0000hD-NN; Thu, 21 May 2020 21:41:15 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbsvz-0000Um-Ne
 for linux-amlogic@lists.infradead.org; Thu, 21 May 2020 21:41:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id u22so3481292plq.12
 for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2020 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:to:cc:subject;
 bh=bOnJIOvUnam8H8BRh+PPzqUBnIwH9OjIYX8gklAA7MA=;
 b=VtcOVpiaTKaSRMPiIvMpjFH5c/Yj1ScoGCCWt6eLy6ftei9KVbTahGq77YAu26YwZd
 OyrOYXdE4IbgGS+R12EMTUelN/8TZoUHKFYMw6s0jOuAZsGxHSek+j7YywdD6p3zi/JG
 S5Nh7sPIphMOX9VRjXUh07NnSPrZ9ljHhHOVbsbu/2fauoCBzynEseSVn/AY/Xyv7XBE
 2KzX2JHyjNA6HsDu5Aw714IXbLtoGmC39K895NbtWi5sLQTSc0fefQP1ayDQVUiaJGJC
 osfFbp8UeoSpS1TFge5q588bC2U57+2eoJUM6KUdrJOlg7Gxh5qtkVLsYUoAs9NM50Xz
 iugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:to:cc:subject;
 bh=bOnJIOvUnam8H8BRh+PPzqUBnIwH9OjIYX8gklAA7MA=;
 b=TF7BT1kSX7Zzi4K7WqdiIQ1GRFMVGSsioCoZXPfolH9LEQILeQhsTqilmmXRNWlOlU
 rgMSYmECvFGYHSkwAIfPcaMx9rVpvaPrPLBb5qwYnpiT3gS4wLlciRWtdwy3L5PEsy4V
 YNUbd57B2FJ9LaWoCoU49QhmhftbM3cgaf2X3ctWp8wKBHdZODSaU457pyeCJeEpD/Vp
 FLrEL+BVNXSTuM9UEFeAnoI/EvFDwl2AxjQJIIpJVW5TL+1Z0FSFtmaZ1rJEl2pNkCOz
 VTNOMMN87vqDVgpLAr8P+uekUkxtngnKabk9PeOSuGiX0yWjiCNnnm+uCwx6qFffnFeS
 +Ekw==
X-Gm-Message-State: AOAM531aCY7kBJVgLGKoTkwHUSjgOjDdBC2iHtAZJix8FfWTYYtOegkV
 XqnHdRSzyNgg+Yp8uZoGsTW0OQ==
X-Google-Smtp-Source: ABdhPJxbiEs9iDKVrb4/Et0X0Y1f+kmkdeweONoQyMC8ppzsLf4sCbmvGRgjGAqNXuF5m/OLumbYGQ==
X-Received: by 2002:a17:90a:d3ce:: with SMTP id
 d14mr638042pjw.46.1590097258837; 
 Thu, 21 May 2020 14:40:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id gd1sm5253935pjb.14.2020.05.21.14.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 14:40:58 -0700 (PDT)
Message-ID: <5ec6f56a.1c69fb81.fc5d5.9ca6@mx.google.com>
Date: Thu, 21 May 2020 14:40:57 -0700
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL 3/4] arm64: dts: Amlogic updates for v5.8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_144059_771634_B4A44202 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Note this PR has a dependency a stable branch from the reset tree
(already queued for v5.8) which used by some new audio devices added this
cycle.

Kevin

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 0b928e4e412b1eb9e79e02cf3580b9254d338aae:

  arm64: dts: meson-g12b-gtking-pro: add initial device-tree (2020-05-20 14:43:48 -0700)

----------------------------------------------------------------
arm64: dts: Amlogic updates for v5.8

Highlights:
- new boards :Beelink GT-King Pro (G12B SoC), Smartlabs SML-5442TW
  (S905D), Hardkernel ODROID-C4 (SM1)
- audio: support for GX-family SoCs
- audio: internal DAC support
- use the new USB control driver for GXL and GXM

----------------------------------------------------------------
Christian Hewitt (9):
      dt-bindings: add vendor prefix for Smartlabs LLC
      dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
      arm64: dts: meson: add support for the Smartlabs SML-5442TW
      arm64: dts: meson: add ethernet interrupt to wetek dtsi
      arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
      dt-bindings: arm: amlogic: add support for the Beelink GT-King
      arm64: dts: meson-g12b-gtking: add initial device-tree
      dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
      arm64: dts: meson-g12b-gtking-pro: add initial device-tree

Dongjin Kim (1):
      arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4

Jerome Brunet (14):
      arm64: dts: meson: kvim3: move hdmi to tdm a
      dt-bindings: reset: meson: add gxl internal dac reset
      arm64: dts: meson-gx: add aiu support
      arm64: dts: meson: p230-q200: add initial audio playback support
      arm64: dts: meson: libretech-cc: add initial audio playback support
      arm64: dts: meson: libretech-ac: add initial audio playback support
      arm64: dts: meson: libretech-pc: add initial audio playback support
      arm64: dts: meson: gxl: add acodec support
      arm64: dts: meson: p230-q200: add internal DAC support
      arm64: dts: meson: libretech-cc: add internal DAC support
      arm64: dts: meson: libretech-ac: add internal DAC support
      arm64: dts: meson: libretech-pc: add internal DAC support
      arm64: dts: meson: g12: add internal DAC
      arm64: dts: meson: g12: add internal DAC glue

Kevin Hilman (1):
      Merge branch 'reset/meson-gxl-dac' of git://git.pengutronix.de/pza/linux into HEAD

Martin Blumenstingl (1):
      arm64: dts: amlogic: use the new USB control driver for GXL and GXM

Neil Armstrong (7):
      arm64: dts: meson: fixup SCP sram nodes
      arm64: dts: meson-g12b-ugoos-am6: fix board compatible
      arm64: dts: meson-gxbb-kii-pro: fix board compatible
      arm64: dts: meson: fix leds subnodes name
      arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
      arm64: dts: meson-sm1: add cpu thermal nodes
      dt-bindings: arm: amlogic: add odroid-c4 bindings

Tim Lewis (1):
      arm64: dts: meson: S922X: extend cpu opp-points

 Documentation/devicetree/bindings/arm/amlogic.yaml           |   4 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                         |   4 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   |   6 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            |  11 +++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi                   |  32 ++-----
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts        | 125 +++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts            | 145 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi      |  18 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi            |  15 +++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts         | 377 +-------------------------------------------------------------------------
 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi             | 423 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi                  |  22 +++++
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi       |  78 +++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi          |  98 +++++++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    |  23 ++++-
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts           |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts       |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts          |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi         |   2 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts       |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi            |   6 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi                  |  23 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts |  73 ++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts   |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts    |  80 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-p281.dts         |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts     |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts |  77 +++++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts  |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi        |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                   |  79 ++++++++++++----
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts          |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts           |   4 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts           |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi                   |   7 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi           |   4 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts          | 402 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts             |   2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi                   |  24 +++++
 include/dt-bindings/reset/amlogic,meson-gxbb-reset.h         |   2 +-
 45 files changed, 1751 insertions(+), 464 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
