Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130BCC25B08
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Aug 2022 17:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZERzApZWdr6NGrUAurz1UdE5TZXMx3+OaWgcxwXgLg=; b=ZkM2FeY9tcRmHG
	3fT3bczOEHSDH95K4P7yfUo7aq0DUWRiaPxyDZh0GEYl8ymBrfL5Ri6WRVer/MifiDo1mzg104MSY
	1vavuuO4ViGJxyPFAiuUVtBeK6r1bsU4YuewgxkA+HtJmnOoB8QNXk2dGxklf7dw7Wbyf560WHj9T
	zeZ8sCeVFSFgdyJwwYNvpyVfQcHWFAgTDS59ROjCKNXedmXrt591ZpVwEwdgg+1ex5Y4cruYrSna9
	4fqaahRJq/ZGd5gQstVmGQc9jkS6pw9mz006N74cNQzxuel9v5M+eKtfweeeca8Gjy7TiiEvbsU07
	rZxNcaBIrmuxBz05xmXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSBW-00BEfb-IE; Sat, 20 Aug 2022 17:22:58 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPSBI-00BEbH-P5; Sat, 20 Aug 2022 17:22:46 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-3375488624aso166091207b3.3;
        Sat, 20 Aug 2022 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=CsaY3CDWeiwKSPR4Rcjp0cpeUs3s2HX5HO3h9taF0tw=;
        b=MT0HlFwnjDPFvzp+hOYa42GnudTLD7ok2Mu4xn+bz2+Iy2xrK/Pek1o4nXuIS1KLbb
         CrGAucSQM679EdGBhUuj/To6l/jCjH/VEpW32ZKUp4WqxFOdMRE1oGn4Qv3q4TTrr0I6
         UQX+JND5SbbdHooAx7wtYaNUXOgIlnM6OfoBB92ttrHfOx98D11UJMYx4cFy8cBYSCrS
         q5cGSvd05A9MLa1VRh+gzg+P2zBwF3kzYJjZwEe0H7SPTWblv9Xve6rk4TnUWRzp3s9/
         hXgGfB7Vs/HQ29L2VC74VkP+1DtSjFLM/j2NJqg0BJqfu4THC7KM6Tp6VKKi2LoqJ6ZK
         SRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=CsaY3CDWeiwKSPR4Rcjp0cpeUs3s2HX5HO3h9taF0tw=;
        b=ckZ3al0SpwAO9/2lx/f1Bo/4xkdn8H/4L8BlfXOPgyB8cHFS/jBTm1RADk+D6Zi7z5
         YCp2B86HmPWzsn+rRjOrpqI+5BSAj5gNke2xqJyw5IJk9chQBhvcsD2eeJQE9pK1dLBZ
         ge+9mzEtQdCL/nKsyKmDHP9t57YkVVLtR7misLlDBrT6tNL2qZl7H3jCKVCZhpCo173a
         LSHT8DE1eb3DALD3N55gGGyg5Dwycs/h6537v+fckliW5NdIp4bvVjTLf3rS3J+7u+2A
         nsaFWw02jnCLZzDBRodEMgczow0Uea49cFIf3tNmsLar0+RWu7c8Kxf+Lg4BuLuItPPa
         hBRA==
X-Gm-Message-State: ACgBeo2+vv98QUCj5ixvws5s3/2jRkoLrEBd6K0DozcfQt7Q9Hnx7Fub
	YwTeBBiyzRrPhLDwq0xOyRfHP6YfFsgATfp42xs=
X-Google-Smtp-Source: AA6agR4LAyg80MpHiV53F5gZNZAmkdSJKWpf5d1cYiA8RAMxAt9xg6AW8EmhIEC+20A7rHMWdL/U2pJ22jTFg3leE3g=
X-Received: by 2002:a81:a1d6:0:b0:339:c126:e6cf with SMTP id
 y205-20020a81a1d6000000b00339c126e6cfmr2460710ywg.15.1661016159969; Sat, 20
 Aug 2022 10:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <be4b863bacf323521ba3a02efdc4fca9cdedd1a6.1659855351.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <be4b863bacf323521ba3a02efdc4fca9cdedd1a6.1659855351.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 20 Aug 2022 19:22:29 +0200
Message-ID: <CAFBinCB=JR1MtF3VX7qnf_puwB5dQ1u1ppMTpvSd4oAxLkV91w@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: Fix an error handling path in meson_mmc_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_102244_867374_D78A62DB 
X-CRM114-Status: UNSURE (   8.31  )
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

On Sun, Aug 7, 2022 at 8:56 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The commit in Fixes has introduced a new error handling which should goto
> the existing error handling path.
> Otherwise some resources leak.
>
> Fixes: 19c6beaa064c ("mmc: meson-gx: add device reset")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
