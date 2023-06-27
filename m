Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C45EB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 09:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0mlnbXFFPH+eBqzxuJBWcXb60NDuCM098NUj+Di09MU=; b=dZc/4lOjVs5GEP
	mjvNtlyLyoVi1S+7D3amH+pygQFI4PmXuJ9ir0Xe1QK+PJmaJ59/AeKHAyNXkKbR+N/eL6dk5Lb6s
	zucGttcaKfhbKhkNVRHStqlllwDX0q+zkDHK35Ddtqr+YXrQFGHsxNv5icyi680KfatoQj7yRfgJf
	iV2uB42/hrAz6knAi+H55xrOWk6ncyEgxd2B/ac5UUQzq57u5Sdy/eJ5g9XgkvWGHFqPVPs9IyWnl
	60LDhW+iiJrZEJ5H3fdvAkZMSADxnA5Bb80Fa4Kv/A2Cl/B/u9gKFplneo/FdoeI3PHjJS7kwxoBz
	FfXfM9ncOO1LVhP84bGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iG-00CeRA-2R;
	Tue, 27 Jun 2023 09:10:16 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4iE-00CeP7-0a;
	Tue, 27 Jun 2023 09:10:15 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so21511921fa.1;
        Tue, 27 Jun 2023 02:10:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687857012; x=1690449012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ4ox9zZfq6KQM/b5bg29ZlihQTwce7dLHJXfPOkyG4=;
        b=crPZnFml4pF8kxbnLl6WuBT9E+5xhTnsTHjfIKLJFIDQhky0THMZD6fVj8uYioCoaP
         dTUAfNYi5Cq6dbwX0RZNVfg6UULRLAvm3eETvXJvNKzW2Mi5viES5qzIcnMW9LZSksiZ
         1LkXrgfMPXKQZVx0zjVjI2DR70CdTcnRIChiaKHfNHFN//Mwg4YqBGUq3hz10nVxH9kh
         qwHoqqkRp9Ru6ilusR2Y/Oh81eBeCVYj1M+Cvtjc33ZYLVemfjcyl+/NCwUUVBy7iD8/
         0H80fKwRwRREH7Or2qenH1+ZpR9rfypcVxjxXMfQHrcRvV5vNdxVd9mtzJgvE3VVEooE
         5hFw==
X-Gm-Message-State: AC+VfDxXNr0qOa6by6tcxfdiTqqtab6sGNKwAfUJAm+rHs+TShDHsyRn
	ygDaza5NYpYS4avuDPX5WpY=
X-Google-Smtp-Source: ACHHUZ7fSXRncc/WNbUjlTRqfhyq2XPf1I7o7GDIYcMY+0k+/BGmCnQ2hMRniMAAq1/HHMIODpfiYQ==
X-Received: by 2002:a2e:9212:0:b0:2b5:bc27:d6e1 with SMTP id k18-20020a2e9212000000b002b5bc27d6e1mr5281655ljg.3.1687857011458;
        Tue, 27 Jun 2023 02:10:11 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b00313e4d02be8sm8880122wrs.55.2023.06.27.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 02:10:10 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Lucas Tanure <tanure@linux.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: amlogic: add Amlogic A311D2 bindings
Date: Tue, 27 Jun 2023 10:10:04 +0100
Message-ID: <20230627091007.190958-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627091007.190958-1-tanure@linux.com>
References: <20230627091007.190958-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_021014_217360_564FBFA1 
X-CRM114-Status: UNSURE (   7.57  )
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

Add bindings for the Khadas Vim4 board, using A311D2 Soc from Amlogic T7
family chip.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..f5c51dfe4281 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -211,6 +211,13 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic T7 A311D2 SoC
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
