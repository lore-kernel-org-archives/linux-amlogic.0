Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150ECC3A5A1
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE0F2332A
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 22:24:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wud88ThZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MRkGRrhQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE0F2332A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OV3lKMTA4sh/RlLKp6fUmXjt3ku5c6huhKBxiH6aUYs=; b=Wud
	88ThZeVzmZt5nnxY6fiDtwB1a5DedrhJZa+dKL5d39BgjXJYWeaUiyzILZtPtTiN/6PMcPczuxRYl
	8XBh1MhMO1L8/uSbXL9dqEu0XqyciAVgBUcrpd0XmfBuj0pkjJkCf3LVkRGkqcVSiXIHDfF53rw9J
	tnKgV0bEqUrtyVR6wIy85garRoaGxiCbel5nabPp28A8gyAAskq6o/WZMQQ/MC31N2lVSgdP8n9eu
	LsMHzF8pOx5ZFiAWAPtivqG+tQxw9O9537l0L7AfhF1RmMt52RPwfu+8O6Tg/E5UVgFGnPTuDHnHV
	XJYTbww2RqSMGVYvhbPCPJO55JZdijA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Z1y-0002MF-3I; Wed, 21 Aug 2019 22:24:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Z1n-0002A7-La
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 22:24:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id q12so3456112wrj.12
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 15:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=Tu9KiiAh5enRZaMkZDdS91LeJuxWDEGtNB1BXoc97Zg=;
 b=MRkGRrhQlHfQ4yRktSubadPo620IAnB1HEqxZ63PsnGWczv4vMBpyYL+U3jWj8imdN
 TxKxhI1RoA4lSnao8+T628uV9XJ2zMCFbkTmz+x3apzNy2ZZ5lF3UTo/pFbxEJb5QF8b
 ahDlvtEoYZISmIyZ1JuvSWZUKwo9uRlXDEOjDKhevdNOhCrvWIEFNrDlKMGTo81pI/WD
 jUCGVzEJtrl0lPYHRsjzzLSaOD5tbPhuY7JZwOHI08ubbCBjArReNeJnFo5JVshGIjhW
 F+JW8LIam4PDS/wHLtRR0EB0Dq2blhJkUK4BeZzZ8mVNyNyKlQy8Tc9lh10UG6JOx36g
 oQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Tu9KiiAh5enRZaMkZDdS91LeJuxWDEGtNB1BXoc97Zg=;
 b=plU6FrDPtdp/qEI3xC5rKQAvrv5aI6HYK9aOCpadV0FyihKHq7AOXaCkTwH/hQDcVE
 IBwn5gu/GQC149ouzybQBMgaC0QUxXIv88BYYvcPXLQHWw6r8Gd7R9Rt3ud6Nov1Yckb
 hBpXSUCYl3IyF+Ir9GkUKXMR5P/1UKq6StJYbZx9st7/XOHB//LoZaIw1Fr1gh15rWUf
 aHFKH1geim+jvPZf3UDB3g496eD7xt2VEthBbwAwY9u1Iv5bcXG1OaXAIA3n5yLscF7T
 qFLVXE7/sBP6xiH2mvwhr/84N0E6kTEI2YmcoiYnj5dkVuwhbJgZLUmc4dudZdB0veq9
 4+bw==
X-Gm-Message-State: APjAAAXGpwhM8k0sylqLYrCUFomSffkSLv3BWzumatmXTMR+9YIwZS2p
 k+6lu/0nsAYxf+kA6RHa2XGMDw==
X-Google-Smtp-Source: APXvYqwuyBB5WVfIOuZTlZUthOH4h97E4lnN5LJWiB3SBt+5ZWcNYajWVaLszb1NxfgZMOPqseCrRw==
X-Received: by 2002:adf:ea87:: with SMTP id s7mr13201417wrm.256.1566426263630; 
 Wed, 21 Aug 2019 15:24:23 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id f197sm3548549wme.22.2019.08.21.15.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 15:24:22 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: rui.zhang@intel.com,
	edubezval@gmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v4 0/6] Add support of New Amlogic temperature sensor for G12
 SoCs
Date: Thu, 22 Aug 2019 00:24:15 +0200
Message-Id: <20190821222421.30242-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_152427_712843_5E969C9B 
X-CRM114-Status: GOOD (  10.59  )
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


Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Guillaume La Roque (6):
  dt-bindings: thermal: Add DT bindings documentation for Amlogic
    Thermal
  thermal: amlogic: Add thermal driver to support G12 SoCs
  arm64: dts: amlogic: g12: add temperature sensor
  arm64: dts: meson: sei510: Add minimal thermal zone
  arm64: dts: amlogic: odroid-n2: add minimal thermal zone
  MAINTAINERS: add entry for Amlogic Thermal driver

 .../bindings/thermal/amlogic,thermal.yaml     |  54 +++
 MAINTAINERS                                   |   9 +
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  20 ++
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  70 ++++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts |  76 ++++
 drivers/thermal/Kconfig                       |  11 +
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/amlogic_thermal.c             | 335 ++++++++++++++++++
 8 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
 create mode 100644 drivers/thermal/amlogic_thermal.c

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
