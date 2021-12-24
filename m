Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18751C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Dec 2021 17:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1eSOPDUo5nEGG+woa6kX2PjIEir7qQw6sLgVQ9oQnaw=; b=LD2JnfghNhypaO
	IZRAXd8T33VSQ4zYd7HuYTwv/HLCy+bCdvQRKZBbiVwuFYhBR50vq0xNI6W7jGNB9kM6XhxntFp7h
	uTAHnZcviR3gZwkOsdEd41j+OuZh2NgO584CrMqyGlSEPj5wFW2mgdoJYz1+9GrsahgPb3g6sqlrK
	Wul6UH7S0yRr/tmxZELxCt6jNq9DTmMrwhw2GGLI1Q0b8aWoPIkz3MaWRP5Pp4CrR2xCyrXku5pBB
	1/pq7+cldfGRqM4Fd5oqNiml1RIZVN2OeYsqirgQ+sw9LmTQvlyaU6Vr54xxLNwjpMy+VmO9d0MLA
	XGI9rAv16AuwU0JXNqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0oTP-00ENIy-HQ; Fri, 24 Dec 2021 17:35:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0oTL-00ENII-0K; Fri, 24 Dec 2021 17:35:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id o6so35634191edc.4;
 Fri, 24 Dec 2021 09:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iaq7bS4lyD8/TjhAqNZqzIVhFIl3Gv4mH1y72nw1x3I=;
 b=JQTi6YLMKX+geLs8Yj7l/Btzr5ea1KEGgxQamLGjmbtZ7GI3qX43p3Mw+KeJ6IHl/B
 OLsDAk2hQBKKpgKMcKjMNrSpcQ+v4mPqejI1erBocH24gzxpBEUKSFEsKnFVt3tJ+6lc
 XYRtR2RjUpt78bWnJ8u1/b3x9pz6V8gv1H4+ZNdRgJbpUt6P4ljYdqHKfBmwPfENEkIs
 SZkbJ+MDkR05QEicVRv4WZSxWiOZG/iDjVtJAUL2o2oGTiMl73dxN5NJfxxA1xPPmCNd
 wJcfkAbZvxJkzgGnLnSBrRIMqhAGojS3q7VKvLnuAyt3jzR/oy+eGD6r9+v1OPcOvBzt
 wXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iaq7bS4lyD8/TjhAqNZqzIVhFIl3Gv4mH1y72nw1x3I=;
 b=RosbB9NRcg2LS0IGy27hIF9a0CNXKH2aHAh/0Ev2Em5NJAyeJYr86XF6SZCM7Ltt4v
 +aT1l5eDsQJroRZUgBoyjiTSst+CHpgnADAb0L+nC7Pt//SCeAE2nJlAhdYIMHFW24nH
 /Nk6EEbexRB/L63XJCNbdW1ST7Z87/khrGbP9U9NvHlR+J8do0dm/c9Zf5eGyTPT9Vmw
 FSw8dJoLXwyZ+HWI4A9R3QqHg9w6UYRrJNteRDECtJTPi+EWGUyljRFSIfzO9lEP9W8w
 ij9M56hMDhdseputjR1ckv+PEf/by+xG12M4CXLU4IlKwDS+Fsr80YMgeGTY/In883RY
 xoIw==
X-Gm-Message-State: AOAM533QEwEqpI3Kmvr9NIXTjzYVlPhpj6JFfnksCTG25cGrJDMBAi4c
 vC3MlTEhCBMkTIcT4bB/iNtp0wTjgsWSUoPIFaNdD4S4/EY=
X-Google-Smtp-Source: ABdhPJwyjpBJ9V/xFtZgW5lzfQ4CL3AMPgTiItklF3vtwX+dZAJbyFio0CVF4KNOt/QO5apULfKNDWbTBduG7M5Pk8c=
X-Received: by 2002:aa7:d55a:: with SMTP id u26mr6561187edr.265.1640367313494; 
 Fri, 24 Dec 2021 09:35:13 -0800 (PST)
MIME-Version: 1.0
References: <20211223171202.8224-1-s.shtylyov@omp.ru>
 <20211223171202.8224-3-s.shtylyov@omp.ru>
In-Reply-To: <20211223171202.8224-3-s.shtylyov@omp.ru>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 Dec 2021 18:35:02 +0100
Message-ID: <CAFBinCAd4QTZ78S7QrT0Zsduvk=09rJa3gHHb15HLpwspQzuTw@mail.gmail.com>
Subject: Re: [PATCH RFC 02/13] mmc: meson-gx: fix deferred probing
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_093515_091568_5B758AA4 
X-CRM114-Status: UNSURE (   9.70  )
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

Hi Sergey,

thank you for spotting and fixing this!

On Thu, Dec 23, 2021 at 6:12 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> The driver overrides the error codes and IRQ0 returned by platform_get_irq()
> to -EINVAL, so if it returns -EPROBE_DEFER, the driver will fail the probe
> permanently instead of the deferred probing. Switch to propagating the error
> codes upstream. IRQ0 is no longer returned by platform_get_irq(), so we now
> can safely ignore it...
>
> Fixes: cbcaac6d7dd2 ("mmc: meson-gx-mmc: Fix platform_get_irq's error checking
> ")
I suggest putting the ") on the previous line. Most "Fixes" tag I have
seen don't use any line-break at all, even if the line gets long.

> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
with above comment addressed you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
