Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3EEC5AD49
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jun 2025 12:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Rng1SlFlFLZOZiYKNmgWAbMYmmJDKMJssdBLeQUQNs=; b=SMVlVwkuFgCBVk
	ycOdDaFEeNW1180PAEjgU/NwclAd205z7/rWzS/i/vaE97dXvGZOHe8RXr39a0CRxgNcfzHp3MUfw
	oK5fTv+/sE6ttp2P5NqR29t9aFZaxOHj5+23+N62JmP16jagwdaeLcF2tiEL85Q4VJLwkfjr2BRsq
	tnl8iAJLcoIp44i3vffLztkVfcwSM8JTU1B9nzyfp0KQewiku6YbRscOIK1jDOksLYmaFWGSzl8Rf
	LswB+LkS51oDdF2JXA930AHoOWTBO5tPyKKD5+2VAce6xPz/8i/h5mlyVbwxb/o5EMFVMYQD7M7/I
	VV82G059UwPVKdGF7j+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQPV-0000000AsdC-1sKi;
	Tue, 03 Jun 2025 12:06:29 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQGq-0000000ArUE-3KMb
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Jun 2025 11:57:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451d41e19d0so2664715e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951851; x=1749556651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=MgCMnp5I8EwRoBnaqAOdLModlpyQ0XO6lo362o8Ry6kuPUlyFn/ELlqSJ6OTywENkg
         BKW6MlMQE5JbnDMaqNXsd04fPe0V2Jl2AbfySTKJP/eYdHW5D7fGggKk+0yuK8/JUpZq
         lyk7n0BbmkF+OkHEGvrR7L/idwNyLfHlFoyvnejnR/Sp869vPw2mbIl4taMVzrDRM7ge
         YMxb1Rh9cba5GTI6SlN8ThhJh32mg+CvSNyyCSEhSn7zZ7Gd2hb8btqnvdTSHyCDJwcp
         6fORl8ICelxHqK5KI0vyGJ4Ibq1YjIMv+Mj/4H7dwnB0BhQCMW223FtDSpXvK1gYEFSH
         126Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951851; x=1749556651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=wFPWjuA0zbaPVaodjfnzKI11bKDU5LSTWcBXYVszROn9tJ4usuNYGlwd8Yw5mZjMmG
         0kDC4kyn2H4rpba5wZ3sv8jWGvJndyrtI/yHETpGBFRuy/jpQZRBstL3TYBypYv2SDsy
         7E6JrrGJRMCxVD7LHbZWVCUGdR8L8ujCJvavYe0wIgMuiX2xEWrJcNwg1vYoK+rbDhuV
         EhLtKN6/amTb8m9R19mXxXcjlpNnmyGt+cjIyPbwbHl7eK/yDL5HiulqJIDJREY4eyO0
         m2kGrDLuGUxYmG5BMMCbTf3XXvESiQeww9Wtx5tmuDBRV63k+xFMVVvZwO2ApPOesgyk
         BuWw==
X-Forwarded-Encrypted: i=1; AJvYcCXg27CrHE0U2ybE4N06DHf+lUuSQJ5mf8xzBnMwZ0npVN3SiThwg3CigbNEZAKWAcVrZ+L967Fe9mrrSM+y@lists.infradead.org
X-Gm-Message-State: AOJu0YwL77xMocdQvDmI9D4MgBQUapVFLjPYrQFLgjha1vWl4sX2cKPA
	W1vXdBs+sH7CqA8DmCiQ3KkM8kZcwX7DN65XusZlMz9eOpFsV+Mtiu/1hCj23q+vPS0=
X-Gm-Gg: ASbGncvTslCXuqWAlTtaD1QeDnHI6kVS+nIArG8Intz/TQZmjJd+f5Vs/AmJPJwI8lI
	+ypUvOSo+PQhbflrox7AcwP3QibbAOUTmaDwa4w2tgQk+EwH/L9HjL/ZIdoBAgZRH70V2rVaHta
	3lcVCgJvaQBi+cmixU6CqcEuZGChjr3QmhBLe7oprpFGTlgBh/7i8angyLKXPFC3s3EMKgz1Rn9
	WsMbNdfP0cpzhy69v23Wp5mfOmnfjLkajQf4LPyOW8+ihryxq9NmQKSY5nFTWvoMWEoi7LwIpi/
	tuMueY3mMxjRPJFG2ReW3URBnlIjVaQX3UzgeTPXaOidjB77C2UBT3QUIjEUVRZ73L4w9CCjrRm
	JBoR69HrIDILxY7rPfmTGYg==
