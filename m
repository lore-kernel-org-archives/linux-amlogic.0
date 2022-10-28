Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D05ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Oct 2022 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PT53PL8F0DGJ1FGSuXPzL7U7Pe1y7mEvaLg7neHWzHY=; b=t8JXl7Y8BykPxr
	ILbtI7JAnQ9MNM4PeeSXf50MPJKNuD/WgeOzdVXoZc/RZU+RgLKubayWCG6Bto1/juYN4rssOaxzb
	11EHhXqxtgfm31kUkeXoMdQvRUDFrCsq59vuMzdrKQhK9gK26iYhvWBVtLYhkkTzCrePXAYv0E/0G
	nQYzTe5GL/v18E2C+pumrp5qho4C5nJXwkh+N+5x+UMc90/JHgUJ+Xub7mGuykEHxkxIrMeIKpjwS
	M/zrx2zp34CfnFNET1hWrLOhhgg5SfvGnKQ8fFWToqQfGyY5X76QuDL1ffzmCFT+Pu6ZH486LlRvE
	4Gu3brc6lXg3rcfd3fyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMfT-00Gg1N-0T; Fri, 28 Oct 2022 10:32:51 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooMfG-00Gfvq-27; Fri, 28 Oct 2022 10:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666953158; x=1698489158;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=698GfGp5V3HFj2CgW32lGzxGGXR7YH54F1UnW4uslJM=;
  b=QZ1TRgwMiwslScyUi6mL9xUrDaaVoptEvqF8QvNl9p98fEWjfhIjwBLF
   GHrf6vnwOxrOIDsxvK4toNFGm7KJc9bO+JEM46M/YV+ouu1jST8EJJVFI
   wWmS+sLe7KXmRicZyx6Ll4fMwmUR8STlMiVpSLIJmbjBqPi1xJlfLTxka
   bq9IHbOX+KNoZ7Y+9BMHPYPOlr0feaYX4gHBV0thq+od8FBHKjddN5Pyk
   vESZIQ4FLufV33+4rvUdL9AvroCDWDSvxDVdC0zTBZGJ2wX/aJ69yNPLr
   TfDAsjnJDhElAtN4LK0VdCys/zGo0z5FcjEIPeS8ExlNDmSdXrjGGWdJ2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="309553881"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="309553881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2022 03:32:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="701691643"
X-IronPort-AV: E=Sophos;i="5.95,220,1661842800"; 
   d="scan'208";a="701691643"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Oct 2022 03:32:33 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooMfA-0009oD-1p;
	Fri, 28 Oct 2022 10:32:32 +0000
Date: Fri, 28 Oct 2022 18:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD REGRESSION
 4fab0e8b2041211b9685de60f4767b1b27f8c588
Message-ID: <635baf9b.QnR0CgKM/ZnCyLwX%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_033238_180212_ADED2C51 
X-CRM114-Status: UNSURE (   6.46  )
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
branch HEAD: 4fab0e8b2041211b9685de60f4767b1b27f8c588  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Error/Warning: (recently discovered and may have been fixed)

drivers/spi/spi-meson-spicc.c:420:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: comparison of distinct pointer types ('typeof ((timeout)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: shift count >= width of type [-Wshift-count-overflow]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- hexagon-randconfig-r004-20221026
|   |-- drivers-spi-spi-meson-spicc.c:error:incompatible-pointer-types-passing-unsigned-long-to-parameter-of-type-uint64_t-(aka-unsigned-long-long-)-Werror-Wincompatible-pointer-types
|   |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
|   `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type
|-- mips-randconfig-r025-20221026
|   |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
|   `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type
`-- powerpc-randconfig-r002-20221026
    |-- drivers-spi-spi-meson-spicc.c:error:incompatible-pointer-types-passing-unsigned-long-to-parameter-of-type-uint64_t-(aka-unsigned-long-long-)-Werror-Wincompatible-pointer-types
    |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
    `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type

elapsed time: 722m

configs tested: 62
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
x86_64                              defconfig
s390                             allyesconfig
ia64                             allmodconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a015
x86_64                               rhel-8.3
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a006
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                           allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
sh                               allmodconfig
m68k                             allmodconfig
arc                              allyesconfig
riscv                randconfig-r042-20221026
arm                                 defconfig
arc                  randconfig-r043-20221026
alpha                            allyesconfig
s390                 randconfig-r044-20221026
m68k                             allyesconfig
i386                          randconfig-a014
arm                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
arm64                            allyesconfig
i386                             allyesconfig
arc                  randconfig-r043-20221028
s390                 randconfig-r044-20221028
riscv                randconfig-r042-20221028

clang tested configs:
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a014
x86_64                        randconfig-a005
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a002
i386                          randconfig-a004
hexagon              randconfig-r045-20221026
hexagon              randconfig-r041-20221026
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
