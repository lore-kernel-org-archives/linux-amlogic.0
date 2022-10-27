Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C415C38A2D
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Oct 2022 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UqYAg2b4kG6wx8in00/wB3M6fgiYLapsmS8BYFuF/1Q=; b=aacnnaMYxdwdK1
	pNTtbFNzUkr5ekjEF8ypavIcf5TNNd9sjk6jALgSe7I6yu9CKg2r2I3qsjz1n11VrFKNOfuZxCz76
	4KWW5PnnEg418UVgTlGGyyqsE2baoLJmbScGrl2pLc3BDMu0L8at72ZRBsdH0OkbnjWf6+tvg+D3B
	rwPBf7pAZE3DHY4bNqUMMRjPE0DA+JsL3unxXxI5cMv2mEcYTQd5+dmZe4nxqXbgxYIHgyyRot3j6
	rqnbeQQD8a1I+8UiNp4yddrepw3V+DnX3ij7EN/pbkxCX3gyIOhrfLz0oNA8oWyiHWhmIPEZXv8C1
	Ir+JxkynRbvBgM2G4vqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzxR-00Cni0-AA; Thu, 27 Oct 2022 10:17:53 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzwb-00CnL9-Bg; Thu, 27 Oct 2022 10:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666865821; x=1698401821;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=f2Zn1IV8GQzC2OYKDCVKPQX1UZnKU6dm8aCFoSi03LA=;
  b=JatIowm2wnv2vNcsoEPEY/kzXCC1ICi7LVBus/rYwkj2yfhTWcgX8QVH
   ElWWfbuTOSEsKEys7CR8ekIqKwsfIZX/2OIwPMnl25b+6vBtz3xFP7ANy
   OlYUHrbo3rh8gaPew/bljLGD3kyABlUjWPenoPrVQuL2gDRQPZ2ZTtVrx
   3rLYCRL2WJ78FdQchHMwA7ycjYJRUQGIr0Djqz6jbtpDn44581OY/Wcey
   cLmfS6NysLw3vjZRSUPQX4Lw+ktFV1HUd8x4VKYa+n8Rx+6/28awTa0dO
   InUtVB0/r7aRCDL/zZzcR/N8TX029/QmSldx5is3YTvU2pVKt/4sF3wD0
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="308178661"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="308178661"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 03:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="701291472"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; 
   d="scan'208";a="701291472"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2022 03:16:56 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1onzwV-0008eI-26;
	Thu, 27 Oct 2022 10:16:55 +0000
Date: Thu, 27 Oct 2022 18:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD SUCCESS
 d9c5422a13a5b0923a295758e1302cac9a2eacbb
Message-ID: <635a5a93.QxL3NzM8f7/eb3pJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_031701_499663_B0A8CC00 
X-CRM114-Status: UNSURE (   6.41  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
branch HEAD: d9c5422a13a5b0923a295758e1302cac9a2eacbb  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

elapsed time: 721m

configs tested: 59
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
x86_64                              defconfig
um                           x86_64_defconfig
um                             i386_defconfig
m68k                             allyesconfig
i386                                defconfig
arc                                 defconfig
powerpc                           allnoconfig
x86_64                               rhel-8.3
riscv                randconfig-r042-20221026
x86_64                        randconfig-a002
x86_64                        randconfig-a013
i386                          randconfig-a001
arc                  randconfig-r043-20221026
powerpc                          allmodconfig
x86_64                           allyesconfig
s390                             allmodconfig
x86_64                           rhel-8.3-syz
alpha                               defconfig
i386                          randconfig-a003
ia64                             allmodconfig
x86_64                        randconfig-a011
x86_64                          rhel-8.3-func
s390                 randconfig-r044-20221026
sh                               allmodconfig
s390                                defconfig
x86_64                        randconfig-a004
mips                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
arm                                 defconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a015
x86_64                    rhel-8.3-kselftests
s390                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a005
i386                          randconfig-a012
i386                          randconfig-a016
arm                              allyesconfig
arm64                            allyesconfig

clang tested configs:
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a005
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a013
x86_64                        randconfig-a014
i386                          randconfig-a011
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
