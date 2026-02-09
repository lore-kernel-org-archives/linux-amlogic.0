Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BD6E81BDA
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7A3RWy/o/f6VSdoHu6wz4CYsaX0nxTxdoTCUYZIqac=; b=J00Nqz79+aV6o4
	hotiNSVyQ3KjAAnZtw1Ba5ugmrXzUBvTipc2mtLSdrYvhQUs9a91jsCy2j5PIGzlK3xzoN1hN33PJ
	FRmGkfinpnmkRZkt7h9gwr4R2LllEAsbPuLSE94gzwFaekidkhUcQkMrT3FYoFkwnSsAaguC4RlLB
	xAko3CjiSZFDHmcCFPv+MWSf14fIcmTFxvZAhoGQ0ed2h6H682y43G1Al9emaUgGc82JcxQZ2X6pa
	Q3a6srcCJfo0sH5odaXVB9nJoKeNUJv7bx7m3AaYqkuYNh78fUxb3zZkSoo7Mo8fVDp9cyUPtigcC
	4WUD0pZnNE/Gk+P+AIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTKZ-0000000FckA-46BC;
	Mon, 09 Feb 2026 15:37:43 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTKW-0000000FcjR-03DC
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 15:37:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770651460; x=1802187460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5qoZV77a6+kSnikdliIA4iXaH+PJyUpecip8OHKWf4Q=;
  b=hYyoB3ShIqBpeUrPaDiidi+C0SxCtYmakwjzWyvKHZ1o1C2HcCyfC40M
   /tzC+EMaFJry/aRtXEHTcjMOMVhWlwF0K7ENg8v9HCd2aBGtlkWlanr4i
   l0UiCI2SrJEWRpe/BaiMxXZ6Jmwu/RX4VVKgrU0KiL+hxPu+0q/lqm6h5
   8FZwGLES1mI1MipUZNCyNWB/0vS3BYkoT4Q7UBAKUQv6imFRTwmmjyJ5+
   apcBG6uugjwmslr4sunM8sSYFIq3hb8D5/Vh8JyoUREltkgdugSLOawRA
   gFi/CCwOV9Gt7NOSPH391K4Tpou51Vq2g5YPksoOFvUY3mhgOvOFq7PFO
   Q==;
X-CSE-ConnectionGUID: FNwAGaKjTea6lsXF7w1Z7Q==
X-CSE-MsgGUID: GhLEEgYMQI6tiKczy7G0gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71665096"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71665096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 07:37:36 -0800
X-CSE-ConnectionGUID: 1DdUKmTlT5KKa66KH8UVeA==
X-CSE-MsgGUID: xdwATXuRS4WvoUbhgnVvTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211627456"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 07:37:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpTKM-00000000o4u-24xk;
	Mon, 09 Feb 2026 15:37:30 +0000
Date: Mon, 9 Feb 2026 23:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 08/13] clk: amlogic: Add PLL driver
Message-ID: <202602092354.9sJeoo5S-lkp@intel.com>
References: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_073740_544236_161DD9A6 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4d310797262f0ddf129e76c2aad2b950adaf1fda]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A9-standardized-model-clock-control-units/20260209-135334
base:   4d310797262f0ddf129e76c2aad2b950adaf1fda
patch link:    https://lore.kernel.org/r/20260209-a9_clock_driver-v1-8-a9198dc03d2a%40amlogic.com
patch subject: [PATCH 08/13] clk: amlogic: Add PLL driver
config: arm-randconfig-003-20260209 (https://download.01.org/0day-ci/archive/20260209/202602092354.9sJeoo5S-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602092354.9sJeoo5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602092354.9sJeoo5S-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.o: in function `aml_pll_available_rates_show':
>> drivers/clk/amlogic/clk-pll.c:554: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:567: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:554: undefined reference to `__aeabi_uldivmod'


vim +554 drivers/clk/amlogic/clk-pll.c

   536	
   537	static int aml_pll_get_best_rate(unsigned long rate, unsigned long step_rate,
   538					 u64 min_vco_rate, u64 max_vco_rate,
   539					 u8 od_max, enum round_type round,
   540					 unsigned long *out_rate)
   541	{
   542		int i;
   543		u64 vco_rate;
   544		unsigned long now_rate, best_rate = 0;
   545	
   546		for (i = 0; i <= od_max; i++) {
   547			vco_rate = rate << i;
   548			if (vco_rate < min_vco_rate)
   549				continue;
   550	
   551			if (vco_rate > max_vco_rate)
   552				break;
   553	
 > 554			if (vco_rate % step_rate == 0) {
   555				best_rate = rate;
   556	
   557				break;
   558			}
   559	
   560			if (round == ROUND_DOWN) {
   561				vco_rate = vco_rate - (vco_rate % step_rate);
   562				now_rate = vco_rate >> i;
   563				if ((rate - now_rate) < (rate - best_rate))
   564					best_rate = now_rate;
   565			} else {
   566				vco_rate = vco_rate + step_rate;
 > 567				vco_rate = vco_rate - (vco_rate % step_rate);
   568				now_rate = vco_rate >> i;
   569				if ((now_rate - rate) < (best_rate - rate))
   570					best_rate = now_rate;
   571			}
   572		}
   573	
   574		if (!best_rate)
   575			return -EINVAL;
   576	
   577		*out_rate = best_rate;
   578	
   579		return 0;
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
