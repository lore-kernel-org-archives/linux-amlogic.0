Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270F9C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmPV2tl0OOn7aNN6sUsA4zJhzxZ340xuU9q3Bq4KAzg=; b=psJKkB+Zl++VxH
	0uUoEOYwcZbl3eJ5y+YDA8XXHJWkTbiDjlIXNOXvVw6yGXkSMS32Q5TJyTyTSO6a0PC1ktJDgcIIr
	7ADZ67juG+frLvy1QjWDOlvTao8rfJHsfCfPx6G8XTqJ3so/7rAdfYRDR+B/oOkT0oZu2l2sRuCWt
	sSDLoZOhUfqeCo+DdN/7MIZV4r5DZs6TBFBW4UiH4NbdkNLvCy8tbSs0ZFp4h00JFhxUvj9vD/9UM
	+rLn4olaK1Gbvq0EntoodMzkh3+BHkBEA5FDKWE2RW5FBIt5NKFT6kyGw5GHRwOds0nQ5eEhz9cD4
	or/es2E2Nj+jNYuiRoFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PYh-009OZe-2k; Mon, 03 Jan 2022 15:47:39 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PY5-009OIA-VF
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:47:03 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 8so29773046pfo.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuC6I612TLZwEINCPwWyZhF1G85K2gAYC1IKzQ9Ubwg=;
 b=GRfk+w2ob9enhOcSB7G/ep4S1ROT5GfJoq0yFqlZEMr2APjXxmcSoqt3o4Pynd02JB
 iYIOn8TwYE3aU2fgGpMxqi+ZkGopJzSz9ViJI6mAr6cNZ+Nr1B/iE5+SXcKg373MHo2U
 pzHX1mC5YMj6dbFb4W3HcwRreytUsqfp/KVrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuC6I612TLZwEINCPwWyZhF1G85K2gAYC1IKzQ9Ubwg=;
 b=16z/+03Bs1Cw3lHcRni+aJ+PL5lzpeAfEalrxPJbsPWVjfct/X9BkcsvLogeOGGpSh
 Go50c+xf8DU38vivdFN5OskJIhF5pAwtxPsrmpMO7XT746Oq/v8CGknrvlCLQhVYeZsd
 H7GDjR0V8fY0MWz+qTMRxPXit6veV2USdMnFXOjfoYMRW9Cft+V4tNDHcTsKzqfipEjo
 qtzqEhB/+8elxIba0O5Q6vp5TBCNXUAg4UQRbB+T15R73NpI6u/PGakQcQvxwp7rpnPM
 UayU6D+qv0ISfNULduUlp/8jVgAuKgVEfVDzb+1kBf7r2UVRA7B7kFNSrkVqmFpy21xz
 w4dg==
X-Gm-Message-State: AOAM533K0OF6LikEVSfmNfs7F8bic4ge9JSCxz/yA8a5ydCmXrC7+knM
 CBvdEwIicheR+92Q3nCe2LFd61/uMqjo9Q==
X-Google-Smtp-Source: ABdhPJwLI+NLuZ8zgVbA9INKDpuqIVAAWlzG6A08J97tHUyvcwYodufjPg5kieTeJIacj/Q74nw0Xw==
X-Received: by 2002:a63:bf0b:: with SMTP id v11mr26213644pgf.144.1641224820490; 
 Mon, 03 Jan 2022 07:47:00 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-idf1-1-1088-186.w82-125.abo.wanadoo.fr. [82.125.191.186])
 by smtp.gmail.com with ESMTPSA id l2sm41080153pfc.42.2022.01.03.07.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:47:00 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins muxing
Date: Mon,  3 Jan 2022 16:46:16 +0100
Message-Id: <20220103154616.308376-4-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_074702_019625_A86CC29E 
X-CRM114-Status: UNSURE (   9.38  )
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

- RX/TX signals can be mapped on 2 different pairs of pins so supporting
  both options
- RTS/CTS signals however only have 1 option available

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index af1357c48bee..3a7773ffbd08 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1952,6 +1952,33 @@ mux {
 						};
 					};
 
+					uart_ao_b_1_pins: uart-ao-b-1 {
+						mux {
+							groups = "uart_ao_b_tx_2",
+								 "uart_ao_b_rx_3";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
+					uart_ao_b_2_pins: uart-ao-b-2 {
+						mux {
+							groups = "uart_ao_b_tx_8",
+								 "uart_ao_b_rx_9";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
+					uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
+						mux {
+							groups = "uart_ao_b_cts",
+								 "uart_ao_b_rts";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
 					pwm_a_e_pins: pwm-a-e {
 						mux {
 							groups = "pwm_a_e";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
