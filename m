Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43442C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 12:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K29CIz2qSpnMpFVro/SCYxk/ARkfAOqljd78OeKFCI4=; b=AIgG/GLLJKrTAu
	oQTFpwP5wNm8eFMvkQJUnAKD89rRlfM8ywrURYHutMW9Zzzvf/ZeIOTm+y5wJFP+Fto0mlYuXHBpn
	UlYGFp+NZiZCr0z7bu7a3Jf6MPt3RuTxfS7PueKymAg9yTFRy0WEC5h5i6LWQTM5kyEfoD/TrVoyd
	UGQ50SD2WMqvUMjGOQVOL+Zq72/9NQfD2y9F569eqkkykTrGupn1HELnZEsyWdKMMZ16fm0XzuSqK
	xbFLprCTvi5bXjV7j2jku9lYDy0WErp982PlbLPq6+JTq2kAwhfBLDVChcDkO4dJ1PvqofD6QXUNE
	dzIztF6+fAGodR0U3t2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDNg-00CXfi-BC; Sat, 22 Oct 2022 12:13:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omDNU-00CXcl-By
	for linux-amlogic@lists.infradead.org; Sat, 22 Oct 2022 12:13:27 +0000
Received: by mail-wm1-x32e.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso3702380wmb.5
        for <linux-amlogic@lists.infradead.org>; Sat, 22 Oct 2022 05:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=iBk0CGw7WcuryOh9lQut8CkGKBWj+XFGwLE39Z2bst0=;
        b=EGEGG1Yo/BHjquuWMlqmJkYHRFwkwO8NU7g+SNmbrFpSGZcbS/fDn01Ls+20OKwBfj
         xgJaSh7rMBwRa8Nl6597V2ZzOvmFZ27WbGzHfqcCxH1R0R715V0z8870YKzGcTXHZqbq
         Aj8RNo4+qWSrYtH2oqeoZE4KO+UPwcXvmq7VbYE/2GnRcXjyeU0W8/NTyvNF2RgcWWwb
         ppNxAHAfl9kK6iNMUSjASoe/zI5HGOuJGY3mJGXqhlK7r2YKADbKRep38CJCAlHj4wF6
         /SUwNFhdvi24Jv8EeZlk4cFLlB459Terd15hp6HL/Vb7hFDdP7fBFk61rbsMnErkeCuL
         pqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBk0CGw7WcuryOh9lQut8CkGKBWj+XFGwLE39Z2bst0=;
        b=dmW5E54OO5zQ6QX2alOnrmzBpFKKqVUqXRaXxHUfxY4qCDhQu0nWF245y+nvR/cUWs
         6Axvzk7GeQA6EBEASBoFW5dHDjiPRwkt028hj5tRPvHexvaZoT7li3pp0MvqzmDpuNHu
         /DxgfNMVLBGAbU1sTvjl2bX3G42XwxaDqFMuRi+T5cpyhL6kJTD3fzNteyc2wjZcF2kr
         vdicLiObochBmGYwGXDE/d7rc7niihEJB56s7Z/kcEcBc/xEp4OblKkXi07AdhpxVxm7
         /0Pf41mysNc6FGftYaVT7NsM9gavxodAXAjwNgzCksSbiY40A/IdAwDfPb3QRe+PjHif
         ldGA==
X-Gm-Message-State: ACrzQf1Ag/LkbuuvEZGdAw/AK9qOT7V6ckV8bJh9ozSzGOyV/CHk3+nu
	C6g4r6qDxbKk1wz9ApQgdeXlCg==
X-Google-Smtp-Source: AMsMyM5jUUpIrRjDMyE7JXZxwWaYImTrE7gVStguHxI1uWoBSCuHSBbRFrCVQsOTFmJCl/arVFhQLQ==
X-Received: by 2002:a1c:7407:0:b0:3c6:cc25:c02f with SMTP id p7-20020a1c7407000000b003c6cc25c02fmr16012584wmc.124.1666440801820;
        Sat, 22 Oct 2022 05:13:21 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id y6-20020adff146000000b00228d67db06esm4604673wro.21.2022.10.22.05.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Oct 2022 05:13:21 -0700 (PDT)
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
 <32b218b0-b2cc-9401-8303-c09575ed5209@gmail.com>
 <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date: Sat, 22 Oct 2022 14:10:31 +0200
In-reply-to: <CAFBinCB=tuF-RW77w-iVVbzq82vcORisy1QwCW_Tk5SoCMwa+Q@mail.gmail.com>
Message-ID: <1j8rl8awf2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_051324_646233_AB2AB477 
X-CRM114-Status: GOOD (  13.39  )
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


On Sat 22 Oct 2022 at 13:21, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Heiner,
>
> On Sat, Oct 22, 2022 at 1:17 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> [...]
>> Hi Jerome,
>> on Sep 6th you responded that the patch has been applied.
>> https://patchwork.kernel.org/project/linux-amlogic/patch/a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com/
>> However I still don't see it in linux-next. Is it pending in some other tree?
> Jerome has merged both your patches and they are part of the linux-clk
> pull request, see [0]
> But it seems like that hasn't been merged by the clock maintainers
> (Stephen) yet.
>
> Do you have that other mail in your inbox? If so, can you please ping
> Stephen in that thread?
>

Indeed, It missed the merged window. I'll send it again soon

>
> Best regards,
> Martin
>
>
> [0] https://lore.kernel.org/linux-amlogic/1jh71b3asq.fsf@starbuckisacylon.baylibre.com/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
