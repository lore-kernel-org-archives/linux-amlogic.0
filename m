Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE70EE6B46
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 19:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJIFfrb2cIcN8T877cw4YArwWGNNt5gavA74GjTKp6s=; b=fZe/OF8Clwu7ja
	VnoWP/AS+TRGsgDRv6RdTdH4UuiefXn1vS1m7hejRrsy+7X7mn+cuIvNcoUsppOQ3dcb3sJjrbZwx
	AGtae/HTc+iVziPJ5syL2GfE7yuE9W2KUqcWE0zWgPLi/berShlu3KrFRmXrwq221hmWJDREeXabt
	N8WaUUGdnUEDsR67vLPYU9XDkxId+3uSg2X6kwFmHgzBGWUAysO0HnzurhlNbCqkPb0bwTrHw3eHy
	rT3XtnmA+7rtmze1E4LxMcoYJDphE9Wqrq3kG/Lu/NieCdgFHHEHnFDd1X36sVsqXXpISucvN/42i
	t0M3ONJx43Rq0uijBlGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRBj-0000000BiZk-2iIJ;
	Fri, 06 Feb 2026 19:08:19 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voRBg-0000000BiYy-2Src
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 19:08:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770404896; x=1801940896;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rD12jZNWPdLcwK9Chg3S5oef/etzrdqixcbLXgsH0rQ=;
  b=OA8hGiHFkE0CsVRLaBh2bMnYBG47oCSRb0/Fth6k4UuoTH10sBlhxL1S
   XTPE6RQ72rfXQywTmtq2omYrbP9Xyrsmxa0WF7tUhe/PUVvJQXwSEuNSR
   BwGsEeEbwhazhEaUbJH0bJ1eY/oZ4+s7O2/C3gtsH+0aP14nmjHyfhSbW
   nO4n0jWcPp3yFUaT1rAa63YB7LpZlQb64p2HRZL2S6kzWMHUdp7u74Qpi
   RLDffKYDddKW3GWE8uYVy08zrH3bNmPT49NAyH2Ic7rfJVn7NvOLMpPd0
   iKtuBBGyPpxirtpLFDJ6FWyd7wi1Jt+UZA0tSlLppGu6XFAa82iWyBEeY
   g==;
X-CSE-ConnectionGUID: 9CCOAsdGSbqYtmZVUdkPJg==
X-CSE-MsgGUID: YzJfVixAQ8qVu2GyofA+MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75239312"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="75239312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 11:08:15 -0800
X-CSE-ConnectionGUID: 5AXItfbKTdefetpi8q88Cw==
X-CSE-MsgGUID: 3Xh8yCxSS/STtLkwnSHfFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="210819971"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 11:08:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voRBZ-00000000l32-1kjn;
	Fri, 06 Feb 2026 19:08:09 +0000
Date: Sat, 7 Feb 2026 03:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v3 2/3] dma: amlogic: Add general DMA driver for A9
Message-ID: <202602070253.hZ9PqUeB-lkp@intel.com>
References: <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_110816_667699_D90503AD 
X-CRM114-Status: GOOD (  10.55  )
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

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-A9-SoC-DMA/20260206-170903
base:   3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
patch link:    https://lore.kernel.org/r/20260206-amlogic-dma-v3-2-56fb9f59ed22%40amlogic.com
patch subject: [PATCH v3 2/3] dma: amlogic: Add general DMA driver for A9
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260207/202602070253.hZ9PqUeB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070253.hZ9PqUeB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070253.hZ9PqUeB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/amlogic-dma.c:7:
>> arch/x86/include/asm/irq.h:39:56: warning: 'struct pt_regs' declared inside parameter list will not be visible outside of this definition or declaration
      39 | extern void __handle_irq(struct irq_desc *desc, struct pt_regs *regs);
         |                                                        ^~~~~~~
>> arch/x86/include/asm/irq.h:44:50: warning: 'struct cpumask' declared inside parameter list will not be visible outside of this definition or declaration
      44 | void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
         |                                                  ^~~~~~~


vim +39 arch/x86/include/asm/irq.h

a782a7e46bb508 arch/x86/include/asm/irq.h Thomas Gleixner   2015-08-02  38  
7c2a57364cae0f arch/x86/include/asm/irq.h Thomas Gleixner   2020-05-21 @39  extern void __handle_irq(struct irq_desc *desc, struct pt_regs *regs);
22067d4501bfb4 include/asm-x86/irq.h      Thomas Gleixner   2008-05-02  40  
d9112f43021554 arch/x86/include/asm/irq.h Thomas Gleixner   2009-08-20  41  extern void init_ISA_irqs(void);
d9112f43021554 arch/x86/include/asm/irq.h Thomas Gleixner   2009-08-20  42  
b52e0a7c4e4100 arch/x86/include/asm/irq.h Michel Lespinasse 2013-06-06  43  #ifdef CONFIG_X86_LOCAL_APIC
9a01c3ed5cdb35 arch/x86/include/asm/irq.h Chris Metcalf     2016-10-07 @44  void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
8d539b84f1e347 arch/x86/include/asm/irq.h Douglas Anderson  2023-08-04  45  				    int exclude_cpu);
89f579ce99f7e0 arch/x86/include/asm/irq.h Yi Wang           2018-11-22  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
