Return-Path: <SRS0=FVXd=5K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A868CC2D0F1
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7924720737
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Mar 2020 22:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RhMmfvNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7924720737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfsTOnT/d1bN1bq/8gUU8XLTNKDn/vW3piq7W13UZZA=; b=RhMmfvNhAgxNi1
	CVDbwrH3D3rMWU7bQKKNCFf1Iluj8V1ogOWQ9wGWueT3xu9d37KkK3NQaNIzz3tXTNT4TsLkk+Nxf
	Gr7kUbP7wT951ApxhTdnNFoo8E7JLAsDE0ilcaEvr2QycPnhdHFZffL8UaXwCDbBjI7Sui3IjF+iC
	8LT2/MZbYHz8fAoK7C1jR3wJ8T0CXQQ2M03LPXK3d6s0i7TU+vmOeiz5fNRVX6J8M46v3NV5HagJW
	BriE2rCfp1oRUgrUPEEvy+/tl1QDcsW3vzC/B5fPNhmwqXM9eVI4RMfIJJJdKrXBhRk8+HdeOnJbq
	AiMAe+PdywhUwsMrKUaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHEA0-0001i6-VL; Wed, 25 Mar 2020 22:06:04 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHE9n-0001Ts-9h; Wed, 25 Mar 2020 22:05:52 +0000
Received: by mail-io1-f66.google.com with SMTP id k9so4013277iov.7;
 Wed, 25 Mar 2020 15:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwF7FEOUbNvNk4mSehe5GSFcN0+uDrOJWlHbrUm2jl4=;
 b=O3jvzxHvT3EXhY64a8UhbwJvtZiSsvPQLdh8rWrHXCtr0EiL0yuBh05J6tAJyrE6CC
 v+1cP/i03c2Ig1Bb+aQc/AS7XN/kTVRPobJ/SFjx+gcNQk3i5KR99flWC20OOphnrjBk
 mW1GHIbljScISM8g9lZ9binI6ZnB6T7yApCMqHR3EbBAyUk3TN1rmNv0HyojQ8mL+guu
 6MzfLlulQTkQRm351fF1WIBnGCpkmYMCREvRSZHuxrQ9AYiVIKduZiAIebky30JegXhg
 aQc/loIgxFLIXGkRoARQysIoupoTjtZuZfZMD/1bnfBxHioKskCXfMHDUY/sKoDcOeDd
 WqYg==
X-Gm-Message-State: ANhLgQ1nixcCnHpM0wqrOU/BG7vfxIoPiEMI5kR0kEzGLkOKnIgID5Lr
 PjmnBGlzgOJ4ayi/IPsSRw==
X-Google-Smtp-Source: ADFU+vsP1GIXWhv3Nn2746MnQvCz0PBygUKBaoaDtLTv4UJllArEZXEuLW2CGMWNrRni/irdN7azAg==
X-Received: by 2002:a5e:8214:: with SMTP id l20mr5055871iom.54.1585173948584; 
 Wed, 25 Mar 2020 15:05:48 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.250])
 by smtp.googlemail.com with ESMTPSA id v8sm102390ioh.40.2020.03.25.15.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 15:05:48 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: sram: qcom: Clean-up 'ranges' and child node
 names
Date: Wed, 25 Mar 2020 16:05:39 -0600
Message-Id: <20200325220542.19189-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220542.19189-1-robh@kernel.org>
References: <20200325220542.19189-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_150551_355485_19486857 
X-CRM114-Status: GOOD (  10.81  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Zhang Rui <rui.zhang@intel.com>, Brian Masney <masneyb@onstation.org>,
 Michael Hennerich <michael.hennerich@analog.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Hartmut Knaack <knaack.h@gmx.de>, linux-media@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The regex for child nodes doesn't match the example. This wasn't flagged
with 'additionalProperties: false' missing. The child node schema was also
incorrect with 'ranges' property as it applies to child nodes and should
be moved up to the parent node.

Fixes: 957fd69d396b ("dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings")
Cc: Brian Masney <masneyb@onstation.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sram/qcom,ocmem.yaml         | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
index 222990f9923c..469cec133647 100644
--- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
@@ -43,6 +43,9 @@ properties:
   '#size-cells':
     const: 1
 
+  ranges:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -51,9 +54,10 @@ required:
   - clock-names
   - '#address-cells'
   - '#size-cells'
+  - ranges
 
 patternProperties:
-  "^.+-sram$":
+  "-sram@[0-9a-f]+$":
     type: object
     description: A region of reserved memory.
 
@@ -61,12 +65,8 @@ patternProperties:
       reg:
         maxItems: 1
 
-      ranges:
-        maxItems: 1
-
     required:
       - reg
-      - ranges
 
 examples:
   - |
@@ -88,9 +88,9 @@ examples:
 
         #address-cells = <1>;
         #size-cells = <1>;
+        ranges = <0 0xfec00000 0x100000>;
 
         gmu-sram@0 {
                 reg = <0x0 0x100000>;
-                ranges = <0 0 0xfec00000 0x100000>;
         };
       };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
