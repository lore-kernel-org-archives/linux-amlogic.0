Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A42C5B543
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jun 2025 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0tQ1od/O2HszLJHK8bgZYH1gNgAmSOl5ONqIflM8mI=; b=TOyR8gK61+sXO7
	AjIkaj0TdtarvSlLmNJkxTV3oGPFL+D8sKLU/hswJ1T3rMDgIFZC26Y1O/ncA3/E9ceVY5xZqwfxa
	cL4/sPabC4PMldMuTzZgs2um2iTU1UuDaTEsWHKQXhjx8BmvEwKKVSfPx1lOQjk44lEjPrU9fexdZ
	oukginsYvpTE66J/BAxua/B3xXr/4z0uAz//0CSK1Teof1fD3Q06QPOoGFoS1GPDj+BUoARUHnqIA
	VHCKwjbUnfOYNurUUtDzZwniXxXdwWtn/RzEUUErWJxfSSLz4Qm2HLI78rO0pvD7V1n4xVpkXSv/a
	nXOa1Jwc2LiUy8NTE9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6AE-0000000F5FK-3iJP;
	Thu, 05 Jun 2025 08:41:30 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN6AA-0000000F5DM-0C69
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Jun 2025 08:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749112886; x=1780648886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/44C5CqYHFZ86mXVCKDNXa2qbNMRYDPJOqnauhNVz5U=;
  b=WgqVJ2ietaLfHSxmSox7H/VQkkEuzUe5WPV0/saID0BHPLaJuGDnX3/R
   OTV/0L2FB3mhGl43gGU65hw/gi2xigP/ofgE6p+KZ8pCPZTU4zR4kgy64
   /xEvwyPTi0Eo4OPreNahxM+cxKSVaMzDbfzNWmV+SbXRiF85ItVHtQ1NJ
   II7fB2ssIY2gMvPBY6v4pMBSDJdm8p5xPBjUKMxyERfFV99d96hFNr74E
   yQNnYJyes71WicePP7bWjIv/lhP/EPpc5prS4zY3nidphu3a+hfa02bTj
   KYxhmsuhsd/Lor33Byqa0DTZe+OFBikXgERo9tFm9a+Q4QNcgWYWNRnct
   Q==;
X-CSE-ConnectionGUID: CgsrB3RqSweMkmQhgNjYIw==
X-CSE-MsgGUID: 3lL35rPtTMmZdyvr1b3jmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62576317"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="62576317"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 01:41:24 -0700
X-CSE-ConnectionGUID: 981nQ/Z4S8CqG8gZXQhDKA==
X-CSE-MsgGUID: Gq/ntPpHRQaRWTfUoYYq2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="168621842"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2025 01:41:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN6A3-0003v3-0Y;
	Thu, 05 Jun 2025 08:41:19 +0000
Date: Thu, 5 Jun 2025 16:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] spi: Add Amlogic SPISG driver
Message-ID: <202506051609.8GLrHoaR-lkp@intel.com>
References: <20250604-spisg-v1-2-5893dbe9d953@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250604-spisg-v1-2-5893dbe9d953@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_014126_105968_C086681D 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 57cf46cd1fe351846e1b065ca9546eef66675ecd]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-spi-Add-binding-document-of-Amlogic-SPISG-controller/20250604-154302
base:   57cf46cd1fe351846e1b065ca9546eef66675ecd
patch link:    https://lore.kernel.org/r/20250604-spisg-v1-2-5893dbe9d953%40amlogic.com
patch subject: [PATCH 2/3] spi: Add Amlogic SPISG driver
config: microblaze-randconfig-r123-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051609.8GLrHoaR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051609.8GLrHoaR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051609.8GLrHoaR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/spi/spi-amlogic-spisg.c:929:24: sparse: sparse: symbol 'amlogic_spisg_driver' was not declared. Should it be static?

vim +/amlogic_spisg_driver +929 drivers/spi/spi-amlogic-spisg.c

   928	
 > 929	struct platform_driver amlogic_spisg_driver = {
   930		.probe = aml_spicc_probe,
   931		.remove = aml_spicc_remove,
   932		.shutdown = aml_spicc_shutdown,
   933		.driver  = {
   934			.name = "amlogic-spisg",
   935			.of_match_table = of_match_ptr(amlogic_spisg_of_match),
   936			.pm = &amlogic_spicc_pm_ops,
   937		},
   938	};
   939	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
