Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457F4E7E0BC
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yhnBN4f4dyacRVy4PInQzajTmh++KUZ/YLLHByQ13T4=; b=POqlyOGTnV/o6P
	o3b+6JlSY9SY8i/QHMVvGjaquQUlKKUNs1AmWtwWVkpdc9m1KRgrtAkMq0vcQkLGVFbb09e/DlGOd
	sbhJEolTUHvIKHy9IPMStKwIiCmxUmBzK5lO49ePd97yxb7/4mr9MmHfOHh5mmyv68uC3V9D7Bdho
	hQoISYcLl8xHlYY3nFyMWNzvar6JBFz0PmDkvhNEB/S6shr1qIm4GUXeYQ/YiYThVgXtT7YT+plui
	qKAvB/eoH75ISg2fvpwNRXhAMXX4DLU1aqmYNgjliSxII8wa869o5ckcrLrSFYBqiIGVGVWAqh9Xr
	xkXD6E1f6L4ThwjRxYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVB3-0000000FmiS-2Ndd;
	Mon, 09 Feb 2026 17:36:01 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpVAz-0000000FmhL-3k4i
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 17:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770658558; x=1802194558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=73LGh3J5tomwn6vZ9HuVNxSPnB+51GM8Nl0zJ+5ENEU=;
  b=SEX7tpO8CmbzEAP+nryMOWeRWujNPKb+7Z5OQMKiwKPX9tbVbUKkPj0B
   I2/+1skkHthV+ICG5WcBCFh+T3pZz5/3RDbnovitsUbkLU9T7orNvS/IC
   GnY7UjpYP2ELSitJIF7GaA6mCVLbOZNoOk3z/5dHNmcmjLLZSM6iyKMr+
   V/5sfqyQmhj6q/AA6vjXxCAUTpR6hYtg23QgYnKE/KGIOMfORsqkZpMqi
   WgQroeKECpUIFNl4IFdXbPu3SGFNlZHg9lA1Q+tTRUMAG856PBoEn2BP3
   nIqBErQPqXhReWP0208XIz6zXqDdmbYvWOHUpJlRDw3FX9ItuiYB3L0/g
   w==;
X-CSE-ConnectionGUID: 07VJfiMbSsiO2+a7//NAKg==
X-CSE-MsgGUID: RxOO6nI0S9eHGlNslCd8Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="74375239"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="74375239"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 09:35:56 -0800
X-CSE-ConnectionGUID: zfdlWZZpTma6abgQOL91Bw==
X-CSE-MsgGUID: 5kpuJEo+TR6RTYSj1OKZ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="216622484"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Feb 2026 09:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpVAp-00000000oB2-2v2D;
	Mon, 09 Feb 2026 17:35:47 +0000
Date: Tue, 10 Feb 2026 01:35:05 +0800
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
Message-ID: <202602100115.ykL6A0lh-lkp@intel.com>
References: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260209-a9_clock_driver-v1-8-a9198dc03d2a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_093557_969997_B23F0A20 
X-CRM114-Status: GOOD (  11.16  )
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
config: arm-randconfig-004-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100115.ykL6A0lh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100115.ykL6A0lh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100115.ykL6A0lh-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.o: in function `aml_pll_get_rate_range':
>> drivers/clk/amlogic/clk-pll.c:554:(.text+0x700): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:567:(.text+0x728): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/clk/amlogic/clk-pll.c:554:(.text+0x814): undefined reference to `__aeabi_uldivmod'


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
