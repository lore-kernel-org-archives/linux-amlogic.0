Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D17C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:13:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BDE20878
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 15:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KZTHEJFV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="FDS209oy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BDE20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BWdbaL3K86ckI8p+12y6UVZsePVvu8hLxO4bgvP6OOc=; b=KZTHEJFVrpZ27kXMhXJQuatY+
	xTleQbbkJ9JqHFhckqZTVW1D1u4UdlVrhjjXY2gSWxoNEhzldnJLmdPoQz2Z0oseamh1jVs57Hebw
	jOGVMP843gt5P5q/+flK+UFxUnDo9ePh2vkq3Ny6EZTQOuwfFuMRX1mir/rrwJCIZqMqU4+FnKvx0
	PSh9sjOARBF+6NFL2RqddBlO7c75OTGNEfyVtBr/myQGQ/IKceh24MMi2OW/t3Fz8gblr9ywNlvd3
	+yYlWnxoRBKZhjS8RCAcOB56uNM1q5QGczzHuXRbqubQlfy7glcv/s6UM0377jTINvjIMjGLHM6JO
	heGf99Mcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLpPe-0004p6-B4; Fri, 25 Sep 2020 15:13:30 +0000
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLpPY-0004nV-Az; Fri, 25 Sep 2020 15:13:26 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6e09030001>; Fri, 25 Sep 2020 08:13:07 -0700
Received: from [10.26.74.254] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 15:13:04 +0000
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200925171712.254a018d@xhacker.debian>
 <20200925172724.5bdf6aab@xhacker.debian>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <d4715e17-147f-a4fe-32c1-32fdfe8548bb@nvidia.com>
Date: Fri, 25 Sep 2020 16:13:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925172724.5bdf6aab@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601046787; bh=EBv+3J4epfd1Uw+GuLLec005qVEJj6G4T0IJRV9QFbs=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=FDS209oyLGTSt7i1V6NK2xiOWb4fEIB67U9niLqBhIfCxKGwLgwvpJgin6NRjdTNS
 l+ufEtTXI9j1coOP65bF57TK4jsQxk6doxrrHT25FL1Bgf2qeFUpYP5egByiS5KJYb
 OjL0CO18Vf7cW2d6PeclWb7k5iSPArrTx27CPGuhJzsnJgpQadfuxIMrYZd6ik01Xc
 6Irq2uGPbc32UsyDGSodTVIf2oicazmIHjwAPtWYOn7K5pjf3UwrMPdaGZzRfAm/1G
 t8rUn2p/jIY/EZ4S+rOUBWuq7bi/IT55HqOsvgTojr8V/9Gq0akrFxpRjwD013ceah
 Djhyq/XI74ZIQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_111324_561408_BB4D3242 
X-CRM114-Status: GOOD (  19.52  )
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
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>, Kukjin
 Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Yue
 Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jingoo
 Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jisheng,

On 25/09/2020 10:27, Jisheng Zhang wrote:

...

