Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34387C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Jul 2022 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hiY3KZ9jmId74O0oiwc/WOFGrLldwEJ33mi1hTTlJ0=; b=L/HDPke+nOZvD9
	gvfaCoF1EE9HFJ8E/Qc2KBUZC5t7nDyg2YgTQk1YFrNYBVaA9XYcukVsmFykZ8dMtDCRWhIkFr//4
	1Y6rjXJstLmy124xxsAOHk57nQfODFM9fWFs9oklHHv3cLGUbu1/sHuhS+JLP7DMMr7Y+dvhYlUf/
	nxCXtT5Sy+0TPVDPppGbjbgG/DtnqXyp0ksKjctM72A9KwQNPB5d7SGGye/JnOJR976O1UWSn87tJ
	rgmAxUYKn6Nn/QXVm8WdvBMjXIM+VuN0IvMiu+g2Tka+jbSADC6W01vH7dWecZrmanaoc2ANXNbbH
	QBu6P1OXfPWRVvpsu6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Nx-00APJg-Gm; Wed, 06 Jul 2022 13:48:09 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Nk-00APAL-EX
	for linux-amlogic@lists.infradead.org; Wed, 06 Jul 2022 13:47:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so9009566wmb.5
        for <linux-amlogic@lists.infradead.org>; Wed, 06 Jul 2022 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=oUwD/AXk3hn18jg9g8hVaPoJbhZdU+eC6asfRcw/JZ8=;
        b=OV6NQ+wPRl2SEbWwcpJRPhyEuZ8cg8yTsJqgVyKnZOK2UthzIAwcDwB3+WLL18sjlb
         /C16E768PD8WDWQUV6iOuuogcZaJTm3BQQsDxPgatCYJKd+jgAHy1Tif+KBTazTMIlG/
         kxGvrZ0Tvh2dHNnjY8fuDHaK5o5kkwzA5t881UFs5Y/G0C1qj/QbDh/lehUdLme1OnUm
         YpZ2RKUuGtPpgDS7hss+aISwdPO9egSp90BXGcvs1tYhm0cVrJ80C2ATmvjFYErITX1w
         ajhAeUc+2+ukI2+7/Coim6NfRFcDUpiexL3hP8VSfhXG28L4D0jNDHs4VXRANYAZ2PQm
         L6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version;
        bh=oUwD/AXk3hn18jg9g8hVaPoJbhZdU+eC6asfRcw/JZ8=;
        b=EsUjLafXGPA3WMDhObpZikdi/IGyr6MBEuBj1R80sGSoQ320mjM/K6Uofad5h6fmUi
         IhBjs2BxMf5+G1F30BXBQ6ZirMycKcjvWhOnOsxR4ArlW0qjFnr5TSLzhA/6CnYIW9yr
         9myXUTwdOHRK9DYUi/td8x8C+KXPuqUzEy/dZ1WJ+8zepay5ZnMsudVWtaUZi49uNCNI
         KgIBHN2Yc9x8nV2bf7W1MfF64AW887izdOPN41mBOVPSMdCj1LI4gQoxYO9V0e+JDHPB
         B1YzZhKVijtlRWwbFGs1lvaYrcBETEhUcfsmN8MjgUQlffDjFKiYBBh1UFEmtmQgCAiq
         SIpQ==
X-Gm-Message-State: AJIora8tZl4eZzplFKcSzk6VB6PRz/nNNf8pPnXAv5UYt0NhLNAIv2uD
	b8J8kLG+y69t+p5wwj/zfaw5NA==
X-Google-Smtp-Source: AGRyM1uUD5fUICbLUxi3NjNN7CjKDLK0xdLSPc5G0890T3qq/ARu1rv+irGhKla3vDPUN0DyFqatKQ==
X-Received: by 2002:a7b:c413:0:b0:3a1:8f03:29d0 with SMTP id k19-20020a7bc413000000b003a18f0329d0mr29344119wmi.160.1657115273408;
        Wed, 06 Jul 2022 06:47:53 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id v192-20020a1cacc9000000b003975c7058bfsm26068541wme.12.2022.07.06.06.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 06:47:53 -0700 (PDT)
References: <20220705142444.17063-1-pboos@baylibre.com>
 <f756b2d5-56e7-6e52-2739-eca4bb33508b@baylibre.com>
 <1jmtdnwd7y.fsf@starbuckisacylon.baylibre.com>
 <20220706124139.GB492220@roeck-us.net>
User-agent: mu4e 1.8.3; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Philippe Boos <pboos@baylibre.com>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] watchdog: meson: keep running if already active
Date: Wed, 06 Jul 2022 15:24:27 +0200
In-reply-to: <20220706124139.GB492220@roeck-us.net>
Message-ID: <1j8rp6z720.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_064756_536594_10A005E3 
X-CRM114-Status: GOOD (  23.83  )
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


On Wed 06 Jul 2022 at 05:41, Guenter Roeck <linux@roeck-us.net> wrote:

> On Tue, Jul 05, 2022 at 09:29:35PM +0200, Jerome Brunet wrote:
>> 
>> On Tue 05 Jul 2022 at 16:39, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>> > Hi,
>> >
>> > On 05/07/2022 16:24, Philippe Boos wrote:
>> >> If the watchdog is already running (e.g.: started by bootloader) then
>> >> the kernel driver should keep the watchdog active but the amlogic driver
>> >> turns it off.
>> >> Let the driver fix the clock rate then restart the watchdog if it was
>> >> previously active.
>> >> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Please drop this review tag since it was done off-list
>> 
>> Indeed a review was done off-list.
>> 
>> Reviewed-by says a review has been done. I was not aware this applied to
>> public reviews only. I probably missed that, would you mind pointing me
>> to that rule please ?
>> 
>
> Public or not doesn't really matter. However, you can only apply a
> Reviewed-by: tag (or any tag, really) if you explicitly received one.
> The exchange seems to suggest that you did not receive that tag.

Philippe did receive that Reviewed-by. I gave it to him.
Doing his first public patches, he first requested a review off-list to
try to get things right and not bother people too much (so much for that :/)

> Please never add any tags on your own.

He did not.

>
> On the other side, if the reviewer did send a Reviewed-by: tag off list,
> I would kindly ask the reviewer to not do that in the future to avoid
> misunderstandings.

No worries. That being said, I have gone over 

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst

It just says that Reviewed-by sent on the list should be collected for
the following version. Nothing against adding the tag if the job has
been done, on or off list. Same goes for Suggested-by, Tested-by, etc.

If I missed something or it is non-written rule, please let me know.

> If you don't want your Reviewed-by: tag attached to
> a patch, don't send one. Not everyone will even realize that you sent
> your tag off-list, and no one can be expected to know that you didn't
> really mean it when you sent your tag.

I do want Philippe to add it. I would not have given it the first place
if it was not the case.

>
> Thanks,
> Guenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
