Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B9DC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCD5520883
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qgo6AFsP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="poVOrEX1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCD5520883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JrVY/2YilHEAZ0JRY3riaQVX1U3PG9GHP/i5aUsBLuQ=; b=Qgo6AFsPSBXPL8
	Wj78+cD2VD54Bc7Q0/JLXoOUdwDB4Lok9M3NbLebkMryhZvhizghM6OqZdKimipmb04y/doov/Hmd
	8Jq9og0Wk6H/t4QMSX3pBBqYlhaIhW7vDH7i+9SsMMLJe1Y64Esrc5p/toC2rA42T9gjs1lh6Qkm4
	JuT2fkeARKWR7jO9lnE859g3YjvcKgaOQDY5Loqe1Ct/LcUxqaJNEk5k4znfjIxgtChTBW6IBOCpO
	Xx1ytz/Sg+SsRfp2FuOZAI72o6QZbRNKv/T5nH6zy8AGtlIwCew6XEgBspDHpA0ksP1dnesW99Qd/
	sRL+RZ1NEAOsql1oSQOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVGCd-00009x-2M; Mon, 27 May 2019 14:02:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVGCZ-00008P-Tz
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 14:02:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id w9so9850172wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 07:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uTBfIzkKswT7Ff1/QE2n2AouJ/Ougb4/VDEgUdIRqs=;
 b=poVOrEX1TwfxN0/t4+KDONVIES7GtfU0ZA+8LNhgcYVWDVKeytEMClNThxyj0JUlSa
 0dx0wCZKUtXOM76Deh5ALVPWOBovWox8e/5ggcpNpF9wbMdHg/OrOZyRS8Q3kIR2g5hS
 XJ5LJZ8oLCDV/A5f8z7AiD1TDA4nmYD7GexXPgB/byniXe3TyBtOJ/SFHXo71qBXJo/c
 C/Ix1NFkPeD4JEqNQcqAoJ8KL2m1/4hBV06KI6q+dt0azYDKwpt5/na1H11V/EE/5+gF
 lzAeWOJ/AtqWs1bGJUZ+oUsOJzz51VV357ESWnForolZ/GnT3WNxDI2srGDEKtM17TvJ
 os1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/uTBfIzkKswT7Ff1/QE2n2AouJ/Ougb4/VDEgUdIRqs=;
 b=rXshm+/CRq4V8uogLwBiZdXTpCfunvHggphgqxxNfcNVuagWtn5e074Ip4BarYFCXz
 CpMGDJ/jzPnS61iCYIdmB4w7+LIbj3MhIqe4JH4+Ns61nOU0I7TW6Rzh6XB0qbNMI9wl
 JmZX9EDDOb17shHMIrWBaTG67IfOFtLCTiHSAYC49rnVc1W1JVT6sp33dnojpki0AjDE
 aK3887O4/uZ96wX4dWnK43Y54SozcjxVmEA7MURj4YvZW3QBdepRelIwFJQYDdpnrtkA
 PMo2lDX0Z51NDwyfGGZ6424xgb9MkoC9pLyuk1wegH70yu/l8FpFE00IHdE8gjl+iiOR
 27jA==
X-Gm-Message-State: APjAAAXK7UzvQXI2C2Ig3YsudhV01saVkF8ybXjj+nT4zC78mSa8jScv
 ieCr3SIlVLQ2cFYM1cM6m/j4/A==
X-Google-Smtp-Source: APXvYqzOpNufEDr+eiQXqZvSsV1YciB2MT0meHySLn86nd8G7TrvMMyWvAGHcfExDUbQ9R5TEgTCEA==
X-Received: by 2002:a1c:65c3:: with SMTP id z186mr1504553wmb.116.1558965730045; 
 Mon, 27 May 2019 07:02:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s17sm8231628wmj.15.2019.05.27.07.02.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 07:02:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v4 0/3] arm64: Add initial support for Odroid-N2
Date: Mon, 27 May 2019 16:02:03 +0200
Message-Id: <20190527140206.30392-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_070211_968748_24C091AB 
X-CRM114-Status: GOOD (  11.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds basic support for :
- Amlogic G12B, which is very similar to G12A
- The HardKernel Odroid-N2 based on the S922X SoC

The Amlogic G12B SoC is very similar with the G12A SoC, sharing
most of the features and architecture, but with these differences :
- The first CPU cluster only has 2xCortex-A53 instead of 4
- G12B has a second cluster of 4xCortex-A73
- Both cluster can achieve 2GHz instead of 1,8GHz for G12A
- CPU Clock architecture is difference, thus needing a different
  compatible to handle this slight difference
- Supports a MIPI CSI input
- Embeds a Mali-G52 instead of a Mali-G31, but integration is the same

Actual support is done in the same way as for the GXM support, including
the G12A dtsi and redefining the CPU clusters.
Unlike GXM, the first cluster is different, thus needing to remove
the last 2 cpu nodes of the first cluster.

Dependencies :
- Patch 1, 2 : YAML rewrite of amlogic.txt bindings at [7]
- Patch 3 : None since clock + g12b bindings has been acked

Changes since v3 at [8]:
- Dropped arm,armv8
- Dropped eee disable, not needed in further tests
- Add comments about where are connected the regulators pins
- Moved the phy0 regulator to the usb vbus regulator

Changes since v2 at [5]:
- sent the clk patches in standalone at [6]
- rewrote the bindings on top of the YAML rewrite at [7]
- Added MMC, SDCard and Network support to Odroid-N2

Changes since v1 at [3]:
- Renamed the g12b cpu clocks like g12a counterparts
- Rebased clock patches on top of Guillaume's Temperature sensor Clock patches at [4]
- Added AO-CEC-B support to N2 DTS

Changes since RFC at [1]:
- Added bindings review tags
- Moved the fclk_div3 CRITICAL flags to the gate
- Removed invalid CRITICAL flags on the cpu clocks

[1] https://lkml.kernel.org/r/20190327103308.25058-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190325145914.32391-1-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190404150518.30337-1-narmstrong@baylibre.com
[4] https://lkml.kernel.org/r/20190412100221.26740-1-glaroque@baylibre.com
[5] https://lkml.kernel.org/r/20190423091503.10847-1-narmstrong@baylibre.com
[6] https://lkml.kernel.org/r/20190521150130.31684-1-narmstrong@baylibre.com
[7] https://lkml.kernel.org/r/20190517152723.28518-2-robh@kernel.org
[8] https://lkml.kernel.org/r/20190521151952.2779-1-narmstrong@baylibre.com

Neil Armstrong (3):
  dt-bindings: arm: amlogic: add G12B bindings
  dt-bindings: arm: amlogic: add Odroid-N2 binding
  arm64: dts: meson: Add minimal support for Odroid-N2

 .../devicetree/bindings/arm/amlogic.yaml      |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 288 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi   |  82 +++++
 4 files changed, 377 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b.dtsi

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
