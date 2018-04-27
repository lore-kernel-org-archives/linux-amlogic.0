From: lkp@intel.com (kbuild test robot)
Date: Fri, 27 Apr 2018 09:13:23 +0800
Subject: [PATCH 7/7] clk: meson: axg: add the audio clock controller driver
In-Reply-To: <20180425163304.10852-8-jbrunet@baylibre.com>
References: <20180425163304.10852-8-jbrunet@baylibre.com>
Message-ID: <201804270920.dd1N3TWc%fengguang.wu@intel.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on v4.17-rc2 next-20180426]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Jerome-Brunet/clk-meson-axg-add-audio-clock-controller-support/20180427-035149
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm64-allmodconfig (attached as .config)
compiler: aarch64-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm64 

All error/warnings (new ones prefixed by >>):

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
>> drivers/clk/meson/axg-audio.c:74:2: note: in expansion of macro 'AXG_AUD_GATE'
     AXG_AUD_GATE(_name, AUDIO_CLK_GATE_EN, _bit, "axg_audio_pclk", 0)
     ^~~~~~~~~~~~
>> drivers/clk/meson/axg-audio.c:77:8: note: in expansion of macro 'AXG_PCLK_GATE'
    static AXG_PCLK_GATE(ddr_arb,    0);
           ^~~~~~~~~~~~~

vim +/cached_duty +22 drivers/clk/meson/clkc-audio.h

6f493fa86 Jerome Brunet 2018-04-25  17  
e8e28d3aa Jerome Brunet 2018-04-25  18  struct meson_sclk_div_data {
e8e28d3aa Jerome Brunet 2018-04-25  19  	struct parm div;
e8e28d3aa Jerome Brunet 2018-04-25  20  	struct parm hi;
e8e28d3aa Jerome Brunet 2018-04-25  21  	unsigned int cached_div;
e8e28d3aa Jerome Brunet 2018-04-25 @22  	struct clk_duty cached_duty;
e8e28d3aa Jerome Brunet 2018-04-25  23  };
e8e28d3aa Jerome Brunet 2018-04-25  24  

:::::: The code at line 22 was first introduced by commit
:::::: e8e28d3aaf526ae3af0d0fd0e8b4c8c8ad2041d8 clk: meson: add axg audio sclk divider driver

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: 0day robot <fengguang.wu@intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 59068 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180427/e65e0f59/attachment.gz>
