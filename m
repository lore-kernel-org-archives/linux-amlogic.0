Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481EAC636D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 02:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wv8/q36ZX17avFiHQLdfXV+HMAQVDguRw+X2GTcuoBU=; b=XIOQtC2PuW6w0O
	gSYAFOdTXhHivYyNRj39SJraMW6iGSPaEj/ukrgrgWba69xjJGyUI6jhHOdGR19WmQROpMKUaK90H
	E86X9VYi2QsMy0HpYJLIUzP4KI7T4PFTMBeCe/2lc40ZNXdmcNFWE5LqruXMvL/ZfogCne9JeC9XV
	LvLh7lxA0FdoIIJcuE0DIN8sQ6ovq/WymQ96SAg2JFOd6PjE7l8BgMucrd891Owlw1Zq84jF8iklE
	T21ndqdpt0FDSMiOpctiKvbxf4Fp6rnQfhS1nKAZ03nJv0OuNcyERavuPvXKthx//HI9Y56PvLWBh
	gXyqAWVo5zR5sCagd6Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQfC6-008Ijp-16; Sat, 11 Feb 2023 02:00:50 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQfC2-008Ii1-77; Sat, 11 Feb 2023 02:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676080846; x=1707616846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UNTQVZa9rFmKAuptNI32rM4R7o0DY7N5tapDS1Jes9s=;
  b=OiEZHpFBJtCG+IIb/zLWUPtYXRynYnoRmkj+GGu7tXCeb3LUt/g5zkbi
   0LExoYECep95QxM5R6LtIiIKea1Bx423ny65OYKlbs97/0UHO2mUc2/sC
   CnIFxekfpRJyYM4Hv0Ey/YfO0H3teNuOUYCg8WLSgsHOZ1UA5X7m9uhPy
   tl9X772ArLTm+acQOsKGOtvt9UChmOPyPkgE8QIpCihmvlAtjH8ft2+ZZ
   tEYMnm1UlekAQ8mkAhhJ/HTTfJxV2SWTQQQF16ynZFXjzmFDlelgJe4uV
   d5NnvYpGzl6PrPJQnETWS3oULZhDvSKPxRGDCQVDa6QL9YhQrxnCNsYWo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310202508"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310202508"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 18:00:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="792161170"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="792161170"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga004.jf.intel.com with ESMTP; 10 Feb 2023 18:00:37 -0800
Date: Fri, 10 Feb 2023 18:10:23 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael.j.wysocki@intel.com, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guillaume La Roque <glaroque@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Haowen Bai <baihaowen@meizu.com>,
	Minghao Chi <chi.minghao@zte.com.cn>,
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] thermal: Remove core header inclusion from drivers
Message-ID: <20230211021023.GA13306@ranerica-svr.sc.intel.com>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_180046_294760_6AFA8AB8 
X-CRM114-Status: GOOD (  16.56  )
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

On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> As the name states "thermal_core.h" is the header file for the core
> components of the thermal framework.
> 
> Too many drivers are including it. Hopefully the recent cleanups
> helped to self encapsulate the code a bit more and prevented the
> drivers to need this header.
> 
> Remove this inclusion in every place where it is possible.
> 
> Some other drivers did a confusion with the core header and the one
> exported in linux/thermal.h. They include the former instead of the
> latter. The changes also fix this.
> 
> The tegra/soctherm driver still remains as it uses an internal
> function which need to be replaced.
> 
> The Intel HFI driver uses the netlink internal framework core and
> should be changed to prevent to deal with the internals.

I don't see any of the thermal netlink functionality exposed. Is
there any work in progress?

FWIW, Acked-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
