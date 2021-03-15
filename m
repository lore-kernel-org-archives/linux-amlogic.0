Return-Path: <SRS0=3MJg=IN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358E9C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE71A64E86
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE71A64E86
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UGKIh7aEWOxMBcRDl9U7ZffMi99ukGG3ir0BJBkjvWU=; b=MOy9QZEBe6NHf/1bvurX4gjtB
	+Vqlk/10LG2/8x/ClebP/o7H5DzkYso7FnMYpmV5ZFHfqCxFBaXLCXtl3aQKYZqTxG2Tmtrj4O03l
	wdMubrXVLZk2yrjov+66W66Ju9bNQ8n3zIsAh6y1m0w8kpprQe+1QSQCVNkzOzFfbl3gJtsBZtL4J
	RTAYP4o42d1oqZfkIy/So5wpL8bOwgr1j7Opt5TPbJuClAh8l0x8Vamzc7K5NMPBd4k2tZdyUgyiS
	DBLV2EA1/fhvqYxXby08Wrap4MmT3F13v7TsOs1C1LSLmImxU07D67Da+kdHcqXSorT3FlNpGblDR
	40nEU0lVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLiiM-00FFEr-0E; Mon, 15 Mar 2021 08:36:38 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLigr-00FEsy-EJ
 for linux-amlogic@lists.infradead.org; Mon, 15 Mar 2021 08:35:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id 61so5224636wrm.12
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Mar 2021 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BPZS3vnao73K9jUsX/fpglGU+kHtpTMPEIGEWnyDz8=;
 b=J9uOWfrfMEKrcqh0mxGSAXwSVI+6IRtLA1Ee9SL2Yecz8KhM/QA7z4AG6nM2dd1b8s
 r8iSEl10nAm1w/8dGrFgSHg7wUYfnjQeQfagGirxlXqcfHWA3SLFA7jVaPUrvYWHwOSg
 6ZGSXcnKLDYIbnq0O92AdA5vGTqNH8J9Uj2+odsqoHvXc/PxBtSlG1BFqSVLe+mhSeHK
 KN7FeDUw2u0m/VDRT8dxah0TPqHBRGpH4ttZqpBp/w5EKYppPWKgURQr2ElSU3f8AdM3
 E7RCTGE/tN+CMx+ArF6vzrjdmIk6cYtEQyYoj5jU5iyfyrGL5tKwH3ucPi2F6nANiaKR
 rlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BPZS3vnao73K9jUsX/fpglGU+kHtpTMPEIGEWnyDz8=;
 b=pMysrpWFKGlRdkBmuYdmRUmNGPanLCyOwYrZgq6fBUKbSQ9Y9LPBUjuCioWSZN6/MP
 T5j4d99/cA1G6tT/SOvlV1m1yVwjxLUsoN7ho7E7M8CbMvlTLw9KavvGlIo6lZsIdKz9
 ofKnjTvncX2gLCLg1QZpgahuaC/DYh9hzj3kodRo8o/AzDwsxQ1Qm/I74TPcm3MSS+qL
 zwYloIwOb8get2mEG/6nb3QpFG4InMdOvEnFZlQPVgUXarnebRuqFDId9Nw6qypT0r/P
 yMy/cHKEOpvMQzwidcSbanAF7M98MH/+2CXTttQsk/gdfr4f+k3INLqLvNuKlCW21FU0
 zRvg==
X-Gm-Message-State: AOAM530TK9X3D7dT1tIPwnPHVb9wgU8NeR1s4lu7tr2O7msnhv+RmkYU
 eNDB81LV3KwN1amgwSn2FF/VZA==
X-Google-Smtp-Source: ABdhPJyQqwyuDSuV0WHwVd7Shb+AlqgYBqd5R3uq6WnrB0yfoRjomq0j8TJhFdUjMTF9iMgreMZTXg==
X-Received: by 2002:adf:f0c1:: with SMTP id x1mr25674841wro.7.1615797303277;
 Mon, 15 Mar 2021 01:35:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:708f:15aa:638c:22b7])
 by smtp.gmail.com with ESMTPSA id
 o2sm8372028wmc.23.2021.03.15.01.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 01:35:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/3] arm64: dts: meson: set 128bytes FIFO size on uart A
Date: Mon, 15 Mar 2021 09:34:59 +0100
Message-Id: <20210315083459.359773-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315083459.359773-1-narmstrong@baylibre.com>
References: <20210315083459.359773-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_083507_861236_E6A599C6 
X-CRM114-Status: UNSURE (   9.40  )
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
index d945c84ab697..571383c12855 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1872,6 +1872,7 @@ uart_A: serial@24000 {
 				status = "disabled";
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
+				amlogic,uart-fifosize = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index b858c5e43cc8..9e898479f118 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2311,6 +2311,7 @@ uart_A: serial@24000 {
 				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
+				amlogic,uart-fifosize = <128>;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 0edd137151f8..bd0b049787fd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -295,6 +295,7 @@ uart_A: serial@84c0 {
 				reg = <0x0 0x84c0 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
+				amlogic,uart-fifosize = <128>;
 			};
 
 			uart_B: serial@84dc {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
