Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B31EEB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 08:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kEzlk8CIGbjnSKN4mA+krWi5HxBLAw9iGQcpSY4x+Go=; b=Lo3KadDzoNNNG7
	njPl/iXc975KnN34dqHpNPOrq85GmbBkCHNF0RfCgT69I3L+QG25Clj2kYus5elPxNhrsER5GtkyB
	ea4t3uPIQq0DsIhx4kFQoBDPhIruYb5IktrCbfQe+aratYJfXPp8W6CjGSlefFe8O6dd/7dv+bA46
	TjxMZI9GelcfLDeOiGrBs4lskqFXLUHWJjQBUoUviu/vpAIvutbrSg9QiOXQsLcXE8b499qUDEbNE
	DroZUGLPwqHOoQNDPA2J0+ums/P1T6psdbWOu1liSN+dPOVBh9dYB55ZKMYqHo3UAArDZK6td4QrA
	tohkEsr6ECWXsS9XKN4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJuf-000sR2-0I;
	Thu, 06 Jul 2023 08:00:29 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHJuc-000sOP-0y
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jul 2023 08:00:27 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso4985611fa.3
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jul 2023 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688630422; x=1691222422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DNkwga6/1zv+vFjJEB0SiQmwB5Ncp/pmSfHFUcuS9M=;
        b=G7qX29I1jdpViSoQGgBbNX5C8dKhOdGzeZbvLWDR1rzLF7CVPQQd6GDia7C9VWs/1K
         v4w6+eXenU58ba8bcfw+DUQqbgXsSTg8cIOSY2GnoFyxw9PhHpzh7QwO+9NCEVbCNjN1
         LgoMqpsnok/1Bd9RtTBOC7xe+BShfRjwXOu1k0s0Fmd1t46rMNOTYZXxizv5qCga04lS
         uEhpPHTG5Iz+wAn0A101N3SmE6O2PYr60+JDNmBxywhXBSNwlMIeP+uZB5OUEXxToLSc
         zrGeIIDBs2XgQZmVVRExcPUkVPXn8+n0fEBO/u4dF0B8vbojWU7ROC4Ccag3sxDSRuUR
         rGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688630422; x=1691222422;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DNkwga6/1zv+vFjJEB0SiQmwB5Ncp/pmSfHFUcuS9M=;
        b=ll61aHarbokl+gQSqyue/w91xv6bzAjDlF7V2/fzQjL5+pfnKzykoVg6yOzo9f2crP
         PIK1DVuYK9MXzLmaFGY0OCM7Iexj5nsS35S+pqLri6iZGOQ9C+hjMDjHkHyzZ16zBFPM
         kYTrvxweBSHSiwil/ZjtUo5iEchTa9Wfi/wCgubx7SMx9K2kWUzKVx1e/onomgkBX/ll
         roKPMuUGIrFL9+nmKdbFy9CuANwwqzOgnaqjwwdQhaGSfTyQhM1GYfJKbXtLWR0tfH6e
         8dwPjtxeomYtoGdTve1wR+9fJwEH7jDDE9SrJAajF840JuGJhJ2qrfvpIJjHNWpT5VgG
         ihfg==
X-Gm-Message-State: ABy/qLbgAMcB3T26U/+83qm/MfrABWc1dvOYx+/RDAFPmjFXxpmjtYcz
	AkCD3tPR2rd7Vdz9lURTAiXDFA==
X-Google-Smtp-Source: APBJJlEnXhY57vPXHaptivx2QID3UN3PcCRn5dL8PFd7YS6Al9ICw2IXkurEZoa0Pc8MfVmloyHkzQ==
X-Received: by 2002:a05:6512:10cf:b0:4f3:d682:7b1c with SMTP id k15-20020a05651210cf00b004f3d6827b1cmr1061597lfg.45.1688630422283;
        Thu, 06 Jul 2023 01:00:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003fbb1ce274fsm5587375wmn.0.2023.07.06.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 01:00:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: meson: bunch of DT fixes, take 3
Date: Thu, 06 Jul 2023 10:00:18 +0200
Message-Id: <20230706-topic-amlogic-upstream-dt-fixes-take3-v1-0-63ed070eeab2@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJJ0pmQC/x2M0QrCMAwAf2Xk2UBdYUV/RXzI2mwG3VqaToSxf
 1/w6TgObgflKqxw73ao/BWVvJpcLx3EF60zoyRz6F3vXXADtlwkIi2fPBu3oq0yLZgaTvJjxUZ
 v9himW/CJ2I0+gL1K5X+21eN5HCdo8is2dwAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=885;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=9h0g8V0w4EZoDM1hBdRwvYsmKbF4/IRNYRMwqyBNE84=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkpnST3ef3Co4BQAMsluEBGzZJtGLRbBpeHL0x8pHU
 3GCjLwOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKZ0kwAKCRB33NvayMhJ0WJ0EA
 CQ4qXCQThfkl+Emmx3JFRIMpaWg6plyZsXdJDXQ/863MYrlAs8/E7y92jh+Z3zgLtht6RkS2P4SQ9w
 +ds1nUPxTRSKY18bkPqW1EbRR6wqTE6WusHxDsebA39Q7iDU4Q26/25RfKwv4EiT5awYGX0h6IHqPQ
 JVOLttScBO9oeqEEg7iBfGwWE6nC5Z4cBVEUnDduycnC9hbh9ryYY0uDjbJ3euyQaA6WKVc8PdAjks
 mwcS9Bdd2RHYoa/MpGdrJsebeIKbtK3dqktRmwjMBXdZqKRtLdlmX7De2FLov/GWh1pp3rIIMtqJHZ
 ZAF7BiwWRURsUS64JvAztfFmZhT492pa9wyDakwFzyrP0WrwDaUsKOp7G+M62IFFWF6dJLjgNQt5nm
 fWT8KdjdLQof6HZr11ymke8v/bU1flFAQB+5pgX5D3I35MeQBjGrqLHVriwucdYO7gaqg2U88056ly
 mzSq2DQDFDnMMp3kZYPadJOpOUjoNemlMwQoTHzedohzHyIn7G8iH1NwHZehcHj3zUmNPDwv41POWi
 dcHCTFcvFbVmkxtAcsKV6EbC/gvj196z/oBaTiCls6zFvcyIjnWwCCjxxBxCPtFE2i9o9Ct/zviutT
 4a8iLWD8s5L1mBJd5qIpyUjy5Nej6LO+Amy28RgWgfdqDB9sELuI1GPUMbHw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_010026_341365_6EBA82C7 
X-CRM114-Status: UNSURE (   7.54  )
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

This is a bunch of fixes against the current applied and reviewed bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      arm64: dts: amlogic: meson-g12b-odroid-n2: fix usb hub hog name
      arm64: dtb: amlogic: meson-g12-common: change aobus-pinctrl node name
      arm64: dts: amlogic: drop cooling-[min|max]-state from pwm-fan

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi  | 2 --
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts  | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
change-id: 20230706-topic-amlogic-upstream-dt-fixes-take3-7f973dae0b37

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
