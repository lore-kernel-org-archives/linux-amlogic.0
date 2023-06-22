Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BC9EB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GuNwTkLw4cyMi7u14AIQIcXxGZTUKWXR6uNyvLg21w=; b=hxitRovTkl/OqN
	pPb/jtRwLgvuMdriIAIDWv4sYnlZARy0KbxiBLOv77k7QzLVvNc7CDsb51ylroYAi73k6qBtATa8c
	fUwRunPaktewYJbd96sPN6ti/YC6G0/jV7Yq6AMwnZ4gBAxU1lFY4A4+RtV8YLHv9oNHeIf0z5LZW
	vL0QckZVXjlfMXprGFA6UOU8Cb6ickcbtihtKFPWo8Qo2eSV38N0WuB3iANtrsUZB4I8G+Wky3rZx
	+B4UKFNU13J8zrKi2UtIbnvrk7Gk+DmpFuqgUkk32pBNRjjXUF1bprDZej/Zt5yWhIyAToFfO8+OU
	o+CBHh4DJHXKKOVuIYRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs6-00HSpH-2I;
	Thu, 22 Jun 2023 08:40:54 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFs3-00HSmj-2T;
	Thu, 22 Jun 2023 08:40:52 +0000
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b474dac685so67813381fa.3;
        Thu, 22 Jun 2023 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687423250; x=1690015250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPGC/fa96zpj/HytqXk9DRYd8LBRyi1oOZrs0uuR4lg=;
        b=MUYZyptdAcJg1T0O9wYhBigoEt6oVG+58ToH25wGisgb+bVRgXNjO7ayvoEouzPqaJ
         62/+fADnMqgcsYpZMJyTOI8TW50/55AXUjO15/nPBWJL37i3qXGMv1l5s1kz21Op9+WX
         1azHh8aOwC+pnq+NKleVwd53dwALfxlo7cw9+gfP7OLQMQW+eurwDnFa+0eN9BbC8Dk2
         V+12XYOwDT0Dv/bbnKwODIEJbOTZc2sBmh37aX1XpwICsGC7vhiCRHD+2m3t4jK9YydD
         K1SxNSpVRyfeHUpTwHZs2MM8zc99OsAf+mjwJIalBYIWDxPpjb4J8RanDexPRz3daykK
         TxDA==
X-Gm-Message-State: AC+VfDz27xzNrUUC2NzGXZs6XyciUC830P+iQLDQV4e+XNL/Xcgar8sI
	sYV2poLgmQGRzxfHJ69c0OA=
X-Google-Smtp-Source: ACHHUZ4CsQDAtaDUVYpXXH32nzrpu6oIZfHh3G0dqM9Yi5mNLJB+oZefiGZ46baSV19/Gg3e9Ni4sA==
X-Received: by 2002:a2e:9b83:0:b0:2b5:89f0:bcc2 with SMTP id z3-20020a2e9b83000000b002b589f0bcc2mr2296652lji.19.1687423249668;
        Thu, 22 Jun 2023 01:40:49 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c214500b003f7f87ba116sm15441277wml.19.2023.06.22.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 01:40:49 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Thu, 22 Jun 2023 09:40:44 +0100
Message-ID: <20230622084045.519203-3-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622084045.519203-1-tanure@linux.com>
References: <20230622084045.519203-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_014051_806708_AE2ED085 
X-CRM114-Status: UNSURE (   8.02  )
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

Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
There is no need for an extra compatible line in the driver, but
add T7 compatible line for documentation.

Co-developed-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..4ca4673169aa 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -46,6 +46,12 @@ properties:
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
           - amlogic,meson-s4-uart
+      - description: Everything-Else power domain UART controller on G12A compatible SoCs
+        items:
+          - enum:
+              - amlogic,meson-t7-uart
+          - const: amlogic,meson-g12a-uart
+          - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller on G12A SoCs
         items:
           - const: amlogic,meson-g12a-uart
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
