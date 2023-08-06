Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A552C001DF
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Aug 2023 05:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqs0n774s4Dxbvrxd5IDt142TsCh8sTCqBPD7DjXVRs=; b=4H4pdkoDBdLsbX
	TzZDj8IENK5x2/Ntyfyy1F/9NklDGuBtjcmo0CdjrV1bGwrtRXAVpAiQkDm+vDypQEkNcPUtUZrVm
	2EoezqUoJfwjF5npyyQKlqNNSuUPVf4HzQl8OlGJcAXASqPRSBfkDPddWIJ8g/Ry8D/E8L3y/6T67
	Fj9Mx6ayiN/yslzQl1fbmtS+QeVDhzHzhdMpaDBLe/UeIbmTvhHvJNEvtYBo27PRXbD4FMmF+4KGA
	C9zrVn+Z6MAwsBiUqR0KlVLk4pJjrQwb6HU9W3330jKrRx92WFg7op70NvWNg/K7X056zYgvo620e
	T8/AXuOYrdnAMwcfBfng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSW3v-00EvFa-39;
	Sun, 06 Aug 2023 05:12:20 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSW3r-00EvDJ-30;
	Sun, 06 Aug 2023 05:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691298735; x=1722834735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyntLaLBLC94wFX1lFmqWsYNfnYmddus6IUHc4nSyaM=;
  b=QJ0SSkmve3IkjeOTq2998IBna8WHj/gNcr+v5rzF2XeX+LdATLzrCcW3
   6ngVlp4vpQFh9rDwhQ1WZfjPUq/h9QALhM1mjUBDiP1bJFHZEdNEwDTGi
   TLOSlpj89/gQAG+jUxvAfRY6lHbKw1N/yhmjP2ZushimvdMY84lYUdDwm
   CV3N7DY9T0u9BymJJcPnJX0oc1COaR4XscQDguKerKstaboisIuLPR9Dz
   60S2tbq4ODGDukcuZnw+jDZgo/5vDX8oN2mbxzUGvJB0fcYvrP8pEo+bV
   5412WxgbYZsCtZ2AksDi9ppHrd0xQThVppLLE1Nk/fAiugStzyR8PdZzy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="456735973"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="456735973"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 22:12:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="730516340"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="730516340"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Aug 2023 22:12:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSW3c-00042R-1b;
	Sun, 06 Aug 2023 05:12:00 +0000
Date: Sun, 6 Aug 2023 13:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Da Xue <da@libre.computer>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Da Xue <da@libre.computer>, Luke Lu <luke.lu@libre.computer>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH v2] net: phy: meson-gxl: implement
 meson_gxl_phy_resume()
Message-ID: <202308061204.L4tEEJAa-lkp@intel.com>
References: <20230804201903.1303713-1-da@libre.computer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804201903.1303713-1-da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_221215_985775_1BE2B0CB 
X-CRM114-Status: GOOD (  12.71  )
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

Hi Da,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.5-rc4 next-20230804]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Da-Xue/net-phy-meson-gxl-implement-meson_gxl_phy_resume/20230805-042033
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230804201903.1303713-1-da%40libre.computer
patch subject: [PATCH] [PATCH v2] net: phy: meson-gxl: implement meson_gxl_phy_resume()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230806/202308061204.L4tEEJAa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061204.L4tEEJAa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061204.L4tEEJAa-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/phy/meson-gxl.c: In function 'meson_gxl_phy_resume':
>> drivers/net/phy/meson-gxl.c:139:9: error: too few arguments to function 'genphy_resume'
     139 |         genphy_resume();
         |         ^~~~~~~~~~~~~
   In file included from drivers/net/phy/meson-gxl.c:13:
   include/linux/phy.h:1794:5: note: declared here
    1794 | int genphy_resume(struct phy_device *phydev);
         |     ^~~~~~~~~~~~~


vim +/genphy_resume +139 drivers/net/phy/meson-gxl.c

   134	
   135	static int meson_gxl_phy_resume(struct phy_device *phydev)
   136	{
   137		int ret;
   138	
 > 139		genphy_resume();
   140		ret = meson_gxl_config_init(phydev);
   141		if (ret)
   142			return ret;
   143	
   144		return 0;
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
