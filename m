Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01B6C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6fsD0dyQUO/LGFoLMuUK5D6bPouULUfwBbphL0R0Hw=; b=0DKaEiBOyoJgcK
	i0zFWMdLO79lh3SLv5tp818zBAm/an/PVR+yqHA/vYIOpBPqzNR2c8c9gnD5EsU/d9+fEEkafnOMS
	asjUpv0/vCswfwJD+PRXg4H6BBSRkiPZaEm63/6Q9/pyknBtnmasKx19rODp7jJz+UQO7qKq7x+zs
	i3q2xlbo6/qDMMVeayHRpSSwshVJFwHt5xVFK/a343QpwEGUWwtxL8FG0khRHPu6jPu3IvwXd10jU
	kqjiFNkjHBPjl6CrwfnFJAoRMYzHtFLxFSnLLOQ02j/1NiIB7sAd8G9eaQLlqzTsjiVCdA/Nbzhrk
	cqs+bvLiW50vV8dy+KuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhcA-00GgFq-HY; Mon, 13 Feb 2023 22:48:02 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRhc1-00GgCi-1L
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 22:47:54 +0000
Received: by mail-pf1-x42e.google.com with SMTP id t17so8999985pfj.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 14:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cWkc+3ChVmfx7B5d4LvaJlWTur0XgS8iVlkGiqgUCE0=;
        b=td2JRhiFeJoXsjndN/dPafvGVyEL6gBRhWsJNKjtbhwAnmRcoWGG35VRoQV5Nr2sI3
         1+AZNFpYe8Tqv5yIk/fGIppi6imcgHJqj0ZadoncBeWVCnGjFO/EpXt3QdQhts2REFTX
         +IHzs9oiFtNxPK+aHy9M+QDUqgu9KBv6Vc1D9JslZyPf/e2fUJhKrf9aihS+wbIRA4SZ
         04xc4vxnfNRq1ISNO/AXWH6dYwbe9FsdfZFH2i9tEWNBXAqzjTvwrMdEqWAmQDNnda7r
         G6YE6uu5PTLGquHAj8cnsrh0HN/Bqq3io+9aw4w9+rAqwnAm7XTZrrsgZfr38cU4N5rH
         2DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWkc+3ChVmfx7B5d4LvaJlWTur0XgS8iVlkGiqgUCE0=;
        b=IymwCxR9+Hnnlynkezk2IJq7jXkDFeKehpAmdSTUuP5Nd6ZssPy1fVTBvL8UNOJ1xg
         PSuZY+AI0Is/diUxxzb7RK8axF64bgczU5U7OEx7vosO8SzoYtyYTgMwRcIyFU6NUaI2
         vo3rJjja9bLnBWTMuDeEYX6TsH0dGYxhfVbPgWlqW5x6kP73CIlncpBnPXUalCabPxoW
         lrwSPDqxZGxgLlpKDO/TAV5Ee+QEQuhy54EO2Jziu0/X97hy1HlNs3ggE3L47Mdv5r9v
         yrDDdLln0/6eeOgCDSh//Fc9ElDVfQPEvFkXaxnFhWojcQ5PieCmt/PwQdB/mcpAnvA6
         wOfQ==
X-Gm-Message-State: AO0yUKXWKsTKPYGJVO8smfc5H6LYDiMgDw+6rsFAMQf5AxOU6munbaJv
	fk4fkdP5CD4i1X1+0eTQU43Zg+S1SCc/6esswUekEQR+Quu5+Q==
X-Google-Smtp-Source: AK7set9M9DX21oVyPpfP6vYHMjDKdu9V2oSymO6ikBQm02DAiTsAuWK69Nagz9Y6XVTOZBYr5qR4bRIYwJbS+2NEmIE=
X-Received: by 2002:a63:7054:0:b0:4fb:949d:72 with SMTP id a20-20020a637054000000b004fb949d0072mr1279285pgn.8.1676328471372;
 Mon, 13 Feb 2023 14:47:51 -0800 (PST)
MIME-Version: 1.0
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com> <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
In-Reply-To: <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 13 Feb 2023 23:47:14 +0100
Message-ID: <CAPDyKFrsTMpguDp+0ZrKYkH5CYSk_OgKLxuZu4tFoGYaLpbJUQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: meson-gx: support platform interrupt as card
 detect interrupt
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_144753_082869_3B2E4ED5 
X-CRM114-Status: GOOD (  15.53  )
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

On Mon, 30 Jan 2023 at 00:10, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Use a new mmc core feature and support specifying the card detect
> gpio interrupt in device tree.

Don't we need an update to the DT doc too?

Kind regards
Uffe

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/mmc/host/meson-gx-mmc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index be1a972c2..c87bc31d0 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1236,6 +1236,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
>                 goto free_host;
>         }
>
> +       /* gpio card detect interrupt */
> +       mmc->cd_irq = platform_get_irq_optional(pdev, 1);
> +
>         host->pinctrl = devm_pinctrl_get(&pdev->dev);
>         if (IS_ERR(host->pinctrl)) {
>                 ret = PTR_ERR(host->pinctrl);
> --
> 2.39.1
>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
