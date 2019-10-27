Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BBECA9EC0
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:23:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E36222C9
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sIkfbzLx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KUlQvi09"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E36222C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4272G6QyMkPKP3OIWJNcXYPI71buoXKX62s6M18kYw=; b=sIkfbzLxFmM8/W
	ud6AYbYALMhiXjQ5pCe10r2opeLE6P4NthqHrnl14COsRjl0TTfVaQQF/QEuGvbJeJispR704PftG
	msSvdIAhQoP0TjIr4kRQzxOCtv7eQcZ/ZrSSdNLweIhRwLA+zYZvXtJHWOrCpMH5MBPrKT5NRuKuk
	XfE3FGjopXgqJLIvUvcaggWLIwWJjseFsmxCLWAvoJsc58PJ7cbbQ0n56e7iD5ekuylaOxKz3xdYD
	QxYP5U0QuCyOnEb/CjZl3TBEQ0IVD+yQ51favWm3fXu4YdpZTh0e4IYQJZLI2f7L/0GH/kfSVq1pA
	Qpl2E0/RMBmlhhunROjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlKR-0001DA-Sw; Sun, 27 Oct 2019 16:23:43 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlKP-0001CP-9n; Sun, 27 Oct 2019 16:23:42 +0000
Received: by mail-wr1-x444.google.com with SMTP id z11so7347865wro.11;
 Sun, 27 Oct 2019 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHh2wTvDV7QQYeDnQO2gSOBLNsofT3XUbH0CNdaqVwQ=;
 b=KUlQvi090P07yc00xZbpnA38RqozC6gRBuSVoaFEKscMs68UnSExgUqVsSQHQc2uYJ
 IpZUIUqNdvpapTouYOP74UN7kLw7dO+gsAi6bYSKXS+5kqC2zcaBnJvhwbxoZYOHt2ZA
 8eXPaUzfYQ04gsezKrtuPaIQUXlbdtaVdLpytujuklJliVD+dP5lMqkSXQOf9jPOBVVt
 fgUSME/UKfvLRTzgwKghLba7fF1q42UIGYZkiwYapnTwcjyP0TbBC79Ia9thpIjHOmQ8
 qWEbEjOn6yrEmW7vaz0FsjRfQ99Z2ki3dCOllrn029X21iSTG1Vxp+8lmsBagasc8MAT
 I7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VHh2wTvDV7QQYeDnQO2gSOBLNsofT3XUbH0CNdaqVwQ=;
 b=no6m3K4vpZ3y2IrlcJDfX9TdplJqp2xOIp6ed87Rf1Af+XwKJCGiBWx8/BVFJi0tLn
 vBSWYyGNx2I9+/ZO7c0wnSaVHLR7GBe1cyX86RzJyO/gnt0DHR5R7KIImQyFZKZ2uDnZ
 +AUgPY9mcte5KNKXHAKepl4B785sg+A+Bu30TUgSnwQka8xKIEo8I15FwFMS5zoe1vqT
 Mzdk/gCvIK0coF1DRdsccxB+7UyW6xU2J9V3X4PHzkvYaoiUng9DLYaj0y/LPcXOaprc
 fQ5mD4ZjBc33rnRcHv+6Ycbr/uSSOr5veuzKZjiAal8TmAuNncE/PYfd1TFPpcF8lDOk
 Ut6Q==
X-Gm-Message-State: APjAAAWUyITteveAh7X4eFjwa/DJdzIZ+rbVA7Sy6u3iOQ9Rc67rPDYL
 wVlsOccisQdgi3kL1FWT0o0=
X-Google-Smtp-Source: APXvYqyCYGYmCvPNcNbH87Xqtct4wBPQgN4aJcAyg1RyMkX/chRC6UMEk/wYRQMsMbtgwGug5mVA0w==
X-Received: by 2002:adf:ce87:: with SMTP id r7mr11522180wrn.307.1572193419899; 
 Sun, 27 Oct 2019 09:23:39 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 1sm8243299wrr.16.2019.10.27.09.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:23:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 0/5] add the DDR clock controller on Meson8 and Meson8b
Date: Sun, 27 Oct 2019 17:23:23 +0100
Message-Id: <20191027162328.1177402-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_092341_365744_C10A7015 
X-CRM114-Status: GOOD (  11.90  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
registers. This series:
- adds support for this DDR clock controller (patches 0 and 1)
- wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
- adds the DDR clock controller to meson8.dtsi and meson8b.dtsi

Special thanks go out to Alexandre Mergnat for switching the Amlogic
clock drivers over to parent_hws and parent_data. That made this series
a lot easier for me!

This series depends on v2 my other series from [0]:
"provide the XTAL clock via OF on Meson8/8b/8m2"

Changes since v1 at [1]:
- fixed the license of the .yaml binding and added Rob's Reviewed-by
- drop unused syscon.h include (spotted by Jerome - thanks)
- drop fast_io from regmap_config and add max_register as suggested
  by Jerome
- dropped original patch #4 "clk: meson: meson8b: add the ddr_pll
  input for the audio clocks" because I could not test that yet (that
  patch was a forward-port from Amlogic's 3.10 BSP kernel)


[0] https://patchwork.kernel.org/cover/11214189/
[1] https://patchwork.kernel.org/cover/11155553/


Martin Blumenstingl (5):
  dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
    binding
  clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
  clk: meson: meson8b: use of_clk_hw_register to register the clocks
  ARM: dts: meson8: add the DDR clock controller
  ARM: dts: meson8b: add the DDR clock controller

 .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
 arch/arm/boot/dts/meson8.dtsi                 |  13 +-
 arch/arm/boot/dts/meson8b.dtsi                |  13 +-
 drivers/clk/meson/Makefile                    |   2 +-
 drivers/clk/meson/meson8-ddr.c                | 152 ++++++++++++++++++
 drivers/clk/meson/meson8b.c                   |   2 +-
 include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
 7 files changed, 230 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 drivers/clk/meson/meson8-ddr.c
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
