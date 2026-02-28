Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD7FFEE4ED
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Feb 2026 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1ZKt9REa+umDamQSYtHET1gRYCU0bw2kdKdCysLyKg=; b=pPWloxKvsaLUx8
	xKLNKLxuKEEedOcppaMLGlVni6J7DAOSi8XP5KR0jfFCCh6AnQDFy9buNvEOiyMKo7V2ZYVqVEzSE
	Ufuvrg9Gqitfqp+83iolnB0THnr4R/5Bm4/Nya5UEVsZvLmad9a1Gr4ddefm91sRILeq3XTstQUFW
	g1pWmWVru6ROgn1mPKxgrYy8JBQoyjZEmng8UBxt7pCNK5T9Kanb9B0f5Vu2PODD2xiwMxp0eoUFP
	zg1g680sOzN89KKSQSaiS/P6x68am5J+QXi1vqNlImNI2J005FOQBVaNunZsqp4sDunwsoPc17SsN
	ngR/QeXKG0c3cgHowFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMzh-0000000A2Qj-0Gfd;
	Sat, 28 Feb 2026 16:16:41 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwMzb-0000000A2QD-36le;
	Sat, 28 Feb 2026 16:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772295395; x=1803831395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FTMVrcjVBVArTF9gUzreKVm48y2lSWx3trNzODOS+/Q=;
  b=h+yR3cnT3LlpAp8KIgzJh5vDfriFJzS4Gk6mx8apouCRor0ZJMbC5bGk
   oCpFkpSXQqlBOecx046oK7B+olUsE9uN6SNAc8Qvh8gATFu6VVZ3oKt08
   hMFLimi+1oQyzw5Uz5RbVYkOHK/Dg8Tyo+v/sAl7m/x6zF31el34SOkrw
   ERgPRS1BTc/aAWVioC/V3qqS2j0h+H+zwqsMSywA77juCpqpTbNwpzSp9
   WebXoEz96qL6tCd5Wg9HGpMK3fNZTIYuYhbQVMv+ed5zpvFNbMheHWjlp
   5PBOEhk7G6D6XM/TRzGYJVHxOuaQ0svEiruMiF1qKcJjA4HipyMbqCtqS
   Q==;
X-CSE-ConnectionGUID: XFdP04PbRgW3pixciEVDXA==
X-CSE-MsgGUID: /BiNObgqRd6k8priS0y/8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11715"; a="84064523"
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="84064523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2026 08:16:30 -0800
X-CSE-ConnectionGUID: Q2razoWDShi+2QE15EYlog==
X-CSE-MsgGUID: gR/OaD3BQ4q9j8d6rlim0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,316,1763452800"; 
   d="scan'208";a="214521553"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2026 08:16:26 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwMyl-00000000BgN-3jwt;
	Sat, 28 Feb 2026 16:15:54 +0000
Date: Sun, 1 Mar 2026 00:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: amlogic:
 meson-s4-s905y4-khadas-vim1s: add Function key support
Message-ID: <202603010009.VfPuPoeI-lkp@intel.com>
References: <20260228065840.702651-5-nick@khadas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228065840.702651-5-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_081635_828577_2BB6EA24 
X-CRM114-Status: UNSURE (   9.56  )
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

Hi Nick,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on robh/for-next linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Xie/dt-bindings-iio-adc-amlogic-meson-saradc-add-S4-compatible/20260228-150346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260228065840.702651-5-nick%40khadas.com
patch subject: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key support
config: arm64-randconfig-001-20260228 (https://download.01.org/0day-ci/archive/20260301/202603010009.VfPuPoeI-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603010009.VfPuPoeI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603010009.VfPuPoeI-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts:50.18-24 Unexpected 'KEY_FN'
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
