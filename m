Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478BFC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 00:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr1HEHP0Ouc6MzcG9NOqZ3HUZwJ+DMf3puddFNoXekg=; b=nleDNYlO4d2CPP
	tkjMSCBJYAQLfmK4ucEETgOjCuXrW0TlM2nZmuZ7AppDpcYrKykkkN/S6Ykmz/c1Eg5o3Xcd4bWKP
	3kWYhyRM4hKogAzRqrHrH7HqAXilRk629NsxX0xxBfJJvKKHq6F4aDVXhw/o85NVxGYDsbFvAkQ4b
	hREpSmUR5tnx2qXM8fb7dF2XBluTJUcv7P2M13nZR/7I8gESCwLD0FV3O079Qx7p5txoc5alYUZVk
	BL6Mf9TPx1HJ2d/vCroN9BgOuR9T5MNrES1I875CJWee/2Y2Ig1vOzTvDulnYnHwFuYm/EIJ5st4R
	tEbRCqr+U3cPExu+mMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLDhi-00Fz1z-Js; Sat, 19 Feb 2022 00:34:26 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLDhW-00FyyM-J8
 for linux-amlogic@lists.infradead.org; Sat, 19 Feb 2022 00:34:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id gi6so371213pjb.1
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Feb 2022 16:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=N2mb/fnXiK+55Vayu1WQaDGcQm6fHIlg0WJV5p4N/HY=;
 b=vhpvpYAs72r/uoSL/BUaAusH6XKA4rAULu6qjHWYo27jOy1C6kM9j5tc1Az/Esg0n+
 FIOoL1tgzkQ9bIQz2F3q90+Bps0EPIorHHEdHbZIVqHLPyPSB73rdhlXru65MTfByH59
 Newd+wujsKTxWviQyz6zZe1F9pjl4rRdCaGC92BJL9pgI6PbUqQjZx/sgR1F83Px1HYs
 UUdtOicItV1IdSw8I9tgzri27OuyH8j/3J+hd8TKLNaRGWCfo+74ClOd90Qrmng3KlOd
 b2PRktm+Sm6qOC1/T9BNb9qvzmS8jeA4BSScIvYwNokGxI37wp3LhcFPjWjivHq3pn4V
 Sudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=N2mb/fnXiK+55Vayu1WQaDGcQm6fHIlg0WJV5p4N/HY=;
 b=tU12o+Toen9+oDf16sfiw+Ypoz+WOTDYI5Bx3Ayg8e2K7DU2percQez3XwQ2Jydley
 9F/QL+TClzaZfBEZYjd0MF6eRrzFZ/XLQWW2kj18xgp1j0z6LGc6dF/0SC376nqoPvnL
 QGw/QqYH0O30wl1H/wwYHZapn0UOcjQvUnccLSvHUuwtrXkW2BzJNh3w0/l2iWMALAbC
 sCE0F3PEMMs/OwEcOvq7kaWY3KS3/9hpM8qNdeur3wsi64Z+PShUuxo5d47U7oYlRk9y
 FcYWqZqeo+TZPWIO0L4JwVX0rsGPJTTClKFAqIpuGQa57rgiFXJDl33hN4GMP1fyz0xG
 GiTw==
X-Gm-Message-State: AOAM5333n2v5LNW6omsiASeyS+QQka0LLv+GJr6yhGgLxDdtLCg/9dO0
 gCGDySbQ5gDjQVy3A0u1rkRYFQ==
X-Google-Smtp-Source: ABdhPJwVYQwlCngXM8fnMUumYkNGCOKPefj15RGXF11ZsFIDjKByrvfXXFy68PJeKQKdfkbdD+ttrA==
X-Received: by 2002:a17:902:d683:b0:14c:c0a9:34f3 with SMTP id
 v3-20020a170902d68300b0014cc0a934f3mr9482203ply.109.1645230853581; 
 Fri, 18 Feb 2022 16:34:13 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h16sm4149298pfh.40.2022.02.18.16.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 16:34:13 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rong Chen <rong.chen@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, 1131046452@qq.com,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: 45581586@qq.com, Rong Chen <rong.chen@amlogic.com>
Subject: Re: [PATCH v2] mmc: meson: Fix usage of meson_mmc_post_req()
In-Reply-To: <20220216124239.4007667-1-rong.chen@amlogic.com>
References: <20220216124239.4007667-1-rong.chen@amlogic.com>
Date: Fri, 18 Feb 2022 16:34:12 -0800
Message-ID: <7hiltbitiz.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_163414_652754_AF1AE854 
X-CRM114-Status: UNSURE (   5.13  )
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

Rong Chen <rong.chen@amlogic.com> writes:

> Currently meson_mmc_post_req() is called in meson_mmc_request() right
> after meson_mmc_start_cmd(). This could lead to DMA unmapping before the request
> is actually finished.
>
> To fix, don't call meson_mmc_post_req() until meson_mmc_request_done().
>
> Signed-off-by: Rong Chen <rong.chen@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
