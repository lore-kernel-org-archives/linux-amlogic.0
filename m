Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72FC10F1A
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 May 2024 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBb6/XnOUxlKtuYC3789V8fUzeM39jeD/MOT3WmAMjY=; b=orXsdOwggyMyUK
	KtKF64VZpIhtlcki/t4bNWVBKOYjRnKRsq3Z4TmpfHKZYAIP4slTODmu4p4qrhSYFzs19RfuqqsGj
	DPTaiEacR0h/uw3BwMyFOxi8XVk0nMD6t5WN+5vRsSSf5jFYvZPYXE+MVtTRhZZjY3acqIvd+sCBz
	9qx5hcISmxH9UccPOQgSRMuYkcY2PKnFxduEOINX1cxqFAFvx9cBWvWvn9RfKNGoGrDE4adx0m8YN
	7/KA3aMOk17GStgo/FMtPV2A+pWIuQ1W/8mil2BMCHAmGSJUs91rNrWLVWXaxaPtnBo2Xz34s4UCT
	0KdNNPPwF+Gn+Aw0Gw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4vD7-00000000Hib-1efM;
	Thu, 09 May 2024 04:16:49 +0000
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4vD3-00000000HgT-2KCQ
	for linux-amlogic@lists.infradead.org;
	Thu, 09 May 2024 04:16:47 +0000
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e98909e1-0dba-11ef-b3cf-005056bd6ce9;
	Thu, 09 May 2024 07:16:31 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 9 May 2024 07:16:30 +0300
To: Frank Li <Frank.li@nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZjxOHpXITE_5I4lq@surfacebook.localdomain>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
 <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
 <Zjp/eTITvtTG8bBL@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zjp/eTITvtTG8bBL@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_211645_825248_D89E0FEC 
X-CRM114-Status: GOOD (  10.43  )
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

Tue, May 07, 2024 at 03:22:33PM -0400, Frank Li kirjoitti:
> On Mon, May 06, 2024 at 05:20:40PM +0300, Andy Shevchenko wrote:
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.

...

> Can I include your patch in my imx6 pci improvement patches
> https://lore.kernel.org/linux-pci/20240507-pci2_upstream-v4-0-e8c80d874057@nxp.com/T/#t
> 
> There is patch, which rename function from imx6 -> imx. That will avoid
> conflict.

You can, of course, but it will be not my decision to make. Ask PCI maintainers
who is supposed to take this series.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
