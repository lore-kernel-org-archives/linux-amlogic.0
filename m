Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA9BC636CC
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 03:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xREiXf50Jm6TuSbJvnqSzVZTLzPmdPrq5nR5kOMk9c=; b=U71Wk7+PZ+ikX6
	9d3xC+kkKHzuQaQswH3WqeYMkDN33HFNiXi0lGaZcWSeCZa1zg/LhOjdzwdX4V/J4qd35eDnj0Cby
	OlqHBnnZXLd3ecPG+NLi9CUG/bZk+o6x2Jv9wh51wYRo5+fdMpPopq3coaVxmOOymnKwVMtNr/XEx
	yc65s4tryCoG3/svCdUqyOFR8c4Tb3E2aunWxfvkydmkVk6obv5XoprpoQjoMmCIuDHXHKY/qr8Xr
	F7/Ais50xLSkG5Jel+A2wrTmw8ZpnfZ+X6DDeR6ssNEjgjWvsx5wmAhUd208FK9fh517ebTbLZq4Z
	M+HL6UM+++HTdUcYhYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR2od-00Ao0m-Dn; Sun, 12 Feb 2023 03:14:11 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pR2oY-00Ao07-T7; Sun, 12 Feb 2023 03:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676171646; x=1707707646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8Ee53bw0HTAKCWMxXPAJRBW6Y+YE/qZmXr9sA0iMSzM=;
  b=UjYKIdYvjPfTo3pCAAgPwVga23NnuuuDryYOmN8uLxqgb1Mw6W1NzZP/
   5kFIF1qC/fz6ck3RUkfzgozQ42mMy3Nm9vfHMPeEzXS3SnjV7beAdHDEm
   Kpw8tyjid1cM4tGzCwYDy/fsEf0OdMavfYkzlLzjJYekj3rxGbraVe+t7
   MpjetjEQO0OLLOBrw1yt7D6ksV8oPoWKWw+ezD0awk/18s7E6CivlKFdf
   djdJIuR7zkHRiplukwCHQRrkXhHCyV0xLTdXhn2/PB+DJMt0Qv+yIU0vC
   TTPselLMcee1mIWZmfSIZAX/XJm+DrSlkG24odGwYvYwyDlD5yjoMNrlY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="332824346"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="332824346"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2023 19:13:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="842406476"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; 
   d="scan'208";a="842406476"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orsmga005.jf.intel.com with ESMTP; 11 Feb 2023 19:13:56 -0800
Date: Sat, 11 Feb 2023 19:23:45 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, rafael.j.wysocki@intel.com,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Message-ID: <20230212032345.GA17062@ranerica-svr.sc.intel.com>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
 <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
 <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_191407_073520_1D502D39 
X-CRM114-Status: GOOD (  28.06  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Feb 11, 2023 at 08:32:48AM -0800, srinivas pandruvada wrote:
> On Sat, 2023-02-11 at 08:53 +0100, Daniel Lezcano wrote:
> > On 11/02/2023 03:10, Ricardo Neri wrote:
> > > On Mon, Feb 06, 2023 at 04:34:29PM +0100, Daniel Lezcano wrote:
> > > > As the name states "thermal_core.h" is the header file for the
> > > > core
> > > > components of the thermal framework.
> > > > =

> > > > Too many drivers are including it. Hopefully the recent cleanups
> > > > helped to self encapsulate the code a bit more and prevented the
> > > > drivers to need this header.
> > > > =

> > > > Remove this inclusion in every place where it is possible.
> > > > =

> > > > Some other drivers did a confusion with the core header and the
> > > > one
> > > > exported in linux/thermal.h. They include the former instead of
> > > > the
> > > > latter. The changes also fix this.
> > > > =

> > > > The tegra/soctherm driver still remains as it uses an internal
> > > > function which need to be replaced.
> > > > =

> > > > The Intel HFI driver uses the netlink internal framework core and
> > > > should be changed to prevent to deal with the internals.
> > > =

> > > I don't see any of the thermal netlink functionality exposed. Is
> > > there any work in progress?
> > =

> > commit bd30cdfd9bd73b68e4977ce7c5540aa7b14c25cd
> > Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > =

> > =A0=A0=A0=A0 thermal: intel: hfi: Notify user space for HFI events
> > =

> This is already exposed and we use it in user space.
> thermal_genl_cpu_capability_event() is called from intel_hfi driver to
> send the cpu capabilities.
> =

> Not sure what do you mean by  "don't see netlink functionality
> exposed"?
> =

> thermal_genl_cpu_caps struct and thermal_genl_cpu_capability_event()
> are defined in drivers/thermal/thermal_netlink.h.

Yes, I mean exactly this. The HFI code uses this functionality, but it is
declared in "../thermal_netlink.h". I just wondered if that is OK or also
needs to be declared somewhere in include/linux/

Thanks and BR,
Ricardo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
