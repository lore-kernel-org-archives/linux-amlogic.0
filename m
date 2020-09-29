Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84477C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 17:25:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FEB2075A
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 17:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l0X8e6Sw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vW3pXJX8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FEB2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4gpRZZsrq6eg888iLb34C0Bx0oHag+OnAVCbwDNDrcs=; b=l0X8e6SwENUGTrMIaNaoITG6l
	cYsmi13kB9vOHW6IqKFocxvRm0KXM1Gsbr3OItnY77DVBObiN0BqjElcdMpwdwA9QlEEGwhxdKfM5
	Dwmq2pHA2wal2+B/kS5BSN6eCMOn8QIIOSMeP32BJ5YnBGqi/Ch8Cp+6i6uZe/6VVWN1hUWqL+q4V
	8ujLKp0pRTwQsOE5ngMJAtZtofTk/jNIDXJ7+wrKTJkQWO0f6aQdy/FCeeEhoUjbkVAQ06UNq6JoG
	tqLD3VS7lVR3JUzavBvjrYRLi2YoGiP0yC25RMjDt65ZLsfnL4BMtne4gGVnrgbSxmTcX/dJPm6Zy
	jurHSeuHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJNn-0001KL-UZ; Tue, 29 Sep 2020 17:25:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJNl-0001JZ-37; Tue, 29 Sep 2020 17:25:42 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 003972075A;
 Tue, 29 Sep 2020 17:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601400340;
 bh=Xv0rt8BvK5NQflV4HM9+bGl203Y0k3NIGUz7VcStvqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vW3pXJX83SknNw5HoHFJQaYImR0HN6DhmSa2zEwx5veHCgjUlwS3WW2rRAeg408gA
 H1Lqkq/nBOwGW3k+W/Jj3WHvm6EHshDZ2YUWoZtTfb4mE55OgYwVXg8gdo4huvJu+i
 McYfN0AlCJeWRJ5Ebe8RDHaYlGXXxb3l0QXk+F9c=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kNJNh-00Fu9z-Hl; Tue, 29 Sep 2020 18:25:37 +0100
MIME-Version: 1.0
Date: Tue, 29 Sep 2020 18:25:37 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
In-Reply-To: <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
References: <20200924190421.549cb8fc@xhacker.debian>
 <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
 <20200929184851.22682ff1@xhacker.debian>
 <8e06a370-a37a-5f33-b43b-2830adb31b3e@nvidia.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <d4a6eea3c5e33a3a4056885419df95a7@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jonathanh@nvidia.com, Jisheng.Zhang@synaptics.com,
 hayashi.kunihiko@socionext.com, narmstrong@baylibre.com,
 linux-pci@vger.kernel.org, wangbinghui@hisilicon.com,
 bjorn.andersson@linaro.org, yamada.masahiro@socionext.com,
 thierry.reding@gmail.com, linux-arm-kernel@axis.com, vidyas@nvidia.com,
 festevam@gmail.com, jbrunet@baylibre.com, robh@kernel.org,
 jesper.nilsson@axis.com, lorenzo.pieralisi@arm.com, khilman@baylibre.com,
 pratyush.anand@gmail.com, linux-tegra@vger.kernel.org, krzk@kernel.org,
 kishon@ti.com, kgene@kernel.org, linux-imx@nxp.com, songxiaowei@hisilicon.com,
 hongxing.zhu@nxp.com, martin.blumenstingl@googlemail.com,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, yue.wang@amlogic.com,
 linux-samsung-soc@vger.kernel.org, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com, agross@kernel.org,
 linux-kernel@vger.kernel.org, svarbanov@mm-sol.com, kernel@pengutroni
 x.de, gustavo.pimentel@synopsys.com, shawnguo@kernel.org,
 l.stach@pengutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_132541_303847_0958D40A 
X-CRM114-Status: GOOD (  21.50  )
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
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-arm-kernel@axis.com, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-29 14:22, Jon Hunter wrote:
> Hi Jisheng,
> 
> On 29/09/2020 11:48, Jisheng Zhang wrote:
>> Hi Jon,
>> 
>> On Fri, 25 Sep 2020 09:53:45 +0100 Jon Hunter wrote:
>> 
>>> 
>>> On 24/09/2020 12:05, Jisheng Zhang wrote:
>>>> Improve the msi code:
>>>> 1. Add proper error handling.
>>>> 2. Move dw_pcie_msi_init() from each users to designware host to 
>>>> solve
>>>> msi page leakage in resume path.
>>> 
>>> Apologies if this is slightly off topic, but I have been meaning to 
>>> ask
>>> about MSIs and PCI. On Tegra194 which uses the DWC PCI driver, 
>>> whenever we
>>> hotplug CPUs we see the following warnings ...
>>> 
>>>  [      79.068351] WARNING KERN IRQ70: set affinity failed(-22).
>>>  [      79.068362] WARNING KERN IRQ71: set affinity failed(-22).
>>> 
>> 
>> I tried to reproduce this issue on Synaptics SoC, but can't reproduce 
>> it.
>> Per my understanding of the code in kernel/irq/cpuhotplug.c, this 
>> warning
>> happened when we migrate irqs away from the offline cpu, this 
>> implicitly
>> implies that before this point the irq has bind to the offline cpu, 
>> but how
>> could this happen given current dw_pci_msi_set_affinity() 
>> implementation
>> always return -EINVAL
> 
> By default the smp_affinity should be set so that all CPUs can be
> interrupted ...
> 
> $ cat /proc/irq/70/smp_affinity
> 0xff
> 
> In my case there are 8 CPUs and so 0xff implies that the interrupt can
> be triggered on any of the 8 CPUs.
> 
> Do you see the set_affinity callback being called for the DWC irqchip 
> in
> migrate_one_irq()?

The problem is common to all MSI implementations that end up muxing
all the end-point MSIs into a single interrupt. With these systems,
you cannot set the affinity of individual MSIs (they don't target a
CPU, they target another interrupt... braindead). Only the mux
interrupt can have its affinity changed.

So returning -EINVAL is the right thing to do.

          M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
