Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73B4C4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 17:30:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD3D2075F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 17:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xawzTr2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD3D2075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=misterjones.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sS4+ItdYgKS+/M8aiNq8fGqF3Bx8n+RA/XTx74p0bNM=; b=xawzTr2SI7cx4dpDcRaS8gAnt
	8q/1r+GcHCz4V9m1MYyCGT7TbjgUAO4cdXGyF30PHyoaWmUk9767bRYsRTpBgj4PagX3QfXp1YsY7
	n6rzP4O1JF4+uMEOIAy+fkekfm3j0gBaJ+NmCDMQ6OCEV1OdcKcy8oUFImBIyo+8gyU29zEvW9zjC
	jHIk6qxztrp3Cx85t84wKkCrDryqUCHBoeYHvpYjGL+zKPvwk3+FMJmkATXCDAMx0Ezj43FdKkGnQ
	l1sOIH5e7sRO5FlcT3uah7aU+V2KeditCqbwOajMS3mwPpYebdw6zwQvrv3fJ8tLa/PVWb9OIjA0d
	+OW0/ZDCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNJSR-00029q-Pa; Tue, 29 Sep 2020 17:30:31 +0000
Received: from disco-boy.misterjones.org ([51.254.78.96])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNJSN-00027x-UN; Tue, 29 Sep 2020 17:30:29 +0000
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@misterjones.org>)
 id 1kNJRo-00FuDq-Bp; Tue, 29 Sep 2020 18:29:52 +0100
MIME-Version: 1.0
Date: Tue, 29 Sep 2020 18:29:52 +0100
From: Marc Zyngier <maz@misterjones.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH v2 2/5] PCI: dwc: Check alloc_page() return value
In-Reply-To: <20200924190623.3251c2ac@xhacker.debian>
References: <20200924190421.549cb8fc@xhacker.debian>
 <20200924190623.3251c2ac@xhacker.debian>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <74af578c79bd09f2111e5438917f2c6e@misterjones.org>
X-Sender: maz@misterjones.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Jisheng.Zhang@synaptics.com, kishon@ti.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, bhelgaas@google.com,
 jingoohan1@gmail.com, kgene@kernel.org, krzk@kernel.org, hongxing.zhu@nxp.com,
 l.stach@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 yue.wang@amlogic.com, khilman@baylibre.com, narmstrong@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 jesper.nilsson@axis.com, gustavo.pimentel@synopsys.com,
 songxiaowei@hisilicon.com, wangbinghui@hisilicon.com, agross@kernel.org,
 bjorn.andersson@linaro.org, svarbanov@mm-sol.com, pratyush.anand@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, hayashi.kunihiko@socionext.com,
 yamada.masahiro@socionext.com, linux-samsung-soc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_133028_104074_1C4201FF 
X-CRM114-Status: GOOD (  16.06  )
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
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 linux-kernel@vger.kernel.org, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-24 12:06, Jisheng Zhang wrote:
> We need to check alloc_page() succeed or not before continuing.
> 
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c
> b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 0a19de946351..9e04e8ef3aa4 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -303,6 +303,11 @@ void dw_pcie_msi_init(struct pcie_port *pp)
>  	u64 msi_target;
> 
>  	pp->msi_page = alloc_page(GFP_KERNEL);
> +	if (!pp->msi_page) {
> +		dev_err(dev, "Failed to alloc MSI page\n");

A failing allocation will already scream, so there is no need to
add insult to injury.

More importantly, what is this MSI page ever used for? If I remember
well, this is just a random address that never gets written to.

So why do we allocate a page here? Why do we bother with this DMA
mapping?

         M.
-- 
Who you jivin' with that Cosmik Debris?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
