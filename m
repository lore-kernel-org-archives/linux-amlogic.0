Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE648C4321E
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Dec 2022 18:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOgcgSgtk39b0+LGTsT8wNo0Ia2+etdxTh24YQkxt0E=; b=2DHkx18JWrMVpd
	W2xDVKReEL9P2L8FKE3aPblFez01OpkbGuzCLBjYcIwwtrbwiMK3LI69bFfr60Zz573QKwGsa9bAR
	TCuxGHlqU55C1FbYqp179DyM/8mgCX2bLfg8RU8fS+ZiweaiOJ82Yvm+UKgKMv8rd5wVGphCPxBoh
	cDg3cuio8GBIoGeG/KlpaoeihxwMlqLQ+UcqrDs2R8a0uZFteRauO/XLVhSPrhhFuUenhntpiJtTv
	B9CDnGxhj+Eabf80M3H57KNpm6/uCparYHZlmEYX2N0jis6kiqb5bHQEKh774cXv6xkod1e43pS/a
	AJlEHxXoR0fq23tI3NvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1toB-00AMx4-Mh; Sun, 04 Dec 2022 18:33:47 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1tjv-00AMFX-Vh
	for linux-amlogic@lists.infradead.org; Sun, 04 Dec 2022 18:29:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id b13so4415120lfo.3
        for <linux-amlogic@lists.infradead.org>; Sun, 04 Dec 2022 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=Ds+u0ZbE0sJq/iBjWNK+IxPNbNDviPYZcAp+xql3tG9OD0vWUJ8mfgXG/Vaw9ddwiW
         xEav0N5hivFM+WsRUKsisnKVi+OmcpfL+dZh8IyGIx3ry1F7tciUd61J6xe5BkkBOu35
         qcgH6KTuszPG+CggawH1zVfd+rwsK/WqTeoFO4uhXP40rVGDcGMBqo3AJ7jCC99KeYuS
         3slDIWRZWydsycY6PPEmkDMDfNgcnAMpx0XUZpzcDVZls3N9jS2EkxyZUeIlfG8lW2To
         BbA7HiVcq1qaBvak1jJPKyygT50cVcPfUrAjRvEflATLZXrFKApwLkzPdn4FeUE+3iUa
         XySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=w38k68m2LvQQ0cA+edkHEXRPGHYIog5R+LhPs+SPdoPerOIW4X0eORpaaCRp1jGA94
         13p998NO8frv9obhWL6I3Tzhx6rCtcS85egxA0sFYFDH/DKPttsWllkUaJyGXWStRQw5
         zNWi5Visq57RqyVPzMUvuxwhwS+x/RkcC9B73rFnZ8dhhlz8sIcZ/dUkVNwTQF44w13A
         3HL8CGN8h06yTUKh3IbODODIzuP7ktrXPXyGBZKyYZTy4PHp1gpyIJe7c/WGmOy49wA7
         WP25ybYeEqWquoKIuttN59LQ8QXdVOV7IdOsx6IiAM/8gwLsDeyiUNwGtha077kJLFLu
         6N5A==
X-Gm-Message-State: ANoB5pltyNdYQjoGyWkFiIq6c7XfbTgXuomRsmVyOIaADd9NfBF/+JYG
	+jB4V6iuPK3tcV3RgUlJdKJhLw==
X-Google-Smtp-Source: AA0mqf6pY51XPJcwK4YklKJNLUWc3bAAU36hqO/Jj5kXIUWVKjswhYHVnyQo7swA5lN98jdcrzxwiA==
X-Received: by 2002:a19:f713:0:b0:498:f36a:76fa with SMTP id z19-20020a19f713000000b00498f36a76famr27418948lfe.532.1670178562707;
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Joe Tessler <jrt@google.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Jeff Chase <jnchase@google.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date: Sun,  4 Dec 2022 19:29:03 +0100
Message-Id: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_102934_906422_796206CB 
X-CRM114-Status: UNSURE (   9.46  )
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

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
