Return-Path: <SRS0=e5Du=DL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DBEC4363C
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAF3206DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9ErqLsL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QoNIvS6K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAF3206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDMVFfSfalIKTuyd6GruMi66QGq0UKb28DNkSQCX2N8=; b=q9ErqLsL1mX7+dPBcSo8T14HW
	bMKSEta/TyIWjdZEMMl6/Fa4tJEq+ba4SdexAmtRL33J1p7xbdvJM0gPv0YaXPeLCnfDmr4ARxtDv
	crrxPU30PFXqNW6OA49gNF6kJEegu2347TQwTuQxLFRTkjmtZ2dNdKnxjD1zhsdq3sSDU/bb4HQXS
	Jmc7YdFkxOPjwMp2I1yO3HtlgeNCvubC+8HbfzpP3/EwASXMixp1C8KT1tdE0iFbeyc0a1WfG5Shf
	TB1ncDm2/GKfY/VK9bEQT/F1K1UNEYUbwcD/HCBuGZ2uGejTN8bUW7BvBc0rO7b6WRsSPSfdBsZZX
	7xq7T7eOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvfG-00024r-AN; Sun, 04 Oct 2020 04:30:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvfD-00024K-Pk; Sun, 04 Oct 2020 04:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=wIbr3lajCQTEQX+lS+qa+AMFF1ievL5T4OHQDKFUjjQ=; b=QoNIvS6K7UfBK4UWCncxVJrtCS
 /M4L1oIn1qQcfjmF2JO4OfpWWiee6u5FIV9Dh+4q3AlMr736Kw9WIUOO2ZjqfZi6QB7vlDxZ4dbEH
 +h/UiPOZub3LPiGK8E+ojrQrOTUUAxgWU0azj32fNTJyOBaEi7V8HXbt/3z8t3+vVAwLdeibDOFsP
 H1RauYDY2K/OsF12RiNGgxvQLf0jks/DuPCtruGdN/YS5ZzANI7Q6kClgttx1YIrR0HCwnTgcGA+d
 vKZKT/DITOs0pI7BTDhHbPXaSAMQOc3W4Z8TUw4XqVdOxuXh3kJB7MbqbCju9caD+0hf3dPlwXyD+
 t3vaUaEA==;
Received: from smtprelay0214.hostedemail.com ([216.40.44.214]
 helo=smtprelay.hostedemail.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOmSn-000848-PZ; Sat, 03 Oct 2020 18:41:01 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 9054F18029210;
 Sat,  3 Oct 2020 18:40:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: stop55_5311f74271af
X-Filterd-Recvd-Size: 6242
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Oct 2020 18:40:49 +0000 (UTC)
Message-ID: <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, tools@linux.kernel.org, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>
Date: Sat, 03 Oct 2020 11:40:48 -0700
In-Reply-To: <20201001110150.GA6715@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_194058_367320_FB10DD84 
X-CRM114-Status: GOOD (  25.41  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

(Adding tools and Konstantin Ryabitsev)

There seems to be some mismatch between b4's use of the
cover letter to a patch series and what maintainers that
apply a subset of the patches in the patch series.

The merge description shows the entire patch series as
applied, but the actual merge is only a subset of the
series.

Can this be improved in b4?

For example, regarding:

https://lore.kernel.org/linux-amlogic/160132172369.55460.9237357219623604216.b4-ty@kernel.org/
https://lore.kernel.org/lkml/b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com/#t

On Thu, 2020-10-01 at 12:01 +0100, Mark Brown wrote:
> On Wed, Sep 30, 2020 at 12:33:39PM -0700, Joe Perches wrote:
> > On Tue, 2020-09-29 at 12:37 +0100, Mark Brown wrote:
> > > Feel free to submit patches to b4.
> > Have you tried the existing option to send
> > thank you's on a specific ranges of patches?
> 
> I am relying on b4 to identify which patches that I've downloaded are in
> the pushed branches.  Given that it explicitly lists the patches that
> are applied it appears to be doing an OK job here.

I'm not so sure about that.

The commit merge description in -next shows 23 files
modified but the commit range shown in the merge shows
only a single patch applied:

From next-20201002:

(I've removed some of the commit description below)

$ git log --stat -1 2defc3fa18a68963a330187f5386968e50832d06
commit 2defc3fa18a68963a330187f5386968e50832d06
Merge: eb45df24fe82 7f4a122d0b50
Author: Mark Brown <broonie@kernel.org>
Date:   Mon Sep 28 18:28:48 2020 +0100

    Merge series "use semicolons rather than commas to separate statements" from Julia Lawall <Julia.Lawall@inria.fr>:
    
    These patches replace commas by semicolons.  This was done using the
    Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.

[some of the long description elided]

        ---
    
     drivers/acpi/processor_idle.c               |    4 +++-
     drivers/ata/pata_icside.c                   |   21 +++++++++++++--------
     drivers/base/regmap/regmap-debugfs.c        |    2 +-
     drivers/bcma/driver_pci_host.c              |    4 ++--
     drivers/block/drbd/drbd_receiver.c          |    6 ++++--
     drivers/char/agp/amd-k7-agp.c               |    2 +-
     drivers/char/agp/nvidia-agp.c               |    2 +-
     drivers/char/agp/sworks-agp.c               |    2 +-
     drivers/char/hw_random/iproc-rng200.c       |    8 ++++----
     drivers/char/hw_random/mxc-rnga.c           |    6 +++---
     drivers/char/hw_random/stm32-rng.c          |    8 ++++----
     drivers/char/ipmi/bt-bmc.c                  |    6 +++---
     drivers/clk/meson/meson-aoclk.c             |    2 +-
     drivers/clk/mvebu/ap-cpu-clk.c              |    2 +-
     drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
     drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
     drivers/clocksource/mps2-timer.c            |    6 +++---
     drivers/clocksource/timer-armada-370-xp.c   |    8 ++++----
     drivers/counter/ti-eqep.c                   |    2 +-
     drivers/crypto/amcc/crypto4xx_alg.c         |    2 +-
     drivers/crypto/atmel-tdes.c                 |    2 +-
     drivers/crypto/hifn_795x.c                  |    4 ++--
     drivers/crypto/talitos.c                    |    8 ++++----
     23 files changed, 60 insertions(+), 51 deletions(-)

But the commit range of the merge shows only the single commit:

$ git log --stat eb45df24fe82..7f4a122d0b50
commit 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee
Author: Julia Lawall <Julia.Lawall@inria.fr>
Date:   Sun Sep 27 21:12:24 2020 +0200

    regmap: debugfs: use semicolons rather than commas to separate statements
    
    Replace commas with semicolons.  What is done is essentially described by
    the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
    
    // <smpl>
    @@ expression e1,e2; @@
    e1
    -,
    +;
    e2
    ... when any
    // </smpl>
    
    Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
    Link: https://lore.kernel.org/r/1601233948-11629-15-git-send-email-Julia.La>
    Signed-off-by: Mark Brown <broonie@kernel.org>

 drivers/base/regmap/regmap-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
