Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FCC5321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 13:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5uyZ8GT7xbKfgvdfF1nAyV1mQPxGItzzj3BzCV1wbc=; b=M8VzBh8FQPOanp
	X0LDvRnjJzyQF1y+1pejVeUyR/TSJrzG5BN0bDJenDt0w40SJsI87Hv2+9f6byoKHba+CDbtcUNkQ
	cfaKigZOYYGNTR0B8klWWc4QTAJoTkhSbILgblLTw8nJjOTAu7oSmao0wt9Nrnhs7oVERAK7PFioK
	p4TliEUp55mbYc3DBLCgfZgIa8usA5TVF2RBS/KBjDRnVidr8w7OK/WltlBh3Wf/zvhzmo+FkpvVc
	LVRLeS0+jDhtE7Ffd8HfjCxjeqadMdGBbD4TOKVjILL6VykfZ9CEGV8QNq57flZfj55G8Sw6nk/qu
	ezusY/yNb7YIJBKfFgRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZdl-00000007TuF-2Nso;
	Mon, 26 Aug 2024 13:20:13 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZdh-00000007TsN-43nm
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Aug 2024 13:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724678410; x=1756214410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L7ncuygwK7+Kr9c0J0XU++WFSpxV2mOazxQHlKpiK+o=;
  b=irCttRd8p2sLFPdwNlPDHKu0GKobo4MJ6XGSOc+LRWNVHY0S37b4I2k/
   s12k2YJEis4FjNdjEx1cm9agiBlcVOUVXlsetyRoWqk7G5jewKpztKlNz
   2mH0ZhumGxYfp1P7uCHqHO63VbGxGP4nN9JVZLRoYd1X1+1+4/E3MHUuc
   zoLVfgqf601zkzs6CC9R9k8kwlFgRsN2LFuBVho/A+9ul8PUEd0GsI6Vr
   Sz8FTqf6ioNorppdO5coULcgmdTdBXbzNHWsZqFZmtUZlh8Gtqk4R77qb
   KzqC40hZCkzziai1F1uDYg+oMAXBiK/myYXtgZCLm3e6rdCBdYgQwO/w9
   g==;
X-CSE-ConnectionGUID: pAQAOweDQR+xPuOMhHrcug==
X-CSE-MsgGUID: YBPx86uJQzqpD92bd4aurQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23266492"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="23266492"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:20:08 -0700
X-CSE-ConnectionGUID: JF/zFlvhQFeztm9udLuJrA==
X-CSE-MsgGUID: THkbdf54S3G4yPuV3/ZMgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93233607"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:20:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZdb-000H75-0W;
	Mon, 26 Aug 2024 13:20:03 +0000
Date: Mon, 26 Aug 2024 21:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <202408262106.tU1zTUfx-lkp@intel.com>
References: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_062010_039198_6048A6A1 
X-CRM114-Status: GOOD (  11.27  )
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

[auto build test WARNING on dff71e5c6076314f3eefe700abd6af834c57bd64]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-rtc-Add-Amlogic-A311L2-and-A113X2-rtc/20240826-125504
base:   dff71e5c6076314f3eefe700abd6af834c57bd64
patch link:    https://lore.kernel.org/r/20240823-rtc-v1-2-6f70381da283%40amlogic.com
patch subject: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
config: arc-randconfig-002-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262106.tU1zTUfx-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262106.tU1zTUfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262106.tU1zTUfx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic.c:545:12: warning: 'aml_rtc_resume' defined but not used [-Wunused-function]
     545 | static int aml_rtc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/rtc/rtc-amlogic.c:535:12: warning: 'aml_rtc_suspend' defined but not used [-Wunused-function]
     535 | static int aml_rtc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/aml_rtc_resume +545 drivers/rtc/rtc-amlogic.c

   534	
 > 535	static int aml_rtc_suspend(struct device *dev)
   536	{
   537		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   538	
   539		if (device_may_wakeup(dev))
   540			enable_irq_wake(rtc->irq);
   541	
   542		return 0;
   543	}
   544	
 > 545	static int aml_rtc_resume(struct device *dev)
   546	{
   547		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   548	
   549		if (device_may_wakeup(dev))
   550			disable_irq_wake(rtc->irq);
   551	
   552		return 0;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
