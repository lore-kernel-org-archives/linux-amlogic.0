Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFEFC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Apr 2022 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ywdWLc0imUgIrt7elWOr5KByGQjHRPpPYJuB87Qu0Nc=; b=DY1D+S1sIPxsQx
	Wce3jlkD2tj09NsanYcttQB11o1xPI5hqpFmHXkTxme3psWONPXfygk8sNH+b8UwpxmvVodrGf0Ch
	oUPpfABzfQD+Ied//hgNmzAEc+8gwQpCh7UhXZ6TXMXWD5D0R0bgI+O2IVx4bZezJLYcQH7TADDAu
	hwd7axF6c4gbo8vyPGEFaeUVP1cyhlTpya06Wn3sc/nnRdnF92UuPhlUpJrTaRFp+tC8YiMBRWKUF
	blH7aAQ/8al+irS2eJL7gowjpc69lirhhouJpxYplsU3TLBzoTlUrfPQP9q8p0NN20s4SQQtl5FqY
	90x8MsBk40vZ6NKqFEnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncT1h-00CKri-Cw; Thu, 07 Apr 2022 14:22:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncT1d-00CKny-Mw
 for linux-amlogic@lists.infradead.org; Thu, 07 Apr 2022 14:22:19 +0000
Received: by mail-ej1-x636.google.com with SMTP id r13so11209882ejd.5
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Apr 2022 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zc36ZdLQggjp64Xm41nxUmHXQp3VMbJZtJwCT6Mf3Ok=;
 b=ABr3/OF0kBX350HtclyvC4dSwP+vX7Orxgj+KLA8X0ySA8j1CrVfZ30hK+hn7Hw8la
 8g4leng5C78hi7xBxlaDbz40C1WcpJIIKTVmV1lMCpjxud6FwT3cftvvR/f7ycs78//3
 pVFsNd0EilM3qBdiIG34y9LjBoYO13R8Ng4YA4x9kajsBCmNeT3AP557SKBeRb/cmfEY
 szEVXZ1FuMYaOjoaf2L0rfRq8cw2G8Y5D6zzsr08kgnrQ5TyRHzJQSrL9fvenEe+A5In
 6FTPE7FzzxFlDD57CXCwVRHi4/KudxOMI3tFYz6/Y+xC4YZS0DIt87gkNNYhzZvYU0eg
 BeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zc36ZdLQggjp64Xm41nxUmHXQp3VMbJZtJwCT6Mf3Ok=;
 b=ylygncgTMyr8IYmxo4DZtTVRcRI/EJWR6RUczr154Tijbei9h0QACLqFacZqv6uOOP
 IvWXftdcmA1xsdMnH1SO7YufzqjUsXIS1unXfULRO4/vyVKo5lG6uD9fz7PGUtYqrS65
 /RxpKcO7zMQTo0mrFFuxJLKqWpQnedwg4C17sOUBZ7IDDzNFxOy2rfDMd8fsnfq3ipdE
 +Tu1itaoirqDw9e25m+QkWPW+z7hNifZ2O1yENoMko6cS8y/q/liIv1qBdLvmrNkM02g
 JAU+i8XVZ4MfcLwodV7BUls9PVdNXzr76k8NpKj4vLOPnoGn4KZMUTYQzMpQXFtdWyW5
 Of8g==
X-Gm-Message-State: AOAM531ZIxP63lgvgUcPTdzKy7uuTohQMzH3Rkq+XRjA9WUhuIQrmZ67
 wkX8HpNKYuGSPRZ/kxCfUMxTZg==
X-Google-Smtp-Source: ABdhPJxq7xRZCHutmiTGN9LV0M6t9OKBrdXTNKhP6bOb9NNpujMmjyWR7hZ5yzUMqyK4+nC+/TwWOw==
X-Received: by 2002:a17:906:6a0f:b0:6d7:1021:2bd2 with SMTP id
 qw15-20020a1709066a0f00b006d710212bd2mr14036973ejc.395.1649341334259; 
 Thu, 07 Apr 2022 07:22:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm7569808eje.183.2022.04.07.07.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 07:22:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: meson: align SPI NOR node name with dtschema
Date: Thu,  7 Apr 2022 16:21:58 +0200
Message-Id: <20220407142159.293836-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_072217_786748_761E4ECB 
X-CRM114-Status: GOOD (  10.08  )
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

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/meson8-minix-neo-x8.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
index 61ec929ab86e..56ea875c418c 100644
--- a/arch/arm/boot/dts/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/meson8-minix-neo-x8.dts
@@ -65,7 +65,7 @@ &spifc {
 	pinctrl-0 = <&spi_nor_pins>;
 	pinctrl-names = "default";
 
-	spi-flash@0 {
+	flash@0 {
 		compatible = "mxicy,mx25l1606e";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
