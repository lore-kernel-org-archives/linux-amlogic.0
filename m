Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCC8CCD1A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Oct 2025 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQU1wyiZiOjBfTnBQPCSYeaxhXyfjXd+oKH6Dr5Me40=; b=RsN4l0etZvqAwg
	SiMSIgndQEixsCVlVmYrcWo7vsUJmIWaDFw4QUOdm4Dhx9XZSAxclDRV1EGrzScoRxrzxIqMBU79e
	hQ3elfQcwwxuij5yNysbZ/imq2CVzaRkHJLQrPZkY3AgnnO/iLjw6A6f/6F5DwV2F2rrEOF1+WYq/
	/4+bLEmoXlrFFypTRHZw+TuR6gjv17kBHtEFpJIWZqtbHqPDTbY3xZAHizwGzs+p1JaybWv17dRut
	IHNA2HzUS0krJvbIp2Ii/qeBDEBuREVLb9miELtvF8Y29TjNbJBHdRsZnsC6zuxriFKg4aAoqsuEX
	nOyui9jGYEw2ADL3vQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8kx-0000000GSqD-3PmW;
	Tue, 21 Oct 2025 09:34:15 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8kv-0000000GSpl-2NyX
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Oct 2025 09:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761039254; x=1792575254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NuNaGs/aTEkE7RGJzLyuoXHuGc7MDkZXmN/08+xvIOc=;
  b=kBjfuz6Ks6UYbIM1Nj9kdRbc3Ji9tIyV503ln6phtabjxpj31Odiyvry
   RId/sA2fgm5K+c8+m23ahNG7XfcZtQ/W890guH6LfAgprIQ1d2/PxZMKh
   yDLGpGOWAIf59s7afgzhJYnw9NyY4hxUwsxMv8yn3jX1CXX6nxvqy4Jw+
   QDp4wxhaZtrTTJ4DmiXhlOt0/iXdi/+mSFr5V7d2/6E6ibhCZW+rsiUob
   PehVqrXUynudK4jqpJrEOANfCpuIw/nXxaE8XzuC3zC8vZ2SBVDg8yKmq
   mfPswE4YpYq729d51iD0D5RQqm50px5B5T4hMsqiAx9xFnOQSig5EIOhg
   A==;
X-CSE-ConnectionGUID: VygPtRtPQ9iHtFDXHeGnFg==
X-CSE-MsgGUID: KFEsbDdeSEq14jbHwCR/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63066487"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63066487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 02:34:12 -0700
X-CSE-ConnectionGUID: vD6z0ZsJRle3uMTT2KkwVg==
X-CSE-MsgGUID: xor/ioRCQdqRm1zZIOR81A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="183254367"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2025 02:34:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB8ih-000AhN-37;
	Tue, 21 Oct 2025 09:33:39 +0000
Date: Tue, 21 Oct 2025 17:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] rtc: amlogic-a4: fix double free caused by devm
Message-ID: <202510211756.vnQ8ZIWo-lkp@intel.com>
References: <20251020150956.491-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020150956.491-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023413_669490_78BBC856 
X-CRM114-Status: GOOD (  11.08  )
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

Hi Haotian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haotian-Zhang/rtc-amlogic-a4-fix-double-free-caused-by-devm/20251020-231345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20251020150956.491-1-vulab%40iscas.ac.cn
patch subject: [PATCH] rtc: amlogic-a4: fix double free caused by devm
config: i386-buildonly-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211756.vnQ8ZIWo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211756.vnQ8ZIWo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211756.vnQ8ZIWo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic-a4.c:425:23: warning: unused variable 'rtc' [-Wunused-variable]
     425 |         struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
         |                              ^~~
   1 warning generated.


vim +/rtc +425 drivers/rtc/rtc-amlogic-a4.c

c89ac9182ee297 Yiting Deng  2024-11-12  419  
c89ac9182ee297 Yiting Deng  2024-11-12  420  static SIMPLE_DEV_PM_OPS(aml_rtc_pm_ops,
c89ac9182ee297 Yiting Deng  2024-11-12  421  			 aml_rtc_suspend, aml_rtc_resume);
c89ac9182ee297 Yiting Deng  2024-11-12  422  
c89ac9182ee297 Yiting Deng  2024-11-12  423  static void aml_rtc_remove(struct platform_device *pdev)
c89ac9182ee297 Yiting Deng  2024-11-12  424  {
c89ac9182ee297 Yiting Deng  2024-11-12 @425  	struct aml_rtc_data *rtc = dev_get_drvdata(&pdev->dev);
c89ac9182ee297 Yiting Deng  2024-11-12  426  
8c28c4993f117e Wolfram Sang 2024-12-17  427  	device_init_wakeup(&pdev->dev, false);
c89ac9182ee297 Yiting Deng  2024-11-12  428  }
c89ac9182ee297 Yiting Deng  2024-11-12  429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
