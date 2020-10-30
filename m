Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D7C4741F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B1B206E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a3Ed5hYZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BXgL45pd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B1B206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10FmbF2nsTfxreUdzHefBc4vMIg16vYQXDUkljOiG1U=; b=a3Ed5hYZRliE1DfoSXUGKpycL
	umoRcWIPuCpOC/2LVjWvvyxXN4ueErWgSyRBpzm/E/7sWeR2QPi+iaAEF4XPxPRTxxXCSHiIxYFn1
	Tg1HarHAqLQRahS6AXUJh9m67Ux8TO45/P6RdUEXl6uUFUil/7UlNdqG1ksIXH5lEC2StauikQvft
	lQwAIyYE43bc6TLK8H4cNuvaRcHWjXUdzZKsAyC8Ieylm6WfN9DSatfQ0X9+Qu7D+nIuXgt4+PxGf
	jUXshRo8LTf/gupfvuhabFEkn3UDNdNv5qLlAXtkLam8PkdgqO3RSNq40d0pVwnRTq9TPn4KEz+em
	O+yvEhgmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYVXy-0000cA-5U; Fri, 30 Oct 2020 14:38:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYVXR-0000RE-4U
 for linux-amlogic@lists.infradead.org; Fri, 30 Oct 2020 14:38:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id w1so6733755wrm.4
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2020 07:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
 b=BXgL45pdvPA/qdgaB7dRSqK8o/iZ2Px44eM98lmD5Qtv8a2HvbfT/KsI6jUHoSPOhJ
 +8n59E1oQq6e4j/s17DDf4Gc9k4gTCZ6nV7DHBgV7zUPSofgF0ZVWKLj0kyAyRUpi65Z
 /xMIZni8xobSsWZT8TaDGke9uUvXWnSWtYQDjeheGMDdEgTUQ+X75yOQkrXrPWSSHGAG
 AbrMPqkurCEJwk8GtoOcxPj81eGTlM1Ao5D405B0bWTmesg+6SrTKDgof9m87RAiUTgT
 XTQd91RbXvycZYBg9JhNqWPJ/Y0w4bRt0UHSW4PwWrCeFF85ft15rgNpVOxkdnKX9k7g
 CoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
 b=hJHcGHqZylPdIpeBEScuog/plEQiCgH2apruXAjyMuFwLi4b0E1DhHHPv1Z41lpXUs
 +kHS0D21GiZZw3s5vEkTBQGaDaRZFPvxjPU5di1HL7zoa3mftQ+EkIYZVPBTSWiMQnl3
 /mHQ+TZYXbXwqSupWcplo/Rb2KCyWOUW0X72PL9EOCiQ/BQNqPbW0VMY8Vo7fpQ2n10I
 fG+7k276dj+ashcuIGEZCUCrSmWsQN7AeN6atGzsY2hNOT/PhnxPu8Z2aZwz8puwHzBM
 jE6Iv0ol4fbLAfEVUrNE/6fm1kNByWpnMuH/umHgshbBeyzGzYztmFWewQgE9EZF3NMe
 95Aw==
X-Gm-Message-State: AOAM53000emYgmYH8j3woy8E8nL8w76UlqVUubdxYqCrHJ8j/qMOj5gY
 31v7b2DRwYQir4aGXdrUa2tg9A==
X-Google-Smtp-Source: ABdhPJxLpl0ttOzWhJ8Mlq8TG4CfMXiXVp2XCIMU4607i6rnnRmyL1dHnrGpRG4qSGePE6aq7yiwEw==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr3519102wrn.257.1604068675781; 
 Fri, 30 Oct 2020 07:37:55 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
 by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:37:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	khilman@baylibre.com
Subject: [PATCH v2 4/4] arm64: dts: meson-axg: add GE2D node
Date: Fri, 30 Oct 2020 15:37:15 +0100
Message-Id: <20201030143715.577641-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_103757_290274_95BF9A70 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the node for the GE2D accelerator unit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..376f5c3f6188 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1563,6 +1563,15 @@ saradc: adc@9000 {
 			};
 		};
 
+		ge2d: ge2d@ff940000 {
+			compatible = "amlogic,axg-ge2d";
+			reg = <0x0 0xff940000 0x0 0x10000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_VAPB>;
+			resets = <&reset RESET_GE2D>;
+			reset-names = "core";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
