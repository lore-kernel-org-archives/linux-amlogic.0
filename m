Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F8EC4740A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E61E21971
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t81nWBZw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JoExe4w0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E61E21971
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i80gMSs8QZ///HXlyD63KxbHUBT/Nxrb/4Iqne5227s=; b=t81nWBZwu6qTNW
	4DjjgE097E2/VXalLR0ZfPPSKitRYq4hI4VLNdLAB5MZGZrq/M9mWTok0ryhRRcAwETvO9aAsPd3l
	xdjkKahPvN2eZLkjm4Tn0uJ6ww7+EXwb1LvNNG7fX/4rKexHE4ruUrQNF3kPtKyyab6bBKl7ZGK/a
	O+jNkdjB5+WyEBKPCCheP93+0eynQJK55z+ybeWtnR303r37YgRnoUK8hF3WsHV2pnsWu6mjNcBOP
	pFg5uFgayPBDDnpQd8LAOh0fRQ/ggJmpGoI5XM2mLnEPKJPpFrLBDTczj+DGZQ289JVZysYDUjDRM
	Rqfr7IWBq/9Tbl8bix+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBhA0-00029A-2d; Sat, 21 Sep 2019 15:18:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBh9w-000266-0C; Sat, 21 Sep 2019 15:18:54 +0000
Received: by mail-wr1-x443.google.com with SMTP id h7so9588579wrw.8;
 Sat, 21 Sep 2019 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5OzBxZ0+t9wPFf+C2nN8hPMeCG+6RrzJB994YNsSPow=;
 b=JoExe4w00+RQX07OVlrkNWAZ+jqPrWWMn48DHOqgsVcWwFyn0HG3+LxNK4j4btrwPb
 RwcxKjLaRQyOsW5QhswDb6Bua+1o4gIWqvofch6Tp+fsdMQF4kjKlZXeBj3u8YOcmcZQ
 k0YRb5NKvPR8ybhIJHwFv12zoFj8fy2YhJ0FhE+9MtZtlx+cyIGitCSJmCoq78jpIad/
 hCfaP2kjMobcXwN0ahzom+Lj95/Qi9JhGblOIpeDpOEhCkMEQl96Pv2AhXIONST7t+J9
 nlpvKVRjN+CHd6JY+Kaba4pnncYqmYASPyfMAnR5Uk11K73r4mKWqeqD2otLsbzGsq9B
 i73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5OzBxZ0+t9wPFf+C2nN8hPMeCG+6RrzJB994YNsSPow=;
 b=NpGIMViv8MEHAspRRtu2FGIPMJ6QTiwYv5XyBOLJ/oNa3+yhrI+hGNKH6FqQhXG8Gx
 Heu4ApAmlW6T1AVudU0rPqmw7apb1pv4q0ATRPwMvC70hmHTdCPauAwOTav543NuU/Ar
 Da7gmicf+qbAZ/w9+Pu3B2epcRA3VTLQttFooW351moRdZG/wmHXhFrnHhonfsxOFV+s
 0Vhz1Cj6li1l7RNbfiDbTgEf217P+QQ7FCyRHmTE6CHqo0wFM3yzKecqlZ5H+H9bOgOi
 tvlWBrVL2FkSQbrueSkkh2pEHx0tKdSyQzBtyWh7O1HHGsH6QwBRA/vWX/y8g20Jo+0e
 YYtA==
X-Gm-Message-State: APjAAAV35aGzGX3VTW5hYtt0q2yyQS2f2KVzfncmABdqfZllpfao80/r
 zoFyGQB1EH08X4ntYhpB1os=
X-Google-Smtp-Source: APXvYqx5rx1KF5E+8Mnl8pYNnX5dBt83NmBM6M4uxpyja5jdFKCCDRdrsXVrRIOaK1Jc/1Qk47lG9w==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr15997165wrw.237.1569079127155; 
 Sat, 21 Sep 2019 08:18:47 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id c6sm6003120wrb.60.2019.09.21.08.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:18:46 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com
Subject: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
Date: Sat, 21 Sep 2019 17:18:29 +0200
Message-Id: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_081852_648586_DC54D973 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
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

This series depends on my other series from [0]:
"provide the XTAL clock via OF on Meson8/8b/8m2"


[0] https://patchwork.kernel.org/cover/11155515/


Martin Blumenstingl (6):
  dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
    binding
  clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
  clk: meson: meson8b: use of_clk_hw_register to register the clocks
  clk: meson: meson8b: add the ddr_pll input for the audio clocks
  ARM: dts: meson8: add the DDR clock controller
  ARM: dts: meson8b: add the DDR clock controller

 .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
 arch/arm/boot/dts/meson8.dtsi                 |  13 +-
 arch/arm/boot/dts/meson8b.dtsi                |  13 +-
 drivers/clk/meson/Makefile                    |   2 +-
 drivers/clk/meson/meson8-ddr.c                | 153 ++++++++++++++++++
 drivers/clk/meson/meson8b.c                   |  36 ++---
 include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
 7 files changed, 245 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 drivers/clk/meson/meson8-ddr.c
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
