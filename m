Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C5FC30653
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Jul 2024 06:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NyeeooukyV5zw/cWb13M6214SUGRADx+HTSCInLZSq4=; b=j33/A9JhJijs41
	488YHbNDDgudVvuXKEEOh0w0JD++C1jQhu2+RhvbL2KXdK0k5wzrSbgYLWjCW2Qc/BVz0Lr1kq0Hx
	Vdg/Qy/xqeCqYtF+KS5FFNS0yXeqMB1KRxJYJ6XXjzQtawneQ0gTFXkeBYBvsfa6kzCK4T13r01Kl
	/mCimVkPa5JQ8iJ2z5dnQbtRFRqIfcGcRkE6PDSQaQ15XjqyvnlwL/t2DtpujCxXaio4rxZs1bdr9
	Rv2lPuf7kt/a66o2ioozAtUlNEzkBcw1PpDW7nq4gDid1zhYetn4hugMLJpobIsn+uLzW6wlmRvSH
	mbnvPcPKGRoTNugX5TfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFeh-0000000CIOm-1D95;
	Thu, 04 Jul 2024 06:09:19 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFee-0000000CIOJ-03DV;
	Thu, 04 Jul 2024 06:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720073356; x=1751609356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pPrL20troWYfB5rDidUUA+6ppOXIvBHM99wUfpYq0BI=;
  b=O/6ba1mnkovGe/T/tk1ruLvv0g5D2NLAiHrGH3B21n85DEBSA7go7jT2
   R2qJQKDYKiZWvoMRBBlvtZ5KOp/1pSLPLuDGb4L/VXCKui0waFdHnfZYB
   G6Kx4+24i0IFja/GS/7KsvCyVm1zcM8+v/CFGjL6jw/7u4No4uWrZWBGy
   BDjrCIWNN11uBsCG3Kgq+ByxIDdnQOmxyVh7ugIoSMnMxGGmAc9D1hXjF
   WbN40j/x6a9ruQB+S+MtyLU+7oGmaRHdQlRDAAtWMc0hEkfuPatVRQ+NO
   5Ur2M8PfgJzkLCnLHCkcG8iMmc4uZ81a9TgPpLSLQgzlyMhDE83ZYyymy
   Q==;
X-CSE-ConnectionGUID: g5mdpv9OSvSCRFhQtydxaQ==
X-CSE-MsgGUID: lboGAGtuQNWHaAZYGcJ9+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="27933683"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="27933683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 23:09:14 -0700
X-CSE-ConnectionGUID: ujL1ThuaT6u4B5IK+EvfHA==
X-CSE-MsgGUID: ru0SIWscSZqNM0pMdSelDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51356292"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jul 2024 23:09:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPFeW-000QdQ-0r;
	Thu, 04 Jul 2024 06:09:08 +0000
Date: Thu, 4 Jul 2024 14:08:10 +0800
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
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic A4/A5 Reset Controller
Message-ID: <202407041333.QnHEnGRY-lkp@intel.com>
References: <20240703061610.37217-2-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240703061610.37217-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_230916_149571_261BED6D 
X-CRM114-Status: GOOD (  10.81  )
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
[also build test WARNING on linus/master v6.10-rc6]
[cannot apply to robh/for-next pza/reset/next pza/imx-drm/next v6.10-rc6 v6.10-rc5 v6.10-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zelong-dong/dt-bindings-reset-Add-compatible-and-DT-bindings-for-Amlogic-A4-A5-Reset-Controller/20240703-184517
base:   next-20240703
patch link:    https://lore.kernel.org/r/20240703061610.37217-2-zelong.dong%40amlogic.com
patch subject: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings for Amlogic A4/A5 Reset Controller
config: arm64-randconfig-051-20240704 (https://download.01.org/0day-ci/archive/20240704/202407041333.QnHEnGRY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407041333.QnHEnGRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407041333.QnHEnGRY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:97.34-111.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:97.34-111.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: reset-controller@2000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,c3-reset'] is too short
   	'amlogic,c3-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
