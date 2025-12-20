Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052BE668B4
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Dec 2025 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWPa8U4IzPEBn5FKv8CBM4n+np/8FA2WtzzG3lPVQCk=; b=CtQAuAE8Dv6QJK
	0/VdNZ/F3wH2W6mVkNLHgqIgSWNGGz3nqO7JRGY0jZ0GuSYEmvz/Lc8GYfTin8IUUTrtdVsbEWBkr
	ILkayvlgDG1zgH/2nMEm2ENIHcYUdaowN7k3pSgA2x6QLaUZExM2qbNNPx/n77pIHhRwN8TvWqdos
	0aaodNwiDiiMXMjAsHVbrGkx5mMvS0BZhAPGQs+Gvc4EE/WRY6WgDh5NPUTXfQLcyNAyt6Dj5jh6i
	zM6KIyVuiOnSp5+M+lq1WMHW8vo0qKjlDe8/5743BJktW+bfpI2/SjG9EJFi7W/0oAb9n1Z2wxgq4
	DCIUR/gmdptTxzqdNRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX1bL-0000000Bo6c-3yVN;
	Sat, 20 Dec 2025 18:22:48 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX1bG-0000000Bo5q-468L
	for linux-amlogic@lists.infradead.org;
	Sat, 20 Dec 2025 18:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766254963; x=1797790963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jwD9JF1XWRo08bLaqC1IP6DQSrv2Y2f69IjjEBAuUTs=;
  b=FlSuWPi1cACsyVeKtXSxVjs8fxoAgPADkiQrTMD45TqVJ0w60NIPPh7I
   QKkio1MzvwzYGgiOO+CNslxw/J+JcpqBN+l6KuWQblCyuAVQgOVlvywyX
   owSmhvFM02YcyXPtBGdFROXuUbDPxFEvtz9BqAsbujHm+tSHsIPEPcKeW
   CY6cr8uTUKcnXmA6OLFy7O85dmtA+40LsNc9IgqUQFkPwhZMHtr/BJyHV
   /9ubl4jodVE0yhQevsTrgZW5wxEWl2MGIBI1em7dJl2O3YU0Z+6GNApvs
   SZUBYRT9zt4YOCTSLgibAV4XV+k+hqCFjflIB7E1OB/cZcDf74GubAv8B
   Q==;
X-CSE-ConnectionGUID: jH3tknNWRk+ZLZp+fk+Gww==
X-CSE-MsgGUID: WKGHSpxOTRO6sy/cmUGacg==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68334611"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68334611"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 10:22:41 -0800
X-CSE-ConnectionGUID: eZWzadxLTG6eqk7+ipkMVQ==
X-CSE-MsgGUID: 7F/cbxTQSpuWktK5vEPTeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236556869"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 10:22:38 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX1b9-0000000050X-00FL;
	Sat, 20 Dec 2025 18:22:35 +0000
Date: Sun, 21 Dec 2025 02:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH 2/3] dma: amlogic: Add general DMA driver for SoCs
Message-ID: <202512210111.1UZxHivt-lkp@intel.com>
References: <20251216-amlogic-dma-v1-2-e289e57e96a7@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251216-amlogic-dma-v1-2-e289e57e96a7@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_102243_109155_03C8BE4F 
X-CRM114-Status: UNSURE (   9.83  )
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

Hi Xianwei,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-dma-Add-Amlogic-general-DMA/20251216-163238
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251216-amlogic-dma-v1-2-e289e57e96a7%40amlogic.com
patch subject: [PATCH 2/3] dma: amlogic: Add general DMA driver for SoCs
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210111.1UZxHivt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210111.1UZxHivt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210111.1UZxHivt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/amlogic-dma.c:132:41: error: argument 'chan_ns' to the 'counted_by' attribute is not a field declaration in the same structure as 'aml_chans'
     132 |         struct aml_dma_chan             aml_chans[]__counted_by(chan_ns);
         |                                         ^~~~~~~~~


vim +132 drivers/dma/amlogic-dma.c

   120	
   121	struct aml_dma_dev {
   122		struct dma_device		dma_device;
   123		void __iomem			*base;
   124		struct regmap			*regmap;
   125		struct clk			*clk;
   126		int				irq;
   127		struct platform_device		*pdev;
   128		struct aml_dma_chan		*aml_rch[MAX_CHAN_ID];
   129		struct aml_dma_chan		*aml_wch[MAX_CHAN_ID];
   130		unsigned int			chan_nr;
   131		unsigned int			chan_used;
 > 132		struct aml_dma_chan		aml_chans[]__counted_by(chan_ns);
   133	};
   134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
