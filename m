Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE57FC25B7E
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 09:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=//dVv8iMaK3xWzs85blhab1lJAS+zHyq0KemvP1cpBQ=; b=PN/EI8pdGWZW10
	wGmYjlTpdI+cd5+dvLCxzPRxUXHLAjWNcgWb3t5fXwMyWy/Hqn/SiI3z2eKpJCjzD+YbVZENrd5Se
	CYrjd/pLnFRS5DvqQ4eJj16Syrnf3Bkvzc2mq216mHOZuk1rc4Vg/jhEXXcsHCjI+o7Q/rd0mCSPx
	1Yve2Vus3hdzMyG1jSt/KA2IlIqEgXsRuXVNXDAA5Ul6gJOpOYRtC9mOjtCt3hamFkNaQDpQiG+H4
	RtIQrSqGpWfAafgqjqBI+muSm5TheOe+u76uSwXQE9uU1T3kYRx5HuhsHciAHsACK4TaFQkUHZyj8
	F61LBUT4kNMFN/0jtsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQCv-00000001nov-3rmG;
	Tue, 04 Jun 2024 09:11:53 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQCs-00000001no3-0x5o;
	Tue, 04 Jun 2024 09:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717492310; x=1749028310;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ImJhbNsrIco+qebnToiezXtyMfSwI41zKI18NzCQA3A=;
  b=Btu4Ru1XPINSIQ/aD2pQtRJYLKStbMOFiCNTf3udwon59PQxZ24ZfoHF
   nFXoO+MiVAs2jo6vsSj66Gm8/d9xkzRRLrZkaiuQWGn7kPs7r1KoVUG4R
   0tCFsyQ6cn3eTdOo8S4Ztgf5g17Pb4iF7EZUJ45v24YKWgtaaiGW6p2xS
   GoAjNQjIEMlY2Tx2aLtUOtDnXTgSShUnbFB/u7rhAls2rn0OQM18+ZbT1
   lC5ALcxJadGAVUTiHd07kujENmNsDnpPbaC639yUmeeThDn0x8+hiG4qe
   pYaa6ZPFGTLyrua78e+rTRXoD8DHRfE7W/wx8Gq5SlwLl1GQQkp6/Byb0
   Q==;
X-CSE-ConnectionGUID: UgduunSURdGQU5eGnWSUTQ==
X-CSE-MsgGUID: g6UvMqX+R+mXr+NJbjgzbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17854997"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="17854997"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 02:11:45 -0700
X-CSE-ConnectionGUID: UTy3s7lEQtCIAKPlMIJ4mw==
X-CSE-MsgGUID: xOhWAYg1T8Kfg7RJFjH19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37299303"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jun 2024 02:11:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEQCg-000MzT-1r;
	Tue, 04 Jun 2024 09:11:38 +0000
Date: Tue, 4 Jun 2024 17:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
Message-ID: <202406041751.elQWr6cj-lkp@intel.com>
References: <20240604055431.3313961-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604055431.3313961-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_021150_330758_F4529BFC 
X-CRM114-Status: GOOD (  12.15  )
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

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linus/master v6.10-rc2 next-20240604]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/iio-adc-meson-add-support-for-the-GXLX-SoC/20240604-135606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240604055431.3313961-2-christianshewitt%40gmail.com
patch subject: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240604/202406041751.elQWr6cj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041751.elQWr6cj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041751.elQWr6cj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/meson_saradc.c:1262:18: error: use of undeclared identifier 'VREF_VOLTAGE_1V8'
           .vref_voltage = VREF_VOLTAGE_1V8,
                           ^
   1 error generated.


vim +/VREF_VOLTAGE_1V8 +1262 drivers/iio/adc/meson_saradc.c

  1255	
  1256	static const struct meson_sar_adc_param meson_sar_adc_gxlx_param = {
  1257		.has_bl30_integration = true,
  1258		.clock_rate = 1200000,
  1259		.regmap_config = &meson_sar_adc_regmap_config_gxbb,
  1260		.resolution = 12,
  1261		.disable_ring_counter = 1,
> 1262		.vref_voltage = VREF_VOLTAGE_1V8,
  1263		.cmv_select = true,
  1264		.mpll_clock_bits = true,
  1265	};
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
