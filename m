Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F69BC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 19:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhB/a5opCmmwFmUsvn8cprV5RyKnJha5wlDEQ69rec8=; b=gQ1J04EXN7wQer
	tsPeWxcxm8IViBd2xBnwguFogokwqmKgrlzk7CLcv+zZOVB/DZed2PvGdpvV5VIrzdovDGLxbnuoc
	9xVLTsCDtMSZ0kc0gyyHNgT8wZJd/6qsPPwa+eIJj7kWn2LkRriFHbqD5fDzblWv9p0i6AdMVYA+n
	zmH6b4gkejp7kV6H6C8QklJdYwqOgY9moYknIeOnfe9mpyFWhZNN2UOGmCmzK93YEPvePxeF+a9SH
	geFmMd23E8V7vddPhjn09AlTk+IgYMkdwCPfdpwLiryp8bz6QZuH1S7qrUsZwC0CybPgyYaGCxOFM
	A/cV4fELVFDl++ekmY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwr6S-00BAYq-0K; Mon, 13 Dec 2021 19:35:16 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwr6P-00BAYH-VI; Mon, 13 Dec 2021 19:35:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id l25so56064276eda.11;
 Mon, 13 Dec 2021 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tBM5ZfbWX6V2p7x+5DVPlv3iogKlsKZY1L82SLcnXw=;
 b=Za6FthlkkdEObAUwtqMAZxoYcQiqyzQeYtIE4OAxZfHtltGb7zjqDsBg19/Y2cycLk
 fHEij+XJ5g5y8vlEvu3y7YTHpCM2kkJG2tJ2PbuMlOwa3DyMxrTDASWJ0mNhBBZxaK0x
 G2dc2BcFG/AQ1XeNCc17NjrdFkWANCXraE+HSaalOwGOGGyMHdMOP0noV6RH9r0yggnZ
 FE+Tl86Z/Q8r3F5P6z1muR58OhLH1433NePUHx0KCZWPKfZqNRSDOwxQRI0IdIVAI6+T
 n5ZEQtfGwCS3n4NdtTQIxDtjUCMaOqbeTdghyIVcUIY3MAGpW/JBP/2YmjoeFv9Hz/jD
 gJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tBM5ZfbWX6V2p7x+5DVPlv3iogKlsKZY1L82SLcnXw=;
 b=Lfv7pw/BOXnbG8UTFazqze18EsT8ynHyr3rgkOQfBTGOKkWnDBIE07PwsukhNplM13
 dppVaVMROtkGb/Cdyr/52WyNHA8p/Z60ZlGK9GC29hafSeSc9sEB6kuZImAFNxFYo311
 qJRd3sEk6ghY21x1jCXpJaPGM8Zt437a3rpsh6DlXpQ8bSUElKlwKJbvE+BiISf1rzwp
 Z3RoQLcF6kt5LhKHEtTLcDsOL8fHQXcxd8GbHGLzq/tIKDHcHKrsg5o44L/wvVD7SLoi
 YDsWk3jLwXNQPTisowsPUhJK+2U/JQ/SXRL6XmEhRnomp41ohn29+dvxCS1LGVG6UFid
 i6FA==
X-Gm-Message-State: AOAM532ezOy1JxIjlvFRJ9RmwDp5isGrfqGBVFJi+5Skyjd1m1aulEsI
 H59dtn3FhunZLx/4v/FothUWQeaUOT6vrpAy/zg=
X-Google-Smtp-Source: ABdhPJwGo3z+4BlJtsq6F82LAfVkHACdaYe4m0WuKNyX9Lqlls4GXYnwqfX1u3GZOKT3+Znm92b3salpgD45tO1PgNs=
X-Received: by 2002:a17:906:395:: with SMTP id b21mr378913eja.13.1639424112369; 
 Mon, 13 Dec 2021 11:35:12 -0800 (PST)
MIME-Version: 1.0
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
 <CAPDyKFoqGFJQ=i301+xXvP1he-tzL8pzZO3q6P+tERYFUNZskA@mail.gmail.com>
In-Reply-To: <CAPDyKFoqGFJQ=i301+xXvP1he-tzL8pzZO3q6P+tERYFUNZskA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Dec 2021 20:35:01 +0100
Message-ID: <CAFBinCBHVSpabbWr_=SLe_onVZ-pUwagq4HfV3pOBeQvJjzG-Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] mmc: meson-mx-sdhc: two fixes
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_113514_052214_D0854FBF 
X-CRM114-Status: UNSURE (   8.53  )
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

Hi Ulf,

On Mon, Dec 13, 2021 at 2:01 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
[...]
> I noticed that you didn't cc the Maintainers from Baylibre, perhaps
> the amlogic list is good enough?
The Amlogic mailing list is typically good enough - they're all
subscribed there.
Also Kevin, Neil and Jerome are typically taking care of the
meson-gx-mmc driver which is used on newer (64-bit) SoCs.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
