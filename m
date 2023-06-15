Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8DEB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQEY1w05aIr2VZbu681DsNIi+hHQ8hpYnOZkZON8zKY=; b=VJPECRg8FsYQ0N
	qZMSVzVnGcO6ckuOMBzFqcDP20iMHyKw073Wo7lyqj0Gm94JwcEokM45dxtv/E01w4QHHD4S2r725
	bfnqXBXVrnX6tLObWc2+Cpj4Ji4i3t3KVJmyqtl3k4B3Uxrx1RbUJsBOXswuELqVSoSUFz20M2pod
	t0+3346ENCVco7pHIn3P8O5exHxBbR8ljVpfgxj2+1V3slOPT4UHun/95x3r1hZ2PkzlfTK8uz5T0
	bMFVHeNYtNQNfw/dzPQvPzMJrOzpie5CD1/ePLRppB810gvIafjeCKu4ut78jaz0+dhMnt+7Ny4m1
	hjdUbSNq/AFcCl/6YfXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rj9-00FkZs-0F;
	Thu, 15 Jun 2023 18:29:47 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9rj6-00FkY5-0z;
	Thu, 15 Jun 2023 18:29:45 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f8d65ecdb8so22787705e9.0;
        Thu, 15 Jun 2023 11:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686853782; x=1689445782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lrjdhAQll3ozbKk3iq4lsIPgqd1B5L8UK1g627bZ2E=;
        b=jy1pWtRz6jmz7DH96EXIU2/lZ92AZM5jtEhHomU9Ivjh6h5LGi/hj/lIz3crrD6aQg
         GQEce1umPCqx/a23UnjpiO7g10PqLdlSpuCCq7TIt23v/3kpJGMMZvsVw/M5aQHKSp/g
         Ip1I3zP01/jZ46LPsPARbs1ukE/4UsnFzSJdcsTWr37kWJu0q7n6+9ZRPtyHE/aje2Vn
         tWJsRCRvByG01oClq8vT5yrICpZTasJjz2II5OZzCXWNTaVBij1xpO+zIOY1sio7fCUz
         QJQYA2kVXQg/x/e61PSlC3sNTpek38RcFfWZkGbV2HvI6zIe84QX4JYFldEXXxDm/J+n
         i9xg==
X-Gm-Message-State: AC+VfDz0cMCeGx8MyfT++Ku1qfHF6vdSwWqcaRQd8hb8wAWP5c1dEH99
	CiI5mgHYkn9o09DzhvXYk3iUOqk+gJ4Ryg==
X-Google-Smtp-Source: ACHHUZ7r+9ZYNEqFLrWEjTH7jRPfEPnVtyW0dG2pYyt3SbaAiUU94hflUBEFZtkXrTda0ZhMeKhdLQ==
X-Received: by 2002:a5d:6b8c:0:b0:30a:c35d:25d3 with SMTP id n12-20020a5d6b8c000000b0030ac35d25d3mr14887733wrx.52.1686853782041;
        Thu, 15 Jun 2023 11:29:42 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id c3-20020adffb03000000b0030ab5ebefa8sm21525887wrr.46.2023.06.15.11.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 11:29:41 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick <nick@khadas.com>,
	Artem <art@khadas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 1/6] dt-bindings: arm: amlogic: add Amlogic T7 based Khadas VIM4 bindings
Date: Thu, 15 Jun 2023 19:29:33 +0100
Message-ID: <20230615182938.18487-2-tanure@linux.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615182938.18487-1-tanure@linux.com>
References: <20230615182938.18487-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_112944_341967_21417082 
X-CRM114-Status: UNSURE (   7.71  )
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

Add bindings for the Khadas Vim4 board.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 274ee0890312..1091abbae6a2 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -159,6 +159,13 @@ properties:
           - const: amlogic,a311d
           - const: amlogic,g12b

+      - description: Boards with the Amlogic Meson t7 A311D2 SoC
+        items:
+          - enum:
+              - khadas,vim4
+          - const: amlogic,a311d2
+          - const: amlogic,t7
+
       - description: Boards using the BPI-CM4 module with Amlogic Meson G12B A311D SoC
         items:
           - enum:
--
2.41.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
