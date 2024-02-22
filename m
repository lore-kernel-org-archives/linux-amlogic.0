Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64988C48BF8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMJVKTl2mbkmIInMH1YEbGR/uzWnoP13sRKty28IHkg=; b=4vATvuLhj1XQSK
	5Ge6ztXmvrUx9GQ9w+7BNERIpy0LAufB7I0KoOhuLV5FnUBf++IOF5xyTERp4FnLlCJrUiuHGywXF
	BzQNjSPb5PDGm55KMuqLYP8R5kCvoCTxZVg2KLe7dNpKbOTelF9bsqs1qGhZKNXBOwiomHtW8U0Rw
	W3HCEeNqc+MCBNVwIfhf5hldP5O6kFgOLPX5aCJTd2RhweqfHKeaqLK4zQX8Ji8UI1OnifCuFeTGF
	+6+WHl5o3Mlc0seKUf3LBAwEiYj5pg4yzXBWosbMs0ND+F6B7+NSHDFysPsmpvz5WNxpBI9beNCUH
	3JLDxk48Gp0/Jr6LBA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3bB-00000003pTQ-09Qe;
	Thu, 22 Feb 2024 07:34:29 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3b8-00000003pSi-1kta;
	Thu, 22 Feb 2024 07:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708587267; x=1740123267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIjjRASZQuOpPiypkZ4z1TTvkn4Ti9H93DmPRe/Af5Y=;
  b=feBHFOCYxS/5ir6rlEBBuylTno07f8b2pMn7aC+TPqBustV5pQLbLwsy
   jGmJIw/NN2N2mBFCQbIIs/AtM/GAoz8JUGPcDJnVEiPwMQrayayW0zgAz
   Lhvqzlx0Fa7Mrr1HrHJ+CroAMR6m0ESk+gA8rIE7ivAYmLj+4v9yak8+w
   bZ/GrPi+UfWZilLzeM6J6b/uM4fxm+CSMNM8lN5xXJaS7uBK+6+H6cbrZ
   SP6uTTakqmdzQbinGpWioT3TqiUG550KBSVrNR0nE+NmJgfwskwCBY+56
   B3a6rRMLka9J+aneAH8yyzNLoW4Aa6nBGivFFnTA8p/nr8EssUimNYQ50
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2657046"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2657046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 23:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5726078"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2024 23:34:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd3b1-00065n-1s;
	Thu, 22 Feb 2024 07:34:19 +0000
Date: Thu, 22 Feb 2024 15:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
Message-ID: <202402221557.ELxBYVKH-lkp@intel.com>
References: <20240221143654.544444-3-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221143654.544444-3-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_233426_504118_58E22296 
X-CRM114-Status: UNSURE (   9.81  )
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

Hi Viacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/soc-amlogic-meson-gx-socinfo-move-common-code-to-header-file/20240221-224803
base:   9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
patch link:    https://lore.kernel.org/r/20240221143654.544444-3-adeep%40lexina.in
patch subject: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC Information driver
config: xtensa-randconfig-r071-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221557.ELxBYVKH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221557.ELxBYVKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221557.ELxBYVKH-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `meson_gx_socinfo_sm_remove':
   meson-gx-socinfo-sm.c:(.text+0x88): undefined reference to `meson_sm_get'
>> xtensa-linux-ld: meson-gx-socinfo-sm.c:(.text+0x8c): undefined reference to `meson_sm_call_read'
   xtensa-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `meson_gx_socinfo_sm_probe':
   meson-gx-socinfo-sm.c:(.text+0x1b8): undefined reference to `meson_sm_get'
   xtensa-linux-ld: meson-gx-socinfo-sm.c:(.text+0x243): undefined reference to `meson_sm_call_read'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
