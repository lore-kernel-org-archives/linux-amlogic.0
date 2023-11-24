Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A22FC61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRNmMC0VU/mpZyV1aTyY9tdHcMd7+L7ZxW7unX71ZKw=; b=i0ZCBaqAjElF4r
	20vv6m0q/a3obKySkn5BkhdJ952beZVxvp8PeeVsWEwM0RrlLX1tAf1mYtR2lDAtuYmT3YB9z2t/X
	JTAbmAPiHgfrqJOnf5rhVNfjut2thlstG6s77ExaJwFMX8Ijh7Uw4MAVwr144pdyPpMQ5yrjKHD7p
	L6d5ceGiLQoA0r8dWoVs1+HVg66HG1foIhRjql9AnnspXaIwS9pqe28tjmmixehLwPcUBkqpDrmEk
	0tiKt9Eh8/fQyiAfN8ussyjyl9cXkeo8ZUl973ORxX2WDCaNmndcpiZHPZ9TRktYK5EkaljgRt1v3
	CEW+QwfPiH6TGxyISx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6YLC-007ZDk-2H;
	Fri, 24 Nov 2023 15:43:38 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6YL9-007ZD5-0k;
	Fri, 24 Nov 2023 15:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700840615; x=1732376615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mQWqT7UORe3gKuZXf27y7FIWWgaUuPEuIgNSnzTF6y8=;
  b=JCabUQ0KVM+taXdycFeBCIND2dz7Io3OyqEBfdQe2FBzVundop81qdje
   Cn9WEdkAbf5kDI5G1+RPV5Q/Vzv2lT/euIQjNNTbw5DGYdZkSSpSG0fUd
   qp2sNl8P4JwhLpd74EXwPgIDPIdemQefH9vLMcFnC42HUIz+R4hQTdZCA
   8FP62BFffxjKjK55jMf7pmDbD3pKMY5McqF85m1bLF74GYoJkRAM4yLTW
   4cENcuMeB435+oj8/ETtrAbe3xDeX8TiemZoIZVfx/4xdwjWH3kfzmkgf
   Yuug9rFXA1RGcMUVBZPdCqF2rVh/D6Lf1yUzAb6RjDkuPjjRsNSIrETju
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5662506"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5662506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="16005201"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 07:43:28 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6YKz-0002z4-1d;
	Fri, 24 Nov 2023 15:43:25 +0000
Date: Fri, 24 Nov 2023 23:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] soc: amlogic: Add Amlogic secure-monitor SoC
 Information driver
Message-ID: <202311242104.RjBPI3uI-lkp@intel.com>
References: <20231122125643.1717160-5-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231122125643.1717160-5-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_074335_331577_7697315B 
X-CRM114-Status: GOOD (  12.75  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.7-rc2 next-20231124]
[cannot apply to arm/for-next kvmarm/next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/soc-amlogic-meson-gx-socinfo-move-common-code-to-header-file/20231122-232150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20231122125643.1717160-5-adeep%40lexina.in
patch subject: [PATCH 4/5] soc: amlogic: Add Amlogic secure-monitor SoC Information driver
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231124/202311242104.RjBPI3uI-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311242104.RjBPI3uI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311242104.RjBPI3uI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/amlogic/meson-gx-socinfo-sm.c:21:
>> drivers/soc/amlogic/meson-gx-socinfo-internal.h:48:3: warning: 'soc_packages' defined but not used [-Wunused-const-variable=]
      48 | } soc_packages[] = {
         |   ^~~~~~~~~~~~
>> drivers/soc/amlogic/meson-gx-socinfo-internal.h:26:3: warning: 'soc_ids' defined but not used [-Wunused-const-variable=]
      26 | } soc_ids[] = {
         |   ^~~~~~~


vim +/soc_packages +48 drivers/soc/amlogic/meson-gx-socinfo-internal.h

2fed8e24da3985 Viacheslav Bocharov 2023-11-22  22  
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  23  static const struct meson_gx_soc_id {
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  24  	const char *name;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  25  	unsigned int id;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22 @26  } soc_ids[] = {
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  27  	{ "GXBB", 0x1f },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  28  	{ "GXTVBB", 0x20 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  29  	{ "GXL", 0x21 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  30  	{ "GXM", 0x22 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  31  	{ "TXL", 0x23 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  32  	{ "TXLX", 0x24 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  33  	{ "AXG", 0x25 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  34  	{ "GXLX", 0x26 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  35  	{ "TXHD", 0x27 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  36  	{ "G12A", 0x28 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  37  	{ "G12B", 0x29 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  38  	{ "SM1", 0x2b },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  39  	{ "A1", 0x2c },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  40  };
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  41  
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  42  
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  43  static const struct meson_gx_package_id {
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  44  	const char *name;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  45  	unsigned int major_id;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  46  	unsigned int pack_id;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  47  	unsigned int pack_mask;
2fed8e24da3985 Viacheslav Bocharov 2023-11-22 @48  } soc_packages[] = {
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  49  	{ "S905", 0x1f, 0, 0x20 }, /* pack_id != 0x20 */
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  50  	{ "S905H", 0x1f, 0x3, 0xf }, /* pack_id & 0xf == 0x3 */
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  51  	{ "S905M", 0x1f, 0x20, 0xf0 }, /* pack_id == 0x20 */
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  52  	{ "S905D", 0x21, 0, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  53  	{ "S905X", 0x21, 0x80, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  54  	{ "S905W", 0x21, 0xa0, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  55  	{ "S905L", 0x21, 0xc0, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  56  	{ "S905M2", 0x21, 0xe0, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  57  	{ "S805X", 0x21, 0x30, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  58  	{ "S805Y", 0x21, 0xb0, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  59  	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  60  	{ "962X", 0x24, 0x10, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  61  	{ "962E", 0x24, 0x20, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  62  	{ "A113X", 0x25, 0x37, 0xff },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  63  	{ "A113X", 0x25, 0x43, 0xff },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  64  	{ "A113D", 0x25, 0x22, 0xff },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  65  	{ "S905D2", 0x28, 0x10, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  66  	{ "S905Y2", 0x28, 0x30, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  67  	{ "S905X2", 0x28, 0x40, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  68  	{ "A311D", 0x29, 0x10, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  69  	{ "S922X", 0x29, 0x40, 0xf0 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  70  	{ "S905D3", 0x2b, 0x4, 0xf5 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  71  	{ "S905X3", 0x2b, 0x5, 0xf5 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  72  	{ "S905X3", 0x2b, 0x10, 0x3f },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  73  	{ "S905D3", 0x2b, 0x30, 0x3f },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  74  	{ "A113L", 0x2c, 0x0, 0xf8 },
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  75  };
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  76  
2fed8e24da3985 Viacheslav Bocharov 2023-11-22  77  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
