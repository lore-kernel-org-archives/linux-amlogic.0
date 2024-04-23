Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C04AC4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 23:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ciEUlXYoG2VzSiUEAQ0PLu1L0D2d6gB4UHu8oSndX+A=; b=Uq2FkUffR6OgXR
	by6E/EjSkjCgTJqi0a/E6qTeCk8Rc+T+et5GJ/t8Q9SkCsrxrvAviTY+6PcXmRNBxrRg2lqy7EBSE
	HltS+czptu967f3kfdFMjsVD/XDFq3p4A8+7kkNLwG2LuUhZdrIzI/GYxdywLvANFpIBvX9YhMRrm
	0eraaHUtxAkGvly+AM0XTXi3waceJdO4FvFNjbhXSbHqAmvQknEeQgJdqCSsrHDr5R5zSvq15iRRJ
	R/tPkpMSOu/VG2h5mt0inbOxTGl7P2+dojVgq7Bt6GB+yKUVk4cGyYFiQ+k7VPrrzCSAK98VVf72s
	FcJ3/FqjcXY1ecMtPX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzPmz-00000001s2R-11ur;
	Tue, 23 Apr 2024 23:43:05 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzPmu-00000001s1N-2KKX;
	Tue, 23 Apr 2024 23:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713915780; x=1745451780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m9tt459TrRCOHJGrn4P1GgZPBMmO2y3IZ40ZZj/ilNQ=;
  b=fAzU0RMSk0mNeE5dE3j710MHFYbu2MW8lr1AJ6ZUjVqLf1UfLO84KVr6
   bgBxItEoVcIe4JwGkWkIs8gzhA5BeKef3cwMmbMsrt5eGZbHObwl/pm44
   THhI72/RsYKVNfWppiSTH0w1FTfwVmFv5+GzH6djg7jUKxBH1WsmamAlQ
   3vsY/ItXgJZ7B95ia/URRkzk33jnkp1lpEHFl8THGjw1W790CO7l+l/Qv
   pIdYSSHsJrn6tLV8hWcxcWxZmm0IGet84ZNBRmprBESwzR8a9GYd/PLpi
   SS+yVZm3qdywLvFaKKLpXB2QJfijChQv4IXnCevCyTWmdiHzXzPkPRGfQ
   g==;
X-CSE-ConnectionGUID: grXDfmvwQY++yoeE03EwgQ==
X-CSE-MsgGUID: EZSggQIRScusgb3J5mX46g==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20930143"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20930143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 16:42:55 -0700
X-CSE-ConnectionGUID: qeOxCRxLTsyH6lG5wft9+A==
X-CSE-MsgGUID: 42c/oC0jQS2HyiXajej3Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24526372"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2024 16:42:48 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzPmf-0000da-2S;
	Tue, 23 Apr 2024 23:42:45 +0000
Date: Wed, 24 Apr 2024 07:42:07 +0800
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
Message-ID: <202404240725.Jlvuk7P3-lkp@intel.com>
References: <20240423172208.2723892-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-3-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_164300_749616_3ADE1234 
X-CRM114-Status: GOOD (  11.96  )
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
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240424/202404240725.Jlvuk7P3-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240424/202404240725.Jlvuk7P3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240725.Jlvuk7P3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pci-dra7xx.c:12:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pci/controller/dwc/pci-dra7xx.c:15:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pci/controller/dwc/pci-dra7xx.c:15:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pci/controller/dwc/pci-dra7xx.c:15:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/pci/controller/dwc/pci-dra7xx.c:262:2: error: call to undeclared function 'chained_irq_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     262 |         chained_irq_enter(chip, desc);
         |         ^
>> drivers/pci/controller/dwc/pci-dra7xx.c:284:2: error: call to undeclared function 'chained_irq_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     284 |         chained_irq_exit(chip, desc);
         |         ^
   17 warnings and 2 errors generated.


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
