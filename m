Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A6AC5321E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2024 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5VP2JALJWBEW9R4gxOPUXh5LeqwKt1J02Z2kpGb9DY=; b=5EYlh4pzcRvf9e
	3VK2xp1Pv2ir2hHhvIPQhanecycrknteZ+iZYqPytY5ON+S71AjqlfnXhMs8gc2N+KnVCjlgzrGWH
	nEod+dnwo/syU129P1GatCsEGfWKLW1cxhquDVHhQeMch8anYSV0W7d0eZjA528MIDWDwYXJf6MB/
	i8AblEE06xR75g+rzGtLOK9TT61W2VRqhbH39YrEtzeCBrvLIgmtxzfaGqKwnT33RinevYr6sH/KK
	ZUqsKWYWy4E4lx6nL9Xew3874clJAIe3c2b1z42O1U+menMJWRYILAo1P0Kx7ngP9wq/N9YrcqKjb
	WIrII5LyxJw31f2Nhdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZIQ-00000007QeA-21C9;
	Mon, 26 Aug 2024 12:58:10 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siZIN-00000007QdA-0yha
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Aug 2024 12:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724677087; x=1756213087;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+PbHs8l+qbavMVlAXLwDj8SfpLxFMgAxuZhwJr8ymE0=;
  b=hGphyEwF7frnJNA2dEPB0F6zzOgHkzyCTtFPq6gQfZFaOeUyuTZOKOKN
   /BX4BGB6tKEIgWoHUqFfmitQtDSQ8w7McSE+j0qErs2Bbzt5AVbhc/5hQ
   7yDd5+ZtgHNQGMG4LKfvZlGfvhPs1a1w/lFPBjlGssKz9ic2/SwUAvyKn
   038fKYk9Rnsgr7iyP9VAejJndz6rbq5zlw+Jj5fTMYH3O9zBAtHOchG2a
   cB+VXnloOHChyTMXXmgUPcJqOGoCKKca7epwiiKokfpj31JSXRFqaG8jP
   f1ObR+j9uJ5eEx/ea65xd6GNatwsm9rbaVdEQ3hdkVZWCsszv2Zc8tecB
   Q==;
X-CSE-ConnectionGUID: hBcGHxaRRq6JC+7ut9WNBA==
X-CSE-MsgGUID: E0U3HFHKTfCcP4JeyPQntw==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="45614095"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="45614095"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 05:58:06 -0700
X-CSE-ConnectionGUID: v8gTvY0mSQOLgpDYqNeKHw==
X-CSE-MsgGUID: leVOLblET+yax54yva8Ong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="67200477"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Aug 2024 05:58:03 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1siZIH-000H63-0F;
	Mon, 26 Aug 2024 12:58:01 +0000
Date: Mon, 26 Aug 2024 20:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Yiting Deng <yiting.deng@amlogic.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] rtc: support for the Amlogic on-chip RTC
Message-ID: <202408262035.4BysJ5CK-lkp@intel.com>
References: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240823-rtc-v1-2-6f70381da283@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_055807_666267_2656F1E1 
X-CRM114-Status: GOOD (  12.46  )
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
config: i386-buildonly-randconfig-003-20240826 (https://download.01.org/0day-ci/archive/20240826/202408262035.4BysJ5CK-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240826/202408262035.4BysJ5CK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408262035.4BysJ5CK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-amlogic.c:159:6: warning: variable 'alarm_sec' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     159 |         if (alarm->enabled) {
         |             ^~~~~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:173:19: note: uninitialized use occurs here
     173 |                 alarm->enabled, alarm_sec);
         |                                 ^~~~~~~~~
   include/linux/dev_printk.h:168:46: note: expanded from macro 'dev_dbg'
     168 |         dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:159:2: note: remove the 'if' if its condition is always true
     159 |         if (alarm->enabled) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/rtc/rtc-amlogic.c:157:20: note: initialize the variable 'alarm_sec' to silence this warning
     157 |         time64_t alarm_sec;
         |                           ^
         |                            = 0
>> drivers/rtc/rtc-amlogic.c:565:34: warning: unused variable 'aml_rtc_device_id' [-Wunused-const-variable]
     565 | static const struct of_device_id aml_rtc_device_id[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +159 drivers/rtc/rtc-amlogic.c

   153	
   154	static int aml_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
   155	{
   156		struct aml_rtc_data *rtc = dev_get_drvdata(dev);
   157		time64_t alarm_sec;
   158	
 > 159		if (alarm->enabled) {
   160			regmap_update_bits(rtc->map, RTC_CTRL,
   161					   RTC_ALRM0_EN, RTC_ALRM0_EN);
   162			regmap_update_bits(rtc->map, RTC_INT_MASK,
   163					   RTC_ALRM0_IRQ_MSK, 0);
   164	
   165			alarm_sec = rtc_tm_to_time64(&alarm->time);
   166			if (alarm_sec > U32_MAX) {
   167				dev_err(dev, "alarm value invalid!\n");
   168				return -EINVAL;
   169			}
   170			aml_set_alarm(rtc, alarm_sec);
   171		}
   172		dev_dbg(dev, "%s: alarm->enabled=%d alarm_set=%llds\n", __func__,
   173			alarm->enabled, alarm_sec);
   174	
   175		return 0;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
