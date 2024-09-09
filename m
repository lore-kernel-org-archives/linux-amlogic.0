Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7538FECE577
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2024 16:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91KTKcZA4B3s4Wt5OQt93hTxqtvSXxwQmHl7WhqTrMM=; b=keIRfTcdBEw1d1
	8ynluEVWv+P3VDm8npc9B0CwqaJt8frdzV6trGE5+AaM3SmJE9sNDKyF4AiSYzvGWybjrY/lMMUcB
	YR1L9xbq17c3wCv5/WkdxPAPEQ58D+5SElRIdAjQ6wPrFfR3WFUq4epUPMGIQJQQH6FP1TDP7a7yK
	J1ymvKfovtn/dXsemB+bF1nMBEI9fAQ++m1WUgABp8z1ZQNznZmzoD9jz0H08hA9H28zNzEgWHKXX
	npOVYlpOBMVgXq+Mf5wEU3GHzzwBpQuJpZLdke7e4NKv08fK/TWQQuAKQLOCgvLPH3UYyGHp1bL6/
	8yEToO+yhmVkrCwZSpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhVL-00000002iIk-2l4s;
	Mon, 09 Sep 2024 16:44:43 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snhUJ-00000002i4S-2MIO;
	Mon, 09 Sep 2024 16:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725900220; x=1757436220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SPDkgjp1iESRpLEN0olg4YNX8g5J0heZpCZbWFhRj84=;
  b=jjvZ3oU2AVACOmGobPyb5n7/3ZkXQNeSQahJzmTbK1Vj7gPxRJSV0PAF
   x0x2yL8ul+2TFfNr3ysL7a2gNb4xUv2B5WbKCF5fYVQuyvZ7P8fT1chm5
   33N3PDrxNNJIS9NS6EmUdY8MiHSIFHa06jajhF2oVJ6cS5hp5YVvA+sda
   Ecgobrn46qI1yaESbR8ONANXVDy8QaRhas0MGVTm+hHXQJAMcGE/dff0Z
   HVCMJE+YekiwXQoSTARa8qzkhOrULoeU3KFQzFo9+W1PDz5UU64F51R8C
   tEAF1747quZZ0hB0R+LFI5YOSOLw9LtxpqEGX0UOpSnEeTmyfeENW5NrV
   g==;
X-CSE-ConnectionGUID: S1BgVoKlSDKCN1/grIVPXA==
X-CSE-MsgGUID: MmXNK0PwSx2LGIZkE1d1kQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35989349"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="35989349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 09:43:37 -0700
X-CSE-ConnectionGUID: DWYCUyg7QCmuCnaxSp+y9A==
X-CSE-MsgGUID: m8k4tGKdSOWS4YW9oVOxWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71139328"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Sep 2024 09:43:34 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snhUB-000EzC-31;
	Mon, 09 Sep 2024 16:43:31 +0000
Date: Tue, 10 Sep 2024 00:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
Message-ID: <202409100033.EPfBtwfK-lkp@intel.com>
References: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_094339_634067_03AE98B2 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Hi Jerome,

kernel test robot noticed the following build errors:

[auto build test ERROR on 487b1b32e317b85c2948eb4013f3e089a0433d49]

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/reset-amlogic-convert-driver-to-regmap/20240906-213857
base:   487b1b32e317b85c2948eb4013f3e089a0433d49
patch link:    https://lore.kernel.org/r/20240906-meson-rst-aux-v4-9-08824c3d108b%40baylibre.com
patch subject: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
config: parisc-randconfig-r123-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409100033.EPfBtwfK-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o: in function `meson_reset_aux_probe':
>> (.text+0xc): undefined reference to `meson_reset_controller_register'
>> hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x88): undefined reference to `meson_reset_toggle_ops'
   hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x9c): undefined reference to `meson_reset_toggle_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
