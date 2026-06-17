Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66DCCD98EE
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NtznoHUB89j3REx/ZW32FJF4e1GIGuKBHdTtYHhMjtM=; b=vGIl3YktzjVjuS
	xJbSK5LrMSFw+gzjOTlCTw1tbPkEkpXGN2EYKvjElR0kRH2smWwvIrqZiNEAbRR5ENGkfO/U+QBmP
	9WU7YsDlXxz4KS1ffJzyKM4M82pHIZgYjr4LUOVEEXW5EohFa+yKlh9jcwRD8jE3l+yjJNYH8/ATt
	S558I0BpKzVVj+e8JsO4JQ7oZoEAyI1ubcKwjafCzeurzV1Q66+SddS9A9w2p/ccRanG3ko6AdauA
	Q8yFGYRsAfrUVB1C44YrxsRTaA0ksUKEFN+988Xq0QeOYpyAiP7ztxnjck6zi/Mwk6jBXr2Vt64ZE
	LEuG/YyI4Sy/8OA+pdsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVs-0000000GnoZ-1ajA;
	Wed, 17 Jun 2026 07:16:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVq-0000000GnmU-0hb3
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c85a2ca7bf7so2020393a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680597; x=1782285397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=gPlDr/s8Kgc4uUCgdjOqEBsOaI2UwTAdG+H4RoVqIKvepPfbyG9fsGGgQuN241N3nD
         Toon/n+O935MPsizDt+LqIBpPHcd7jTX4MnnOvM0QrwPjgQgTAuwhWRfP1vKDh4TSDXT
         ySQs0pi83/Q0s9NTfAhm/gdMjwOA3QCc4KB+uGqxACB4OG46mQoKpwXaULwhgEhfIBqZ
         ODCdxrJ6gKj8e5DAIVNct9LlDCcSWwAFHc0JO+yLg2rCg4gbBs/NwqGJGcSGHzQ3HgDt
         4JoW2m1oPiov6Kp/rGe12ROFBkylxXnqlL1TqrlPpOS0Gfqs27aPF0ajwigf/hEX19bn
         kR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680597; x=1782285397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADqdY8CIvaMdQ2n5TRjD4GwIiNbtI/XRmbATt6b3w4I=;
        b=RklO7EPc8n2X//vpXZ5Zt42nJY3ZYbdUbdAsp67MOoximOH/U5er3tQaW1CMDj/HsT
         mIP841lZ8dqpK28vD5B+akLY/xrND6cl3eK5fdelmcviBRtxh/M2OIIRbj9vID9SQaX9
         b8+uRSqyEOH5r7UK+AXhZwLAWPTxTPkPb3D82aOabKjiNUyZaTGxcf2Y7/B796g+EXA1
         yBOpiY5NPrUuPCNjoBr8D7kuGLtv7TIC+qlRzCv9NvbwdM+4GljSLwpRZshMFdTGoTLI
         vGQwtK1EHaP0Fczl35Yj99Q09wuZZ+9UTEwoKqCZzvFUfiOMs28PdPUkm3MVjDfPIfcc
         6QVg==
X-Forwarded-Encrypted: i=1; AFNElJ9OGBPjyl35j5jWMWAs/tuDEIoKr62aNBQnyyCreWH1PcgZlc6ylnKYVZonp2tvLByk7kpvyxLwNJOHEzTX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwya0T0FvSyBtRGehINvT5ll5NbMWhTFiGJ9QVaSZMmNwDkriA
	nMep5gwsop9OKmlvqtgT4J46duyB/abW4T5ry9z6JnZd8agllybtwHgm
X-Gm-Gg: Acq92OHYPqor2eAMgb2/7CviebT126COGR8hGGIqIB2LqlAeIVkzmaLXKSu0y01KWDs
	hb/wLmRs/sMjo1TLCG+WssGoaTWHTe8E9u8Ucdx06ipKtOf+crdfcsNklTQZ4SFCIk0u8br6ArD
	g1s6WonWwYjoYCtoQC9Qs7WM1np8tGSrm58Xg0dmfRruThNgzd8fWvyMHZsVk098otR1ibJaiSY
	I431ZY0NoLMPfnad8d5sOMIVTZb9UeU7QInIA7es/h2p7WU1zEoYhX1qaIGckcyL1l/rS8ttJPb
	etH0pvifhqBf9/R+3X8bQlJg33LucTkyULPbCw5Lp8Z0zg4HnHvidCS1EXq//hStd1C/hBw/LD5
	ddAcaKAOpuxR6m+23eWOIoyaV8KyJkZVWPBFAFlUFs3h2EfbkMfGAZWd/orRCtzGuzM1Qn47E2x
	b9xJlcMeKRWg==
X-Received: by 2002:a05:6a21:6315:b0:3b7:d9d6:9fc9 with SMTP id adf61e73a8af0-3b8bc376001mr2966185637.2.1781680597498;
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:37 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 15:15:58 +0800
Message-ID: <20260617071604.635627-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001638_216259_E97B1374 
X-CRM114-Status: UNSURE (   9.65  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
