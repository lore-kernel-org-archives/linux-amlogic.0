Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91318C27C55
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DH/5Y2iwwcfwuaei9BjE1a26+MM2+C6L1v+FG5COALw=; b=K85EdIg8iFmgIw
	G7sj7GQLVvnIpYBSOTjYudf2sq+yq6+7OhatnmPwmKOaghb5eXUcKPsv5YgEKmwLvM89f/WfAmEZm
	WN45giVlUy5MjxkOXyPo7ju7Wcy6hE7TKL4IxVxGvRRssYyrBdPx4/Bu0UUCgCx5uge64I7lMwFR2
	nIfPIpa2ae+kGJJXtbyZuRTv1ITaatPEMs75dqWDWvRpSV8c21C2n/QYdc15mz48XkxsWhMNmd51I
	PhyxcWrR0P8jEApoPpPAwfJ5ya4gaLLNppj9HRu8AnrO8VPumPS1UH8TzNty9vvd0VyCFnCNYWzti
	HqYYVWylDodz+4ysG0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUgz-0000000D4cl-3k5Q;
	Fri, 07 Jun 2024 08:11:21 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFUgu-0000000D4br-1bio;
	Fri, 07 Jun 2024 08:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717747877; x=1749283877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BjHvlPpsf1JuNh8voewB5kjC1cJt74iMWbnPuF3HdpY=;
  b=jMS9+KTzgRCJEB0306g4EEWWfXc1FAZp2KzmE+7ATE9q+Wbaei9wKbvz
   wro49mCyeJ+d4T9BOXBfKoB0WsJXm/iQTkr6+KXj07/fsVlYH4IcEBWOh
   6OtfHxQprtP+9uSuhtTiocqmaAKN9eima3AeHluNxL90HBQrcOjEmNpsw
   dgNVfxz8MwiPU6+alAoPaMoOofSLKHr8mprtYc0Vy0bUJeJ+kaSO+MRMk
   YEHVUgCtkA3IqbiL/eDVBsED+P/9NjHRbXDzcnazajfc1kAeJrpoH+aLc
   NIkmaoYTyjTYQXumBS8VMwL+5ltqSLh2wUZv0ho3689IUb8arhvJ6XByK
   w==;
X-CSE-ConnectionGUID: ZJDhr0qhT+KE6M41cbB7Xg==
X-CSE-MsgGUID: bUlwBivNSia1K/d16Ro2Fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14614619"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="14614619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 01:11:14 -0700
X-CSE-ConnectionGUID: Yo/IX92zTnuTcmNSHjv5bA==
X-CSE-MsgGUID: frMbXn5QSte5GkD02fumGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="43185517"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Jun 2024 01:11:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFUgm-0004F4-08;
	Fri, 07 Jun 2024 08:11:08 +0000
Date: Fri, 7 Jun 2024 16:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox
 One/Two
Message-ID: <202406071527.fnfhnkUL-lkp@intel.com>
References: <20240606094513.3949323-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606094513.3949323-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_011116_508258_6CA2D595 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.10-rc2 next-20240606]
[cannot apply to krzk-dt/for-next krzk-mem-ctrl/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hewitt/dt-bindings-arm-amlogic-add-support-for-Dreambox-One-Two/20240606-175427
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240606094513.3949323-3-christianshewitt%40gmail.com
patch subject: [PATCH 3/3] arm64: dts: meson: add initial support for Dreambox One/Two
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406071527.fnfhnkUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406071527.fnfhnkUL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-one.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
--
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
     also defined at arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2220.23-2260.6
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/clock-controller@0: failed to match any schema with compatible: ['amlogic,g12a-audio-clkc']
   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: /soc/bus@ff600000/bus@42000/audio-controller@744: failed to match any schema with compatible: ['amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson-g12b-dreambox-two.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
