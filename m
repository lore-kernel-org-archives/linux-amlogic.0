Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C125C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNaCfjQf1LFIQnyDw6O23he0RLVeCUtAwiIXiJBKwhk=; b=NopqtUigoHN1JU
	wlmjFx6XUfCy9GW3H1/gMpBWGmb2HsRTOsXJcuE0dYubhmR3xt9SYj0iEJjOdwDQEwEJTHw+K1YMp
	HhiZgRxgEG5kFj98HjlN0yWnqrf3uQBvQZwdoiItT/a9NSLDUdne5ig2Ky86ILRsqXbKe/XkqJ32w
	oqrgTEWUiFXmm8TLng2yVdmcL8g/9NSvTxirb19ntXcapSyY0yPjA2o8djqxk1D5ReBlOgE1CDkUj
	00xS9JKXaRC+ACDbMfgdKqsRrfoPyIX3b55J80fB7Hd0/MrBReNzg3u6KAB4n1Y93xBEX+4wYcr+w
	T6EOqrKZ2qg7EiXkENag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR8xJ-00GW4b-Ne; Mon, 07 Mar 2022 08:43:01 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR8xG-00GW2N-1J; Mon, 07 Mar 2022 08:42:59 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 o106-20020a9d2273000000b005b21f46878cso3412251ota.3; 
 Mon, 07 Mar 2022 00:42:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lwoi80hKOWtc+skxMuKJlRziZR969/R4qDCbEpgM3eI=;
 b=SImH4XybinJpqadNOLVt5sqgPDwmhxfx3yS++LZnRQBJWf01hpex+HL+qDSC/xLJS5
 64G6xAGL6D2243e/jdqxgjoIWe1APsar1FQsSwSC20V0MTIB1BddLmgdyaEDi6XJiige
 UHGnALDtSa1jmCeGiVqwOUIiWQiCzu4xjjHuNDHp9WbpuoCXfb0mB28WVSDuYt2MydGE
 /Aw40cN2nOan4N+ETj+oji5qNwekkanvgNzsY7VktLgktl5Gil3SDu1KBQ+5YOGutRMK
 C3AE0rBRx1lIesJZCv1ZHh/4K80ZV9v0LyxdZZLDRYktnri07882i+HTLdpyMWD4Z5GM
 QuCA==
X-Gm-Message-State: AOAM533G3tl+A4Qc+6bXpTX4yyAyryVcWPyw5igfXxs1CBaHeyujtiw7
 CKN3l1/BfXwyLJ/zLccQZsrdaxXfTKEHQg==
X-Google-Smtp-Source: ABdhPJyEIJHZkJT4KSgNVbib9KAe+dYT4joFx42B+PogsFOp8fKbs4FIAcqbP3rMwAXfe17E1TzaAw==
X-Received: by 2002:a9d:5183:0:b0:5b2:20e0:63f9 with SMTP id
 y3-20020a9d5183000000b005b220e063f9mr4297757otg.64.1646642575809; 
 Mon, 07 Mar 2022 00:42:55 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com.
 [209.85.210.54]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05687072c200b000d9ae3e1fabsm5261463oak.12.2022.03.07.00.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:42:55 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so2339410otq.11; 
 Mon, 07 Mar 2022 00:42:55 -0800 (PST)
X-Received: by 2002:a25:dc4:0:b0:629:2337:f9ea with SMTP id
 187-20020a250dc4000000b006292337f9eamr5533660ybn.6.1646642118604; Mon, 07 Mar
 2022 00:35:18 -0800 (PST)
MIME-Version: 1.0
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
 <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
In-Reply-To: <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Mar 2022 09:35:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWS+ExaTFeNQFJdNQ7+5y8wwNh3dnDE1bTtnuNw8-81iw@mail.gmail.com>
Message-ID: <CAMuHMdWS+ExaTFeNQFJdNQ7+5y8wwNh3dnDE1bTtnuNw8-81iw@mail.gmail.com>
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_004258_128702_A19D5CB8 
X-CRM114-Status: GOOD (  19.69  )
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

Hi Neil,

On Mon, Mar 7, 2022 at 9:30 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> On 03/03/2022 13:44, Geert Uytterhoeven wrote:
> > It does not make sense to have a comma after a sentinel, as any new
> > elements must be added before the sentinel.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thank you!

> Tell me if you want me to apply it to drm-misc-next.

Do I have other options? ;-)
Thanks in advance!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
