Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE92BC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 11:01:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1BFF20880
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 11:01:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YB/wRjGG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z8iG/NmU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1BFF20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZbJZSje19hZK9fMExBjV3vMsyvHt7lXHpKNovBHF/o=; b=YB/wRjGGIg64N/
	E06rL2ncH8+/gX5bxNEoah8IscEoTajLVkh6w/OplfaYIAMeEmu7Crb+DYXt6m/B5+45rFTQeYn6X
	7PB70RRHqg/xd7PLh25lwrNawhgkK3mvX2dC6B3M39tO5VJGI6009L4bjDkuOcsmwXV94txv0OCfR
	aLf3sibNkd36niB6gkoi6otxtT812kDra2DqunVUi5l5wj2MbGoP3rX5aSbd3ewS6SZunuM5TYYLL
	eHbuHXA2a1esjEqWhgIgAfVGlvMi/+yzEC9KOduiZUQDZyPaYCer3pYpuLt1pCpKfDCiJwvzIkIZv
	V1dW8HYUeWhwoEM5ZmVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huakA-0000oA-9g; Mon, 05 Aug 2019 11:01:34 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huak7-0000n8-3n
 for linux-amlogic@lists.infradead.org; Mon, 05 Aug 2019 11:01:32 +0000
Received: by mail-lj1-x241.google.com with SMTP id x25so78998476ljh.2
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Aug 2019 04:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fm/51dNbtT1AoRASq2ygNjUysJb63GrKj4DIaeO9Ghs=;
 b=Z8iG/NmUwQ9i+AFPGL0ddsR7h9HdoT1Ttt4aAmnHZDClf+igwc+gtbzhT1Nba6laaz
 4v+lLXov3kcW44IiefLKXkqGZ0yuj65ZaoQH1xsIDTxVVx6PdeRPrb0G23ULaT1s3B73
 FnbYivp3DueW6KWrElW2wZyrCEZNoE17ZGX+l0Xgqb+T6uyuMxBLjAVT1EhECFyykqMP
 4hMexKxJyF51cRbhjwTJUHNkSOY7XU+9Rtg3U6C8Ue+jfe9xi+seEkWqvxpg82U568yD
 yrwwkO3XsZ2ZcWNNAOyRt3Qkjym0FpXuwC2i0NE4N6FMY10+Xzi71jIhC5Lugb6EYXpJ
 H/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fm/51dNbtT1AoRASq2ygNjUysJb63GrKj4DIaeO9Ghs=;
 b=t0p9S+SgJcP256qD5cLIhimFR8BP5t6i2DG9Kz/NIdEwGn/9y0kerGK5cJvpEW+NKr
 JfnaljkF+4FgLO2yBEDJEgd3S5PN+g04NTWAmQWstmCN3Hal9fOEDmVRTmKP50qD9dub
 hjBR1ttcESOx2ufZaLusgmu89VVvkDtjy9z5sdb8MK72RKu9OG9w4mLLjNmhmpPrm6CF
 MblQc8YZECrkxmrGYbSfG9xFSScMgWSJdu6GMZN1WxzRn6qn6bI2Yd0+QIixdorIlzCU
 KWhUS5FtB2nhIiqo10QFYZlibyoOHnjlasz/TuhXwh2lKJTLF4lMi/KOz1i2vOdNc4AH
 RQdQ==
X-Gm-Message-State: APjAAAXe5QZwhO8fwXqUfPhEKisQqtfuBOL97lUnZFtPA3zxkwoLd/ac
 3/R6QRePXGtd6qbVnk+wL87RfX5AS+HYoBEcgwD5qA==
X-Google-Smtp-Source: APXvYqztNgDE8wQq95uC5fqxtY6tG66NjiEC9RCu4ZI6X3zlaBRtnAgyXqI7tkIKROGOxKhKMeXnW2M6REnOxYZlfSY=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16524273ljs.54.1565002889640; 
 Mon, 05 Aug 2019 04:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190729125838.6498-1-narmstrong@baylibre.com>
In-Reply-To: <20190729125838.6498-1-narmstrong@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 13:01:18 +0200
Message-ID: <CACRpkdbssrCrs3n1tejA3iLnUvCbv95xt_ip1Y8gdCi1RkJgXg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson-g12a: add pwm_a on GPIOE_2 pinmux
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_040131_186478_2F827724 
X-CRM114-Status: UNSURE (   6.47  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 29, 2019 at 2:58 PM Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add the missing pinmux for the pwm_a function on the GPIOE_2 pin.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
