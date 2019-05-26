Return-Path: <SRS0=+Yv1=T2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B354C282E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 May 2019 06:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E6E32075B
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 May 2019 06:51:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QSBXziJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E6E32075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w7KEfDX6Eh+rUjHVEZ+gXRp6g94nZ5aS/EOogrvWbGs=; b=QSBXziJG9DpC4q
	ahxBxamWMfV6K75onIOs+0JtD0pneFzaXXnjCuq/xbu8SBuTKNAc3H7Id2QPtYGMFoq+jT3eRCrrF
	GLLmObGFL22LOMrawccs0mi3CqOFPE733zlOiFT46UcbTWOEj2u8E1iszX6HuMcNlDfxun16a5ImO
	HXHWywWj+WjWP0sZwmLYELIj41zIVFczQ/ePy8f2AsKzKna/GHsHYxx++jUUBum1NT64B8nvnx5Hn
	wZoUVK/7nvqVu7T5CWzWfshrTrxumdJESr4BYnbyjkOkfwJvTDFOYGYRfAW2iX/MMHchKdxk2mvrP
	+e8Hgi5kld1mjcG31Lcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUmzv-0003Kp-Tx; Sun, 26 May 2019 06:51:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUmzt-0003Ju-78; Sun, 26 May 2019 06:51:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 5A6F6283B69
Subject: Re: mainline/master boot bisection: v5.2-rc1-172-g4dde821e4296 on
 meson-g12a-x96-max
To: Kevin Hilman <khilman@baylibre.com>
References: <5ce78689.1c69fb81.58097.eacf@mx.google.com>
 <7hmujc0xnp.fsf@baylibre.com>
 <f01b812e-ee18-528b-1859-620dd8f0fb53@collabora.com>
 <7hh89j1ze4.fsf@baylibre.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <fef4eb85-cde7-6fb4-7586-cfd45b60365d@collabora.com>
Date: Sun, 26 May 2019 07:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7hh89j1ze4.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_235109_393575_0F8B142E 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 tomeu.vizoso@collabora.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, matthew.hart@linaro.org, mgalka@collabora.com,
 enric.balletbo@collabora.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 24/05/2019 19:27, Kevin Hilman wrote:
> Guillaume Tucker <guillaume.tucker@collabora.com> writes:
> 
>> On 24/05/2019 14:50, Kevin Hilman wrote:
>>> "kernelci.org bot" <bot@kernelci.org> writes:
>>>
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>> * This automated bisection report was sent to you on the basis  *
>>>> * that you may be involved with the breaking commit it has      *
>>>> * found.  No manual investigation has been done to verify it,   *
>>>> * and the root cause of the problem may be somewhere else.      *
>>>> * Hope this helps!                                              *
>>>> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>>>>
>>>> mainline/master boot bisection: v5.2-rc1-172-g4dde821e4296 on meson-g12a-x96-max
>>>>
>>>> Summary:
>>>>   Start:      4dde821e4296 Merge tag 'xfs-5.2-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux
>>>>   Details:    https://kernelci.org/boot/id/5ce72c6259b514ed817a3640
>>>>   Plain log:  https://storage.kernelci.org//mainline/master/v5.2-rc1-172-g4dde821e4296/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.txt
>>>>   HTML log:   https://storage.kernelci.org//mainline/master/v5.2-rc1-172-g4dde821e4296/arm64/defconfig+CONFIG_RANDOMIZE_BASE=y/gcc-8/lab-baylibre/boot-meson-g12a-x96-max.html
>>>>   Result:     11a7bea17c9e arm64: dts: meson: g12a: add pinctrl support controllers
>>>
>>> False alarm.
>>>
>>> This one is failing in one lab but passing in another:
>>> https://kernelci.org/boot/all/job/mainline/branch/master/kernel/v5.2-rc1-172-g4dde821e4296/
>>>
>>> I'll look into what's the difference between labs.
>>
>> Thanks for clarifying this.  I guess we should fix the logic
>> which detects regressions to discard cases where there is a
>> conflict between results in different labs.
> 
> Yes, we should.  If there are conflicts between labs, it's almost
> certainly not worth the effort to automatically bisect (or at least not
> worth it to send out the email.)

I've disabled bisections in lab-baylibre for now to stop the
misleading reports until lab conflicts are better handled.

Guillaume

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
