Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDF8EB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soJsZepj7qffpjFiXU5iFQT0UUgx5BTUpl12zUXrm0A=; b=cfXKcNeE8RBMMs
	+YgIaujGcR+CUMYuUKxvTdDt8fqboOylffh3BDEN4q9KDyQT2GxndPbqNPPumQFTI/buxeu0kVCSK
	WGv/MMNG2Fg9unWBTGgG6FmyOVHm3oY6Bv0CAGl+1HpPI4bNR5j8yhOW+dz2FSPtRI8UXzxgD2win
	UMBxNiGZsRig1w1j/e4nth4j07S1MeA5BRN56r55xFypnHRYL0cEZR2Nt1C6SB+0naAa2UrqnLeDv
	CmV2gpIgT9+/y/pllXqHogyNzTxbQzKdML3bCXe/4n2gAod99HUQEC+14c2QZ+mrgm0IA2cGjkUDu
	ePu0EVleKScLa+YQrZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuY-002t6b-0v;
	Fri, 23 Jun 2023 08:12:54 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCbuU-002t2X-05;
	Fri, 23 Jun 2023 08:12:51 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so367854e87.3;
        Fri, 23 Jun 2023 01:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687507966; x=1690099966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGvZYo2Xe8nWteW+0mB4VjnmUSaAF1CaOPdHGsKnyTU=;
        b=RKzYe0fVTFfsBW2DMWDejrBo2AuBDDk+/RBnKVT333ceu2laEQw2FZLJfb/+lCcXUs
         kGPXnnMwo+TRjTDHGsrndSoHnxtNhcnaf38zlJRv7ciED++ema4XK7wv/DvVz3Bk2Yxs
         YCEzm5HiEJRJ9R3CHGjCtFI9QWpycAC81B2sTEejfYNAj4aYj5bTrwzcuzKMxr/LPWEt
         uq1NT7YuIMqWVanMgcVXn6NO+vrEUhsQWvv+jqiGbxTsRlJNzCCq2rL76mXSELSjqHXp
         WOq5eP/mHNYfz+qV4zATNDA9mI7TI9fPZ+uR1bhM5Xy7SpTC+cFDu5bdz4pTEtmm3bIx
         7acQ==
X-Gm-Message-State: AC+VfDx6gjYLsImWjwTYFAVtKO4oxPH4KBdgqjSWfY3Q+97fUky17/5w
	btTb53Y80pH0kLNwD3kH0JU=
X-Google-Smtp-Source: ACHHUZ7SXZVXvO3FSaVk617WP+fiSNU/3M9rGM3KTy+vnSTVvZiAFrnSd7gmCEczmqQ/5m9A4TcPfg==
X-Received: by 2002:a19:8c49:0:b0:4f8:6e6e:4100 with SMTP id i9-20020a198c49000000b004f86e6e4100mr9597994lfj.52.1687507966306;
        Fri, 23 Jun 2023 01:12:46 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id l21-20020a7bc455000000b003f9b29ba838sm1594141wmi.35.2023.06.23.01.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 01:12:45 -0700 (PDT)
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
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH v5 2/4] dt-bindings: serial: amlogic,meson-uart: Add compatible string for T7
Date: Fri, 23 Jun 2023 09:12:40 +0100
Message-ID: <20230623081242.109131-3-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623081242.109131-1-tanure@linux.com>
References: <20230623081242.109131-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_011250_062405_0C957B97 
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

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..ad970c9ed1c7 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -50,6 +50,10 @@ properties:
         items:
           - const: amlogic,meson-g12a-uart
           - const: amlogic,meson-gx-uart
+      - description: UART controller on T7 compatible SoCs
+        items:
+          - const: amlogic,meson-t7-uart
+          - const: amlogic,meson-s4-uart
 
   reg:
     maxItems: 1
-- 
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
