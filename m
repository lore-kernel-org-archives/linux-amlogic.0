Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0C5C34047
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9295D24671
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 16:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGcMaUVj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqwyRN7X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9295D24671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tIcW7uKDgPTl0biwMXdIJ6gTvXHZikKNGvUEpQp1Ml8=; b=sGcMaUVj0998CF
	txw0VY196zxtwmWhxDg3RQVCwjou0JeEVCynvqCRBgSZqYlXesMmAB8Xrj1gxo2+3ElCIjGDFFzFC
	D2ApQifkkoX3prOVs6RNkp1AD2NOKAb0/Z3LNTt7k2mzlrC9LqbWWvbb3IpbQu7aozYPjA7YERC1g
	irvVOKTNKbPvuUQtCuc9tjsTlEaXQ4z5pirfUeeE2LyN2fOYHZyvt/OhpdT1nkiITHPtl5vgbmBTB
	gKFfWOfRdlo9sosKwzGuGOQChjxq0M+E6znQpkcGtjBtwB1LruHfoVQ9ys3wHCPcto/0YZCSuy0PS
	McOYSlpsLtcFCi7xWWMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4S8h-0001Qy-Km; Wed, 19 Feb 2020 16:23:55 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4S8e-0001QZ-JA
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 16:23:53 +0000
Received: by mail-lj1-x241.google.com with SMTP id r19so1017389ljg.3
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+koYLn7ZJhaqj25+W9188jeUQ5uNdHzeqMm7FamtmY=;
 b=tqwyRN7XCiE959aKxjtEOi7/UiVPLzQgbupb84ZCRLoTrnACUhp19awz+tzxddbR1X
 9Yly0tVxiHyjnEOptVx9h+2uf8YOzE5dvLYJkwDqI+81p+8XHhPg9iGCPm0HJtE2JlIN
 T1qaWa2iiTxPvshRd+3CGCmfMnZq80U/hWBatQRYUYlUClXPIgDK7pRWOri0lpuyWzu3
 NBibHPKrpoVeYevXQaFye8xcnO1QgQuIk+je/kzXoFM4qtTR3f7899B7sEiilbXCfUA3
 KPTriTwoL/s9tqAiZvdW9zYCz5Kmt8FriQ8IIGF8dXC08E0ZDt4nlf8pJZJPKLZc9jTr
 0rZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+koYLn7ZJhaqj25+W9188jeUQ5uNdHzeqMm7FamtmY=;
 b=j7EgvgEOoI4RZICaE3LZybFH0/JwL7U92T4481ZuHd1ZLWRQNoeqV0Gm1T2ITpnpaA
 Uf6WZGd/OrCpBX1LbGm0ZC1CLEri1wRSeqMqC0bO5JGpRj34pooH8hA69qTxCoDVL/w9
 d+twVBjS+m5fkreo8RPHuhYpetpQG/2SjpgtCxQYaQqrgLTamlOvJs/F1ojbahtu1sdP
 TKFMm2YDfDZRZ76gOCgRnq7U18nnmWem058+XHIjBsA2bUg3KWPWrgW6sk4quSyw/Jse
 Fg9RfkUdSI1dwKVh1FSnrCyShbvcP+VJCdVrMobSg2ktWZ34x97HtuLs6r8RiqXJE1ST
 zvMQ==
X-Gm-Message-State: APjAAAU158D+RiMIAjnGF422xlETze1UwzDvIu9hl1/yPzIT4py1pu7w
 dnXgfl/Xo27vv+vfEmPsaVFr8ycOjvPZTYqbZjxNmA==
X-Google-Smtp-Source: APXvYqxJ7AMu2+7ZjAhkwR9hwSCjvmhllaXVwoznlwbfYWEU+J3T+FCENxb+Oo9gQMBsOOU7sXyzFQ8kRLk7wptkHE4=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr16811174ljg.223.1582129430832; 
 Wed, 19 Feb 2020 08:23:50 -0800 (PST)
MIME-Version: 1.0
References: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
In-Reply-To: <CAJZgTGF2ihuu_bSzQ93iBTf1YQ4_NM29S4iBFM8Fhd_RUaw2vQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2020 17:23:39 +0100
Message-ID: <CACRpkdYXw0D9BJSBd6tvnKM3tkMir6ptcpg0nZxpbWQdAHYooA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-gxl: fix GPIOX sdio pins
To: Nicolas Belin <nbelin@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_082352_665504_30532FF0 
X-CRM114-Status: UNSURE (   7.53  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

thanks for your patch!

I can't apply it for some reason, something is weird with it...

On Wed, Feb 5, 2020 at 12:22 PM Nicolas Belin <nbelin@baylibre.com> wrote:

> @@ -147,8 +147,8 @@ static const unsigned int sdio_d0_pins[]    = { GPIOX_0 };
>  static const unsigned int sdio_d1_pins[]       = { GPIOX_1 };
>  static const unsigned int sdio_d2_pins[]       = { GPIOX_2 };
>  static const unsigned int sdio_d3_pins[]       = { GPIOX_3 };
> -static const unsigned int sdio_cmd_pins[]      = { GPIOX_4 };
> -static const unsigned int sdio_clk_pins[]      = { GPIOX_5 };
> +static const unsigned int sdio_clk_pins[]      = { GPIOX_4 };
> +static const unsigned int sdio_cmd_pins[]      = { GPIOX_5 };
>  static const unsigned int sdio_irq_pins[]      = { GPIOX_7 };
>
>  static const unsigned int nand_ce0_pins[]      = { BOOT_8 };
> --

For example the patch just ends here with -- two dashes.

Please collect Jerome's ACK and resend using git-send-email if possible.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
