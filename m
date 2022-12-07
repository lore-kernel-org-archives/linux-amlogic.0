Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1804AC352A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Dec 2022 10:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00QXc4OdrnjuYStOxpQ6ed+j/F39CAxum6ND0yMdyVU=; b=b2o+tyxpCrfhnR
	1LkVtUaLiOlxg321Yc1JKurMrWwZcIY/Ji5LbfVz6NJ/lhAsiE7J7r4sS39iReJcdq/qPCmDbcF5i
	uIu9oI+m71c0gaqydLDyX1tjJRVr0SDsyQWRL9zgfqzVbaHt6L8b56TAVrE6vNqG+5ObgE5ksopn/
	ng/Nz3+IZ5DtJHqBI5F3C5cCqEVePBZzVeef7+cY9NbEfdXVq2zXOjJ3R3n+qRyqMJXykrNL1COej
	a/I/UTIM4/SwLJaBju0GbcNV6iZbiHKgwYI2fxZ/TqWOptsr4aJPNko/YMTMJOHmeO4lVFWYEJayN
	agAHdzvUWujaL3pbvEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2raM-00HB9s-AX; Wed, 07 Dec 2022 10:23:30 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rZs-00HAaX-Gx
	for linux-amlogic@lists.infradead.org; Wed, 07 Dec 2022 10:23:06 +0000
Received: by mail-lj1-x236.google.com with SMTP id h10so20344299ljk.11
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Dec 2022 02:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sijU5enLkDTq3DQ0nw0PYtfD3Qi+72BKYHiCTRs2ZU=;
        b=HZxXQqZ3S3FWmVtrocczB6d8HV4sm0tQJeYbpg4VYj1wUZu5In8brBDiGw5LJHzZEh
         zarVKSoEq5WN7ZOvOL4qZ+QAACHaJ3hZRjtS/u/PWaFnpuj3VJ8YcKj+1YfDTxgmPo4v
         CErSg8d8YiyQgIZsNb3NVn/ySgblrjRn9kYXtDOdO0YyQn5y255pH16yDlt3sOU5LYG3
         2TVtzB8YghEkfZ9Y7z6Mscy1fDDgD3OgJmNMr9Dcisba2yyfU2reI8Rny6r/ZqOG1vJr
         EoUYzUhbmQcy3BRUz7QOLxWbKT2EwWys5YqmirMvHz17JzH11jYwxgkv/wRYjCXu8x8Q
         jfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sijU5enLkDTq3DQ0nw0PYtfD3Qi+72BKYHiCTRs2ZU=;
        b=XfRTXQTVft01t9RaYAdfbGuHzHH14Nl9MggrM/YBHi1x31HSKo4FmxMyPedu+ABvCH
         kUdQR4L977/1Hi5XO4XsOfki0GBQ3TPs9afiOoC8cG4XPQ4Ri+VN9jyqd6q8ZmDaoQ+c
         U0HZZKYYJ6do1MIgVDm9OLrLv9pCrkI/5lhQ+vhnpfcS0UtpZTa4jhpIik3T6uWX7izl
         nLy4DUMIy0BmBMtqme1JGJK9q/ikimah3WdIbZHf9dkWMSnljDtj47PBBLcxvbmLjcR2
         vK7wfl31Ld1d0Ch8yPx8vE2OXrJ3pQ/6UudaAWNGBEcSsn4hc0PGCS7f2mLNn1Gk5m0n
         BbVQ==
X-Gm-Message-State: ANoB5pmecAJkIYN9WwOTjs6L8/XvWEUiTpcrpqPijjfpx/SXeK7AU20+
	/2ffyaZ5fCEXBun7pNpxnCiyxQ==
X-Google-Smtp-Source: AA0mqf5h4sxrFTul2bwSrjyQP2HZcpafzgXYhRs9WtHjL8fjJIlDzOVwcLZqY3H4sd1gKZL9bdaOjg==
X-Received: by 2002:a05:651c:1147:b0:277:4726:bcf2 with SMTP id h7-20020a05651c114700b002774726bcf2mr26270843ljo.107.1670408576811;
        Wed, 07 Dec 2022 02:22:56 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:56 -0800 (PST)
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
Subject: [PATCH v3 0/9] media: dt-bindings: common CEC properties
Date: Wed,  7 Dec 2022 11:22:44 +0100
Message-Id: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_022300_570679_1B9AE034 
X-CRM114-Status: UNSURE (   8.47  )
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
 .../bindings/media/cec/cec-gpio.yaml          | 73 +++++++++++++++++++
 .../media/cec/nvidia,tegra114-cec.yaml        | 58 +++++++++++++++
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
