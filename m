Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B87C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:33:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A4F611EE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A4F611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vL687nuEOJKnj1qDix1xp98YfVILaLNGtqZAfzQXtiM=; b=homkf/wx7tyDcgSEVqnDPG88lD
	/53PKnkQ2D0DNI5sMCRRjlSz7BREuhZYUimJ0sa77kuKyRiUCyihEmuCn9RhxrD0KEakYslDfGLPA
	E6oX/SapAs9qAXrk/XNs8Nt+KA6JgmfZk66s8cwAqeLAzFt4gMwPX+7pSFV9qrruQWp2hdLv1mePJ
	+Xir7+XsErY7Zqwmi/R/TaOs57R/6eFnwFM995nRYEQdKPlUiJHzESJ7dmpl//tT8N8C63Su02GXu
	0240My+meMx4nqNoD8JoRPz4SKtVZJw5vowlCzT0m3UOWl49n7tydzCgUo3GOmuayz4evLh57KxI9
	y8eAleRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leC2E-000Ua9-Nr; Wed, 05 May 2021 07:33:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1h-000UGL-IM
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=H3zD0CEwtCQw4KD7pngUsgxPD/yoCJ3dqXsLOE1tr5c=; b=F61n5D7ZUoXlmC2+w2Yadk7flz
 7j/35LqlMqjFmmQ0n3drAEfEkv0fdBzRI/+ErSHbbMvZvRQCUWhbQo9XorS0qrDihQrE39pDisH4X
 fBCU+ni4p659JDo7phy9uMoOgeqUGX+tGU5GURDeG7NQffFzqriBva9HJobeBM9l8ThZNcbFY2RTK
 8Qd/LkJs5KVGOZ0ekea+6jrazPQLwFauRglXMg3d4FiKKxjySEff0gH7B5g4I9urUJwehJiFzDvpA
 48UfkOQo4ZF42XniiRBL4B36iu95uEQzbJZLC1h6rvFTL0441KpWiohIjJYRPueaWc6VMme2wcCqp
 LJFZiD3A==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1c-004XCI-FH
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:32:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h4so645080wrt.12
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3zD0CEwtCQw4KD7pngUsgxPD/yoCJ3dqXsLOE1tr5c=;
 b=dIPhTRiEcCmC76Tg1k3RXlWHC6kBteJpKUiZZzt+Gu91RjKyys1lGMxS0eaY+aSTt1
 shHvfb/Nxv9iQZG3qQP0ozSvnliBvbfHROgZzT1FTkt30tghWrYWoamG+mlpD5iJILbh
 StpbsQEL0tFPDElftcT22djbGOt9KgshCWfv+JcQdh1vX1M3ta4Q8uFBb4xn6OxJ+ayF
 wMEsdhWvVkMoSFFF6wSvtgq/UHs1/5nWka8+dn0hHOe5IyqEWgDrEcA3xQXXY54jL6NU
 ZIpuZwDjdzGZCYXp1mZwxreyxvQCuLL6Sg/2clroVw0AypgYdDtp4U8dUEJ/Ev8jNjxz
 XMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H3zD0CEwtCQw4KD7pngUsgxPD/yoCJ3dqXsLOE1tr5c=;
 b=TaiD9A5ji4f58GL3t6MASCnEM1kp8+JsKZmYmsTcjMhTi/vlXjsB6idxk14engLmcb
 rgnTXt+jRGjGlAwmKHlS2d8NOyPjrGKM6FrtcnzdnorSy7MRM3L7/mJzMwyVsIj/PYmz
 AQKDMhQoCYiXb5h7eMBFCUiQnVXjZzEQv1vbih9tDixwpR1U2Pm7tc7Cm/qpjoJffR5U
 aixuIOge9WtUQmUzGGlCZxvXE1NufQLn/Y+rQNUB54ecjNRsw3BscVK5o+603IEbGpU5
 OAKwxjN6KDZRBks9RJztDuHktyhwV5mDCOsXhpTvc8DyHD5ywlbWNqhI6Oq2qaovpNZG
 NMJg==
X-Gm-Message-State: AOAM531m+YmDgvLij6g3+rkgsZFjo61NyZ2FB+wCtrq0rbQXaUIozBl8
 KQ7gmWjKGS8WG3qp4dlZUvRVovsyAWBsP4Oo
X-Google-Smtp-Source: ABdhPJwwBp316RbMQbGQUIap/j0NiwhMF9u29cFlS2aXLCYfJBejYdGfgaMfFPENgT4s+FnTAS0gaA==
X-Received: by 2002:a05:6000:504:: with SMTP id
 a4mr37073746wrf.51.1620199970885; 
 Wed, 05 May 2021 00:32:50 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 v20sm4965663wmj.15.2021.05.05.00.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:32:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/3] arm64: meson-sm1: add support for Banana PI BPI-M5
Date: Wed,  5 May 2021 09:32:45 +0200
Message-Id: <20210505073248.3816183-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_003252_543551_CC32C796 
X-CRM114-Status: GOOD (  10.52  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Banana Pi BPI-M5 is a credit card format SBC with the following features:
- Amlogic S905X3 quad core Cortex-A55
- Mali-G31 GPU
- 4GB LPDDR4
- 16GB eMMC flash
- 4 USB 3.0
- 1 GbE ethernet
- HDMI output
- 2x LEDS
- SDCard
- 2.5mm Jack with Stereo Audio + CVBS
- Infrared Received
- ADC Button
- GPIO Button
- 40 pins header + 3pins debug header

This also adds the missing toacodec node to enable internal audio codec.

Changes since v1 at [1]:
- fixed bad compatible for sm1 toacodec node
- removed tab in bindings (but kept martin's review tag)
- renamed adc key node
- renamed flash_1v8 regulator to match schematics
- fixed vddcpu regulator voltages
- fixed ethmac rgmii-txid and checked it still worked
- added missing GPIO lines names (thanks martin !)
- 

[1] https://lore.kernel.org/r/20210429170404.3616111-1-narmstrong@baylibre.com

Neil Armstrong (3):
  arm64: dts: meson-sm1: add toacodec node
  dt-bindings: arm: amlogic: add Banana PI M5 bindings
  arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-sm1-bananapi-m5.dts     | 646 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  10 +
 4 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
