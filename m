Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9FEB64DC
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpAlougS+Ob0sZDVX/wX9mXYVCAnlVZp1UxzL3RKggU=; b=lm9n5JVunrZxe0
	oQGZylbcUfKleQoGTgPXxm/FhEQuMzXzJM3wQfDakq2rUKTvvr/yWSVvZ8CT6LBivpt4Kl/GLwHOS
	kbHOF/By3othG8ylBL7nEMC3vVqNXVBvTJ7Xzfk/OmF7BZIqzcPYuSm8t8JMPke+Q5hbJ1Zh+X9HN
	w8VbVW60Qa7YBoadnKknK4Fq2r5fGk9phWxfupPmbWBpe7oQ6V7f/rmXwl3U/OcOLdMaDMU53gNF5
	A+HfGiDVPQMFOOaVQ4/cbPk00LdIn6dAAOlmxGF4l4lFWwRczNUCiyJFblKumnhvi7NfXp2qUsqy6
	TZP2JVIWX8DMuO1WGJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdN-000pgd-1U;
	Thu, 06 Jul 2023 07:42:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdI-000pdL-16
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:42:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-31434226a2eso384290f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688629350; x=1691221350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2xJf6LtXqb+cG1cn+98PpU58/TQ6QjsGiq0akTtyxM=;
        b=g4/A9XOBZHSO3Z6bDesCK4elOmLEmIZ7+L/qFWQHNuiNXob2dL9fuYzHxAm/OicC5v
         59K6qoFWYMv4t6aQjBFPViHiW6xZGpuO/qUWmGUjMXmi40MCtiCxA/wDWMVg46nx51kW
         lRfmVR4MrqdEziav2zTnDkjPZ15zqCzZe3/fNJE0BzQ8otcQCVTOUi1ouiICOEdZsPLP
         gUNUTYLmyM/vgDbDdsPegV+HgT0evxIesGFjVjqBpU236ZTgXnXDqs736UqPRufCXvf9
         p/sOF7oHllcDCX/lk9NSKk+jfEjiJmHQtmGdgNcycluclfkoLQQb3Ns3GkaiyIvuT7m4
         n05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629350; x=1691221350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2xJf6LtXqb+cG1cn+98PpU58/TQ6QjsGiq0akTtyxM=;
        b=HZzYM/0GWk5tc+0QkE6yylz21sM4DeVwIv0DBocZpyXkXmFOItzrPPz4vMiJxX6qgf
         UaY3ZNk+zuDHy5M1PlUgbDQRzypI683BhWT+suBLK0wV/a5CvQr/7adFijXvTGd2AxmI
         H9st/P3oa/U1u2ofzHQoWrch9gEYuN9umMd/EK80i5TsHB/7g1Fv4FnfJnANWLiU/3TO
         2VkG5bgKFwEzHQIBMXvoOqgs1/ooxQPF4VgNBBujIO7DWfevtPma1V/U6Px5lPn5ldA+
         xQwk6mKZQoccCO53TFQNt6LAsfedmww2RhWoDsLv2n1Ag+0F4TroNsD4Ar5fPix+yCv8
         jqZA==
X-Gm-Message-State: ABy/qLapDJUfm+zoPMLv3vQ3Y3IpRzj0ulP0U9KgRx5BjYnNjjoqf+dK
	AeEBY9iOyA82RswkxzmE6hUzSg==
X-Google-Smtp-Source: APBJJlFdWl/gUJixYmUhLPEj9ueBHY4XZg/xbYJXSAIyxIpr63uH1eXk6svgJovoAwwTNEnsYGwR3w==
X-Received: by 2002:adf:f845:0:b0:311:19a2:e7f8 with SMTP id d5-20020adff845000000b0031119a2e7f8mr1528509wrq.1.1688629350449;
        Thu, 06 Jul 2023 00:42:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h5-20020adffd45000000b00313f07ccca4sm1076798wrs.117.2023.07.06.00.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 00:42:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jul 2023 09:42:26 +0200
Subject: [PATCH 1/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 allow gpio-line-names
MIME-Version: 1.0
Message-Id: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-1-fa442d5aae91@linaro.org>
References: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
In-Reply-To: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=863;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CvISq8m77qzrDepKN/pgIE8kK1poDrLznvCC1KuRa9c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnBjuLrmzrKiIGe2f0Y08BKK5wT7jr6WDunTysTt
 ALbPD/6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZwYwAKCRB33NvayMhJ0Xh8D/
 9Y9YZvHA5/qdF73W+DZOgviI/MlPr/M81wGeixqyfxgrNpRCVVDqD4vPhDrGTjN51jrgz2a4OBe3il
 BFBBsq3/rMrptLfOOr2gCw6y9aEFPpPbGcxky7rn5f0Df2eq5+Di3VIjAnxaR8r8R22/rorya8Ys+S
 MSHixtMF452I9n06+nWl3DfE9P539cKgWYBnp8uUXwyTtZgz57hyqR4x06Znjnv8QkcQGYj1q377R1
 dawUxCUEnWyQxKHZQMTpHCuUjPGwRUja3yl7Af8GoXwDFXUMNXOvVQckicr9Vye7Bf3bSZXVkCt/67
 p9p/y7h4zCrwVsZV94KMZTwDO0gw8ybeEm5alQvEBXhKWGTjUybGH2mlwNmGthPvWbaf0GFIveC9SC
 R3P0JX/snQWOX0oNbJumCPrcOZE333nFl7SP2bNsSAdsfIanUO1iS/TdoPqALS0hyxCRyqSJurijgI
 BhcAhILnlLCKnQjTi7NUUA2KSnX6kNXR8BxAgWmVbrUj5etgUB9qeYvGxLD01KgLblyIxcGDUMU3Sb
 kz6qNO3G+5E2FXMVj83hjNFbBVlG6NfprWoQOY6LqBE8GrTDXW6QYAkYR/dRleYE87oLBtitlMasED
 Eud3II2rH5fVd1D+7xwvRljmT+1oIbzRafjVcffYJe0wglRLNGcow7d3jJtQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_004232_391410_AD294D98 
X-CRM114-Status: UNSURE (   7.61  )
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

Allow gpio-line-names property for the gpio subnode.

Fixes: 94df03a45276 ("dt-bindings: pinctrl: Convert Amlogic Meson pinctrl binding")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index a7b29ef0bab6..28659f0389a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -34,6 +34,7 @@ $defs:
 
     properties:
       gpio-controller: true
+      gpio-line-names: true
 
       "#gpio-cells":
         const: 2

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
