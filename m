Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D9C678D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZXod4eCU6LUQgqH+VbW6CGgNqkkMOaxgX5+RpTY9EY=; b=IZBtfrVX+3HiVW
	7iqdOZHm9jCnVlw7jxh93g5esfFOxHFTolDyVbfBY1WZGYmG60saoMIOc7ci6gYjYlfeYoclG0Gtz
	IpYgJfHoP+Sk8PjJNHwtXdDd16A+95x+iceq4JV3NmpYjGcrlDf6paMSSCJPgL0dtCYzrGDfx9aAR
	EQW90TtyEwEPGCLiPZTtbeFW+UOjwo33/qkh+VZigJoTJcuv5DizEJEpJDNSFh+2AbCMw3rOVgLa5
	0+HLyrnR3MDt2HPQ6nfeHd+MnbsIDPWmpl24lF4nP/r/lKS894kD8uAtFDz4ZeSoqFzimikCAIVZe
	zsu2jt5+L3FDvmjhJq1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXflX-001afT-0Y; Thu, 02 Mar 2023 10:02:23 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXflT-001abD-G2; Thu, 02 Mar 2023 10:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677751339; x=1709287339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wXJoqjlMwyT50ByTps6K1QT9wCiNFa9WZdbp0ek08mI=;
  b=LWjhlu0pPkau09Xww4C0DXNWubpW0qBb+ToZz5iQvyHKknrU9KUjVt/R
   SIw8aN4JOF7J8dvgQ7EM7LzvCaCcC7OWFoHCz9cYOzRjDYs8fv+KexEvK
   kfnofGqR3pNfRyvIdzFXDsEdGn63QotVwEng+juEvn6u9J0kvVKpVFr6d
   xGUTsnbMFRn/mPARWGqEe5TangYPCrKFn0MdtoRyOL3HDKW/P1tjIVVuJ
   u9DzGxYTJSBKSw6DjeleRpIs1XFOBxuAeMaa1zM0sVw3Pfank5YOeX3N6
   ST44H/PNI6Oy/xAYUIj+dsgVCKCVWXrJxl2KNl5yKWobuYgOasVcyhtSe
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="336178077"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="336178077"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 02:02:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="739005512"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="739005512"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Mar 2023 02:02:10 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXflK-0000OU-02;
	Thu, 02 Mar 2023 10:02:10 +0000
Date: Thu, 2 Mar 2023 18:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
	jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com
Cc: oe-kbuild-all@lists.linux.dev, jian.hu@amlogic.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: Re: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock
 controller driver
Message-ID: <202303021725.QbK36cES-lkp@intel.com>
References: <20230301183759.16163-3-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301183759.16163-3-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_020219_614415_7B876683 
X-CRM114-Status: GOOD (  12.48  )
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

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Rokosov/clk-meson-add-support-for-A1-PLL-clock-ops/20230302-024110
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230301183759.16163-3-ddrokosov%40sberdevices.ru
patch subject: [PATCH v9 2/5] clk: meson: a1: add Amlogic A1 PLL clock controller driver
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021725.QbK36cES-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7f065968cd67b07045e9dda1d9b8fabb06f2100d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Rokosov/clk-meson-add-support-for-A1-PLL-clock-ops/20230302-024110
        git checkout 7f065968cd67b07045e9dda1d9b8fabb06f2100d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021725.QbK36cES-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/meson/a1-pll.c:13:10: fatal error: meson-a1-clkc.h: No such file or directory
      13 | #include "meson-a1-clkc.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +13 drivers/clk/meson/a1-pll.c

  > 13	#include "meson-a1-clkc.h"
    14	#include "a1-pll.h"
    15	#include "clk-regmap.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
