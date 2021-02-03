Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E0DC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 06:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47EBA64E40
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47EBA64E40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=igN8g6rFZMnuEFKSycJ1ygU4TtqEjj0eAKPcZUfT5ng=; b=w8l94EkldsaJRc+yjzOVYkE5P
	/DPWm47gZr+5k/oI4roKCSlbLzwVDd2nM8rQq6eOJRcKUDuBQL39Vk3ZrF9jP8BSEMn3w3I9jibXU
	TzcHbcIzJbb88b9uVft1BRTu/vXmEFe9kz1HH6n1Aufn8AJgGQ11et4grgdvPIzgCeGGVJJx+xziB
	ZlPW1WBVkjsi3qgM33EcuqQSz08HLbqJEIW/HwQeaLw5EXmv3BYnp7swInMXIOyy/L7V4Cb2LT/RW
	SQsPh3XTisOnPgJLlmir6hkjGXtyS0XUL505Xov6mgQ8hhK+jP0qhsrWeuqEaTzl5K0/OdMO+MsNf
	OGkUrg+tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7ByY-00035M-DC; Wed, 03 Feb 2021 06:49:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7ByV-00034k-80; Wed, 03 Feb 2021 06:49:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9CFC64F5D;
 Wed,  3 Feb 2021 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612334952;
 bh=TbVrfhRWcP0NLWkcKrc9dypvQJV2iCyeSCaii6eG9Ro=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k4bNSi5Yrb/h0nIFSc5i07chfgyRveavNrYx6tXmNY4YUVo71kjXoj58WpoS26hCk
 uCrxhKvd/JINpBt6xI4aRXzjzz0q2z0b4Jpzn88TxH1VbIs3gYWdkh1niFtlVTB1kX
 1CopGTwzJ5CvVY/GK5gLvjC7egUIna+Cj+SOrhEItOX6sdcbHz1w+Nh+oBPKLN80iR
 MAuh85U3/Rg8T1TN+INLzWRfCb3TxylBCkTR64tAC9G6v3tO+CoRnnf+ZhwJu7Jcg/
 G4h6hht8I6O6OBd5bMopuYFgBepcOY61dAfTEygpm5fHjmekUW6Se249HLVv84fyTP
 /oH1Bp1Y1nkKg==
Date: Wed, 3 Feb 2021 07:49:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/13] doc: bindings: pci: designware-pcie.txt: convert
 it to yaml
Message-ID: <20210203074900.6d581153@coco.lan>
In-Reply-To: <1612287895.001149.3887347.nullmailer@robh.at.kernel.org>
References: <cover.1612271903.git.mchehab+huawei@kernel.org>
 <706e684f571e142362d7be74eb1dcee2c8558052.1612271903.git.mchehab+huawei@kernel.org>
 <1612287895.001149.3887347.nullmailer@robh.at.kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_014915_449990_11075E84 
X-CRM114-Status: GOOD (  15.53  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@axis.com,
 Kishon Vijay Abraham I <kishon@ti.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Rob,

Em Tue, 02 Feb 2021 11:44:54 -0600
Rob Herring <robh@kernel.org> escreveu:

> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> 	'type' is a required property
> 	Additional properties are not allowed ('$ref' was unexpected)
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> 		'enum' is a required property
> 		'const' is a required property
> 	'/schemas/types.yaml#definitions/flag' does not match 'types.yaml#/definitions/'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: ignoring, error in schema: properties: snps,enable-cdm-check
> warning: no schema found in file: ./Documentation/devicetree/bindings/pci/snps,pcie.yaml
> 
> See https://patchwork.ozlabs.org/patch/1434686
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.

I've no idea why the bot is hitting those. My tree is based on
staging-testing[1], as I need the regulator patches merged there.
Such tree is based on v5.11-rc5.

There, dt_binding_check doesn't get any warnings on this schema:

$ pip3 install dtschema --upgrade --user
Requirement already up-to-date: dtschema in /home/mchehab/.local/lib/python3.9/site-packages (2020.12)
Requirement already satisfied, skipping upgrade: ruamel.yaml>0.15.69 in /usr/lib/python3.9/site-packages (from dtschema) (0.16.6)
Requirement already satisfied, skipping upgrade: jsonschema>=3.0.1 in /usr/lib/python3.9/site-packages (from dtschema) (3.2.0)
Requirement already satisfied, skipping upgrade: rfc3987 in /home/mchehab/.local/lib/python3.9/site-packages (from dtschema) (1.3.8)
Requirement already satisfied, skipping upgrade: attrs>=17.4.0 in /usr/lib/python3.9/site-packages (from jsonschema>=3.0.1->dtschema) (19.3.0)
Requirement already satisfied, skipping upgrade: pyrsistent>=0.14.0 in /usr/lib64/python3.9/site-packages (from jsonschema>=3.0.1->dtschema) (0.16.0)
Requirement already satisfied, skipping upgrade: setuptools in /usr/lib/python3.9/site-packages (from jsonschema>=3.0.1->dtschema) (49.1.3)
Requirement already satisfied, skipping upgrade: six>=1.11.0 in /usr/lib/python3.9/site-packages (from jsonschema>=3.0.1->dtschema) (1.15.0)

$ make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 DT_SCHEMA_FILES=Documentation/devicetree/bindings/pci/snps,pcie.yaml dt_binding_check
  LINT    Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/pci/snps,pcie.example.dts
./Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:102:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
  CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
  DTC     Documentation/devicetree/bindings/pci/snps,pcie.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/pci/snps,pcie.example.dt.yaml

$ git merge v5.11-rc6
Merge made by the 'recursive' strategy.
...
$ make CROSS_COMPILE=aarch64-linux-gnu- dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/pci/snps,pcie.yaml 
  LINT    Documentation/devicetree/bindings
./Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml:102:10: [warning] wrong indentation: expected 10 but found 9 (indentation)
  CHKDT   Documentation/devicetree/bindings/processed-schema-examples.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
  DTC     Documentation/devicetree/bindings/pci/snps,pcie.example.dt.yaml
  CHECK   Documentation/devicetree/bindings/pci/snps,pcie.example.dt.yaml

Thanks,
Mauro

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
