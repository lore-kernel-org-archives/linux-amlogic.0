Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AADC43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 15:48:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D8A227BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 15:48:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jtEhZzfd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uBvEJvm6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D8A227BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/5c7b0nKeEheRhM5bg7zL8h/9o8NLt4eC8FMtPk6FEg=; b=jtEhZzfdgmnxIO6HcdkNFbGtKh
	mz27vjsSpyiqYBesndiJgu1CjCteOT+jG8jJNDGQnvBohDqAnvM80qy5xTpS/wp6IywowWxmlu9e9
	mHIZum5LT1fz2prmr5Bx1OqOZfXUC9RvsAZxw312ndSNHP3y9xc2KYQd9NSe6fV/gjPTdahEIfa0L
	qB2ZKutQYcASmgUa9VqFXC6X+1nd/d9fMMwbuGSmDuIqone10povsMkfndIosGxlX3G4r6HOrPx3F
	1B3sK95QH6j8VOnZ0j5ogO7Vi0Q8a7Vldv9UPpiVOByhAmFLkmgbQ5MG8Ba9pCC3TyRt+VpRhM+Za
	QzbWXCoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifQhV-00032x-Nv; Thu, 12 Dec 2019 15:48:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifQhR-00032J-Is
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 15:48:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id a5so2902576wmb.0
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ZSDD0/glpJ1MgC2m3fsC6RmNqv5qfMCzBU/Ws2SvIi8=;
 b=uBvEJvm6xdv/CK4SU85EVr9Mxaq6c28Tocn0XUIdJ+tDyPSZrt0IRxbFwAAZ62yiW5
 9KQVcubwDSY+6CA8hl1fFj9eJov2sRbL/5ESoQ/0bw8vPsA8+jUb149QEZlxiuaHM6gO
 xfkZyTDKaqE4d4r+JCCuwBQv5GWOYOFYudxnuQu6fjI/B0PJXfRn/Ehp46d3CgXQXCiK
 gbIwUpYQ3S+yRiAnpcjUPo8nO5nRZFvC9OK58nUPRUiv//D0JhQBh+VSvn4UN2UHfPTp
 R8xFcowCLsIU3cJ/DPXOlSpTfYNh12UTR1/DeTmqbb1LcZYE2U5lMvCreTJgZ3l4ZzUY
 o+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ZSDD0/glpJ1MgC2m3fsC6RmNqv5qfMCzBU/Ws2SvIi8=;
 b=ZX7Dbgd4zFo3h+wVzdGmhezpcUnq1FyZf53UHbWzRV0ib0rbCx1WsgNEHEJiXqiAcQ
 Q8lPDJlkvVJGVdyjF/eOJ1qO1OaujK4lioKyEQ605YKkCN+07Pb028C6z4y3dqi8k+XA
 wpY5L4FrinFV1N1SOVkEoqB8VuLccOG6du6kscFvqrsuvV+w8FAk3CvZJP4jzrzgFkax
 GFXNsW59ok2Wbt8gZI3dM1YW8rCxTmkeasp+oEehn8TY5o2c9TCV0SozdSlKtTfH5HrE
 XHZx5jxIrU+8hxzAs2mKfTfuU2atIxEk7Oz2ljjAAPiPejmkGJYHaVOKKFFIyjDxLSuJ
 ZD0g==
X-Gm-Message-State: APjAAAV5bQllFK9ociGpz3cWyWimNZi4Fu4KC/s2KjgzXTlgaPvJ2m8J
 vcxfOFRw8R/j9pMts3kHjkwuMA==
X-Google-Smtp-Source: APXvYqwXq66n5SLrBk1VKsZ4xywwLs9fJTHh0tdpXlZ2eIUT6PJDbAVb67zUzRsHvrqVeSqYp7yuWg==
X-Received: by 2002:a1c:3141:: with SMTP id x62mr7208553wmx.18.1576165700213; 
 Thu, 12 Dec 2019 07:48:20 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id b17sm6464442wrp.49.2019.12.12.07.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 07:48:19 -0800 (PST)
References: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: Re: [PATCH 0/3] ARM: dts: meson: clock updates
In-reply-to: <20191208180525.1076152-1-martin.blumenstingl@googlemail.com>
Date: Thu, 12 Dec 2019 16:48:18 +0100
Message-ID: <1j8snhbl4t.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_074821_620955_45767F8C 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 08 Dec 2019 at 19:05, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This series moves the XTAL clock out of the main (HHI) clock controller
> because it's an actual dedicated crystal on the PCBs.
>
> The last two patches add the DDR clock controller whose output is used
> as input for some of the audio clocks.
>
>
> Dependencies:
> - patch #1 has a runtime dependency on my other series:
>   "provide the XTAL clock via OF on Meson8/8b/8m2" [0]
>   Jerome has already queued this for v5.6
> - patches #2 and #3 have a compile time dependency on my other series:
>   "add the DDR clock controller on Meson8 and Meson8b" [1]
>   Jerome has already queued this for v5.6, but you need an immutable
>   tag for the dt-bindings

Bindings tag clk-meson-dt-v5.6-1 available with the necessary ids
branch v5.6/drivers with the actual driver changes

>
>
> Jerome: can you please rebase the v5.6/dt branch tomorrow on top of
> v5.6-rc1 and provide a tag so Kevin can apply this series?
>
>
> [0] https://patchwork.kernel.org/cover/11248377/
> [1] https://patchwork.kernel.org/cover/11248423/
>
>
> Martin Blumenstingl (3):
>   ARM: dts: meson: provide the XTAL clock using a fixed-clock
>   ARM: dts: meson8: add the DDR clock controller
>   ARM: dts: meson8b: add the DDR clock controller
>
>  arch/arm/boot/dts/meson.dtsi           |  7 +++++++
>  arch/arm/boot/dts/meson6.dtsi          |  7 -------
>  arch/arm/boot/dts/meson8.dtsi          | 24 +++++++++++++++++-------
>  arch/arm/boot/dts/meson8b-ec100.dts    |  2 +-
>  arch/arm/boot/dts/meson8b-mxq.dts      |  2 +-
>  arch/arm/boot/dts/meson8b-odroidc1.dts |  2 +-
>  arch/arm/boot/dts/meson8b.dtsi         | 24 +++++++++++++++++-------
>  7 files changed, 44 insertions(+), 24 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
