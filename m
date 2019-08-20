Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0C3C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 14:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CA222CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 14:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZVeD54+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mPg2aaUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71CA222CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zQHza+uCfZogaYKJ09J1Tt8m4nS3PQSbA3gsPlR3ebU=; b=rZVeD54+ootXl0
	r2slaO6zo1oonZLGVLuij7bPQ9/hvwZ6NHG/2rYyRwfq+6ZG1eVkVmysyV06S4+PASxPHZVfjAQuU
	VJvpM3jR6ZYXV9f+jGeCvQudaypVSEPdjyXNvZB7Q7DdfA32j7Mzg5yO2CUN75Xs/Wyqqq1b/J9Jp
	4qlEkFBQw4qTGeoiIHb4J9NSn0AzEjminXpP8/t8vFrQhQRotihSC/dyk9t+wfuRJjAkhLHRdVhtU
	rCBwb4vYp9tI/5kd3so0853p9LxrdMj5e+66dkGiIeYtldO3fUGk4imrW7ptVHGh3r1UZUkeYra7y
	tKY8EXH7gsWzYMgeOn5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05Lb-0005Mx-Ls; Tue, 20 Aug 2019 14:42:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05Jh-0003T5-2j
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 14:41:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id 10so2847852wmp.3
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jltHvKjAETJIx5Aet1GM8of7AnTVjLWtzilPhXCAmqM=;
 b=mPg2aaUcDg9KPuw/ljLGLzHEcQaFd1NWEWs3t2VQLRZI8Xd2HImbkHIX6nScifgjdZ
 1NG7y5ix+iuzhExQIMYUYT+WxNMGQ1m1TmPkANC/TI0KIR8LUT0Xxyw3PjmdJVdSonGs
 QmJ9NNUpJ4oaZ1cv7pacPq8JqqOb+KGm42I7ZKBPbo5aW5tafgTPjvHJw6rpdXtHLxRg
 5uk/udLjT8NimcTB4a9ncKfuk2PoqSSljGseBqjWL+fa9E3hEjn9gQ2qY8yrcxKD4qO/
 /ICO76K3nEL0jBQ92+a2QlF42DVj6BKq9/1KmqTffu3/EJwtafChhjP3c+HYXh0XR9h7
 ezQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jltHvKjAETJIx5Aet1GM8of7AnTVjLWtzilPhXCAmqM=;
 b=VjiGwFJc77bvnk9ev2dze/Ni2saDg5xwVaWQHwZQlAFXMMlJ8ph4rNr5PqXsrMBPQP
 enjFO8CnbSBhWlSijW8XhzD0KzBRzM5HA4b/RMRhqOZMBAuXlNsgQO1tcYSYR7HzAIpN
 SyS/90z6nxESa920UOjwtq+SZfG75nSr7GnD6NnX9gcEOv1O6UgQNPJgiEAEQ2yyZ993
 IFZQbYHja7UGKu9S7/TdgJAbIUMrm9Cd5ALUtzi3+fQs4DD9yTZecayXbjQ6UTbxNhwx
 UtWbEUlhtdGENysBOZA3NW+zLMaGywO3ZuTfeLqUTdKSC8WHXOv9SD1zRMZ0hE2LqEfI
 56YQ==
X-Gm-Message-State: APjAAAX69+sCHeWyiHUEdmThxVVt1LNTHhm3fgnBK5hqabTmsWtKvlHB
 RVv/OGj7noIyYxBLu5JXJOrTEQ==
X-Google-Smtp-Source: APXvYqzUXEINr7YBgbQt2flcEowzuqsRnsIwXi4jeC62BVn9us9eqyO5LZjv+Whh8Im/bLMUexKj4w==
X-Received: by 2002:a1c:5402:: with SMTP id i2mr349178wmb.41.1566312055209;
 Tue, 20 Aug 2019 07:40:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a18sm21826750wrt.18.2019.08.20.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 07:40:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/6] arm64: Add support for Amlogic SM1 SoC Family
Date: Tue, 20 Aug 2019 16:40:46 +0200
Message-Id: <20190820144052.18269-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_074101_649252_A0D21C4B 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The new Amlogic SM1 SoC Family is a derivative of the Amlogic G12A
SoC Family, with the following changes :
- Cortex-A55 cores instead of A53
- more power domains, including USB & PCIe
- a neural network co-processor (NNA)
- a CSI input and image processor
- some changes in the audio complex, thus not yet enabled
- new clocks, for NNA, CSI and a clock tree for each CPU Core

This serie does not add support for NNA, CSI, Audio, USB, Display
or DVFS, it only aligns with the current G12A Support.

With this serie, the SEI610 Board has supported :
- Default-boot CPU frequency
- Ethernet
- LEDs
- IR
- GPIO Buttons
- eMMC
- SDCard
- SDIO WiFi
- UART Bluetooth

Audio (HDMI, Embedded HP, MIcs), USB, HDMI, IR Output, & RGB Led
would be supported in following patchsets.

Dependencies:
- g12-common.dtsi from the DVFS patchset at [1]

Changes from rfc at [2]:
- Removed Power domain patches & display/USB support, will resend separately
- Removed applied AO-CEC patches
- Fixed clk-measure IDs
- Collected reviewed-by tags

[1] https://patchwork.kernel.org/cover/11025309/
[2] https://patchwork.kernel.org/cover/11025511/

Neil Armstrong (6):
  soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
  dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
  soc: amlogic: clk-measure: Add support for SM1
  dt-bindings: arm: amlogic: add SM1 bindings
  dt-bindings: arm: amlogic: add SEI Robotics SEI610 bindings
  arm64: dts: add support for SM1 based SEI Robotics SEI610

 .../devicetree/bindings/arm/amlogic.yaml      |   5 +
 .../bindings/soc/amlogic/clk-measure.txt      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-sm1-sei610.dts     | 300 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  68 ++++
 drivers/soc/amlogic/meson-clk-measure.c       | 134 ++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c        |   2 +
 7 files changed, 511 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
