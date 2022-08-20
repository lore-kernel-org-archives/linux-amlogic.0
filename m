Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A698C25B08
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Aug 2022 17:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMSsleGMzomWpG2DIGjRJjUyvP6meM2qmj2CEYAe2UM=; b=Z81PDRZDD0+h50
	eRF9DDLJX17UNA2dI/PSc5RJF570rkEuntezOu+i8SB+sYWjkRii+yudvbKXBR8oFeAkNBw+K2YGq
	cd2eF5WeM6hsT4gncYdZOhkHZeLILaZLpXrrJFnLhG1NuEh6g/la92+nYHlrIDQ7dQdKoYaAIKB+u
	oVEhy0P4t+MnKIAdYwIYMjGBiN3ub1PxxedSmjmEUAmdrYEhuN7hIlMwPh3i9xxEdrVPj7mAOQOkO
	jXs0xzFgeGE9UUk/YokkuxbbZCIYrogrdyrPNYHaCmmuz55Qqv8MID95KoJTEAGykf3AG7eqiFIU2
	BjTPlWuHBSPZxlB04djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSEi-00BFmZ-OQ; Sat, 20 Aug 2022 17:26:16 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSEW-00BFgX-6d; Sat, 20 Aug 2022 17:26:05 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3378303138bso155138887b3.9;
        Sat, 20 Aug 2022 10:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Vcm63p9Ndo8w0eqrJk86Vp4em1l9XiIXzzzPibiG9xc=;
        b=mpO5iswODoCzpwRmKE8RAg0r6YuSpgtO6RrGKttfrcnl2yfGAn+WnO5htJDrAie0fy
         giQNwDD2rJTPB8wsYBQ8+zSgJ+UIb0wTAGa5GKeUb2wVeH9ugeCbDvfstVUpTDEgq09l
         rjz03HGgjSIXYx1mXweYRTE5m4pD3YOdAohWIjU/9aMBXAUf5CdtoMgvgNnQHIogxVKp
         l+FcpM8nsYHV7xKpf8m8mLhtf5nY7ly5ACKqMNkMEugeCaSFfAv1duxFAIBwgj9Q2/21
         ormwuwjg84FSCn4CJ2jvKht94BfxOBUKvbSNIRv8XKLh7DGo5yeS6sjf/bBHjFbEJDI6
         mCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Vcm63p9Ndo8w0eqrJk86Vp4em1l9XiIXzzzPibiG9xc=;
        b=fJXdkmDdT7XIXXtlxbtLZFIUtdSDr55f+ckrGD1IteG0EJX+sQv8NFmO/6isJikIcV
         Ono3rpmzUAtdLkupsE4EqalrwuwfTnDjHA33EDw8qSXTMOkgR8gEd13f2kOoTpLeD8dR
         rockDe3QxkICU+52G7gQyIF4gjLDKyDGfGzwOIXE9POYUn3z4i0FcGl7Kb1S9QLHnGhq
         bhK0yRch8LZ0yiO9i9Ok7ggJA73kOQT8snNc/Blzz7EO8xWCcd5uDtgv4H3YYk3Akvwg
         n2OgbpCS/OruQqrpRp7MRGwZZ6jDd1R27ozVIlCzErShsDO/RYR1o2XtB0ymdu6Nr96x
         hw5g==
X-Gm-Message-State: ACgBeo35vit2YWJd9b3x3qLEOriAQ6hXd87Me4FmeidTlp3NcUpL/24Z
	ijFTMJm904/DcwDpvJY2EfD+bnJLel+4AV1BUuM=
X-Google-Smtp-Source: AA6agR5TRgD/FnBNXaCrUTNJvvi3JQMLm90svy6f13lPPU4q6eUuunzGxFVgcIGvJ4uKIRiM8uS46Cmd3Px6UfZAn1o=
X-Received: by 2002:a81:83c5:0:b0:334:a89b:1e5d with SMTP id
 t188-20020a8183c5000000b00334a89b1e5dmr12036745ywf.178.1661016362743; Sat, 20
 Aug 2022 10:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220819060801.10443-1-jinpu.wang@ionos.com> <20220819060801.10443-18-jinpu.wang@ionos.com>
In-Reply-To: <20220819060801.10443-18-jinpu.wang@ionos.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Aug 2022 19:25:52 +0200
Message-ID: <CAFBinCCbjF_mkV+EaOtC0g_YbtX9TzBEN5fRJ_MiPaie5hxCwQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] mmc: meson-mx-sdhc: Fix error check for dma_map_sg
To: Jack Wang <jinpu.wang@ionos.com>
Cc: linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_102604_280048_12F07A47 
X-CRM114-Status: UNSURE (   7.64  )
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

Hello Jack,

first of all: thank you for this patch!

On Fri, Aug 19, 2022 at 8:08 AM Jack Wang <jinpu.wang@ionos.com> wrote:
[...]
> @@ -388,7 +388,7 @@ static int meson_mx_sdhc_map_dma(struct mmc_host *mmc, struct mmc_request *mrq)
>
>         dma_len = dma_map_sg(mmc_dev(mmc), data->sg, data->sg_len,
Does it also make sense to change the type of the dma_len variable
from (signed) int to "unsigned int" (a few lines above)?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
