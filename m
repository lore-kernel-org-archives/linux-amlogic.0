Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1948EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vdZNNW2XSW5UvvEVqYK1tLfrv5CxQ6AiqWIAh2kyRQw=; b=ZTa9k790x4ZysJ
	ytp9WzbZUClDcnajoOqOg5MYLLPK+6g0SfEEtd4NUisR4WOnrMvJXg4vkBE9Vq6lpva4STp3Jwybb
	1S2vv0tj9Fc0+zQS42DszBzGp3qYTzoZZtUZmw0i2j2z2vanh2r7sdKrQx39H4v5hIPXpMxDaWRJk
	fz7xDSAuMV0v8aIGPFjCmvPWQm9hlWPSDCpX5LYLEBW86zOaZoMCpHtPNFioKip+j/Ir4GtwaUXZc
	ScMML2fLlOoxDH+73tFXLjE8hqjpZikT88xpnvtkb19bK3pfdGCVWMn25Tfm9vU50d0ZF8k09EItD
	/Wv0nuFH+nxWn+aJvuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdK-000pex-1L;
	Thu, 06 Jul 2023 07:42:34 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJdH-000pdC-0f
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 07:42:32 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so413296e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688629349; x=1691221349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x64cvNWMyAOtj53CxXFEsM1gwZXeKU5DF+oBaw1uYBk=;
        b=l98nfWhuhVHY1arWpHEptZVR8MKJuNCq2+n+IqELw4RqUbbSvdyGgMOyLO5gXlIied
         F9OkU7rJN2KD8rTRnWNhVrFj16DXTlXpw6FoelvKaN8kH/BEL+PTKLlP8oPhGI/mVCwO
         0TrwnX+iDsIGvZEe3BNK8hkVMIb1ffaPMztuPhdxfqhCPYhFfRSCure5vrspuxE26Ozv
         abPQKOT12cCkASDolij9Cvfb/oAw3INuY3+uyN52foJ3Q6SRFqtOkz1CeVEj2081Gs+m
         fmGwX1sk51NKrqz1g4lW/fmRZULAl6SZpsjmLe5QVEjjTT9sE7ti3/y1ZQ9PEdIpO5yM
         ypXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629349; x=1691221349;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x64cvNWMyAOtj53CxXFEsM1gwZXeKU5DF+oBaw1uYBk=;
        b=fjp/fXekyivbfOy1v9Ozg3qx8J1+SkRXN0innoZMFOIU4H88r8NQ/+EBkKLnt+gu3t
         l3y1ZXNbadaLZaKaeaowbZDe9xEP3YDdd2SDb3H0vwja9h9kQl+95l8M0Nn1I39LqPQ+
         1tPjHs/M/NougPxdnAWxgjhGm85FhnLrbYbJdyoka0PdObideCr/wKUy9K+BJituHkQQ
         Jk+RDX/9byycUP9P0OVQLio7jOXNQg+QLdbewMwrYsFZak94rxDbKFDxdgJFn7HIPa0d
         Hj9UjS32Tmx/uRimUTD+WgYU53omtUaYUhNp8LFrfiXkriVrwLfAyZZARNeneK0jZVnQ
         74iw==
X-Gm-Message-State: ABy/qLYs5U4kNmxQEnqwEErs7j2/VJsVybCjCYLVc89y9KqxOoeBdbJW
	EQtEzew51y4A6SyrI8olsncS4w==
X-Google-Smtp-Source: APBJJlFzH+9QB4KwLcBEovhsELMHthw5vcgjq1xRwpNlm8hQJeRp/qfClOu+sWh5w+TRejmmidUFRA==
X-Received: by 2002:a05:6512:3b2c:b0:4f8:bfb4:e4c4 with SMTP id f44-20020a0565123b2c00b004f8bfb4e4c4mr1116470lfv.19.1688629349480;
        Thu, 06 Jul 2023 00:42:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h5-20020adffd45000000b00313f07ccca4sm1076798wrs.117.2023.07.06.00.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 00:42:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 add missing properties
Date: Thu, 06 Jul 2023 09:42:25 +0200
Message-Id: <20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGFwpmQC/x2N0QrCMAxFf2Xk2UDtZBV/RXzoslgDW1raKsLYv
 xt8OhwO3LtD4yrc4DbsUPkjTbKanE8D0CtqYpTFHLzzowtuwp6LEMZtzcn4Lq1XjhsWUep1xad
 8cRZdRFND8nO40DSGa/Bgi6Wy9f/b/XEcP8NnwMp9AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ewyoXu4idxKpr7L4LgGX3vSs5fM7OWs2XAtnKUZOizc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnBj03tLk4M3+6jnGHkhu4eGOQbxdHLb8qpQ4iJM
 94q2hOmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZwYwAKCRB33NvayMhJ0ajZD/
 9QMTvozPgPzHzmdVRz7Ai1YY6Z8DA5hvCGMmI+2BvshNSIwLWhbduAsZCVzEuu3K0Us84NkhTJ5aVr
 8Cq743wYnW95EfT5j0iAosWrotAVMTb32CNTCz1ilrqO2/fi3FTEN/bnNaqibP4uPHTT6rEaRyM3Ty
 qfvsFUVkZBXCrxFJF5DUjiF+4WB3CF1FzBu0iKedQQUW+JDIIXH4mmH7QAJ+LAwNM9jCv/PkK/dMEQ
 Q0NJRGtRHE/ZD/zAO4DPTHF65WYCj4OkJNiRQvacXmaxJTuE+L3OahEnE03rgiI4BdzcNyBsqKpM6I
 zvqvUMVfkPQhc+XbhGXK/RGMu3iWv9k60EIA36lGOGkuoLq8GIVcjiginqSalJiRhkKni+46LkFkbF
 4owVFxWuWijnd7Y3nnOHsuQDi56Cq11a4sj980wpFzHuEkz4F5uEfZGbVkLhBtnzXAXrb6BcDdTR+P
 Dk3+hYkJxb+bOtWjWqAq6gYNeeFQja4S8hfTTbUDPQQnstobAQzzPLnTAkt4Ef/FPfSFRztm6gvf8I
 xdLUkv07582lxnqv+QYpTECsunRSMh3LH6XWcfHHtAUlEr/jAnazLtW/4ydy54syjcp2qQG7BVHBy4
 hXwZrvgSTZdMGRcIX4SNFOIDnGXmhb4wD07CH50/ySkd+MMROVGg3D8nGOQg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_004231_281634_1C502BCA 
X-CRM114-Status: UNSURE (   6.05  )
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

The amlogic DT uses gpio-line-names and gpio-hog, add those
to the yaml converted pinctrl bindings.

This will fix the following dtschema check errors:
arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: pinctrl@40: bank@40: Unevaluated properties are not allowed ('gpio-line-names', 'usb-hub-hog' were unexpected)
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: pinctrl@4b0: bank@4b0: Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
..

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: pinctrl: amlogic,meson-pinctrl-common: allow gpio-line-names
      dt-bindings: pinctrl: amlogic,meson-pinctrl-common: allow gpio hogs

 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)
---
base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
change-id: 20230706-topic-amlogic-upstream-pinctrl-fix-bindings-c2b74c637872

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
