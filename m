Return-Path: <SRS0=7Y9l=HG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A21C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 15:21:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 505BB64E08
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 505BB64E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqZbBtJfOso4IRXsr15tjQRS719RaVzl0XWX30Gl5DU=; b=qQ27bYMDHcFWnzsqPSLX9T3kEc
	T9RssdtWbuPhigC3o3JDOeoeh352smYaSUicrrdFFon12Iv+47pu6/ZnuYXVvz3CjkdcQ5lteo8Dl
	EmU57VbVQFU7l7rwHIh2KgJkuWhSQrsM5Y3PxWaIF0fTf5+Oe5I/VqWkB5VL5vnayuiETO9agNDDD
	uZsk362FCDS+tqjdLQCfSm0yIhLmBcUDCZ7/srNimq1ko5THaww75b9dmnTIhIzu6WWFBvhWNsIYJ
	ghF6Px2ylDNSXlk2DQwH98pmAuYsOUrPTLC7jKdQTR/XFstcbFeYEpy/wnOfXstrH34jjs1bCIVri
	hh6L24Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7gRP-0000hM-VS; Thu, 04 Feb 2021 15:21:08 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7gRM-0000d9-E9; Thu, 04 Feb 2021 15:21:06 +0000
Received: by mail-oo1-f47.google.com with SMTP id n19so827336ooj.11;
 Thu, 04 Feb 2021 07:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=P7JarkNG0Jr4x/lj1itZ7BSEgkDgo9dz5ORdHCgfdk8=;
 b=dh4GfejqvsmFyMQrQhsCBa4KX0rSRaf6vgZ/x8iU/dOrkuSJ/RKDLq7Qs2YNVBOoiF
 cteR96JOePsob9kzGzbqi7bRtDt8Ojtxpf63vfZIFYpTG9hNDWppCdc3IROrs+V+iGah
 x5lWa60gQYcJ1pYGeA2DSBkPFK1+yRJL2oGtVjo9DvXwa61sZDx9mDe7nuO14bVHfcie
 Qgvb6YyXN02KhNBV5k6/Vi+0BFCpnSwrRlhqO7ZxKa9q2O2SAplwWuUpd1O8td440amV
 rUUAX9fZEIfy6UpSUlh0C7DgIWgoj66u8BHw/pjJH2YoQjvxJl84/JnLASCysdO1yBQi
 wu0w==
X-Gm-Message-State: AOAM533HSvL/8dVQDmLMNvnPcBAh0EzDzFa88HlsLSt0Lnzrm7fPempp
 nsZMAVsiYVsl0h7uYLlXRQ==
X-Google-Smtp-Source: ABdhPJzM3kHORViPede34wMD/uUSw98pduiPbhxgxRYTa/nSc0pWIAtPIW3tqD1eZiyu3WZiHYs1VA==
X-Received: by 2002:a4a:d50d:: with SMTP id m13mr52826oos.2.1612452060739;
 Thu, 04 Feb 2021 07:21:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 33sm1139125ota.69.2021.02.04.07.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:20:59 -0800 (PST)
Received: (nullmailer pid 452035 invoked by uid 1000);
 Thu, 04 Feb 2021 15:20:57 -0000
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In-Reply-To: <bf3d0a5683c50062a55182922daeec5cfdbe00cc.1612335031.git.mchehab+huawei@kernel.org>
References: <cover.1612335031.git.mchehab+huawei@kernel.org>
 <bf3d0a5683c50062a55182922daeec5cfdbe00cc.1612335031.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 01/11] doc: bindings: PCI: designware-pcie.txt: convert
 it to YAML
Date: Thu, 04 Feb 2021 09:20:57 -0600
Message-Id: <1612452057.699681.452034.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_102104_557150_C4694369 
X-CRM114-Status: GOOD (  12.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@axis.com,
 Jonathan Hunter <jonathanh@nvidia.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 08:01:45 +0100, Mauro Carvalho Chehab wrote:
> Convert the file into a DT schema.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
>  .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
>  .../bindings/pci/designware-pcie.txt          |  77 ----------
>  .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
>  .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
>  .../bindings/pci/hisilicon-pcie.txt           |   2 +-
>  .../devicetree/bindings/pci/kirin-pcie.txt    |   2 +-
>  .../bindings/pci/layerscape-pci.txt           |   2 +-
>  .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
>  .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
>  .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
>  .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
>  .../bindings/pci/samsung,exynos-pcie.yaml     |   2 +-
>  .../devicetree/bindings/pci/snps,pcie.yaml    | 139 ++++++++++++++++++
>  .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
>  .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
>  .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
>  MAINTAINERS                                   |   2 +-
>  19 files changed, 169 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt
>  create mode 100644 Documentation/devicetree/bindings/pci/snps,pcie.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
	Additional properties are not allowed ('$ref' was unexpected)
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
	'/schemas/types.yaml#definitions/flag' does not match 'types.yaml#/definitions/'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: ignoring, error in schema: properties: snps,enable-cdm-check
warning: no schema found in file: ./Documentation/devicetree/bindings/pci/snps,pcie.yaml

See https://patchwork.ozlabs.org/patch/1435145

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
