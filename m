Return-Path: <SRS0=e5Du=DL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDD4C4363C
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:20:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD98206DD
	for <linux-amlogic@archiver.kernel.org>; Sun,  4 Oct 2020 04:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FnfmAZ0x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q6ndWD7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD98206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=omX7Eu3pQLtg4mfLJwSgnp/Rnnh1oOhlomJ0WwEPYtc=; b=FnfmAZ0xzcjUonSUZI65LWA4j
	89EGnR6eHpMApmUoRUDqv35d122Uxp3qaSCp0rwN/+rKkUkN/lJqHmExsoVn1MomxV+vHaER2waZ/
	qpSdxtp59x45C/zcCViuEZ2RsKE1dDaBbuUlJzW8ZHzcMeDTsD2Cn+G4YxX0+1bOwyKGQmIjQ1Hjx
	nXbB5G65zhMKS/j13kwEBkaPjN3gd0I2sky2pmlVcvJQJq7SHaaZQKhDQxXtrkck7Av8cpUpnYaiB
	cMhGd/gprHL6JL2xl9BEwSFtwB84o59romfw1uYeQ2PpZXvWkO/eseoadH5uj4ifBVVhtMkSgr9Mg
	1HdkH3F2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOvVL-0000HQ-So; Sun, 04 Oct 2020 04:20:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOvVK-0000HF-W8; Sun, 04 Oct 2020 04:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=V5vx45T8BSc5RST2mUgoRPwlX1Z/KnJM+u/9/tXiNGw=; b=Q6ndWD7uAyrma5l7diY5szaMof
 eqz97PZxvWTQSEVQV6SURJ+YT2vOqvWWLjxqDr9Y/+To6V/9XAEz9us2N5Voyy9biXJyRc30eskGp
 rFISW18U1o6dz6i/OtblMkj/hZBUD5htkHnMZXoddMpH2mQqgFn2ZGVzYJrhJgEx9W4OsEeSWTsAs
 KyOWu4+W4kOweh7HtaSmwD6NBVf8QKfGpPiAXq4FMysQ6uFb8GBy1iFW68WwsTlrQd0PAbgmuIz5W
 sEvb4G69e90CoY4tdGpSr9QYQiRq47E1KMB4fbcI+a0k4IidivC3icyaX1KVZiRqcfQt+6DdWE3S5
 QJIsseQg==;
Received: from smtprelay0229.hostedemail.com ([216.40.44.229]
 helo=smtprelay.hostedemail.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOnKM-00035J-56; Sat, 03 Oct 2020 19:36:21 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id DC1A2180A7FF0;
 Sat,  3 Oct 2020 19:36:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ship26_570a7fe271af
X-Filterd-Recvd-Size: 3575
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Sat,  3 Oct 2020 19:36:11 +0000 (UTC)
Message-ID: <306974234222092651f7497504f8c03e1304926b.camel@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
From: Joe Perches <joe@perches.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Date: Sat, 03 Oct 2020 12:36:10 -0700
In-Reply-To: <c7fd58ebd81f8731fc03434b2bdd8aa4bf99335a.camel@perches.com>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
 <20200929113745.GB4799@sirena.org.uk>
 <db26d49401dc0bd6b9013a603a155f9827f404a4.camel@perches.com>
 <20201001110150.GA6715@sirena.org.uk>
 <f44d19ad596f261c0287c9ab18c45161003efb43.camel@perches.com>
 <20201003191501.o56tqq63d2buq5ox@chatter.i7.local>
 <c7fd58ebd81f8731fc03434b2bdd8aa4bf99335a.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_203618_851388_6D992C7F 
X-CRM114-Status: GOOD (  21.49  )
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
 linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, tools@linux.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2020-10-03 at 12:27 -0700, Joe Perches wrote:
> On Sat, 2020-10-03 at 15:15 -0400, Konstantin Ryabitsev wrote:
> > On Sat, Oct 03, 2020 at 11:40:48AM -0700, Joe Perches wrote:
> > > (Adding tools and Konstantin Ryabitsev)
> > > 
> > > There seems to be some mismatch between b4's use of the
> > > cover letter to a patch series and what maintainers that
> > > apply a subset of the patches in the patch series.
> > > 
> > > The merge description shows the entire patch series as
> > > applied, but the actual merge is only a subset of the
> > > series.
> > > 
> > > Can this be improved in b4?
> > 
> > So, the following logic should be applied:
> > 
> > - if the entire series was applied, reply to 0/n
> > - if a subset only is applied, reply to each n/n of the patch that was 
> >   cherry-picked out of the series
> > 
> > Is that an accurate summary?
> 
> Exactly so, thanks.

And there's no need to commit the [0/n] cover letter as a
part of the merge unless the entire series was committed.

Or perhaps trim the cover letter to exclude the files
modified by the patch series and show only the actual files
committed.

And I believe b4 inserts this line ahead of the 0/n series
cover letter description for the merge:

    Merge series "<series>" from <author>:

Perhaps that like could be "partial merge of" when a partial
merge occurs or left as is if the entire series is applied.

cheers, Joe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
