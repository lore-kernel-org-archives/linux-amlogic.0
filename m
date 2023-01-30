Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB00C54EED
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qNWafSQrm2gSqxXNiAmukTrFGypwqL899PGKF4xvpyA=; b=g/75YNf3BhqfwS
	URPmdzYThNhIs6B7xqcIomIC6nyMoQtIBH1dl2XJgL/bF0NIOgHPtXmi02LPSsOt98vA/0yTq6K/r
	xWh1nJrqV4+Ght1UoKdXKTzi4ro5Tibp5KW2cn6mzh6Q+EQ2usa58Cn6lSVPjZYxh06lCvz2ml7iv
	OGq1lmEOzPCmha1ZOl+JHhtuOVPrCkKF658Z/k4q8AcRMnh/HlRt6nG/wPCf9pmMqeYbSCGfXhtAq
	imoRqOZA93ROEUDWIV5CdgivPDeMEl+pi1DgPQ15ebsqcGMpZ943NNZBq5F0PvMG8hk0X0YeiFKVk
	9ne6lX+ysTcJqzy1SE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVtZ-003zEe-3r; Mon, 30 Jan 2023 15:16:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMVtV-003zDU-8T
	for linux-amlogic@lists.infradead.org; Mon, 30 Jan 2023 15:16:31 +0000
Received: by mail-wm1-x334.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so8780448wmq.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Jan 2023 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ad2CDTfEIRGVD+WwAFi71dqyquLLzi4LvwusVq+ExGM=;
        b=LUrIVvQUH5dW7iRU4JfzsvAiY507XIvIcT+m48LD8UjIwKt5mMJulbdorFPIbc6oh/
         hZ4AVQs30AIi9Fzs2OiOm3XbubB5SU5tG7jRFDa38M4yLHOKBs0XMgEz5AgkFGMTbA7V
         I8qLV11ETwq4QxbdJ86jUUJOi1jPXmHAeTNarmRxAIxkwcaeeFLcjqkgWmNDJpfDO1td
         Krupi5vZziC+B70mx8dNVqMY5GeggZk5U2MLZoF1XmxL3aZVX7cRWTQDhDbar6KqwiY0
         0ly2uHvXuqnuyDccydoomvRs78m4y71X5yPkZ3LJAutcruwDqwPntsR+lg6WAayp54MG
         zDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ad2CDTfEIRGVD+WwAFi71dqyquLLzi4LvwusVq+ExGM=;
        b=aYJGwE9aMHQe12x6Y/c/RDnMBK9bPchmanJ0rRd/ryk1T88jukmsCpeIYZCvc7LnuE
         Y9oysnvE9YuzWHLxUDK5JX17qr7HE5T5VhU6+oXpZBYA1tcAP4FxCVsmx+XY+51GIHmz
         wDlz6do0c43mNQDMkC6jbNy9iSJGcsaMV/H391jG73xRCtJK8BSxk56/VRTjKTYmYhFR
         Zxc25D4TOz1S5gwLap0aQIT+oxN64AuQHpOzXtWQPAb42jhxqK03b0UiAmhxF1nnF5ND
         7JwJDbEH4htfeo4ZcyvgcXN8gpKyrRaQsPJVRzRgNKx6G00ELXCwB/z9lrVcSopIFyxY
         llfw==
X-Gm-Message-State: AO0yUKUSwsetuka4EXXW+0AUz7bwNejh6XKXjiCGI4EtDfvZxWk6W/d3
	efH+6SdLkUf0pKOLbmN/JRKCug==
X-Google-Smtp-Source: AK7set9wi5BcJOb1ssAxFLB99dAbfO7xQCQqxJLpjXxwihsH6nelcA/v+ljTYIQ6Y9cOuwiU8N2N7Q==
X-Received: by 2002:a05:600c:d9:b0:3dc:4fd7:31e9 with SMTP id u25-20020a05600c00d900b003dc4fd731e9mr7484043wmm.7.1675091784504;
        Mon, 30 Jan 2023 07:16:24 -0800 (PST)
Received: from jackdaw.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id u12-20020a05600c19cc00b003db0ee277b2sm18735802wmq.5.2023.01.30.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:16:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 net-next 0/2] net: mdio: add amlogic gxl mdio mux support
Date: Mon, 30 Jan 2023 16:16:14 +0100
Message-Id: <20230130151616.375168-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_071629_317423_7F9E2FA5 
X-CRM114-Status: GOOD (  13.20  )
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

Add support for the MDIO multiplexer found in the Amlogic GXL SoC family.
This multiplexer allows to choose between the external (SoC pins) MDIO bus,
or the internal one leading to the integrated 10/100M PHY.

This multiplexer has been handled with the mdio-mux-mmioreg generic driver
so far. When it was added, it was thought the logic was handled by a
single register.

It turns out more than a single register need to be properly set.
As long as the device is using the Amlogic vendor bootloader, or upstream
u-boot with net support, it is working fine since the kernel is inheriting
the bootloader settings. Without net support in the bootloader, this glue
comes unset in the kernel and only the external path may operate properly.

With this driver (and the associated change in
arch/arm64/boot/dts/amlogic/meson-gxl.dtsi), the kernel no longer relies
on the bootloader to set things up, fixing the problem.

Changes since v1:
 * Fix missed checkpatch warnings
 * Change setting function prototype
 * add comment regarding the PHY id

Jerome Brunet (2):
  dt-bindings: net: add amlogic gxl mdio multiplexer
  net: mdio: add amlogic gxl mdio mux support

 .../bindings/net/amlogic,gxl-mdio-mux.yaml    |  64 +++++++
 drivers/net/mdio/Kconfig                      |  11 ++
 drivers/net/mdio/Makefile                     |   1 +
 drivers/net/mdio/mdio-mux-meson-gxl.c         | 164 ++++++++++++++++++
 4 files changed, 240 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/amlogic,gxl-mdio-mux.yaml
 create mode 100644 drivers/net/mdio/mdio-mux-meson-gxl.c

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
