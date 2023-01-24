Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD7DC38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvkkae4OMoxEAKNap6+L96dhZAkVmI0i/AbFGEgDy1c=; b=ydIbIDI1/qHaBW
	xUIsjInOrmW7IMU7lC0QupUy8XMp5vHNTNl3pngqqlK7zhL17vOO7b78wH/pS9o7EXD71uA5vTitB
	Q0hbyy+YfarKXefalba1KSxr8jFDU/A1cUeVVvL5BnIXOQoKCndKuMdUhQIHRHPRv3ooEyhcqkW+3
	xHjl74km0HbK/3XNdfEGPXrTZkZMbeQDNFTEBcqAQneS9od0ajMAFvumWIggnq3su8vJ/HlJ+0odZ
	bLbNBmpY5ooUNB82PJElIoCOz72D4kD/gs1mG72B5Fya0wjLCqPO312qwnXpF/w1WK2MqOkkf+Kzb
	eP+zoGHskUld0YpKII3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUl-004NIg-1V; Tue, 24 Jan 2023 14:41:55 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUP-004N5T-IQ
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 14:41:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9so14898467pll.9
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq3YLnLVdkwJ+hnndTnVXYO2IvsFe7R/GdMhEuzT5j4=;
        b=qMpHIwatJI7zt7K0Oj5YJJtNre1MxSkLAvexCvRqP0sIGGVEuxDWUkXxM2h8INC6++
         400E9rHBOh8w+sa3EX4PJ5/lnt5rrnU0oBvBK9XrMdsKyVWF2Vtynj27X0kTQ6Ol3an5
         Apgf/y9I8CySuRTNTIbgYusdiWQ1SWQjJSQqZus6cQ/uXXC2Xc7QXhbYGh5qKK2LnG5z
         LiLsOzpxV8oS08MvJyE2hAUyORdtOkxskccUWUK/Wut7Y+oIn3xSZOD3Oq32wkNrjDxs
         TSZ0KY/ESm4aoJw5iIihi5Nh1X4cb9UglvXj8WZYUnKZcnrSxMnAUwmZ2vMrcvcR07wc
         FyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hq3YLnLVdkwJ+hnndTnVXYO2IvsFe7R/GdMhEuzT5j4=;
        b=JmkJOCPlvxXqelMJuT5EIUlsBlRwzygSawUeKcs68WBTbYGi5FDb8oa+rDqvRJuNLG
         9ytYPSfdxo8Y7Lx+XSl0vy9aAlMSWQAc/+huO+ceAXOpNVh3PqpbRD0OJTnoFCT1JfBa
         JovKs1u2Kfg9qV30feM9CWLxrqOzNHDKZHNPvhEtsyLEe3BVU7dxbOeegkSTmmcBKKfY
         2FpXblayCkm/4Vqu5u2k5AmrtfmmV472ZtsRyzuCKsGg1LkQsgQIXdVH8fFlLDId9Fv3
         ed0FAUVXJfnOKdVrJWeFH0b/+80Tf+a3F77BRjA5bMG/wgAT8THWMTH2ku9SEP6aG5R/
         HDwA==
X-Gm-Message-State: AFqh2kpiUA5YC1LN809YH2iXWKeXbXHXEHOlcJVHH4s2A0RsUrAop4QA
	bPKSbYT7ZNoNzD+zAscPwoUrYjZSrwk=
X-Google-Smtp-Source: AMrXdXvY1o7Qhxes1YcRkrxgd4lGAV6Hmi6k9DyO8x/ZrZHVk5g2zWtj7+yHvsP+tOAhpSj57x53Vg==
X-Received: by 2002:a17:902:eccd:b0:194:dec8:9824 with SMTP id a13-20020a170902eccd00b00194dec89824mr23203736plh.26.1674571293053;
        Tue, 24 Jan 2023 06:41:33 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019602dd914csm1747865plc.180.2023.01.24.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:32 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v4 4/4] dt-bindings: usb: Fix device tree binding for VL817 hub controller
Date: Tue, 24 Jan 2023 14:40:53 +0000
Message-Id: <20230124144054.13556-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124144054.13556-1-linux.amoon@gmail.com>
References: <20230124144054.13556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064133_677427_19FF8225 
X-CRM114-Status: GOOD (  12.02  )
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

Cleanup by removing unneeded quotes from refs and
add maxItems to reset-gpios and fix the required list.

Fixes: 31360c28dfdd ("dt-bindings: usb: Add binding for Via lab VL817 hub controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 .../devicetree/bindings/usb/vialab,vl817.yaml  | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index 5f9771e22058..23a13e1d5c7a 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -14,29 +14,32 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - usb2109,2817
-          - usb2109,817
+    enum:
+      - usb2109,2817
+      - usb2109,817
 
   reg: true
 
   reset-gpios:
-    description: GPIO controlling the RESET# pin.
+    maxItems: 1
+    description:
+      GPIO controlling the RESET# pin.
 
   vdd-supply:
     description:
       phandle to the regulator that provides power to the hub.
 
   peer-hub:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the peer hub on the controller.
 
 required:
-  - peer-hub
   - compatible
   - reg
+  - reset-gpios
+  - vdd-supply
+  - peer-hub
 
 additionalProperties: false
 
@@ -45,7 +48,6 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     usb {
-        dr_mode = "host";
         #address-cells = <1>;
         #size-cells = <0>;
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
