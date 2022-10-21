Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508B8C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 13:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UY4GaWyME8OpoFcZXlhxX2ecIQ/IiEqk4aolsRjlLf8=; b=uCZdlzDt6ZL9n/
	8bKFNf/Xk4MFSxE5U2L5SA4eMKd6QX88b/e1h2iYlMk0dxDNXSVsmJtlPYSJ5LDLDVFsRPPaFZExD
	N0+sGSKBT7Fz6v//CKu1DV6JZWbYc6cVGhdw9clCQ/YThUQK0eGFnSXmwhr0U1Fapn9L5cqyhKUim
	uUNJaTE9180tPqasiDg/vjo2VbHze/g2nbPXtqiE6Ar8NnaHgUbb4SEWnO8BvnpXvi12Xus9l4DH5
	xxr22RrNfKSrXMOfqf3mCMF+aM1RyzXpR1Wq4X1aBsgZf4czWjO1lhmBXjMLMi8PX/dzkJs1hWpZ5
	rmz1Z9SRA5MJUfHbbdHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols81-007zb8-Fx; Fri, 21 Oct 2022 13:32:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ols7e-007z7D-My
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 13:31:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id a10so4364089wrm.12
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=i1C8rgUAGHf+jLqpE/CuMvEaAQwxa6V5+hxBqPwgUl4=;
        b=VT5D5asWne9UXufhJlAhGa0EmSt5P0Hw6devsJJzR8+iofV3cA2BWJNKGMuFsN4Fqm
         IcxrUgNFDdlniCIrLtHcj2X/aWeccarjVBhWGNRF3+ZiX7UCWzjuHQyC02aq8LPYOsjf
         ZGE5hxa5G71mBHwZUBvVV25OqgTXv3Yl7zKW1SvuSkCQkS8PDUL2OHPIPe0rSDBHGiPW
         O1dVAsqXIH9brG0AsAHQtaPtvqepSVJIynaIH37rTakT/6U2fYRn8zm/EVqYCqt5dvsy
         siz+j4NbG8YUcKTzJjdaKZy4VDS/2VZdm7wyi+JVA7TSqXvRln6ioq+sJKYjgN+DqxRi
         h3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1C8rgUAGHf+jLqpE/CuMvEaAQwxa6V5+hxBqPwgUl4=;
        b=b1leFcu6W87i8mMdK7L0EPaoffjKDMuKR9dBTunOZZTug5ne34Qob0bSH+AoqmE8Ux
         xmlqnwYmTsQshE7Ih/p+Cpggf9Vk3XGDlXwQBk1wvUkebpmZJMApgew82IY7E4jzb2QR
         BaUdzrxaCQ7onGRErhpjePz5YNkMkjpBn33OQmgXDJViI+Ycjzm3rKOdE08NAni6hjYj
         boQoYIS7QQFsIBYpQAUEyiJBvFqzcVN59rIGkrC2fPy3LN6l2aXKzaw7uwnIQ+cdcbu7
         lsP48IqOrQ4I8VmCfxsYMdCpZ7yQ14km9LNTY8uuBd4Sf7V+bEyAwsg+7HNeS8JxP4hI
         wm6Q==
X-Gm-Message-State: ACrzQf3Dnz75/R6n1U85J8dmqPRBPTwf0c427bmyvaM+xX20YKJV7n5g
	5uNAimR8Z4eM5h2EhSt0GJGM0w==
X-Google-Smtp-Source: AMsMyM5qyI1cW3ggb8lP2/pXLZo9ZzZ8Tvd5w+92XYdbvWvWBG5C05J0jgsWEpZL+/L7Tqi/pOTWvA==
X-Received: by 2002:a5d:5983:0:b0:22e:bb12:7041 with SMTP id n3-20020a5d5983000000b0022ebb127041mr12385502wri.645.1666359096510;
        Fri, 21 Oct 2022 06:31:36 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j8-20020a05600c1c0800b003c6b7f5567csm10325280wms.0.2022.10.21.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:31:35 -0700 (PDT)
Subject: [PATCH v4 0/4] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
MIME-Version: 1.0
X-b4-tracking: H4sIACyfUmMC/33NTQrCMBAF4KuUrB1JJrU/rryHuEjSqR2IbUlssJTe3eBS0NXwHrxvNhEpMEVxLj
 YRKHHkacyhPBTCDWa8E3CXs0CJqKQsYZnBPDz0/II4Mzi0tqa6oUpqkUfWRAIbzOiGPBsX73M5cHxO
 Yf08SZjP9aeXECRoagy1yqgWTxdrVs820NFND3HLWtL/BZ2Fpu1IYdV3qtJfwr7vb0sgc/P2AAAA
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Fri, 21 Oct 2022 15:31:24 +0200
Message-Id: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, Da Xue <da@libre.computer>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666359095; l=1850;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=uh9b1V5lppXzVxalMWZveFXtfZNKXVHWr9osZJQJmd8=;
 b=0swTXrE+WS10AzArr7fM6CGstAbhVRX7nQSIOVPrQrbIfFk9podLHQ5iJt+C/00Nj7XVBVPwvjaG
 BSHMkaSkDAQUMKq8yDVgWMXnURoaBsPi/EI1jLcB/9/tmwrPLfas
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_063138_775184_F8B0223A 
X-CRM114-Status: GOOD (  11.67  )
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

Between SPI transactions, all SPI pins are in HiZ state. When using the SS
signal from the SPICC controller it's not an issue because when the
transaction resumes all pins come back to the right state at the same time
as SS.

The problem is when we use CS as a GPIO. In fact, between the GPIO CS
state change and SPI pins state change from idle, you can have a missing or
spurious clock transition.

Set a bias on the clock depending on the clock polarity requested before CS
goes active, by passing a special "idle-low" and "idle-high" pinctrl state
and setting the right state at a start of a message.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Changes in v4:
- Fixed documentation by defining pinctrl-x.
- Link to v3: https://lore.kernel.org/r/20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com

Changes in v3:
- Fixed documentation by removing pinctrl states as they are not mandatory.
- Link to v2: https://lore.kernel.org/r/20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com

---
Amjad Ouled-Ameur (4):
      spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
      spi: meson-spicc: Use pinctrl to drive CLK line when idle
      arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
      arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK

 .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 75 ++++++++++++++--------
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 14 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 14 ++++
 drivers/spi/spi-meson-spicc.c                      | 39 ++++++++++-
 4 files changed, 113 insertions(+), 29 deletions(-)
---
base-commit: e35184f321518acadb681928a016da21a9a20c13
change-id: 20221004-up-aml-fix-spi-c2bb7e78e603

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
