Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36185C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD2161447
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD2161447
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OC5lPqhd8+4vGGhlYSvpGAIFmeZlNxMZGt3em/P2qL4=; b=AwmCjHyPPnUZvUnsRcl240Lhq6
	8OXe1Xcxabvs09bM9cwsJeFciB/XqzaY6rBRLe/Bc7TWDTF6j15wiiKLxS63Bo6D6Pkl6YcqVaurs
	Kq6a26ld+nSVLyMCR98c9VkBpHbDJLH6W6UAnTOq6hH9uKmWW3polhALQ+x6yM0ohaPJXgRWD+m0i
	one8XTSJRBegABpvY6EmouUQfgMcVQIjXBNjf00V/gi1bK7+8zqZ79WR0FcWJeStfFR2XIs4ClcHQ
	T3HiESulxX+SZ76nxDSMWujuQfYxkuSg02kOmAiUqJ76/nAOLXBmSxD2YcBKb+/IrLt4Fn3jEx/8g
	Qgrd7mtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcA5F-0065p1-EG; Thu, 29 Apr 2021 17:04:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5D-0065of-BS
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 17:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=P4osrw7Ler4/vCy2T4LTFORBBWseqxgPFKsBoHb7/xA=; b=al2bSE/wFGmPNwB4btIri0huaN
 D5FeXxkkfqmaCD5rhlLHK+5ep0nU/ElhBsmEuMd2+6v9yOuKwEXUipzU+xc75nGmG9tElVTgXTxRQ
 TMOhLjhzSVx0aVa3PBjstMyXoK3shmvoyjtD/KGW/rOE1Ck3rr5JZlADeD7+yoJs7xXckp45YDE7l
 azatOyOaMhIaXt10WxzP91ybhHt7zZ6GqUT2uP/9xjGxRoUHvu5Ctct0DA9mHiqj2f9mZ9M8w7mRw
 gb8razzRsaTzWZF0nUX/stJifSatGJLeo5rG6Y0sXV19TE1b58pyXEeudquMP9XPvODwe86FjM3CH
 8UUCVNKA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5A-000nJZ-OV
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 17:04:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 f15-20020a05600c4e8fb029013f5599b8a9so126322wmq.1
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 10:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4osrw7Ler4/vCy2T4LTFORBBWseqxgPFKsBoHb7/xA=;
 b=Tm/Fk/QObU0IY482tWJn+v/HIVmJ6V+45EWZeCkoejpyX63YUkJHOFDRPVIZXfM52v
 4sMzHaAPsnNKqFTUIjCVoO71g/w8S+mhAMsS/xbuQDnPxidJFFwWsn2VAEYdKGUUV2zm
 lWVt0dXN3PVaPjgHAoey5XI2ma2+71VyxvPjMv2bAl4VqG1Xh9ooNi8zEIbRkPA8eyvi
 LpjVvnLX38Bq4/TonHfcT03XZiKnM40f2xhV7g9qt+YRVzt8k3msfO23aj+zHjV4jnlZ
 lP23XKCxG5pasRAC4coBqxr2BPFNtyNKZNj6a4kG1JKxRUjGnHeDgLsoP8WyMG3ayKcG
 BSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4osrw7Ler4/vCy2T4LTFORBBWseqxgPFKsBoHb7/xA=;
 b=Hmv5aySuf6AOJcEVHIkMJXj6SWAD7hymK/RWKxQgyCpfNZzFZW6XU1kCts22o3fKcq
 FwhrPvONxxFpnGPLP3o1n7U9+CW1WCJlGw+rZ11YRzC2q3xP8rswhCbsT/aNtcWEQJov
 m1LrTst01S5wJkaZipIk1U9VkSjCN3ObU7JS5Qp5797IvLmFRR8IHoEANcRo749Td9ok
 0Q+K+Nvj1w0jDlxsR5GBTOcqWZThBK02Z2c1Se3CtM5cfyJPwJ9KmAsL2hXrRf6ggcKO
 OVRhRAZHMFbMmwIm/azO+b6wC2rraZCAgH31NvwujlgR6AwPF9V2Mu5CvqRonpO/IvZE
 K6vw==
X-Gm-Message-State: AOAM530MZ/e1j2FExtYy3eKu2v16kCJsJDbHI5ENgS868jtSfn0+B3R2
 fVewUioEB34Yojme/JY9kNkkmA==
X-Google-Smtp-Source: ABdhPJzfwWOyATeEOoon2Wmu89CkD9+SVVIBKVropOnFcJ1co1JDEY47UOACmlkf7bw7X1Mun7zu0Q==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr11725084wmi.105.1619715847365; 
 Thu, 29 Apr 2021 10:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id
 18sm11041275wmo.47.2021.04.29.10.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:04:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] arm64: meson-sm1: add support for Banana PI BPI-M5
Date: Thu, 29 Apr 2021 19:04:01 +0200
Message-Id: <20210429170404.3616111-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_100408_820262_987198D6 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Neil Armstrong (3):
  arm64: dts: meson-sm1: add toacodec node
  dt-bindings: arm: amlogic: add Banana PI M5 bindings
  arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-sm1-bananapi-m5.dts     | 606 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |  11 +
 4 files changed, 619 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
