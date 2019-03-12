Return-Path: <SRS0=/Yv9=RP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF819C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 10:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA83C2147C
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Mar 2019 10:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3/eqx0P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpgXyJhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA83C2147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8QN9EWlUM5IyInnjcCrIjLF18ipQGzxCLTB6ffU7Iw8=; b=m3/eqx0P4IlVWj
	2qM0IN0whrKKLFf4YBKX2ylx0CZTL79+0egWIZhLfYmU6hMTD+7cwLMobhCPrqLfyjlN+vgWN/k6q
	+KBqc++7eeFC2y364m8OeyMPOYiHjr7OcGd6ODgVGL+HJ+hBZ9fI9cWk4a/hQC4Uc6TVT5FBsy8ir
	oOBoRmKpoz6y8bl1P4crG49YWwMrPj0wxzVQ4ZwAaayjtNAUu2kDmrnGqXLGT4qO6DrASqJFoeoBe
	Roh3ixoxCC/lr7TnIgYZcJK49KD2UPrxG0+ePajiNoz/5IBrgCzlaJnGnmiz18FWWQQTWtFNtLgcO
	jXiAfmHILWhW4Ei1N6gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3ef8-0003MD-MH; Tue, 12 Mar 2019 10:29:34 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ef6-0003Ln-Cm
 for linux-amlogic@lists.infradead.org; Tue, 12 Mar 2019 10:29:33 +0000
Received: by mail-ot1-x332.google.com with SMTP id g1so1951758otj.11
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Mar 2019 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vILeB7Cj9iqdkuCJG61BBQsuhFUsgpmKnI7wcoy6bZE=;
 b=lpgXyJhMUiSo49fjfhZaIzgoc/pgm/gOCWeUlJ6Fp8rAcw5kXofODTd/np+p+14pXr
 bOwBTBmUv9cmXJa+h2b5r7z9x6uK0Xs7m/2oBCT9C0GF4mBFKl/9zuT8e/dLJjXg3k23
 WkcnhaGlHGEwTztm6Y1R9/YNmCtLw8JveCPf1FRg7JOaSWxkNVEOjqzz270ew497qsfS
 DwXeXjYbT73qZA9uywyZWh96SVk0IUHKuuH8MsX6/P7Dls3ju+IutxYb7dlsnQkRt+JR
 DgjO3gA7o2V4Mg2Yh4uPXxLGm5Bc8G6fQSwxmH1UVt5pXzrfR4RsLXvXZ3utdqKtSpHc
 FbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vILeB7Cj9iqdkuCJG61BBQsuhFUsgpmKnI7wcoy6bZE=;
 b=CEnUZgKb39ETa8jRIBTiAc5qfeupiPTvsXs0PvP1tCNYq/5yw4sRcIBKf+wK19nnBS
 Yp2nbtoZk2sMNbA4x2JFiQMINwoXHPeTQYEE+7m905Y3dXH2s/fe1sQuoj2kbv05/NCh
 dj8XD5TK5tlRzjwkUJ19wJFdzyLXf5Vn7PVyeT2dvV+u0sZ7FMvb3WdGpl17QF6Mq9As
 d5KfETHQ1aNCjPiIT9UvFox1u/1vfuHixBI9mI737cVyjhjlxk23fq772x0Wy6jj+yTZ
 F/eneX9qCeZbQrw18qem5WHsSmlwb/Fgj1lK0pVCsMYR+G6fptPckNUUw9ApLmxymBCc
 1mxQ==
X-Gm-Message-State: APjAAAW3HGQZPZvOgWe3Jc0nlrD+nXTwrk9owtobWQvsDjsYRZW597by
 jOLV004QVc2NS98KWPf/2uegcCVDc4dcsViIQdY=
X-Google-Smtp-Source: APXvYqwNCm8CC2NaQXDrcN2mmwkyEvxwChpPXRb0t926Vska2sInGvQLCo7I47NZZWe1HK+PluCL5fLS2mO1MukeewI=
X-Received: by 2002:a9d:7094:: with SMTP id l20mr24156074otj.337.1552386571294; 
 Tue, 12 Mar 2019 03:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190312083326.18029-1-gch981213@gmail.com>
 <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
In-Reply-To: <5c580f1b-1038-2c34-7047-e504eb4ac323@baylibre.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 12 Mar 2019 18:29:20 +0800
Message-ID: <CAJsYDVKKNiw9=zqNwn=HWgApVKvTRWy6AEkD8bzwZ5azi447cA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson-gxl-s905d-phicomm-n1: add status LED
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_032932_455355_D3756A60 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi!
On Tue, Mar 12, 2019 at 4:59 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
> BTW, do you know if it's possible to have a sample of the Phicomm N1
> in order to be added in kernelci ?
It's easy to purchase one in China and second-handed ones are dirt
cheap, but I don't think it's available worldwide.
I'm not familiar with world-wide shipping or exporting stuff so I
can't help much here.
>
> Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
