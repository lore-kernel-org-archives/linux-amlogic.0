From: lkp@intel.com (kbuild test robot)
Date: Thu, 12 Oct 2017 14:09:29 +0800
Subject: [PATCH 1/2] pinctrl: meson: separate soc drivers
In-Reply-To: <20171009101747.16940-2-jbrunet@baylibre.com>
Message-ID: <201710121401.GSjGPWSz%fengguang.wu@intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

[auto build test ERROR on pinctrl/devel]
[also build test ERROR on v4.14-rc4 next-20171009]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jerome-Brunet/pinctrl-meson-prepare-for-new-SoC/20171012-094645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: i386-allmodconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bitops.h:513:0,
                    from include/linux/bitops.h:37,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/pinctrl/meson/pinctrl-meson.c:47:
>> arch/x86/include/asm/arch_hweight.h:17:17: error: expected identifier before string constant
    #define REG_OUT "a"
                    ^
>> drivers/pinctrl/meson/pinctrl-meson.h:74:2: note: in expansion of macro 'REG_OUT'
     REG_OUT,
     ^~~~~~~
   In file included from drivers/pinctrl/meson/pinctrl-meson.c:63:0:
>> drivers/pinctrl/meson/pinctrl-meson.h:99:29: error: 'NUM_REG' undeclared here (not in a function)
     struct meson_reg_desc regs[NUM_REG];
                                ^~~~~~~
   In file included from arch/x86/include/asm/bitops.h:513:0,
                    from include/linux/bitops.h:37,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/pinctrl/meson/pinctrl-meson.c:47:
   drivers/pinctrl/meson/pinctrl-meson.c: In function 'meson_gpio_direction_output':
>> arch/x86/include/asm/arch_hweight.h:17:17: error: incompatible type for argument 3 of 'meson_calc_reg_and_bit'
    #define REG_OUT "a"
                    ^
>> drivers/pinctrl/meson/pinctrl-meson.c:446:37: note: in expansion of macro 'REG_OUT'
     meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
                                        ^~~~~~~
   drivers/pinctrl/meson/pinctrl-meson.c:99:13: note: expected 'enum meson_reg_type' but argument is of type 'char *'
    static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bitops.h:513:0,
                    from include/linux/bitops.h:37,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/pinctrl/meson/pinctrl-meson.c:47:
   drivers/pinctrl/meson/pinctrl-meson.c: In function 'meson_gpio_set':
>> arch/x86/include/asm/arch_hweight.h:17:17: error: incompatible type for argument 3 of 'meson_calc_reg_and_bit'
    #define REG_OUT "a"
                    ^
   drivers/pinctrl/meson/pinctrl-meson.c:462:37: note: in expansion of macro 'REG_OUT'
     meson_calc_reg_and_bit(bank, gpio, REG_OUT, &reg, &bit);
                                        ^~~~~~~
   drivers/pinctrl/meson/pinctrl-meson.c:99:13: note: expected 'enum meson_reg_type' but argument is of type 'char *'
    static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/bitops.h:513:0,
                    from include/linux/bitops.h:37,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:8,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from drivers/pinctrl/meson/pinctrl-meson.c:47:
   drivers/pinctrl/meson/pinctrl-meson.c: In function 'meson_gpio_get':
   arch/x86/include/asm/arch_hweight.h:16:16: error: incompatible type for argument 3 of 'meson_calc_reg_and_bit'
    #define REG_IN "a"
                   ^
>> drivers/pinctrl/meson/pinctrl-meson.c:478:37: note: in expansion of macro 'REG_IN'
     meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
                                        ^~~~~~
   drivers/pinctrl/meson/pinctrl-meson.c:99:13: note: expected 'enum meson_reg_type' but argument is of type 'char *'
    static void meson_calc_reg_and_bit(struct meson_bank *bank, unsigned int pin,
                ^~~~~~~~~~~~~~~~~~~~~~

vim +/NUM_REG +99 drivers/pinctrl/meson/pinctrl-meson.h

6ac73095 Beniamino Galvani 2015-01-17   66  
6ac73095 Beniamino Galvani 2015-01-17   67  /**
6ac73095 Beniamino Galvani 2015-01-17   68   * enum meson_reg_type - type of registers encoded in @meson_reg_desc
6ac73095 Beniamino Galvani 2015-01-17   69   */
6ac73095 Beniamino Galvani 2015-01-17   70  enum meson_reg_type {
6ac73095 Beniamino Galvani 2015-01-17   71  	REG_PULLEN,
6ac73095 Beniamino Galvani 2015-01-17   72  	REG_PULL,
6ac73095 Beniamino Galvani 2015-01-17   73  	REG_DIR,
6ac73095 Beniamino Galvani 2015-01-17  @74  	REG_OUT,
6ac73095 Beniamino Galvani 2015-01-17   75  	REG_IN,
6ac73095 Beniamino Galvani 2015-01-17   76  	NUM_REG,
6ac73095 Beniamino Galvani 2015-01-17   77  };
6ac73095 Beniamino Galvani 2015-01-17   78  
6ac73095 Beniamino Galvani 2015-01-17   79  /**
6ac73095 Beniamino Galvani 2015-01-17   80   * struct meson bank
6ac73095 Beniamino Galvani 2015-01-17   81   *
6ac73095 Beniamino Galvani 2015-01-17   82   * @name:	bank name
6ac73095 Beniamino Galvani 2015-01-17   83   * @first:	first pin of the bank
6ac73095 Beniamino Galvani 2015-01-17   84   * @last:	last pin of the bank
6c9dc843 Jerome Brunet     2017-06-08   85   * @irq:	hwirq base number of the bank
6ac73095 Beniamino Galvani 2015-01-17   86   * @regs:	array of register descriptors
6ac73095 Beniamino Galvani 2015-01-17   87   *
6ac73095 Beniamino Galvani 2015-01-17   88   * A bank represents a set of pins controlled by a contiguous set of
6ac73095 Beniamino Galvani 2015-01-17   89   * bits in the domain registers. The structure specifies which bits in
6ac73095 Beniamino Galvani 2015-01-17   90   * the regmap control the different functionalities. Each member of
6ac73095 Beniamino Galvani 2015-01-17   91   * the @regs array refers to the first pin of the bank.
6ac73095 Beniamino Galvani 2015-01-17   92   */
6ac73095 Beniamino Galvani 2015-01-17   93  struct meson_bank {
6ac73095 Beniamino Galvani 2015-01-17   94  	const char *name;
6ac73095 Beniamino Galvani 2015-01-17   95  	unsigned int first;
6ac73095 Beniamino Galvani 2015-01-17   96  	unsigned int last;
6c9dc843 Jerome Brunet     2017-06-08   97  	int irq_first;
6c9dc843 Jerome Brunet     2017-06-08   98  	int irq_last;
6ac73095 Beniamino Galvani 2015-01-17  @99  	struct meson_reg_desc regs[NUM_REG];
6ac73095 Beniamino Galvani 2015-01-17  100  };
6ac73095 Beniamino Galvani 2015-01-17  101  

:::::: The code at line 99 was first introduced by commit
:::::: 6ac730951104a437bf828683bcf9ba66336c4fa7 pinctrl: add driver for Amlogic Meson SoCs

:::::: TO: Beniamino Galvani <b.galvani@gmail.com>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 61805 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20171012/3ba32933/attachment.gz>
