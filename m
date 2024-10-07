Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974BACFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9RWRqDLafL59EQWg14CSltnt3CEZDjEkKuIsqYnIds=; b=m1u/bYGuHAr/zB
	KvgQkHw7D4CYghSohNUVYXw+xsPfi33JHyDqixAr+lIu6Y51WLo7p0lY6Bu4XTFh+pwYd3Gb+y1Yk
	EfLdhTrHW6eno6NiTcf92pmqYgTTo7E7ogVNir+IxDm2aGXBcoPrDUFuDod+LiOsUpvnvxAjnjouO
	TFlOAo4VritbWSel8Gpds1K6MZ1l1pKadAv7+hvHDyvZtqwUF8hzjrXtqdr3dPOI8SoE0oHZHUZUj
	/qscO1eNowP3MJXa6/0kfD3ACPGfpiuWiYbmM2HaTSvxltC1wM3EXHENvOIWbIe1Z0p8mTYqeaDX7
	LatwfkT7Uesc3IXZWuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoiR-00000002inV-0fSo;
	Mon, 07 Oct 2024 14:28:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoXM-00000002ffp-0H0y
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:16:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42e5e758093so38880885e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310595; x=1728915395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hv0jab3jHBZJbnh7UjMMEKId2oSGlJ5cxQvLyyyW10=;
        b=eq1ZGmP9cQDUTIGHIr9bD0W6/G7YnnXUPWYmrTcKytF05Rpy3HMIODTP3Z8W1gJ7x2
         lwA1TsRTP1KIeFPIJhOn1+0PsgNuApjEYLbg0U/JGFcjOyUrdloaOwEpdIzOxwQx7fNW
         lDhon/XX6b9K8iqTkT6SpN56L4JhY1pgFfLPscu2RiAJBOpJiWQ+Mwa9NBTYQJrqC7fd
         P2v9uxt6OpkLdaT0E6CmwPbCquvsG5ndEFdVSIZaTBri6f8yZQOf28eIAgJERr1SniGS
         YmU+F5hEGrhCdLwWjYPilr14I8ajKNOLJHXNV5ccVLW1jZ9nhHfPq11OgLCLWCPW4GFl
         wQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310595; x=1728915395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4hv0jab3jHBZJbnh7UjMMEKId2oSGlJ5cxQvLyyyW10=;
        b=taSn+VO1aUdcA81CHsVBWG/d9qSie18vElyJgG70IwXWaZC0IC3FAz6OS2USbwTx3g
         DzbdH5b1MUB6K5fh/2Kp9qhywr4MXrI0O/rKg3PHzF8wKPDqwhVCJqteK1Q8OYMsLScn
         kwh8qfZ+fi095lq9CRDaY4Gfj0a0l1fC3U4Ev6OibvYWeQphUID0ySZX9XmfN25tkCDC
         nWqy+RR/TOUyLnf6+YQq6GZM4V9k2+iK8+Tv3zZwV1AFBtvKERhz0+24wnWaFxhjBe5x
         OHU+1oEox04CefV6mLgGdzd74u1tBpNkvosnObINPguhPSs6mUy+APSl/bq4new7AX85
         oEzg==
X-Forwarded-Encrypted: i=1; AJvYcCXNtMRaFGHhp518lwNUxbyXwr5sPTkSo9NtuDaiM/IQ1bSuIB5mYlqg3h1mICAmybNAX7D1pXGSdoxi9Sb2@lists.infradead.org
X-Gm-Message-State: AOJu0YxJvhEFYl5U0MCo5Z39UW1AzLkV6TvEnTAnfEqw3ESSTPD7P+0P
	X/HIdoXk5fTN6GVrbTBee4d3Xx7du9fJTAO0qbLGfgrpqc4e7HG2oe03v/VzdUY=
X-Google-Smtp-Source: AGHT+IEBNwCj4Clmc9tQOoyaPHB9G6hxgmvRd98seccIp9L6ifABf/HO1+fqXZ4HQmKQwBQV2MyofQ==
X-Received: by 2002:a05:600c:524c:b0:42c:bae0:f065 with SMTP id 5b1f17b1804b1-42f85aa32famr89848015e9.5.1728310594553;
        Mon, 07 Oct 2024 07:16:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20537sm94197965e9.15.2024.10.07.07.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:16:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:16:25 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-aobus:
 add reg for aobus pinctrl nodes
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-1-d3d838540033@linaro.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1639;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=h2FMnPogkHFfqhRz1WoByogMT7zBYzsPgXNwbf8hCeY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+1ALGxHIst8m4naWDBSpXsrpWWhY+q6boysoTva
 mUVfeTiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPtQAAKCRB33NvayMhJ0RGhEA
 DIrWLVjjoK19N2+puCqyHlFbu2KgFdoR87XjMzHDOoiiTUecXYSmRGw4l1jZEByQYnbwseieaxTU0M
 waJf58VQ4Ea1WpjJ9wgfr//kPXzk2frkIt0t7xFcMqPWdFyrXt3PqZRY8u6NBlT3loCPQ1yBzGx9Xy
 XYgZAqSKWpPKHGZ3iCqNGNV31X3m5qvBDwKM6GJZ3rqHEbuuaEfRUWni8ZKu6OyrReUotV0D2QKuf2
 ghiWFO7Ni2DjnILeP5jdZJzWJHJlfnpNl5Khxrp+sb8N0hxRqdCOlDCsAuYAyBC71sZ8SaMFeM5LaG
 fPXbB5dqpPyJeO7vte2ZuLFVJAsNLsPhQNwzl0mMItB4/W4APVTZDR20xLTDvb27pK5fe7hjQRdq5a
 M2N6Zf9Nu0+FhWvZO7iz/HP8qYCrqTnAb29HdnBcuN1Jx7yzC0Hqs5FLOTD28QNnyKDJ5RHFceytpz
 7MRtpz80cUvLwzrOvbRGrwnpOWHWoEko22SpMuS1Rb3fHCJ8zmF/efj14f27NnHDOanFynQNbUcFcx
 iMCIGo33bjvTvPlW569zqf3SJuM3s/NlAM/Q/2aVrkJrLUYg09IaqcXZyHyM+EvHJXU6fKKAHRxS9+
 c70jlbfYmpezaFexoFwS9Ca/qg2FtBm98t4OCGYQqY0CGwOWCZhg5kxhWwdg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_071636_119328_36CF1BD7 
X-CRM114-Status: UNSURE (   8.37  )
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

While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
reg property for Meson8/b aobus pinctrl node was ommited, fix this to finally
pass all bindings checks.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
index add83c676327..76c02c6af645 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml
@@ -9,9 +9,6 @@ title: Amlogic Meson8 AOBUS pinmux controller
 maintainers:
   - Neil Armstrong <neil.armstrong@linaro.org>
 
-allOf:
-  - $ref: amlogic,meson-pinctrl-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -25,6 +22,25 @@ properties:
           - const: amlogic,meson8m2-aobus-pinctrl
           - const: amlogic,meson8-aobus-pinctrl
 
+  reg:
+    maxItems: 1
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson8-aobus-pinctrl
+              - amlogic,meson8b-aobus-pinctrl
+    then:
+      required:
+        - reg
+    else:
+      properties:
+        reg: false
+
 required:
   - compatible
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
