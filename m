Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C58C0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7294B2173C
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 08:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pqcg+vpC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OFvZDM2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7294B2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sthzdy5DASDLTH4fLeCk8N70k0nzUkcaePTRvCJNiys=; b=Pqcg+vpCq/Y1rN
	n999P8UxMh++WaYKbPXqBfpx8IRgKNoFXD7/E3mfMA5uDq55PhOJjrb3XK2MjG3tWyvTAlBew5CJd
	SLSjLe6PzNhcpCxUIo0M+Co43aSTDGwmkprZBvH4J5A1vcuZ6Y8+DWoqexD/omB8jG5z+T30+DxV1
	/qfxdnS3gXRUspc0yrfBwh2T4wZLp4poF8L3Jq8SfBOlHrcPN8GG3cshXvDnu0zYovSBsjrfIjhrs
	NjOv8Uocul4n1LMxPA59CoOA6da58orkbODWGCBeKJl29B4Vp3lvuv5YE1JHOA9uG5bE6vnIKn+Z7
	JFEKjkbOC8x5zauXUIXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hve9F-0000dj-8g; Thu, 08 Aug 2019 08:51:49 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hve9B-0000Zj-BJ
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 08:51:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id r1so94026509wrl.7
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vifwZCE4bnskih8jmiWXXxluQMEl4VWESPVBYYZw1Fc=;
 b=OFvZDM2GMu+vNEzqszF7ge0Swd1VEF//llkq14iazVY4eYdAX7SfvBw71e1ROskeQs
 eTdH3onFMmimiTDbMHf9wtIEsKETqkpp9/znyHWDzs4GlVAbIKA4jTEuba2fzW4QST1U
 lC/c7vcgt016PN9/xE2xfZFIbHDkJTzNiXKECIoIYkZu8EE6PnEc7MjW4/qi4JsSqy8R
 tgs4Fojid604Eo4/9TjdzfeFrnVyBUwCZalwvqCe/36SLypMwp2C4Qi75ZuL0y2vWqG5
 SAkAo9ITL5rrygXMNmYZbRWkvOECmyI/ILT6X84dtMcZffLwNvZs0Dga6Pw11fLaKwqR
 fPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vifwZCE4bnskih8jmiWXXxluQMEl4VWESPVBYYZw1Fc=;
 b=pMOAkwyGf7Ffm37QQAo3DxeEJeqlA3TuuoufyhOqWne9gv5pwS8yHZLAlBu7PE8uPo
 LzlRPEkeFSTjvUtRxM+LWB1jNphiO+rh6HkG2vnqSj37zfAEIJzrZ13Ow3X1j4qQkQcK
 6iyX3qKDPZhRsho2mRFBZcLguCybxPJa72rqdqb9JCEP//UVrbGTN4oDrOgAxMgR4Rfr
 GZfUJkH6ba8vUJq6oWQaamclhjSwqXidH1+HWO8zGdhKMV3Oj0kdnuoLS+3PAUARSUFW
 qtLJeyKIBmNPJFKt345vsKboHfiNsrU5vMxBU7sM2omXrMVyY94jIhcXcWR4mhX+vbJr
 RCcg==
X-Gm-Message-State: APjAAAWk0fxhAm0/vFyrq1awGXbpqfkfWk9OuDynV0E7uSASHBt++ABB
 lgL7QRJwkZN/APmjkK1kiQOqTw==
X-Google-Smtp-Source: APXvYqwYEgl9MohCcq4LViUU9lWOpsLOwFkb7HqqBUCOa+plL4VwngfAF9IVJpka4nRbg/TwRZbMuQ==
X-Received: by 2002:adf:f088:: with SMTP id n8mr15584283wro.58.1565254301982; 
 Thu, 08 Aug 2019 01:51:41 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i66sm3360031wmi.11.2019.08.08.01.51.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 01:51:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [PATCH 0/9] dt-bindings: first tentative of conversion to yaml format
Date: Thu,  8 Aug 2019 10:51:30 +0200
Message-Id: <20190808085139.21438-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_015145_410721_B6408AA1 
X-CRM114-Status: UNSURE (   6.98  )
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
Cc: p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 jassisinghbrar@gmail.com, linux-spi@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-amlogic@lists.infradead.org, kishon@ti.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is a first tentative to convert some of the simplest Amlogic
dt-bindings to the yaml format.

All have been tested using :
$ make ARCH=arm64 dtbs_check

Issues with the amlogic arm64 DTs has already been identified thanks
to the validation scripts. The DT fixes will be pushed once these yaml
bindings are acked.

Changes since rfc v2:
- Collected Rob's, Martin's, Philipp's and Guenter's tags
- Removed mhu maxItems: 3 to leave only minItems
- Fixed flash@0 in spifc example

Changes since rfc v1:
- Fixed bindings according to Rob's comments
- Added commit log
- renamed yaml files using amlogic prefix

Neil Armstrong (9):
  dt-bindings: mailbox: meson-mhu: convert to yaml
  dt-bindings: rng: amlogic,meson-rng: convert to yaml
  dt-bindings: spi: meson: convert to yaml
  dt-bindings: reset: amlogic,meson-reset: convert to yaml
  dt-bindings: arm: amlogic: amlogic,meson-gx-ao-secure: convert to yaml
  dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
  dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml
  dt-bindings: serial: meson-uart: convert to yaml
  dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml

 .../amlogic/amlogic,meson-gx-ao-secure.txt    | 28 -------
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 52 +++++++++++++
 .../mailbox/amlogic,meson-gxbb-mhu.yaml       | 52 +++++++++++++
 .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ---------
 .../phy/amlogic,meson-g12a-usb2-phy.yaml      | 63 ++++++++++++++++
 .../phy/amlogic,meson-g12a-usb3-pcie-phy.yaml | 57 +++++++++++++++
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 ------
 .../bindings/reset/amlogic,meson-reset.txt    | 19 -----
 .../bindings/reset/amlogic,meson-reset.yaml   | 37 ++++++++++
 .../bindings/rng/amlogic,meson-rng.txt        | 21 ------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 ++++++++++
 .../bindings/serial/amlogic,meson-uart.txt    | 38 ----------
 .../bindings/serial/amlogic,meson-uart.yaml   | 73 +++++++++++++++++++
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 67 +++++++++++++++++
 .../bindings/spi/amlogic,meson6-spifc.yaml    | 53 ++++++++++++++
 .../devicetree/bindings/spi/spi-meson.txt     | 55 --------------
 .../watchdog/amlogic,meson-gxbb-wdt.yaml      | 37 ++++++++++
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 ----
 19 files changed, 528 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
 create mode 100644 Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
