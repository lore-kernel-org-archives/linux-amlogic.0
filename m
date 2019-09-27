Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 994C2C388F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:48:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 672E6217D9
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 12:48:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tKfBYP1b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lmd5I2we"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 672E6217D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=EtwsWlKhs9KK1WGsFiIGm8MCLyXYRPvpWSRt/tqN5mM=; b=tKf
	BYP1btSJ9Tj/1Up/NT62jQA0JuEfI8jRPgK1Q4yCqZng9opciD5JzoF/mC0P2hSY512q9TnFY1Wpl
	Hqo3JOMVNyTdlpsFm51asUSCkA0D/TTTyTmSYndFVNjIe10CfmHeaReh8NfPcvgwhWmPqLmEbZFzU
	SVXaZGfBTgVh3vIFZruM9i/BtvAWseBr1wZ+gh/YGcAIgIAw0RBxyAojPUGwhpBMOX0SPiaMkPgth
	qqJYqvE7YcloDQjhuIuHaH3gRENWgVKe4RWeGTYxXimcVa7+unwCyG1kBKnXIg8AMSiABvU4dejWj
	JRrj2V5wLKp520nSG6zRDHBb6oHI3Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDpfR-00020O-Nw; Fri, 27 Sep 2019 12:48:13 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDpf8-0001iq-HG
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 12:47:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id 3so6038082wmi.3
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=5nfsuBQARAaBBmwNqsfwCMEnjyOr8SwXnC8MGaFfPbc=;
 b=Lmd5I2weT/CLbzqu8U0AzVZ02d19bxTe+oGwl7weveUIH5QqjVhLpCn2ppfW4UwOdb
 BAQXl+idGpTR2JqZYmDG2jfUuDlB7o+9m0izlMk9efwnBQCgLp3sDZv9DCRkWApwhl/C
 27gqFXsobnH0uvNGPKrCHMopDzJhZdi4gciwKydh6pyULekFY6mx0EHldxQcwbVDDYoG
 YKV+Cm0pDgGZyn3vjAoH23TjOjzsDHB7IDBKgblKrKSLw/qQQX6LTlg83EdIyT/tC2Oq
 +3uC/RBKI7AwNln6XPDks5o5bYossAjdx2K8OqvUaQih9kXN8oYcU3aqxFWM9mfMHRCj
 TQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5nfsuBQARAaBBmwNqsfwCMEnjyOr8SwXnC8MGaFfPbc=;
 b=ehHQH+DZwO8v4jDFaZMSBS5g8+xQS5rUcpdXvFPG2w8Ql52inYFdv0vHvJ495KBXn0
 ISuY0ssqHugK0Dr8t1Pt6Rjx3Da0qBc9YQTotZyhEgpfXjbGqlCyqqedJXN8aso6XEI0
 /AAypQKsKRA5AVp4SbR6AWUfLrpTjsNUtjdZASQ9SX3dDApFJw55y2f22Go3nAG/Pn3q
 y4DdoKapO/cpw2MinvMgdjTHyjIwyXTw8aYhreD9WioZ1Ghg7RcxDCDMhKBG7FGg8QFT
 Gn6YZh+FnxehYxQpWh4l2ygCCz5qHbQl9NVf4wn04VDu+OLRz7XiHHVxnomqcgito3DN
 Dqsw==
X-Gm-Message-State: APjAAAWOFIiBZhz2M88wPVc+ZRxSSN9DaMlcufnoV7hcG3AiUIzsoi8P
 pIHmKn3rsvhgpMB1Mp0xhMjrxg==
X-Google-Smtp-Source: APXvYqxLUxcPLNObTAWH3B8Ce/vrxLkKzpczxQPY4N2mta6NTnGqrSrm/65RoiX/D+py9JoOesJGdg==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr6776554wmc.175.1569588471586; 
 Fri, 27 Sep 2019 05:47:51 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h9sm2985564wrv.30.2019.09.27.05.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:47:51 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v5 0/7] Add support of New Amlogic temperature sensor for G12
 SoCs
Date: Fri, 27 Sep 2019 14:47:41 +0200
Message-Id: <20190927124750.12467-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_054754_715323_03D33E38 
X-CRM114-Status: GOOD (  11.06  )
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
