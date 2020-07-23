Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8B8C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 13:06:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5974F2064C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 13:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZS+qT6IN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Xe+pBAfY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5974F2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0bFs0G8EUuVt3vqr//9o0VTxYJKQbu7yjfFCb/YmD8=; b=ZS+qT6IN2wD9AdjbSI8oDopLcK
	Vb4Q1e6MkReVHMaiA632CAF3aWfga8xdLmqecMf4q6xeGmVHi9jr5745AqyxAL5XNYHBlKp3zjheg
	lgpW331cHvKZCtDm39VMnerfwD3u485xwdNR+69PizxV+rr8JHXT6iz87bfa/THyruGyAm8S4qPYJ
	+EXGTTN92du1yF/k9A/ScIbB7oWiLoZbpRc7IAiQuJnnjx2FBT+SaOBellNrLASGqmAwaCeAujtB/
	OZhqXg8jMHmO+r4OkvVag3XZrTjR0aW9IuHn5Gt7bCOp3ZDzfIwxhV/K3Sr+HRfhWKkyou0Sh3sCU
	G0s+IerA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyavI-0002N2-28; Thu, 23 Jul 2020 13:06:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyavE-0002Lu-BO
 for linux-amlogic@lists.infradead.org; Thu, 23 Jul 2020 13:06:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id o2so5137389wmh.2
 for <linux-amlogic@lists.infradead.org>; Thu, 23 Jul 2020 06:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhHPGdBirnxGgFi8bexRIuHxLFG0S4BB2dR9GyQVmCk=;
 b=Xe+pBAfYzl4RK/NEvINWJ9Aqavn3bZW9z0oEiWq5ixrwu1RFHFB1PgWGc7Rnw25sJG
 IYntWdmD1OXm0IqTjzcNRL+N/wBaOQwOTiVaalhnd+98RIfOyk9j6AtHd7OA/d/XGCK/
 uuzPnrnOSkuspiSWfSYr1eyxqnvWLaw3ZUtVWROEKkkx/7Z4Zl7r/J64PcJb82E/QOOi
 tJWucCNURQNob+AzkZqlLyZRit/JVfVyuWv9/TH2FuKYSmWKIOungkFeHbgDf4MR8VoG
 T6RmbYWeVGnkFX2luKjtnyWVYFpOs48NCp/hzmuaX6fOs38KHhGy/I7hXABXz4W+nIzI
 qlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZhHPGdBirnxGgFi8bexRIuHxLFG0S4BB2dR9GyQVmCk=;
 b=sjFT4D1vy7yKjNhvPGWqt2thx66EmUk4yCOwc5dVMmt0M8wt6K3hJoz+r/SLak62KS
 7sf66MWaRwzbZ2/SkSY3iFnqBG05K0Dk3dfeYYRr5DCGJ8JYNISBRAhFddGBxhz55jP5
 94932QOPmgD0n6+OqmVpgEuqsroa9XBXDvthDR+chWaBoTyCnPJl2MaZJWMgkX+kkkJA
 FRz2F2EteKnAmFUqXA0U0iK82616y675R07LngQ21pahLsG2ocU+Y0X9MQpT0aSxE26Y
 tsCdIIsE8yVpdVT0k7C7zDkxNttylugijQbWbPEq66kAqC16mIfIT7wws9X0cwJPqRLM
 aP7Q==
X-Gm-Message-State: AOAM532lrftWF4wlNzRtJ5mHYGDD0BgHocUdV6iAbSPBidnPpv1+X7Er
 ctApmMmU7MgJaR3z8Z7H2AMosw==
X-Google-Smtp-Source: ABdhPJy1z7BDwjDITZVG2Be+ptJpTP2Kx1DF18QcFwoy5/HCUN2B17pU3XLN8hhBZP5u5Y8t7rfBgg==
X-Received: by 2002:a1c:2702:: with SMTP id n2mr3997173wmn.123.1595509562314; 
 Thu, 23 Jul 2020 06:06:02 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d?
 ([2a01:e35:2ec0:82b0:5ce9:901f:7444:d44d])
 by smtp.gmail.com with ESMTPSA id w16sm4389260wrg.95.2020.07.23.06.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 06:06:01 -0700 (PDT)
Subject: Re: Reset controller on the Amlogic SoC board.
To: Anand Moon <linux.amoon@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>
References: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <e695300d-4974-2c75-d227-eb74de60c8a7@baylibre.com>
Date: Thu, 23 Jul 2020 15:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_090604_606070_D54A60B5 
X-CRM114-Status: GOOD (  15.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On 23/07/2020 12:49, Anand Moon wrote:
> Hi Neil / Martin / Jerome / Kevin.
> 
> I am a bit investigating the reset controller for the Amlogic SoC board.
> Each of thes reset controllers have different reset IP features.
> So we should map the reset controller to appropriate IP nodes
> in the DTS to make this work.

Correct support is already done for Meson8/8b/GXL/GXBB/G12A/A1.

Can you specify which features are missing ?

> 
> Following are the reset controller reg ip blocks as per the Datasheet
> Datasheet :- S805_Datasheet V0.8 20150126
> Datasheet :- S905X_Datasheet V0.3 20170314publicversion-Wesion
> On GXBB / GLX
> RESET_REGISTER   ----> 0xc11004404
> RESET1_REGISTER ----> 0xc11004408
> RESET2_REGISTER ----> 0xc1100440c
> RESET3_REGISTER ----> 0xc11004410
> RESET4_REGISTER ----> 0xc11004414
> RESET5_REGISTER ----> 0xc1100441c
> RESET6_REGISTER ----> 0xc11004420
> 
> DataSheet - S922X_Public_Datasheet_V0.2-Hardkernel.pdf
> G12B / S905X3
> RESET0_REGISTER ---> 0xFFD01004
> RESET1_REGISTER ---> 0xFFD01008
> RESET2_REGISTER ---> 0xFFD0100C
> RESET3_REGISTER ---> 0xFFD01010
> RESET4_REGISTER ---> 0xFFD01014
> RESET5_REGISTER ---> 0xFFD0101c
> RESET7_REGISTER ---> 0xFFD01020
> 
> Each of the reset controllers have some different bit fields,
> For that we need to have reset binding macros accordingly.

It's a documentation issue, the register layout is the same from Meson8
to G12A.

Neil

> 
> Please share your thoughts and If you have some inputs or
> another approach please let me know.
> I just want your feedback before preparing
> and submitting some patches.
> 
> Sorry my English is a bit poor to express hope you
> will understand what changes I am proposing.
> 
> -Anand
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
