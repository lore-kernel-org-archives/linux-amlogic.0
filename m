Return-Path: <SRS0=z86A=UD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7E3C28CC3
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 15:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9AB2206E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2019 15:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pAAAb6PF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9AB2206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGL7GqcOXl9NjEThnBj6fOg6075NhcrucsShUt+3RtQ=; b=pAAAb6PFwU5DFU
	XtaPKc76lt3Dw/8aJHKKIxuU7S/e+q+G5FpgJXQKmFiHEqcPTUypVTx0RFimm6qqSBlkwhjhpq91X
	h/H48hUwMuhooIcldcE3SFFHzUDcr0+HcqGW//TAU8dtWLR3KS+IHnCpUAU8eOS3CZxHKODCfvhUx
	qyA4b09VpK8k/x6FdDRfiJJaA7ESWepadWPPW8rPaIM0bEq3EcHUmLVoSYZQ0ZLTfunvXQd1+aSiB
	2ycTI5I/NSipS2wloz3bk6g7iM7a9+/YLqF7lii/q8dZjXSjgqDJZSsCISj7VReYULOgLl24DELcc
	rrJhAegoVZDycmXm+oZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYAyr-0003jA-Ml; Tue, 04 Jun 2019 15:04:05 +0000
Received: from [187.113.6.249] (helo=coco.lan)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY6D8-0008Uz-UV; Tue, 04 Jun 2019 09:58:31 +0000
Date: Tue, 4 Jun 2019 06:58:02 -0300
From: Mauro Carvalho Chehab <mchehab@infradead.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 22/22] docs: fix broken documentation links
Message-ID: <20190604065802.47a9d24b@coco.lan>
In-Reply-To: <20190604064614.67cde821@coco.lan>
References: <cover.1559171394.git.mchehab+samsung@kernel.org>
 <f9fecacbe4ce0b2b3aed38d71ae3753f2daf3ce3.1559171394.git.mchehab+samsung@kernel.org>
 <64e136de-1a7b-3436-9675-44ea9fa7b64a@c-s.fr>
 <20190604064614.67cde821@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 08:03:23 -0700
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 Wolfram Sang <wsa@the-dreams.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>,
 Russell King <linux@armlinux.org.uk>, Paul Mackerras <paulus@samba.org>,
 Alessia Mantegazza <amantegazza@vaga.pv.it>, Jakub Wilk <jwilk@jwilk.net>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, James Morris <jmorris@namei.org>,
 linux-acpi@vger.kernel.org, Andy Gross <agross@kernel.org>,
 xen-devel@lists.xenproject.org, Jason Wang <jasowang@redhat.com>,
 Alexander Popov <alex.popov@linux.com>, Qian Cai <cai@lca.pw>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Kairui Song <kasong@redhat.com>,
 Quentin Perret <quentin.perret@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Jiri Kosina <jkosina@suse.cz>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Feng Tang <feng.tang@intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Yannik Sembritzki <yannik@sembritzki.me>, Harry Wei <harryxiyou@gmail.com>,
 linux-i2c@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Alexandre Ghiti <alex@ghiti.fr>,
 YueHaibing <yuehaibing@huawei.com>, Robert Moore <robert.moore@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Len Brown <lenb@kernel.org>,
 David Brown <david.brown@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Rob Herring <robh+dt@kernel.org>, James Morse <james.morse@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, linux-pci@vger.kernel.org,
 Bhupesh Sharma <bhsharma@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 platform-driver-x86@vger.kernel.org,
 Ding Xiang <dingxiang@cmss.chinamobile.com>, linux-kselftest@vger.kernel.org,
 Alex Shi <alex.shi@linux.alibaba.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Baoquan He <bhe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Raphael Gault <raphael.gault@arm.com>,
 Joel Stanley <joel@jms.id.au>, Federico Vaga <federico.vaga@vaga.pv.it>,
 Darren Hart <dvhart@infradead.org>, Erik Schmauss <erik.schmauss@intel.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Palmer Dabbelt <palmer@sifive.com>,
 Kees Cook <keescook@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jonathan =?UTF-8?B?TmV1c2No?= =?UTF-8?B?w6RmZXI=?= <j.neuschaefer@gmx.net>,
 SeongJae Park <sj38.park@gmail.com>, Mark Brown <broonie@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org, devel@acpica.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Olof Johansson <olof@lixom.net>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, Michal Hocko <mhocko@suse.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 "H. Peter Anvin" <hpa@zytor.com>, devel@driverdev.osuosl.org,
 Manfred Spraul <manfred@colorfullife.com>,
 Luis Chamberlain <mcgrof@kernel.org>, x86@kernel.org,
 Pavel Tatashin <pasha.tatashin@oracle.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Dave Young <dyoung@redhat.com>,
 devicetree@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dmitry Vyukov <dvyukov@google.com>, linux-edac@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Denis Efremov <efremov@ispras.ru>,
 netdev@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Changbin Du <changbin.du@intel.com>, linux-security-module@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Em Tue, 4 Jun 2019 06:46:14 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Em Mon, 3 Jun 2019 09:34:15 +0200
