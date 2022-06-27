Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D898C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TN1ipWI6Q/JbLbh5nkC2f8BcZOGTP8yhu2RrolWLDQ=; b=s1CABCbtFDPGdj
	fLi70H4wzau6cF4tQnZ/2+01ZsTrPyQ4KDkQBSxB6u8pkstrTZ93PoLKMpQscWAjRWbZdDZReHy+8
	5GscSJsovyFSsoUb5RpQr7djU1uAfIQiMQTCgKN0maez0uzL+g+i41O+Mw0zuJ4W1PAPwIa3zMn6T
	aXHHTHv1zz08PPE2da+ToQETA2bnbDzjhw4N3klYsdhIN4VQjo3tewn26QidE1AGTecJbgQy68y6y
	hULYg0SN2+pRWihE4dZZHCwIV12dcSIenFr2JF7z3Jz8rqFW/nkteOOQKYC6zYD8mWW7hI1sY6Loa
	lMiol87r2Zpxphxu44aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nDW-000f3c-FH; Mon, 27 Jun 2022 11:47:46 +0000
Received: from smtp1.axis.com ([195.60.68.17])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nDS-000ex8-Lh; Mon, 27 Jun 2022 11:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1656330463;
  x=1687866463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvYHOeFy99wGwq/w2fx0FEcTo66gkhtePc7lFcpF/fs=;
  b=Erxpba3u2O0sbgNGRrAk4jmzeSK+h9WhxjUYkj8V+4mpi0CLXgqX2fxa
   9U4U8bxzIaxGEe5Away7fGJs9FBuNTZAa3DNdiR/OkIX863vnR6ZjYcVD
   GrunqnL+qZD1iqSuMGnx4oeqnU6pMdbAAsbFLKpzlOSaVZ3dWoMfGFWB2
   HaBVP8hUK6EzzhF2zZVSkxviIAbLYURz+fVxskPs+W8azWXE/55cg9/DQ
   tTrX4/xHJmfq2rRZMB2tPxIeaURnwS2WzENit/ADujLAPfKmQPbARGTdV
   fHff9rz1ZPYw1CDR+29ARB4IFOwgT2SLTSYl1tRlNlo1QqmuIU4chQya0
   w==;
Date: Mon, 27 Jun 2022 13:47:33 +0200
From: Jesper Nilsson <Jesper.Nilsson@axis.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC: Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Jingoo Han
	<jingoohan1@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team
	<linux-imx@nxp.com>, Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu
	<mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Yue Wang
	<yue.wang@Amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Jonathan Chocron
	<jonnyc@amazon.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Jesper
 Nilsson" <Jesper.Nilsson@axis.com>, Gustavo Pimentel
	<gustavo.pimentel@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>, Srikanth Thokala
	<srikanth.thokala@intel.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>, Stanimir Varbanov
	<svarbanov@mm-sol.com>, Pratyush Anand <pratyush.anand@gmail.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Serge Semin <fancer.lancer@gmail.com>, Alexey Malahov
	<Alexey.Malahov@baikalelectronics.ru>, Pavel Parkhomenko
	<Pavel.Parkhomenko@baikalelectronics.ru>, Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, linux-arm-kernel
	<linux-arm-kernel@axis.com>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH RESEND v5 15/18] PCI: dwc: Add dw_ prefix to the
 pcie_port structure name
Message-ID: <20220627114733.GG13332@axis.com>
References: <20220624143428.8334-1-Sergey.Semin@baikalelectronics.ru>
 <20220624143428.8334-16-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624143428.8334-16-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_044743_043723_F189E13A 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Jun 24, 2022 at 04:34:25PM +0200, Serge Semin wrote:
> All of the DW PCIe core driver entities have names with the dw_ prefix in
> order to easily distinguish local and common PCIe name spaces. All except
> the pcie_port structure which contains the DW PCIe Root Port descriptor.
> For historical reason the structure has retained the original name since
> commit 340cba6092c2 ("pci: Add PCIe driver for Samsung Exynos") when
> the DW PCIe IP-core support was added to the kernel. Let's finally fix
> that by adding the dw_ prefix to the structure name and by adding the _rp
> suffix to be similar to the EP counterpart. Thus the name will be coherent
> with the common driver naming policy. It shall make the driver code more
> readable eliminating visual confusion between the local and generic PCI
> name spaces.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Rob Herring <robh@kernel.org>

Sorry, I never replied in the thread for the last patch,
your reasoning for not changing the parameter name made sense.

For the ARTPEC-6 parts,

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
