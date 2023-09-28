Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE004E732E3
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Sep 2023 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1hGxZMj8IU4gGliaIj2UeY+3Xwpm5iMDyvkJeGPpsY=; b=B/34nVEo8G0yGK
	ZkwgJeV/e4siov5u91BHxoHbMfZ1KHLat/ezlSDlP1J4OvXj1dg3EE4Wern46RIj29aQOQ5unDn9Y
	9hwNMI6xBuoZYHApqEGGZQZGVx+8ycdFkXPcf9QYvTHzpRPFDntWfQqdUomeGTCOpp8YQG67g03Uq
	RLGiKM9Q9rN74vpiqKfO544RnCADysiZ4JbSPRQjgQbftSToY6iu2cUVOEfBkrsksdES9z+QafL78
	uccgKjVlkW48ZRUWaLL9IlL/VhSwXadaFs00oARDPLzNKmDELzHvskFcKKZkyT8UuNyP7l8EZD1dq
	18KE8xC78VwuRdnuj6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsak-005DZi-37;
	Thu, 28 Sep 2023 15:06:15 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsag-005DTl-0K;
	Thu, 28 Sep 2023 15:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695913570; x=1727449570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=82qSmG45u85QY9VwTRRFaJd3r/P+NKsvrvyVwpqtbJo=;
  b=HQRWpq7oUMFmsYJO3r8uEvGBzvHxWZXLsk7HTWg89tywyXu0IQPHlJPa
   2gXjQh6k1vtUGf59K38G5W/Tn38G4KfzT1ILUShrFBgVwD+0+uOILQUsw
   12LQBEbmfJXZ3Cown2R2gvz1l2KSaAWHu7Wfkz/KqGCLTT/HUc0YOJdc/
   630B/bjYl/cIan+2gq322WTySJxDL4+2fJ8E/Z5O2Q6ahvRxvbEUNeyrM
   vITDnpusJamdzBBGx9dBbz6zm6sbCZMMjXCzX6Qrvcypz5IWYh/E9hdPc
   oivWMzuKnymqarVZnPS8OZ8CuWzds6lAMEkQwY7bbaTKcDwdid3/AxwAB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="446235867"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="446235867"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 08:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="873321351"
X-IronPort-AV: E=Sophos;i="6.03,184,1694761200"; 
   d="scan'208";a="873321351"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 28 Sep 2023 08:06:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlsaV-0001aI-1t;
	Thu, 28 Sep 2023 15:05:59 +0000
Date: Thu, 28 Sep 2023 23:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add Amlogic C3 peripherals clock
 controller bindings
Message-ID: <202309282224.aGUP85Fs-lkp@intel.com>
References: <20230928063448.3544464-3-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230928063448.3544464-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_080610_215489_9F1A2B96 
X-CRM114-Status: GOOD (  10.47  )
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

[auto build test WARNING on 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao/dt-bindings-clock-add-Amlogic-C3-PLL-clock-controller-bindings/20230928-143707
base:   57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239
patch link:    https://lore.kernel.org/r/20230928063448.3544464-3-xianwei.zhao%40amlogic.com
patch subject: [PATCH 2/4] dt-bindings: clock: add Amlogic C3 peripherals clock controller bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309282224.aGUP85Fs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309282224.aGUP85Fs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:2:1: [error] missing document start "---" (document-start)
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:50:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml:4:1: but found another document
>> Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
   	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too long
   	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too short
   	False schema does not allow 10
   	1 was expected
   	10 is greater than the maximum of 2
   	10 is greater than the maximum of 3
   	10 is greater than the maximum of 4
   	10 is greater than the maximum of 5
   	10 is greater than the maximum of 6
   	10 is greater than the maximum of 7
   	10 is greater than the maximum of 8
   	10 is greater than the maximum of 9
   	hint: "minItems" is only needed if less than the "items" list length
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>> Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
   	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too long
   	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too short
   	False schema does not allow 10
   	1 was expected
   	10 is greater than the maximum of 2
   	10 is greater than the maximum of 3
   	10 is greater than the maximum of 4
   	10 is greater than the maximum of 5
   	10 is greater than the maximum of 6
   	10 is greater than the maximum of 7
--
>> Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml: ignoring, error parsing file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
