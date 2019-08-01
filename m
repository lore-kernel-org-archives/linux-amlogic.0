Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4142CC19759
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119BD20838
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 13:57:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MV2+iNYv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="13O0vL5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119BD20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HgAy+w1NK3PV6hMItPrKAwpSbabhbv+iQEjXlvIqRyc=; b=MV2+iNYvTfKHDf
	uTstVOmvpWOHsFYzzf2CG7t8/9DO2xZR8da7vXqYgnGlXkT5kOxV/gU2IK9gV1vEeODtGTcSq0qpz
	N7ol64u79355gGsNG2WcSGPwhqEKo3Q/4GpiZnbRlYXbF8P2ONTl91yX07Vm1RG5ghJjppfIibp9g
	mUJxYIDMPvtXtV7uuuCazz86xFAO8XE4es0FZ7YwPZ5eEOF7mCasN85WWTEPz/HupK9LBAYepxz+s
	t1v2xFG2mJHfoIiD++0bDO58WICzqpTGEgHbhmmcKo6JdKSySDfFnVdkvwBfk/WMfP+eLhJujX604
	JVo8QvD38Sn2VCk1ud3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htBZn-0001Ek-NA; Thu, 01 Aug 2019 13:57:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htBZa-0000zX-GP
 for linux-amlogic@lists.infradead.org; Thu, 01 Aug 2019 13:56:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id g67so59191225wme.1
 for <linux-amlogic@lists.infradead.org>; Thu, 01 Aug 2019 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIm81eDhukyw6fbCl/+3h+QPFrHXYcRhnM9vCZm0FBU=;
 b=13O0vL5DX2cs4dd++hzfRHv1CPifo+nEBZIfEK/xPAm8LBOTVk9bmKI2ZMbRTH1Qny
 gGc5Etb+oieTHOJzEcqzxWDGO6QQqX8ZqANnbyLDBv2TvisCVoaDgG+Sk1kHTmon4u7p
 23GDtno64u2hTvVK4IASbns2pDTl99MQ9lBi+m6sVEXUkUpyjOdGM2BNfLvVc5T/fqbP
 9RYMi1RBDw8zjzxwomGDcNw8yXfmP3fnwqKgmxCfWTSa6c7Ru6292ZJe91J3mLvVO1do
 1LdLqXyr4MpjfSurQz0trb5nuP2J9ZMxqd5XwmuOpZpWwQRuERRQeyL/kh7Wen7RuCof
 AwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lIm81eDhukyw6fbCl/+3h+QPFrHXYcRhnM9vCZm0FBU=;
 b=qGoBncihdw6uocGSC71SN7kjWeJLrT0DGjubrngX8jqiFQ5QRV3bvjlEWEB3yGnfGQ
 D8KXXJtpXqJUUPCu3v3X9G9onjxJF8n6RVN7PyG4L3LywyjgCRlho4fGP9PZCQorjRwI
 Ai3jFTBb9sI4Kox3loVz4Fgzef12KwaAr0zXYbqRqp5bNiZ0jvcmMz6nDxkZYPO/dluT
 ZpKDsUgnnQOOSOJmPWLxyie10nplgkwcW78maLNIxfvY/SfmXR7dbosblmM5VNULEdGn
 8EfBR3vYFsbU+4cpLbsRTVfFD72k2+3bCgA/G/PAqkBpV7U6b6h7DagP0kYjfVub5F2R
 K+pg==
X-Gm-Message-State: APjAAAXoUG+r19/E+URi/rSP5i+uc1jTua3M6n5X584ukE304Rrb03Ke
 y3GVUpsyPZ7z9JFLY6tzrZJgVQ==
X-Google-Smtp-Source: APXvYqz463HiGivdjA4sUX+UrCKICPNW2Wd+t3590qMCqsuXMkM9GjxeAukrBa4PObzWj+jGQXbYjg==
X-Received: by 2002:a1c:ef0c:: with SMTP id
 n12mr111159574wmh.132.1564667808166; 
 Thu, 01 Aug 2019 06:56:48 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u6sm69659952wml.9.2019.08.01.06.56.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 06:56:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh+dt@kernel.org
Subject: [RFC 0/9] dt-bindings: first tentative of conversion to yaml format
Date: Thu,  1 Aug 2019 15:56:35 +0200
Message-Id: <20190801135644.12843-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_065650_575487_DFD251C0 
X-CRM114-Status: UNSURE (   6.76  )
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
 .../amlogic/amlogic,meson-gx-ao-secure.yaml   | 42 +++++++++++
 .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ---------
 .../bindings/mailbox/meson-mhu.yaml           | 53 +++++++++++++
 .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 ------
 .../bindings/phy/meson-g12a-usb2-phy.yaml     | 67 +++++++++++++++++
 .../bindings/phy/meson-g12a-usb3-pcie-phy.txt | 22 ------
 .../phy/meson-g12a-usb3-pcie-phy.yaml         | 61 +++++++++++++++
 .../bindings/reset/amlogic,meson-reset.txt    | 19 -----
 .../bindings/reset/amlogic,meson-reset.yaml   | 40 ++++++++++
 .../bindings/rng/amlogic,meson-rng.txt        | 21 ------
 .../bindings/rng/amlogic,meson-rng.yaml       | 37 +++++++++
 .../bindings/serial/amlogic,meson-uart.txt    | 38 ----------
 .../bindings/serial/amlogic,meson-uart.yaml   | 75 +++++++++++++++++++
 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 74 ++++++++++++++++++
 .../bindings/spi/amlogic,meson6-spifc.yaml    | 57 ++++++++++++++
 .../devicetree/bindings/spi/spi-meson.txt     | 55 --------------
 .../bindings/watchdog/meson-gxbb-wdt.txt      | 16 ----
 .../bindings/watchdog/meson-gxbb-wdt.yaml     | 37 +++++++++
 19 files changed, 543 insertions(+), 255 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.txt
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
 create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.txt
 create mode 100644 Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.txt
 create mode 100644 Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt
 delete mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/meson-gxbb-wdt.yaml

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
