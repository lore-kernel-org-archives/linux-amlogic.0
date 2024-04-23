Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC314C04FFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 22:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IiA3l8mDSpgrlKgd1jjZ2rx6ni/tazyEzpJ7oi/f8E4=; b=FrIwYghDzD7GC/
	oya0gM9uWcSwfbdB3QTyvJ9Y3V0QPchF52mHtsjXEaMbNz8K+CzhmDUYYz6CDr27QektPbn7kPjT7
	H0PSVVw9atL9eYmPFjl7k/QSsUXHh67I64CUFOauI63akHv4cYQRaZFT+8+gcAR7CKqF2ezMtg55O
	IpPtXfjPju1O7rZWJHBlPB2gnomiS2WqGM4ZcqkbjgsQjuuykp4hqds5Jb677732sVzuhxlfov9Nb
	YaI8GxHWYG6Id2oSJ+psgjbIz9WDoNDxyA2zlokWkdhxNbgy/je3iVNxq6iVteYzeBIjdjoXisUpA
	530My+Y+FmLwYLyvLAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzOzb-00000001kba-3J2D;
	Tue, 23 Apr 2024 22:52:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzOzX-00000001kaS-2h1R;
	Tue, 23 Apr 2024 22:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713912719; x=1745448719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mznsmpZGIdBKgMqGdAUj/EZ/hJtwZ06FnB1V1izwzhk=;
  b=R1MLh05fILEqPKlnz7E08szaNW9OrKmSXS6sIW/9IyFYCCIfZik0qikv
   tMEbp1sNpELMonRH486bXftzmqPJTqjLOXZ4PnUXNphaVWnlBly5n4yK2
   0IGtBuYWjyLEQBJ0AhuZSGydizh/5CBq1wgoWcZKxS27PTmyP9E3FRL+I
   8y2HPN/ZibHqfefVdPhZXHxOWDWktZpbOeXdH4SAm1C9ei7zRLKU7C8q9
   hvHkb6YOeVylr6fIVUUcAFv3qs5Aqcs9YC7fvvyqkikaxMt/M5ZVQsphO
   SYDO1X9QTEHqGutQ+9m9xaR+RzmG9PG0QPOcKKJPNIVj/k//0udBc+NOi
   Q==;
X-CSE-ConnectionGUID: nveouaaNTjuHsxznhlUzfQ==
X-CSE-MsgGUID: 0ILv41xgSY6m9JCIb5GJsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20218393"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20218393"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 15:51:54 -0700
X-CSE-ConnectionGUID: 4vpTSJ/BT0WzosPs6zKsoA==
X-CSE-MsgGUID: lwCZffPLR/SpYCqnMxTVow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24557021"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Apr 2024 15:51:47 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzOzI-0000bA-2C;
	Tue, 23 Apr 2024 22:51:44 +0000
Date: Wed, 24 Apr 2024 06:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>
Subject: Re: [PATCH v2 2/4] PCI: dwc: Remove unused of_gpio.h
Message-ID: <202404240649.QgY8lto8-lkp@intel.com>
References: <20240423172208.2723892-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_155159_774768_12AF38C2 
X-CRM114-Status: GOOD (  10.59  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus mani-mhi/mhi-next linus/master v6.9-rc5 next-20240423]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/PCI-aardvark-Remove-unused-of_gpio-h/20240424-012448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240423172208.2723892-3-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v2 2/4] PCI: dwc: Remove unused of_gpio.h
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240424/202404240649.QgY8lto8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240649.QgY8lto8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240649.QgY8lto8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pci-dra7xx.c:262:2: error: implicit declaration of function 'chained_irq_enter' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           chained_irq_enter(chip, desc);
           ^
>> drivers/pci/controller/dwc/pci-dra7xx.c:284:2: error: implicit declaration of function 'chained_irq_exit' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           chained_irq_exit(chip, desc);
           ^
   drivers/pci/controller/dwc/pci-dra7xx.c:284:2: note: did you mean 'chained_irq_enter'?
   drivers/pci/controller/dwc/pci-dra7xx.c:262:2: note: 'chained_irq_enter' declared here
           chained_irq_enter(chip, desc);
           ^
   2 errors generated.


vim +/chained_irq_enter +262 drivers/pci/controller/dwc/pci-dra7xx.c

47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  252  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  253  static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  254  {
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  255  	struct irq_chip *chip = irq_desc_get_chip(desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  256  	struct dra7xx_pcie *dra7xx;
60b3c27fb9b92b drivers/pci/controller/dwc/pci-dra7xx.c Serge Semin            2022-06-24  257  	struct dw_pcie_rp *pp;
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  258  	struct dw_pcie *pci;
09b2d20349e37a drivers/pci/dwc/pci-dra7xx.c            Vignesh R              2017-12-29  259  	unsigned long reg;
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  260  	u32 bit;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  261  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27 @262  	chained_irq_enter(chip, desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  263  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  264  	pp = irq_desc_get_handler_data(desc);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  265  	pci = to_dw_pcie_from_pp(pp);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  266  	dra7xx = to_dra7xx_pcie(pci);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  267  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  268  	reg = dra7xx_pcie_readl(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MSI);
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  269  	dra7xx_pcie_writel(dra7xx, PCIECTRL_DRA7XX_CONF_IRQSTATUS_MSI, reg);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  270  
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  271  	switch (reg) {
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  272  	case MSI:
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27  273  		dra7xx_pcie_handle_msi_irq(pp);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  274  		break;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  275  	case INTA:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  276  	case INTB:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  277  	case INTC:
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  278  	case INTD:
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  279  		for_each_set_bit(bit, &reg, PCI_NUM_INTX)
d21faba11693c1 drivers/pci/controller/dwc/pci-dra7xx.c Marc Zyngier           2021-08-02  280  			generic_handle_domain_irq(dra7xx->irq_domain, bit);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  281  		break;
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  282  	}
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  283  
9a5595ab21a9d1 drivers/pci/controller/dwc/pci-dra7xx.c Vignesh Raghavendra    2020-03-27 @284  	chained_irq_exit(chip, desc);
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  285  }
47ff3de911a728 drivers/pci/host/pci-dra7xx.c           Kishon Vijay Abraham I 2014-07-22  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
