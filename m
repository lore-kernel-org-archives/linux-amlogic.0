Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A980C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 20:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSdGm5DVgvGmQDwpnqbTDCpmfEXuP7M/94qKlT18bA0=; b=Yw7M+SLKVDJLJi
	kKcnOVQtOBNDNF0vPqLfgRxMyYOnzlhxjp/8TVFqXZZOxunWjAwvT6CP+96R+0kIvp0vKZ9d7Pgvy
	z13dOUJxCZU5W0lYqz29XnQ2KPrMKQ4s1RPr1uvG59oUIKuYOnYAPK3NYEmhQ67ZBvuC3TnDOlw34
	DkCpVjMNjrgjX5z+Bp7DreZ6JUGYAFx0uDVipTvZcYupjwbcfRPEEIrPiQY/6MyxK+uzW0htaXOJ6
	oZaf8kZlx38FRhMbzml2yeElqNrFgJxUU34v9BXHFxbGWktQHkRKejiR64m0t0O5Onzlwz3yDeB15
	dke+GAHi/0BaRAt7FV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7jtD-003gud-OJ; Wed, 12 Jan 2022 20:06:35 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7jss-003grJ-Lt; Wed, 12 Jan 2022 20:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642017974; x=1673553974;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RPjwaqN1NK/KnSeTr6fLaDsnH7HkZg/G64JzzF8F/AY=;
 b=BaphjR8y3NbcCf7EL4Wy4n+xUBFxqBycpOG03V41IN6YirI4t0mpPfYz
 UWPHzugDP+15xuKwy/4/dROGPx9baiUiwpsBvG5vZF885ll1V+xn82hsO
 W3Wtu5j8aK4B1HLxaX8u60YWz15tsFG+l4/91PkoKQcyLSOlUnLjHDX9a
 vETB2xQmki9YFCz0Du2F+Futn6brkO2z54hvzcUt6yW3v6/xpyB4+pAKx
 /71hykE4//djcMhb3ls3DuJB/9F9hY3RohGhDLFO12NJuPo0dVFTEcU5S
 C1pDF48YXFFUb+ed/MUJZgrUlKRGAYJAKK3AXmnihMoO80wZPtSNF2GjT g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="304580266"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="304580266"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 12:06:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="623595595"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 12 Jan 2022 12:06:11 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7jso-0006Kq-9Z; Wed, 12 Jan 2022 20:06:10 +0000
Date: Thu, 13 Jan 2022 04:05:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: kbuild-all@lists.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH V4 3/5] tty: serial: meson: The UART baud rate
Message-ID: <202201130331.dzluDr3h-lkp@intel.com>
References: <20220110085604.18042-4-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110085604.18042-4-yu.tu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_120614_828257_87F60E16 
X-CRM114-Status: GOOD (  12.61  )
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

Hi Yu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on next-20220112]
[cannot apply to robh/for-next soc/for-next clk/clk-next v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yu-Tu/the-UART-driver-compatible-with/20220110-170020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: powerpc-randconfig-s031-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130331.dzluDr3h-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/6d55159e6626326d9001d4c8f20b914a69c2c40b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yu-Tu/the-UART-driver-compatible-with/20220110-170020
        git checkout 6d55159e6626326d9001d4c8f20b914a69c2c40b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/tty/serial/meson_uart.o: in function `meson_uart_probe_clocks':
   meson_uart.c:(.text+0x464): undefined reference to `__clk_get_name'
>> powerpc-linux-ld: meson_uart.c:(.text+0x4bc): undefined reference to `__devm_clk_hw_register_divider'
>> powerpc-linux-ld: meson_uart.c:(.text+0x4fc): undefined reference to `__clk_get_name'
>> powerpc-linux-ld: meson_uart.c:(.text+0x518): undefined reference to `devm_clk_hw_register_fixed_factor'
>> powerpc-linux-ld: meson_uart.c:(.text+0x5a8): undefined reference to `__devm_clk_hw_register_mux'
>> powerpc-linux-ld: meson_uart.c:(.text+0x5c0): undefined reference to `clk_hw_get_rate'
>> powerpc-linux-ld: meson_uart.c:(.text+0x5f8): undefined reference to `clk_hw_get_name'
   powerpc-linux-ld: meson_uart.c:(.text+0x640): undefined reference to `__devm_clk_hw_register_divider'
>> powerpc-linux-ld: meson_uart.c:(.text+0x65c): undefined reference to `clk_hw_get_clk'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
