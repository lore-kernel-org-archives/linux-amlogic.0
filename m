Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CF3C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 13:23:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7894821531
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 13:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YcssJfw2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="PEUGx/Ot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7894821531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VkiHvhK4fhDOelNa5Hf8ixOT9VojeAldFOOvYfV3154=; b=YcssJfw2gfgE/680F+nQf26Ap
	hQ5lqs2KYGVhR3j5GdhEXFxp3ADzznETW/33dOCuyJLL5KHbqGSAZ/Fu7c6DrH9CY6YXRNz9AjWbt
	QdVt+9hELsOA2ly7Sk5g9A9TFkTecNbKtvnNxP5Y9/iHMDKDVGmWFYIYfv+0FfnrwCq+B8tXF/Fk+
	jUaWnrFHvaqR1ptgIJCkUcChnBPbVVZHzLUt4grxfPdSlcx757j5DVqiuCMivbWFl5Tvzm4dayTAo
	gku9pNsCSLLHILLl3vBcI9+DtZB0fUM03ktN1+mERf2FEWQkLg8iwUS4XnDfD1DkwfBzkCdpKUt4m
	HIrGswGfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFbK-0007qx-QG; Tue, 29 Sep 2020 13:23:26 +0000
Received: from hqnvemgate26.nvidia.com ([216.228.121.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFbF-0007pG-E3; Tue, 29 Sep 2020 13:23:23 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7335390005>; Tue, 29 Sep 2020 06:23:05 -0700
Received: from [10.26.75.44] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 29 Sep
 2020 13:22:59 +0000
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200929184851.22682ff1@xhacker.debian>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
Date: Tue, 29 Sep 2020 14:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929184851.22682ff1@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601385785; bh=O1AmZKE8e7EeFMJXiJzyuvgvP7i5Nhyk8/759La3vkU=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=PEUGx/Oto2o82hJdlAk6/ts4WMeu88gqStSAIbht98Z/IG5S7VWh+vP98HENpPGWz
 dvi4P4CwF9nHeRHsl9AzVkrvmXIBrwVTKKBrg57TUdTtX6rbg2iu/yl/npKamfzDfN
 bde3+rbXPUm4osMwTFyxLBEvxx/+GgYRccoic8JmGxsvmJpOdJQ499JIrzTlkZbfGy
 uatLuKB6XhZi8NLNwtLMbP08tRGBLxw/s1yS6UBfhIRviBPwMOohoewPUOkIiYkNbc
 kQHmRyOIchEWyKHIRxQV7sPqqZB+NDjrJDEXtUGp+aaP6iFoCKud6BERbUL3KiIhZi
 LjHupkiehvUcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_092321_596130_B3C2EE0A 
X-CRM114-Status: GOOD (  18.66  )
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
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Vidya Sagar <vidyas@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kevin
 Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jisheng,

On 29/09/2020 11:48, Jisheng Zhang wrote:
> Hi Jon,
> 
> On Fri, 25 Sep 2020 09:53:45 +0100 Jon Hunter wrote:
> 
>>
>> On 24/09/2020 12:05, Jisheng Zhang wrote:
>>> Improve the msi code:
>>> 1. Add proper error handling.
>>> 2. Move dw_pcie_msi_init() from each users to designware host to solve
>>> msi page leakage in resume path.  
>>
>> Apologies if this is slightly off topic, but I have been meaning to ask
>> about MSIs and PCI. On Tegra194 which uses the DWC PCI driver, whenever we
>> hotplug CPUs we see the following warnings ...
>>
>>  [      79.068351] WARNING KERN IRQ70: set affinity failed(-22).
>>  [      79.068362] WARNING KERN IRQ71: set affinity failed(-22).
>>
> 
> I tried to reproduce this issue on Synaptics SoC, but can't reproduce it.
> Per my understanding of the code in kernel/irq/cpuhotplug.c, this warning
> happened when we migrate irqs away from the offline cpu, this implicitly
> implies that before this point the irq has bind to the offline cpu, but how
> could this happen given current dw_pci_msi_set_affinity() implementation
> always return -EINVAL

By default the smp_affinity should be set so that all CPUs can be
interrupted ...

$ cat /proc/irq/70/smp_affinity
0xff

In my case there are 8 CPUs and so 0xff implies that the interrupt can
be triggered on any of the 8 CPUs.

Do you see the set_affinity callback being called for the DWC irqchip in
migrate_one_irq()?

Cheers
Jon

-- 
nvpublic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
