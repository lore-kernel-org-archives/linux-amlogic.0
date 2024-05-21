Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8714DC25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Swd3PdCV3Mfjt4+ME21HYIfox5YgXojenTwRwhkmSfU=; b=fe2IBiQX1iI9/r
	IAUK0HmnhW2id5oeXF/XUszvRsuwZWktGmIsoISYnFL9x/0f0+NH+6PiahUpwMtf2cOGGDi7IirPp
	gQcNpxAiEAMi1hpYxGt661GI9lfUzNTCkHQtvXWJhQq4s1qL7TavcMnQmb7UJc9KhVrEbw2zWuK0P
	vVqNZqCABluKCm6BIfCCCBIULRoBG+D8Qpx4TyUXcIg30CihvnHBCCxsyqL1pobpqo8TjhL+hZs5b
	EqXIxJt3+eNQgBfSbW+Yhsg/2lxfdYe1U/s/fQEfbONhnQocjdHozldgQ13cIOwVWsIG2vgHwL1yK
	mCA9HZF955COgborDalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JDs-0000000GUy6-48oJ;
	Tue, 21 May 2024 06:43:44 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JDp-0000000GUxL-0761;
	Tue, 21 May 2024 06:43:43 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44L6gmm0011241;
	Tue, 21 May 2024 01:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716273768;
	bh=+ZfOONRU6juW9FS/6TxFdABLBWxqz7rqnKx7hWQStMk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=NAJbt7a5DoTR+zca5xHgtqfKuYpVEVUoncFcDAa9rnhd0cNDBfAjwlhHiy9tha2Vb
	 g+Gb2EgkITFo0mgOhhaULzAGqx7RAEEAtxvOqpq8731MIkkNr26sB2h4ivC48fprL6
	 wDMkTrcTcJlygDX4vsPSR2HaVHGcYvfXEn8aKLKI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44L6gmJG015907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 May 2024 01:42:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 May 2024 01:42:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 May 2024 01:42:48 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44L6gldU029813;
	Tue, 21 May 2024 01:42:48 -0500
Date: Tue, 21 May 2024 12:12:46 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Onkarnarth <onkarnath.1@samsung.com>
CC: <bhelgaas@google.com>, <helgaas@kernel.org>, <vigneshr@ti.com>,
        <s-vadapalli@ti.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
        <robh@kernel.org>, <yue.wang@Amlogic.com>, <neil.armstrong@linaro.org>,
        <khilman@baylibre.com>, <jbrunet@baylibre.com>,
        <martin.blumenstingl@googlemail.com>, <thomas.petazzoni@bootlin.com>,
        <shawn.guo@linaro.org>, <lchuanhua@maxlinear.com>,
        <srikanth.thokala@intel.com>, <songxiaowei@hisilicon.com>,
        <wangbinghui@hisilicon.com>, <manivannan.sadhasivam@linaro.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <hayashi.kunihiko@socionext.com>, <mhiramat@kernel.org>,
        <pali@kernel.org>, <toan@os.amperecomputing.com>,
        <daire.mcnamara@microchip.com>, <conor.dooley@microchip.com>,
        <marek.vasut+renesas@gmail.com>, <shawn.lin@rock-chips.com>,
        <heiko@sntech.de>, <nirmal.patel@linux.intel.com>,
        <jonathan.derrick@linux.dev>, <kishon@kernel.org>, <jdmason@kudzu.us>,
        <dave.jiang@intel.com>, <rafael@kernel.org>, <lenb@kernel.org>,
        <mahesh@linux.ibm.com>, <oohall@gmail.com>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <r.thapliyal@samsung.com>,
        Maninder Singh <maninder1.s@samsung.com>
Subject: Re: [PATCH v2 1/1] PCI : Refactoring error log prints for better
 readability
Message-ID: <2227b0ed-a57f-4bca-8f3e-721bc2e2055a@ti.com>
References: <CGME20240521061553epcas5p1c7db70b37a70f599face675bc4dedda9@epcas5p1.samsung.com>
 <20240521061528.3559751-1-onkarnath.1@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240521061528.3559751-1-onkarnath.1@samsung.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_234341_240005_38E74FD7 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, May 21, 2024 at 11:45:28AM +0530, Onkarnarth wrote:
> From: Onkarnath <onkarnath.1@samsung.com>

nitpick: In $subject:
s/Refactoring/Refactor
to follow the convention of using imperative mood.

> 
> As %pe is already introduced, it's better to use it in place of (%ld) or
> (%d) for printing error in logs. It will enhance readability of logs.
> 
> Error print style is more consistent now.
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Co-developed-by: Maninder Singh <maninder1.s@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>

Thank you for the patch. LGTM.

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

> ---
> Suggested by Bjorn Helgaas in below discussion
> https://patchwork.kernel.org/comment/25712288/
> 
> v1 -> v2: Added suggested by tag
> 
>  drivers/pci/bus.c                             |   2 +-
>  drivers/pci/controller/dwc/pci-dra7xx.c       |   2 +-
>  drivers/pci/controller/dwc/pci-meson.c        |  16 +--
>  drivers/pci/controller/dwc/pcie-armada8k.c    |   4 +-
>  drivers/pci/controller/dwc/pcie-histb.c       |   6 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  10 +-
>  drivers/pci/controller/dwc/pcie-keembay.c     |   2 +-
>  drivers/pci/controller/dwc/pcie-kirin.c       |   6 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  18 +--
>  drivers/pci/controller/dwc/pcie-qcom.c        |  18 +--
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 132 +++++++++---------
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c |   2 +-
>  drivers/pci/controller/pci-aardvark.c         |   6 +-
>  drivers/pci/controller/pci-ftpci100.c         |   2 +-
>  drivers/pci/controller/pci-tegra.c            |  86 ++++++------
>  drivers/pci/controller/pci-xgene.c            |   4 +-
>  drivers/pci/controller/pcie-microchip-host.c  |   2 +-
>  drivers/pci/controller/pcie-rcar-host.c       |  14 +-
>  drivers/pci/controller/pcie-rockchip.c        |  34 ++---
>  drivers/pci/controller/vmd.c                  |   2 +-
>  drivers/pci/doe.c                             |   4 +-
>  drivers/pci/endpoint/functions/pci-epf-mhi.c  |   8 +-
>  drivers/pci/endpoint/functions/pci-epf-ntb.c  |   2 +-
>  drivers/pci/endpoint/functions/pci-epf-test.c |   4 +-
>  drivers/pci/endpoint/functions/pci-epf-vntb.c |   2 +-
>  drivers/pci/endpoint/pci-ep-cfs.c             |  12 +-
>  drivers/pci/endpoint/pci-epf-core.c           |  16 +--
>  drivers/pci/hotplug/acpiphp_core.c            |   2 +-
>  drivers/pci/hotplug/pciehp_core.c             |   8 +-
>  drivers/pci/hotplug/shpchp_core.c             |   4 +-
>  drivers/pci/of.c                              |   6 +-
>  drivers/pci/pci-driver.c                      |   4 +-
>  drivers/pci/pcie/dpc.c                        |   4 +-
>  drivers/pci/quirks.c                          |   2 +-
>  drivers/pci/setup-bus.c                       |   2 +-
>  drivers/pci/slot.c                            |   4 +-
>  drivers/pci/vgaarb.c                          |   2 +-
>  37 files changed, 227 insertions(+), 227 deletions(-)
> 

[...]

Regards,
Siddharth.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
