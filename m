Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB86C3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 14:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jv3ajbsY+okVd4Bhb3Q7MD/Q40jow+NHmB1TfJb0j58=; b=w/WfN7JMFcT9Ga
	WXQMP/4LGHomPAcutMa5V8ZWKolS6+vSGhFDtDpaQuGK560b20dRifHQwFRWYbMPegdEXKLg1Vti9
	5O305pnSCtaULj7/ID/Rw8qiM8UiUwenK3PIdeX+jaWNchj6Yfd07k89GHM5lHlwzQnDTGVsBAzHx
	aMqQKqOErz9cPxCTpIgpXjXw3njxG8/PgY/oaorJKY51Kb30uCvvAVUyRuLFZksGE0pXJjyq2OR/K
	pb9CTD9K7a1WwTa8fCUIV+bxiFstCS6fpH+8uHnQT9KNBUVgrJLwB6noR7mKXrMbGVMjF+JFiQ+wZ
	WwKTMdtdgOivAFZMzUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3wA-007RUW-JH; Sun, 15 Jan 2023 14:24:42 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH3vt-007RRE-My; Sun, 15 Jan 2023 14:24:27 +0000
Received: by mail-wm1-x32a.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so20414038wms.2;
        Sun, 15 Jan 2023 06:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHgEcx/XwJQID9tOV3WWoFHFMS7waVTn73QAL3PQ/7k=;
        b=bDGt4Lm0T2Gs4Ah7GRiIyTBqGAt8/dprIrtIbvc01ccYMEdIJ0v4Dnb/Y6ilH43Ody
         isMytpc+ZqyUMLL+LsN9+YuMGCq0kDLYEod/uqfE94UTO8rjPjfsw8V9hV1OYn7nkdc/
         8236rY+Ln90XDZRsaKuY6dfI2TC4p/dScNNHBlyecPKuG4qrkzM3IMJOcUc7K3lxUC8V
         8ObAbU0v9lIaBEpsZMoZSz4tQn6Bgekou7/bZ5pnLm5QdDMp8d9jdn5POyQVz+F4TRBA
         dmSG4V8k3nKfmqz5trc+grnM365lkf22fmQFyojz/OJrtHhzFyYiExhi6ovvk4Qpxshl
         /JXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JHgEcx/XwJQID9tOV3WWoFHFMS7waVTn73QAL3PQ/7k=;
        b=7otzX3M8nM13hFOrC0OTYLs57iC7HIlitsFGhoLN+/I/wKbiGk4uamkMgPhXpnUuan
         EopmoXqyw3mmjpD4KK5SNf1qfKWhT3SjGjPUcpAnnthP3to1LLV89/oTXV933JtVBmPO
         l9nWQYFAfDYuxBsRg4lugn+PUTQ9ApZDTIuLc1eJ1OXAEz/T2b5izNCQILvZDZb6IyK3
         HzawgyBmnu16VSqAfy1NeKrtlpp+hwTugeSpg37tEm1TxZ4JIJK1waMYkZmnT/+aUGNv
         GaUvBRBXSdPy1qCzMAniigRxumCc4ZxgidKThCYJCtFswc293BcXcY8sjr9VgXp8E/YV
         n4sg==
X-Gm-Message-State: AFqh2kpt2y5HYWPjRm8UOCZZXnsxXSYEBwG104pc6EA7YocjrUdTrsmq
	Z/J559LdH87au7dzwTGIeJ4=
X-Google-Smtp-Source: AMrXdXsc60WQPmfEOgM0V8OVCMS6uFoIYxBdTIEc4MIHjZ0nMeiiUMEOLlzJdioX9+eswYdLa8VWew==
X-Received: by 2002:a05:600c:3c8a:b0:3d9:cc40:a8dc with SMTP id bg10-20020a05600c3c8a00b003d9cc40a8dcmr31909443wmb.27.1673792662637;
        Sun, 15 Jan 2023 06:24:22 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id q6-20020a05600c46c600b003d1f3e9df3csm37936797wmo.7.2023.01.15.06.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:24:22 -0800 (PST)
Message-ID: <8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com>
Date: Sun, 15 Jan 2023 15:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible string
 documentation
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_062425_830788_5D14611A 
X-CRM114-Status: UNSURE (   7.39  )
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

The compatible string in the driver doesn't have the meson prefix.
Fix this in the documentation and rename the file accordingly.

Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 ...12a-usb3-pcie-phy.yaml => amlogic,g12a-usb3-pcie-phy.yaml} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/phy/{amlogic,meson-g12a-usb3-pcie-phy.yaml => amlogic,g12a-usb3-pcie-phy.yaml} (90%)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
rename to Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml
index 868b4e6fd..821d37218 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-usb3-pcie-phy.yaml
@@ -13,7 +13,7 @@ maintainers:
 properties:
   compatible:
     enum:
-      - amlogic,meson-g12a-usb3-pcie-phy
+      - amlogic,g12a-usb3-pcie-phy
 
   reg:
     maxItems: 1
@@ -49,7 +49,7 @@ additionalProperties: false
 examples:
   - |
     phy@46000 {
-          compatible = "amlogic,meson-g12a-usb3-pcie-phy";
+          compatible = "amlogic,g12a-usb3-pcie-phy";
           reg = <0x46000 0x2000>;
           clocks = <&ref_clk>;
           clock-names = "ref_clk";
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
