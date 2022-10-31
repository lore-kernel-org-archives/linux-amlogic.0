Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2E8FA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 16:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdcBuJKE/gJoK+wIPmuEHcw2wixQc01yfFZzsfdYiSA=; b=MTdLPgpFVjQ7bP
	GEqF6KrtuYT4wcI/I69MO24k4dfknDu1bzpVa+xx5d70FF3gHrdUL0LEvNxtCQDI/QCj2VVALEDBn
	cJRekZYDZllT9PkbJp5o3P8Kj69ULBKfYsiHMOWPpeQSSWqQ/n45+4vmkpvnuXkv+Lgux5TNtbTa5
	vRasMHDHnry2FGCw4hgrUWqLeeEhjp0GIBEmZVWpkyW8Du83PRj7c6ayBP35qpH+/iRMk72iMyY7R
	NI2QyFvSgZdHwAzd7Fj6/CGSMWsCH4sOebkWCZfERU8gAcaLNvre3fzgYGCjoelhVJ5DvVn83OOSw
	Fnb4INT91xUPvP1jI0Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXwi-00D5UU-OT; Mon, 31 Oct 2022 16:47:32 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXwg-00D5SS-2P
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 16:47:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id cl5so5159608wrb.9
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 09:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOvjAXevhTkIKEozXkDl99JqlY+Qi6ewDIiwMUqw+eI=;
        b=qY2IeKDRG1F4poEQPiAWWwD+glIBmz2L95iZxZiagfOCWZPnnMTf3cBx/VNmUR3OSl
         O2CLdUJ8mHfln5H75LZ1mzfbQ/cAL6C3oMFXSNSbbavXhhQNkMD2qQ897BCUKTSa+SHS
         L4bV0YSEwLQQeIegTJV3MIJgFJSYs5K5tdIR8H2MRRYvESbxB8zqP7qdblVFmAIFgm5o
         IycEid4/5BbtDlltxbKqLS9INDgq8xCg13tVBe+RaIVPMTe6gCdrWRLx8yjueLjRmeC+
         JWLK42+UZHM2V5bL1ZYpVuUu1r3KY9BDCEn/a5Z1YyiuGrHONQQ2NKE7BnRGprS0Mqev
         vV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOvjAXevhTkIKEozXkDl99JqlY+Qi6ewDIiwMUqw+eI=;
        b=q+nbYTL/jAH10Ti4H9Wp2IQrHSYxX8cSKigt7co3tFuDYQ/PE94e7x4nwXcmJZTfKo
         REFE7tGM2PZsAmMpbNqTiDhvHvLKqKeig2kO1HHp59XAYasG5haWE09ljRag/HcTbU3Z
         JOs/UPW1cPCKxiwZQ8aAo9havLnMfmI7itcvqXdv+QqA7nUOD4teBxhMmY1QGpQ5DstC
         /9R5umGjpDkp+O2oUEbkJKDtTQiEBp62Olr9I+j1rAaXcoCW0EVI89Anl8W/z7p3ISC3
         dikAIIZNfJ+Kv2y1GVLKL0XJ5qeRa5mn9Rf+BN5X7xrrCEYThIPQVYeWkfxXJD+7zR8L
         vEug==
X-Gm-Message-State: ACrzQf1k/fSc46XvYdy4I/KPQL0Tb+UyQ4LvrzSgjAMqvzOyS2STclMN
	3LP3zHbBAadik46WItA73KTtbA==
X-Google-Smtp-Source: AMsMyM70WHblAByJ4Qi+nU6doCl8thqDKuH5Zl1XoFQhfj9UxiE9dDkzhRNahah6ucvCPCN5k67C1Q==
X-Received: by 2002:adf:da4f:0:b0:236:cdd4:4ce2 with SMTP id r15-20020adfda4f000000b00236cdd44ce2mr3330832wrl.626.1667234848824;
        Mon, 31 Oct 2022 09:47:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b003b4868eb71bsm7488871wmo.25.2022.10.31.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:47:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Oct 2022 17:47:25 +0100
Subject: [PATCH 1/4] dt-bindings: reset: document Odroid Go Ultra power-off
MIME-Version: 1.0
Message-Id: <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094730_273530_0A0014D5 
X-CRM114-Status: GOOD (  10.51  )
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

The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
to its two PMICs in order, this represents the poweroff scheme needed to complet
a clean poeroff of the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../reset/hardkernel,odroid-go-ultra-poweroff.yaml | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
new file mode 100644
index 000000000000..65e42258717c
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hardkernel Odroid Go Ultra poweroff
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+
+description:
+  The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
+  to its two PMICs in order, this represents the poweroff scheme needed to complete
+  a clean poeroff of the system.
+
+properties:
+  compatible:
+    const: hardkernel,odroid-go-ultra-poweroff
+
+  hardkernel,rk817-pmic:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the RK817 PMIC node
+
+  hardkernel,rk818-pmic:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the RK818 PMIC node
+
+required:
+  - compatible
+  - hardkernel,rk817-pmic
+  - hardkernel,rk818-pmic
+
+additionalProperties: false
+
+examples:
+  - |
+    poweroff {
+        compatible = "hardkernel,odroid-go-ultra-poweroff";
+        hardkernel,rk817-pmic = <&rk817>;
+        hardkernel,rk818-pmic = <&rk818>;
+    };

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
