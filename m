Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C2CC74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gui72pxABqjpJmpbDEo440Nrr6GQCofTWrDEbgaWdmg=; b=XS2vKeKoTs56m1
	xe6j7WFLhPMVF+gENg6Xf+/dQooJnVRwGymxktnQ09N5082NLNW0eil5xFjrmjBAwJPBlnQhu1MTo
	vHeyYo8HeC0AnWuOtiH6JzYKjM0skDjMwFKjnlOIZcHwJwz6pHViHm0UUpoLLs8xt1XOuGFkysFrm
	GTCyqc50uGlBZg3t8wEbTuDLI3cu/m93fNB+I+qCv4q5OcJh2zy+ZN1K9KjOUz6vMMKr5S9Uy5bKd
	+kIRUPnuBPa0lZ60T4jlbn1zQ7ciz6y9/fw6I1k82B800mEzN8DgKDX1aqHu4HT2inT8fdaajbyrk
	3vXmZaePhywa6Wkg7Tlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peZbB-00C6eU-22;
	Tue, 21 Mar 2023 10:52:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peZb5-00C6ax-2Y
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 10:52:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id m2so13170713wrh.6
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 03:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679395923;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=K68XFluEkJ4EyRHJihXO8/AhJVwZseuuuSGDSObQY3Q=;
        b=fpY2Lc/LNVH4063nraiPu6JJwbMVe7kciEmg4YMy729ZFshtgzOmhChumgtEIdVQtN
         YHHfEN4Ftgu5pSNSZuF0qvoDPopC6ThvEmU3DSUpZd5UU4rXczI/alLwGe4mfT3KulQq
         br7dB0Gqixii/Nix6fcsD42k/bgP9SdBIRY4X2BXrqVvFKtzxXUbuX68ZXVEkpc4ace+
         mSSXKwX3or4PVABNmH0mc5BABVq/MR+4d0pgeq+NZU3NQYq+sbCeuc+7MdxrX14GBcqm
         6FTy/tg6an6FpCjJSB5XmtA+E4AUoYpKR6af4quxuslqXeikSEXo/XjBm//+JrcCX2ep
         Ty0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679395923;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K68XFluEkJ4EyRHJihXO8/AhJVwZseuuuSGDSObQY3Q=;
        b=ZPiue96uYgrPEdUpbfrgMnj8hfz+1JuRHIRbPOYaVl/svHMVM5RBWuwTiWrnrWMF7j
         FSMXtdS7qtLjU/Hvch8wq0Y/Y43DIz5v338Qt690nmZ0OnZppkV9k4r953cWH5k0IBo/
         L20vMprLINr/PzhyqfnCI6S08kAFjZh62LJCNfK3qjpMswtIRsqRC2Ya+Et0zYJdGquA
         CgDQE3YokXRS+nyKCVtym1rFOpeZGsXO1Aqhy4SmpPxDEG8BzvsVWmcwBy98HTGjYix5
         DwYBHwcPQrSYzxW64GjjouaJFlor3jJ8YYN4cRJPYzmm4yM78YXkdYjPrtSZ9vYkGyGO
         YiMw==
X-Gm-Message-State: AO0yUKU+pexAwLbdAB4FSzWLVC9jyiqtNt1VH7hXRZFVDR9hBjsyvEL0
	N/ueA3rp5FrPv3IENHoYJIo9/w==
X-Google-Smtp-Source: AK7set868qGoElUpfskvJ9bfPpYZPqFEK55esIAH/gTwGF/+V98A4OOLYzWOB74M6NG2BH6E97IH2A==
X-Received: by 2002:adf:ec8e:0:b0:2d9:10e7:57e8 with SMTP id z14-20020adfec8e000000b002d910e757e8mr1312758wrn.16.1679395923106;
        Tue, 21 Mar 2023 03:52:03 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id b18-20020adff912000000b002c567881dbcsm10944294wrr.48.2023.03.21.03.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 03:52:02 -0700 (PDT)
References: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-wireless@vger.kernel.org,
 MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Arend van Spriel
 <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman
 <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, Eric Dumazet
 <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>, Pieter-Paul
 Giesberts <pieter-paul.giesberts@broadcom.com>, Alexander Prutskov
 <alep@cypress.com>, Joseph chuang <jiac@cypress.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@gmail.com>, Angus Ainslie <angus@akkea.ca>, Heiner
 Kallweit <hkallweit1@gmail.com>, Pierre-Hugues Husson <phh@phh.me>
Subject: Re: [Performance regression] BCM4359/9 on S905X2
Date: Tue, 21 Mar 2023 11:46:57 +0100
In-reply-to: <b9bd16cb-f1fa-34b7-d599-8637cbe5032b@free.fr>
Message-ID: <1jh6ue74x9.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_035207_841451_D77D89A8 
X-CRM114-Status: GOOD (  14.33  )
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


On Tue 21 Mar 2023 at 11:40, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:

> Hello everyone,
>
> I've been benchmarking an Amlogic S905X2 board.
> It provides a BCM4359/9 WiFi chip connected through SDIO.
>
> There's a large performance gap between vendor kernel and mainline.
> (Downloading a 1GB file to /dev/null from a device inches away)

The title is misleading. You are comparing different sources. This is
not a regression. This is merely a difference.

If we are talking about mainline, then which board is it ? What is the
corresponding DT ? What is the MMC configuration in both case ? Have
you checked you are running with the same clock configuration to begin
with ?

>
> # curl -o /dev/null http://192.168.1.254:8095/fixed/1G
>   % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
>                                  Dload  Upload   Total   Spent    Left  Speed
> 100 1024M  100 1024M    0     0  27.5M      0  0:00:37  0:00:37 --:--:-- 28.6M
> vs
> 100 1024M  100 1024M    0     0  11.0M      0  0:01:32  0:01:32 --:--:-- 11.0M
>
> Line 1 = vendor kernel (4.9.180 amlogic android)

This cannot help indentify a downstream kernel, and the infinite number
of forks and patches associated with it.

> Line 2 = mainline kernel (6.2.0-rc8)
>
> Why is the vendor kernel 2.5 times faster?
>
> (I'm using the same firmware files, but it seems the vendor kernel reads
> an additional configuration file that the mainline vendor seems to ignore.)
>
> Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
