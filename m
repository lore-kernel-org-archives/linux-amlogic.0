Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D54EC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gV5q8oS8Ic6+YtXbW1u/WSnTGs7Tn6PpHAhREeZrs2Q=; b=JMva+Q9MXuhKsb
	n+OXWDfxtJ2LQ1FyyDF4MohamNzdpyOp8japitcDrdjcvFfgej2//L9hFI3lFVwZsB+r6f7UzCnvj
	/0DOFihmUlzcCr4EJVrijiiL+4jAlb/2thAt/qOfnQGH5/orENgUhH6jkrTNEKYR6xgWUgBlC7Ra6
	lHB94mpDGxZUotOHs6h65Hv9um/ak9o6gluOYq2XtB32/YW9PgGSJtp7QTDlyU/TLs3TmtY8I6xM5
	AgNPkr0cAx5Ixzof2oVzF2TFqJ09eD29g6AWT4C2EeRwbFb8dpdNGXa+iWXrkHtLr2BkrTkvj0hSg
	3o+TopB/MaGJsJpZEYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFXC-002tRX-Cg; Tue, 24 Jan 2023 09:24:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTK-002rUC-Q4
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:20:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so12366798wmb.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
        b=CPxobIJe+YATUdVShDwFvEedr8RMcP704WVL8YG02+Iob0qOMVsaRzVKgi/UdLdUU3
         gS99+M49vYEyE6B2zC4wRJtJhQIUSmiBd8zU6TIBGHNjVnJUo1H4lqAFBjIRqxCa8/7u
         fW312YrEhd1LmL0WPkyAzqoyhbByHBITKwH5alfMEAx5a9x0A597UHvOZQLbIaDL42em
         cq2UdXfIR27iQAwIvwr1bMS9F1FTaDC6ukF2UuD8a7tlgDMLK65G1rzQxDx0cWgDwhpl
         JdZJQHpPGxMCwbPyYFgUZNehhlIXemwcN7Ju1kIVbk4fZ14iRf3CnJ9BTzuUH4OuAe5E
         rdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
        b=jc35buPKCxe4nCxrhxSBHRTTDmF5GXhpqP04/zxQDLrKPTxnuNkyhBUWBSUZgpIjBe
         AH4IP99LDKNx2eHrKZoiCsOy1Ta5LrXLBjczXq7WiONbHh0uKHQIXyRgy+JD2M2VNSSh
         N1tdrx6Zpqg1Qh0TNs2y9evwuNh147KiQcHetGF78iEA/ilfTEM9PieEeCf1Xt+ZuU4I
         sbagiAfw31Fkc1V8mmB/ZjBNVyl/6myLmhUmefQCg/R33buD+9eRNnxRMatwXVDNsthD
         E2Y8Tlw2RKoSrbkXyha7fLmUfOYm+yOqefmxskDB2DWRgc0FoD1c81ysU6umNRTgnQgw
         mJmQ==
X-Gm-Message-State: AFqh2kqcK5sL2g1JVdR+IeKc6A3v2kiBiZKR11uPNTK9vZ/Jil5YqNxF
	WrNb88nIQFYRZJLjTy2aumyy4g==
X-Google-Smtp-Source: AMrXdXvoKzAQYXHhE3iqhd9K3QqtBf5s1S6xQrft6zrb083L8IWCVu9+Yf4WKPAw9wUuVyhtxaOK/g==
X-Received: by 2002:a05:600c:540a:b0:3db:a3a:45ac with SMTP id he10-20020a05600c540a00b003db0a3a45acmr26791698wmb.32.1674552005467;
        Tue, 24 Jan 2023 01:20:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:20:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Chester Lin <clin@suse.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Pragnesh Patel <pragnesh.patel@sifive.com>,
	Le Ray <erwan.leray@foss.st.com>,
	Peter Korsgaard <jacmet@sunsite.dk>,
	Tomer Maimon <tmaimon77@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 10/12] dt-bindings: serial: st,stm32-uart: drop common properties
Date: Tue, 24 Jan 2023 10:19:14 +0100
Message-Id: <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_012006_889564_FCE9F362 
X-CRM114-Status: UNSURE (   9.68  )
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

The binding references serial and rs485 schemas, so there is no need to
list their properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml          | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 85876c668f6d..1df8ffe95fc6 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -35,8 +35,6 @@ properties:
     description: enable hardware flow control (deprecated)
     $ref: /schemas/types.yaml#/definitions/flag
 
-  uart-has-rtscts: true
-
   rx-tx-swap: true
 
   dmas:
@@ -60,11 +58,6 @@ properties:
 
   wakeup-source: true
 
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-  rs485-rx-during-tx: true
-
   rx-threshold:
     description:
       If value is set to 1, RX FIFO threshold is disabled.
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
