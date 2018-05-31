From: lkp@intel.com (kbuild test robot)
Date: Thu, 31 May 2018 18:30:28 +0800
Subject: [PATCH v2 6/6] clk: meson: axg: add the audio clock controller
 driver
In-Reply-To: <20180522163457.13834-7-jbrunet@baylibre.com>
References: <20180522163457.13834-7-jbrunet@baylibre.com>
Message-ID: <201805311824.gc5kRLze%fengguang.wu@intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on next-20180530]
[cannot apply to v4.17-rc7]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jerome-Brunet/clk-meson-axg-add-audio-clock-controller-support/20180524-053349
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm64-allmodconfig (attached as .config)
compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm64 

All errors (new ones prefixed by >>):

   In file included from drivers/clk/meson/clk-triphase.c:8:0:
>> drivers/clk/meson/clkc-audio.h:22:18: error: field 'cached_duty' has incomplete type
     struct clk_duty cached_duty;
                     ^~~~~~~~~~~
--
   In file included from drivers/clk/meson/sclk-div.c:19:0:
>> drivers/clk/meson/clkc-audio.h:22:18: error: field 'cached_duty' has incomplete type
     struct clk_duty cached_duty;
                     ^~~~~~~~~~~
   drivers/clk/meson/sclk-div.c: In function 'sclk_div_set_duty_cycle':
>> drivers/clk/meson/sclk-div.c:127:43: error: dereferencing pointer to incomplete type 'struct clk_duty'
      memcpy(&sclk->cached_duty, duty, sizeof(*duty));
                                              ^~~~~
   drivers/clk/meson/sclk-div.c: At top level:
>> drivers/clk/meson/sclk-div.c:239:3: error: 'const struct clk_ops' has no member named 'get_duty_cycle'
     .get_duty_cycle = sclk_div_get_duty_cycle,
      ^~~~~~~~~~~~~~
>> drivers/clk/meson/sclk-div.c:239:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .get_duty_cycle = sclk_div_get_duty_cycle,
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/meson/sclk-div.c:239:20: note: (near initialization for 'meson_sclk_div_ops.disable_unused')
>> drivers/clk/meson/sclk-div.c:240:3: error: 'const struct clk_ops' has no member named 'set_duty_cycle'
     .set_duty_cycle = sclk_div_set_duty_cycle,
      ^~~~~~~~~~~~~~
   drivers/clk/meson/sclk-div.c:240:20: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
     .set_duty_cycle = sclk_div_set_duty_cycle,
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/meson/sclk-div.c:240:20: note: (near initialization for 'meson_sclk_div_ops.recalc_rate')
   cc1: some warnings being treated as errors
--
   In file included from drivers/clk/meson/axg-audio.c:17:0:
>> drivers/clk/meson/clkc-audio.h:22:18: error: field 'cached_duty' has incomplete type
     struct clk_duty cached_duty;
                     ^~~~~~~~~~~
>> drivers/clk/meson/axg-audio.c:35:12: error: 'CLK_DUTY_CYCLE_PARENT' undeclared here (not in a function); did you mean 'CLK_SET_RATE_PARENT'?
      .flags = CLK_DUTY_CYCLE_PARENT | (_iflags),  \
               ^
   drivers/clk/meson/axg-audio.c:74:2: note: in expansion of macro 'AXG_AUD_GATE'
     AXG_AUD_GATE(_name, AUDIO_CLK_GATE_EN, _bit, "axg_audio_pclk", 0)
     ^~~~~~~~~~~~
   drivers/clk/meson/axg-audio.c:77:8: note: in expansion of macro 'AXG_PCLK_GATE'
    static AXG_PCLK_GATE(ddr_arb,    0);
           ^~~~~~~~~~~~~

vim +/cached_duty +22 drivers/clk/meson/clkc-audio.h

1917a00b Jerome Brunet 2018-05-22  17  
77ad1f34 Jerome Brunet 2018-05-22  18  struct meson_sclk_div_data {
77ad1f34 Jerome Brunet 2018-05-22  19  	struct parm div;
77ad1f34 Jerome Brunet 2018-05-22  20  	struct parm hi;
77ad1f34 Jerome Brunet 2018-05-22  21  	unsigned int cached_div;
77ad1f34 Jerome Brunet 2018-05-22 @22  	struct clk_duty cached_duty;
77ad1f34 Jerome Brunet 2018-05-22  23  };
77ad1f34 Jerome Brunet 2018-05-22  24  

:::::: The code at line 22 was first introduced by commit
:::::: 77ad1f347931a823d715bbcf7d0bf02ba016abc7 clk: meson: add axg audio sclk divider driver

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: 0day robot <lkp@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 59077 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180531/fdeb60e7/attachment.gz>
