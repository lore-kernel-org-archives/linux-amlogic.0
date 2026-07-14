Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24F1C44508
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 14:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBdVKu1F+hFRtxmJz3wNdcRiOyXCGCAamHK7GANEutI=; b=3wjloAahImSNpp
	5LhmZd35WPS0YbhYqTozbJapkzJWdtG3DWxPWaFmJ3JDOukKYuKSky4RfGfTzKunKp2y6W5aB0+wM
	5/klbtabtGvb1I/HC3gpN95YzR9qdI0f8N/SAzorEqnuahWVMWhTlnFRB13pncES2Cuxu/ED2zswP
	pkVqM7fJWZqAbfn5wDTMZyyxeBhadwQ8zfdE9uu3p6WqaCU4/PlOWDEIz5wbXBpERAme76gdSVpB9
	aB0FIHp6x/ZEtihNLgiUsO8UUxHXWUSX5zzIrZX/c0RRm/sLwwrEVULe6iE28IRH3JbYBpbMMv8Q7
	rmMRZUL2FCgGbASG5hsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje3t-0000000CNRV-0kfy;
	Tue, 14 Jul 2026 14:24:41 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wje3r-0000000CNQm-1CRv
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 14:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784039079; x=1815575079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H/ZL9XREbQ3O7qC+BDXNj/X+Nj529R9ch2SbashdD6k=;
  b=bw4A9APkmNogHbRSXjoI47zIQy3TUx/frEJghNoKuPv3/tji+A50I2C4
   gARuTrTy7wHfbM71EEo6HxNUv5SwxeSjzIGpIWD6C48SK4OFElJO1H3W2
   2jla1/5ec3/ITwX136F5SCvnBhcLqIeWcQTKAu1RuF76dPoxHEX0JPTaq
   uktrF3vCUm1QFx/l2ZeeanjNsD5BDeUsP3iiJvqS5mbFuz0tfSzIHJyNe
   TjefFPN7JUXeyZSXZGBjty3MTgGxW30Os/RXu/U/cdpx9dSrMd3U7M4mO
   vRkzl39VvgzkwULekjE8WdB4sb8p/UUKad8dmVUxc0JMP7snqbxEiRi7B
   Q==;
X-CSE-ConnectionGUID: od/+TkHJTTyKve3UPkOTPg==
X-CSE-MsgGUID: cxyqnSojQf64dQajPKWhBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84780977"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="84780977"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:24:38 -0700
X-CSE-ConnectionGUID: cqN4UK6vTsGet2s2YYn5EA==
X-CSE-MsgGUID: oehtI87aTMiS5jK3QdhnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="255924900"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Jul 2026 07:24:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wje3l-00000000Mia-0hby;
	Tue, 14 Jul 2026 14:24:33 +0000
Date: Tue, 14 Jul 2026 22:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <202607142224.5HqGONfe-lkp@intel.com>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_072439_340526_587EF927 
X-CRM114-Status: UNSURE (   8.30  )
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

Hi Alfie,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Alfie-Varghese/staging-media-meson-vdec-fix-advanced-concurrency-and-UAF-bugs/20260714-023427
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260713181602.773-1-alfievarghese22%40gmail.com
patch subject: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency and UAF bugs
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607142224.5HqGONfe-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142224.5HqGONfe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142224.5HqGONfe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/media/meson/vdec/vdec.c:156:28: error: no member named 'm2m_dev' in 'struct amvdec_session'
     156 |         v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
         |                             ~~~~  ^
   1 error generated.


vim +156 drivers/staging/media/meson/vdec/vdec.c

3e7f51bd96077a Maxime Jourdan 2019-06-06  151  
3e7f51bd96077a Maxime Jourdan 2019-06-06  152  static void vdec_m2m_job_abort(void *priv)
3e7f51bd96077a Maxime Jourdan 2019-06-06  153  {
3e7f51bd96077a Maxime Jourdan 2019-06-06  154  	struct amvdec_session *sess = priv;
3e7f51bd96077a Maxime Jourdan 2019-06-06  155  
3e7f51bd96077a Maxime Jourdan 2019-06-06 @156  	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
3e7f51bd96077a Maxime Jourdan 2019-06-06  157  }
3e7f51bd96077a Maxime Jourdan 2019-06-06  158  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
