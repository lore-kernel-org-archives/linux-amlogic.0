From: lkp@intel.com (kbuild test robot)
Date: Fri, 9 Nov 2018 21:49:13 +0800
Subject: [PATCH 4/4] ARM: dts: meson: consistently disable pin bias
In-Reply-To: <20181108104426.1877-5-jbrunet@baylibre.com>
References: <20181108104426.1877-5-jbrunet@baylibre.com>
Message-ID: <201811092154.8cBEuXry%fengguang.wu@intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on v4.20-rc1 next-20181109]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jerome-Brunet/ARM-dts-meson-set-pinmux-bias/20181109-065952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm-multi_v7_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=7.2.0 make.cross ARCH=arm 

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/meson8.dtsi:167.4-17 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree
--
>> Error: arch/arm/boot/dts/meson8b.dtsi:150.4-17 Properties must precede subnodes
   FATAL ERROR: Unable to parse input tree

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 44774 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181109/f9e84ece/attachment.gz>
