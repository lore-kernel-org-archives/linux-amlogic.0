Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3403CFB441
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9STch/h+J4ixx2Za8JiPv1P7bhnHo+A0JjM5JtB8K/4=; b=ZeH+LPeuLe8wSk
	yVvuQKlu3ahJQqhzp+qQqp1C0Pym5C2uEe/ne1VBndS7wExCe9NgPr+fN0RLlnWc1HjJl+V2p2v53
	OjjN2ToW3HsXIcjjevGR0qqS4i6kejijotQqP+Q2xf/AjxISPaHfZj19FZaO3okb/DXpptbc9pkfX
	Ny6Pf34K63d0vLEU7JujDACZMm+y+3SGmFJSyWlVP22MY9bUGcJUA5u+31LcaQJsHeZH2+0a0OD3o
	epSzvf/LQpCuAYJTSy4ktFYPLU0u4OIAiI2eX9AbEgR8pi94eKjQEnhsOQYPt+8U3T/cy3GopAApU
	QNMI6V2wExpCK/lCbhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxokz-00000002jZw-1jCk;
	Mon, 07 Oct 2024 14:30:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoXN-00000002fgg-1Y1O
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:16:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42e5e758093so38881005e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310595; x=1728915395; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xRUTNSVpHiv9YcXebV17rDvGiIssghk7TcjlQFT9qE=;
        b=mHvANakq203VzcfcUSZknf/mZ3Amq5Ku7YOgfBHze5Er+Vl9tJC12ci8e/y8ES8KGE
         hcMs0TY4nuTnxatluh4crpNBTpEaqV5NhXpKoSg71qJ6Te6tSsOYnxwU9J50w+Ja9Sbo
         PI5IjWnY9UGygdFLr5oadQTocnFDa97x7nTBgpThFESxhVakSVx8RLL+dMVtwh9HWRii
         pY/28oOWJ9g7I8fByJVI6vS4CN8cW3IshDTAfKdr98O7fuEKxKW/fHBWG26i1RXyvdxC
         SUtfouhkwOY7sKWmic+K8a14ufPEf7ZVhsYlB5s6Q/9vLgyBl5Wrt5S3KwIiVTEPxop9
         tNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310595; x=1728915395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xRUTNSVpHiv9YcXebV17rDvGiIssghk7TcjlQFT9qE=;
        b=Jp47zW31wjIAJNLtnncTlMvwZiKyhV7Ns8mCTRTjtIESUnl5yzIEg7TghDDaEcYw3e
         xVFdRbYaKnAt9k0BWtl4RyQtY2JI4O7954AfKubsSELzt9WSGvuNGPQszxrkzS4zcdiE
         CV+1FxxR/T5TptNF4lJLTjHk0+BtGyFpaMqQhA//m6Mlb1jWg1vnZJVDD5HZmJHK7rWX
         Qu0Nqlp5Q0K4fBf3l7pZ/mPlFuOrxRf8EcMh0C6OrVT/yIBVG7hDp4/2xNYBQ/+F814g
         X7EPZVMNu6UTSpIu9wjvr/8stS1RDPHJl46kmBhyJ+tl7x35KAHHzbmg46fdaa+wcY1f
         /hUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK42gOz/wPgnQ9rtiDdxPcmrueB/qoiWwKeHd7fPyHb8V31LQNDQ7a4yX9mUNeAMYQES6MAX0119V9lP0D@lists.infradead.org
X-Gm-Message-State: AOJu0YzJw3tPl+Ax0h2j2CIdu2zuklBNHWdq1TtHPV9pAc+OW/zhjcx0
	K3AzECtZdUkTOT6HySuPxC2RtZ6Lmden7E2kN0/gwaScrusVcFcfmuUKGwLr7n8=
X-Google-Smtp-Source: AGHT+IHQ72ccwSzwU8GosDnb+C5lMeNAC/47JQuiE3FnkpThqnf7l5/8A9yKyPIwlZRV/GGR9UIMFg==
X-Received: by 2002:a05:600c:4684:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-42f85aef159mr74209795e9.27.1728310595513;
        Mon, 07 Oct 2024 07:16:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20537sm94197965e9.15.2024.10.07.07.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:16:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:16:26 +0200
Subject: [PATCH 2/2] dt-bindings: pinctrl: amlogic,meson8-pinctrl-cbus: add
 reg for cbus pinctrl nodes
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-2-d3d838540033@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uq3xUG9541kWavMjswgcR/7jEBvQhAlHsrzxs28MLMw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+1AAJKgEHuWWSwWBWNNDbWxSdRz0yGsLYzIXe/4
 xjuPgBqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPtQAAKCRB33NvayMhJ0Ve2D/
 0VDp2vwfBbO2+6bz+ZmUpjcv4krlCHkib7nY3P1ffx2xc8uXGci/IJfCDcs/n7lKtZ9EMwPQfU53qp
 ujKB1QWNiroW7bfVzQ99o9Lo20wXjrtFSM1NgjZrGkK14cXE4OJ6W/uo40XgiFKZmDXs/brYDEcMgl
 Vkj6wPnW0mNegAcNZDBekI77lY8Tx2ScSz8Bdv9bvVBOGexclIOzRupM10tlrUM4ZvS/2Bh6lTAkNt
 VFUl3c34S/zgmiHnUcWZcCEiugGOHb18tIfRcsM3UyxuirMQ1tqrTqhd3dnxMWedPXpvdnqGTgLGj+
 2P0WQlkaVZaCO0EnDawkSGsMDrhBXb2uWOaIMVaj5p8Trr4hUxVp5ZultjzqTZ6wncbQiL9xkGDJ0u
 uCErJGDC0hd+jKpyLSUJAxdXyTHUVP+o5qL1UPaSFjSPGzE2+8UTlx4u4J/MmaMesUXG6zFVNKczx5
 b79N7wO4/+gqw1y0v6vFEK8NDK5VbnAtGoralRmrAnliruY6P92z0joLTVHyKii9ZvlysSaRtz9Rrk
 0O2UEMqu46XvfoOiK41FTkspRh2Ohl64L5ZOOyC1Me7b4raYyfC7ftgFhUoPXeppZE+TXZWwSSszcT
 lwl+ezybXQsKNiaASpe0LiUp1M6CvuANx2GVkWty0xlJxXFF7ZcfoxyIjxqQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_071637_462983_03C0A879 
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
reg property for Meson8/b cbus pinctrl node was ommited, fix this to finally
pass all bindings checks.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
index c954761e0150..3a03a1c73c92 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml
@@ -9,9 +9,6 @@ title: Amlogic Meson8 CBUS pinmux controller
 maintainers:
   - Neil Armstrong <neil.armstrong@linaro.org>
 
-allOf:
-  - $ref: amlogic,meson-pinctrl-common.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -25,6 +22,25 @@ properties:
           - const: amlogic,meson8m2-cbus-pinctrl
           - const: amlogic,meson8-cbus-pinctrl
 
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
+              - amlogic,meson8-cbus-pinctrl
+              - amlogic,meson8b-cbus-pinctrl
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
