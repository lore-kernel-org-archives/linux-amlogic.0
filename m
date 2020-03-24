Return-Path: <SRS0=WAM1=5J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A890BC4332B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEC4208C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2020 10:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwP0/Ysq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VJDW48n7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEC4208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sm34EKvhmsMTqPKw/FRkwmp/AD6gn7yZ9aHx1In1vU0=; b=OwP0/Ysqr17AKn
	IWGh80YNez1FWXYZc1c8x/CLsuDyIUc1sD/sdmHpOyh1oBbKeWez/mye3SoDXrtMVdEkzJM9onSTt
	tOSwGhSjwT3+BST9OBm7DQfuSfbUSJquC0t4/bg2u4LpDAo72wTRPXUwq3SwnDT+iTfHcoo/+W2gJ
	p+yJp+Or+Ju4KYKgGidjdB4622jMSY4eXEgtPuvhA50O/GUbBtEXD8OwWJDlqpem6Hhsy31qK13/g
	nzTYwaVb6yjeRYEzugfz4EZhJrm6ngWc9zEgzlC5paTzte2pWC/XR0vlRiCGTAUTcegldt2nA0lhn
	/gLfTXzeRjfmUIbW5NIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGgfs-0001sR-IV; Tue, 24 Mar 2020 10:20:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGgfo-0001qE-TD
 for linux-amlogic@lists.infradead.org; Tue, 24 Mar 2020 10:20:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id a25so20718998wrd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Mar 2020 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHjJI7aShrh91OoV00QHF3f8tRyA7jklYuLyoaLdZpU=;
 b=VJDW48n7k0ddcp7+Y1+gejwqC9PsCLrSpTZ/9jdmEwACaw5iwrnqY806ZRC+0OlwO9
 3oC8uo/6CWdGg+WAI7bBQjVzQPiPbD1gJXoVYQzvIWBqoKIC7qs0YkR5FtIlMd4ZH2b9
 hMdrR/e2DLI3EPdIi7aTE21K50ivfVFcRs/B2/NcPsJAr8QRdAS0h6PIQ3X9RpKu54/c
 YFCeYN464ihgX9YzRe/YLyMSIIdXkA667q6ZD40Yh7ra5keHqkPffOV7DjDwW9Uiw2kb
 6ExvPUJv7i4DwgeoJGoKN88gGVoxBWoJtTRDlwDFJ3etJaGoP0zemtbE81+TExeKzoQS
 wSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RHjJI7aShrh91OoV00QHF3f8tRyA7jklYuLyoaLdZpU=;
 b=f54z4exp5ROwhzNAbBf1sE/6T9ShkG1RkhQ01x6IjevQCTzeMWIVV8/mKr+auOWpla
 8N1SHCo95QIp2I84N81dQMxi2REIr4ANjSMkkP3SkvTMiszg6LwU+yJobXrrpfms4e3s
 Ee+LpHuOHyY2C8Wfg5q7n5lMELYW7Vx3UFbNKByii0NRAUwtpPsnHtb8RV06czWRmefr
 sFUi+I3YmfroCPB1Q8vXjB/h6JGX8XFuy0bUaMnTglmlfSQCVpanW8arkz7nAO6dvU4Y
 YdLbhKKNZZ1zJ2DHRkC0qKE6fQDFDIZD9RaF15Ze0b/CpiTGptgbNy+Rn0r7yIoTqPgs
 bSOQ==
X-Gm-Message-State: ANhLgQ0JPHuMLTRorf2R5OQ7cxsp/O1+GthC/TX+R4S/+l1aTlgHZoo2
 fLEBrDYGxMF8QT/kn8pM7pzXIJwwK7r9yQ==
X-Google-Smtp-Source: ADFU+vumN7anU9Np/hM8X3RBvL+hlj4hyYLEch8wVFiIMu+fM9wkQYbSGMWshJXNe6Txlxu/iEWbQg==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr15183022wrp.23.1585045238251; 
 Tue, 24 Mar 2020 03:20:38 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h5sm2879527wro.83.2020.03.24.03.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 03:20:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH 00/13] usb: dwc3: meson: add OTG support for GXL/GXM
Date: Tue, 24 Mar 2020 11:20:17 +0100
Message-Id: <20200324102030.31000-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200324_032041_009981_15E69936 
X-CRM114-Status: GOOD (  14.85  )
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
  to peripheral when the DWC2 controlle probes. For now it's handled by simply
  switching to device when probing the subnodes, but it may be not enough
- when manually switching from Host to Device when the USB port is not
  populated (should not happen with proper Micro-USB/USB-C OTG switch), it
  makes the DWC3 to crash. The only way to avoid that is to use the Host
  Disconnect bit to disconnect the DWC3 controller from the port, but we can't
  recover the Host functionnality unless resetting the DWC3 controller.
  This bit is set when only manual switch is done, and a warning is printed
  on manual switching.

The patches 1-8 should be applied first, then either waiting the next release
or if the usb maintainer can provide us a stable tag, we can use it to merge
the DT and bindings.

Martin Blumenstingl (4):
  arm64: dts: amlogic: use the new USB control driver for GXL and GXM
  phy: amlogic: meson-gxl-usb3: remove code for non-existing PHY
  usb: dwc3: of-simple: remove Amlogic GXL and AXG compatibles
  dt-bindings: usb: dwc3: remove old DWC3 wrapper

Neil Armstrong (9):
  dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL and
    GXM Families USB Glue Bindings
  usb: dwc3: meson-g12a: specify phy names in soc data
  usb: dwc3: meson-g12a: handle the phy and glue registers separately
  usb: dwc3: meson-g12a: get the reset as shared
  usb: dwc3: meson-g12a: refactor usb2 phy init
  usb: dwc3: meson-g12a: refactor usb init
  usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
  usb: dwc3: meson-g12a: add support for GXL and GXM SoCs
  doc: dt: bindings: usb: dwc3: remove amlogic compatible entries

 .../bindings/phy/meson-gxl-usb3-phy.txt       |  31 --
 .../devicetree/bindings/usb/amlogic,dwc3.txt  |  42 --
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      |  21 +
 .../devicetree/bindings/usb/dwc3.txt          |   2 -
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |   2 +-
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |   2 +-
 .../amlogic/meson-gxl-s805x-libretech-ac.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |   3 +-
 .../amlogic/meson-gxl-s905d-phicomm-n1.dts    |   4 +
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts |   4 +
 .../dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |   4 +
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |   4 +
 .../amlogic/meson-gxl-s905x-libretech-cc.dts  |   7 +-
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |   3 +-
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |   7 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |  45 +-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |   3 +-
 .../boot/dts/amlogic/meson-gxm-nexbox-a1.dts  |   3 +-
 .../boot/dts/amlogic/meson-gxm-vega-s96.dts   |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    |   7 +-
 drivers/phy/amlogic/Kconfig                   |  12 -
 drivers/phy/amlogic/Makefile                  |   1 -
 drivers/phy/amlogic/phy-meson-gxl-usb3.c      | 283 ------------
 drivers/usb/dwc3/dwc3-meson-g12a.c            | 407 ++++++++++++++----
 drivers/usb/dwc3/dwc3-of-simple.c             |  30 +-
 25 files changed, 421 insertions(+), 513 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
 delete mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
