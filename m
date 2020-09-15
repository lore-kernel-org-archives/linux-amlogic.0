Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53618C43461
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 22:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F292064B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 22:03:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pde07PBz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNCs3AKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F292064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0WsrVzibHR52UHo7lSap42ccQ/Th/E/8/SUe8QeRZTA=; b=pde07PBzeTcslX4BhVaTbFm23
	eRK7xAOYg/Dnp3RCqaqB/umry7xuRR1m+jQ/kLoupW+guouSZuIQxBqY0CTwYqrA8s/wf5qcErfGW
	XDLiFET+Ufr/dyxuICJCrRhZLN3i458UIm3AorbvruQTf2phhdayec9WLUQR5mR2OK9xvs42hMPSA
	bS2z74vew5KfH3ePJIpy71CQpznLP/ptfWg6D8YPrs/625x28oTlFCji8ZVv9veDABJbgIc7BALBg
	GfkACM6lGSeg6RcW8F+waWMzs3ZcajvZnZHrHoPzQZTUBO61aiq53yWsCnySiaARnDiDRzvkWw4e8
	3n3ydew2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIJ2i-0003M4-FQ; Tue, 15 Sep 2020 22:03:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIJ2f-0003KV-4a; Tue, 15 Sep 2020 22:03:14 +0000
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD46020B1F;
 Tue, 15 Sep 2020 22:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600207391;
 bh=6zE0t0oBSXBMiJpCVysJvWDi1OuIiOE0z/RDPqK5QEo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nNCs3AKsNhyvwcxJiuYiwuCZk8aJhCrWu2hHimpp/80ZVp0COd9LLbRvKE7dYfj9M
 UORNn/A+ChZMXAgv8WUY92cLPIDrP1OUaIAq8koeKyYALz8L3fH6X5tH8exC0BtO4g
 z6E2UHuTiI3HCcJiuVDfh+u+2xN/iP4Lh+BzdNkg=
Received: by mail-ot1-f42.google.com with SMTP id e23so4782747otk.7;
 Tue, 15 Sep 2020 15:03:11 -0700 (PDT)
X-Gm-Message-State: AOAM530kRKSpPBT+4Fc5BvL1q5kErXfQ7h12J09/sX0620vP4grHZpfa
 eAe3tuWkHl+Sjn3fTMQQJ1Di6xv4+q9EpBlfgw==
X-Google-Smtp-Source: ABdhPJyEQLpI+Is0tXGd/BZAER5EHEJNoezWAKvaE8B6IPjEqoZXnEMY3dBYYK0F9I37uCwuUgkTqRhbfRj/m0u6ldo=
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr560428otq.192.1600207390980; 
 Tue, 15 Sep 2020 15:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200821035420.380495-1-robh@kernel.org>
 <20200915091218.28737-1-michael@walle.cc>
In-Reply-To: <20200915091218.28737-1-michael@walle.cc>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Sep 2020 16:02:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
Message-ID: <CAL_JsqLHBPduSjs1L3R2vbsLygJNDzajt4XThAkRG0DEu-GnAA@mail.gmail.com>
Subject: Re: [PATCH v2 00/40] PCI: dwc: Driver clean-ups
To: Michael Walle <michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_180313_291198_860094A7 
X-CRM114-Status: GOOD (  25.64  )
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
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Wangbinghui <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Jonathan Chocron <jonnyc@amazon.com>, Jon Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Dilip Kota <eswara.kota@linux.intel.com>, Kevin Hilman <khilman@baylibre.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 "Gross, Andy" <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Song Xiaowei <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Yue Wang <yue.wang@amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Murali Karicheri <m-karicheri2@ti.com>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Stanimir Varbanov <svarbanov@mm-sol.com>, Kukjin Kim <kgene@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 3:12 AM Michael Walle <michael@walle.cc> wrote:
>
> Hi Rob,
>
> > This is a series of clean-ups for the Designware PCI driver. The series
> > initially reworks the config space accessors to use the existing pci_ops
> > struct. Then there's removal of various private data that's also present
> > in the pci_host_bridge struct. There's also some duplicated common (PCI
> > and DWC) register defines which I converted to use the common defines.
> > Finally, the initialization for speed/gen, number of lanes, and N_FTS
> > are all moved to the common DWC code.
>
> > This is compile tested only as I don't have any DWC based h/w, so any
> > testing would be helpful. A branch is here[1].
>
> I've noticed that with the latest linux-next, my board doesn't boot
> anymore. I've traced it back to this series. There is a similar
> board in kernelci [1,2] where you can have a look at the backtrace.
>
> I've bisected this to the following patch:
>   PCI: dwc: Use generic config accessors

That's helpful.

> I'm pretty much lost here. It seems that the kernel tries to read from
> an invalid/unmapped memory address.
>
> [1] https://kernelci.org/test/plan/id/5f5f4992d1c53777a0a6092d/
> [2] https://storage.kernelci.org/next/master/next-20200914/arm64/defconfig/gcc-8/lab-nxp/baseline-fsl-ls1028a-rdb.txt

Thanks for the pointers. I was wondering if kernelci had any boards with DWC.

Can you try this? The link up check seemed unnecessary as it is racy.
What happens if the link goes down right after checking? That's the
only thing in the change that sticks out.

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
b/drivers/pci/controller/dwc/pcie-designware-host.c
index 317ff512f8df..afee1a0e8883 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -441,6 +441,9 @@ static void __iomem
*dw_pcie_other_conf_map_bus(struct pci_bus *bus,
        struct pcie_port *pp = bus->sysdata;
        struct dw_pcie *pci = to_dw_pcie_from_pp(pp);

+       if (!dw_pcie_link_up(pci))
+               return NULL;
+
        busdev = PCIE_ATU_BUS(bus->number) | PCIE_ATU_DEV(PCI_SLOT(devfn)) |
                 PCIE_ATU_FUNC(PCI_FUNC(devfn));

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
