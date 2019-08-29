Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC397C3A5A6
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:32:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4397205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:32:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nKxI6Rr1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Dg20y7Rl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4397205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iE/Bq0iGqbL5rokzgLb/Dw+p0Vx74nlrkl5NfVROTBA=; b=nKxI6Rr1SpjXvz
	4Fq0lNQCR0Wjj4+V+FE62Vxggt6VpmPyecP8+yxgaghoE1tvn3b9bGfwcVLx1+TqsKJk4iF2uXAeE
	xVOGSn1JMqD00cfV/aPE2Ue0cXc7zWVKP0WvoQaOxs6pMtHVHcTtdrGLSHJnNgO+ciWNc48HXbqCz
	0mrRfm9e0y2YWsIuPKvXMifR30iRPo26ViHOV6F3tNp9erU/7Zjmq2+/yRZ8ysFHOU99QRAjdep8S
	yyp0yYqfpkIYi0TXMcEN30XirAcGrQtWD6TvnrDDWR/XMgGIuGSTYz749NhGQW+oeY/eLIkIKXbCW
	YpTihV5yi/5HOZKBfFpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3PE5-0005Iv-4B; Thu, 29 Aug 2019 18:32:53 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3PE2-0005I6-Gi
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 18:32:51 +0000
Received: by mail-pg1-x543.google.com with SMTP id m3so2013355pgv.13
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 11:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PP12ZN4mSTKnf0MT7hUsqNIn9m+j13VzNu25K1FEDNA=;
 b=Dg20y7RlR5lw3IrWb9kFXOXh3UDVfvJqh0MeNCYdV/1eNskEXHbrs3axnbFQeu4GZ8
 vFmjGng4fJdYr0EVfjnDJQMJeVh8Wo4mARH6Aeb9PtJVMKWA11VVmX93rx/9dXPGgsvY
 FxthrT/KIwHAPCTHk5xe9/pt6PCokLIvEdi/hS08sdAQp1r3q7AZLSLFBSyNbM+ZMbvl
 jdT+SIaECfhHRfr2vcg+NsuZxc177fxwtSV8aaLMTXD3pfG1Y6o+78RCTUZZhI39TjtW
 d33SNM+MR8spGoN+2NKJdC/pYKU02Tem9FYPj8xh2wOdI8Doud4CFRDFEUMtW9hqdPBS
 szeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PP12ZN4mSTKnf0MT7hUsqNIn9m+j13VzNu25K1FEDNA=;
 b=Ls/hk6h3Vx0sKvLVPw9SPxgPrCvB3z7mb4W2JcU63i1aZIYoSd+q3jmB1fVv1v6khj
 TSN+x3gDL/D9y48jOPHLnqHZl0PF/B8XnKPLgb1vPBQmX6tYzc1S8RnkpYQtVaQcEEJY
 bVGPPZqamNTu6C+h9+wu+lJxhbnQ5raCW98JhyWH2GS/58RA4chNS8/S+UCMfQ2dXVVq
 reyBk8YAU3+plwKiJJJPq/DD3nACw/Zr9tIU8Pxava/3jAoIFVyh+Sd6Htn/Z7FfXDWD
 H8Nv7kqgIb3m6+GoK/JC5wE+K6vWe2QKFSc+ZxSvJTypfffCJpNGty/ohpbhyp3Ggve5
 DPKw==
X-Gm-Message-State: APjAAAWx+dVLO5U+823p0V3q3DkyrsakJyblv8wvTddPbFKdBQyoUyb/
 CtJHGVPJ+iSk9Iai0kPG9VSGf0UBA2U=
X-Google-Smtp-Source: APXvYqybp8pL5qLXcsTDjwIcUXweNsYeikbXrqtzD5ZaFVHnl0f8HgRwGQ8oNuvWwwNDMokHpRBMaw==
X-Received: by 2002:a63:6206:: with SMTP id w6mr9551512pgb.428.1567103569556; 
 Thu, 29 Aug 2019 11:32:49 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id g11sm3162127pgu.11.2019.08.29.11.32.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 11:32:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson-g12: specify suspend OPP
In-Reply-To: <7hy2zeuv9z.fsf@baylibre.com>
References: <20190827100307.21661-1-narmstrong@baylibre.com>
 <7hy2zeuv9z.fsf@baylibre.com>
Date: Thu, 29 Aug 2019 11:32:48 -0700
Message-ID: <7ha7brrfe7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_113250_554548_3EB7DAA8 
X-CRM114-Status: GOOD (  10.07  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> Tag the 1,2GHz OPP as suspend OPP to be set before going in suspend mode,
>> for the G12A, G12B and SM1 SoCs.
>>
>> It has been reported that using various OPPs can lead to error or
>> resume with a different OPP from the ROM, thus use this safe OPP as
>> it is the default OPP used by the BL2 boot firmware.
>>
>> Neil Armstrong (3):
>>   arm64: dts: meson-g12a: specify suspend OPP
>>   arm64: dts: meson-sm1: specify suspend OPP
>>   arm64: dts: meson-g12b: specify suspend OPP
>
> Queued patches 1, 3 for v5.4.
>
> The SM1 patch has a dependency on the SM1 DVFS series, which in turn has
> a dependency on clock changes.  Once I get a stable tag for the SM1
> clock changes, I'll queue up the rest.

FYI... I decided not to queue these for v5.4.

I'm pretty sure we'll need these, but I I think we need to do a bit more
suspend/resume testing to be sure we have the right OPPs. here.

For now, this series is in my `v5.4/testing` branch, which is included
in `integ` so it can get a bit broader testing.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
