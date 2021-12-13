Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446ADC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oCgdExatFzznSYVtXFt83QN7XEgkjNIwTkGpcJIlOsU=; b=4XTrKO6h8DT9IP
	1Pdwl6yPHwgyynSfGw/ZmsyiVK8pVUSBANBLsvPg2VciGOAl6BKehuwHdABmDYyboUSfwfss9/M89
	s1C/nZWzPnzkLvVxumXw2Drd2BRmiMjh86eKgwRBRQL/c4iCuKHRId8d4zrDhQU49AdGmLz3BDhu2
	0Vm5PdNZQeKij4QRpQYu9eNWxjz+ot7wrDS/fvLI1t3d9CgYdVFaBXFEmOhPac6SnvFuoqFjwpoYV
	OwMDuC8r7H3gg+X2D0l84OOoUZuelqOW41HciS+eTxTFW524eWweWMgT4zZK+sQLQBTyxhy1Qu1k5
	ZzH0kTECLXU+5HvXWyRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwkxm-009b5l-6n; Mon, 13 Dec 2021 13:01:54 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwkxi-009b3h-Mz
 for linux-amlogic@lists.infradead.org; Mon, 13 Dec 2021 13:01:52 +0000
Received: by mail-lj1-x234.google.com with SMTP id bn20so23575878ljb.8
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Dec 2021 05:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mmZqoM0VKk19CgkjkqT2/mS1Wzq4NBD9qkKtBMLqLss=;
 b=CXhNuATQd8iDGZZytbWfLcg2yXtENnNCTKsNdZ1fZIz+RkCQDT2d8Yg5go8/P1d/c4
 wCDwchO9A63guwAOxxpmkrCXlkj8l94hZURQbhdTiA8ubNeK8kFVH+E5wZscpY7ZOO+3
 Op8xfaKGNiwSis5xYtXFSX7NW22UB+nyUknCHmGgniM4zQ4EZmoNaZA07WU9or+gVpg+
 1CYTnGCgEeZatVJ4KiscXfHqfpl/3vlyru7JgkzhHOb3nMwrumn337EVox8W0BdZ1v/G
 P7B7jwwpGbXjuqd/XoGfWZeHIMevRS4txQr6jxI+f+44dlx8w/Y33+6v97q64LsSO6WO
 UfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mmZqoM0VKk19CgkjkqT2/mS1Wzq4NBD9qkKtBMLqLss=;
 b=pbsuuup4w9SQ7sUR8OLGtgOgBv+cw6FmCyXJyxXw/omYEhlLZfD51N+Rt36pmggA6E
 jOx9Ys1OsJrSegtRMeHr/+N2p5jWjLmWcsIBhWP2Ek3UxRLLZvx2fJYUZEPZv8bdsKeS
 REi7docbifyUFGnF6fmVv/OAKmvuMnGZ9OhkcWLkof+3Sm9JtH4yT/UkjU1Kh5a5JuSY
 iWVMltINkqnNBsAz8pEIWTVdpYNXx2Qhm593r7qPOqe1jatLHu3Ht4eKf0VSedPc8Zb7
 +gtjhCMSuxwRc18iyY/3EiLbRpDxTKnbo9KhmRDL6owpQkBK47aUGyV8vqerxb9PO5eW
 vKyQ==
X-Gm-Message-State: AOAM531m0giu5n9W+7B98fPO3wukBqcIvQLFwNLVQeNHjmHuIyTt5wmE
 tdKy16I3VALWp1UrV6i+KOjLuhtydigf9vIxar+SFA==
X-Google-Smtp-Source: ABdhPJwDPCbxiPnhThYyhmTadFojAvuJfukt/vgX9gGHkV9OErrpCAyUIo/lXKbMSSPm5smSXRJojyNJL0Ju04uDV1I=
X-Received: by 2002:a2e:7114:: with SMTP id m20mr29570182ljc.229.1639400506261; 
 Mon, 13 Dec 2021 05:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20211212145956.1423755-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Dec 2021 14:01:09 +0100
Message-ID: <CAPDyKFoqGFJQ=i301+xXvP1he-tzL8pzZO3q6P+tERYFUNZskA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] mmc: meson-mx-sdhc: two fixes
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_050150_797012_9CF6C51C 
X-CRM114-Status: GOOD (  13.01  )
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

On Sun, 12 Dec 2021 at 16:00, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The first patch in this series fixes Broadcom SDIO wifi cards (using
> the brcmfmac driver) on Meson8 SoCs. Meson8b with Realtek (RTL8723BS)
> SDIO wifi is unaffected by this (it worked fine before). Testing was
> done (on the S82 board) in private by a user who wants to remain
> anonymous.
>
> The second patch in this series is a minor cleanup which I found when
> working on the first patch.
>
>
> Martin Blumenstingl (2):
>   mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block SDIO commands
>   mmc: meson-mx-sdhc: Drop unused MESON_SDHC_NUM_BUILTIN_CLKS macro
>
>  drivers/mmc/host/meson-mx-sdhc-clkc.c | 2 --
>  drivers/mmc/host/meson-mx-sdhc-mmc.c  | 9 +++++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>

Hi Martin,

I noticed that you didn't cc the Maintainers from Baylibre, perhaps
the amlogic list is good enough?

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