> Christophe Leroy <christophe.leroy@c-s.fr> escreveu:
> 

> > [...]
> > 
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index 8c1c636308c8..e868d2bd48b8 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -898,7 +898,7 @@ config PPC_MEM_KEYS
> > >   	  page-based protections, but without requiring modification of the
> > >   	  page tables when an application changes protection domains.
> > >   
> > > -	  For details, see Documentation/vm/protection-keys.rst
> > > +	  For details, see Documentation/x86/protection-keys.rst  
> > 
> > It looks strange to reference an x86 file, for powerpc arch.
> 
> Indeed. Yet, seeking for the API documented there:
> 
>  $ git grep -l pkey_mprotect
> Documentation/x86/protection-keys.rst
> arch/alpha/kernel/syscalls/syscall.tbl
> arch/arm/tools/syscall.tbl
> arch/arm64/include/asm/unistd32.h
> arch/ia64/kernel/syscalls/syscall.tbl
> arch/m68k/kernel/syscalls/syscall.tbl
> arch/microblaze/kernel/syscalls/syscall.tbl
> arch/mips/kernel/syscalls/syscall_n32.tbl
> arch/mips/kernel/syscalls/syscall_n64.tbl
> arch/mips/kernel/syscalls/syscall_o32.tbl
> arch/parisc/kernel/syscalls/syscall.tbl
> arch/powerpc/kernel/syscalls/syscall.tbl
> arch/s390/kernel/syscalls/syscall.tbl
> arch/sh/kernel/syscalls/syscall.tbl
> arch/sparc/kernel/syscalls/syscall.tbl
> arch/x86/entry/syscalls/syscall_32.tbl
> arch/x86/entry/syscalls/syscall_64.tbl
> arch/xtensa/kernel/syscalls/syscall.tbl
> include/linux/syscalls.h
> include/uapi/asm-generic/unistd.h
> kernel/sys_ni.c
> mm/mprotect.c
> tools/include/uapi/asm-generic/unistd.h
> tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
> tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
> tools/perf/builtin-trace.c
> tools/testing/selftests/x86/protection_keys.c
> 
> Despite being used on several archs, the only documentation for it
> is inside the x86 directory, as it seems that this is not
> arch-specific.
> 
> Perhaps the file should, instead, be moved to another book.

I guess the best is to have this inside the core-api book.

Patch enclosed.

Regards,
Mauro


[PATCH] docs: move protection-keys.rst to the core-api book

This document is used by multiple architectures:

	$ echo $(git grep -l  pkey_mprotect arch|cut -d'/' -f 2|sort|uniq)
	alpha arm arm64 ia64 m68k microblaze mips parisc powerpc s390 sh sparc x86 xtensa

So, let's move it to the core book and adjust the links to it
accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index ee1bb8983a88..2466a4c51031 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -34,6 +34,7 @@ Core utilities
    timekeeping
    boot-time-mm
    memory-hotplug
+   protection-keys
 
 
 Interfaces for kernel debugging
diff --git a/Documentation/x86/protection-keys.rst b/Documentation/core-api/protection-keys.rst
similarity index 100%
rename from Documentation/x86/protection-keys.rst
rename to Documentation/core-api/protection-keys.rst
diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
index ae36fc5fc649..f2de1b2d3ac7 100644
--- a/Documentation/x86/index.rst
+++ b/Documentation/x86/index.rst
@@ -19,7 +19,6 @@ x86-specific Documentation
    tlb
    mtrr
    pat
-   protection-keys
    intel_mpx
    amd-memory-encryption
    pti
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..3b795a0cab62 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -898,7 +898,7 @@ config PPC_MEM_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/vm/protection-keys.rst
+	  For details, see Documentation/core-api/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..d87d53fcd261 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1911,7 +1911,7 @@ config X86_INTEL_MEMORY_PROTECTION_KEYS
 	  page-based protections, but without requiring modification of the
 	  page tables when an application changes protection domains.
 
-	  For details, see Documentation/x86/protection-keys.txt
+	  For details, see Documentation/core-api/protection-keys.rst
 
 	  If unsure, say y.
 
diff --git a/tools/testing/selftests/x86/protection_keys.c b/tools/testing/selftests/x86/protection_keys.c
index 5d546dcdbc80..480995bceefa 100644
--- a/tools/testing/selftests/x86/protection_keys.c
+++ b/tools/testing/selftests/x86/protection_keys.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Tests x86 Memory Protection Keys (see Documentation/x86/protection-keys.txt)
+ * Tests x86 Memory Protection Keys (see Documentation/core-api/protection-keys.rst)
  *
  * There are examples in here of:
  *  * how to set protection keys on memory



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
