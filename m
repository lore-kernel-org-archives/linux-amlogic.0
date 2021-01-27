Return-Path: <SRS0=O9cP=G6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A00C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 07:49:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F482074B
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jan 2021 07:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F482074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5YQVw8Ajk/nz/NdVOLnsXZMIbYM1T91+c42migxcUZ4=; b=oYUbZoEw4iuI/nPjvLYDAr+Yd
	2gDlNXUYvSonHYY3vqtvLxjJ2D9g1qLjG5qSPAaCEyoF5PI95nm4HGDc5qURlYVnHhH/aju+Rm4qx
	5XblhFKyE3c8GenSPF96qxHSZxKRxxi/uprFjfVsnP0Z6E+ga1bDDMkcLwm8g40uW97KwU0ATvSMb
	oIXSf1eJuQsHSwGJrVnqGUQQJJ75E9mp1icHvFEb5/bNtHMtqUFw1GgUoYukrO4VJDRIzp5SeLS8R
	i1OMOYg5+bt/wLDz5KNhiV8GbmiIkKNzzqIFHiXv5rxVPcwGnR0bDplbCEI0pP6haELmZFtaZphMU
	0EVHJeuJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4fZP-0000R8-Q1; Wed, 27 Jan 2021 07:48:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4fZN-0000QM-6A; Wed, 27 Jan 2021 07:48:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF76B2074A;
 Wed, 27 Jan 2021 07:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611733728;
 bh=Nro3vfQTCFtmv98iajZ/Tld6vSBtHkyWqkV/zj14XFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SHMBfSfTtkKbBZei+R26dC4Lsa2N+suQiJ9H3LZMp1MaKa5JjGt+4QjAdFsyIyLUT
 tQmzXXgXxEdLQ2XzmFzAyIzEDH80xOrFrwsQDYWFBcKKnne9TgiIilSEhMFajPzLcb
 WKlppAIzlGh3Fdk7NfvaI8omlrDmEFva/CSsY1cFN2joSSKZRYRcFT7U90A+CfEknv
 NgBhXEjQyytURjwbuv1CbEWSI5z02gPfxp9eYDmJnFUBTAyEZEGvdNF+R6c9qOt6Gv
 k1vZRXX2j4SYiZQErTdX1uQdkl0rrqMB5kZzlCHOYRGKTz5ie1ZeE0UWWrrB+E8xPk
 07s+G/JFyQ1kw==
Date: Wed, 27 Jan 2021 08:48:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH RFC 1/2] dt: pci: designware-pcie.txt: convert it to yaml
Message-ID: <20210127084837.39d68850@coco.lan>
In-Reply-To: <b6ab7110-fc87-85d7-d591-dffad32985ec@samsung.com>
References: <cover.1611645945.git.mchehab+huawei@kernel.org>
 <CGME20210126074127eucas1p1dd8f2d1704d708d64458922566b934f1@eucas1p1.samsung.com>
 <55f479324098b66d7dba89c8f9c3e455731df4f7.1611645945.git.mchehab+huawei@kernel.org>
 <b6ab7110-fc87-85d7-d591-dffad32985ec@samsung.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_024853_368496_4D1B7FD0 
X-CRM114-Status: GOOD (  12.92  )
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
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
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

Hi Marek,

Em Tue, 26 Jan 2021 11:13:20 +0100
Marek Szyprowski <m.szyprowski@samsung.com> escreveu:

> Hi Mauro,
> 
> On 26.01.2021 08:35, Mauro Carvalho Chehab wrote:
> > Convert the file into a JSON description at the yaml format.
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >   .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
> >   .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
> >   .../bindings/pci/designware,pcie.yaml         | 194 ++++++++++++++++++
> >   .../bindings/pci/designware-pcie.txt          |  77 -------
> >   .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
> >   .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
> >   .../bindings/pci/hisilicon-pcie.txt           |   2 +-
> >   .../devicetree/bindings/pci/kirin-pcie.txt    |   2 +-
> >   .../bindings/pci/layerscape-pci.txt           |   2 +-
> >   .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
> >   .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
> >   .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
> >   .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
> >   .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
> >   .../bindings/pci/samsung,exynos5440-pcie.txt  |   4 +-  

> You must have used an old tree for preparing this patchset. The above 
> file is gone in v5.11-rc1 and there is 
> Documentation/devicetree/bindings/pci/samsung,exynos-pcie.yaml instead.

Yeah, this series was generated against v5.10, as part of my efforts
to have Hikey 970 properly supported upstream:

	https://github.com/mchehab/linux/commits/devel/hikey970

For the next version, I'll rebase on the top of linux-next. 

Thanks,
Mauro

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
