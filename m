Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4AB2C25B78
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 May 2024 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhPZVEjpV33a5GFnGS915+SbazjVomWm3zXEdso8JF8=; b=GZD6dpuDyd58kw
	sdbrRaLw3khEyO2Dxqi8GC0pSbj/rP/HvBTOsAaXfxQaQi3wAdbuGw4L9v8PmnsjvwBxr71/bH1oW
	g8YZZUDsWG9UKEa6pJAE+SkXr1RJwIAA096k97Qhirge5kjTB2kVOcvlqwwKmVApWe/kUER///eq8
	rOl0wzx8YE9zChl7OKaTriiS5EW+nuOUAiK+RAjtXX0mlR0EWRgmLwlEpSYBt+pn/vAryA0mMnM3A
	ZlM8v1G4Z8NA/KcPSjuqV1Z5vo736zWbuU7WN/gxxhR+IV3iocLNzke/1hzZLXt5e21TmYL7f7BlW
	tQEkVLreepgE+fa856RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7veZ-00000007dLD-0XOO;
	Fri, 17 May 2024 11:21:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7veV-00000007dJF-2imP;
	Fri, 17 May 2024 11:21:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44HBKg9V111437;
	Fri, 17 May 2024 06:20:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715944842;
	bh=M9gLMIAiDHAcckpBA6eubUaCYcUpTziwh4/Q77XTl20=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=pnKxv3wREjHrW3r0IDs9vWgsr1lVRgaHQZuEryX4lHHhpM8MLY7TQnUzYwVTT3nMY
	 o/xww5ONhLtQyUiudXBPeHrqexHCBRCyEdxllCMkL1NTvEboN89YNDoHVKEsM9qQVr
	 qiIJByQY2KYw1OLVKCf32o+PG6Jx6wS+qmbDIIRU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44HBKgTI067066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 May 2024 06:20:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 May 2024 06:20:42 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 May 2024 06:20:42 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44HBKfhh080832;
	Fri, 17 May 2024 06:20:41 -0500
Date: Fri, 17 May 2024 16:50:40 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Onkarnarth <onkarnath.1@samsung.com>
CC: <bhelgaas@google.com>, <vigneshr@ti.com>, <s-vadapalli@ti.com>,
        <lpieralisi@kernel.org>, <kw@linux.com>, <robh@kernel.org>,
        <yue.wang@Amlogic.com>, <neil.armstrong@linaro.org>,
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
Subject: Re: [PATCH 1/1] PCI : Refactoring error log prints for better
 readability
Message-ID: <4ec3b167-9324-41d3-a086-74ca001b9042@ti.com>
References: <CGME20240517105941epcas5p3e8dbb97f19c9553bf9942ad146124806@epcas5p3.samsung.com>
 <20240517105923.2406246-1-onkarnath.1@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517105923.2406246-1-onkarnath.1@samsung.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_042131_819997_F952580A 
X-CRM114-Status: GOOD (  20.67  )
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

On Fri, May 17, 2024 at 04:29:23PM +0530, Onkarnarth wrote:
> From: Onkarnath <onkarnath.1@samsung.com>

I think that the $subject should be similar to:
https://patchwork.kernel.org/comment/25712288/
rather than the generic "refactoring error log".

> 
> As %pe is already introduced, it's better to use it in place of (%ld) or (%d) for
> printing error in logs. It will enhance readability of logs.
> 
> Error print style is more consistent now.
> 
> Co-developed-by: Maninder Singh <maninder1.s@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> ---
> Suggested by Bjorn Helgaas in below discussion
> https://patchwork.kernel.org/comment/25712288/

Since you have indicated that Bjorn has suggested it, shouldn't there
also be a "Suggested-by tag" in the commit message?

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
> diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
> index 826b5016a101..dbc16cf5a246 100644
> --- a/drivers/pci/bus.c
> +++ b/drivers/pci/bus.c
> @@ -351,7 +351,7 @@ void pci_bus_add_device(struct pci_dev *dev)
>  	dev->match_driver = !dn || of_device_is_available(dn);
>  	retval = device_attach(&dev->dev);
>  	if (retval < 0 && retval != -EPROBE_DEFER)
> -		pci_warn(dev, "device attach failed (%d)\n", retval);
> +		pci_warn(dev, "device attach failed: %pe\n", ERR_PTR(retval));

Is there a reason behind dropping the parantheses?

>  
>  	pci_dev_assign_added(dev, true);
>  }
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d2d17d37d3e0..79b6cc7f0287 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -801,7 +801,7 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  	reset = devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
>  	if (IS_ERR(reset)) {
>  		ret = PTR_ERR(reset);
> -		dev_err(&pdev->dev, "gpio request failed, ret %d\n", ret);
> +		dev_err(&pdev->dev, "gpio request failed: %pe\n", ERR_PTR(ret));

Similar question as above regarding converting "failed, ret" to
"failed:". Is this a new convention that is expected to be followed,
where all errors are supposed to have "failed: %pe", rather than custom
statements? Please let me know if this has already been discussed
elsewhere.

[...]

Regards,
Siddharth.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
