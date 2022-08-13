Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B1EC25B0F
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Aug 2022 00:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BQo9MYwAwkkZ32nVVjC5npDvW17HwclywVyDvUGW+gM=; b=JghD/XdGO0jBWM
	Z39iykJkS78PYP+hMoyaq7DYUIHlxvbKrr2AruuGVQW8hlyBw0RjNndO1mwvM/2PkQS7mWY1IJUFo
	m2BU0Cicge4Yp92xTl687oIVSfNzebDXGpnqZbwc9r/OgaCeVa6Ts3/yHgBKCwN4bUYb+D+e2xQY4
	VBkIxJ1B+PBRM5b7XCgXr4o03pjQghrAEFcXqilBjq910B0YZXzzIhpyNDIRzVgRYVC3oesNZ9TZ6
	5thdTiE4/hc2LXF68a9WvmyEWmTJqCZUVe23+UkxP9+ckt6i/K/ajSIvyk/0RPxAPdJrI/rVzuMeS
	9+oVW+5uGO811b9X3R8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMf0l-001DB9-Vo; Sat, 13 Aug 2022 00:28:20 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMf0a-001D57-Io; Sat, 13 Aug 2022 00:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660350488; x=1691886488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frBjoWGV9rUb+TpkBoZ5wYyBHHGTi0Jle2u0kUeBPvM=;
  b=KzzHpIpP2pOOhKQeSLEplZdWKHCvCKv54WsK1hTWp9ZKn/suUFcAnLYg
   SVRW9L9kvNcsY9rt9nIzaOlF1oItEClx1c2fRygvQhnAaaDVhRRXD3fy0
   6EETycT8k7O7UMTab8ttjbyuA6jVJkQWbunPvxcR2dwlLk9V4/pIaH5Nh
   27v06BfUG7TwWgA22yka0yda+/LMaEkO2r+pMNPRAo2nJ/bMPLxJGP2dt
   nw6UDrzskkfdNKxbc1IMJ571ue/8AIcJ9fb3L+W8UEl525K7Zeu0EPsIc
   rFXkKG+wM4M8dXywr8doUAeqxTAiLBCvkdc2WIfj9iaIbdq1XfIylToFs
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="289282251"
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="289282251"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 17:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,233,1654585200"; 
   d="scan'208";a="639075429"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Aug 2022 17:28:01 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMf0S-00016Z-1T;
	Sat, 13 Aug 2022 00:28:00 +0000
Date: Sat, 13 Aug 2022 08:27:00 +0800
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
Message-ID: <202208130847.EyX7NzAD-lkp@intel.com>
References: <20220805071426.2598818-2-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220805071426.2598818-2-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_172808_786449_6C04A27B 
X-CRM114-Status: GOOD (  13.62  )
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
[also build test WARNING on arm/for-next arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v5.19 next-20220812]
[cannot apply to xilinx-xlnx/master keystone/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiucheng-Xu/perf-amlogic-Add-support-for-Amlogic-meson-G12-SoC-DDR-PMU-driver/20220805-151704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/admin-guide/perf/meson-ddr-pmu.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
