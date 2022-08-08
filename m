Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB2C25B0C
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Aug 2022 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAjBhPhBu0YJkr9xZUzz5IBfwZcDL0gS/wdDhdjX2BQ=; b=ANITkVpOv74N+W
	LQcY69S7ujo1zN41wIZ5SzwXgO8+qjv73pNPpgruE+rAjKkLdrmUlG6oXCT7Dspbm6ld0blBYRYxN
	jWpM0rzvDcKd/6NFvNzSN4JzSK+ANC+rVsdjBMwi9Dp/Ub/rxMhCcuhxAmMtNpSRb4EGCOvmHHqmv
	xwkfYfm1m3Lmay416J/MqGrL/PzxKMhFQAvXOF3h7asK/HC0iV/5VYb7Helf7mwABKcFsYLuEPHF6
	jVan8iNsi4Cc3xEw/t9qaM/QeRFu3Fp7AVAi9ZjrCRRo/X+ePRNmYNF562ZNp02uaSeODBO517pi8
	sFwAnO5/loaOgkkaRCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2M8-00Dtng-Ds; Mon, 08 Aug 2022 12:59:40 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL2Lx-00Dtit-2P; Mon, 08 Aug 2022 12:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659963568; x=1691499568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SM3M98v9UuODC8UzTTQHTkKNyrbmYERVbOpPcEz1zWg=;
  b=Qc63oRHRhBFWXYYrhc3WLNLglhGZLTIp/tYfrDidjkLKAFNrj9gooOYQ
   0SviEDV0GTcgMd2hIgyC+OM2a3ndyEhsXqII+QQxsdiGZBHgE6Cr/cPfB
   d1raLGJGHigV69z3LP4ACvUWgIpCo2d1yBW59NFkfGHRtxsbmMvnNyCG7
   zy1Tv4btenfHOw2QyVWVy16Rz1pzHJ2+PRQr+hqvtLnJVi/emX2mZZnF6
   g48h0THQDmxKGckPeniwrzqOB8z7AsckuIAvqv3GI/vk+zswwdmd41k9c
   15jp4KWFLZChrf7dxrxDVp+FU0Hh+MHbkDmOIr30VbfgW8QWaLmQjwVM2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="290591483"
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="290591483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2022 05:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,222,1654585200"; 
   d="scan'208";a="554911922"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Aug 2022 05:59:24 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oL2Lr-000MHx-2l;
	Mon, 08 Aug 2022 12:59:23 +0000
Date: Mon, 8 Aug 2022 20:58:35 +0800
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
Subject: Re: [PATCH v4 2/4] docs/perf: Add documentation for the Amlogic G12
 DDR PMU
Message-ID: <202208082004.zjwtaGvN-lkp@intel.com>
References: <20220805071426.2598818-2-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220805071426.2598818-2-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_055929_167561_B8000620 
X-CRM114-Status: GOOD (  11.96  )
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
[also build test WARNING on arm/for-next arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v5.19 next-20220808]
[cannot apply to xilinx-xlnx/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiucheng-Xu/perf-amlogic-Add-support-for-Amlogic-meson-G12-SoC-DDR-PMU-driver/20220805-151704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/perf/meson-ddr-pmu.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

vim +2 Documentation/admin-guide/perf/meson-ddr-pmu.rst

   > 2	===========================================================
     3	Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
     4	===========================================================
     5	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
