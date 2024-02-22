Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E29C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 05:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixRr4BYN+hYbEvDaO7PNawVTYhdqxlaMCewmVh6ubc0=; b=nH+yv0eNY+DDqZ
	JjLPcOkcRq8PN64bC0ngFbHWGPwgF2ubSkupULXNSy1KwTODBWxlcjojuhN5PGLxV9JzGLR+M+3m6
	Nvyq0c7nEPvB2rv8cMY1AMX7EXvrbM2kc0DgZIR8ZSqoVR0oIA4N4J2xOD8lYxNOfxOkNJpTEXs8H
	5EEmyXIlcy1/P6yxsCytQp/zBQHh2uzSZU92WFufOcwhL2X+y/VkKCekU5oKFQXp+wZR2+i8VDyZZ
	rgYgH2O9ygewnUxiolzK8j24hQbpjwhe3yRlo+dv3czFf9ygJ+x4mKSv8B0XH9eQJLykiHqPE2NOx
	ULL1WnuA9guDYbE8HLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1lQ-00000003cDE-0yzx;
	Thu, 22 Feb 2024 05:36:56 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd1lM-00000003cCJ-3FGU;
	Thu, 22 Feb 2024 05:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708580213; x=1740116213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QeI2uBjQcu057UUOzLotCkKnUelckhJN0RTsfRbGdyE=;
  b=BEC10fWBGnDCI/dKj0wMkF7w6vqeJihaLzyICvdppwvswvQzOAWDxjE+
   eEqOpgkDrninmWj6BCuXXQISGEGKrcgt8a8EHyQcLCtulVWHaQUFj5Bqx
   TEiFp9duuJ8/1oQ5TWh1FfbKDnp5m8TeLDD6bJT2u6xD2F0zdpvl0BTbK
   gXLz3cJHBVQpa3hwe5OVIm0J/8zQWdStPbKNGMFlxU6kOqdTMUFKRWpBL
   fdvH6mocYObZydAGl2iAHG8xoPpzH4RvqWglW1kpHX6O+pSWA/B2X+1gg
   0M2uPAoFrE2LO/rsp5gYSntKoVRa6sybL2ZAPd4VJRp+kXFpLCyCuokEC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="13406323"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="13406323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 21:36:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="9975667"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2024 21:36:42 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd1l9-00061A-2w;
	Thu, 22 Feb 2024 05:36:39 +0000
Date: Thu, 22 Feb 2024 13:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Viacheslav Bocharov <adeep@lexina.in>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic
 secure-monitor SoC Information driver
Message-ID: <202402221322.ifGMGQa6-lkp@intel.com>
References: <20240221143654.544444-3-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221143654.544444-3-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_213652_849091_BE4B4251 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Hi Viacheslav,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Viacheslav-Bocharov/soc-amlogic-meson-gx-socinfo-move-common-code-to-header-file/20240221-224803
base:   9fc1ccccfd8d53dc7936fe6d633f2373fc9f62e8
patch link:    https://lore.kernel.org/r/20240221143654.544444-3-adeep%40lexina.in
patch subject: [PATCH v2 2/3] soc: amlogic: meson-gx-socinfo-sm: Add Amlogic secure-monitor SoC Information driver
config: arm64-randconfig-002-20240222 (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221322.ifGMGQa6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221322.ifGMGQa6-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `socinfo_get_chipid':
>> meson-gx-socinfo-sm.c:(.text+0xac): undefined reference to `meson_sm_call_read'
   aarch64-linux-ld: drivers/soc/amlogic/meson-gx-socinfo-sm.o: in function `meson_gx_socinfo_sm_probe':
>> meson-gx-socinfo-sm.c:(.text+0x438): undefined reference to `meson_sm_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
