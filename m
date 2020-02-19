Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1DBC34056
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:57:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020FB208C4
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 17:57:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q8YwwjGU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NubdAZU+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 020FB208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2XBVuxwiX+XjTzEjpPMjGpyjGKj0NsPhbOvXQSfWM08=; b=q8YwwjGUkfAXRrbsXtDxiQmmea
	LfqFhQ2MnwuZ3L+06LU7yAtJnTiq4RthiwIyjz+xRe3UUHQaDhuEFbRStLUGReEEIKAiyj20MbGEJ
	ntfB0mMny3f67RuWSvsAdqjXssjnSlTEkUVNSeinef+8zCMC+EVw0S6mLvJCJB0AGz1cSrT7zFDBX
	U3u1YJiBbvdpepZinJjroTrMB+djozlb/1DcrE3p9/+jeh0nVSSzPMVzkHFIRH8Ma7/BSzE3yfyxm
	zViKA6x3Cp52FeUHKxyH9xrWK7nlmUycsNTMR4xf6Ox8RiXTxoR7T+N1d7If3+m+IZXA1D2o0E8Ek
	jKTQ4tdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4TbJ-0004Dl-Gd; Wed, 19 Feb 2020 17:57:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4TbG-0004Cz-BN
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 17:57:32 +0000
Received: by mail-wm1-x343.google.com with SMTP id s144so928063wme.1
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 09:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=KHboEJQ4V7KnKKRwo21hWQi19tJ6wvBUxs3FLeRZPmM=;
 b=NubdAZU+sSIbz0BV0mDakLLuTLcEqspzE4Up1DQtkWIpdW1mpgNM1v8RJ8ZZuhKvJi
 MWbF+35NEjHnzip03/uJuENbfIAdHWuamF8c69nFYf8zV/oVGHqSUZ630Fswm4XC1dXz
 5YvgY7LY2WqHCTIKhYcdwQ+R6HX4cffTVm3cfpYzg4Eu5XyaxWurXKwAMWFatKDl7RdO
 PwF98nY3P7BdedA9YhLoKZf9L8cjS/aJl3c0DkPJ45wMIxscmqwbW4Gqu5RHDGZJzlOH
 3ErQZHlJgoTkUGCUcLd9fsGwG4X59w8oZIXhFIykIQMVOmotCRQ/36uQA3DJfB4uT2nw
 EGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=KHboEJQ4V7KnKKRwo21hWQi19tJ6wvBUxs3FLeRZPmM=;
 b=mfplVfSX30OXSTOsBoSQy+baML1FXHP0J2umgk6bLAi3xBYB+znZ1Roi7l32Iw2KWa
 pAYGy8hrm+EDqXUdgpgzW/EF6sEEH8/jmr/NhlXJXmeqUjMCRO8rT2yonMm3UbAP/0hA
 zuaTAXqdnCvCLFV/ueccq1lssLRKc/H2RbqLygdSBqkr4z9RsPp4837OG704kVHvP3Yq
 mVzfxC0tgo4bCOFNMh9yOIf3ezs74c946hOIgplSyzBP60p0rb6rQRT0jJs//ac5c33T
 Jp48aIWzJGvKIPjZMa1zqPJziqDTeDcHztKdicij0C9nwppSVAtUy3P2O37CqVnqxcQl
 nyYQ==
X-Gm-Message-State: APjAAAUjriHbiSjTc420HL/Uhix2ISbF/P4AQge/UuOyPaO7U6PmJWUW
 9ePTdH9g+PAndJNrIxx45uDpng==
X-Google-Smtp-Source: APXvYqzbs/Rr0atG2jUBRF7oE+i6F0iHSH+QTqV8GivqqqY0OmLGz1cSkAVCbjhN3skyuX9vVMLI2A==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr10879867wml.167.1582135048910; 
 Wed, 19 Feb 2020 09:57:28 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f8sm771899wru.12.2020.02.19.09.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 09:57:28 -0800 (PST)
References: <20200219084928.28707-1-narmstrong@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: g12a: add support for the SPICC SCLK
 Source clocks
In-reply-to: <20200219084928.28707-1-narmstrong@baylibre.com>
Date: Wed, 19 Feb 2020 18:57:27 +0100
Message-ID: <1jy2sywjco.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_095730_395887_22D139B4 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 19 Feb 2020 at 09:49, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Like on the AXG SoCs, the SPICC controllers can make use of an external clock
> source instead of it's internal divider over xtal to provide a better SCLK
> clock frequency.
>
> This serie adds the new clock IDs and the associated clocks in the g12a driver.
>
> Neil Armstrong (2):
>   dt-bindings: clk: g12a-clkc: add SPICC SCLK Source clock IDs
>   clk: meson: g12a: add support for the SPICC SCLK Source clocks
>
>  drivers/clk/meson/g12a.c              | 129 ++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |   6 +-
>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>  3 files changed, 136 insertions(+), 1 deletion(-)

Applied. Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
