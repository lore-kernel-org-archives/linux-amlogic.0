Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BF4C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi/dk212Depebju/qtds0IjIJ8PyOkGc4ET7knMnMNA=; b=BJfDOQDdKRrvB1
	TmBcP0qNM5okS14PJcvCz8NCe7hInUVHn1Ox7NDPAXZM668mozDC1TiV+hNFlBfA1f0/fNxOTl57m
	6ZgyRBWO0Mk44LSrMymeJOsVWPFIC1xrUv97Vnp0Adbs28BSzXFbVWqSWjP6XZIbcMXsCy7aEosG7
	9D/5Pk/i5aaykhcuL+lwpFfUPq7jckWmPnpjGX3EuxQl4bOhIfBsX0CZOgqbsTH4ezVwmtVWBLJoB
	w/rn1eTg0nSlnzy0VTxJEff4eXOMl45pztqN93852SdbteKKFRt1OTSl6QrYeRfMfonDxCJqbkCyu
	aA6WfQdSl4MXxsjLggEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyY9-0006f4-4h; Mon, 23 Jan 2023 15:15:57 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVY-0005O4-Ol
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 15:13:21 +0000
Received: by mail-wr1-f50.google.com with SMTP id q5so6462666wrv.0
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
        b=gBYz9l1ChBFTjyquDh1ZRllUadOhS3AOoSty4qM7gQFn3MA20fctQ9Rau+B9QwDvSO
         rwnELh0TsZEV1SENNaAwxrbvMZpyOcQpqOrZkidOK9PyOdIFdQ68uU5lY07aC9beRBFQ
         VFcEGa1/TJ9hw2tpi4rS8isfX7TV//tB0RhC7zKfWQfQHs19bT/PWeLt+XpmCmcpZ3pQ
         P+lQjZV5iQU7XifV/MniKY2UR8WQFm5+rkxBfAFJiDIAcFsY9yb8XamTbrGGz1HsH3ta
         tGwvMS4ewMzZ7GFLQSP06NgULdL1ShWttqEcreqeLg/Uh2RmDqDdijBb41n1CwJPRrSD
         JeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjUDPjFfIstrArrttGkIiPvgInIpWMnlY5IxKwKaSmM=;
        b=J65g4YQRMdoxyi3f0PC3W6UkTnn9zpfvG9/pX4r47A56JGTMeDJf4OFB5fPqaLeaNC
         t+naZblvbH6emsimN97jsXLQpzS2hlwQEY3tJJtz4OP/tkq4s7M0rMn3b5paSWT0Mund
         4e0dTpBajt1WlCkLbA5OvHZFFjC6QOeUMe/bcz06PfibHhWD1zXuP9LKvNQDQKdgY9Ui
         DCChhA18KV6EHoD3B9duTd7x6X5a2bXjST3jy58I8oN90rvbLZ+r0AlOsi5ft3g41Nvv
         oxJfsfVZtIYH+q/MxHLlAq0QIKw6PdZaOxBu+sSvOFQ5qyybiMagaFJtA//mRdo/joeX
         dJpg==
X-Gm-Message-State: AFqh2krjoIB8cv1NWlJPmE9QWvOhFqBvMXesWvO0w/sHxwvGMaxAuTMr
	Jldf+4qC8UFDhA9W5bZKXemgRw==
X-Google-Smtp-Source: AMrXdXuiyS/nE1Nc3w4Ako2LBIBfE/IBn8kE3nDojB39mO64zJzuJZFatWSIZAd0fnHSuwEectyleg==
X-Received: by 2002:a05:6000:98d:b0:242:809e:1428 with SMTP id by13-20020a056000098d00b00242809e1428mr25207621wrb.5.1674486793685;
        Mon, 23 Jan 2023 07:13:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:13 -0800 (PST)
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
Subject: [PATCH 02/13] dt-bindings: serial: 8250: correct Nuvoton NPCM850 compatible
Date: Mon, 23 Jan 2023 16:12:51 +0100
Message-Id: <20230123151302.368277-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071316_932333_ED2066BE 
X-CRM114-Status: GOOD (  11.41  )
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
