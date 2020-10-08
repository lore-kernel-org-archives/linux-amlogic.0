Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A98CBC433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 05:33:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046712173E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 05:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9RJCtPD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="gGiVTnDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046712173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RUlmsGiMaU4nONe4+ao5eU2s5pbKwPA0ULerSLTivdw=; b=v9RJCtPDBJx5hbUZi8SzUJZna
	3ETNSBZKC6R30LzeUQUXqSMzq7zcjSwJrNfUo7fLvMP/4pIauIP2/pEG/0NvVhkElJmdB/ktouXhP
	uMFT/fUi5YFHDOpRrNkX2ZwGMdPuNnjlQKiYhSpz5pCFei1n4URpy3brNBR/XARzfNkuTrO50JuZJ
	1EGwM2dx5tHU0Aygo3Ub6o8LLWQRg/F0Vk+nw7k8f+RlTdPOmQABXQG6mnk2S4daEVNbKnL79SyZ7
	NdlynKLpc8SLtFiwyZrTZF4O/9nnbinYcUhneLSm6/P3ogDyMge+l54zurD3o8szg3IN1CY5PM9oN
	BFgAlSnQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQOYZ-0000Xs-L7; Thu, 08 Oct 2020 05:33:35 +0000
Received: from hqnvemgate25.nvidia.com ([216.228.121.64])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQOYU-0000X7-Qu; Thu, 08 Oct 2020 05:33:32 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7ea4670000>; Wed, 07 Oct 2020 22:32:23 -0700
Received: from [10.25.74.27] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 05:32:58 +0000
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <b977d9b4-cc98-e817-0d51-8f2c6ba1445d@nvidia.com>
 <20201006143647.3f989340@xhacker.debian>
From: Vidya Sagar <vidyas@nvidia.com>
Message-ID: <435c8cf8-8f4a-c491-4aca-3ec5b7abe49a@nvidia.com>
Date: Thu, 8 Oct 2020 11:02:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20201006143647.3f989340@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602135143; bh=J4CEG7z41t4fftMpaxkaa5Era9zth5z8jjZg7k+ZCts=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=gGiVTnDKnvH3IW3q8erfoIHhPlDmnbH2thdoY4rptWoPCwmwQxfo0RIcd6vK7za+a
 qgXLjiuv+uk3BJx5tDpmSQbDqUWKoQT3pRifw4gmZgEkA3RCj+BkqAEyGD6U4bOMRW
 7YyxCLCtjO6qbXeESHYlP9z93kG3O82AA69UQ3ntIr7k056NtyNn++sDetOOUG9on9
 TLtrQofmOFFUqspaxJYSK34woIeLsROw+yztJ5/3W8Z0lg/zdHFQ7f3LuLDNI6K7bW
 8eHbfb3P1ff5T55KfN3H8s00wH7Fd2T5ZOlcWCQii/0bU80nfxDTNlQkTNzGgPp5vF
 Rmin14uLeUy0A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_013330_976510_A20C2100 
X-CRM114-Status: GOOD (  22.79  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-arm-kernel@axis.com" <linux-arm-kernel@axis.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kevin
 Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@Amlogic.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 10/6/2020 12:06 PM, Jisheng Zhang wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 6 Oct 2020 11:56:34 +0530 Vidya Sagar wrote:
> 
>>
>>
>> Hi,
> 
> Hi,
> 
>> I would like to verify this series along with the other series "PCI:
>> dwc: fix two MSI issues" on Tegra194. I tried to apply these series on
>> both linux-next and Lorenzo's pci/dwc branches but there seem to be non
>> trivial conflicts. Could you please tell me which branch I can use and
>> apply these series cleanly?
> 
> This is a fix, so I thought the series would be picked up in v5.9, so the
> series is patched against v5.9-rcN
> 
> could you please try v5 https://lkml.org/lkml/2020/9/29/2511 on v5.9-rc7?
I tried this series on top of v5.9-rc7 and it worked as expected on 
Tegra194 platform. Also, I couldn't cleanly apply the other series 'PCI: 
dwc: fix two MSI issues' on top. Could you please rebase them?

Thanks,
Vidya Sagar
> 
> 
> Thanks
> 
>> FWIW, I acknowledge that the existing code does leak MSI target page
>> every time system goes through suspend-resume sequence on Tegra194.
>>
>> Thanks,
>> Vidya Sagar
>>
>> On 9/24/2020 4:35 PM, Jisheng Zhang wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> Improve the msi code:
>>> 1. Add proper error handling.
>>> 2. Move dw_pcie_msi_init() from each users to designware host to solve
>>> msi page leakage in resume path.
>>>
>>> Since v1:
>>>     - add proper error handling patches.
>>>     - solve the msi page leakage by moving dw_pcie_msi_init() from each
>>>       users to designware host
>>>
>>>
>>> Jisheng Zhang (5):
>>>     PCI: dwc: Call dma_unmap_page() before freeing the msi page
>>>     PCI: dwc: Check alloc_page() return value
>>>     PCI: dwc: Rename dw_pcie_free_msi to dw_pcie_msi_deinit
>>>     PCI: dwc: Skip PCIE_MSI_INTR0* programming if MSI is disabled
>>>     PCI: dwc: Move dw_pcie_msi_init() from each users to designware host
>>>
>>>    drivers/pci/controller/dwc/pci-dra7xx.c       |  1 +
>>>    drivers/pci/controller/dwc/pci-exynos.c       |  2 -
>>>    drivers/pci/controller/dwc/pci-imx6.c         |  3 --
>>>    drivers/pci/controller/dwc/pci-meson.c        |  8 ----
>>>    drivers/pci/controller/dwc/pcie-artpec6.c     | 10 -----
>>>    .../pci/controller/dwc/pcie-designware-host.c | 43 +++++++++++++------
>>>    .../pci/controller/dwc/pcie-designware-plat.c |  3 --
>>>    drivers/pci/controller/dwc/pcie-designware.h  |  9 +++-
>>>    drivers/pci/controller/dwc/pcie-histb.c       |  3 --
>>>    drivers/pci/controller/dwc/pcie-kirin.c       |  3 --
>>>    drivers/pci/controller/dwc/pcie-qcom.c        |  3 --
>>>    drivers/pci/controller/dwc/pcie-spear13xx.c   |  1 -
>>>    drivers/pci/controller/dwc/pcie-tegra194.c    |  2 -
>>>    drivers/pci/controller/dwc/pcie-uniphier.c    |  9 +---
>>>    14 files changed, 38 insertions(+), 62 deletions(-)
>>>
>>> --
>>> 2.28.0
>>>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