X-Google-Smtp-Source: AGHT+IFtYARGpAfUwedcZUr+rv2i3DwXIs+E+vyvXAOm1JZEhhjjlgKaNxSVWr0jm35V1p0FWxTuuQ==
X-Received: by 2002:a05:6000:144a:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a512c0dcf3mr920895f8f.4.1748951850998;
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:10 +0200
Subject: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
MIME-Version: 1.0
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMdIBzxTrvdsP5gds/d0vjogFtPZqCCBexkU
 t2g8c+MQ+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHQAKCRDBN2bmhouD
 1xFyD/9L4+1GTV5DN1265YZBVsYfGT671n0VhpafJSb91mwvevxDWPkwfY40WAvavWVSdnU+oKt
 Oul+mg/UJQ89kOSzcxD5LsRCQ9Acsti3Mrc2v+VcXQ5aaKGlGq7jt1acfeHhjeNosEAA5Q/7GGm
 eGS3YqpRuHV86siWBlHPpFj41TaROQ96ys/d/JfM1FXitBk+o3yBl/OYpWLB7yPVR2Z10titntk
 KnMS7dslZtULk5I/aSaL/TbCHAPuqYMwom+/SLCL+0+ujJZiLU4XJoZ+lOGclDgOgoRXIVmFHLy
 irFm7Ztc9RUbHsC/CWQiAZSY3kGwQHDfxSbCfdceTq8dLC8feQ5/8UwFAvJP5pHuUCGmLp4nOj9
 NCR3wksI5Jhat9TOXbmwNu8Kz2+urDI5jTQ3cX7HOojU8O4d+lByyUWVZIP2AlA/C20a6gv+e4p
 P02u3sMkeIYYEcZYgTdJAs+VqRVrdEHt2IO21B9N3257zT4/OF95e2urmhCQyJ+Bi8SjdskB7jQ
 zyl774llaFFuVkbXNBCuRXGiLGYdXtf5iES9z33x77UWRyzpUFqldA4EucRbBYnQR3KT5SomaK+
 yDnULbjaDeWyLOrtLDh2fBnybkwPfmkdFDiBKfXFCiWAmJFWEfh/RFzExHvT0ZxT9pmyAT0IrdY
 RkEvLVdycgzd0KA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_045732_844046_086162D7 
X-CRM114-Status: GOOD (  11.31  )
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

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 75d5d97305e19f50059e61a4db2632765885e850..87d31963c1b73c956b9782f029b1a5ad2654f507 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -68,13 +68,13 @@ examples:
     #include <dt-bindings/reset/sun8i-h3-ccu.h>
 
     msgbox: mailbox@1c17000 {
-            compatible = "allwinner,sun8i-h3-msgbox",
-                         "allwinner,sun6i-a31-msgbox";
-            reg = <0x01c17000 0x1000>;
-            clocks = <&ccu CLK_BUS_MSGBOX>;
-            resets = <&ccu RST_BUS_MSGBOX>;
-            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-            #mbox-cells = <1>;
+        compatible = "allwinner,sun8i-h3-msgbox",
+                     "allwinner,sun6i-a31-msgbox";
+        reg = <0x01c17000 0x1000>;
+        clocks = <&ccu CLK_BUS_MSGBOX>;
+        resets = <&ccu RST_BUS_MSGBOX>;
+        interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 0849799ee0c5caaeb27fe1e3e3714a630a7c2b09..79963c9878bad1684fa0810ad71554af2ceeb75d 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -46,8 +46,8 @@ additionalProperties: false
 examples:
   - |
     mailbox@c883c404 {
-          compatible = "amlogic,meson-gxbb-mhu";
-          reg = <0xc883c404 0x4c>;
-          interrupts = <208>, <209>, <210>;
-          #mbox-cells = <1>;
+        compatible = "amlogic,meson-gxbb-mhu";
+        reg = <0xc883c404 0x4c>;
+        interrupts = <208>, <209>, <210>;
+        #mbox-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 4c0668e5f0bdc1e03404cbd58a392465d30b0e8e..474c1a0f99f34777e1bed7fc0a34f89320a93b7c 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -78,11 +78,11 @@ additionalProperties: false
 
 examples:
   - |
-        mailbox@77408000 {
-                compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
-                reg = <0x77408000 0x4000>;
-                interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
-                interrupt-names = "send-empty", "send-not-empty",
-                 "recv-empty", "recv-not-empty";
-                #mbox-cells = <0>;
-        };
+    mailbox@77408000 {
+        compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+        reg = <0x77408000 0x4000>;
+        interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
+        interrupt-names = "send-empty", "send-not-empty",
+                          "recv-empty", "recv-not-empty";
+        #mbox-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -68,12 +68,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     secure_proxy: mailbox@32c00000 {
-          compatible = "ti,am654-secure-proxy";
-          #mbox-cells = <1>;
-          reg-names = "target_data", "rt", "scfg";
-          reg = <0x32c00000 0x100000>,
-                <0x32400000 0x100000>,
-                <0x32800000 0x100000>;
-          interrupt-names = "rx_011";
-          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "ti,am654-secure-proxy";
+        #mbox-cells = <1>;
+        reg-names = "target_data", "rt", "scfg";
+        reg = <0x32c00000 0x100000>,
+              <0x32400000 0x100000>,
+              <0x32800000 0x100000>;
+        interrupt-names = "rx_011";
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
