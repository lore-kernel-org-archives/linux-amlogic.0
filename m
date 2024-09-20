Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1057ECF58F0
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2024 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up6YgItZgw1/qtl1FMiiyLYbTcwfCFS1jSpcrwEwznw=; b=YjVL/Aa/GypEoW
	/QGd5tMf//aCPvCTjk8i6fbmPqWVRkhLF8C9D6BEfSj5lEIHBeyBrs5zA2WvJzfuOjZJiOsmj2p6j
	WOrLpAnx42xvstYu8q+MfM/QNh0zfSW9HSoa9ZTzL+oMovw13NteohXwm2qfr/Q0wgn+/zUYIcmsS
	zZzf/Owv6KrqG7QYNzbmE0+n8r9jhEUQpjI+9KH6RrOhjTve1jtWMpfJ7ZyLUiuYhTBiGQGTpry6n
	yXtZsT/gkm9o+FsZXVoMz0orUr7WyoauRViVmbEtY859x0iQLWcCxNbEWlzQ26AiB5dnhZ6nHqysJ
	keIEs2gUQ3pAltZSB0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZMP-0000000Bph2-1K5Q;
	Fri, 20 Sep 2024 08:51:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZ9W-0000000BnLA-36iO
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Sep 2024 08:38:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42cba8340beso17507545e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2024 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726821489; x=1727426289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT2RF7jns1eZm4iFgSUdoY+bcOaQqGhahQcgK59xcso=;
        b=TV4fq++DeL4dLwqBZEJth2lN8tkdESg1mqlq937CSTdm54qsPhOFtchHaHIU89Bejg
         umyJ8uiBDdQqtujKScSuZIDf87YU58uBuQuw5N5WQ5QkSnwoaeKHkBG/H+MizlL04aH3
         RgNvM1HOueeAYsOwxCfKAV9T3DsRSNuIPqIULgOOr1H+sro7mqgapE9Fbg5nz52oFYeE
         q/vxWN2kH//w9kq/PcNJSPgOca7vLOYVZHy6IHOfsAD1BHYmHqs1T0Jqs1Q9kT3+cgbW
         nqbQuG3iAmdQN39zafb3qmKe3h7nsIYsslja6WWIazpTVQyIM+dzm7g/a9Bo8lizQ3r+
         A9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726821489; x=1727426289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gT2RF7jns1eZm4iFgSUdoY+bcOaQqGhahQcgK59xcso=;
        b=POd7vHjiuTEqbc01CQymbMCL8NeDcVpNVzc2BMoMswKknMxFhtDlCKq3zznCHLgpEP
         cUaVO6Os6USTK5xCujCngv0EgUflEH+CHuTMaZ0xbyCMIbAPiTek/Zk1dSKrECw+rUac
         7TkoBWD5hukGZqj5Z6ZRlK7QdcUmGA7Mu2nTVBKujisNMQaImm6Ccl9fVyd0tIlXuLaB
         dIwRFqTLN0GgRZ3xlHAnovU1LyaqgqYqwJvC4BznsoJxmaS43AaR53Z4ZaBAf0zFHIRR
         xX6outz/wAemieRLAHjuWyJMBd357TF7Wk8o/Lz+R4U36w9WQsDMILGOqlcQJ2knEpWN
         Z1PA==
X-Forwarded-Encrypted: i=1; AJvYcCXUh+1dDsSzPNHnEgXd/jKOQO2wRY3pJKmMMaq2GpHjQvU/UZL8Ob1MX0KQT0sqa3VUhvD7EWA+ZH7a9gCt@lists.infradead.org
X-Gm-Message-State: AOJu0YwPEvQSRlBk/QFa5mT5nair/Et5y6mNOGeFeELq0dZJ9Dqf70XM
	pqHLO6zNVBQwYkbUO6GzSTcUTkJgqXv2HGkWLg3AOgFenzuJ6qQHxQp5B46yAPk=
X-Google-Smtp-Source: AGHT+IE5iYFX6WbTBCf8hPKKmvc2byWHvUXMxBGORLFXUMBKGWVjztPI3IQQ7+Y9YV7SsSQ/lBAm2w==
X-Received: by 2002:a05:600c:444d:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-42e74480c34mr32809545e9.17.1726821488647;
        Fri, 20 Sep 2024 01:38:08 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7540e2c1sm43099165e9.2.2024.09.20.01.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:38:08 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Sep 2024 10:38:03 +0200
Subject: [PATCH v2 1/3] dt-bindings: mmc: controller: allow node name to be
 named slot@*
MIME-Version: 1.0
Message-Id: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-1-5aa8bdfe01af@linaro.org>
References: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
In-Reply-To: <20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=j4Lbv6zNfqApM1V0yGgeKWlfIsHLow2v2D7sYIjkoo0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm7TRtOO5ZDGB2QmQUkPJ/06kTzIWKKiisCP4shXUQ
 InsXEMyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZu00bQAKCRB33NvayMhJ0e2nD/
 9IWH1wZJU9XdD6gMI2xMEZU8T0xA9K+1KFRbOZVINbrRwYyTirYYoTlr3Xm8nG6AJ7LXYMa8QLahEw
 9U7ToR/R/hBkPgUyTbYdpkLxsahke9cMoCgPiiO6XKceTjn+YHkOx5RVOCt/n/Suj1sxZXenLO7tAn
 ztn7BAmhv42WPi0Z6+6gqekvb2Yro7qJLFCvScppDy3MUeYRAq6gNqfjkUuWorrPg45lMkFVcjD+RN
 PPaqGpZcSg3+r5slvgETedy5DUwt0qPG4WupRFtfBrZ0JSI2tUE5MtRSLkAWGO0aghjCFcoqrKDxdb
 goO5xpfV3aapOLYmzF+VaSGCtMoJQyETFJ5UbnjPSZZL7uKM1wkcpS7pVpG/gFs3pwxTYb4u3zKq5B
 wiQFNSLylTCparrRpM3p/ttLUJWqKrz6tv6Bvulda8v95d71BPn1O9xofO/AOR+sL2weGWs9g0HESg
 3qPSTlC5RWI9wrY/7F3tdWGcZ4K6GbrWKXxLf1pWcv63Hj82CETY+mt6ku8cNfChUSX1itt3Lz19oh
 Qeh074UwOJ+ivJ+pHI5dFrQhDFLnhRkl5OvqTSj3ec2AkW3dHDUxYYi69r2Os1zhr1LSrTOOsUfWdI
 uz5/RuAmJ4pMcld9lwSnU9WGNcBZUmwoVy0rDB6jeOkJ+zlp+ky7hp00ZLOg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_013810_787883_F3FB7AB5 
X-CRM114-Status: UNSURE (   9.49  )
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

In preparation of supporting the mmc-slot subnode, allow
the nodename to be either mmc@ or mmc-slot@

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/mmc/mmc-controller.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
index 58ae298cd2fc..f797c32ea688 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
@@ -20,7 +20,9 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^mmc(@.*)?$"
+    oneOf:
+      - pattern: "^mmc(@.*)?$"
+      - pattern: "^slot(@.*)?$"
 
   "#address-cells":
     const: 1

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
