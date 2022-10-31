Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1ABAFA3740
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s3+etaQMn5zjHqf7kSv1FtYvmrxwzloGcAIlTUPwP7E=; b=2KG1YOkPEaCfnm
	5sHTLGel5SSWkGM6MqkXUbUFpR3i8GaEMr2VQTPaSuLoI5W+lR/ZWaP2GTpxSk7k8c/rx5Dx8o6Da
	0d0Zxf7QGQyiK2qyjRXfCXmxJRJWsCGllejQuxog0JfQa/v6vHxGuapkKR/wT+qWnUZUVy08odoEW
	CcgxakLdKH5RFsUvm6ndROwbfZE/n3Q/m/VEmMByc2mUzZxPjhuQZ6buZwjaJyHGKU0ZinhJbz20H
	ekPlJPr/umTjVdB71skQJsPhxxDzcOp+7U2uQp0AgRnZGXCmLvaPHo1lnNLRwyLaESVAOAjI17qB7
	SgAFexxfT1uNv9szq3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRuL-00AWW8-Vw; Mon, 31 Oct 2022 10:20:42 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRtw-00AWHJ-My; Mon, 31 Oct 2022 10:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667211616; x=1698747616;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C+1cTCtfSj8wUJhtZnVNy4aNC3vxPQcL9AJqqvjNqcc=;
  b=PLzjSY1A0hW6BXtqXSMpFSlbKR4VV/drWGRB3HBbm1jvP7IU6bvmUo5p
   pIr8rFCXLGkAqe8LqaSI1WYJuNcEi8GNcSxcbKEHYbkC/R0UuwQEBM7ek
   lzOdR7ZdS2GV5i4c0/He71dzrbZspyiFQ/djsVy+xv69vzz2T0wUqxY3W
   lSSiCtP33n4WJiU6l1Q1FUkiGRMJLBjpiRtUU3UyTY4w9E7p3i9bXA8P7
   kDwpEbQqkNmrQDTqR3cTzoY8XtIEDr3ODr0LAuPjCo/1q978KLn/sYwHJ
   owxazqioMvLJEs5XHM0GxgyH9OXv4r9iwF0CKD0tJi9sZSzfvjnUN0Q7L
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="307587914"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="307587914"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2022 03:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="962731244"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; 
   d="scan'208";a="962731244"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 31 Oct 2022 03:20:10 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1opRtq-000Crw-0s;
	Mon, 31 Oct 2022 10:20:10 +0000
Date: Mon, 31 Oct 2022 18:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes] BUILD REGRESSION
 f9c598794537110a1447b695a5af5d6be8f54104
Message-ID: <635fa123.xYXToER2P5m7uLMe%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_032016_819078_057AA791 
X-CRM114-Status: UNSURE (   5.37  )
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
branch HEAD: f9c598794537110a1447b695a5af5d6be8f54104  Merge branch 'for-linux-next-fixes' of git://anongit.freedesktop.org/drm/drm-misc

Error/Warning: (recently discovered and may have been fixed)

drivers/spi/spi-meson-spicc.c:420:2: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: comparison of distinct pointer types ('typeof ((timeout)) *' (aka 'unsigned long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
drivers/spi/spi-meson-spicc.c:420:2: warning: shift count >= width of type [-Wshift-count-overflow]

Error/Warning ids grouped by kconfigs:

clang_recent_errors
`-- hexagon-randconfig-r045-20221030
    |-- drivers-spi-spi-meson-spicc.c:error:incompatible-pointer-types-passing-unsigned-long-to-parameter-of-type-uint64_t-(aka-unsigned-long-long-)-Werror-Wincompatible-pointer-types
    |-- drivers-spi-spi-meson-spicc.c:warning:comparison-of-distinct-pointer-types-(-typeof-((timeout))-(aka-unsigned-long-)-and-uint64_t-(aka-unsigned-long-long-))
    `-- drivers-spi-spi-meson-spicc.c:warning:shift-count-width-of-type

elapsed time: 720m

configs tested: 64
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
i386                                defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
x86_64                    rhel-8.3-kselftests
arc                              allyesconfig
x86_64                          rhel-8.3-func
alpha                            allyesconfig
arm                                 defconfig
ia64                             allmodconfig
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allyesconfig
x86_64                               rhel-8.3
arm                              allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                           allyesconfig
powerpc                          allmodconfig
s390                                defconfig
arm64                            allyesconfig
x86_64                         rhel-8.3-kunit
sh                               allmodconfig
s390                             allyesconfig
mips                             allyesconfig
powerpc                           allnoconfig
arc                  randconfig-r043-20221031
riscv                randconfig-r042-20221031
arc                  randconfig-r043-20221030
s390                 randconfig-r044-20221031
x86_64               randconfig-a014-20221031
x86_64               randconfig-a012-20221031
x86_64               randconfig-a015-20221031
x86_64               randconfig-a011-20221031
x86_64               randconfig-a013-20221031
i386                 randconfig-a014-20221031
x86_64               randconfig-a016-20221031
i386                 randconfig-a011-20221031
i386                 randconfig-a012-20221031
i386                 randconfig-a013-20221031
i386                 randconfig-a015-20221031
i386                 randconfig-a016-20221031

clang tested configs:
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
x86_64               randconfig-a001-20221031
hexagon              randconfig-r045-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031
x86_64               randconfig-a005-20221031
hexagon              randconfig-r041-20221030
riscv                randconfig-r042-20221030
s390                 randconfig-r044-20221030
hexagon              randconfig-r041-20221031
i386                 randconfig-a001-20221031
hexagon              randconfig-r045-20221030
i386                 randconfig-a003-20221031
i386                 randconfig-a002-20221031
i386                 randconfig-a004-20221031
i386                 randconfig-a005-20221031
i386                 randconfig-a006-20221031
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
