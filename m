Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DD5C44501
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx6DisLNwxjsZMAiPJsVV2yXJnBXxOat/WtX6277i84=; b=yMy9OnHYqXA6Pi
	fOsKZ7uU85LmRksb3yOQBTMnyDzoTB/+zr/rg6TwW1hkiNlsRZBcEQD4luWtavtnddKgBTgckztu7
	cHOGZgqJ3VX71eio6mN4rccDfHrnTX1uidR+hs2Ox0zB2jCR6BlXcYNJw03xqB4zZaRGVD4bcDa4H
	8f7sqe5yRA1JNcXXo94R7BSJQbuz0lEzuJy/o4NaI3R3uZXaNkDm65LiXb7L/U3eVihwM17mZgN7F
	fzeNt+T4LqdObaVaNxPjpIJVFUbhUwFDB7jOrSPmjFP+SGaGBerl5vEVdCm8S6zGG1xuuNOa0qiP8
	2gHR7OtgQCFqD8MkMCow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdgd-0000000CGtN-0S9U;
	Tue, 14 Jul 2026 14:00:39 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdgY-0000000CGsU-3Tyy
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 14:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784037635; x=1815573635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JlTtuTgyttUoJX1tzSz3FCb8u2Xjs4nbU6LV982KfNo=;
  b=LUmqrldBQIp9BYEYVvmS6EFRZGUQcVspqpeDw6qrSDEPQUZrHnlNnxZb
   XV/NQoJSXNBr5bClxaut/rgGgUYt1qXWG2TDNnaRe3hsaAfGIrUhJPWaP
   cE98VyVSPH8LILal/XdJaQP9wlgRrSW5T5MB16VZo7AUyYWfUleGBeTa5
   3ad74JnqK2lSgTxx3HEB4k8YhKY2tn3T6T8L1rAefimqsw4VAq/RxX1AG
   LkNqjiaCMOMqCSWiI2kxWXFsr5xUpHLxv2liFqU/sgS/Ti9PSZdI2dLm7
   /G+huW0SXmhHXAH3kNMA4rj2H5pmWYAW8dEXbk8+RGlzWt4DTRDNVMgIc
   w==;
X-CSE-ConnectionGUID: DSeDFKfRTiGOIoN7C1NsRQ==
X-CSE-MsgGUID: zvX2s4eCSlGm2NuxwdxRYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83781033"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83781033"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:00:34 -0700
X-CSE-ConnectionGUID: z8g/5vJ7ROme4zo2zAVSAQ==
X-CSE-MsgGUID: 4ZauGFZWRNeP3PVTEl3ffw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="260764911"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jul 2026 07:00:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdgT-00000000Mh2-258m;
	Tue, 14 Jul 2026 14:00:29 +0000
Date: Tue, 14 Jul 2026 21:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Alfie Varghese <alfievarghese22@gmail.com>, neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: Re: [PATCH v2] staging: media: meson: vdec: fix advanced concurrency
 and UAF bugs
Message-ID: <202607142142.HnOYDndp-lkp@intel.com>
References: <20260713181602.773-1-alfievarghese22@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260713181602.773-1-alfievarghese22@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_070034_884401_DDE2F216 
X-CRM114-Status: UNSURE (   7.69  )
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
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142142.HnOYDndp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142142.HnOYDndp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/meson/vdec/vdec.c: In function 'vdec_m2m_job_abort':
>> drivers/staging/media/meson/vdec/vdec.c:156:33: error: 'struct amvdec_session' has no member named 'm2m_dev'
     156 |         v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
         |                                 ^~


vim +156 drivers/staging/media/meson/vdec/vdec.c

3e7f51bd96077ac Maxime Jourdan 2019-06-06  151  
3e7f51bd96077ac Maxime Jourdan 2019-06-06  152  static void vdec_m2m_job_abort(void *priv)
3e7f51bd96077ac Maxime Jourdan 2019-06-06  153  {
3e7f51bd96077ac Maxime Jourdan 2019-06-06  154  	struct amvdec_session *sess = priv;
3e7f51bd96077ac Maxime Jourdan 2019-06-06  155  
3e7f51bd96077ac Maxime Jourdan 2019-06-06 @156  	v4l2_m2m_job_finish(sess->m2m_dev, sess->m2m_ctx);
3e7f51bd96077ac Maxime Jourdan 2019-06-06  157  }
3e7f51bd96077ac Maxime Jourdan 2019-06-06  158  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
