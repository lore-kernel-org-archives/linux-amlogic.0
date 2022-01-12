Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FB8C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bj3caY+wtRduQmiss+4+kezxTBxk7Q91zzKtlHMzbc4=; b=KVsXnmg1Cr7YE8
	/rabu0oNnDImwoI/fBzcbt7cu3Rv6tTnWeSeVj+74/vMMoG+fRk7mKHMVDKtAh++vCYOqvg+25BMa
	B66bPL1iCb4dV/LS9fgDqCwsUUnJQxI0ZLELbbXmxs5+Lyo8YaOoWESv2B3J5SHgvO+GBGocJzW8Y
	anuN5gAm8nOpI/UPh7UcuR9PRn5PkWANEPDL/kl0HzwpHlBlTmKvJWZcfkrvrFWF3sM+kHdn+g+p5
	Xn60VyVCbGGq3AU6TAWo5+/pHjTWapmiRNcBLr3RAzTj6OcsSa19fx+Yw61AZNQZCMfhTckX7hT4B
	EmoHf5B21x1bf2vh+m0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7gDC-0033Ae-N3; Wed, 12 Jan 2022 16:10:58 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7gCz-00337S-Uk; Wed, 12 Jan 2022 16:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642003846; x=1673539846;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ipD9hbJokTRSTGdDIxN+I8+vGqTQwY5g/3aB1hWi24M=;
 b=JTaFWHqrT7ROFFAr81VeZrlGx20zPrd6hd1zLihtPVxI+aAhtm8ERkEE
 9SZHTzQMRfCPGnVzMiLJ4gSXJ2wecx1wxVERmm6qcyn20pvizkTWBzFpz
 nbRiJZoOjx4Uw3T5F7mH9QlFGkdThWGQD9AF4vdSpxe4/Y3veW+UNX3cS
 ZZvUN2LK7RNNT7QueUZBylfafnJm1xphgQkBC/byJ/7lPW+r95YQ6ywoI
 T/YC9dmcWMkgAHqq7PfxdxxMJxc0Vdo6QbvGKoxRu6itBjc0qzS6Cad30
 XpZl/kBF9gB9oZOhGHDIC1qkUsSA0rjM/t8qqK15GoySwfktBpjy7oHTq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="307116627"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="307116627"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 08:09:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="623492490"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 12 Jan 2022 08:09:02 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7gBK-00065i-4O; Wed, 12 Jan 2022 16:09:02 +0000
Date: Thu, 13 Jan 2022 00:08:44 +0800
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
Message-ID: <202201130013.KVlPG5Gj-lkp@intel.com>
References: <20220110085604.18042-4-yu.tu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220110085604.18042-4-yu.tu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_081046_297084_21E0A80F 
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
config: m68k-randconfig-m031-20220112 (https://download.01.org/0day-ci/archive/20220113/202201130013.KVlPG5Gj-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6d55159e6626326d9001d4c8f20b914a69c2c40b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yu-Tu/the-UART-driver-compatible-with/20220110-170020
        git checkout 6d55159e6626326d9001d4c8f20b914a69c2c40b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   m68k-linux-ld: arch/m68k/kernel/machine_kexec.o: in function `machine_kexec':
   machine_kexec.c:(.text+0x6a): undefined reference to `m68k_mmutype'
   m68k-linux-ld: machine_kexec.c:(.text+0x72): undefined reference to `m68k_cputype'
   m68k-linux-ld: arch/m68k/kernel/relocate_kernel.o:(.m68k_fixup+0x0): undefined reference to `M68K_FIXUP_MEMOFFSET'
   m68k-linux-ld: arch/m68k/kernel/relocate_kernel.o:(.m68k_fixup+0x8): undefined reference to `M68K_FIXUP_MEMOFFSET'
   m68k-linux-ld: arch/m68k/kernel/uboot.o: in function `process_uboot_commandline':
   uboot.c:(.init.text+0x32): undefined reference to `_init_sp'
   m68k-linux-ld: drivers/tty/serial/meson_uart.o: in function `meson_uart_probe_clocks':
   meson_uart.c:(.text+0x4de): undefined reference to `__clk_get_name'
>> m68k-linux-ld: meson_uart.c:(.text+0x53c): undefined reference to `__devm_clk_hw_register_divider'
>> m68k-linux-ld: meson_uart.c:(.text+0x5a8): undefined reference to `__devm_clk_hw_register_mux'
>> m68k-linux-ld: meson_uart.c:(.text+0x5c0): undefined reference to `clk_hw_get_rate'
>> m68k-linux-ld: meson_uart.c:(.text+0x5d2): undefined reference to `clk_hw_get_name'
   m68k-linux-ld: meson_uart.c:(.text+0x622): undefined reference to `__devm_clk_hw_register_divider'
>> m68k-linux-ld: meson_uart.c:(.text+0x63c): undefined reference to `clk_hw_get_clk'
>> m68k-linux-ld: meson_uart.c:(.text+0x666): undefined reference to `__clk_get_name'
>> m68k-linux-ld: meson_uart.c:(.text+0x6ae): undefined reference to `devm_clk_hw_register_fixed_factor'

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
