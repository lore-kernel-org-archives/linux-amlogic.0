Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B2CC54EAA
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wGO4JYnBUl79BaNl99x2AhbGLzpn20YU8duQJDnetHs=; b=hESvHDs+jaRbnK
	mqAKn5ghHPCjrndXkXxaLn8V58Ww/Bm7hSBlHGOiWLNHiGUNOlt6ocV1WzDmBpImGnCQt0kXZYNmt
	dEL3lFuDAI8DmdMdx2031WC4HuKyTAm4Azn39gpvK1FW95dJCDMFkqVJyZFCYTqpVaVnPWnQv/3Rc
	s9CMjDBe5MaAD08p8uhhaQBSQJMgx2Grfy9Jw1X+f8KQu+6sNQO0ahOTKRZDYlhaGQps16H+AV4aQ
	o/1e7sT4DcQfMyyxC/A2gBVOzAkAGbt6BJMjzFXg/G7AfZe8ljyhem4dID5kIQ6DIGuuil+S6Rq6b
	KFCjRZ0Cz6t00uOadcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzYM-000Usf-34; Mon, 23 Jan 2023 16:20:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzHO-000OpI-K5
	for linux-amlogic@bombadil.infradead.org; Mon, 23 Jan 2023 16:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=; b=gkCJW1GiykKC7JyfI/RKrWvPly
	763CKA2UHk1CDj8kfV3kOCVdNUslVqpOphvCEG9s/lvNWor6+bG+77iTsa47xzwZWt2OVjf1VDJJ2
	dwBQWj0qBOh+yQ3XuO2ymant9+gXo3t47n9y4n/T0ZTfq36f8zeJdxww0aLGp10SLPYxu2FU4eb0q
	IxwZrDyJ0Gb1dgmT16ykLQkPa0+eWBsUGTAFxVmFxPmJk2l/DvVosbTyBYqdJOJzDdICHm44+RD2e
	P2wDBfeYy0589wjMg0XaRPYJA5bmwy3uffOm7xNMvOKidVHMxjWtucB8vWbVQx4AzpAuYZKvNZ7KZ
	9LBtVp0g==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyVD-001ZEe-0F
	for linux-amlogic@lists.infradead.org;
	Mon, 23 Jan 2023 15:13:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id z5so11122012wrt.6
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 07:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
        b=jcfa4hARo1HJwIehRkPDvzT0+j43uVWrJYFNzZFKJFnKpJiYnKY2DxtS+F/JYF6uV4
         KknhnLaVrHDF1aK+YU+We/6hYH28642w2VsAR2GhuxMYrMGdHZ4yvQdKZpcnOwkKtjNs
         9YeAeCXyUlV+RLV/5E6LYVH0K+wemk8/uI/1dcbZpOzNblLuvGNxrTnammNGXidPuI0r
         ESQrQEpLx/TKFTbBmG38BRF//5BuQ7VLC+rC4pjygLZu77HP7SzuoAViTIttym9i2g6+
         dyPK25KiunlTmQVEYImYPt0PSo2l+BBax4BFQZTf5+cfTrrzSHX9Ua9rb0bUiuClnAvS
         sn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcO0beBhJvY7L0pAz0ix6ZIFb3bQV/tZup2eSR9fEjE=;
        b=p8vPZ650e3RaRMLM2TjrVD8st5FhdiujRd+24Lud2SwsHZd39/+XbmRH54a+RLDuq5
         ysvYrX8IKmGq4W0Dm11pHV6i7MzYkFjQTAKHi2GgAyfxpfwRz2jafNjuyDtDJ7c8b3jp
         YDDDSDvuX70mwenlJyYfneB96vO2v8AKmgWOiAeiVziO0DTqfW7Vz909x784bJ3vMr0Y
         0rPLRKDF2k2GZNQQF4H3KDOMjNQx9MUOvVlqTX2Blk4cKMcZOjMj2R+o+5L65rfcF3Ok
         6V1K9cLVlgiCGAufKmq266ookbS+o8wEh6vjKSgRLQKxY5Xm2xpAC2i5gTQcpdWiVr+/
         u56A==
X-Gm-Message-State: AFqh2krEyCWxJNWqdYZliAOtW+VOAWP1tjf5728n1D74BQTcyhkd7Edl
	xRiMHmgunXPoAC+XQPSQJVMruw==
X-Google-Smtp-Source: AMrXdXunaNSmvF24sA3mpkTnzyAxSSQqlgKz33L99W7wuvo753haLL+xzVFn6hjB2Li7pbF1fFW5Cg==
X-Received: by 2002:a5d:5954:0:b0:2bd:bdb5:baf1 with SMTP id e20-20020a5d5954000000b002bdbdb5baf1mr19905320wri.10.1674486800444;
        Mon, 23 Jan 2023 07:13:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:13:20 -0800 (PST)
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
Subject: [PATCH 05/13] dt-bindings: serial: cdsn,uart: add power-domains
Date: Mon, 23 Jan 2023 16:12:54 +0100
Message-Id: <20230123151302.368277-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_151256_024733_CF9FB149 
X-CRM114-Status: UNSURE (   9.37  )
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

Few Xilinx DTS have power domains in serial node:

  zynqmp-zc1232-revA.dtb: serial@ff000000: Unevaluated properties are not allowed ('power-domains' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/cdns,uart.yaml   | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
index 0c118d5336cc..38925b79cb38 100644
--- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
@@ -9,9 +9,6 @@ title: Cadence UART Controller
 maintainers:
   - Michal Simek <michal.simek@xilinx.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -46,6 +43,9 @@ properties:
       port does not use this pin.
     type: boolean
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -53,6 +53,17 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: serial.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: cdns,uart-r1p8
+    then:
+      properties:
+        power-domains: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
