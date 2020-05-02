Return-Path: <SRS0=nO5Q=6Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAE5C3A5A9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 13:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1EBE24954
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 13:47:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bLuTpR+5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MC4T9yrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1EBE24954
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dme+aTIt8nawgviJm/25GyMSh9HNroe4l1GIdTh9/Wk=; b=bLuTpR+5sUQd/yR08D3PwdA3n
	pFKKBadYM8e+yMfusCO6Oc2+veTE/uglXBQgsktUcn9BYrI2WcKFn7OxXiVM6PuKOZV0DgVfKUhGY
	5YGqh3jmovQWfj3uYVbQbpRFqDVwlD2qR2w6W3nYinhNBwK/IoUu8sxqZTvhSKvgGBKP0p8VtnNJz
	8XaCLJVC25d2hDzaXs616JC7S4vYmQ8Qq+iaeceJjV90H8j4RpHiGJY3UJXRea8OWzyerITYXpebh
	mqqLbLhveU6HRqXdqmcT604HU5oFeIsCwcWAte41qy8HUnfFDWrJmW7+Yxi/vJp5ltEG596u0TUAt
	8cWnmaNMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUsUJ-0008Re-5F; Sat, 02 May 2020 13:47:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUsUG-0008Qn-0V; Sat, 02 May 2020 13:47:25 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A95112071E;
 Sat,  2 May 2020 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588427242;
 bh=73TIjw9O6dK2fAlfdODYkB/VFm8uvKuFeW5svJp5uFA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MC4T9yrNMAJ94kM2+SXcWdp6i2eKFYOzXDawiBEHaYHb2biJ9zHC2GbFujl40NAYf
 5pVS6ClrEJRxbfN+WfsKaVEAKrj99uQ/bXcD/zBYaQ+LgxWhVQXqpH/5w2f9MxyKOB
 EhdNt8MV9yshaw+3oRvYnAyj42Wi+lS4OFNVH0EU=
Date: Sat, 2 May 2020 09:47:21 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
Message-ID: <20200502134721.GH13035@sasha-vm>
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501122536.GA38314@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_064724_073232_8DE26B37 
X-CRM114-Status: GOOD (  10.56  )
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 stable@vger.kernel.org, kernelci@groups.io,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>
>> The call stack is not the same as in the commit message found by
>> the bisection, so maybe it only fixed part of the problem:
>
>No, it is a backport which was fixing an issue that wasn't present in
>v5.4.
>
>> >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>
>As I said in reply to the AUTOSEL mail:
>
>| > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>| > playback/capture if supported"), meson-axg cards which have codec-to-codec
>| > links fail to init and Oops:
>
>| This clearly describes the issue as only being present after the above
>| commit which is not in v5.6.
>
>Probably best that this not be backported.

Hrm... But I never queued that commit... I wonder what's up.

-- 
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
