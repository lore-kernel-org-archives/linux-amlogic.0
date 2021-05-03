Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A5C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:21:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE19961278
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE19961278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oUk5b/zMjpbeR2Wx/y8vbI8UZ7auobQ1mujSYL/r6Yg=; b=QpxyBQO2MgBnv1Tm6nXPM1yaf
	e/n731RSfZcErNQgAbQq0wUPRz3B8tkA69lb0EBbsaBpKr3VVkHYNWNvhIq+0idjBd2XmbTE8ORzZ
	ECxFuN8Qpuz+RqQqzZl/i6nIpCasnOZbqA82Ut5tUEBw8pGn36eY5UmV1kkcHxu8qi/SyHYmWvQtR
	eDXuFLEZEiQtRjXORC5o/qZm2KDfgT06ITweCgsYvF+FFUEY3JmbeGVRZmEbvZNpHcDkChuSrtCTu
	d7CyOj9gIF68BsJt0Znl9ZCPN2CqYz9nwPQtORfnOve+TPJaYPNe7dKD0dieNt4I5fBQghiO7oKj4
	FO7Ti/Wig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldaNx-00ED9m-CH; Mon, 03 May 2021 15:21:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaNc-00ED5R-Fv; Mon, 03 May 2021 15:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Kkqs94+/ybUyNI5rZrs90tbn8fLyNhu7W2OnlMi0z3o=; b=txaxsDCcB+olHKLj4HO1u+kI+0
 OjKOB7EuzWdLqaKteGS+rVMCUTkTQkperrV9Jfb+3xJKGKMoykRgHgOknreWl9e+eHOrOHIJTM43P
 Nrs9+Dhj44IIh03XId0gjb3iKkQFPiT0E0eVI6j2LWGrQ8T0d/i6sWN0LAbTQPy3CX5xIcJoaEC9D
 GWpqUE5ANh8kCUbn0huBK7HA6V1I12+20Hf8q0U6HhxD0Rb6uAAtnXUoeGnDeOixsqGU4/ZVWtAsy
 w2jovSP8+oUnQM2GfFIfi0AbeCfFXfHUvfGK5jMV2QtPDyEdQPnykCjlz9ccDPMc5ygDnbFKLT1T0
 1P2EOx8A==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldaNa-003ASt-3L; Mon, 03 May 2021 15:21:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id y26so6733302eds.4;
 Mon, 03 May 2021 08:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kkqs94+/ybUyNI5rZrs90tbn8fLyNhu7W2OnlMi0z3o=;
 b=Ievrd4IVcRxqnwuDMPx71rpYDu8wesN7ueRNWJMJRO8Mwy2kIFknWE4kJ/z+u46c7l
 gtLyLdWQ1vLk0T3mfWdwhXvbYO1EexlN/T4rHbyy1juHx8x2wiSSS3veV6EECzJR1Cb4
 8L41CD3RP5bGy/Xf1b0QugmWNqjbzc2WA1LagllCFeljI1WOLNQoRospk6UlhcFjtvFJ
 D55jY3dbkIgUIDiuym2tFDyu8t1eRjKOcYK06o/6urSsXVARBjGd/eKUUIq7y8MbuFMb
 LA6IphnWdZ1Yk+i3xeAI1mriu0g8XWuxS+VPqjpjfxulIvGOv5p9sGks06492UFdfWm8
 zWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kkqs94+/ybUyNI5rZrs90tbn8fLyNhu7W2OnlMi0z3o=;
 b=AXJROkHD3ezd5vNtJtPwd0TaGOvMsNDk4mf+6e/faTeCV17aNPPsa39r/q21nbK4vK
 85t84Y39wiG792hx4jK3TSyUMVV4aV0N4UA4XdEWNzQe4QaqJ5+j3/YsYiunkRp49QrJ
 sqsHSNeNbIRae9tnUxeRwdJv/s6EATCvRnSSsEvXcjKHY5q1hZWodtg/nr4Q0Dq66mQF
 ZhGVJGoBcm1vQcFAp9rWEgmJkY25J7TqGmxN4UNR2bEcC5a9nlfGKZOuN3SEbJxxULQc
 OPpw6gmUlmENIKaUszx4UEWqpFu1+2bM9sxRNkeGz5p8ZzjJ02xxojRpBTSRCXly6Nfq
 YScA==
X-Gm-Message-State: AOAM532yokJODjMULYMCt0qYddWQs32/LbdtAgllK5A4uVEmDGRm7VIW
 06w4WURIBYe9uREA8MpOSWg5vaJtdNzF9Nk8AO8=
X-Google-Smtp-Source: ABdhPJwAOleGZd/Eez3lx4AEwk1OJQ6JhUvQv+HUuG6q0XvBq/99VHpqLBzZfJZqJpT2VJB7vIvPWyO4LHlM9wVgDEY=
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr1029117edb.208.1620055258882; 
 Mon, 03 May 2021 08:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <1jsg336eoo.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jsg336eoo.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 3 May 2021 20:50:47 +0530
Message-ID: <CANAwSgTiWhb5+iO0Ro4WO6uH4n_VoihZPsqaNMVx-hQ7kVwagA@mail.gmail.com>
Subject: Re: [PATCHv1 0/9] Added Audio and HDMI power domain for Amlogic SoC
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_082102_174752_F5DC666D 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Jerome,

On Mon, 3 May 2021 at 20:35, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Mon 03 May 2021 at 16:54, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Patch series add Audio and Hdmi power domain for Amlogic SoC.
> >
> > Tested on GXBB - Odroid C2
> >           SM1  - Odroid C4
> >           G12B - Odroid N2
> > -Anand
> >
>
> AFAIK, the audio power domain is a no-op on the g12/sm1. At least this
> is what we've been told by AML. Unless this solves something, I don't
> think it should be done at all.
>

Opps, I unitedly make some assumption,.I will drop these changes.

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
