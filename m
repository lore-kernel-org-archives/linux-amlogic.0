Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75977C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jun 2022 00:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CX/K9GEvQOZOuPBIK5jyaivLh/T3qmozaX59rF406/o=; b=HBmoOqcgYK1Qmh
	Kj2vnvkv4rsyUlZRb6yLu9zNcnpINu+lGEFzGJpt4906w98s5jO03rlVQNc28b9b0ijIbscPcTP+0
	xSkC1rwmo5Gf9MvLgagYprTZo/FyARb5Q/otVmRXeJcwE0KBerIKDQq8Dbe3vPru+CwvLKiaSl3Jw
	uOyh10rjLucLh5umNBoivFh5YdmCXWkkCDTFYlorj2qNpMDDamTXp21amvtORZm9TsLyxIAy0h/bo
	q7kOs5fJYPjEmQIeaEyBJcq0jryFwLmvIExgU5WojMhEgajXfNcJRHMb5LBkwqABGDkd3holXs4um
	ISagqNM4oXZPfKzKq9Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwCU5-00DCLp-1x; Wed, 01 Jun 2022 00:45:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwCTq-00DCGg-Dy; Wed, 01 Jun 2022 00:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jvfauVZzXAb79KOE7W3UbDyBNzKBWU+IPE8Dl5Rjt8w=; b=Kmx6SkhlqpwWtO7IWWd0lSmYBN
	P5o7IWNxnu5GB56EDyNGG+2l5kUsY3KOct0Ek4DyLeKlkkL63F5k4S4XeTt4ykPi51FPm/caNY646
	6eiXEDAn5elvxhnPCuY9gnra/yg8UgzId4gPrtEtX9W5+Q25hQ4p9dtIgCfQBR66d5c6isVcKDi9a
	24i9h+8KNOOO2HbR7KZWY67oFcU42Kyw4JZNmXUknJpaphvtVj0HRr4nAm4Mjnpti4SYCFCo0Bu5/
	5Rdos8WZE3jenCwvzvK/du+JkTX8s0s4REAaMTc1dsxp9MZlJvv1ZhKK64OvPu7AmGCI2astX47yH
	HSGPG0nw==;
Received: from mga17.intel.com ([192.55.52.151])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwCTk-003c8I-Ch; Wed, 01 Jun 2022 00:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654044292; x=1685580292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Edfpulig+ThWc0bbiQuZikx3D/q8pZAAGANvXImqB7M=;
  b=WNBy9iucSceBgWgsJTWoA6w8TgfOqCHABDr00vz8l06kF8h4D9nEjT/G
   TjLLXP95orQzvxumU9EN9QmbWsgzdd2l/OKO13BBQTWJocyKX3Yys6aPo
   Tt34C/r34Z3Jfbz3JfxdKVrrwQ0oRWVirgo6il1HypntVEE5pzlqTPUEV
   jrEAEOnvAFpOdNIrDP58N/rC0VnXGY8PBuLlRZEJkQQsBC26QikYr5q/D
   7BnCq3pxKsA4x4Yj06e7f35SALfmtkaP/QlUys/9Src8mkXNYLKIjnao2
   5sF/eXK2WH5vVpljqXc/JV4Vh/cx7eJkJJmxbJVrcHFRpb2XYWhZF597J
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255907836"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="255907836"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 17:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="720549427"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 May 2022 17:44:35 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwCTS-0003Ie-Gz;
	Wed, 01 Jun 2022 00:44:34 +0000
Date: Wed, 1 Jun 2022 08:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kbuild-all@lists.01.org, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 3/3] iio: adc: meson_saradc: Use temporary variable
 for struct device
Message-ID: <202206010812.Xy2yMeXw-lkp@intel.com>
References: <20220531211842.71998-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531211842.71998-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_014453_371925_B8BFE528 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18 next-20220531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/iio-adc-meson_saradc-Convert-to-use-dev_err_probe/20220601-052117
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220601/202206010812.Xy2yMeXw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d2d128394df620a157f32fab808d46e5983f73e5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/iio-adc-meson_saradc-Convert-to-use-dev_err_probe/20220601-052117
        git checkout d2d128394df620a157f32fab808d46e5983f73e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/iio/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/iio/adc/meson_saradc.c: In function 'meson_sar_adc_clk_init':
>> drivers/iio/adc/meson_saradc.c:652:24: warning: 'dev' is used uninitialized [-Wuninitialized]
     652 |         struct device *dev = dev->parent;
         |                        ^~~


vim +/dev +652 drivers/iio/adc/meson_saradc.c

   646	
   647	static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
   648					  void __iomem *base)
   649	{
   650		struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
   651		struct device *idev = &indio_dev->dev;
 > 652		struct device *dev = dev->parent;
   653		struct clk_init_data init;
   654		const char *clk_parents[1];
   655	
   656		init.name = devm_kasprintf(idev, GFP_KERNEL, "%s#adc_div", dev_name(dev));
   657		if (!init.name)
   658			return -ENOMEM;
   659	
   660		init.flags = 0;
   661		init.ops = &clk_divider_ops;
   662		clk_parents[0] = __clk_get_name(priv->clkin);
   663		init.parent_names = clk_parents;
   664		init.num_parents = 1;
   665	
   666		priv->clk_div.reg = base + MESON_SAR_ADC_REG3;
   667		priv->clk_div.shift = MESON_SAR_ADC_REG3_ADC_CLK_DIV_SHIFT;
   668		priv->clk_div.width = MESON_SAR_ADC_REG3_ADC_CLK_DIV_WIDTH;
   669		priv->clk_div.hw.init = &init;
   670		priv->clk_div.flags = 0;
   671	
   672		priv->adc_div_clk = devm_clk_register(idev, &priv->clk_div.hw);
   673		if (WARN_ON(IS_ERR(priv->adc_div_clk)))
   674			return PTR_ERR(priv->adc_div_clk);
   675	
   676		init.name = devm_kasprintf(idev, GFP_KERNEL, "%s#adc_en", dev_name(dev));
   677		if (!init.name)
   678			return -ENOMEM;
   679	
   680		init.flags = CLK_SET_RATE_PARENT;
   681		init.ops = &clk_gate_ops;
   682		clk_parents[0] = __clk_get_name(priv->adc_div_clk);
   683		init.parent_names = clk_parents;
   684		init.num_parents = 1;
   685	
   686		priv->clk_gate.reg = base + MESON_SAR_ADC_REG3;
   687		priv->clk_gate.bit_idx = __ffs(MESON_SAR_ADC_REG3_CLK_EN);
   688		priv->clk_gate.hw.init = &init;
   689	
   690		priv->adc_clk = devm_clk_register(idev, &priv->clk_gate.hw);
   691		if (WARN_ON(IS_ERR(priv->adc_clk)))
   692			return PTR_ERR(priv->adc_clk);
   693	
   694		return 0;
   695	}
   696	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
