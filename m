Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD6CC54EAA
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0GhPOtRkIVSVPxXXa0U1hfUq+PI0MPIFMIQg1wUVsA=; b=gCwLTV67y6MWgR
	GOoOxeAutObeBZWW44QGJZQtjsDCTtoS6d+lnG9Oesy+Mr9/fqdrPopV6BuZx8KGs+iT0couGPUnf
	c71wEJICDnCEmiX88Y6ahVBFV34jvHLWn7dCO1l7xUv8h8Zh8xRZOGHOWHqiNeXAQ1qibKkF9WORF
	3na8Wc1rM7FBxOSfqVxt9hbTDbVHmSpK3ahgCUXtEnyRaXB8T4Uls6kXG/qUxLwh3hRKcVZrjQLCM
	8TqmGzGHD+BjK2FbHLCMRIaxPy/dWo+0fT/Pp7t0xeK3ZRacHL/Kljj/3wkaPghaEXEXmuu6NL6i+
	f4xIJdRbuB3snnTiO/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQIc-00FOXG-PI; Fri, 27 Jan 2023 15:05:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLQIR-00FOUy-Iy; Fri, 27 Jan 2023 15:05:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso5600720wmc.4;
        Fri, 27 Jan 2023 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gepcoh1/hxUv6nKXHcQhtixyQIosb0XKZ35X3906qAc=;
        b=NWDPk6+RdbArgGiYL2c5OoIy8HWhZyEEVG07FXCpyTehvXUE2Pbj6JtRkyyb+fAKkj
         lmL1qZoIP+vYKEdjggclryVwDP34zv6/ghLS2wSes30w3la4h71562IhnhZkGr9PVnnB
         AaWKkRvl3/CTBMCme5T4jjoQLn1gwPfhHachm8k2qF8bPt/2CUW+Ap30AsPBzy0xtUNA
         QKi+CENchAych+BeBIREvESp9b3OPZYugMqUsiCkaSayIU3Vlok0qot4UdwlAl6Sw9Wy
         3m8qFBVykVI5Fs43V7I4q4BMd79W2bURAEaKzdmJAgGV4R65Ssk+giv5+pbTaEyJv0Bh
         Om5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gepcoh1/hxUv6nKXHcQhtixyQIosb0XKZ35X3906qAc=;
        b=qwSFBeafOjvIfHQoxMm9HhEsiaIbuVagcGwn3VEMIEK7lunRAHA9znc3gcvHZPfBpK
         eSmPOkDO1cUb8p/ikM1B3r5Dk9eQxb9mo4deppjwkIfn9oIHpMvXoU4G4d5M9g48dkB9
         2rHZEPkn8USEuo36/PDLS0p49HQ9lImnZeAtZ1SjThvajIGsTLFZEHK8bUH7FvzXRKnB
         9v/UtPLNvg8DIGkQUcnN1QSYo3LoNmthBsb4k1Omcj97v+lC1jsEd8bv5fbanW9W9V3S
         n4m6yutaar13UCnbpPs/u80bTBAR30Ahp5WEIkRRUBKg8q3Jj3959ZKrgeZiB7v3XBnw
         AiTA==
X-Gm-Message-State: AFqh2kpbygFKwRZnw9f+v7BwBSarihwbZ7Q3k2KEo+NGop2QQ53lJX4R
	izqAgNYsw/nw44lUKghh3xs=
X-Google-Smtp-Source: AMrXdXuSp44ZwmQGg0LnuJYoMK1vu0OceJljCbHt02EaiC/wLkMHGzV3oBGBHANWrskj1koMT2WeAQ==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id hg6-20020a05600c538600b003cf98447b11mr41889835wmb.23.1674831941414;
        Fri, 27 Jan 2023 07:05:41 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id l4-20020a7bc444000000b003db03725e86sm4573395wmi.8.2023.01.27.07.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:05:40 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for Radxa Zero2
Date: Fri, 27 Jan 2023 15:05:35 +0000
Message-Id: <20230127150536.3719090-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_070543_685801_B73BAF5D 
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Radxa Zero2 is a small form-factor SBC using the Amlogic
A311D chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes from v1:
- Add Krzysztof's Ack

 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 8aa6b6a92c29..6e3cb5a0d879 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -154,6 +154,7 @@ properties:
         items:
           - enum:
               - khadas,vim3
+              - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
