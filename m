Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63BEC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi/dk212Depebju/qtds0IjIJ8PyOkGc4ET7knMnMNA=; b=s3QUiuzsUy7nrq
	lAtAk2wbka2mM4aFAjkizKizheiqCJHvY0OZCsQ7ABqYtS6JIQa4NedhAamx+XhEcSS93m+dsEGLa
	pp07g2lns1vy6vH4Z9tAMhBvklq0bw6TpmalfCwPukn6YgHmZdN9BTMPqGm6LbVNmA7RBU8BmHzHo
	51BWIGw11eokZff32zmC6Y4IOcESofZ1b8DYaJST1L8PIzI6YF2i0O3bCW7TBu7OnPHG7PQ0VQEh5
	VLiGlDU8ZF2btvnGKwm9412A4xHq/VAzz3fnIYKzEVqXoi6fcnj0TpfxLcHxEQxmScohXZk4LnsQB
	q/MdGEU7NBUtv3m+GevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFQ3-002qHo-Dy; Tue, 24 Jan 2023 09:16:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFPe-002q6m-L4
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:16:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id t18so380121wro.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
        b=ht5LLAmNCXWk91VFJhzqk3ETiT3S9WKDG9n7Lx34WQTWnXdrGkZP64QQUAWkTtSXNa
         ligZsLEVT1/DBjRLdUveGHswtzvOyZziia9CJSqHYHxw6ygC5yzZG+P6MGFe1hewkplA
         /dTii7SzPpAqyO8zaMUwVmfKckjQAein0gvyeQgaBlVkfNUhzd3iZ3R32jVGlp8gek4A
         DYnlWns/Yp0181BU/8sD2FC7rZKX9/NW7gqpzGeubeDSWD4d3HvQWkzyFbp8B+8h4n+W
         eDhNjkxQv9MBYHh2wFwckrcgPT6ygEiKKtCDU5C7JxQpJOSSZGp8FmyBg/n5lNAQRJ93
         nuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
        b=AcgmQEAb0nq8fCD/lnsX2Io0rLWYSW0VzmfJOgsUYaLCyiJkRl2G6sk4sUzCbHpm8s
         km0wkDtt/QaTaPWOXbltgg4g+1ZcSjzV62gzBUyY/PafR/FVTDD65n8ggJYX8QFTKZP7
         JYAwvXiRRVBF5fLwt5QwDf3mKpyue6E58VYp2Fk+585WzDDKTb6eAzATDZaYpuSHhbJV
         ISlnBkLHH4i5fCQ8oOHOL6IR/Y0KsYSsgBLIK7b2YbLYNXRfJe6Uv8rSfJRnPk8LtwKH
         mTQLQSxuU/UeFqa+SHfJRck2DSZh9mvluRXJ08YGIbN41eRFADAY3Atd3ny5ffB2SI/l
         4XKA==
X-Gm-Message-State: AFqh2krLdYGeDfPNhkPWYe7g8i+Z/1p7m1RsLN7+G4UuwhU1fL70yLnu
	h+W9C8gfcQZbK14PWeIlis71rA==
X-Google-Smtp-Source: AMrXdXuIOcn5b9xxfQPmfx/uSv6bF6pKWJ7ZoEGBGaeCFLwbW79S6Ckn7BhmNXuURhSjuTgFfkIeIg==
X-Received: by 2002:adf:f14e:0:b0:242:728a:fa7 with SMTP id y14-20020adff14e000000b00242728a0fa7mr25807903wro.61.1674551777096;
        Tue, 24 Jan 2023 01:16:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003c71358a42dsm17882131wms.18.2023.01.24.01.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:16:16 -0800 (PST)
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
	- <devicetree@vger.kernel.org>,
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
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/12] dt-bindings: serial: 8250: correct Nuvoton NPCM850 compatible
Date: Tue, 24 Jan 2023 10:15:52 +0100
Message-Id: <20230124091602.44027-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011618_726234_643EB3B7 
X-CRM114-Status: GOOD (  11.85  )
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

Nuvoton NPCM850 UART is compatible with NPCM750, so add proper fallback
to match existing DTS and Linux driver.

Fixes: c8177f90b7c6 ("dt-bindings: serial: 8250: Add npcm845 compatible string")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 34b8e59aa9d4..badaf6d5b6fe 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -62,7 +62,6 @@ properties:
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
       - const: nuvoton,npcm750-uart
-      - const: nuvoton,npcm845-uart
       - const: nvidia,tegra20-uart
       - const: nxp,lpc3220-uart
       - items:
@@ -92,6 +91,10 @@ properties:
           - enum:
               - ns16550 # Deprecated, unless the FIFO really is broken
               - ns16550a
+      - items:
+          - enum:
+              - nuvoton,npcm845-uart
+          - const: nuvoton,npcm750-uart
       - items:
           - enum:
               - ralink,mt7620a-uart
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
