Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A450BC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Mar 2022 20:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k92zxYLegXwNuh7zYb6mOYvVNMsDAb8Tp7GPQ0Q4lqw=; b=xWF6S8SKY32ZuB
	wZatFRRoUBXxutHDBCEyaqo4I9nIm2IyDDDO0T6bBV7N4hwILPfhQc2YS5BzvZNiTrLASprA2ohAZ
	YLnr6EUchuIu0k0iWh0GVXb4zzr62KnBbS+zwUQ0OuP/XNPVXSt+sI8iG0iiQZW9hbz7EDig60+tY
	Ypy2hGPne+i+7nonR/Mlg4W8mw4bx/tj4YerNPgiHpdAUr5b4d1C6sY6ZAZ/z/ioce22sLVMX0Yfz
	qP5JrGvvOV05FrK9sXDEnuzT+55S2XVhpKv5uf+AVSWm94DuuzmKTis1ms+8YqJIQoo1rl/KepG2a
	jlpHdY0WCHTDxmWDgM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQxXS-00FIQm-NB; Sun, 06 Mar 2022 20:31:34 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQxXQ-00FIQE-5o; Sun, 06 Mar 2022 20:31:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id gb39so27863226ejc.1;
 Sun, 06 Mar 2022 12:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K4n21OYXdDZM4hk/UjVZvxqo76lcN1HhOZ4vArZv8OU=;
 b=WKfevEQAwsxI+yju5ynzzh6Tx2zdUBz9O/xOYN8MkQkoFhsfBcGRIIqxWqNNhJv9G9
 cGj9+7GBoGSyhhebJh2v7ZgRmX9Y/0YouNMSe9pzeYPYkwmbWR5SN8jg6yed730dyeuL
 E0KZ7sQOluB9Tc2GoJQZZlOfdFNT2RWadGnQZ57/g3VotDS2NUWY5yQH8rdO4C23djHP
 sbqkyIMfGlS6fBhuNFN3q2n/saPK3O0tIhTwBfuihtVasHdNOuhE6LaPL5Daycqfikbs
 k1d0yq2xWK35u/5jDuHjaaLgHMF8F4598TwUs5gRX1P0nYoj2VDtYq90a5lSdV3/LftJ
 T8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4n21OYXdDZM4hk/UjVZvxqo76lcN1HhOZ4vArZv8OU=;
 b=JoW+z3TuUFUacQEGYuXumHZ8hx0CWQsR0pu2qzTNURIImHBfCimMmnpZBY6FKusisk
 M7N4816VVvzf84wIgvDd4njZJk1z3bfYAPLmjHwnkv5gaDykG0Q4OBMDyTl3CjEhnhYg
 ERGxUtHsBOXY4LgjgFnQK6/vz/1kIth40IuA4K/dxya+MctyZYXYC+w59Wikvy6lPdny
 ByRSzyAAMYyHzymB+uq5a8febiFN2ObJmWGIt4Q64XHhV/odC0izSRNvFKXcOWdDlm1R
 Ptucnv9PAsqU7mBTn83W9dJM5jKsBA8S3qUUaN6GiNtXwC7dgS12DLGEecpeB1rnzmqJ
 h+3g==
X-Gm-Message-State: AOAM531rwriwi+NhQJNt8Q+qCYMtM5ziJj0dDKYQ1Iqdof57jzPKdmPR
 u85oWOijX6QSHmpyExOv3aq30hTAHz7vYpuP4Ok=
X-Google-Smtp-Source: ABdhPJwq+ENNOmm023HEMN0NHnRWKo1CSAdsqHqpMxrXDwLXKbqpfQ6vkWwsTliG+xADpIloRlSQ/LKUP/4vyZlwxb8=
X-Received: by 2002:a17:907:d13:b0:6db:de8:615e with SMTP id
 gn19-20020a1709070d1300b006db0de8615emr3928656ejc.649.1646598689737; Sun, 06
 Mar 2022 12:31:29 -0800 (PST)
MIME-Version: 1.0
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 6 Mar 2022 21:31:18 +0100
Message-ID: <CAFBinCBVB8eK-4k3Kgz5bNr++k=7pjHFg+hsqO8WGTLzUzhePw@mail.gmail.com>
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_123132_244149_344F9ADE 
X-CRM114-Status: UNSURE (   8.45  )
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

On Thu, Mar 3, 2022 at 1:45 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
agreed, thanks for taking care of this!

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/gpu/drm/bridge/nwl-dsi.c  | 2 +-
>  drivers/gpu/drm/meson/meson_drv.c | 2 +-
for drivers/gpu/drm/meson/meson_drv.c:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
