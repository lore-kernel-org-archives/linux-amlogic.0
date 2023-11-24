Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851B6C636CB
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrf0GpkmoyYe39jf0KAV0/2NKlpdYlarsLu6q69BkzY=; b=lVJHGX5ZYqIoQX
	g+1Zc7EozNa92KyNkQ0V3nNemMf5+Pkfx25BqL1M52KnAqN6SOWsZWmtqepnA1Vgm+cpdbIh8//U7
	PN9nn/J6tQwyiBwrX03r6+aEk2HfG4PrNMWkrYxdC0bO22eCX898SJaqs96u5DODf3ENvKP3fbAAD
	yD3rJpJWSEvxEdqACZui2gaCZsy7J+IWzRhRzaa45BPjMLnfQKurA4rDCnZna+Tf11Qb5+23oPpAD
	oCYMbyd33UrzCua36K0vwzKhS/BupjMGUtzg4tM0YikSTKnAEwBx63QfZ9rKiHkJxi78sdUOOr+MO
	BpjuKe7uPLMngT7YSANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rl4-006YC8-1w;
	Fri, 24 Nov 2023 08:41:54 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rkl-006Xmc-03
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 08:41:37 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50aab3bf71fso2163858e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 00:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815291; x=1701420091; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=RUDoXWu3Jo3l8/SBmkl/5GvO5XtAEu1tazHbzR78r0hFp3/6i1/oJJmw42NVIv8A0+
         f6gLqgjcT/cij+5sF9ln+Gq56/MY1q7vKkDxWPHD3qPCzYl7OPSKhLL/seG4ngSB1pjc
         nGDLrTB8D/0eNxbC8+7JT0o9LEmya02C/j9pM4fyt0FxKD903oP4NnbAKCaWMwVUuMaA
         3wCM+OEwSOkd/PXDnhSb+7ay2Zv8kyMDoOTWkxCbrpUy/37Qt02nmiM45y7oC/F1DBoG
         MCelb5DWR0AmnFhVGXr/yzCTF0/WQQ2930rizHzAFusdlRQbrqMl3Tar1gnx4N3dTdZt
         a3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815291; x=1701420091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szbyE8B5HmerWTS9QCGM8GNA9TtBAZ10zn0t2kxJOBs=;
        b=rIhekmSynt1pAMhf/ww6EVBz6GJ4Sf+OfwQ963CGgrgNNw+a+Qh4spQ4Oi4CxxSVS1
         HHsX2jnjRuFGbigzzXebzKtBeHHJuvQ6LeZ9cdaI30Jppj16/p24UT0c/Lfvr+4tqwvi
         3oLxmaMSaQbnwrez39RBYs/hAbHGvDLvZ1x+GM6WN22Bps8eud6kIriwIL6cVoEdsb88
         AprJ4LV0YW+pWEP+oEYC5bMVdvdJ9kUaK6MbbNJf0L2KG0dLNC2fjbMpFTWF/OHXyGC9
         h5VakP5yJuFfeIXbhtH9gXlAQW3hyq9JcpdfkBVA7JSKG+qumWubOSZ7kVTWlC1xf8At
         eKlw==
X-Gm-Message-State: AOJu0YyTUSe4nknq5vbYi/pb4ZOu57kJDYO4n7pqryRAWF7DsrCkGD8O
	Zt0O1ExEoz31DN1maMNOXuXJhQ==
X-Google-Smtp-Source: AGHT+IF8wC4ZbNV+iRqsapT1X1L6KArgTHWCtJUniE+JBLrichukip7x/MNUSFgjU69zSXGhwIYP9Q==
X-Received: by 2002:a05:6512:2026:b0:509:4916:8b6f with SMTP id s6-20020a056512202600b0050949168b6fmr1088541lfs.37.1700815290893;
        Fri, 24 Nov 2023 00:41:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:16 +0100
Subject: [PATCH v9 05/12] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-5-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dsHeljQP++qeke1zASpQ3YPnuH6eGTAu4r6z8mvmrbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGv3r2urKVQCnv1GMSXAcUHF2wbzkyg1d49b8yI
 ncf0ylyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrwAKCRB33NvayMhJ0VlcD/
 4y1L+GLLwogkpqrR1xVtyGU3WNktnmQpmbhriYFVjc8mfDK6pfyBAzykOOFUyjcoCgKWxV1oJTuxod
 n2fNJepwZ3udvXq/phRAoM+JgB5VwPl02d66w6yh2mRT0xsuthdMpZ6GVLhbcP++Rm6wgxEcX9p/cl
 HRUp2NPx6OZGj49CiOwd4JQIe2nejmgGDUlTtfXBx0UrpPjamVyrNvMBGIIdLVH9mDQNONWT1rQM/L
 kSTuU57hLl926SrMVJ4DP3qFu/14HhsgOLiIPMgZjSVyiPWu3h2FGpFHOsXi8u4wUdJO1o/HOUy40V
 Mic7Q/lZFY39/kVxbZ4ICyg8QT9p5CzDwYXuLTYST5SCoBr7yLEBEraTke0toEJOpzx3meHPsl3ghp
 9BOlz3g/+AVzEyoz3yjDqnifU8Z4ZCG/pVJ3VAH88P7pXL8LkGyqfrzZSnWg9tiDwRC9P34pFG0CPs
 vZQ+OaIsqPpSEN6et5R/tN/luhPgfUia87H5KA3QYFyemEKu037HhZcdomNkQnxU+uBNy377thMRdD
 BxLMWftl1gzwElohUV/HuoVhcZbLRQy3xkepA0QjbquW5+cKI4Jog/261FPx6rw2ZHOLpxSyh2BoTG
 AEQOfpbdxt+xlZIRW3QRefScRXlSnVfYvXehYP9LUfxILN5HJYzvwxQy0xeA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_004135_128172_07E9BA55 
X-CRM114-Status: UNSURE (   7.59  )
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index caab7ceeda45..2154a4614fda 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
