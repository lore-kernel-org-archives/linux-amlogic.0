Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5D2C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 08:00:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6E66124C
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6E66124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnw/MoGJXFiaqJyqFBlZnWF2bB2IMxgsfnU5r8ZuYEE=; b=dQ4fPnjhFDZdeqerpjzl/xgeg
	slc6gSjmoCgtKckLtEemROkYn+129OecqUWyLUi6RLQnyH2r+5EWau2hmgab8RgZr9+qU/ODhFNkC
	hQN1CE2J/CEyAeNR74tceFlYaQKfXv8JyFluONuEWZbAwuaiw4NGvA7iZXaJYXtd/cLIoFJ9SFapN
	TcGITwjpJYxN2H767oAyked+Yp7v+hiWkb0lLsiA7vdoFulgmZDJ/XAnuxNqPDwx6xVc5kKlge5tM
	2Os8qOLpZi0IPWZX4WNui9g1rw/GX7vOapYLtQ1ZPwe1DzlU6prrJ24zena1EApddpFeLzTBHDcg3
	J4hh6vj0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liudo-00HUDM-TW; Tue, 18 May 2021 07:59:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucs-00HTyJ-6J
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UVZto4g6Wsxu+4WPtlJ/ny9aJEsfvT/s2hR41/jSqcM=; b=sbhzOR7DPG6MBwYHnHHuknIn/s
 vrR3KAVPdEBlcdczaPg6/h38rmOUlzHWHW0rEirPUDyl2eebrR0atXfDghsdPr8OXncPABun5Q3RP
 sfpf594OgMwCg6f6LSfeIgEAkwGbYvuyibZHqznkkGZSplIF5p0cR2gKUewfclYqDyMxU3cHdqG0d
 DRC152zB+gfYytgyYBLo4y1pWSBf12J95Qb7rjW4LEchn9M/pjDwhO2lQNq6q99S8KDPKKzpVBXFx
 AecRGJsAHfZqh15/HJ6UEiMvpIG8Uobv6pRxQqrIZWrSlQrAR/FM+jCHYdfYpadDTvp37846ggyO4
 B7c9O25A==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucp-00ERFg-9X
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:58:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id r12so9109584wrp.1
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVZto4g6Wsxu+4WPtlJ/ny9aJEsfvT/s2hR41/jSqcM=;
 b=q/zVbBc8de/ZHaVlbkXtflSU9Y6r05ipflZJPEJMidMnL6VU4nk75xdR8qzzIyGvIk
 GPRztw2VRKTfvAPTWNBbUVxz1eZOAoPnhwthMU19UODq2two5XpYbaJoyRUJzDpfGyMo
 7b4DtMErwdRVN7HkifwHY8Lqg6dKGQdlZcQBkftjfCsY8Xqr1dSLa11uFelUy6eU1ew0
 g6yEy/U5syvHBNsLdJWV6gf06ICAqDUCtsrPbYouVwj9PuW5nrtabchPnhZxIx6Sq/Kh
 Gyw9T1lkBzA3/IDFB3lFrXiFqajKwsuq/HwsAf30PeGHdKvFg/s2BGDN51IT6D+QI2YP
 c3Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVZto4g6Wsxu+4WPtlJ/ny9aJEsfvT/s2hR41/jSqcM=;
 b=e7riY8EQon5etSUQ8W2OiK26IKXjcguGi4i5o9+eqBXGecFCxlRBm7M0o800mt1KcL
 oChejChC+Samrom7Qr9bC6LH75GA8ZjaOpO4QS+afXA+QD9N6Z0fuL06gzdTBvcezIcm
 MkcAQWRg2/CPaBccawmX86C2znsZfU0vk9EDCkuVYZtrgkCeDykIFIN9nvJpFJA/W+/E
 5+LyfaRuTdo9E7YLdBdq8KRWeoCu//D1+nrqOIHkmEfmzR0zp6zmOaG4kOGyUfUHalN0
 rNFIGfZsq/glZ7bGp6OfSbgsQeo22eMqts67Wuomz94F0ZUASo0qTh4bEwUik7BF9ipG
 /sEw==
X-Gm-Message-State: AOAM531dG4NzI8Kin3piTOVwpg3TUnLxryNl4sZ5Pjk/gcQBkPO18391
 krDTp55q9G0iHfVffJ2hmzFxlw==
X-Google-Smtp-Source: ABdhPJwIn4TUckWjyOGKmOz5dzsQpoXw/XnPgmeXj7aq688o9TKoq0ZTOggr/wiZltQtLTx5ttg/GQ==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr5180323wrq.356.1621324726026; 
 Tue, 18 May 2021 00:58:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:842:2d82:a1ae:1a91])
 by smtp.gmail.com with ESMTPSA id
 v16sm735448wml.6.2021.05.18.00.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:58:45 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] arm64: dts: meson: set 128bytes FIFO size on uart A
Date: Tue, 18 May 2021 09:58:33 +0200
Message-Id: <20210518075833.3736038-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518075833.3736038-1-narmstrong@baylibre.com>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_005847_352636_575D9195 
X-CRM114-Status: UNSURE (   9.69  )
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

The first UART controller in "Everything-Else" power domain, usually used
for Bluetooth HCI has 128bytes FIFO depth.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 895c43c7af9f..3f5254eeb47b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1871,6 +1871,7 @@ uart_A: serial@24000 {
 				status = "disabled";
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
+				fifo-size = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 793d48f72390..00c6f53290d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2317,6 +2317,7 @@ uart_A: serial@24000 {
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
+				fifo-size = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 3d00404aae0f..6b457b2c30a4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -301,6 +301,7 @@ uart_A: serial@84c0 {
 				reg = <0x0 0x84c0 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
+				fifo-size = <128>;
 			};
 
 			uart_B: serial@84dc {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
