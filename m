Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28A0C54EB4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofeekAeXF5gCGOVc9WHQJN+7QY0vMaFqtSW7EjG1g+U=; b=ZSB8CGpK5Unuhp
	L40xVu9IRj79qi4iUssm49j/p8yCHT1m1tuuNb1fQAHATU3u2J+S4f6fHCQzgTzgchcEh1pDXaDD4
	ubpBgaS5C293exSdItyJ4twwWgl3bHhGnXAX4eleb46D7JHywtFr3XR3HmR/CMwPiCYw2FIKDWam0
	K4/P4AkOX1e/gsUF26KJhuCd0VUbvKvbuyA2yNfy/SOloYrxrI3fATunKR4ZRJRTD/eASErFWg8I1
	p9lZWiDa40DcaF0yHKzU02kKxVXXOGn+75+cLjY58beE5+ermWoZXJU3H2y/zqxG2WDxVibrOihhC
	li2p/I/3B9CBEnDT5RCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyaC-0007fn-5d; Mon, 23 Jan 2023 15:18:04 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyVj-0005T5-Fd
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 15:13:29 +0000
Received: by mail-wm1-f43.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso9350098wmn.5
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=zKwo3e+7uOyJGADkS3SvY4tG/YcyQsjz83Hw5I13CEburg4Q5MNhT/O9mXFaHC1VHm
         NHpBnUzfLRasM5hHsboJ8qg0tjtusxjgkgU3z7WRakchQU+RDTPBJnRDSdlQige5MWjK
         n04J6T7rlTs3x9+hGTcOrAiMVD24XhCyrC8pae432g0HFZcOudET18IAy6qyEVL5YFKe
         tiWwsiNjm+uFGz47RWjXDJJuk1CSEYl4taTXz6UiG6pRB6Loe9dj7kV0N8md6ZyI+0ft
         Plr0jHIhb9I72XwyXwCtNsowVRCU61bWwloIL2WLm69gsGTF/KCt+exSO/oKQmjopXf0
         1F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
        b=XjPnAmLxJVQU+pKiSWNbTQ0i1jf0Fh5/d4+olEU3sDrfFdr/8hzdO83ea1ghKTquoX
         L0gztd+5VlTK0pcxkbUY+4yBeMB0Rq4PXiUzuCD1Zg0drGPkX2tAhIs++i5OG6WKHoz+
         mUNgeJpVfJhgro7SuNrMFgTtBE8DiMVFlKnOUQbkHevp/nSTh7XVqYYf9Iagy/qeHKJk
         /oAifDG2Q5U8rzW9rW+H/lkBQDkPhiKUJD9X+PErOry6WblUwP4C1KEzonfvFkTqZgWT
         8UeqX48tEl4W+44b9mfe8WF2elC0Ub2om0DW1d0ezxaRUxXgO8xeI9BsbYSr6i/kSnGU
         xi5g==
X-Gm-Message-State: AFqh2krNFe3dE6zzzxPjFWrhOTf3B9iyTD/Ue/cEYnC+nrzUWSK692t8
	PY6P/eBqQWITSPlRLgF8PSfX3g==
X-Google-Smtp-Source: AMrXdXszs6a9DYNOLInJHWRaCXLtQ/W1X0idHVCXTCQ9XdHt03vNRQ/V7BA7UrJDU9EYj7btHPSV3A==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id n26-20020a05600c181a00b003d220439cbfmr24384116wmp.10.1674486802800;
        Mon, 23 Jan 2023 07:13:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:22 -0800 (PST)
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
Subject: [PATCH 06/13] dt-bindings: serial: 8250_omap: drop rs485 properties
Date: Mon, 23 Jan 2023 16:12:55 +0100
Message-Id: <20230123151302.368277-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071327_562227_FF4E4680 
X-CRM114-Status: UNSURE (   8.53  )
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 53dc1212ad2e..7db8e5477b03 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -70,11 +70,6 @@ properties:
   dsr-gpios: true
   rng-gpios: true
   dcd-gpios: true
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  rs485-rts-active-high: true
-  linux,rs485-enabled-at-boot-time: true
   rts-gpio: true
   power-domains: true
   clock-frequency: true
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
