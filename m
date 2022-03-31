Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C97C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 22:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nL5YikVC4qUy2rOn/WdkBM2dzwSiAY5sDlbRSp+zUPc=; b=L1totjqBeySlXR
	TFzJyAMIiLSyAiIcP46WqUXsZdYRFpS8rDmUck7fEZ5O7B0a78MLmAhe677fGXkSDic0HZKEkXjhY
	2wRn+7LC2Qx+m8ZnYickC1S34XjFWzmZhS1/0Ds42ePhYyaDgNJrPIk33HieXoLkka5JiTLDAUzwC
	x+o6tB6wCCZQZeZpQpiiXgFFzlwb5n7TkCIWRtebDIMVRBC16jY3gl7P8kntwNKEqtEI7x4OD080i
	Vcn6kdHHNV83ZJgh4mGQQYHYE+AejA/Jgu5kbKjDZE/kLtMN8SxFrqpGzTvOGPEpews5QYrHoY1OD
	1kdfMb8ZrPaBs3V1PP6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na3KZ-003qkY-Sc; Thu, 31 Mar 2022 22:31:51 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na3KM-003qh2-LV; Thu, 31 Mar 2022 22:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648765898; x=1680301898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Du3Yko/lSEUNo3cG46eNYy30enIR53P83TYGdnVfgUA=;
 b=W8WDw8FRcJWHSi01Oif5JIHDUYRP2yEKIz9qPD5ukbLrsEL5cSlEsYYq
 BOi14qBF66dfPFTs9ywIX3kK/dLGvEKyOH3EZvsj0F6CGPAM4bhAG9y7P
 ghVIlZQxWxJsGxtmzW+eioTnUjOPV6QhAMT/8S4hnmZ7ga2p0Mt46wdMR
 sCBmO4d5Q8OGt6ZL/GgxzsbQKv1kshTzsgFw5w/PX04YDTbIVUAfHHW5d
 q9e6IbRfySpqdOxRvKGvamc1PKOKoJ04sL0GogxVZnrVcfy/6+pAdAJ3Z
 aYPxMSRfOGa3rtQhoEeOBVlD6FSvr/uNOh5RU6iTJPB1ElErVnIKVCZXd g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="240570018"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="240570018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 15:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="841487322"
Received: from lkp-server02.sh.intel.com (HELO 3231c491b0e2) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 31 Mar 2022 15:31:29 -0700
Received: from kbuild by 3231c491b0e2 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1na3KC-0000i0-J5;
 Thu, 31 Mar 2022 22:31:28 +0000
Date: Fri, 1 Apr 2022 06:31:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v3 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Message-ID: <202204010610.Wk5CAkQ7-lkp@intel.com>
References: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_153138_795685_62626607 
X-CRM114-Status: GOOD (  13.48  )
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

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
base:   a67ba3cf9551f8c92d5ec9d7eae1aadbb9127b57
config: arm-randconfig-c002-20220331 (https://download.01.org/0day-ci/archive/20220401/202204010610.Wk5CAkQ7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 881350a92d821d4f8e4fa648443ed1d17e251188)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/3539d23dd289ca77a85d66fe8721e4febfc50ea4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
        git checkout 3539d23dd289ca77a85d66fe8721e4febfc50ea4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pinctrl/samsung/pinctrl-exynos.c:310:50: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   bank->irq_domain = irq_domain_add_linear(bank->of_node,
                                                                  ^~~~~~~
                                                                  fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   drivers/pinctrl/samsung/pinctrl-exynos.c:568:50: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   bank->irq_domain = irq_domain_add_linear(bank->of_node,
                                                                  ^~~~~~~
                                                                  fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   drivers/pinctrl/samsung/pinctrl-exynos.c:576:31: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                   if (!of_find_property(bank->of_node, "interrupts", NULL)) {
                                               ^~~~~~~
                                               fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   drivers/pinctrl/samsung/pinctrl-exynos.c:591:37: error: no member named 'of_node' in 'struct samsung_pin_bank'; did you mean 'fwnode'?
                           irq = irq_of_parse_and_map(bank->of_node, idx);
                                                            ^~~~~~~
                                                            fwnode
   drivers/pinctrl/samsung/pinctrl-samsung.h:168:24: note: 'fwnode' declared here
           struct fwnode_handle *fwnode;
                                 ^
   4 errors generated.


vim +310 drivers/pinctrl/samsung/pinctrl-exynos.c

7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  273  
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  274  /*
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  275   * exynos_eint_gpio_init() - setup handling of external gpio interrupts.
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  276   * @d: driver data of samsung pinctrl driver.
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  277   */
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  278  __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  279  {
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  280  	struct samsung_pin_bank *bank;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  281  	struct device *dev = d->dev;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  282  	int ret;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  283  	int i;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  284  
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  285  	if (!d->irq) {
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  286  		dev_err(dev, "irq number not available\n");
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  287  		return -EINVAL;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  288  	}
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  289  
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  290  	ret = devm_request_irq(dev, d->irq, exynos_eint_gpio_irq,
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  291  					0, dev_name(dev), d);
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  292  	if (ret) {
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  293  		dev_err(dev, "irq request failed\n");
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  294  		return -ENXIO;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  295  	}
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  296  
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-exynos.c Tomasz Figa      2014-09-23  297  	bank = d->pin_banks;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-exynos.c Tomasz Figa      2014-09-23  298  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  299  		if (bank->eint_type != EINT_TYPE_GPIO)
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  300  			continue;
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  301  
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  302  		bank->irq_chip = devm_kmemdup(dev, &exynos_gpio_irq_chip,
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  303  					   sizeof(*bank->irq_chip), GFP_KERNEL);
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  304  		if (!bank->irq_chip) {
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  305  			ret = -ENOMEM;
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  306  			goto err_domains;
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  307  		}
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  308  		bank->irq_chip->chip.name = bank->name;
85745c870a757c drivers/pinctrl/samsung/pinctrl-exynos.c Marek Szyprowski 2020-07-20  309  
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11 @310  		bank->irq_domain = irq_domain_add_linear(bank->of_node,
6f5e41bd8fc6d3 drivers/pinctrl/samsung/pinctrl-exynos.c Abhilash Kesavan 2014-10-09  311  				bank->nr_pins, &exynos_eint_irqd_ops, bank);
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  312  		if (!bank->irq_domain) {
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  313  			dev_err(dev, "gpio irq domain add failed\n");
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  314  			ret = -ENXIO;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  315  			goto err_domains;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  316  		}
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  317  
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  318  		bank->soc_priv = devm_kzalloc(d->dev,
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  319  			sizeof(struct exynos_eint_gpio_save), GFP_KERNEL);
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  320  		if (!bank->soc_priv) {
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  321  			irq_domain_remove(bank->irq_domain);
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  322  			ret = -ENOMEM;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  323  			goto err_domains;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  324  		}
0d3d30db936359 drivers/pinctrl/samsung/pinctrl-exynos.c Abhilash Kesavan 2014-10-09  325  
595be7268a8573 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2012-10-11  326  	}
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  327  
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  328  	return 0;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  329  
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  330  err_domains:
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  331  	for (--i, --bank; i >= 0; --i, --bank) {
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  332  		if (bank->eint_type != EINT_TYPE_GPIO)
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  333  			continue;
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  334  		irq_domain_remove(bank->irq_domain);
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  335  	}
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  336  
7ccbc60cd9c293 drivers/pinctrl/pinctrl-exynos.c         Tomasz Figa      2013-05-22  337  	return ret;
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  338  }
43b169db184184 drivers/pinctrl/pinctrl-exynos.c         Thomas Abraham   2012-09-07  339  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
