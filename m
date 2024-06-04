Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5718CC25B78
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3K+PWoi7dP6m2ITrwSa/IWRC9CUarmFsk/GedDLMHnE=; b=uUBo1VmmA3V9eK
	QNS6pMBJlIXrgEKuvJq/zz50WDQtI2VoVLE1jEdY5ONbDHm0sKZIeZ2TL4goElo1Se0qGmqJ28kOy
	EfguRYa22ehq4DXT4d1GL2zgrEGGqULDYdJPR7FhAv1DxlEGjTz2XV0vpk1e0MMUl+6A84yQt3fx8
	VfVDke5N44S5sRY7fr2lchnGpywx6DsK1AmvweJ6Y/Ja6piqT3tY2+bAAAxMocR6jEKgnmOkR0QkR
	t2Dx2KvwHkVTqMFQyTLziRzQSZG8Mt94h7nsTYfVMWQbLhVwQ5unJS+BVwxIjOcUQSd/xFkrh9Qib
	BWx+4nSsUFN15tInWpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQOZ-00000001ppF-42Y9;
	Tue, 04 Jun 2024 09:23:56 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQOU-00000001pmK-3gCG;
	Tue, 04 Jun 2024 09:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717493031; x=1749029031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0IbfNLKc2fhB1rZQPt8kaw8xS3yUglfykrxml/F/h1Y=;
  b=RqnJ3maGbPyD3sHkccMzMAkwAlcck59M3VUUZdcAlhuMSq3mnA8zbGd0
   /pQDYDJbyOia0t3Oh5LIPHyJZ8jmHmQzWHJLotpQfFXKTCCE3bjIidCMi
   PddDhHWbVm9YNgi2N+KkbX0X3IJa/9PPVe0kW1ajfcE0mQA+ids0DsTZN
   L1LBnzNr+YiuzhQtBaZGoqmoyFrgRmHsTehdxveSXKWzocoKnnsnc+uvi
   w6F1zw9RX/xEO0/UDtylDjr3Z76BbkK3ge5Hind2qUaGaow4Sif6XEhBq
   a1yILuPVQSk1hrKjAB+H0Ritbty8bUZVzBl+QCIrprtY7vGHahUvfXB1k
   g==;
X-CSE-ConnectionGUID: OPGpvNOtRXSo8+NCcF3Rfw==
X-CSE-MsgGUID: eHqBuhLjRWWb53F/Rf7XaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14218168"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="14218168"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 02:23:44 -0700
X-CSE-ConnectionGUID: VVvUL15DRC+K7N8LVcOeJw==
X-CSE-MsgGUID: aPqZVL8ETXKSpnpl7alWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37262347"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2024 02:23:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEQOI-000Mzn-2L;
	Tue, 04 Jun 2024 09:23:38 +0000
Date: Tue, 4 Jun 2024 17:23:14 +0800
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
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
Message-ID: <202406041738.6Dy1cRih-lkp@intel.com>
References: <20240604055431.3313961-2-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604055431.3313961-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_022351_247454_5AF142C4 
X-CRM114-Status: GOOD (  12.78  )
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
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240604/202406041738.6Dy1cRih-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406041738.6Dy1cRih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406041738.6Dy1cRih-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/meson_saradc.c:1262:10: error: 'const struct meson_sar_adc_param' has no member named 'vref_voltage'; did you mean 'vref_volatge'?
    1262 |         .vref_voltage = VREF_VOLTAGE_1V8,
         |          ^~~~~~~~~~~~
         |          vref_volatge
>> drivers/iio/adc/meson_saradc.c:1262:25: error: 'VREF_VOLTAGE_1V8' undeclared here (not in a function)
    1262 |         .vref_voltage = VREF_VOLTAGE_1V8,
         |                         ^~~~~~~~~~~~~~~~


vim +1262 drivers/iio/adc/meson_saradc.c

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
