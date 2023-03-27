Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D80C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Mar 2023 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ve15+y4ZUkUm8iPxCBx0aZkNj5tgOc8zQoFwfkttpzg=; b=WA7W9yBQOS72cQ
	U+TQhcAohh++GHNiMXlfnR9uDexbG2k0x+OE3I5nhGd5tlMeODTcGJbaoFPeWONvos6M10XhbJoqu
	Iv2F6D+rg0DExtdW5AjkGmaocHffC4KeqXbrAsFSLJpPgQLI7hdrKb2SB3xvUxwjLTEwA7N/xg9RY
	mfPuOM40i8M73J7Kz4C0Ubpus2Qp3n1AlFKK1DWktn6CyL4Klpb6hVfj8ekwpO8OjZ5IT2smc3LMX
	CU5YsJqYrCcrJnLB3r9eKveDexPeES3FVdXj5bpaZquLwyQcUhUwUUTQTewaarv/L0IlDv4MCCVYA
	b5zmolH8/Br6ihOtFCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqEs-00BodZ-2D;
	Mon, 27 Mar 2023 17:02:34 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgqEo-00BobW-2d;
	Mon, 27 Mar 2023 17:02:32 +0000
Received: by mail-oo1-f50.google.com with SMTP id o26-20020a4ad49a000000b0053964a84b0fso1435257oos.7;
        Mon, 27 Mar 2023 10:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679936549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nPOFBMhoL4jHZsvJmOjSl5D0BIN5gJSRQGiqE9q2H3c=;
        b=3DPHU5lnBPKXC8rZ2xOVr+sCpa+aHRRx+RVpfHWHG/rLsoxbfLOBIhiK/KQEVaANzA
         YbR1d8M4yYBZ9P0Uyee+WkeyvFrgQzt10Eic8ijAQHlNBg3XSr74IqZinUX3em24wP2V
         kwcQBRXbJGSMk9lfkARMn8geuQF3Eby6gCY0fbFzXat8p8ZqbhIh1+Gd7NJiYl4bP0FN
         Vac5ziYXwA5aGvb2ggAdFPZhSLFX5DlVDlL1O92LxzzSwetkmMBvpR/5n1eWYFNfAHKP
         4e6yq1zZysJ0Z4va716mG6n+JB0QvFVI/WIO2RDmaw9YfIoK/UQypzh2RbxTvGnVns0P
         ZamQ==
X-Gm-Message-State: AO0yUKU+8Egr3Q10TNTBROIzqYIw9qz8CNy9WRs9ZyOxqMetO0pJR4bS
	mN1pQJdcniPeZjIXUp1lfw==
X-Google-Smtp-Source: AK7set+ReDeZtRjKuKxOhzOxaf9gzw3n2yPYHW0trSCSXupHPjmIjp9ZmSyOMp5s4T1qdqiErzfeYA==
X-Received: by 2002:a4a:4185:0:b0:533:c6b7:27dc with SMTP id x127-20020a4a4185000000b00533c6b727dcmr5766669ooa.0.1679936549473;
        Mon, 27 Mar 2023 10:02:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j13-20020a4a944d000000b00539b8372bd7sm10950434ooi.29.2023.03.27.10.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 10:02:28 -0700 (PDT)
Received: (nullmailer pid 4108900 invoked by uid 1000);
	Mon, 27 Mar 2023 17:02:28 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: amlogic: Drop unneeded quotes
Date: Mon, 27 Mar 2023 12:02:22 -0500
Message-Id: <20230327170222.4107746-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_100230_854159_2BB0BA05 
X-CRM114-Status: UNSURE (   9.43  )
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

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml      | 4 ++--
 .../bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml        | 4 ++--
 .../devicetree/bindings/soc/amlogic/amlogic,canvas.yaml       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index 1748f1605cc7..7dff32f373cb 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson Firmware registers Interface
 
diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
index eee7cda9f91b..09b27e98d4c9 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/arm/amlogic/amlogic,meson-mx-secbus2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson8/Meson8b/Meson8m2 SECBUS2 register interface
 
diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
index c3c599096353..cd06865e1f2a 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,canvas.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/soc/amlogic/amlogic,canvas.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/soc/amlogic/amlogic,canvas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Canvas Video Lookup Table
 
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
