Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF49C10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6792083D
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 12:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SzIz8cEC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FfBTSa+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6792083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GrJ+LckLFCzNSmP3kIQ5Q1RbUufEF9S8/V5ykSA02fo=; b=SzIz8cEC2v1GL2
	ebPWBUQXmakHg9OcSTczhomuFvX2KWojL+x9LZVUuJScLwKs7jkKZwCN0d6Iq5FbSySZQKnutEw6y
	y6ehU8I8NpnxTNTmazA+31IREvhbple29Wy5NSX7Ss7Jeb3aVBFoMFJENQcCxY8neZw9sFtvS4bgx
	YT8yKVCDXuLSJfk1MgpEcoyirHi/V3gjXx97dHS6jHPNDtefhnOhM6eeUh2fncT7036H3ZxpW5cET
	NC1Lxtekh3/QT1/hy9b2rttO0WO+IWvKday85cqkUZkSVTRC8opmlIyLvNKChTrmBnwr9uSEd1AQo
	SlhiwW1UnB7Oc7GZUncQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH68f-0000Zq-Bp; Thu, 18 Apr 2019 12:27:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH68U-0000OU-0I
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 12:27:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id g3so2738903wrx.9
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 05:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9eboMfFTp0flkemmTJjhK8is1SRUoqUCaMOvhGUXhug=;
 b=FfBTSa+du3ERXocDZ4ekzbJrSxzAa5Ro16ukXiL+GcQhQyXCb0LEalP39dyp3CjGCL
 KPw3JtDZJfOYaWCRDz19DxeDgAiYSCniYYk0+yDA8rgX9EdWpOjZRAjWAXZJNl+JnFfy
 vYLQhCUmAuU1FF0rY1g0LTCgqnHJSvtYJL2k9Ix6g0TnGvj9GULquXoGEe9ehJQRBKRw
 KQCcVZR7PQ8lkbAlKxzYFboumm2vdaYNMzDut/2l5TshWm14CG5GCzlRGenLuJ7fx6uH
 k1LcAsp1vxXAm1N9JLTNeeCzBOGq5Q0Iwhwhs1RJ7DHhKIE5OLgluMPdhaFJgHota2oC
 q/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9eboMfFTp0flkemmTJjhK8is1SRUoqUCaMOvhGUXhug=;
 b=Qtizzybm+X1F3jlQDEj97HfDbjusr49/fXWY+wSYvbUQOwQzbYGq209WIb1q5G7n1p
 tlCGu6jyuXAA+pZDoXTdL/QXE0/nm67e1X0IzvDSqTw3WwXyT3l8UnI62Lrk+5Gty4cW
 xCnWzvfDXAX7KZzSWD/5+8j2gnVpFYhyMpoXUGBk+BojmzJDQDcaSCpxZB4npwrzubWn
 VVxO5udBVYe6oOXx+YNJmoGvuHJvwzHJTweXZd2Pf/PEzuF6MHOAHRXgNMaj52rOrRUD
 T9XDarbqjV4NIAghcr5Xz0lmSXsEAzEsqluRU3MuKH83eJscm5y0MLykLhbr8Wr+VhJj
 AylA==
X-Gm-Message-State: APjAAAVHVcfz9R16KiNbi06gqpkRMILwY+yBRiGV2KoREzTD/8EqXlF0
 TMBmjcZ3toNuSZys5EW0YMCqdg==
X-Google-Smtp-Source: APXvYqyPEqM58O7ljaAPBE6bcldBRkQXUtMCsspe8+UqFdVrJvhwSEUBvVZLzZU2RF6S9jF2iuKavQ==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr5924157wrj.66.1555590444085; 
 Thu, 18 Apr 2019 05:27:24 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z14sm1510110wro.81.2019.04.18.05.27.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 05:27:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/6] arm64: dts: meson: mmc clean-up
Date: Thu, 18 Apr 2019 14:27:08 +0200
Message-Id: <20190418122714.30805-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_052726_106104_AA1CDD51 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patchset is bunch of clean-up found while debugging meson mmc.

* The first 2 patches address the libretech-cc which actually uses 1.8v
  eMMC modules.
* Patch 3 is a pin bias fixup depending on mmc pins.
* Patch 4 lower the mmc max frequencies on gx chips. It was not easy
  to spot but, according to the datasheet, the maximum UHS rate
  supported by these chips is 100MHz (SDR50). This explains why we
  never really managed to get a stable SDR104. SDIO is limited to HS.
* Patch 5 adds missing pinctrl definition on the vim2
* Patch 6 remove hs400 from the supported modes of the vim2. This mode is
  mode reliable enough with HW/SW ATM.

When/If the series on the mmc drivers goes through, I'll send the
following updates:
* Push odroid-c2 eMMC max rate from 100Mhz to 200Mhz. With the new tuning
  method, this mode is finally stable on the OC2 (so far...)
* Enable SD UHS modes on the odroid-c2
* Enable SD UHS DDR50 on the nanopi k2

Jerome Brunet (6):
  arm64: dts: meson: libretech-cc: set eMMC as removable
  arm64: dts: meson: libretech-cc: switch eMMC to 1.8v
  arm64: dts: meson: fix mmc pin bias
  arm64: dts: meson: fix mmc v2 chips max frequencies
  arm64: dts: meson: vim2: add missing clk-gate pinctrl
  arm64: dts: meson: vim2: remove sd hs and hs400 modes from emmc

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts |  4 +--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 31 ++++++++++++----
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  4 +--
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  5 ++-
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 +-
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  2 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  4 +--
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  4 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 35 +++++++++++++------
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 +-
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  | 14 ++++----
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  2 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  4 +--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 35 +++++++++++++------
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 15 ++++----
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |  2 +-
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  4 +--
 17 files changed, 109 insertions(+), 60 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
