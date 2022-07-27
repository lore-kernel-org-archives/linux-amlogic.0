Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DEEC04A68
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CY+7kuI4/xiUTZA51NPzq9YsUz/7DPCkI2aJi2ylHiw=; b=rwBiYSq2cLMC+F
	H0Fb93jVRTw2PgbN6F6gzyl+hs/WsJ9n+XshphKNfctUIEXmbYDoN+hgOtOl25xtHB0aFSYI44Vhd
	UMk0lZuWdBynA5XEmac0K4i8c0c93aQDelxhP5Zve6QAq7EuTQ/+TH3j6a7MhlJHU+TdD6CIOLnmp
	fa/MQYtSEJgx+PLT+3X2oHnJrfao1zCFbUDH656bMzDztI6Qbai5iib+MhUDXhYAnfGMHbdGzdK5q
	3Cnxj7vUtgUKDHCDKP0SMSpD/MTxpHw7qItXAHWrRVsI1dMjR5I6s4+oh6QblbFMRabQkfr5DWd8J
	OGVa8dga1j4ziWjSaYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGh2l-00E0EF-Q0; Wed, 27 Jul 2022 13:25:43 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGh2Z-00E06b-PG; Wed, 27 Jul 2022 13:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658928331; x=1690464331;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yNoz6gUDdCaF3+5NR4n7n9yqzCM4pJ5iaqzLtMQ2SD4=;
  b=EBunxZc0G5eoO8sqJ8n6df4kI/+e5gxIRPuLzjm4/71hfsNVhqET9muB
   Ijl9WCB+4lmyHwSKXA55qyUuF5JUiGFKA5CkD0MlpSKxv6cV0n4XxGTSM
   qrMFoDGJ1HlUE4pQXOGOpVZQMREtcEoX8YXYbkrXHzKcTDFIlaT61rrN5
   w4LDEYPRVVUbS4o03WadToYlYkl8uVB6TWENLYqMNS9OJ1IldhDvsq70R
   fGEQe9XRG5ahlqXHwOQU+rbFS+RA6QSIiuWLYbS8zU7bEm/cOpscu6rVf
   xsmZPcgNm9mpRzqufcytY7Ps4//qrurUBsTMW2TO01A70RGUBioy3f2Is
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="267998684"
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="267998684"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 06:25:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="668331743"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Jul 2022 06:25:23 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGh2R-0008k2-0b;
	Wed, 27 Jul 2022 13:25:23 +0000
Date: Wed, 27 Jul 2022 21:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chris Healy <cphealy@gmail.com>,
	Jiucheng Xu <jiucheng.xu@amlogic.com>
Subject: Re: [PATCH v2 1/4] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Message-ID: <202207272141.rn8Zx4Az-lkp@intel.com>
References: <20220726230329.2844101-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726230329.2844101-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_062531_927173_E57D7DC6 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Jiucheng,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next soc/for-next linus/master v5.19-rc8 next-20220726]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiucheng-Xu/perf-amlogic-Add-support-for-Amlogic-meson-G12-SoC-DDR-PMU-driver/20220727-070511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20220727/202207272141.rn8Zx4Az-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/be1236818a5d0ad61b0f9ecbe5f03b9e63f99365
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jiucheng-Xu/perf-amlogic-Add-support-for-Amlogic-meson-G12-SoC-DDR-PMU-driver/20220727-070511
        git checkout be1236818a5d0ad61b0f9ecbe5f03b9e63f99365
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/perf/amlogic/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/perf/amlogic/aml_ddr_pmu_core.c: In function 'event_show_unit':
>> drivers/perf/amlogic/aml_ddr_pmu_core.c:208:38: warning: variable 'pmu_attr' set but not used [-Wunused-but-set-variable]
     208 |         struct perf_pmu_events_attr *pmu_attr;
         |                                      ^~~~~~~~
   drivers/perf/amlogic/aml_ddr_pmu_core.c: In function 'event_show_scale':
   drivers/perf/amlogic/aml_ddr_pmu_core.c:218:38: warning: variable 'pmu_attr' set but not used [-Wunused-but-set-variable]
     218 |         struct perf_pmu_events_attr *pmu_attr;
         |                                      ^~~~~~~~


vim +/pmu_attr +208 drivers/perf/amlogic/aml_ddr_pmu_core.c

   203	
   204	static ssize_t
   205	event_show_unit(struct device *dev, struct device_attribute *attr,
   206			char *page)
   207	{
 > 208		struct perf_pmu_events_attr *pmu_attr;
   209	
   210		pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
   211		return sysfs_emit(page, "MB\n");
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
