Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11E6C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Nov 2022 18:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=od2F7fsmc5Y+IlLFIYDiZymDv/R7iHEf/URyS9IhdCE=; b=0DnfLP3lYN/WkC
	1Il5o+kbNcTlZ8fFWIF9lkyvD1hJNBhqYvnkq03A3mL3FmKq8772bnXR6ULjViQWnK2fdJkHOoeAH
	FRKxkHufJiaAhnx5q7t3Uig12qjg9worOwNe2FGP+SQpAnoU7hT73Mco3t1Mg0Ki9PcZhF3cKtN7j
	KHGRI2jiO9CdKO5WG1xIO0Rr4HGOk2ygAVAX36yPfdiVZAKKx3qPLn0ryCziLP0QlKMAbqLMB+gL7
	DpIfSmktdw2OsyMA1zI1Wr2jIt5e1DneX8kJrYRWqBCaqVwmNtGgCZhr9emuXlYFiJ0REBwPYbNbs
	CrxVif7tiu6QIR/cX8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opwM6-006ZO7-RO; Tue, 01 Nov 2022 18:51:22 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opwLv-006ZKB-Ta; Tue, 01 Nov 2022 18:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667328671; x=1698864671;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WUdl8a2QIPfR/CfjkCvCB7UA8gib/ta6jV1+KqyUoQU=;
  b=EmyDlONG0MdvcNiOj5YwOvz1a60I5Cn+sEZ3JEC7GeT4Z9cVeQFXqFll
   LXl7ht/e2M9TPyoxpkMzVP6T9RjaKDbo5id37Mkv528DvjYbL6lS/16Vo
   z1yO4AS6/LUGqEY4fwc5hKeDZHpsFhkLwILVCGODw4Z2iRQPKKUrnPe5g
   ueHt0C9+ad2xsmZzMtJ65/6WzdTPVWtawKUC9zKHHaRrhqjD8/eZwwWqg
   +lBCcwG4u40ZL5dQ7a5fo+fBSRNRny6SuDGPDbb0wCPBHUuxU3L6WqxNI
   BRBjKZlhMwiQKh6bK9oVjMGmnNFjiGR+TntAqb4nh1I3c9/QIWvh2NfYs
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="292522679"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="292522679"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 11:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="585106731"
X-IronPort-AV: E=Sophos;i="5.95,231,1661842800"; 
   d="scan'208";a="585106731"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 01 Nov 2022 11:51:08 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opwLr-000DwM-0j;
	Tue, 01 Nov 2022 18:51:07 +0000
Date: Wed, 02 Nov 2022 02:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD REGRESSION
 dc45a98439c6b2303e1b2159804c5d5a8600da68
Message-ID: <63616a6b.RKlhNhq9sxccotSg%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_115112_048457_BEDA588A 
X-CRM114-Status: UNSURE (   7.33  )
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
branch HEAD: dc45a98439c6b2303e1b2159804c5d5a8600da68  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Error/Warning: (recently discovered and may have been fixed)

drivers/spi/spi-meson-spicc.c:420:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: comparison of distinct pointer types ('typeof ((timeout)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: shift count >= width of type [-Wshift-count-overflow]
lib/test_maple_tree.c:453:12: warning: result of comparison of constant 4398046511104 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
|-- hexagon-allmodconfig
|   `-- lib-test_maple_tree.c:warning:result-of-comparison-of-constant-with-expression-of-type-unsigned-long-is-always-false
`-- hexagon-randconfig-r041-20221101
    |-- drivers-spi-spi-meson-spicc.c:error:incompatible-pointer-types-passing-unsigned-long-to-parameter-of-type-uint64_t-(aka-unsigned-long-long-)-Werror-Wincompatible-pointer-types
    |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
    `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type

elapsed time: 726m

configs tested: 59
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
i386                                defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                              defconfig
i386                 randconfig-a011-20221031
i386                 randconfig-a012-20221031
alpha                               defconfig
arc                  randconfig-r043-20221101
i386                 randconfig-a013-20221031
powerpc                           allnoconfig
i386                 randconfig-a015-20221031
i386                 randconfig-a014-20221031
s390                                defconfig
x86_64                           allyesconfig
i386                 randconfig-a016-20221031
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a004
x86_64                        randconfig-a002
ia64                             allmodconfig
s390                             allyesconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
x86_64                           rhel-8.3-kvm
sh                               allmodconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
i386                          randconfig-a003
arm                                 defconfig
powerpc                          allmodconfig
i386                             allyesconfig
mips                             allyesconfig
i386                          randconfig-a005
arm                              allyesconfig
arm64                            allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
m68k                             allyesconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests

clang tested configs:
hexagon              randconfig-r041-20221101
riscv                randconfig-r042-20221101
hexagon              randconfig-r045-20221101
s390                 randconfig-r044-20221101
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a016
x86_64                        randconfig-a014
x86_64                        randconfig-a005
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
