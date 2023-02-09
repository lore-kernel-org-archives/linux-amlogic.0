Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FCBC636D6
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 13:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lAndnm5pCM+p+kqpVV6Qj4/wICy7T1EioL17YDTwb9c=; b=UqOWEZFR8xkO4t
	qyb8l3/Z29HaZTtyxkyqMaXZYwjUzWhtpf/KPU5Mfgy0MHMcNY6GYp1geDLOOygYx2dE/D+qTiXlO
	zu335iL1poRhN1rTz+zG9vx8W8E3WK7OMhew79l0Uq+8BUNAtKpH/eC4mtVP4CnqDDwU89YB+bZRB
	dScedlwjEsTWKi+M5yACUvHCpdtzfhelTi+r2LgVu1wvTf2CStNfP4vbXPk12bi24ORygw8AU7zc5
	vhqXFsoJBdIvRA5ueSjXRXvmIvaQfe3SkUzWpoKgu6FplBYGhGY9+H+EOWtvt+Q1MpzueVuxQ1IF5
	YIH/xpjo2cPxc1nmmZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7G0-001or0-P4; Thu, 09 Feb 2023 13:46:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ7BL-001mOL-Si
	for linux-amlogic@lists.infradead.org; Thu, 09 Feb 2023 13:41:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso3917563wms.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Feb 2023 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwVQYGDJxIHxSzhFFyXo6DVH/Gg58TP+SeHZlEpYtaE=;
        b=G8dQmklTOh+/FvxQUB0Gk5udClxwmsyEKDn7Rp2hrIpRgrY/EeEEmKKoam3xtYneHC
         wfJPDL5CBU87tibavUNzoPSTcJ2Qk9IegXRWalEqNxsXdz33oTSKFA5qiQYh9SJVmGFQ
         gsDwoumaVa2S543zVbMQcsIOwaB6bwsHXYRUvyH3rhjRepG4FYbRmRnPAT71wJKyH0WV
         qV7LBhGK5ouyZUTngAaoXEruf/qZgT+m+YACGoBzOj4im80IXnMvY3AojsAlF3ErNqVA
         culMEdkUa4YT9uGHDzZ111BX2gho2+jhjJbkJyZTN6m2gJS7BuSUwnSDQCvUf/VWQgyf
         WrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SwVQYGDJxIHxSzhFFyXo6DVH/Gg58TP+SeHZlEpYtaE=;
        b=6CwHBbQnxGnwZ2ddeKkTSWhYWubMjHCSPTa6k0Q+sFo/+THChlhumzkAa1gvHm/VI7
         sELr/T1m2DnApF3xK1m5X4HgeAIzboKXCkzgKSShmLqOdp17BKNgafao/RXPRNn4ReBy
         A6d5aBG9eWI6xuCZCG+kjFn18ZlcfOlEy0dnxsHvNNsPJ75zgckmaQymOP0pm6ihPcwn
         pr8gCm2BPgx9cbvcaGRFeX04GYtjs0Q2AIfxtwUdq1tusxlt8UhsxaJFYlv563lm2mmN
         u+f5dySfJZNdECebpsDa4L5eCKzXlDaAFMTHldqm/sqkQG7WUP/5an8GV2C0k/+ExEkK
         oGmQ==
X-Gm-Message-State: AO0yUKVMzW+N4g2bLhgJeeDGl82GRHOWr6tWa2EBJ5K3byhp6r54IcF/
	0XZZyQ0Rymi4spc6Fyf4H8XFaw==
X-Google-Smtp-Source: AK7set+E0AI0A+CBa5LewIRNFwdZw77cSx29mVZd6Uam4cfv7UMTtK6R4/ZdsEbQkl5Go57ylXr77g==
X-Received: by 2002:a05:600c:4b1d:b0:3de:3ee3:4f6f with SMTP id i29-20020a05600c4b1d00b003de3ee34f6fmr10371624wmp.8.1675950105625;
        Thu, 09 Feb 2023 05:41:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k12-20020a7bc40c000000b003dfe549da4fsm4946991wmi.18.2023.02.09.05.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:41:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Feb 2023 14:41:42 +0100
Subject: [PATCH 6/6] dt-bindings: soc: amlogic: update sysctrl
 clock-controller subnode type
MIME-Version: 1.0
Message-Id: <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_054147_989644_65E0CE83 
X-CRM114-Status: UNSURE (   9.81  )
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

Since the clock controllers are now documented define the right ref
for the clock-controller subnodes and fill up the example node.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml         | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 672eabd90c09..57eae355f1b9 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -43,6 +43,10 @@ allOf:
             - amlogic,meson-gx-hhi-sysctrl
             - amlogic,meson-axg-hhi-sysctrl
     then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#
+
       required:
         - power-controller
 
@@ -53,6 +57,10 @@ allOf:
             - amlogic,meson-gx-ao-sysctrl
             - amlogic,meson-axg-ao-sysctrl
     then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/amlogic,gxbb-aoclkc.yaml#
+
       required:
         - pinctrl
 
@@ -81,7 +89,12 @@ examples:
         compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
         reg = <0 0x400>;
 
-        clock-controller { };
+        clock-controller {
+            compatible = "amlogic,gxbb-clkc";
+            #clock-cells = <1>;
+            clocks = <&xtal>;
+            clock-names = "xtal";
+        };
 
         power-controller {
             compatible = "amlogic,meson-gxbb-pwrc";

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
