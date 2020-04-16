Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3744C2BB55
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 817E6206B9
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 12:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qzJCk+DG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GSDX3VHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 817E6206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sLms4kNw7mvzpa90fErlJbOd6/hP1CF4DqDtbV0ddmk=; b=qzJCk+DGtwGyVr
	jWxdcQlWWhQxVIgCby8SCXkobOHz+Pjenn2HQYPb5Bnen+eoUewMlJB+6Igi5Wpd1r6MOnCqUjAn+
	B9Ccwg1LQZGIbMm/dCKYJHiA+NRvYt9mTY+1VBn+Pq3Pgv72xDvQfMx3BgFyNALXzhhJANDs2ODC6
	7kzvtsXsKVXuyAoLWnv1PvG8QUe/JwgAyoubP99CnIWOrh27I0YAUaeQbumUGMWf0mdxzTSBGv1QH
	vz1ZneQyd2IyAJpXCEhax7fJkbgYbvmIYtAUr862IQETXyfXkwFFxjFeamgSIfj1sFOYugZQwhV2e
	8FYV65tY/RNeD7g//EXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP3UG-00069m-S9; Thu, 16 Apr 2020 12:19:20 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP3UD-00067l-Ha
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 12:19:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id k11so4576632wrp.5
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgQlCVQO9pBNsgy45GkR+QaBMwuO1ye6FK+8ZBQuqLg=;
 b=GSDX3VHHG88xM3mtByW3kylrfF9uR3ho2qomZj3hjn2IOBzWlUBOxC7de0eg/Jb9Si
 b5g7SydZhavPRYDU8BJtqEIn7R32o9rtDCfEaPXvZ/Z/5ZNC5R85NX59OGBHagfXDr1U
 BGvKtUlz0uba18NEmOVXtvie0gmwfrVHodVl72JLWPq50dd1/ndLBCd1uaJzfHDH9nsB
 juGRKkvJ6n7gJiluBYO+oYfaHjSR4Dg68EN5ntZ05gHzPDJKpmTvSp+zyZ1ogiD0iNUx
 vI546DxmjqYYm/6GZwZVbjOVRUXXfh8Fpha0JHs1YlyRC78WHgH4n+HZ0TfGzSUuukFn
 4URw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cgQlCVQO9pBNsgy45GkR+QaBMwuO1ye6FK+8ZBQuqLg=;
 b=EiCpFnCY8RflHrQC+zL+mzlMn3lQEvdf3guRL9C2Z/sEwrt1v6j1CcmtFAn6q+dEuX
 6GwNmnB4qmOne4rBXN1A1rwLujAS0W9UZZOoFbqWxN8XxPWiP16Lk3YCxv8rKxsMgf3a
 upWd3ucWvkLw8/z3nqTzGrlIsWsAeIGO608VRDSBB7D/qlTS9kK+Si92qpbJ2aW1n6JZ
 F1Y7krqQ7nxPVmZGrs4WL+zB+q9NI45qi/SA2jBJaL+acy2Wk/DG7yEDQhHiVHMz8jsB
 LK3c2FQOFMJAwvEcKW5UFJqWShTcMJ8CsdR3kZx1gRn8Fou6ozoeI5eHE6+UuG4G6qsy
 DUSg==
X-Gm-Message-State: AGi0PuZdJebhJLJs8ALsmi4N3bSuzvgaZXsNi1ngXu0ukNER0xFAiLB8
 kIpZqX0uNRxLL+Tap0D1WO/2iA==
X-Google-Smtp-Source: APiQypLTj7n231YjW9KZveUAuWshsg0VFn1BjUl/fM2Nz8xWJAbfeAZSMC/2cUq3G4OR7PkfurWwAg==
X-Received: by 2002:adf:e7ca:: with SMTP id e10mr12384684wrn.18.1587039555206; 
 Thu, 16 Apr 2020 05:19:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 i13sm22035602wro.50.2020.04.16.05.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 05:19:14 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v3 0/8] usb: dwc3: meson: add OTG support for GXL/GXM
