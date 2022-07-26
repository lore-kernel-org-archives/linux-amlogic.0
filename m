Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E1C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tED6ndTgkBkc7D/38PtWmB6z7nGJ0g9R3JCQEP1iAt8=; b=4/NCeXXfbxa4Cb
	ELTcWCBWQtHG9v1f5t0t6z10PkKXzFIs/4cJgE1ARhWztdgihtQdCrvJR874BmFz2VKcTInMAsOeG
	Jhq5z+YIaEKUIHLWWigA/Q12WhaE1LMkkzfDhX+ALzEcwPH+nN769cnJhcx+Py0qYLpzNeLkdOyvI
	NgatBimdVDeotKkWbs+69zyfBPP3S9L9IDPzztnbrmjJb+BijknHZHFA1gAC5qdwsfTH6qo7WkZP4
	YBprgdDSkg4KW0NSKTLf2dFbpi8R0VXy3+X/9/ZNcunf6RL/Q54V3iggnldX3u6fx2ilUHwlklRjv
	TC82UcfAVfnl7uRve7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJCP-00GXNG-E7; Tue, 26 Jul 2022 11:58:05 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGJCM-00GXEA-4U
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 11:58:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t22so15897351lfg.1
        for <linux-amlogic@lists.infradead.org>; Tue, 26 Jul 2022 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYLUai/g9PzuNxtQk+5u3lNYDu3DEs371sQhIxnEx1U=;
        b=O5XnnAMMkLU5W9I+tb5iv/V7zHyqMVQ2/oyx7HN2nXIWsA+IPy0usF+WqhJT+McHqW
         7wwRUIj6hmKY8KzKaYLJQwx6DDhI/87xRjMmR1HBDQ+fPOVpKXR0jl1t5IjjppA/CWxF
         ALiEc0pLYC6sEFTn10XkTbRDHaBEXFXL9nXWIwyP1LOE0BhzF3Xr7KznoIA8LWIaW9v8
         1q57WAz9E7eOTZInOwKwgJeTPJQYTBxm250WEgM3YrPZqOR04Nj/ljxmqKkFDb9cBbjQ
         MHCvL5s4Zug2V7cinWP6TQl7L7cPhmtc9j9ME66HrT+GfkcT39ZRk0fjnTaBF/z1VWKh
         WeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYLUai/g9PzuNxtQk+5u3lNYDu3DEs371sQhIxnEx1U=;
        b=iMQrfd06Qrtrhjb2JOxgHuU1fvk3XbEHN/evgfAcGc6smMpIibynz5WTtPlIm3DV6l
         FGK6jbsjoMDfNUGI2GDLy5VnFZHve2nKlcVYxnkCo/HAK6R3QBwGSb1SB1qvm26NEHAu
         FMSfkKvbOj3KZ3G3gJJOFqbYVngewnaIMj1AQHOYdxZJuLg3bnJ3KsIDKsdHBrumWydJ
         nhcwGdjk05RMWGcY4/z2gBT1yJ07YeDVEYoMoieUxVhxkleqrWLrXcj7a+h8UlLQwbWR
         hDv4uIfRSyAHzyX6JQ46P0Jw3et9CWZ63yq9p8o3SthM1GeO7fMXcj8zb2vUDHQk1pZE
         7Kng==
X-Gm-Message-State: AJIora+tVTMJMcfnx5sAtuW9gKe0qrUr4AezHNY+D93jRo5kYHuRWN1n
	BW4emaAxDyOdUeWrJuP/rSPe4g==
X-Google-Smtp-Source: AGRyM1tLfSE4Egbpb2Jc+QspZmgwcEtAhCJrpE9RcM7ZQ/Hv4z8qtRIbJ7R3a7sa5pIKYoCWF64K8A==
X-Received: by 2002:ac2:5f9c:0:b0:48a:8595:c84f with SMTP id r28-20020ac25f9c000000b0048a8595c84fmr4424871lfe.657.1658836678359;
        Tue, 26 Jul 2022 04:57:58 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id g24-20020a19e058000000b0048a7d05739asm222219lfj.4.2022.07.26.04.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 04:57:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sebastian Reichel <sre@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	David Lechner <david@lechnology.com>,
	Iskren Chernev <iskren.chernev@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	=?UTF-8?q?Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Klein <michael@fossekall.de>,
	Dan Murphy <dmurphy@ti.com>,
	Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	"Andrew F. Davis" <afd@ti.com>,
	Tony Lindgren <tony@atomide.com>,
	Artur Rojek <contact@artur-rojek.eu>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Stephan Gerhold <stephan@gerhold.net>,
	David Heidelberg <david@ixit.cz>,
	Dmitry Osipenko <digetx@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: power: reset: drop quotes when not needed
Date: Tue, 26 Jul 2022 13:57:47 +0200
Message-Id: <20220726115748.101015-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_045802_199708_71664038 
X-CRM114-Status: GOOD (  11.02  )
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

string literals do not need quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/power/reset/regulator-poweroff.yaml     | 2 +-
 .../devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/regulator-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/regulator-poweroff.yaml
index 03bd1fa5a623..e9417557cd30 100644
--- a/Documentation/devicetree/bindings/power/reset/regulator-poweroff.yaml
+++ b/Documentation/devicetree/bindings/power/reset/regulator-poweroff.yaml
@@ -16,7 +16,7 @@ description: |
 
 properties:
   compatible:
-    const: "regulator-poweroff"
+    const: regulator-poweroff
 
   cpu-supply:
     description:
diff --git a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
index 68d7c14a7163..46de35861738 100644
--- a/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
+++ b/Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml
@@ -15,7 +15,7 @@ description: |
 
 properties:
   compatible:
-    const: "xlnx,zynqmp-power"
+    const: xlnx,zynqmp-power
 
   interrupts:
     maxItems: 1
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
