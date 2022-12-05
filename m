Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377CDC47089
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 16:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bloB9N9eJ6Yosd+Um0q+tlX8HEkm+wZd6nhitcyR9KU=; b=t+qf6bcomawsZ9
	GBvmdq/wnOc42n1YZru/XKOrsWbV5cjKDlJlcgpzp+i5yeo+kOeVBzluGV+R8NhSH5A49AJ/abFqA
	v/+J4quc2jOEFtkS2UXOWGBfRaWaXh+I9tKibcK4ZcXakxCamRj5GTqxkiaQpb/6H2/tWef2L9qW4
	HUGPBMiYP2dpN0CtXGerCnzh0gaIBviprM7wxwEjfw7TxehjXCH9mXxGUPyBNkLiamckkfsmeo3rG
	HVjeyk3UYdLI3jUwm/f6BqMUU7s2TWUQMCv6uFswpILTyTaUU1zGI6wTF+5Jz+MXzhrm25Jec6mB/
	0NVT961E42J5FEh27zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2EMG-006UQF-DL; Mon, 05 Dec 2022 16:30:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DF7-004fmt-9y
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id d6so19059931lfs.10
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LozJakmRPJFzg/ckcv3lU7gBQVZGydFuBGaw+4YvyO4=;
        b=oMvyFE0xe1taULlgGWwpo0L3fNBGDWl7ouUma06HK+xzS/giIFDv6sTx2ukPaNwBdI
         EhtJgBi2oo8UjDDZwQN5xZSn7svkEqtLmanWSSVpHGUA4ab5h3KvRtsH3CeM27Gv76bI
         qYVdTpt0bdvih9008vnv5C1piDSi0+oCksAAv7X9aPdO3gtYnb1zISVb2bmqga4JGVJP
         azwp12cVK6th/Uxjay0ezjU7TqvEkPTjDr0hfs3xsw2wzbzNpnbvma4lVKIkoWrgiEll
         lMVsa6qDieYq1EpaDNwc1hkRgGEjEp+7xlpKSq3NlabZPdO2EZd4OYj3X8WGdcoA9MrX
         cdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LozJakmRPJFzg/ckcv3lU7gBQVZGydFuBGaw+4YvyO4=;
        b=BWqf3ClfUWK9Xrg8Avg8VvE7TYwxohBrX4Ss5qf7a6A3H7lVIzrEqBbcCC6SpayMh0
         DqCtHKYep2BAT7QLEc6USSN3+/yHsPZTPdUytvwnPvGA8338GuSY2ZZIHutqYV8bPlZm
         2iDxRrmrCIZ+hPCXSnZ7BTG0W06PndoGNo26yAi14U0trgNY46UT1HOONr/wwiHmjFhe
         cUs73+/6hUENGLiq1nn1eOKpQoUU0uyTB9LEgP6i2P4XV+wor+VAtXvWT6Tx64Fcol5w
         cQcco7V8Shx0Jf6AzCBb7HQj9zZGEC1RBSnXEc1MhreEKbZXV5KaOiACoCr5BENoZms9
         xkCA==
X-Gm-Message-State: ANoB5pljVi3EqUx8m41FJqZ6fhSXt+f6K4EvxdwJUzB/tQKT48fUnMbp
	VshTHwYdlwveMmGm8P8IyNS2MA==
X-Google-Smtp-Source: AA0mqf5UN+gvwEFT7C47c6GOWtYi7O2hdR8MEJdkd6EoMWIUWc8ywJfP2cZJGIe/M+Lo2TQUVJpcIg==
X-Received: by 2002:ac2:4e07:0:b0:4a2:2a60:ecf5 with SMTP id e7-20020ac24e07000000b004a22a60ecf5mr29212296lfr.57.1670253528289;
        Mon, 05 Dec 2022 07:18:48 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:47 -0800 (PST)
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
Subject: [PATCH v2 0/9] media: dt-bindings: common CEC properties
Date: Mon,  5 Dec 2022 16:18:36 +0100
Message-Id: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071853_383468_2D8F29D2 
X-CRM114-Status: UNSURE (   8.58  )
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
  media: dt-bindings: nvidia,tegra-cec: convert to DT schema
  media: dt-bindings: st,stih-cec: convert to DT schema

 .../devicetree/bindings/media/cec-gpio.txt    | 42 -----------
 .../devicetree/bindings/media/cec.txt         |  8 --
 .../{ => cec}/amlogic,meson-gx-ao-cec.yaml    | 11 +--
 .../bindings/media/cec/cec-common.yaml        | 28 +++++++
 .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
 .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++
 .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++
 .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++
 .../media/{ => cec}/st,stm32-cec.yaml         |  4 +-
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 11 ++-
 .../devicetree/bindings/media/s5p-cec.txt     | 36 ---------
 .../devicetree/bindings/media/stih-cec.txt    | 27 -------
 .../devicetree/bindings/media/tegra-cec.txt   | 27 -------
 MAINTAINERS                                   | 12 +--
 14 files changed, 308 insertions(+), 161 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/cec-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (86%)
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
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
