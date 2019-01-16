Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7F5C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 11:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6CC820859
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 11:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n/JyBaIq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="WImO48WH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6CC820859
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ep/OJ+8NticaGWIWl8vZIFSANFFV2x9ktsZ7CtfP/Vk=; b=n/JyBaIqPVIBYY
	UlTKWkIodXYXE13z3naU1bTxgVEIZA4VV8JPfswEUhI+Yd3hZYgNEY4pg2XnNH0ImzwOuLhLrqmg5
	gF1KnBrvwkKwT75UWs3kId1RL4O0/WQ6b6En5oD9yzQ19aT7jQQksLuz4M1lojim6Tzh1FIgDCOc5
	M/52R0roC9Mws9l2bNx7Uu+bINzhMZFrLQuYG7zUD1K4E8GX43IJNp9W4PlLElDBrxnd1btcnbcpL
	lD1ufmzOJjr/HDfw8kmf7eOsQtHpW1YbK3dDRUP2HMVHBhwM7UrIW5ZGaHGg4rCa5tfmKSOqlCpsI
	6r2GQX3iKYVoNzx9zP5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjj9k-0007iX-AJ; Wed, 16 Jan 2019 11:14:48 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjj9h-0007XT-OE
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 11:14:47 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id j23so1315067vke.13
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2C3ZKlcF2UVg4OSxXSa7yA+tMPxU65aXLWUXqzt1Bb0=;
 b=WImO48WH4a78+cSEKi105Dtk4ohJHtEflHd1CsWvocwOpFS6u794GOkmx1RQIALqH4
 3AaXEr8+/ZL/GEYPor4Fa+wNi4ovG+z6NM8dDKz/j3YDMyOuR3hx0IdcVLoQvWo336Z+
 yDW+MajVXHyE7++K50YQ2PXKkN+YTN3G35Org=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2C3ZKlcF2UVg4OSxXSa7yA+tMPxU65aXLWUXqzt1Bb0=;
 b=pL+tSjvAg5QORCa884la0DdRys/NojglkWwXtd9Hmwao3wg/CifcOjz4cUK09TN+Au
 nvnBZeNPQUKBdKKALJQg8w3rCAX2lAP072XDDw7uLeRGllsF9nygDnygERugr8E8eExY
 DuwJWMZsiD/CTe7QZ9XiOva27CyqL4mcTC5qB6xc8phiffFTESJ7nl4XAb02vqI3Adqs
 tm6G/3d8lVFVxcxDD+KmyebsJ8tHDm/N01/FU0zG/e0+1zzoxrsp7QOK9QxiOkH7eDtP
 7wD2mJp5juAi1V3LKp/IWdR+9/8DSYM3R02AvWAN9ajFxl63Y2IyAemKHXwrWHj9QsKb
 TN1w==
X-Gm-Message-State: AJcUukeduqjn7GFZt85DQV/puUZbX9nRqlLpUvwYho0KF/cynfg/ebyX
 x0gA91ZW5qw5bIOeQjtjql8pPj3OioV5XT6mJvQdeA==
X-Google-Smtp-Source: ALg8bN5jg9DuYkGzKfxaFwA3r0nyQaicJfwsAibQCCn7SgjMt0z65arxW7h/FwrwaL48bLaCgZXaHFIDXGYk4MprAPg=
X-Received: by 2002:a1f:60c9:: with SMTP id u192mr3217208vkb.36.1547637281586; 
 Wed, 16 Jan 2019 03:14:41 -0800 (PST)
MIME-Version: 1.0
References: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
In-Reply-To: <CALtMJECrcEKgZKkP9=DcScr_fvPu+P1AkFf-qJn84Jeh2NXqQQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jan 2019 12:14:05 +0100
Message-ID: <CAPDyKFoLS3tWwDSrHmtqenknyX9r_JAA_UYAPk3Vq5P3PJ6JUQ@mail.gmail.com>
Subject: Re: regression caused by: "amlogic: mmc: meson-gx: add signal
 resampling"
To: Andreas Fenkart <afenkart@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_031445_799257_A7D29416 
X-CRM114-Status: UNSURE (   8.47  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-mmc <linux-mmc@vger.kernel.org>,
 krzysztof.michonski@digitalstrom.com, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

+ Jerome, Kevin

On Wed, 16 Jan 2019 at 11:13, Andreas Fenkart <afenkart@gmail.com> wrote:
>
> failed to initialize builtin emmc device:
> "mmc1: error -110 whilst initialising MMC card"
>
> amlogic/meson-gxl-s905x-p212.dtb
> linux-5.0-rc2 / 1c7fc5cbc
>
> I bisected the problem and after reverting the following patch, mmc is
> found again:
>
> commit 71645e65729f0c5aef8dccf961c97fa766835bd4 (tag: mmc_bad_resable)
> Author: Jerome Brunet <jbrunet@baylibre.com>
> Date:   Thu Dec 6 16:18:28 2018 +0100
>
>     mmc: meson-gx: add signal resampling
>
>     With some eMMC devices, there is still issues with the new phase
>     settings. Enabling signal resampling seems to solve the problem
>     for these.
>
>     Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>     Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> /Andi

Andi, thanks for reporting and bisecting!

I have looped in Jerome and Kevin to see if they can have a look.
Let's give them a few days before we consider the revert.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
