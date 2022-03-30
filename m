Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7F7C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 17:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a/YkmJ4Du8m0Wfllzkth1tkJrJqwf5uOlk7X2FeZngo=; b=4hQj4au0QHHl3E
	BgSquUuWo31vzX0Fpj2TLvzjDwN8Fpa6AuP6X9twX0LyCV8jdzRI/nyuHD9t3gNFFckY+JwHPq4VQ
	Pfm0pDMnTxpjsLOpSpjhYdkdRzF2HkGwRKIlWyiJaqrMq7TrlV4yBl+bXK2LsefTxpTejH4uO825D
	2T3FXnumfTxOSnikE32DHK0qGJEH/vwBdH2AY7Y/iKma+gZGVqsdBKkSHtYdNp0z6gV8it+9k+2jb
	2VyqOcvzM7vctIImmqr0uS7HHY9lCyNg1WqKSyQFWN0fzODhSXgqvF0JNNOd/pUHunX1fx2uW3bbm
	MwHSK+4/8Mz7n7Vzinfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZc4p-00GxRd-9U; Wed, 30 Mar 2022 17:25:47 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZc4c-00GxP9-6W; Wed, 30 Mar 2022 17:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648661134; x=1680197134;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2wbT9qjviMFXOJP9BA2NPmRzRlvFL8bjYWi5aL+brNc=;
 b=UK7G16WRqEwkpXv2Mqg7fC1/IbNDBG1/jqPv7nlZtUxkYujv1kKkhwRs
 1TZ0bh6zLJ51Mp8JlZTLdZ+r/OPCzAnmyOEXxX0GDV34HO/yvzq+Bb5Nt
 W9O0KL7TiQYI9ifPu+eW1WKrwIMetYcP1Pl0KK13kbx3kl3tk0xP88Qja
 wq2o6bNUxgPl+seSs9ebJojTWY1OIGU/k88MDv25Ye8Gf/AOiYXAyjNHU
 gwWJAykZerA/khk/NGaT8ld8/nbPU3AWluhZbhSwJqYw86Q1onEr3QDGd
 PEnn9bpBrz9QIbVGo1dYD9ioYlnV5UkUaXljRFFY6CU63eX1hdW4WdGe4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284510722"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284510722"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 10:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="618607535"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2022 10:25:23 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nZc4Q-0000EO-UL;
 Wed, 30 Mar 2022 17:25:22 +0000
Date: Thu, 31 Mar 2022 01:25:07 +0800
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
Cc: kbuild-all@lists.01.org, Neil Armstrong <narmstrong@baylibre.com>,
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
Message-ID: <202203310151.Iu2JvLIF-lkp@intel.com>
References: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_102534_340644_5ED0A0A0 
X-CRM114-Status: GOOD (  16.16  )
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
config: riscv-buildonly-randconfig-r006-20220330 (https://download.01.org/0day-ci/archive/20220331/202203310151.Iu2JvLIF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3539d23dd289ca77a85d66fe8721e4febfc50ea4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/gpiolib-Two-new-helpers-and-way-toward-fwnode/20220330-225341
        git checkout 3539d23dd289ca77a85d66fe8721e4febfc50ea4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_eint_gpio_init':
>> drivers/pinctrl/samsung/pinctrl-s3c64xx.c:474:64: error: 'struct samsung_pin_bank' has no member named 'of_node'; did you mean 'fwnode'?
     474 |                 bank->irq_domain = irq_domain_add_linear(bank->of_node,
         |                                                                ^~~~~~~
         |                                                                fwnode
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c: In function 's3c64xx_eint_eint0_init':
   drivers/pinctrl/samsung/pinctrl-s3c64xx.c:746:64: error: 'struct samsung_pin_bank' has no member named 'of_node'; did you mean 'fwnode'?
     746 |                 bank->irq_domain = irq_domain_add_linear(bank->of_node,
         |                                                                ^~~~~~~
         |                                                                fwnode


vim +474 drivers/pinctrl/samsung/pinctrl-s3c64xx.c

61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  444  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  445  /**
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  446   * s3c64xx_eint_gpio_init() - setup handling of external gpio interrupts.
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  447   * @d: driver data of samsung pinctrl driver.
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  448   */
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  449  static int s3c64xx_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  450  {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  451  	struct s3c64xx_eint_gpio_data *data;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  452  	struct samsung_pin_bank *bank;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  453  	struct device *dev = d->dev;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  454  	unsigned int nr_domains;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  455  	unsigned int i;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  456  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  457  	if (!d->irq) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  458  		dev_err(dev, "irq number not available\n");
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  459  		return -EINVAL;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  460  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  461  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  462  	nr_domains = 0;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  463  	bank = d->pin_banks;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  464  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  465  		unsigned int nr_eints;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  466  		unsigned int mask;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  467  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  468  		if (bank->eint_type != EINT_TYPE_GPIO)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  469  			continue;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  470  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  471  		mask = bank->eint_mask;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  472  		nr_eints = fls(mask);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  473  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18 @474  		bank->irq_domain = irq_domain_add_linear(bank->of_node,
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  475  					nr_eints, &s3c64xx_gpio_irqd_ops, bank);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  476  		if (!bank->irq_domain) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  477  			dev_err(dev, "gpio irq domain add failed\n");
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  478  			return -ENXIO;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  479  		}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  480  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  481  		++nr_domains;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  482  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  483  
0ed2dd03b94b7b drivers/pinctrl/samsung/pinctrl-s3c64xx.c Kees Cook        2018-05-08  484  	data = devm_kzalloc(dev, struct_size(data, domains, nr_domains),
0ed2dd03b94b7b drivers/pinctrl/samsung/pinctrl-s3c64xx.c Kees Cook        2018-05-08  485  			    GFP_KERNEL);
fa5c0f46e2b9a1 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Marek Szyprowski 2017-01-19  486  	if (!data)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  487  		return -ENOMEM;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  488  	data->drvdata = d;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  489  
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  490  	bank = d->pin_banks;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  491  	nr_domains = 0;
1bf00d7a6dbff0 drivers/pinctrl/samsung/pinctrl-s3c64xx.c Tomasz Figa      2014-09-23  492  	for (i = 0; i < d->nr_banks; ++i, ++bank) {
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  493  		if (bank->eint_type != EINT_TYPE_GPIO)
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  494  			continue;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  495  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  496  		data->domains[nr_domains++] = bank->irq_domain;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  497  	}
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  498  
623a650ebc886f drivers/pinctrl/samsung/pinctrl-s3c64xx.c Thomas Gleixner  2015-06-21  499  	irq_set_chained_handler_and_data(d->irq, s3c64xx_eint_gpio_irq, data);
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  500  
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  501  	return 0;
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  502  }
61dd7261317770 drivers/pinctrl/pinctrl-s3c64xx.c         Tomasz Figa      2013-03-18  503  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
