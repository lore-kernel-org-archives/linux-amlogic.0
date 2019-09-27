Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27AFC388F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:44:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B95217D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:44:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mas5Mhgh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gEAZsKg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B95217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C37ktaC1g20mwNTl1EPHJGEzMmOJ9uha6Ai1+qq8Fjg=; b=mas
	5Mhgh96tIJ45z4ca5ekPoiFL3TmfsDz55fsuU0JnbB/Ly/QDGxgXi+CP1RB8TWH+KPemM6YJKm/yT
	F9wuGlKxccz1gqtTAXS8UHVuBJ+8QNp+THA+sg4XkMObFpEFGq/laKnxUtwIbUiWxazgwDVIn/ivZ
	gQ3pa85VF2sBIo08FQc+uqEivaNpHkyMJGlwYFjX6UrbkKodVUOosFIXtQdu/n1yKWq6iiOMf21TF
	wuugm9ymRrEAniz7XHRpU4iid+Zv6Q99dyRZ5mRVM6wRas7lUT3q0C+jvxxgv6D+oVxJrvvbb0amT
	I1yoLkaxLApuZvZU8qDco31pNoRumbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDvDz-00010Z-Nc; Fri, 27 Sep 2019 18:44:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDvDg-00007k-19
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 18:43:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id a11so4340466wrx.1
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 11:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=BlLuKMnAqwTIEJThXWcT+NCQrpuc31hvcyRBdlbTc+8=;
 b=gEAZsKg36xaTruyiqdmuUhST/Lw16pTt6NvZCi8oFmvWKVaq3wQVtqci8/3EnBkk3/
 HT5sfz/tfMSyCyYHnRd+jOUKuOOSIPtna3cgYa8t9fGu0Km8O+zeG01iQQDUfpt6GBLh
 ica5zJitiOvbmJYuWnzr36l++X1vsvvRL/75xfhhdgQPJrjIKByvv2yWVEy5hH3INNpM
 aQLPAjfgmHfpfOcOslLrksDQ4eocq/BBrKJuIDXSHOXOu6Yt8wYBjF/bGiga2KeX8BaY
 +J/l5zJGL0WzQQhwA8w3RegQUC/JiwnokFq4w3ogg04g3OxBn4YF7WuXF73uOTmPlnW0
 kCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BlLuKMnAqwTIEJThXWcT+NCQrpuc31hvcyRBdlbTc+8=;
 b=COEeqyyz/0UovBMFBBanTy+9w9INPz0ahefEz/B2bsoLoSZFDZmBMAvgfurIWt3OpP
 80QuOfT23NQs6U3a9NsKzKN7RkIx25uX+WsVlHB8t2Vk0n7q+xWodXyV5usVchpV7FSX
 //Wq/kmfJueDFw1RaD/FRtzp1FsCrAz8xT+LmvaMPeYYk+Nn3rDyaJGoNYMZozvGhuVY
 Yed+OXMky9aCLOXsZuTRkj2Iq6OGPkeiCBcs0MVhZD8gS7D1ioEiVW7cKibEyKNRT1eZ
 c9WgTmCr8TG3vVQ9dfK/vJrO12gjTVQDBwQKit434RG6b+yL33R9h82ScTfX932sC1zh
 24lQ==
X-Gm-Message-State: APjAAAXxKxDFca7ChX8+I0QvbVSNwDlvW1OkBZApBAb2noTHrva4dBQ7
 Cm5YwENXnAMA3H1A3ULbyIo91Q==
X-Google-Smtp-Source: APXvYqxgRo3KRebRbFSHXBAYv8zrdjIWybW5ueEgqgeeDgsADeXUR38eeRp/Rru7dKw/2IGg4cEpDw==
X-Received: by 2002:adf:e488:: with SMTP id i8mr4333542wrm.20.1569609834506;
 Fri, 27 Sep 2019 11:43:54 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id r13sm6246272wrn.0.2019.09.27.11.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:43:53 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v6 0/7] Add support of New Amlogic temperature sensor for G12
 SoCs
Date: Fri, 27 Sep 2019 20:43:45 +0200
Message-Id: <20190927184352.28759-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_114356_110138_8AF0501A 
X-CRM114-Status: GOOD (  10.95  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchs series add support of New Amlogic temperature sensor and minimal
thermal zone for SEI510 and ODROID-N2 boards.

First implementation was doing on IIO[1] but after comments i move on thermal framework.
Formulas and calibration values come from amlogic.

Changes since v5:
  - fix patch 5 and 6 send twice

Changes since v4:
  - Move thermal-zone in soc dtsi file
  - Remove critical trip point and add passive one
  - fix commit message
  - use devm_platform_ioremap_resource instead of platform_get_resource

Changes since v3:
  - Add cooling map and trip point for hot type
  - move compatible on g12a instead of g12 to be aligned with others
  - add all reviewer, sorry for this mistake

Changes since v2:
  - fix yaml documention
  - remove unneeded status variable for temperature-sensor node
  - rework driver after Martin review
  - add some information in commit message

Changes since v1:
  - fix enum vs const in documentation
  - fix error with thermal-sensor-cells value set to 1 instead of 0
  - add some dependencies needed to add cooling-maps

Dependencies :
- patch 3,4 & 5: depends on Neil's patch and series :
              - missing dwc2 phy-names[2]
              - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]

[1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
[2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
[3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
[4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
[5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/

Guillaume La Roque (7):
  dt-bindings: thermal: Add DT bindings documentation for Amlogic
    Thermal
  thermal: amlogic: Add thermal driver to support G12 SoCs
  arm64: dts: amlogic: g12: add temperature sensor
  arm64: dts: meson: g12: Add minimal thermal zone
  arm64: dts: amlogic: g12a: add cooling properties
  arm64: dts: amlogic: g12b: add cooling properties
  MAINTAINERS: add entry for Amlogic Thermal driver

 .../bindings/thermal/amlogic,thermal.yaml     |  54 +++
 MAINTAINERS                                   |   9 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  66 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |  24 ++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  29 ++
 drivers/thermal/Kconfig                       |  11 +
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/amlogic_thermal.c             | 333 ++++++++++++++++++
 8 files changed, 527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
 create mode 100644 drivers/thermal/amlogic_thermal.c

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
