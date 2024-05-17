Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3473BC04FFE
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2024 10:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHHWJzEPy7Vg8bb8XL+OrtQO8ciaFEsZRqm+XhAT8z8=; b=xH8o9CQmk2J1RZ
	3MJz/tctwd4VtDokyU7v3aKs8IPhtZWejZ7V5B3tSMAmcKXkTh4+TgNEkmhT80tLGSmA+W3RPGrcQ
	mwoR21DvhyJjU2dHCYhesyQ7mE+QFbf69COJak+Wff63FZIZaiQ15QyyXs/Qvc2V71TjDZ/h+cTVc
	B+oOVH7MCK1jbhdjcJTRIvoUqqa04n5O2HYef5PmU1dFFPKoOhfcEkNjcA20gfnIkNCLFQxWiJIMO
	iwZN1WS+xRqX4M+PNtHdPieUUVxk2xsA6RbEoTrA0C9HG/nfWAukR0Pphejeeqwjwtc5HtK9/9HJL
	nCE4h+yh6C4VKyuQlSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ujZ-00000007Uo3-3we2;
	Fri, 17 May 2024 10:22:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ujX-00000007UnV-0cCl;
	Fri, 17 May 2024 10:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E36BC618B4;
	Fri, 17 May 2024 10:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B174C2BD10;
	Fri, 17 May 2024 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715941356;
	bh=Siin2KDdrw9IZXPxUcVfzq/13heNRE814alBNBZNmm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JS25gVToNhvMMNg7hxuTZL0tG/HBKNKC/y60z1180iBSmkkiAF93gz8IahYLICpPR
	 dD1+BEZrCmEKnkC5poMsAVMb7azHUcJlbh6I/eYx0PbexCe7SzuCwDZcIo8GM0NuOK
	 2zEaUbHpY/T5Xr5iUZl/JnXGgHjK9EnqS3ofKZchWLgEiup7M4RCempgYeRsm+CF9T
	 YScRQXb5iBIlzjUx+Z91JS8yRRDzn8SM2kvgnEuQKFoMun9ZO6vcKuU3CsT9csKK9C
	 TGUgJSrW+N27RSEIGXFCe6+/LNwj9cNO9fHoLPEtsBw0tPIrDu1Nu83x25aXj2QGIW
	 FkUWzfs0Qm5lg==
Date: Fri, 17 May 2024 19:22:34 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Message-ID: <20240517102234.GA333779@rocinante>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_032239_263907_D736207C 
X-CRM114-Status: UNSURE (   5.30  )
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

Hello,

> While at it, remove of_gpio.h leftover from some of the drivers.

Applied to gpio, thank you!

[01/05] PCI: dra7xx: Add missing chained IRQ header inclusion
        https://git.kernel.org/pci/pci/c/1d1efd131cc1
[02/05] PCI: aardvark: Remove unused of_gpio.h inclusion
        https://git.kernel.org/pci/pci/c/83bf80dc8e2f
[03/05] PCI: dwc: Remove unused of_gpio.h inclusion
        https://git.kernel.org/pci/pci/c/8f69a807234b
[04/05] PCI: imx6: Convert to use agnostic GPIO API
        https://git.kernel.org/pci/pci/c/7dfa559abc93
[05/05] PCI: kirin: Convert to use agnostic GPIO API
        https://git.kernel.org/pci/pci/c/7ca698ff686c

	Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
