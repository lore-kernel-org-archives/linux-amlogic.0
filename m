Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C6EEB64D8
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 13:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaXHKgS9jXvXi1ywkRwaYdfm8Ds08ig8M33z1zkc0LQ=; b=OqcEpX5N4J1/GL
	jJQavQATQqbT5imJAL71O3ujrtCWuqUfCeJ6A6I/AUFAneVAIV5vqkUkkKkOyzt/eeHHGPlrdgKgc
	mRXFtzacky0l67XO3Y22U/uDKa/kMNMriR9PRQsLYcXECgKMA91d80etFj49Rnw0sB/oX23MbE05a
	+JyvfeCaji0ewacnUybrFgCm3pbzJiWO+3ZN8PzYwXitS9yvzFI+u6HrPCOhkHg++v7xUybzTrpz2
	OVCOuY/hiWp4mrnTMFEJ0lIjJGBudQaPAZF5/qE3tV8ZMh083P15LPuXDotfF+e6vyPCC0MwRDG8T
	PfpEG0tauWPHtqqr40PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbjG-00BS1u-1c;
	Tue, 20 Jun 2023 13:49:06 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbjD-00BS0A-37;
	Tue, 20 Jun 2023 13:49:05 +0000
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-31110aea814so4846510f8f.2;
        Tue, 20 Jun 2023 06:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687268942; x=1689860942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/BXWd+aXbwkUNKUI7mfSjhHzxj8tSAcMR0CS9iLOvM=;
        b=OAFw9/ucgrstJ/K8W2BfOIQKhUZKkISJCFowKpM0kMrtZ5oz0Sk69meOHakFK1gony
         lQ/Pasci3f0FTA1uyk4KTH4/Ki7tBfTREeJdLFhaXiT8p3JX5/wL69I8WGHKyj6PybMP
         RdCMRkGZse1yDdfi+Nkjg9jfa9ksUq4gjwuH72Va7ZOU4D+khpFTZfNjkCFcofP6ohDg
         2lZtEN/lraZa8Apzs5AviO6GacIPfo1c5RKs5EAxCzPtJsagiti/Qu6nTJRCTxEdfZks
         yGMFpeW8nZT0esE8xgPNnQeatiw78xM5tnexU1ZoxcZJmHKUOFlzW06e6/9JcYHllpum
         IouA==
X-Gm-Message-State: AC+VfDzy80z7mMA0caltez8O1xIWyhQXbTHojKQI+e7sk9k18BZxWBJh
	0cSV9Is6vYxF5WmQqqbuNmM=
X-Google-Smtp-Source: ACHHUZ4HNFVMIUb0Zh7Gx0B6Oq8Kqx+HNyzAbEMjbWZVsRqaf8aq8GMkLYWMW/gF2A+AWb/keBBOCw==
X-Received: by 2002:a5d:4cc2:0:b0:30f:bea9:bf17 with SMTP id c2-20020a5d4cc2000000b0030fbea9bf17mr12536587wrt.30.1687268941809;
        Tue, 20 Jun 2023 06:49:01 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d4283000000b00312780bedc3sm2038012wrq.56.2023.06.20.06.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:49:01 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Tue, 20 Jun 2023 14:48:56 +0100
Message-ID: <20230620134857.238941-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620134857.238941-1-tanure@linux.com>
References: <20230620134857.238941-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_064904_022176_1BF962D5 
X-CRM114-Status: UNSURE (   7.76  )
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

Add bindings for the Khadas Vim4 board, using A311D2 soc, a Meson T7
family chip.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..8dbd65170c50 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -211,6 +211,13 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson t7 A311D2 SoC
+        items:
+          - enum:
+              - khadas,vim4
+          - const: amlogic,a311d2
+          - const: amlogic,t7
+
 additionalProperties: true
 
 ...
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
