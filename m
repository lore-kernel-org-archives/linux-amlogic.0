Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15EC6C49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF3E6216C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uKMyM1ce";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rCcoPIlr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF3E6216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s2Wa52SE+9mDqWVOdLadRqTv2X8KfneIaq7L4GB544c=; b=uKMyM1ce0k+PLc
	TZNL+x9eBy/Z5YdKI6GdKTUw7qQ/hr9rnQqYmE/3imkX1tC2lg+cCVp8jL0J+9rVLNhnrIPt4dvGk
	l0B4UmpYgLOcEnyGAxa50+n6UYTsbII7VC6Y9F6FacIedmU/dbP5ofNvmM4S3FQolbfj0otLvYStp
	5zIUNX01wWSSWUpgMiiSRCMH0KReU7KPol7DxfSiOsbdI4Q73U0p5q7jKcdtzeRFiLPelukAJI9nO
	nC3zxFBbTX+w7OlxEIdxpA3lHauL4Wzcurz2I5BjES5/Jp/VgM5FqhPVwy2fHPsijdZ4gACwvF9iT
	BqYqzs/f2eUB9Tst+c3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qSm-0002uV-P7; Mon, 16 Sep 2019 12:50:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSY-0002n4-Po
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id g207so9985032wmg.5
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0nWXjEKuyezEGLTlcOc5a95BxXTlVx30DizfXSeliY=;
 b=rCcoPIlrwFYixV0LYkox3EHEWUvNOSmGLVZr5kMmD8v9E4IyKfdkDQSIWvEui/KKuh
 GmfhSKP0nsPa/pvtOtmMfUqNtNxD4LOxUG4mC09v0Z+6hbiaoouuyEmbSi2R6HzIhIcp
 1Fxc50tbkGLdh+IpSlrXopG/0K5wIxL8/MbFIEv2eGaV9/HICIQw2mSCnYuum97wTzq1
 Rxo3OfhlWw5DMCmwSPNejV3DzEgEkj5x7M2ucP58Kz5/FpR/eu5QlBElqOXgoC4G25vZ
 iuIzjhePr/rH6ZSQwjjx14oCB3niPwUoex6SW6Np5cxXkaGSCDd9tPSCyJOpiF3AMrXr
 7bVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n0nWXjEKuyezEGLTlcOc5a95BxXTlVx30DizfXSeliY=;
 b=gjk5Xf31pgp5gJDey5tJ1Dw6RS9NN0VNpfAzyndU7rP0Yjc38SN5fOMGn8QFTcyeKz
 LaZ4NoNr3v/ngP8cMZNvNNz245jgvWdKPqCxOxso0kHZDy7hqd9Otrb/npQ6U3dUsr5H
 TIfW2Plyr32Y6wa6Vh/+VnpX3D2hmdZmvUYgnV6t8Iwc8kEA/S8IKa4yb5zw5jOKLlNU
 mhCQw7/h6DBKggdLuQcjYrVfGRLs9gtWQlGfN+oszJBtvL4DGEXD7K4tBYIve1sXVPUi
 TCp1GoBdcVjNCNcdXzewbkvB75xSFj5UYmLch2NvC6whYMeBcY7eS+oB1lA2sY8g35/D
 oxRw==
X-Gm-Message-State: APjAAAUO1FJd51aSoi1TDMh0vsQ5oNuWiTUarHeug3TuZFm8HKfgOFJz
 hPmFjkP08dzHndSXBziWR59EyA==
X-Google-Smtp-Source: APXvYqxt1quSs6ZODA5XRA7qdpJ1rjqMP7CeuDbJm5vLj3TnHa4eGsYXp/6f5dSgZsxBwneSvqn0tQ==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr14440842wmc.138.1568638224331; 
 Mon, 16 Sep 2019 05:50:24 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:23 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com
Subject: [PATCH v2 0/6] arm64: dts: meson-g12: add support for PCIe
Date: Mon, 16 Sep 2019 14:50:16 +0200
Message-Id: <20190916125022.10754-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055027_119218_8EF5BB40 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset :
- updates the Amlogic PCI bindings for G12A
- reworks the Amlogic PCIe driver to make use of the
G12a USB3+PCIe Combo PHY instead of directly writing in
the PHY register
- adds the necessary operations to the G12a USB3+PCIe Combo PHY driver
- adds the PCIe Node for G12A, G12B and SM1 SoCs
- adds the commented support for the S922X, A311D and S905D3 based
VIM3 boards.

The VIM3 schematic can be found at [1].

This patchset is dependent on Remi's "Fix reset assertion via gpio descriptor"
patch at [2].

This patchset has been tested in a A311D VIM3 and S905D3 VIM3L using a
128Go TS128GMTE110S NVMe PCIe module.

For indication, here is a bonnie++ run as ext4 formatted on the VIM3:
     ------Sequential Output------ --Sequential Input- --Random-
     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP /sec %CP
  4G 93865  99 312837  96 194487  23 102808  97 415501 21 +++++ +++

and the S905D3 VIM3L version:
     ------Sequential Output------ --Sequential Input- --Random-
     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
  4G 52144  95 71766  21 47302  10 57078  98 415469  44 +++++ +++

Changes since v1 at [3]:
 - Collected Andrew's and Rob's Reviewed-by tags
 - Added missing calls to phy_init/phy_exit
 - Fixes has_shared_phy handling for MIPI clock
 - Add comment in the DT concerning firmware setting the right properties
 - Added SM1 Power Domain to PCIe node

[1] https://docs.khadas.com/vim3/HardwareDocs.html
[2] https://patchwork.kernel.org/patch/11125261/
[3] https://patchwork.kernel.org/cover/11136927/

Neil Armstrong (6):
  dt-bindings: pci: amlogic,meson-pcie: Add G12A bindings
  PCI: amlogic: Fix probed clock names
  PCI: amlogic: meson: Add support for G12A
  phy: meson-g12a-usb3-pcie: Add support for PCIe mode
  arm64: dts: meson-g12a: Add PCIe node
  arm64: dts: khadas-vim3: add commented support for PCIe

 .../bindings/pci/amlogic,meson-pcie.txt       |  12 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  33 +++++
 .../amlogic/meson-g12b-a311d-khadas-vim3.dts  |  25 ++++
 .../amlogic/meson-g12b-s922x-khadas-vim3.dts  |  25 ++++
 .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |   4 +
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  25 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |   4 +
 drivers/pci/controller/dwc/pci-meson.c        | 132 ++++++++++++++----
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    |  70 ++++++++--
 9 files changed, 292 insertions(+), 38 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
