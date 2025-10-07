Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C392CCA476
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Oct 2025 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZjU7kVJNDPB0Cq8wpGM9v14lPRsbNOtMB0N6yT8hEI=; b=zdPrC0wPqYzXrK
	9EGG/SgWGQsjumK/GBVtb2i/OS9ZowzbBj9Ok8sw2dHQ2GU4UueVsaj2Rpj/6ZDSPBT6n450dE334
	4039y6SzZCo20YvHMDSiRgD4yHMX3Yr3KevS7G0nU71V/2r+JYab81YWFSRaqwlsBzWzzNgWODm1q
	snPNq4gW7JOWqmoBc4F4xmBXXCYk5SQLDxjjw5QsItAlicU/+26pFfRwOz0MfNl91c/IXrAoGPnkf
	vfjkGaskKZpkGxL4RjJhHmzphqztSvPF4bpRzmB5pur04lFrCPQr6kroGUWXwAARLzL7R+G9r4cOH
	6kQNZiaWO4ayAm0alxfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DRW-00000002gJJ-0Syq;
	Tue, 07 Oct 2025 19:33:50 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6DRS-00000002gIv-3ws6;
	Tue, 07 Oct 2025 19:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759865627; x=1791401627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ABVdOdS45tzlNhfhjOVPvsY/QQgFK6EkT8seexuK4M=;
  b=EEzuK/vYcLDDQH0venBcAsT5V1wcDJBkJBoTp55BY7kIbFIg5TPfQnd3
   jZRFCt8eMFvuL6n4D4SvAYn3tMOwtDoH0cFPdTKraDDUcnU13GoTe1BfM
   aeVwIp7Jx2SP4BOok8claNRBUw+9RlTySPhRkHUMKRmjFwGuwfeS1g+p2
   r/Ujk+dBLEjAsbd643sqgUP333JP4bjsIFtIGLb4dp3BbQamgpuxdqVT6
   6MFeK8jqMqPcTlBgGMmtngQBrKZXUX8WjTnwUpfjZzI3pF2WpiqGArCoD
   xg2Lk0iA3gdhreUexeeKwnUk8yITmDXKhsKEN8oQmryGEicf9mF9QriY3
   w==;
X-CSE-ConnectionGUID: fxqZL4EKTDC6MNk6GYEd7g==
X-CSE-MsgGUID: HUlkX52fSU+Hs+Rs4rgoYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61974151"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61974151"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2025 12:33:42 -0700
X-CSE-ConnectionGUID: xPssVK6ERI6TqiI6LcTAGg==
X-CSE-MsgGUID: ia3cnOsoTy6733I3bchwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; 
   d="scan'208";a="203958184"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 07 Oct 2025 12:33:38 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v6DRH-000000007wv-2ZFu;
	Tue, 07 Oct 2025 19:33:35 +0000
Date: Tue, 7 Oct 2025 21:33:05 +0200
From: kernel test robot <lkp@intel.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock
 controller node
Message-ID: <202510072131.VRSrXJh7-lkp@intel.com>
References: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_123347_045221_69CBA238 
X-CRM114-Status: UNSURE (   9.47  )
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

Hi Chuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 01f3a6d1d59b8e25a6de243b0d73075cf0415eaf]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuan-Liu-via-B4-Relay/dt-bindings-clock-Add-Amlogic-A4-SCMI-clock-controller/20250930-174011
base:   01f3a6d1d59b8e25a6de243b0d73075cf0415eaf
patch link:    https://lore.kernel.org/r/20250930-a4_a5_add_clock_driver-v1-11-a9acf7951589%40amlogic.com
patch subject: [PATCH 11/19] arm64: dts: amlogic: A4: Add peripherals clock controller node
config: arm64-randconfig-2051-20251007 (https://download.01.org/0day-ci/archive/20251007/202510072131.VRSrXJh7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c410e88f0f8c0654d7744d6d029009f9cb736143)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251007/202510072131.VRSrXJh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510072131.VRSrXJh7-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi:119.19-20 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
