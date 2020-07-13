Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44655C433EA
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 15:08:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15647205CB
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 15:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bcnoc7E/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15647205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XkwNVNwZu9QuFcx5WNwEdhl+v4gXioNe8aD1cmLtKkw=; b=Bcnoc7E/9gvi9Ggms76A6lfTm
	pr/R1eRJdMzyVbx+ISpO9jtdSNgLxHRISRNGH6hJ1q462wg0TfVLxeidHBKnBfBX1dyS5LO5k1QMk
	H44mwp7M8htSRLrWr9EF8V46cn8nDPuk4DJza2Ngr5vCe7NleIU567o102ubur4E+JY+7aNeWPc18
	esVyH7H8uo8GIU8y1f4qKgQK+BuODOUPbkP8OsQ/FhG3tc5PSpD7qjb0v8esih50WZZh+qrb5lMXG
	fqU4MBQG9ofkYJiTedvfA/Q0rOSDRmlxrvqynIrRgEX28wj0fbx0avMyQIGd7CUZn3zFT24dxbxc4
	fU+DJ43Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv04P-0001QA-I1; Mon, 13 Jul 2020 15:08:41 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv04M-0001Oa-Cm
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 15:08:39 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MvKTJ-1km8ml3b5F-00rKET; Mon, 13 Jul 2020 17:08:30 +0200
Received: by mail-lf1-f46.google.com with SMTP id g139so9256196lfd.10;
 Mon, 13 Jul 2020 08:08:28 -0700 (PDT)
X-Gm-Message-State: AOAM532hU86iZifv4Glq4fLg7M/TPNBFpUSNl2/V3/f+zcBgVF5CM+RW
 v/Zq/qRUVbBwn/+QYkIipeo9cPzcaQEredYu1OI=
X-Google-Smtp-Source: ABdhPJwTQltR//Qoy7CJjbYFWf5SE8su8bBzApvuOmTDy/uiiaL5a6kEWZGPL3gOs+ATNW8dGkRO2Pf0imsPrOKn0vM=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr53585665lfk.173.1594652906936; 
 Mon, 13 Jul 2020 08:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200713122247.10985-1-refactormyself@gmail.com>
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 13 Jul 2020 17:08:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Message-ID: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
X-Provags-ID: V03:K1:tgdZHs6sJqEMiOi4d2zDcwt6agyhskGkrP8RSzdFjBIBQ2Yj2+O
 r5Tc98GCOxVSKgorkzNLJykQo0DOPPDm6eVWeh07pzCTjyRbZ+PmYS+5aWS2UQFc3fNazq1
 DWFsf3WYG3xCfnS1nF8eQ6gS4WZVUr7wzep2kxiXIGwyF0gb1fxnpjcEcrZt4RGeZO+kNwV
 HKpQm4z0aWU9ed7plc7Cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OTU+MI4tLe4=:kJMiXoPPcezdQnzqPwu6vr
 7vDspxs1IXMJ7RTmnVdxDxwISEfZGnZBb9FJtNMa139aKUtmR1qoj2kx7HEL1bl5kdKwZQ0Ke
 Nts3qalQ0a9lI89iqVgEVKdaIeVoXFwhskqN5qAmNPGzCGzne7xc9qRB5UFtgaPFgiZkKXEuS
 1kZsCXfr1iFxnokBaCfCeGx1thL3kB0AGIyFPdB2Ojz42yo01E1f3qlmadRJle9rrWqF1/kZ7
 eRfjQxBwqr79p48r1dWvztU5kA0jXbBMwbS0viCpp/vRAmrPQuDWtelduJDyPCxswuZ2qLqIX
 OjHGNllYxFgJG7ykG86ZTpQl9eLwgMZVLh4zZJFWhX5wCVe9dqRl6hiH3QDhBH9SR7pXV/Lib
 VR53jdQF4jKpHFCN44/O3dO0IufE2jiGna6w6zTznyTsQg+Wtk2kMvM/snyA+SS1AzaMQUSAD
 s4/8tg61Zs+35UdmywZnFP2RTv9wGcWr2SNRyMx+0/m9iQS73bqe/LTKd9F1CIxWL+/tauKd3
 g+nhKrxPds6oASI92hBaTgPT/WS3u29zBM+iq6Clkd+Vjh1Ry3l8dyHyb/jV5c8TDzDKOeb9z
 uO+mjQSFSNEBzT3r6PRJQpmGEKVRRAYF/saDV6uWca7Jlic458qlNdo/h0hkziXxzmOLN8tIe
 yCMw880HQEHqnqdBOlNgQjNaiBrAJcKSVFFWjjOKUTBTzcpIF4gobYCdDIaGNwBV0pkqvQ9Gg
 zYs3tagcfm3OaXtXaoN62IugIIaA3hkYmiys+ylSiaThJgGurKNTDxqvNRQYo0r6ppmvPIg76
 Wn1fKU/nqWWu0mrkmWHb9e/03jrmfRtoW2wDBaeRPa8vr5Z70zXatn05kdQgobhVc9EkShigN
 nFVkkQSAEuJddI+87KVQa0MhnumtS8UDcpysnE5Bon9qy9fZ5t4yJomiKPAHomiMPwC/RXrkj
 tQ0/5ddF0FAcpLyY0tQcKHe7cHjBglt7FU2rQDytre7WqE80NLIoG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_110838_656289_521F0E9D 
