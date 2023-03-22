Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D5CC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 20:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gI7sk0m5B6b7rGd8QROYsjcYvglZnivuZCsjI1z5fBM=; b=v/LG0j4SlBKyls
	bTawPsx1TDO7y/Hh4pfW8rR/sHOPuw/MGnog8ValmmIFFx3JOHcyS8S9NGgjgJeB4eH6erj06+/ex
	eOBjFp/0YZdZOOyqAjftxdO6hqxArVYVAM0zlXkmEDWva1MdI6hXY3X4qUUtgSXo1idwz7VUU6etK
	4kCMuEiuDEqF8kV5q5KMxiy9d2Apvp8+GjH2v4bI1uoE2Ez0CyzvGQ+y1Voopa1wGXpnNFrSTGQjn
	2OBazd+iA0/wtfhC82qBhybEgPvgp3w+Urx7miFS0kq7Dg9gQtA+Wjv4QS+fiRqeJ+vHnRMly0pcL
	Stp5KiW5nz7E2kwxl/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf5QP-00HOJd-1K;
	Wed, 22 Mar 2023 20:51:13 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf5QK-00HOGy-1j;
	Wed, 22 Mar 2023 20:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679518268; x=1711054268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uabzrRActvWORDWX39WS5JMj9IpucxbkVMI4llVLkMk=;
  b=bsBwK+fr3/fx8NFRK99wQwbsqMgJbP2nhznlBHLa0fKDJQjpMS0NYGz0
   Pw01OJEiyfQtctBM5Kfb8eisrAvWDCVUiaU8wYVXOufAyT+bqVVWfFMen
   sEqTvECSrO5FBvUc63ZfqegWQHdr4uBg3dVWGwXp05DJqNKJCRsSBavB4
   fmv3vr5XAVrcl3WnARSfqbYzepWNAavyCJm4owAhsUkpLXarIxlM4exH2
   SQpPAyTh568uQACcjchrJG8rLgVTIPQkVIe6edpvEGCUklIeQ/Y5W4aDb
   +u3e3v5iAqhWBqtzkQwlTw6ukWuZ57lUziz47DDKM4pUI3EHCRITSxpTV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341688259"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="341688259"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 13:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682055417"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="682055417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Mar 2023 13:50:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf5Q6-000DeK-02;
	Wed, 22 Mar 2023 20:50:54 +0000
Date: Thu, 23 Mar 2023 04:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, Martin Kurbanov <mmkurbanov@sberdevices.ru>
Subject: Re: [PATCH v1 2/2] spi: add support for Meson A1 SPI Flash Controller
Message-ID: <202303230442.lGIrV8PZ-lkp@intel.com>
References: <20230322150458.783901-3-mmkurbanov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322150458.783901-3-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_135108_625169_83C24D45 
X-CRM114-Status: GOOD (  14.48  )
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

Hi Martin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on broonie-spi/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Kurbanov/dt-bindings-spi-add-binding-for-meson-spifc-a1/20230322-230744
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20230322150458.783901-3-mmkurbanov%40sberdevices.ru
patch subject: [PATCH v1 2/2] spi: add support for Meson A1 SPI Flash Controller
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230323/202303230442.lGIrV8PZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7d8d54cc0b563efb979caf17507b29c0bb3efde0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Martin-Kurbanov/dt-bindings-spi-add-binding-for-meson-spifc-a1/20230322-230744
        git checkout 7d8d54cc0b563efb979caf17507b29c0bb3efde0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303230442.lGIrV8PZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/spi/spi-meson-spifc-a1.c: In function 'a1_spifc_read':
>> drivers/spi/spi-meson-spifc-a1.c:204:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     204 |         val |= FIELD_PREP(A1_SPIFC_USER_DIN_MODE, mode);
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +204 drivers/spi/spi-meson-spifc-a1.c

   196	
   197	static int a1_spifc_read(struct a1_spifc *spifc, void *buf, u32 size, u32 mode)
   198	{
   199		u32 val = readl(spifc->base + A1_SPIFC_USER_CTRL3_REG);
   200		int ret;
   201	
   202		val &= ~(A1_SPIFC_USER_DIN_MODE | A1_SPIFC_USER_DIN_BYTES);
   203		val |= A1_SPIFC_USER_DIN_ENABLE;
 > 204		val |= FIELD_PREP(A1_SPIFC_USER_DIN_MODE, mode);
   205		val |= FIELD_PREP(A1_SPIFC_USER_DIN_BYTES, size);
   206		writel(val, spifc->base + A1_SPIFC_USER_CTRL3_REG);
   207	
   208		ret = a1_spifc_request(spifc, true);
   209		if (!ret)
   210			a1_spifc_drain_buffer(spifc, buf, size);
   211	
   212		return ret;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
