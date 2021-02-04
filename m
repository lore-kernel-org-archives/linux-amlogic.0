Return-Path: <SRS0=7Y9l=HG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6228C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 17:30:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0142264E02
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Feb 2021 17:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0142264E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2aS4ngufn4QpNkeWv+/fL3P+oaZ+gaD3bP4GwAo+byI=; b=qyUb6SymrB8yfv+S1N+AyuPnb
	vZpIQdAdOG7RmI+12ILBEGMlwzrUrSWABAGiGFx5Q97Oyq7unvejPO4Z4uknWJxz2S4rfrsMa5P37
	wN3w7tI7qrLRtXe3b4wndX39avLaL3gZpIcUCltmWBYSvoAe2LHnLaUxF4ob8R4Gx4HklbtHU0Ryz
	3klEbQ1SoIuQuZxdcxUeUqHYuWXQbnsuzPimc4jtiS0PY93dSFJFpZ3csA0LcFFdGXDW2k53Nm3fp
	F6QVyGmFjSGRNUr+YM2Bod/hIHBxn8vySaqOuBkL1BXtu1Del+m050k9epn8iGNyVvykS20xPPKef
	g1cclGKOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7iS0-0002Yr-0k; Thu, 04 Feb 2021 17:29:52 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7iRy-0002Xx-06; Thu, 04 Feb 2021 17:29:51 +0000
Received: by mail-ot1-f50.google.com with SMTP id o12so4132254ote.12;
 Thu, 04 Feb 2021 09:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VABDqQO4SCCxw9n6VdMjP3tpI9MOBd0XV0ilXTl4TqU=;
 b=k0b0baxhDAzFVSZ4oecHAJKCFUuzrQmwNLZuzk1JmU2tJlaIRTyUKa/lsmEtFE/Ia4
 WnEumWE4veWiqRAdyxjRHRXgHg9zX0Cp79pVc0iBm5ZURGJAEYHucOFKsQoRNkW79pFK
 zlfXE3hLOfciGAGlGDEq+l8XGf//eLWL/PgbI+5cCFIL2EZshODO6CGJMRQ+mHnXoA5y
 ooGCVXU00jEtpd0s5+hetHIadB/xi6HTpR92YkFQqLLRvc8kUV9j8O7/SllPksrOwS+3
 oiDIXpDrpARddLLhpbsEhdcH5s7Na32pjEh9fjcS3ZTY0EI6EaPgm2Qr1GxHJLq0R8CN
 sbJg==
X-Gm-Message-State: AOAM531/yiuyC1Rw0bl7NsIjSc4y8Ei7qsF9xvZnb35r3+owL3tG1szg
 K3RIzxVaotRHJKP1PT7cSg==
X-Google-Smtp-Source: ABdhPJyRucRa6WFuTvsk3abTvCXMHWztBy5ONKR24Bi/EstX7fiI57+Du8n2gQUyyz1NuIk23MVq1Q==
X-Received: by 2002:a9d:1c9a:: with SMTP id l26mr331207ota.316.1612459788720; 
 Thu, 04 Feb 2021 09:29:48 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z10sm1238418otk.8.2021.02.04.09.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 09:29:47 -0800 (PST)
Received: (nullmailer pid 682797 invoked by uid 1000);
 Thu, 04 Feb 2021 17:29:45 -0000
Date: Thu, 4 Feb 2021 11:29:45 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 01/13] doc: bindings: pci: designware-pcie.txt: convert
 it to yaml
Message-ID: <20210204172945.GA662023@robh.at.kernel.org>
References: <cover.1612271903.git.mchehab+huawei@kernel.org>
 <706e684f571e142362d7be74eb1dcee2c8558052.1612271903.git.mchehab+huawei@kernel.org>
 <1612287895.001149.3887347.nullmailer@robh.at.kernel.org>
 <20210203074900.6d581153@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203074900.6d581153@coco.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_122950_121940_1ED6D6F3 
X-CRM114-Status: GOOD (  23.25  )
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
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, linux-kernel@vger.kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 07:49:00AM +0100, Mauro Carvalho Chehab wrote:
> Hi Rob,
> 
> Em Tue, 02 Feb 2021 11:44:54 -0600
> Rob Herring <robh@kernel.org> escreveu:
> 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> > 	'type' is a required property
> > 	Additional properties are not allowed ('$ref' was unexpected)
> > 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: properties:snps,enable-cdm-check: 'oneOf' conditional failed, one must be fixed:
> > 		'enum' is a required property
> > 		'const' is a required property
> > 	'/schemas/types.yaml#definitions/flag' does not match 'types.yaml#/definitions/'

You need a '/' between '#' and 'definitions'.


> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pci/snps,pcie.yaml: ignoring, error in schema: properties: snps,enable-cdm-check
> > warning: no schema found in file: ./Documentation/devicetree/bindings/pci/snps,pcie.yaml
> > 
> > See https://patchwork.ozlabs.org/patch/1434686
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> 
> I've no idea why the bot is hitting those. My tree is based on
> staging-testing[1], as I need the regulator patches merged there.
> Such tree is based on v5.11-rc5.
> 
> There, dt_binding_check doesn't get any warnings on this schema:
> 
> $ pip3 install dtschema --upgrade --user
> Requirement already up-to-date: dtschema in /home/mchehab/.local/lib/python3.9/site-packages (2020.12)

This particular check is in master, but not yet a release on pypi. I'll 
be tagging a release soon.

I've got this problem that adding new meta-schema checks like this one 
requires fixing up all the existing in tree schemas first. So I give 
some amount of time before adding them to a tagged release. However, I 
want to start testing new schemas right away. I haven't come up with a 
better solution short of importing the meta-schema into the kernel tree 
or separately versioning them.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
