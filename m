Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94783EE6B5E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Feb 2026 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIb94Gr9Wla8u5yl718TqPoWTq3HOwPconR6IxIStOE=; b=rBAEwVmP2mYGbs
	KrVfoE9BqbxV06uczhNytVV8vbRM8w3SMD9kUb2aIJqJetqzrSaLOdEgkwphNmVTwj8Hwocc2o37x
	XKIBmtM9IZc9Ml2S0ThVRL4+jxIJttWu+I1XSvI9tNAUVP1kZUEZsHVVOoBl8z0qntXQV2EzZz/Xu
	byJWfuN61hAwc0af+ABnqkcRAYRItPPTf6kcbb5+qO5ru2guXeSDGpXXTV/AalHYA2NOCJmjgTSE2
	VbSubWL3gQlNolkunlFWAGXMOOe/QbYh6NOSb5UfFEflC3nFG8zXFtlgeYGAQoPslEX2AbbKJtXeQ
	a71wODMj5v7gRPfOTvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSrP-0000000BpGs-1Vxb;
	Fri, 06 Feb 2026 20:55:27 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSrM-0000000BpGV-15qw
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Feb 2026 20:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770411324; x=1801947324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X+eWBpV8ZAR9jabdyDhZG5ofyC+EhlTNpb50tOC/kxU=;
  b=DWCNQUtVrqZ2XvuWjUxitTOjuUpX8ZfYWeWx6K6EClsjb7JyQ78bJGqs
   WBC2+mXesMAL2cFH/wp+fldeOEm0HWx4fLZX8S8D1tD+llu/HNwA5wlMl
   WGNxWPktyTwaGveriy1t17ivRHy3BLd/J9RoFAdtPPHNOLXGFdusZqpHP
   vCe70vZMo/AK5Mwa5HzdmZWj7FkBkajeE2w/5QFS3st0C6YtVos7od0Rs
   kJ3AL0ucQC56iQ0LpVrM9XTSKU7TaPeGNiYlesS2iA6vfD02SBslUmwSJ
   fYC3pLjzhunbXn0fNlh/h+qooLmLTc3hWPSmKICG0CVsenZKWtAcjR3lS
   g==;
X-CSE-ConnectionGUID: T2DmJ2q5Q7Cj+GzlV916JQ==
X-CSE-MsgGUID: i8vENWVWRtSgyvARHecH1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71515673"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71515673"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 12:55:21 -0800
X-CSE-ConnectionGUID: dPfe5RjfTYu2zLNp7Dcxyw==
X-CSE-MsgGUID: Hj7hgcNFTDOtKSad59wzHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215945774"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 12:55:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voSrC-00000000l8a-3BHi;
	Fri, 06 Feb 2026 20:55:14 +0000
Date: Sat, 7 Feb 2026 04:54:53 +0800
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
Message-ID: <202602070410.F1U5kBFE-lkp@intel.com>
References: <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206-amlogic-dma-v3-2-56fb9f59ed22@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_125524_374984_C803B2CA 
X-CRM114-Status: GOOD (  13.88  )
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

kernel test robot noticed the following build errors:

[auto build test ERROR on 3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-A9-SoC-DMA/20260206-170903
base:   3c8a86ed002ab8fb287ee4ec92f0fd6ac5b291d2
patch link:    https://lore.kernel.org/r/20260206-amlogic-dma-v3-2-56fb9f59ed22%40amlogic.com
patch subject: [PATCH v3 2/3] dma: amlogic: Add general DMA driver for A9
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260207/202602070410.F1U5kBFE-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070410.F1U5kBFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070410.F1U5kBFE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/mips/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/smp.h:116,
                    from arch/mips/include/asm/irq.h:13,
                    from drivers/dma/amlogic-dma.c:7:
   arch/mips/include/asm/irq.h: In function 'on_irq_stack':
>> arch/mips/include/asm/thread_info.h:98:22: error: 'PAGE_SIZE' undeclared (first use in this function); did you mean 'TASK_SIZE'?
      98 | #define THREAD_SIZE (PAGE_SIZE << THREAD_SIZE_ORDER)
         |                      ^~~~~~~~~
   arch/mips/include/asm/irq.h:19:41: note: in expansion of macro 'THREAD_SIZE'
      19 | #define IRQ_STACK_SIZE                  THREAD_SIZE
         |                                         ^~~~~~~~~~~
   arch/mips/include/asm/irq.h:41:36: note: in expansion of macro 'IRQ_STACK_SIZE'
      41 |         unsigned long high = low + IRQ_STACK_SIZE;
         |                                    ^~~~~~~~~~~~~~
   arch/mips/include/asm/thread_info.h:98:22: note: each undeclared identifier is reported only once for each function it appears in
      98 | #define THREAD_SIZE (PAGE_SIZE << THREAD_SIZE_ORDER)
         |                      ^~~~~~~~~
   arch/mips/include/asm/irq.h:19:41: note: in expansion of macro 'THREAD_SIZE'
      19 | #define IRQ_STACK_SIZE                  THREAD_SIZE
         |                                         ^~~~~~~~~~~
   arch/mips/include/asm/irq.h:41:36: note: in expansion of macro 'IRQ_STACK_SIZE'
      41 |         unsigned long high = low + IRQ_STACK_SIZE;
         |                                    ^~~~~~~~~~~~~~


vim +98 arch/mips/include/asm/thread_info.h

^1da177e4c3f41 include/asm-mips/thread_info.h Linus Torvalds 2005-04-16   97  
^1da177e4c3f41 include/asm-mips/thread_info.h Linus Torvalds 2005-04-16  @98  #define THREAD_SIZE (PAGE_SIZE << THREAD_SIZE_ORDER)
^1da177e4c3f41 include/asm-mips/thread_info.h Linus Torvalds 2005-04-16   99  #define THREAD_MASK (THREAD_SIZE - 1UL)
^1da177e4c3f41 include/asm-mips/thread_info.h Linus Torvalds 2005-04-16  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