Date: Thu, 16 Apr 2020 14:19:02 +0200
Message-Id: <20200416121910.12723-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_051917_584024_85802A04 
X-CRM114-Status: GOOD (  15.55  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The USB support was initialy done with a set of PHYs and dwc3-of-simple
because the architecture of the USB complex was not understood correctly
at the time (and proper documentation was missing...).

But with the G12A family, the USB complex was correctly understood and
implemented correctly.
But seems the G12A architecture was derived for the GXL USB architecture,
with minor differences and looks we can share most of the USB DWC3 glue
driver.

This patchset refactors and adds callbacks to handle the architecture
difference while keeping the main code shared.

The main difference is that on GXL/GXM the USB2 PHY control registers
are mixed with the PHY registers (we already handle correctly), and
the GLUE registers are allmost (99%) the same as G12A.

But, the GXL/GXM HW is buggy, here are the quirks :
- for the DWC2 controller to reset correctly, the GLUE mux must be switched
  to peripheral when the PHYs are powered up.
- when manually switching from Host to Device when the USB port is not
  populated (should not happen with proper Micro-USB/USB-C OTG switch), it
  makes the DWC3 to crash. The only way to avoid that is to use the Host
  Disconnect bit to disconnect the DWC3 controller from the port, but we can't
  recover the Host functionnality unless resetting the DWC3 controller.
  This bit is set when only manual switch is done, and a warning is printed
  on manual switching.

The patches 1-3 should be applied first, then either waiting the next release
or if the usb maintainer can provide us a stable tag, we can use it to merge
the DT and bindings.

Changes since v2 at [2]:
- Removed first 6 applied patches
- rebased on usb/testing/next
- Fixed dwc3_meson_g12a_usb2_init in patch 1
- Fixed leftover usage of dwc3_meson_g12a_usb_init in patch 1
- Moved post_init callback before child node probe to avoid bad dwc3 init

Changes since v1 at [1]:
- Fixed DT bindings to take in account usb2-phy2 on GXM
- Added comment in patch2
- Fixed patch 5 and moved fix out
- Collected tags
- Lower DT patch changes, switch p20x-q20x port B as OTG by default

[1] http://lkml.kernel.org/r/20200324102030.31000-1-narmstrong@baylibre.com
[2] http://lkml.kernel.org/r/20200326134507.4808-1-narmstrong@baylibre.com

Martin Blumenstingl (4):
  arm64: dts: amlogic: use the new USB control driver for GXL and GXM
  phy: amlogic: meson-gxl-usb3: remove code for non-existing PHY
  usb: dwc3: of-simple: remove Amlogic GXL and AXG compatibles
  dt-bindings: usb: dwc3: remove old DWC3 wrapper

Neil Armstrong (4):
  usb: dwc3: meson-g12a: refactor usb init
  usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
  usb: dwc3: meson-g12a: add support for GXL and GXM SoCs
  doc: dt: bindings: usb: dwc3: remove amlogic compatible entries

 .../bindings/phy/meson-gxl-usb3-phy.txt       |  31 --
 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  42 ---
 .../devicetree/bindings/usb/dwc3.txt          |   2 -
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |   3 +-
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |   3 +-
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |   3 +-
 .../amlogic/meson-gxl-s905d-phicomm-n1.dts    |   4 +
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts |   4 +
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |   4 +
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |   4 +
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |   3 +-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |   3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  45 +--
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |   3 +-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxm-vega-s96.dts   |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   7 +-
 drivers/phy/amlogic/Kconfig                   |  12 -
 drivers/phy/amlogic/Makefile                  |   1 -
 drivers/phy/amlogic/phy-meson-gxl-usb3.c      | 283 ------------------
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 188 +++++++++++-
 drivers/usb/dwc3/dwc3-of-simple.c             |  30 +-
 24 files changed, 246 insertions(+), 442 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
 delete mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
