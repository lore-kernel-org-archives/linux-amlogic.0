Return-Path: <SRS0=nO5Q=6Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577BAC3A5A9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 14:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2911B24954
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 14:09:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFpJKoE4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdYTtL0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2911B24954
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yivQO/cqsaF3CEJQIt60JKU3Kn03pJ36lO2JmJ/WqEk=; b=gFpJKoE4zyEDd3
	1e6lsWh6zesgmpGNP+rjYk6FQ1y1COmILRIrKDXy1eNUBMAyTdY7z9gdUeH+qvfTq97i776fnRpSY
	yY390wT21MRJC+z4k4rueG7j98ObbNwBreBksfRrswXwB5Igw2s8PO/QJmWc7hGjTobZ1AyM+cVNu
	rkbtxrG1ha0TloQMsgqhzbvYAGpdtM7DWMEQp2C+T3b6adnBU8RESevgCZkWMKxURIAD7UNT8aa37
	LR9UWadijVVIOOWQzUSdU8X8yEDKdqY5QwHmaWOhUxaHOqrdQJbj1zNeatxFoOEhfd1Vdt4bf+nhB
	9AJztEPJkGHRq2uitD5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUspO-0004rm-S7; Sat, 02 May 2020 14:09:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUspN-0004rA-0s; Sat, 02 May 2020 14:09:14 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 438FC21775;
 Sat,  2 May 2020 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588428551;
 bh=MDyVjZWnm5EvNAHWJ1mOzIJ83FG+EVxuwwcCWJaro3A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UdYTtL0tJm4pDAJdkk0jA2Pl4wn/Y0pmT0tkl+Ym73e1Y5SeNV26aAoSjnOADOGR3
 Z2CrMXCFV1jj8nOlb7huAU/Y1F0im1D9EjwqYX4t+p9Nh9IovYfLHgnjxvpKzLmFoM
 3enP6QhzvOZpKMji7n7/dc0Sempgkxa07zumwe7Y=
Date: Sat, 2 May 2020 16:09:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
Message-ID: <20200502140908.GA10998@kroah.com>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
 <20200502134721.GH13035@sasha-vm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200502134721.GH13035@sasha-vm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_070913_082084_BE0D57B6 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, kernelci@groups.io, Mark Brown <broonie@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:
> On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
> > On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
> > 
> > > The call stack is not the same as in the commit message found by
> > > the bisection, so maybe it only fixed part of the problem:
> > 
> > No, it is a backport which was fixing an issue that wasn't present in
> > v5.4.
> > 
> > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
> > 
> > As I said in reply to the AUTOSEL mail:
> > 
> > | > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
> > | > playback/capture if supported"), meson-axg cards which have codec-to-codec
> > | > links fail to init and Oops:
> > 
> > | This clearly describes the issue as only being present after the above
> > | commit which is not in v5.6.
> > 
> > Probably best that this not be backported.
> 
> Hrm... But I never queued that commit... I wonder what's up.

I saw the Fixes: tag, but missed the changelog text.  My fault.

I'll go drop it from everywhere, sorry about that.

greg k-h

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
