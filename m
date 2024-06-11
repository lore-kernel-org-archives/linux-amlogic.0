Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0726AC27C65
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2024 18:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUvGMUCKF99XJl3DBCBk0kqLkI0Wi52HmmUwDwQn7+M=; b=1itd6DvgGPCV2r
	/vY91nT9rpYz/qlKbxAcfaSVQ5bEOSRnXXuNUh2yxrFvLvXBN8BTc0pMGIznflzNUw/xEcEpH7e4B
	M7lHeTodGDQ+ksgGIc6G6Hk/RbcdUBaf4m+tngUYGCaPnRjOHBdpjzZoGHZCXWlEjLNMFsz0IsKcZ
	8w3BcQ+DSKtSRv8r2Se4SV/e4lIU9yfMDL7LKI+UalA6xwjiFf7h5PaKbvuSXKrmW8vRDQlLPrnmv
	x0Bjc2jktDCv+z8TDABIkimt7U62pAKGI+SMnjCSje2YSEUcC3yvgl3MCfWV6O5SMkscFNQ8N/mnd
	pGODlh2aMgw0p4p0e18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6aK-00000009uGI-2xHr;
	Tue, 11 Jun 2024 18:51:08 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6aG-00000009uEI-36Zk;
	Tue, 11 Jun 2024 18:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718131864; x=1749667864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RzJp8cb00wWu9a4yoQ4JsrdL7/XwAY9pJKi6QkNRA7I=;
  b=ja/M6hmVV1KzPYJSDXAeC6vYPxsZRlA61urVMDIVdmvB+mee4NInpO1t
   YMMJ/FZ8DOox+r76wky2r0dedRUqbENu7VJ57b0D9szXrR/SfUZSPg6ee
   tASLNqBur3B3FZy0Kk3ViccwzAF1C3pp0vg3PhdxKuHR+cS4oFRH98xR8
   3ESTMMl4QBKfEUGLlMTYmBnuiO2xtHzfF9NhK/9d7FwVbQ1sQUsaIKrjR
   xCQV0ekxHEX0fynxOclyFR54YpS62U3DqQ2CBZ0baay6E/IUzP3rMFe45
   PLjxnc/Rw6eaKOVD72pGpqCb3lljYZvTQXBebyiFCOAdO/ajQ9KbFexEk
   Q==;
X-CSE-ConnectionGUID: T1FYVMmnRt6BAZn6NyUrsQ==
X-CSE-MsgGUID: b4bEHDaZSbCRiXBqRU4haA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="18721242"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="18721242"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 11:51:03 -0700
X-CSE-ConnectionGUID: qFaEQGGQR0yj92/nkWYFjw==
X-CSE-MsgGUID: vVT7fhWYSwGUXsLltUGGmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="39638525"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2024 11:50:59 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH6a9-0000nd-1G;
	Tue, 11 Jun 2024 18:50:57 +0000
Date: Wed, 12 Jun 2024 02:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
Message-ID: <202406120256.PStYu9fX-lkp@intel.com>
References: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611-a4_pinctrl-v1-3-dc487b1977b3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_115104_828674_78F804FD 
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

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 87501b7ca0005c533d770d37e0047a60954d986a]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-A4-SoCs/20240611-131412
base:   87501b7ca0005c533d770d37e0047a60954d986a
patch link:    https://lore.kernel.org/r/20240611-a4_pinctrl-v1-3-dc487b1977b3%40amlogic.com
patch subject: [PATCH 3/3] arm64: dts: amlogic: a4: add pinctrl node
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240612/202406120256.PStYu9fX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120256.PStYu9fX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120256.PStYu9fX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:71.32-85.4: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:52.35-66.5: Warning (unit_address_vs_reg): /soc/pinctrl@fe08e700: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:71.32-85.4: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:52.35-66.5: Warning (simple_bus_reg): /soc/pinctrl@fe08e700: missing or empty reg/ranges property

vim +71 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi

  > 52			aobus_pinctrl: pinctrl@fe08e700 {
    53				compatible = "amlogic,a4-aobus-pinctrl";
    54				#address-cells = <2>;
    55				#size-cells = <2>;
    56				ranges;
    57	
    58				ao_gpio: bank@fe08e700 {
    59					reg = <0x0 0xfe08e700 0x0 0x04>,
    60					      <0x0 0xfe08e704 0x0 0x60>;
    61					reg-names = "mux", "gpio";
    62					gpio-controller;
    63					#gpio-cells = <2>;
    64					gpio-ranges = <&aobus_pinctrl 0 0 8>;
    65				};
    66			};
    67		};
    68	};
    69	
    70	&apb {
  > 71		periphs_pinctrl: pinctrl@4000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
