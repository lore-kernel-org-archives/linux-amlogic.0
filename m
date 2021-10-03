Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C425C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 19:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C909C611CB
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Oct 2021 19:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C909C611CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8ExN1mqRyvkOXy3wAMVD3gbNzTfSd4wbGbZjfmLeoQ=; b=tn0MLX8pLSGzrL
	1NcBgjqmz4wahtrX/3aE4cuIjw4H5jwo57ACQFy+UoFIr2jVLiHjegSS8U3rt5ir7DKq7wbcgS3Mz
	2qEg8nvhrb9RuwXyvE6xUW/viLltrlWz+bUx3wYu4+xNVvO0gBZTu7WdUdKXTDg7lld3TZrJbcTLA
	wheqP7TGq+fUeCX05/3zr8FjsIUf3ZQRqxRDEb+PFEiYRvyhRSihwOEtCLA3V/fDixsrftJOrhiOd
	XhaUAL6QxJlH8oaB9ND2xOBg2E1ctWqVkCQBZmBeRMvGyIyDkpGC+tp2YM22mYiLzK5FlLvYHI1j3
	yP0fzCQdkHEjS3euOfGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX72J-004Jay-Ms; Sun, 03 Oct 2021 19:20:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX72H-004JaS-DB; Sun, 03 Oct 2021 19:20:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id g7so55334339edv.1;
 Sun, 03 Oct 2021 12:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x9SABqpRKie2mPDrUwhlRSnKf4/2PfoIZhnOLacOHcY=;
 b=fwRxnKpJDl3IyqA2nmFJ4LIKEfm6yueuX1XC24nRfJOtOUATODtGDH9WiSVqh2io8p
 fdFbQ6GOYOA0SNxY9h4bPgCEjb1LhYIrZdENKjY/tnM2tdGMW80813vmjZWGj31ksuqq
 sf+O7m6mRAUVro1sgm7MAqTJTGjE0LsdEJiLhlXsho6SmOa9ER4oU/d3jWgVZ4ec97qv
 uXoj60Bz2MywPY/3oD1njE/M8aQd7YLVBy7hvFu7zM8sjXmepUl+nI1p66nJbPNnD/OM
 C8XBF8deanREh3mFS0ovJcvlAd0cTwJQBqG4H9Y1rgzeduOPXoI8NN3X3gn7at8HLs7J
 SiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9SABqpRKie2mPDrUwhlRSnKf4/2PfoIZhnOLacOHcY=;
 b=jN1H2lKcWaWM2r7acTq7PsDj6hXnbzYtN91UYhYSR76+H/Yb/eFY6DI8HfXxV+p2JP
 dAmHARrUZTQqiljQ8G0FS0PQCwmc/j4hCuSzzwUQbeMqN++BRibBprnqsRppgYmy3fVf
 0/41f3uqikU2y/64kljRpSc9wawhi1HjfMdg2/SE319ItOlQIh9pbZiZtK4lk5reUEOA
 1m8B0NdJkkSqUiSf8km2tbDaWoZXpcZaWqtBLgh7aaXCv3i32+pQ9ssV368/BQ3AztxE
 8DqJEkz9Y5k95dsflSXMDmxaoDlGf6KrnuUyalx3nR3W/b4C6UCophUY1qeitI2DkLil
 WAoQ==
X-Gm-Message-State: AOAM5311UU9x66ZPKRTLRlvMKaJujfzbhIJDSbpq++WQi0uWrcN7nTtH
 4MrBcqUwvjmsft4t/aEj44yiS7SI/BZLtBr3YDY=
X-Google-Smtp-Source: ABdhPJxeiNMz/Wy3CjeIvJ8eJbY/octZ0Wqvp1t5pIwM2Ozxo20fMHdxxjJHpe+wfTpxd6wfyG7hcgoXphs9t5xFvUw=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr12550005ejn.56.1633288831764; 
 Sun, 03 Oct 2021 12:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <1j35pivzho.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
In-Reply-To: <CAFBinCCCQebCEdLjYAfWkF4NDPdma8UzVMhHOhZPVreoV2qd2w@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 3 Oct 2021 21:20:21 +0200
Message-ID: <CAFBinCDzUvwt6XNEVBjhw5E0rEKWzrvjbPvVAgv77vyffE1yfw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control questions
 and issues
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, 
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_122033_471273_F27A62DB 
X-CRM114-Status: UNSURE (   7.16  )
X-CRM114-Notice: Please train this message.
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

On Sun, Oct 3, 2021 at 9:17 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> documentation on AIU_I2S_SYNC [0]:
I forgot to add the link to my last email, sorry about that - adding
it here to clarify where I got this info from.


[0] https://github.com/endlessm/u-boot-meson/blob/f1ee03e3f7547d03e1478cc1fc967a9e5a121d92/arch/arm/include/asm/arch-m8b/register.h#L2147:L2152

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