X-CRM114-Status: GOOD (  27.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, linux-nvme@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 Realtek linux nic maintainers <nic_swsd@realtek.com>,
 Paul Mackerras <paulus@samba.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Bjorn Helgaas <helgaas@kernel.org>, rfi@lists.rocketboards.org,
 Toan Le <toan@os.amperecomputing.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-atm-general@lists.sourceforge.net,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Chas Williams <3chas3@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel <xen-devel@lists.xenproject.org>, Matt Turner <mattst88@gmail.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Kevin Hilman <khilman@baylibre.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Ray Jui <rjui@broadcom.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Yue Wang <yue.wang@amlogic.com>, Jens Axboe <axboe@fb.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Michael Buesch <m@bues.ch>,
 Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Jingoo Han <jingoohan1@gmail.com>, Networking <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>, Brian King <brking@us.ibm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, alpha <linux-alpha@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 3:22 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
> This goal of these series is to move the definition of *all* PCIBIOS* from
> include/linux/pci.h to arch/x86 and limit their use within there.
> All other tree specific definition will be left for intact. Maybe they can
> be renamed.
>
> PCIBIOS* is an x86 concept as defined by the PCI spec. The returned error
> codes of PCIBIOS* are positive values and this introduces some complexities
> which other archs need not incur.

I think the intention is good, but I find the series in its current
form very hard
to review, in particular the way you touch some functions three times with
trivial changes. Instead of

1) replace PCIBIOS_SUCCESSFUL with 0
2) drop pointless 0-comparison
3) reformat whitespace

I would suggest to combine the first two steps into one patch per
subsystem and drop the third step.

> PLAN:
>
> 1.   [PATCH v0 1-36] Replace all PCIBIOS_SUCCESSFUL with 0
>
> 2a.  Audit all functions returning PCIBIOS_* error values directly or
>      indirectly and prevent possible bug coming in (2b)
>
> 2b.  Make all functions returning PCIBIOS_* error values call
>      pcibios_err_to_errno(). *This will change their behaviour, for good.*
>
> 3.   Clone a pcibios_err_to_errno() into arch/x86/pci/pcbios.c as _v2.
>      This handles the positive error codes directly and will not use any
>      PCIBIOS* definitions. So calls to it have no outside dependence.
>
> 4.   Make all x86 codes that needs to convert to -E* values call the
>      cloned version - pcibios_err_to_errno_v2()
>
> 5.   Assign PCIBIOS_* errors values directly to generic -E* errors
>
> 6.   Refactor pcibios_err_to_errno() and mark it deprecated
>
> 7.   Replace all calls to pcibios_err_to_errno() with the proper -E* value
>      or 0.
>
> 8.   Remove all PCIBIOS* definitions in include/linux/pci.h and
>      pcibios_err_to_errno() too.
>
> 9.   Redefine all PCIBIOS* definitions with original values inside
>      arch/x86/pci/pcbios.c
>
> 10.  Redefine pcibios_err_to_errno() inside arch/x86/pci/pcbios.c
>
> 11.  Replace pcibios_err_to_errno_v2() calls with pcibios_err_to_errno()
>
> 12.  Remove pcibios_err_to_errno_v2()
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Suggested-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>

I would hope that there is a simpler procedure to get to good
code than 12 steps that rename the same things multiple times.

Maybe the work can be split up differently, with a similar end result
but fewer and easier reviewed patches. The way I'd look at the
problem, there are three main areas that can be dealt with one at
a time:

a) callers of the high-level config space accessors
   pci_{write,read}_config_{byte,word,dword}, mostly in device
   drivers.
b) low-level implementation of the config space accessors
    through struct pci_ops
c) all other occurrences of these constants

Starting with a), my first question is whether any high-level drivers
even need to care about errors from these functions. I see 4913
callers that ignore the return code, and 576 that actually
check it, and almost none care about the specific error (as you
found as well). Unless we conclude that most PCI drivers are
wrong, could we just change the return type to 'void' and assume
they never fail for valid arguments on a valid pci_device* ?

For b), it might be nice to also change other aspects of the interface,
e.g. passing a pci_host_bridge pointer plus bus number instead of
a pci_bus pointer, or having the callback in the pci_host_bridge
structure.

> Bolarinwa Olayemi Saheed (35):
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0
>   Tidy Success/Failure checks
>   Change PCIBIOS_SUCCESSFUL to 0

Some patches have identical subject lines including the subsystem
prefix, which you should avoid. Try to also fix the git request-pull
output to not drop that prefix here so the list makes more sense.

        Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
