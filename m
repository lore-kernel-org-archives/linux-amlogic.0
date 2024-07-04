Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC24C30653
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jul 2024 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/342/jtc0+zuCl0K0Ency6QI2YlY7vVOowvaEr/cuI=; b=tvkMmH2FOhN+9U
	B4MHyP6xbT6+5dE71ZSTNhJxJBxnKKp6g/B1nVCZhdtsWtqpe74KHlfDJjsiBJst6YwilkhrGfFSE
	3fNRyQZV5LfsTRS+RVMpN1rG/gpN+N1iINj5RVl2pb+fmgaP721Xw9VrzYx+7QZZ6n4AHO0zILSoh
	ajd4Rdr2QWQtxTQgCBGcY1k2D7Y/kYlvfcB8kIi7XrmdEaSAvyQKpfepvE0rz1jsw5n+d+91eUdm/
	3cSbClOvk5vWockgM2IBdm4Ph3awus7nZw2OLrT60tlgFTEYkKL6Q8iDC22JyJ8DN6v5PcjD8XubW
	hK5dIwWPMDZOlb+APWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHKU-0000000CVpK-2IAW;
	Thu, 04 Jul 2024 07:56:34 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPHKR-0000000CVoS-3FOx;
	Thu, 04 Jul 2024 07:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720079792; x=1751615792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AjQyGUJZ0vfY7qZ8Lmdw5nPCnEsUxgopR1OuiDeFoYo=;
  b=BtspfWWm5GdwRPevBZL1NwW08bHIw8+eIvF48K3T2OyHQk4j7qDHsgZa
   AUaLAbLqIk8CzOK4fiJnG6I74YVI/VJvlqCJHMzHl/IqHqlq6YaKjNqoL
   LrmoFMisI+O/q3xOoqo97msvnfNETJgm1KsYZfJ7Lt64CIs9biiQN7VcO
   EExlWwQfYcYKdo8DmqExU9PRHTLMxQLXtnX6m8ocSshhzQYrQjtyqANma
   xKdc0aEUnq5XYGIc62q5BBFOtY35fynJKwF/eO2Xr3cR7z7Kz3YC0GSIc
   XzuDh1BhgNklYByU7PO9D+3MhmCOauZIUOOq+pO5hSgWKL9fBj0sHsEXf
   w==;
X-CSE-ConnectionGUID: bfUWmYsJSROuIfgzvm9FTQ==
X-CSE-MsgGUID: xXMlKMrnRsmXFd8oY6ihjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34792125"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34792125"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 00:56:15 -0700
X-CSE-ConnectionGUID: 2YDfhjTxQdCe2Yn4QD7Jkw==
X-CSE-MsgGUID: 01nKX0/rTTqXDDG/vnNDOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46660403"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Jul 2024 00:56:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPHK4-000QjA-1y;
	Thu, 04 Jul 2024 07:56:08 +0000
Date: Thu, 4 Jul 2024 15:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: zelong dong <zelong.dong@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kelvin.zhang@amlogic.com, Zelong Dong <zelong.dong@amlogic.com>
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic A5 reset controller
Message-ID: <202407041520.P9v4H7Sq-lkp@intel.com>
References: <20240703061610.37217-4-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703061610.37217-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_005631_889848_2397586D 
X-CRM114-Status: GOOD (  10.44  )
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

Hi zelong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240703]
[cannot apply to robh/for-next pza/reset/next pza/imx-drm/next v6.10-rc6 v6.10-rc5 v6.10-rc4 linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zelong-dong/dt-bindings-reset-Add-compatible-and-DT-bindings-for-Amlogic-A4-A5-Reset-Controller/20240703-184517
base:   next-20240703
patch link:    https://lore.kernel.org/r/20240703061610.37217-4-zelong.dong%40amlogic.com
patch subject: [PATCH 3/3] arm64: dts: amlogic: Add Amlogic A5 reset controller
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041520.P9v4H7Sq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041520.P9v4H7Sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041520.P9v4H7Sq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a4-a113l2-ba400.dtb: reset-controller@2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,a4-reset', 'amlogic,a5-reset', 'amlogic,meson-s4-reset'] is too long
   	'amlogic,a4-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,t7-reset']
   	'amlogic,meson-s4-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
--
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,a4-reset', 'amlogic,a5-reset', 'amlogic,meson-s4-reset'] is too long
   	'amlogic,a4-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,t7-reset']
   	'amlogic,meson-s4-reset' was expected
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
