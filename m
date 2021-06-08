Return-Path: <SRS0=JVYJ=LC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1711EC4743E
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 16:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 916C861184
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 16:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 916C861184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HYnds+Gc0toRXoYjiRfm58XwRRIiwdE14+Wp9mzoiCU=; b=f5CchIum/hsGiSlexKWq+ouMvt
	Rfx4joiwuVXbI64Y4vryuVGBr22sCTwXpUQy0EPVdLsVzslfeHsQ3k8sliAlNoEs4AWrMAIx3MEvX
	OuVh4ObvHCCM4N1WSKx6zFlkXDUyYEbIa8frMZza+kN4zw3EySxLxMSIpwaQjuA+q5d7o1sBVi6cc
	F7oI5G1nPeO787OguE9YIWazH3s7svMe2sYiDB/uq2G+HhGv1GYflSlWNXCjetBLfYiYwQU9rgxyP
	mJyEjnl2hnmsLLi+wQU7xxkpGME0lCq+BK8/rPYY0hJaLDeXXlCSphaBRHx6ddY1nc3Ju1EOQjOwY
	aC08wQ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqee8-009X2w-Ou; Tue, 08 Jun 2021 16:32:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqee4-009X0v-GO
 for linux-amlogic@lists.infradead.org; Tue, 08 Jun 2021 16:32:07 +0000
Received: by mail-ej1-x62a.google.com with SMTP id l1so33616528ejb.6
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jun 2021 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=hWkOGoUtVtV8FzZIYvtLihscdJc/AoYQpTw6WbnU7Nw=;
 b=fXgLcXa2w87ln2btJbQraQXHXiGELYbP5LupPcB7myYKqcu6NVlx4DY99oXDbTa0iJ
 xWS2p9E5JbYbO8VcykZ6r5bOys01zOkyw5TWrisdw9B+B/9yY16jsPg9GSUholD4VE+w
 j3foV8rY7hKomZwvqzakSYHrSXFMOILGi7nzcJ2jk2y/DP12hy2khy1msJhwgJxtRmFG
 k6a6Pwa4QHgkqW8RBS6lIM4t0BtwgcNiIbcqS89dlX6cSOa4NerRNw7ansyBa4Vs6g5w
 9wbNQNn1IbwvEWZvEdhbZzrL4Uu1BCSW+d5BexKdhPEPPc841OL4G/30MX8q/+T0r1ke
 L4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=hWkOGoUtVtV8FzZIYvtLihscdJc/AoYQpTw6WbnU7Nw=;
 b=Ls2yCytPt5mJQlgaQwWi3pmt5cylLCqi46NepSqA7GCDPBtmNbqdbQR3xpSIdMIGsW
 GJZ5yxiiveMDCd32xDfVIuu1DIdC0zmyovjgNAZNtasI0NUj8CZf3gprajxbxA94RyzP
 LjdeA1IJBls3TaSSS0EtoxFs+Ne6mFdoTAt/mUmAQ7g+HRPgMGFaAw7Xe7Zz+1wohNzb
 GgMo6ByZxqHh1C7SjwxoNT/L2DWzvinNlzkZtvlrQJzv/MDz3Kj2Xh1V8JqQq/oXImNU
 yYAl3RdP4V8hnHv9KZ/gvJ0oVv88U64r+/5KUuiWVdB6foUY760fSkf5x41abuqnHAxN
 IStA==
X-Gm-Message-State: AOAM530gJW7e1nEgJz8WMJsnRUvq3DcPP8OLYFF0atM1RT090FSDE8Rc
 97dJoqYTvSi/sYk2OF3w7iP5jg==
X-Google-Smtp-Source: ABdhPJyCZUGjO10/Bh4SU9DcJaQK7Cdfy2yI2+cY/S03tVpAXjPIk8DZNa2Xy1DPy2Uof56jdAKN9g==
X-Received: by 2002:a17:906:1704:: with SMTP id
 c4mr11389765eje.182.1623169921329; 
 Tue, 08 Jun 2021 09:32:01 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id s18sm94847ejh.12.2021.06.08.09.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 09:32:00 -0700 (PDT)
References: <20210429083823.59546-1-jbrunet@baylibre.com>
 <162008674673.40672.14279142646066453043.b4-ty@baylibre.com>
 <CAMuHMdVhrMNzuXkD9BQxPaiwS41bsOyJU_kwGYwk5ftto-AGBQ@mail.gmail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, "open list:ARM/Amlogic
 Meson..." <linux-amlogic@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH RESEND] arm64: meson: select COMMON_CLK
In-reply-to: <CAMuHMdVhrMNzuXkD9BQxPaiwS41bsOyJU_kwGYwk5ftto-AGBQ@mail.gmail.com>
Message-ID: <1jczsw1fnj.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 08 Jun 2021 18:32:00 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_093204_597055_55911265 
X-CRM114-Status: GOOD (  15.15  )
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


On Tue 08 Jun 2021 at 11:52, Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Jerome,
>
> On Tue, May 4, 2021 at 2:06 AM Kevin Hilman <khilman@baylibre.com> wrote:
>> On Thu, 29 Apr 2021 10:38:23 +0200, Jerome Brunet wrote:
>> > This fix the recent removal of clock drivers selection.
>> > While it is not necessary to select the clock drivers themselves, we need
>> > to select a proper implementation of the clock API, which for the meson, is
>> > CCF
>>
>> Applied, thanks!
>>
>> [1/1] arm64: meson: select COMMON_CLK
>>       commit: aea7a80ad5effd48f44a7a08c3903168be038a43
>>
>> Best regards,
>> --
>> Kevin Hilman <khilman@baylibre.com>
>
> Why is this needed, and why would this make any difference?
> COMMON_CLK is always enabled on arm64, as the main ARM64 symbol in
> arch/arm64/Kconfig selects it.

Ah indeed. Shortly after commit ba66a25536dd was merged I remember I had
problem with COMMON_CLK (or any other clock implementation) being
selected. TBH, I don't remember it exactly ...

For sure this was a mistake.
Neil, can you still drop it and do you need a revert ?

>
> Gr{oetje,eeting}s,
>
>                         Geert


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
