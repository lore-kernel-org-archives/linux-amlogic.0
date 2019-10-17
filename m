Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879A6FA3735
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591A321A49
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 16:00:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sdbOBuh6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CggdjClI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591A321A49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RBTOzOgi3e+73Uax1teebVCcg8f0dAKX8Qqz7jrxwv8=; b=sdbOBuh6ly7Cp3cEWHTSEtm/Iy
	O46acxQDU7SENM+j93XCrWsNFLukzkfNERmigOC0JpA8NOwvuyO1An09BWvurbtJ5huczdQ05Dhj7
	JCtcp6jVf5kGC2e4nVVMg0bhREkVwX8ked3l1J4c/Ileitr2YZfmQVMCevgTWlyHV3sUddUFR1sT6
	wUzbzoX3hIlLpESbwp9amBlAzys5WmqItJYJ9k/MWmmupRSwXVaJ9VL+2DrqoMoFPWiV/u0eLL97K
	ieanGN2fI9QEeRcE41Keek25DIhtuQx1HLnCinO7hrr1Z3o2fvgQepSLNVLRXZExz781A1a4C3DhS
	slEIkFTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL8CX-0005pS-JO; Thu, 17 Oct 2019 16:00:33 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL8CT-0005nx-NI
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 16:00:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id i16so3128302wmd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Oct 2019 09:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=K92xI+/RkXkPNl+cGfvbqFzqM/p/1yJ006GVWjx3IVs=;
 b=CggdjClIWcSoRXgef5gv0ShuIOG24Za8FzwWf9E4ClyF7n+mPqXeJ+FYEV/bIW1lnx
 nAc/I/Iq4ZR73NYNSACNxdqyFO39HgzTtoQT/r5XTknAPVFalD3lDMOvpaxTbAQJTp+w
 us20Uh8RDWgTOgAD0JxhShJoOFBAidBAO5YK6k3Y0ynId+jEVP9jeQgHk+FBqiuPezbE
 SQfo1I0Q2muik78pHRAXWiFsoKyGUMi9pg/ZCDOgNOiBeF2Awq/HcccVeXQKOtlbWCvO
 oxPi6LgaOFvLUEmQdOOuqwqw806kCTizmxPdN53ELPDSOdUt3b7sh5t2h33BzZoGGYj5
 t3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=K92xI+/RkXkPNl+cGfvbqFzqM/p/1yJ006GVWjx3IVs=;
 b=g1S4I2f87z8bcoaSHj1loYxVvqH2i0MTH0SjtyzczgsDN0+rpWHzghh1J2LqN+iySQ
 qXV/ehiVbMqWCI45iU6xjvvJ0C2o99zEb0oqMe6Xld+/4Z2I63/PVnfCzZSSwtzFAcb3
 mLDQIgwDZa70+zVPa9W1rdJhPIW6vZKo0m563xfr4nZ8iezcLD31WPpBNPFEN8JPzsdP
 0EUrU/p0UwVhwAdEQXTatM7Q3VZgttoIsT4JvAXzbqBHIGEzv3engwMkrrSRrNiDVqWK
 U3YiYVeBy+YAPhsJIXBePWK1Fpuomga7wRImlW3x/JU6qGCApidg15bjLuZEIrj+B5Sc
 hJQA==
X-Gm-Message-State: APjAAAUsUuKTFR9mVtYSri8giHK+IAreNKVVZLOtKdpvfuxKuba180a4
 DSR7focRRH7+ZJCp/cUOCOLAdQ==
X-Google-Smtp-Source: APXvYqxU9x5KGD/Ua0mSg1w0b4PXk+F6jDtTrWq3r+9vIpk0bZLy8thz/z4qpoSUhgJ4QRtxB4X/Jw==
X-Received: by 2002:a1c:20d8:: with SMTP id g207mr3538145wmg.79.1571328023876; 
 Thu, 17 Oct 2019 09:00:23 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z13sm2538882wrq.51.2019.10.17.09.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 09:00:22 -0700 (PDT)
References: <20191009082708.6337-1-jbrunet@baylibre.com>
 <7h7e54hdif.fsf@baylibre.com> <7ho8ygfxo7.fsf@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: sm1: add audio support
In-reply-to: <7ho8ygfxo7.fsf@baylibre.com>
Date: Thu, 17 Oct 2019 18:00:21 +0200
Message-ID: <1j1rvb2wh6.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_090029_763338_4D554143 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 16 Oct 2019 at 18:43, Kevin Hilman <khilman@baylibre.com> wrote:

> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Jerome Brunet <jbrunet@baylibre.com> writes:
>>
>>> This patchset adds audio support on the sm1 SoC family and the
>>> sei610 platform
>>
>> Queued for v5.5.
>>
>>> Kevin, The patchset depends on:
>>>  - The ARB binding merged by Philipp [0]
>>>  - The audio clock controller bindings I just applied. A tag is
>>>    available for you here [1]
>>
>> I've pulled both of those into v5.5/dt64 so that branch is buildable
>> standlone.
>>
>> Thanks for details on the dependencies.
>
> Just noticed that all of these had "meson" in the subject instead of
> "amlogic".  Fixed up when applying.

From what I can see in the git history I have always used
"arm64: dts: meson:" in the subject.

Did we decide to that change this recently ?

If so
 * Sorry I missed that discussion
 * Should MAINTAINERS be updated to grep on "amlogic" as well as "meson" ?

>
> Thanks,
>
> Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
