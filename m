Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A376C41535
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Nov 2023 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Edzw6Usp1xdcbayofZzHVryp5CzDYAxCopi/45V/Q80=; b=0jOb2YMJKV4ZiX
	FBnXWK1ZfP9XFpMysk6cCHzFVUR/k7FHiN2XjThi7WXlO81cVXoi2fFJ9nr0TYdsn0iJvIjEkZ7n9
	bJorNy8sr08xGVXOz9/HcCW+UDkLNQqBBLVuATupN22nZPMY0szAZJ5Hv6N5qky36kes8tEyVHCG7
	d2wRMwfyDgLdI9IjC+xmgTr611MvLwOETe5M3EX1hzaxrfkB7APNRFDvbIuNRS1mlWKPmeiN7rrsm
	D8w0JgFZmUqNVp+pNCxwqNVSXlrjuTfrLyYVJNhdMdzAFqutsZ7UUujyOpp9lB8rup+rSNGA+f2Am
	P7YlcIHkuz8SJbHb7tJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tn-005gmW-2N;
	Thu, 09 Nov 2023 09:00:27 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10tf-005gdg-2f
	for linux-amlogic@lists.infradead.org;
	Thu, 09 Nov 2023 09:00:22 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507bd644a96so843387e87.3
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Nov 2023 01:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699520415; x=1700125215; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
        b=KQSH4+YtyWN45vUmnGA8YYd36Kxhu9cFuyuXKZUmUPfuy2qmwmtnzEGAH5wQnwSg7s
         BgsQ+92QOgqwawLyMqA9zsdT7ILzEGOf1DhAPm+FcJh0OW3DZDi5wPBkn6yavCPHW9Dp
         oV7g2qhIhJRR0lOFzwykEt7qYxMK9mtvbVut7lUwryS0jMY01unsDUuijJmMdqL2TJ9b
         vzxPir4e9fDusPZzc/PfX+kxptgrAVhsnfrMLaMnQkL4w8h4B+BqQQ63mVIdxQ5+5rUF
         s0LfccZqHdfesFfy5MGykHDSRgNCM5Vung/ATKtu0qJAQW1PjjLBMYkcHfXDolZhQ7mz
         O+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520415; x=1700125215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6K7DUEVq4k96cRCmEKG1sJThC51M4OI0/7xFjD2DU6M=;
        b=T9FGVatqCr9NbSEVaxaqldaESy1WHva8HkkGJXvQN0M15P53qnisYEGOogaYrx9DGX
         b+FX/xQNJoIsHRj0ioWNvJ4CQP6SVvPJ+hBYwfVJvv+AqkmJFaA7G+Zl6AEE/fOBe1lg
         XMUllT/cN+c166c16NyQZWgAd8yZMwhyYcifdhr6TUOddxUmv1b7ixGh9cGcsjX8qljo
         a/0zXNuC34Y7Jzjp/ebmzhnf3wz6YyvZvwrqmCl6oCSqKhdjtIM0h4Rkx4rTawQACy1z
         diyQtyeNfYbzJXWBgm4z6vDKPEHEpGS/2vV3n9BBYaL1EdcJE+7GSDleygWtBFyic5NR
         Fkbw==
X-Gm-Message-State: AOJu0Yz8ERmslizce5XnS1kWQDKlXly0U56mtM1nw2yFhj4xzvN8i17q
	1x2ZYssj/hGPn0Uy6u3Cu7fM9g==
X-Google-Smtp-Source: AGHT+IEz2Rbo1iFlt5T34StiguUybmx8i+EgvioY2Ns+O/ShW48jCuLMnwyrfAfGKMqbX7riaX7U4w==
X-Received: by 2002:ac2:57c6:0:b0:507:a58d:24ba with SMTP id k6-20020ac257c6000000b00507a58d24bamr679052lfo.63.1699520415302;
        Thu, 09 Nov 2023 01:00:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay36-20020a05600c1e2400b0040472ad9a3dsm1428484wmb.14.2023.11.09.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 01:00:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 09 Nov 2023 10:00:03 +0100
