Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071EACF58F1
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ds327ui9GO5QIfJJUPb0kjR5+Vondul5B3r62OptoxQ=; b=RGKLGwyLDqgZC8
	tc0YZPomnqTJo7jSGXQ0OS+eIkg5ZI2fgBkldaMXRTdlkshnnIt0ir2zsPd2tLRYf3J7Bi0MjkF+L
	wD1ahRI5OguqTCv0FHriClRga7CYGbKJFxlAcyo7WIoftvm6vL3mwDo1fwfSfYLgfjUCHG8RiIK5g
	f2cCQBxPmV2JpnY6fI3tWjzMJE6WVo07TBuBikq1emiN8F1trsx9K0eKffl3vdTwecjMEYuJWEc3d
	VvIpXnSvvLG/2epbR8bKp8xfrfOYf/yN/ZzG9Ifu9+TFWT63oQFJkAH44wySw6hP6Xh/KobfuqEgI
	XML6Yf87ONtwc8qpBMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZNU-0000000Bpow-0OKK;
	Fri, 20 Sep 2024 08:52:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ9Y-0000000BnLd-0Y9M
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 08:38:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42ca4e0299eso14169725e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726821489; x=1727426289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50X9LprKoNeeESL+1kpHxKrSynXSTK2sGLyRt4LI2AY=;
        b=MZrPs4Uunend7uG+mm6XUP1u+tnKS612nWhHh2dQMRVDC4LQIr1Jq2fa3Lw6X4fRtx
         vX6zVTbg6LG3UBuA7ViqHAZZr4tWjAMGJDByEeQCMo+XcjhKjt6twkt5a82CEOHhqjK1
         R3EWRmMLuqS/9usQnj6U3HnG4/vy5yK1/nG+ZlFbeseNCujAGuMCWAgJDo+De9TxatOJ
         IiI+x9KifeGu+1dPRxQSsQCHq26RBRheWtI8w7ibYTo2NgPKr0hc1qhqWr/WcHXcYqwM
         /6IkZjQPmWqCfYpToGmTQJ4CdfFiUAoDcNnRaF7hn88wL1su1ozuV3Ed0S7e0nthrnEU
         aDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821489; x=1727426289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50X9LprKoNeeESL+1kpHxKrSynXSTK2sGLyRt4LI2AY=;
        b=AinPqv4mwEQ2jQ5ZNNuOALVt+v61jWvseIGCjgTh1H/MzlinVHHMhV9ghtqVsI+azd
         n8AqRJOATW0xMJViI/WwqAwVCB1W/bR+aF/wrk2iZj7/kQf6lye6X9czZ1s8KrmNAnl7
         M3Er4nYPTkJIhQHEb3D4Ap5BDEDOFY3tbHBFN0V8/m5+iru9o1Q/m21WvDoDdhCrGNtI
         t6F75DdkZkfymIpuF7W5qdNqdR2TrYOV75Mf2R2gzATB1PPAXX8mpWMp+Iu0Myyjf9gz
         pfJUHTvfUsD0Xork4sqChOpVYiHXGwQMhsdPKFjfSDYL/+C19sU1UExyAOAe43cKs70Q
         9l+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOLvkljM8tEkK5Uw7xVuZtHepeFZA8Uy7oTuzxO/8tH5JBqjP+qal72gHcGSl5NoYq6cY2+RwUhCe4ZsQl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0UH1XhMHl1ySChUwzZ0KmJ9kFd+bS29ukQ4GsWPBOkCv2Ojit
	G3JDpdoFaWKfcjFOj4yYpdDjuTc9HqX7cBoDOg9/mawU0BHQvZf227hbqVp9qFM=
X-Google-Smtp-Source: AGHT+IF0N3nJ0v0xMCJWoXiR1L2taB/SeE+T/bQehDWKai9p6z1i/Ea7/Tq7rP7fxtkgVZzA+A6MjQ==
X-Received: by 2002:a05:600c:4f81:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-42e7c15b3b3mr11936645e9.1.1726821489528;
        Fri, 20 Sep 2024 01:38:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e2c1sm43099165e9.2.2024.09.20.01.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:38:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Sep 2024 10:38:04 +0200
Subject: [PATCH v2 2/3] dt-bindings: mmc: document mmc-slot
MIME-Version: 1.0
Message-Id: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-2-5aa8bdfe01af@linaro.org>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1400;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kNCAWhKmcmtpyB2uacECJO/JKXg8Fz3C8WIqjPA3amY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm7TRuv0TNIP3Dfopqh/6/jNdlr+f2fiJ+hNO2E2xl
 JMCDBbGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZu00bgAKCRB33NvayMhJ0QvMD/
 4if1rpppxeuzEJQ/h4qKYR491G86sLv9/x5vaqFt7TYk8916m05notBJpCcIVuJY1a1Pj0NdbOctq7
 IektA8ey9J9E2Yk9+6ZdIV0ApMO93QnYE2e3JCKngTKF87AU7c7r19fLbZBDV6+b1Nzw8mICKKfHDA
 SYyC/eWFn2UM1x7wWL1RnwGhYxDdgkIY3U+7X0Nl54ySgYxhDMDP75nvsK6lMkbX/AnHv8EnyERYSS
 ZwdkxvuxjYarBz0zxaHX0/s/GeFFZJZQGVZ0rENXSt62Gto0C1tOVCfoQWLVj7Pu+9IVyBZXgc4kTj
 4mkTJrUoMwiVg0CvQRhX+1wqEaztErQzFQqbIBZDtUfK7tmE9JDK37QpABpJqaN37u+b71T01UzMjx
 E6C8QzpOJMY7lbc7utY0Oz3FuhZhhUNi4MgBIlkrtaRirck9CuR1GwR4A0/wanM506YMOkCGAulW6K
 Qmj1GtydIWT4nmNwzO3a8LDSMHbZJRMtUnZYa233jms4jPGGyLHCiKYuZoOPyMSwvKSDB++qOuqm7I
 jQBZlA//mggE5gQOontemh4/hyqBaSuBKbARQgzIJKf4i2TpUOMDHxPbco6wRf37PeIY79ckFKAZkn
 MuujdtIppczEYhmT9h9gxclS7u8Sa6ie87RX/O8arYmALxf/Wf3+jjKmeRXQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013812_278826_F400AF40 
X-CRM114-Status: GOOD (  10.69  )
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

Document the mmc-slot, which is a subnode of a multi-slot
MMC controlle, each slot is represented as a full MMC controller,
the top node handling all the shared resources and slot mux.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mmc/mmc-slot.yaml          | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-slot.yaml b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
new file mode 100644
index 000000000000..c30eda4fd2a6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/mmc-slot.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/mmc-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MMC/SD/SDIO slot of a multi-slot controller
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+
+allOf:
+  - $ref: mmc-controller.yaml
+
+properties:
+  compatible:
+    const: mmc-slot
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mmc-controller {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      slot@0 {
+        compatible = "mmc-slot";
+        reg = <0>;
+        bus-width = <4>;
+      };
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
