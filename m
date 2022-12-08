Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F8FC3A5A7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Dec 2022 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eM86WBTt4FvHK7CdGQGMdIJXAn/Yf95uu8ssM7W/0l0=; b=lvyIfTss8iNGRv
	00Dy3UqHLfI3Pfwok4e6hSD/Z6fX2wM/mua6F8FnDOovIe1JXGTiPXqcpnn4FSaKDZHSnE7ZwyNI3
	eVieOzrBCn1leTsdzqsEMJ4DpB0jHQAccVWxizEydBWGsm6L/hMp9d8cRjyKVW9bV4kMTOxJGfEKX
	ZazxcTQNaWUH4IoChiAakpGzcmZqhLvZoSf/QBYM4BpNIzj4qzubpsfQqWmwYWB+kV/m9QEyg3R0y
	MJn9bzHuznSCVGIlE+fOrnicFyDFCfUjqpMAvr8K93EyxVFELTRR9STPrakTRidq7i5t43TMGzJuC
	htr3lNHNBi796Lw+oT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3FLc-00Fjrk-9Y; Thu, 08 Dec 2022 11:45:52 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3EBf-00CauP-3T
	for linux-amlogic@lists.infradead.org; Thu, 08 Dec 2022 10:31:32 +0000
Received: by mail-lj1-x234.google.com with SMTP id x6so1070528lji.10
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Dec 2022 02:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHpfKld4lMu5+ixat6T/4oDADkdqQ2JYTvtcw+gBQks=;
        b=lYkktDDamxCqSzLug7/jM6W5q3xrwBPVxdKHojjaI+5YLOTvfvjGAF3suKsT7ZOuZj
         D26pEZy5c+Fgf4U3ZEupe3wBJ8BY7XeWnpxs3oPF00XBwYvgdba0EYWCnniEDOIU25BD
         d93uf25o+GlAocvZyCKOC1Dqe4dvUAa2PE/zxshL55Jm19Z662tl7kt88IzxeMvx1y9a
         87haUECX9Ix1B2GJDY6XsflvT1P4JnchaRB2RdQ2gXqG8nb2lU+STpo3VNF0sXHwaS3E
         6j4IJITO8mGNzCKrnDIZp/65HCYeba7WcjyBptakuOl1p2TLS+yHAn2Js5IEhInO0T8v
         3lHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHpfKld4lMu5+ixat6T/4oDADkdqQ2JYTvtcw+gBQks=;
        b=PDrUgZBUjAe9yyS+5n49Of8HToi3i0fSTn9C31wGTNqK/zv3gmC/o8edN9JjqvFf1p
         WgPU3vSUjDnepmV9p+VXkZH4/CXRm433aI1P1zppkwFGr68WDltMn308ZgS+dqt6cp6r
         AIqQjXzFmux6I/Ayd4SUp46MRpATqErLCLBFTzxOt63VP2LVYJAbyvgeptUN+ePIQwIU
         86arWsaEnGjfQ316xL/igzkKHIzyQWaU3QZXYCN3bj9vi5SlSh6sPzYvZy4ep7z2QxoT
         CaTX/fyvwM9dLq6VLBSkz21BdnWY1CzVTsiv6loi3iKzBmb53n8YZKcqdLv0+q/1/Udh
         HykQ==
X-Gm-Message-State: ANoB5pnjKXzqxtoQiiVzx8li6uqIZmUrr/tf2KQzX2Y5VSIe/9sKceHl
	uxkrv8NTUtXhpc2N0/3SXvi1IA==
X-Google-Smtp-Source: AA0mqf4YQr6Rqh7drzmAs4lwxW/QyZKhfelPGBRvTCbcteoRamNm4E3qRXuBmWRnOH2IoXB0BKMdTg==
X-Received: by 2002:a05:651c:1592:b0:277:b9f:cdbd with SMTP id h18-20020a05651c159200b002770b9fcdbdmr31733522ljq.0.1670495485712;
        Thu, 08 Dec 2022 02:31:25 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:24 -0800 (PST)
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
Subject: [PATCH v4 0/9] media: dt-bindings: common CEC properties
Date: Thu,  8 Dec 2022 11:31:06 +0100
Message-Id: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_023131_177934_B8F4052D 
X-CRM114-Status: UNSURE (   8.22  )
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

Hi,

Changes since v3
================
1. cec-gpio: Add missing SPDX.
2. nvidia,tegra114-cec: Correct path in maintainers.

Changes since v2:
================
1. nvidia,tegra114-cec: Rename to nvidia,tegra114-cec.yaml.
2. nvidia,tegra114-cec: Nvidia->NVIDIA.
3. Add acks/rb tags.

Changes since v1
================
1. chrontel,ch7322: fix node name to 'cec'.
2. Add ack tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (9):
  media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
  media: dt-bindings: st,stm32-cec: move to cec subfolder
  media: dt-bindings: cec: convert common CEC properties to DT schema
  media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC
    properties
  media: dt-bindings: chrontel,ch7322: reference common CEC properties
  media: dt-bindings: samsung,s5p-cec: convert to DT schema
  media: dt-bindings: cec-gpio: convert to DT schema
  media: dt-bindings: nvidia,tegra114-cec: convert to DT schema
  media: dt-bindings: st,stih-cec: convert to DT schema

 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../devicetree/bindings/media/cec.txt         |  8 --
 .../{ => cec}/amlogic,meson-gx-ao-cec.yaml    | 11 +--
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++
 .../bindings/media/cec/cec-gpio.yaml          | 74 +++++++++++++++++++
 .../media/cec/nvidia,tegra114-cec.yaml        | 58 +++++++++++++++
 .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++
 .../media/{ => cec}/st,stm32-cec.yaml         |  4 +-
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 11 ++-
 .../devicetree/bindings/media/s5p-cec.txt     | 36 ---------
 .../devicetree/bindings/media/stih-cec.txt    | 27 -------
 .../devicetree/bindings/media/tegra-cec.txt   | 27 -------
 MAINTAINERS                                   | 12 +--
 14 files changed, 309 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (86%)
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)
 delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt
 delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