Subject: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
MIME-Version: 1.0
Message-Id: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
In-Reply-To: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2143;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rmmUAof1Km7bxj9UDL4YQbyGrQ3/OWsBkE3eSPayK1M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlTJ+WfUUarmFrtbxzFNQtmTgHaC2dbjJQ1PfGYXCS
 oFk5R6CJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZUyflgAKCRB33NvayMhJ0WlFD/
 4hKPd2SlGH71MFNfm+ZCIgny4FD5hPppa//r4ijo8NA7FSXhj6/jUB5R0c9FSYxNGsGGqq04nqYk8C
 cf5cyktTaJKo8bx/Vnasl4/31menxzc6pXE+Bmt6LiPLnp1d4rBQ3nVMbTXfmDeFk/MuwC3mhmcU8Y
 F8LNr7TlDkehXBTf4uSBmn0oxUnCzAa3bfadgWBl150CGUiVYsCVPLOW39hDMPZ9HB+lMHrHP+Za8Y
 p6WyIsI94u0a/XLMeizJo2o3X4wpDz10TPZqG4K/osfG7npTrF6NN80D+rrQGiamMXqA1VRgZUrTmi
 Vbbk1IWLBoabQSuzByXTozIB+s1ZQToDD4NjhfWCikUCH8XB6ifCIx4AfBsZX+MA7HUbVZzS3jGhzu
 KYbnoJo4CkOfEGwco2WirWaCHqm7u5iScQ9JCr9lxEZeQBWq3PJblVO9g46F3Yv0iK8SRimwrKn0a+
 EmrfI3FexR/WJX1TauCQqDRNw0gEIVJUamq0HCmqGH5moqPOaTo+4z60vAIoIV3vGlQKdXdSJPdVAq
 CkrmWROc5NBP/xWL1ElTlGJYrh/iZ33+/hyC3OBv28ErZEv/e0UVbkql8oHnX1pUi7lEISjm8AAHJ/
 822HEqgMVQkcpeW0z95z0HJ+9JYPtasDwP5UHzgjHeFSDg1tW2qdx++dLQSQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_010019_880596_7E4EAE20 
X-CRM114-Status: UNSURE (   8.30  )
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

Add a thirst example covering the meson-axg-hhi-sysctrl variant and more
importantly the phy subnode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index 16977e4e4357..2edf4ccea845 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -158,3 +158,44 @@ examples:
             };
         };
     };
+
+    bus@ff63c000 {
+        compatible = "simple-bus";
+        reg = <0xff63c000 0x1c00>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges = <0x0 0xff63c000 0x1c00>;
+
+        system-controller@0 {
+            compatible = "amlogic,meson-axg-hhi-sysctrl", "simple-mfd", "syscon";
+            reg = <0 0x400>;
+
+            clock-controller {
+                compatible = "amlogic,axg-clkc";
+                #clock-cells = <1>;
+                clocks = <&xtal>;
+                clock-names = "xtal";
+            };
+
+            power-controller {
+                compatible = "amlogic,meson-axg-pwrc";
+                #power-domain-cells = <1>;
+                amlogic,ao-sysctrl = <&sysctrl_AO>;
+
+                resets = <&reset_viu>,
+                         <&reset_venc>,
+                         <&reset_vcbus>,
+                         <&reset_vencl>,
+                         <&reset_vid_lock>;
+                reset-names = "viu", "venc", "vcbus", "vencl", "vid_lock";
+                clocks = <&clk_vpu>, <&clk_vapb>;
+                clock-names = "vpu", "vapb";
+            };
+
+            phy {
+                compatible = "amlogic,axg-mipi-pcie-analog-phy";
+                #phy-cells = <0>;
+                status = "disabled";
+            };
+        };
+    };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
