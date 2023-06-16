Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F745EB64D8
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Jun 2023 11:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3OYIdoUPnZ8PkPcQiGNaoc7aKt6fFUJ9/zHtYrM7h1k=; b=v7XWKUVKbsfnCF
	5NDpzrKEnvZdJfyuFm4PtefAu9dWK1ZL5KMXd4+DWM8U9o3CXwePG6IjvGI0m2a7kzmSjMrCRP/gZ
	gQczikAzX0Y/RH6Jl7oTNzwtU/vWIyQFteuxRV2yDaI3W7DgsjVe20UixDumZg/HNSFhDGLeTT22r
	NKB//ljfG41GzLd1g8vD/WTqObFZt/Lbz0T+dgAFuzaNio7orxYxEM0gNyvOP/vcIVHFJBz3zbuet
	8Nnm7wBrUYEVjZGUuyIN6gfFsAh5/XEKitqP2OK+PifxGX7QcpPwjjSNbxZfxtuhP6T85i7Jus9ry
	EGs8AaZ0Vwr8g5PrQ6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7YI-000Nmo-2U;
	Fri, 16 Jun 2023 11:23:38 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA7YF-000NlG-2W;
	Fri, 16 Jun 2023 11:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686914615; x=1718450615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mDlHBFyvTQFGzUvmEXVx2wFpXxheBWNoL0HLCWmLp7I=;
  b=eAI9r+lpqEfclzGYyBTmPbsaz7DT3V7w3/0DG60K/f51peQIv/yBnILe
   dhePw6VHHos62Z/F3Jw992YZF3b4C5SfqtadQUixvnXw5B63Ns1TB5yTm
   BdUd6K0edM3+gwNcdGaw1L0vd9XqGRrOV/D1Tsh5Zm54I+SCaJ7IeC0na
   du2h4NQBewMEj7fLd3TWqmBvJH9pQm6KWlSWGaCkB7lxuadnJzf8nRRpp
   mdH2HUnF+nluk+K/qIags6ma9q/vAm+GmT+tU7yTc5D0koqz3CPIx7Krz
   T3gw47F0exDl0vUaJbY8Xm0kQdge17FGyp8H9XKQWgpQzVGVGXhwrNypz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387899099"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="387899099"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 04:23:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="707064234"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="707064234"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Jun 2023 04:23:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA7Y3-0001Aj-1h;
	Fri, 16 Jun 2023 11:23:23 +0000
Date: Fri, 16 Jun 2023 19:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Nick <nick@khadas.com>,
	Artem <art@khadas.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org, Lucas Tanure <tanure@linux.com>
Subject: Re: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
Message-ID: <202306161946.Kk7xeos8-lkp@intel.com>
References: <20230615182938.18487-4-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230615182938.18487-4-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_042335_834858_5F1A30F6 
X-CRM114-Status: GOOD (  16.03  )
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

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next tty/tty-testing tty/tty-next tty/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.4-rc6 next-20230616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/dt-bindings-arm-amlogic-add-Amlogic-T7-based-Khadas-VIM4-bindings/20230616-023038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230615182938.18487-4-tanure%40linux.com
patch subject: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
config: arm64-buildonly-randconfig-r004-20230615 (https://download.01.org/0day-ci/archive/20230616/202306161946.Kk7xeos8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161946.Kk7xeos8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306161946.Kk7xeos8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/meson/t7.c:7084:51: warning: initialized field overwritten [-Woverride-init]
    7084 |                 [CLKID_VID_PLL]                 = &t7_vid_pll.hw,
         |                                                   ^
   drivers/clk/meson/t7.c:7084:51: note: (near initialization for 't7_hw_onecell_data.hws[93]')
   drivers/clk/meson/t7.c: In function 'meson_t7_probe':
>> drivers/clk/meson/t7.c:7946:36: warning: variable 'mclk_data' set but not used [-Wunused-but-set-variable]
    7946 |         struct meson_clk_pll_data *mclk_data;
         |                                    ^~~~~~~~~
   drivers/clk/meson/t7.c: At top level:
   drivers/clk/meson/t7.c:689:37: warning: 't7_a73_dyn_clk_sel' defined but not used [-Wunused-const-variable=]
     689 | static const struct clk_parent_data t7_a73_dyn_clk_sel[] = {
         |                                     ^~~~~~~~~~~~~~~~~~
   drivers/clk/meson/t7.c:93:29: warning: 'meson_pll_clk_no_ops' defined but not used [-Wunused-const-variable=]
      93 | static const struct clk_ops meson_pll_clk_no_ops = {};
         |                             ^~~~~~~~~~~~~~~~~~~~


vim +/mclk_data +7946 drivers/clk/meson/t7.c

  7939	
  7940	static int __ref meson_t7_probe(struct platform_device *pdev)
  7941	{
  7942		struct device *dev = &pdev->dev;
  7943		struct regmap *basic_map;
  7944		struct regmap *pll_map;
  7945		struct regmap *cpu_clk_map;
> 7946		struct meson_clk_pll_data *mclk_data;
  7947		int ret, i;
  7948	
  7949		/* Get regmap for different clock area */
  7950		basic_map = t7_regmap_resource(dev, "basic");
  7951		if (IS_ERR(basic_map)) {
  7952			dev_err(dev, "basic clk registers not found\n");
  7953			return PTR_ERR(basic_map);
  7954		}
  7955	
  7956		pll_map = t7_regmap_resource(dev, "pll");
  7957		if (IS_ERR(pll_map)) {
  7958			dev_err(dev, "pll clk registers not found\n");
  7959			return PTR_ERR(pll_map);
  7960		}
  7961	
  7962		cpu_clk_map = t7_regmap_resource(dev, "cpu_clk");
  7963		if (IS_ERR(cpu_clk_map)) {
  7964			dev_err(dev, "cpu clk registers not found\n");
  7965			return PTR_ERR(cpu_clk_map);
  7966		}
  7967	
  7968		/* Populate regmap for the regmap backed clocks */
  7969		for (i = 0; i < ARRAY_SIZE(t7_clk_regmaps); i++)
  7970			t7_clk_regmaps[i]->map = basic_map;
  7971	
  7972		for (i = 0; i < ARRAY_SIZE(t7_cpu_clk_regmaps); i++)
  7973			t7_cpu_clk_regmaps[i]->map = cpu_clk_map;
  7974	
  7975		for (i = 0; i < ARRAY_SIZE(t7_pll_clk_regmaps); i++)
  7976			t7_pll_clk_regmaps[i]->map = pll_map;
  7977		regmap_write(pll_map, ANACTRL_MPLL_CTRL0, 0x00000543);
  7978	
  7979		mclk_data = t7_mclk_pll_dco.data;
  7980	
  7981		for (i = 0; i < t7_hw_onecell_data.num; i++) {
  7982			/* array might be sparse */
  7983			if (!t7_hw_onecell_data.hws[i])
  7984				continue;
  7985	
  7986			ret = devm_clk_hw_register(dev, t7_hw_onecell_data.hws[i]);
  7987			if (ret) {
  7988				dev_err(dev, "Clock registration failed\n");
  7989				return ret;
  7990			}
  7991		}
  7992		meson_t7_dvfs_setup(pdev);
  7993	
  7994	
  7995		return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, &t7_hw_onecell_data);
  7996	}
  7997	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