>> Could you please try below patch?
>>
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index bf25d783b5c5..7e5dc54d060e 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -197,7 +197,6 @@ static struct irq_chip dw_pci_msi_bottom_irq_chip = {
>>         .name = "DWPCI-MSI",
>>         .irq_ack = dw_pci_bottom_ack,
>>         .irq_compose_msi_msg = dw_pci_setup_msi_msg,
>> -       .irq_set_affinity = dw_pci_msi_set_affinity,
>>         .irq_mask = dw_pci_bottom_mask,
>>         .irq_unmask = dw_pci_bottom_unmask,
>>  };
> 
> A complete patch w/o compiler warning:
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index bf25d783b5c5..18f719cfed0b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -137,12 +137,6 @@ static void dw_pci_setup_msi_msg(struct irq_data *d, struct msi_msg *msg)
>  		(int)d->hwirq, msg->address_hi, msg->address_lo);
>  }
>  
> -static int dw_pci_msi_set_affinity(struct irq_data *d,
> -				   const struct cpumask *mask, bool force)
> -{
> -	return -EINVAL;
> -}
> -
>  static void dw_pci_bottom_mask(struct irq_data *d)
>  {
>  	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
> @@ -197,7 +191,6 @@ static struct irq_chip dw_pci_msi_bottom_irq_chip = {
>  	.name = "DWPCI-MSI",
>  	.irq_ack = dw_pci_bottom_ack,
>  	.irq_compose_msi_msg = dw_pci_setup_msi_msg,
> -	.irq_set_affinity = dw_pci_msi_set_affinity,
>  	.irq_mask = dw_pci_bottom_mask,
>  	.irq_unmask = dw_pci_bottom_unmask,
>  };
> 


Thanks I was not expecting this to work because ...

 int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask,
                         bool force)
 {
         struct irq_desc *desc = irq_data_to_desc(data);
         struct irq_chip *chip = irq_data_get_irq_chip(data);
         int ret;
 
         if (!chip || !chip->irq_set_affinity)
                 return -EINVAL;

However, with your patch Tegra crashes on boot ...

[   11.613853] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   11.622500] Mem abort info:
[   11.622515]   ESR = 0x86000004
[   11.622524]   EC = 0x21: IABT (current EL), IL = 32 bits
[   11.622540]   SET = 0, FnV = 0
[   11.636544]   EA = 0, S1PTW = 0
[   11.636554] user pgtable: 4k pages, 48-bit VAs, pgdp=000000046a28e000
[   11.636559] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   11.652652] Internal error: Oops: 86000004 [#1] PREEMPT SMP
[   11.652658] Modules linked in: pwm_tegra phy_tegra194_p2u crct10dif_ce lm90 pwm_fan tegra_bpmp_thermal pcie_tegra194 ip_tables x_tables ipv6
[   11.670525] CPU: 3 PID: 138 Comm: kworker/3:3 Not tainted 5.9.0-rc4-dirty #12
[   11.670534] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
[   11.683967] Workqueue: events deferred_probe_work_func
[   11.683974] pstate: 60c00089 (nZCv daIf +PAN +UAO BTYPE=--)
[   11.683985] pc : 0x0
[   11.696669] lr : msi_domain_set_affinity+0x44/0xc0
[   11.696672] sp : ffff800012bcb390
[   11.696680] x29: ffff800012bcb390 x28: ffff0003e3033c20 
[   11.709891] x27: ffff0003e76cfe58 x26: 0000000000000000 
[   11.709900] x25: ffff800011d7e850 x24: ffff800011d7e878 
[   11.709908] x23: 0000000000000000 x22: ffff0003e76cfe00 
[   11.709914] x21: ffff0003e76cfe58 x20: ffff0003e76cfe58 
[   11.709921] x19: ffff800011b19000 x18: ffffffffffffffff 
[   11.709927] x17: 0000000000000000 x16: 0000000000000000 
[   11.741262] x15: ffff800011b19948 x14: 0000000000000040 
[   11.741267] x13: 0000000000000228 x12: 0000000000000030 
[   11.741272] x11: 0101010101010101 x10: 0000000000000040 
[   11.741277] x9 : 0000000000000000 x8 : 0000000000000004 
[   11.741281] x7 : ffffffffffffffff x6 : 00000000000000ff 
[   11.767374] x5 : 0000000000000000 x4 : 0000000000000000 
[   11.767379] x3 : 0000000000000000 x2 : 0000000000000000 
[   11.767384] x1 : ffff800011d7e898 x0 : ffff0003e262bf00 
[   11.767406] Call trace:
[   11.767410]  0x0
[   11.767424]  irq_do_set_affinity+0x4c/0x178
[   11.791400]  irq_setup_affinity+0x124/0x1b0
[   11.791423]  irq_startup+0x6c/0x118
[   11.791434]  __setup_irq+0x810/0x8a0
[   11.802510]  request_threaded_irq+0xdc/0x188
[   11.802517]  pcie_pme_probe+0x98/0x110
[   11.802536]  pcie_port_probe_service+0x34/0x60
[   11.814799]  really_probe+0x110/0x400
[   11.814809]  driver_probe_device+0x54/0xb8
[   11.822438]  __device_attach_driver+0x90/0xc0
[   11.822463]  bus_for_each_drv+0x70/0xc8
[   11.822471]  __device_attach+0xec/0x150
[   11.834307]  device_initial_probe+0x10/0x18
[   11.834311]  bus_probe_device+0x94/0xa0
[   11.834315]  device_add+0x464/0x730
[   11.834338]  device_register+0x1c/0x28
[   11.834349]  pcie_port_device_register+0x2d0/0x3e8
[   11.854056]  pcie_portdrv_probe+0x34/0xd8
[   11.854063]  local_pci_probe+0x3c/0xa0
[   11.854088]  pci_device_probe+0x128/0x1c8
[   11.854103]  really_probe+0x110/0x400
[   11.869283]  driver_probe_device+0x54/0xb8
[   11.869311]  __device_attach_driver+0x90/0xc0
[   11.877638]  bus_for_each_drv+0x70/0xc8
[   11.877645]  __device_attach+0xec/0x150
[   11.877669]  device_attach+0x10/0x18
[   11.877680]  pci_bus_add_device+0x4c/0xb0
[   11.892642]  pci_bus_add_devices+0x44/0x90
[   11.892646]  dw_pcie_host_init+0x370/0x4f8
[   11.892653]  tegra_pcie_dw_probe+0x5e8/0xb50 [pcie_tegra194]
[   11.892661]  platform_drv_probe+0x50/0xa8
[   11.910179]  really_probe+0x110/0x400
[   11.910183]  driver_probe_device+0x54/0xb8
[   11.910186]  __device_attach_driver+0x90/0xc0
[   11.910213]  bus_for_each_drv+0x70/0xc8
[   11.910240]  __device_attach+0xec/0x150
[   11.929689]  device_initial_probe+0x10/0x18
[   11.929694]  bus_probe_device+0x94/0xa0
[   11.929719]  deferred_probe_work_func+0x6c/0xa0
[   11.929730]  process_one_work+0x1cc/0x360
[   11.946008]  worker_thread+0x48/0x450
[   11.949602]  kthread+0x120/0x150
[   11.952803]  ret_from_fork+0x10/0x1c
[   11.956332] Code: bad PC value
[   11.959360] ---[ end trace 03c30e252fe4e40b ]---

To be honest, I am not sure I completely understand why it crashes here.

Cheers
Jon

-- 
nvpublic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
