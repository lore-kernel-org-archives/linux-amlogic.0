Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A26C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MsjfDT+a8EXdgfzx2I7cBh7yaH/P/6R5Fj1SntN0HLU=; b=wHQFB/MuibXcPc
	IdMmnbkjAgUyyfXVXRSa2UBBatSi0P9IwjokVpcEYEjGCTG3ti+rfpITHh3vTFuVJF0wsDBHXmCQ8
	MYBf11/dXLoVBTiCuC+TGFaXFbdZuzMuVF8ivGAOAFuoS2kWk/5gzNNWGEQYytQ6opfKL4J7ThPUI
	CuCKHC0fcJE2RgteWuXo7NJg931AY8JBK6LnH6En+DtReexyECPCd7EBjC5z0/0EAHbHiOQFrYHkA
	uJIoEoZSTDTK5O72u2Iv3mXuXiBQxVgzXaaGU1XlxJ2cMRWKbZfcEDX1OBbxHLKYAgaovMwdJfyWQ
	fdA7btuALfYk52S7RVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFTU-002raP-GH; Tue, 24 Jan 2023 09:20:16 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFT2-002rHP-Jl
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 09:19:50 +0000
Received: by mail-wm1-x331.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so560576wmq.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 01:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uL5KX+lq7Bh76mZga/YGxKAjqZK+AdDiUOgEFy1RwQ=;
        b=CqVtGiLsIQtBM5HC7e4JAs5ne7xOL0h7GAY2cRHqngOX6tAotoI4tdflCP332C9T1q
         ebm2ELFU1+Ug/a1y0TeWu9aGwQiLKKnWDSIEmwUZRAghplQkjWEQxaYBf5Ey4BE2k4jJ
         VK46ot2pwa00RBXGvfZYZg3SMXzA0Lh1pbW8jgf1rXVEeNuSnOQxiRAKaGRyvpkoNrei
         OJxD/0sU9CSdaNJ+wGU8nRten2J4szDCSGuQdFgJyR2vdcLR496YmAH/kCqa87QhjOTP
         DSyxz9sKiuG3/zXclPNhK65pMK0GXgVEoYgr0c13Sw0UIyWtsIz+fvqnELnsRql27WCf
         Jpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5uL5KX+lq7Bh76mZga/YGxKAjqZK+AdDiUOgEFy1RwQ=;
        b=1V/Fz2hUhWjoe5Z4jyntO5rXHN7GjSpWViX1Ls41T38jxxg0gQm/1thOs/C5fl35+/
         1hvQZ/x0bdHWQR+NuMleXQKLknNzHgb19YE3kTJpeKLtSFdz7id3sroDhWGorlFWJqw5
         F6qhxfRtJ/jzT+JBxg9Pk3AOYdZCgNdR5wlTZ9nSeDlwjFXgApQCGNv5WuoKrafeyUIm
         hcTtRLwNnyTesllWvBZifJ5FUtM23jy7kHcPEAKsXoGTplsCRhwEMygiu0tQWVPwl0NJ
         hMyMvOKWXTBsggG2CfmkhwyDpVRSnyz4EPGpfHfb+0CX9FgNp73GRKzbZ4/zzGIgXDBh
         53iw==
X-Gm-Message-State: AFqh2kqGQ61aVKSACP38t3O3IKM9PBjno6rsH5ppBKmGk3hqiMt9TUmq
	3c9MVPzkxMXYmBNWnS1sBqnqaw==
X-Google-Smtp-Source: AMrXdXt6ZXjN2UR9CDMMCyR/xCneinHGOcEykSqybnBEASsnB1wxAPHlJm08OnK7Not9iguLyjZzVA==
X-Received: by 2002:a1c:7216:0:b0:3cf:614e:b587 with SMTP id n22-20020a1c7216000000b003cf614eb587mr27496678wmc.26.1674551987275;
        Tue, 24 Jan 2023 01:19:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:19:46 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v2 05/12] dt-bindings: serial: cdsn,uart: add power-domains
Date: Tue, 24 Jan 2023 10:19:09 +0100
Message-Id: <20230124091916.45054-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_011948_706230_852D42E4 
X-CRM114-Status: UNSURE (   9.85  )
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
Reviewed-by: Michal Simek <michal.simek@amd.com>
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
