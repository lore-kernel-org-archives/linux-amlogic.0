Return-Path: <SRS0=nO5Q=6Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE065C3A5A9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 14:52:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4B921835
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 14:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TP8yisdt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YJr5Y8af"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E4B921835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BB+pGRhqqcvzq+ey9rZ0HszUHSsnQ9DvgtB7rhyOYsE=; b=TP8yisdtLwJudHntamDS/u21pe
	KTVSxoshEPwSedkQf3RT4eCTkdWyL3eEO6cxnk7grPhuPznR4y0QL0mq++F2L6ZlAi4MGFJxOWTkj
	j47y6u8NpVTMBLRmeiOkyTVY+EuVKPZuaLDvMMg/VIS1215s7WmtR/l6nVUNPbX1WihvC2IImOZsD
	tAfcZIJzPASCbJr7ATJUH2wvkkNWOTw5+dri72NIxYzipXq1wJQIlRg/h5PMNPqOQbYk/kcFImO1/
	yLGKhLeAoo3RU4z821meSOtAAhT5AxuQmQ7xqdL9mEh8NOrEkYsBTKYa00M8c6/0O7/mzKewZRdJm
	nLtW0cNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUtVA-0001gi-9H; Sat, 02 May 2020 14:52:24 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUtV3-0001Zn-MQ
 for linux-amlogic@lists.infradead.org; Sat, 02 May 2020 14:52:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id k12so3218723wmj.3
 for <linux-amlogic@lists.infradead.org>; Sat, 02 May 2020 07:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=eUmO9lFyYnSEUotvSkDdW7nX84l9YUGsDR7MyoCN3CU=;
 b=YJr5Y8afBHWlluBWUgx/5EYN6hyE6dcLw2z1n9vRkLHzQbpSGBhpcOfqygIy3U0gu3
 ZU0X0/T6IEfb9apK8ibAiOkQJB8QlmXhpHVMRe9jOCvalPLCRrcDaDdUz7BHVGmDsBdG
 u0quqzJnaF5I8H1s35iZ55qzUq6QYCjn4YnQcYk32wqe6fgKXVJnpcLkiex+yTPHan9n
 mVgx3/aJ99LjjauFWmgwTQallkMJgpWyd89bUQVy+MrLy5YJ3z9ta+ZgPG+Kt5yzEzD+
 h/CVwqzTMwVfGsIiYzVW3V/WuilTmu0Zdf20RW+WSqc2FJpiUV/KjciIkYOVE8Y0RaLJ
 nMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eUmO9lFyYnSEUotvSkDdW7nX84l9YUGsDR7MyoCN3CU=;
 b=oVeWKI4xV25VqtxfShQwsRJBtegcmlRv44WM7PoGZWAcLJqxbUE58ObK2nC5DHiPRL
 eqsuCafFWGpXl7A3RdD6ShmfnoKJ/AQN7A01Y/SIzXix7yNyRdk/H5Tiui7FCdZVxc47
 h48mVOmFQRGd5o/xohu5Yi5LiPphibHo6Pv5xW5n+npaUYcCqxzIR3/5ze0Bw4OHvWdS
 xm3iT4sP2v284MLtyBqpyWcseWzH3Ix5UebagxAyyrzI9tjIoA0k35dSfseyi0zujhaK
 +WYTKtG4wp4/P6hoOPFr0BAHYys2hIWMydUMH9VQbcQq15+SsIIlPgxPAZ3woE6N2nZc
 zPpA==
X-Gm-Message-State: AGi0PubZVjtDLKT2cCg2Sb6GAjSRl6Asf/UyclkfJgrV6CJJC9cuuydd
 rKso3fX20sLtDn1fMYOlJ/b8kg==
X-Google-Smtp-Source: APiQypLQZrhbbLoB4l9/FVLUeKO9DpS30JZtXUoebbOs+GhYQzJCdHKM8cIDEnbn665XnkBqaQKeSA==
X-Received: by 2002:a1c:6389:: with SMTP id x131mr5212531wmb.155.1588431136061; 
 Sat, 02 May 2020 07:52:16 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id 92sm10023040wrm.71.2020.05.02.07.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 07:52:15 -0700 (PDT)
References: <5eabecbf.1c69fb81.2c617.628f@mx.google.com>
 <cc10812b-19bd-6bd1-75da-32082241640a@collabora.com>
 <20200501122536.GA38314@sirena.org.uk> <20200502134721.GH13035@sasha-vm>
 <20200502140908.GA10998@kroah.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: stable-rc/linux-5.4.y bisection: baseline.dmesg.alert on
 meson-g12a-x96-max
In-reply-to: <20200502140908.GA10998@kroah.com>
Date: Sat, 02 May 2020 16:52:14 +0200
Message-ID: <1jd07mie3l.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_075217_785654_EC336AAD 
X-CRM114-Status: GOOD (  17.07  )
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
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 02 May 2020 at 16:09, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Sat, May 02, 2020 at 09:47:21AM -0400, Sasha Levin wrote:
>> On Fri, May 01, 2020 at 01:25:36PM +0100, Mark Brown wrote:
>> > On Fri, May 01, 2020 at 12:57:27PM +0100, Guillaume Tucker wrote:
>> > 
>> > > The call stack is not the same as in the commit message found by
>> > > the bisection, so maybe it only fixed part of the problem:
>> > 
>> > No, it is a backport which was fixing an issue that wasn't present in
>> > v5.4.
>> > 
>> > > >   Result:     09f4294793bd3 ASoC: meson: axg-card: fix codec-to-codec link setup
>> > 
>> > As I said in reply to the AUTOSEL mail:
>> > 
>> > | > Since the addition of commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow
>> > | > playback/capture if supported"), meson-axg cards which have codec-to-codec
>> > | > links fail to init and Oops:
>> > 
>> > | This clearly describes the issue as only being present after the above
>> > | commit which is not in v5.6.
>> > 
>> > Probably best that this not be backported.
>> 
>> Hrm... But I never queued that commit... I wonder what's up.
>
> I saw the Fixes: tag, but missed the changelog text.  My fault.
>
> I'll go drop it from everywhere, sorry about that.
>
> greg k-h

Hi everyone,

Sorry for the mess this seems to have triggered.

Indeed, with the Fixes tag, I understand why the patch has been picked
up. Even I thought that a backport would be OK, since the mistake was
quite old.

If I had wrote it correctly from the start, I would have found the
problem that was waiting for us in ASoC ... but the 2 errors cancelled
each other out.

It is only now that ASoC has been fixed that we found my mistake.

Again, sorry for the mess.
Thanks a lot for your time and effort on this

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
