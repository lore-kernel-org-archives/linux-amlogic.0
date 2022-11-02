Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429CFC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eUqU/BF4xciMdzVt7iV7n6PBPBTMmkGWktZg+kPXLlg=; b=0jZBPROmlIEBsb
	coshmPVRpvFnUebxnzSDAoZJOg2mnZdOd/FGQrAATb6W32V53pFuLae6+vknNXRooJVL5PPnKNiIO
	yiilh9QLKIVaPd7jd1r+EfQJpnZZJUZ2t1aXF0b4bQeXfPC/sjkz3kYO+5JE34+1XOjhD8gDR3J2g
	iVm9hmIsuJWQ6c60ntvl57nbsy4eMRcLxJ8EPIqQrZkyUtwmGcpctRujBMIs/BweXgYptYd20KyZa
	m66HsODrPXJZrKZGTWTlCwWmyklXQ5+LKEr8YIqhorol7iyrids+JwF6J1RgV51yDJEECDnioQdJE
	krNPN07tmBkt7xGjkNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHN2-00CThc-7v; Wed, 02 Nov 2022 17:17:44 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqHMl-00CTSx-4o; Wed, 02 Nov 2022 17:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667409447; x=1698945447;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rSA4/BYA6+IHhAjE1liHjpWtETiY0Vvw3wJIvI31YQc=;
  b=GTyvstS9srND7YJ4LjnIO8VUpT1OfxDNrbboRZGr2uuo85ReCtJyRSBb
   XXd0ZuKvQ1L7IDY3OnJjOEy4v+kZaKH5y0kZGMsuV/yoVaBRU7Wwxioya
   N8bB7BEaw/8LWWQKpSh4bY1DjuEDfR8SSM5QLCQNbClYehjKAtG71mfDW
   lCg17z3WdEJJxX1ZNsuB8UFYDzJSFtXAQq3qdm+yuu6O/0MksjnY8sqpM
   gSodDafUbLecBxO5qU1rsX/ZBJihNPBnWm9t8r476chiv9mMjAPnvG6QM
   DcQwYcFcy6rmqoOEn4DkQh+itnxcIMR+ono7mOOjKo1NkSZvrISDtK1Xh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="296919518"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="296919518"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 10:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="585474786"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; 
   d="scan'208";a="585474786"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 02 Nov 2022 10:17:11 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqHMP-000Exz-2M;
	Wed, 02 Nov 2022 17:17:05 +0000
Date: Thu, 03 Nov 2022 01:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD REGRESSION
 846aa7b143a35e32b50d04ecf2f40d8d778c7a44
Message-ID: <6362a5dd.PdR9rjN3CFvIIoTw%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_101727_301829_11C61626 
X-CRM114-Status: UNSURE (   7.45  )
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
branch HEAD: 846aa7b143a35e32b50d04ecf2f40d8d778c7a44  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Error/Warning: (recently discovered and may have been fixed)

drivers/spi/spi-meson-spicc.c:420:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: comparison of distinct pointer types ('typeof ((timeout)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: shift count >= width of type [-Wshift-count-overflow]
lib/test_maple_tree.c:453:12: warning: result of comparison of constant 4398046511104 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-r026-20221102
|   `-- lib-test_maple_tree.c:warning:result-of-comparison-of-constant-with-expression-of-type-unsigned-long-is-always-false
|-- hexagon-randconfig-r041-20221101
|   |-- drivers-spi-spi-meson-spicc.c:error:incompatible-pointer-types-passing-unsigned-long-to-parameter-of-type-uint64_t-(aka-unsigned-long-long-)-Werror-Wincompatible-pointer-types
|   |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
|   `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type
`-- mips-randconfig-r022-20221102
    `-- lib-test_maple_tree.c:warning:result-of-comparison-of-constant-with-expression-of-type-unsigned-long-is-always-false

elapsed time: 721m

configs tested: 77
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
arc                  randconfig-r043-20221101
alpha                               defconfig
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                         rhel-8.3-kunit
x86_64                        randconfig-a006
x86_64                        randconfig-a013
x86_64                          rhel-8.3-func
x86_64                        randconfig-a011
x86_64                    rhel-8.3-kselftests
x86_64                        randconfig-a015
s390                             allmodconfig
i386                          randconfig-a001
i386                          randconfig-a003
x86_64                              defconfig
x86_64                               rhel-8.3
s390                                defconfig
i386                          randconfig-a005
x86_64                           allyesconfig
ia64                             allmodconfig
powerpc                           allnoconfig
s390                             allyesconfig
powerpc                          allmodconfig
i386                                defconfig
mips                             allyesconfig
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
sh                               allmodconfig
i386                             allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm                              allyesconfig
sh                           se7751_defconfig
powerpc                    sam440ep_defconfig
xtensa                          iss_defconfig
i386                          randconfig-c001
arm                       omap2plus_defconfig
arm                         lubbock_defconfig
sparc                       sparc32_defconfig
microblaze                          defconfig
arm                         assabet_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                       multi_v4t_defconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
sh                      rts7751r2d1_defconfig
mips                             allmodconfig
mips                    maltaup_xpa_defconfig

clang tested configs:
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
riscv                randconfig-r042-20221101
s390                 randconfig-r044-20221101
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a014
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
x86_64                        randconfig-k001
riscv                randconfig-r042-20221103
hexagon              randconfig-r041-20221103
hexagon              randconfig-r045-20221103
s390                 randconfig-r044-20221103

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
