Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C078C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 20:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d3ir0lA9BzZQrGgylXOlPpGNnKWpE+BSGyderg2blrY=; b=0vNGD9YBLokmg6
	hUaN8L/rnc/IGh48UzYH6DUPKKgoNlZQbtwYMCJq4gb0O256UOUkNApYlO4K0164AN95m89ZDHqny
	exQdrY7e1qq3/QmD8LobpsLDo6FvM3WXI4iO5qWBK0I+9nZVrOZILhxl2cjmvLp0IIKTCt7543YCu
	8pOCkD6MXd6EazKisNKqj99xPTW8VqaSrCvJwELQZTZMchwwPSMN1hJDLuLja2oDxiXDmPWGolIhP
	5TJ8PpPrjyVF2Nw2SPFynZnoOis3Pyuf4WOutlgCi/dG/GKlnoVEF5yzpuOWTui25draXZR0X3H1N
	MScDtbna/7VXTU3R6eCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1vvz-0044jj-Bd; Thu, 16 Jun 2022 20:17:43 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1vvn-0044iQ-TS; Thu, 16 Jun 2022 20:17:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id m20so4778714ejj.10;
        Thu, 16 Jun 2022 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DX0lnwq0FoNDe0NHo5zKy58uDrKTU3ba2v/5ACg45Z4=;
        b=Ftx+4afl5YF/5tcf+NRZe6rqNl8IY6qTVKvED70taBft2puuoEEjqrpuI+6wzeM+6A
         nDYdLOMEoyIbdqrTHajuBCSFjvXqcyMgTZFifeNBpEpLFZ1gM0gatIsXSeI+e9eCXpoN
         IYTJ2Jfw6AVvqpaW759a5kHQiTF1p8/HAZIOFYqw0/VesAvnLL7xlhq8WZTJW/Q+girV
         zosFGF9LZoR89rNz2kkNtezOLzvoDRb34Y6ZXHJvTnUOA+iHOKVFQTZIINO0Ci0/+exg
         eTtybAaIBbs0oIoqDj1OUN2E3tcGIdjyU75XOCkNTsl/HCOvD072EqSq0kSJDB1Y5fBw
         CE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DX0lnwq0FoNDe0NHo5zKy58uDrKTU3ba2v/5ACg45Z4=;
        b=OZx20bZDchCqL13nMiHwshgH2LWXPk6iDkdwPT5e3Fyuu++83bJPbPyqdREHrs3UAd
         SYaWMJofbPCYTdCO4tVII63+BHzsSq058K0m4mO/lJ65P4iPC3rxrYd+JlCtuap0g32i
         AnjVWw3etT+z18LjKyNi/aC1fh4BEdL8LR9djUuePrH+3TDxZYk5cOwbv4EesJt4X2rz
         InWSSSFN3gPjVqoAcf8ZlVh/9D58fObs25IDnHnj79vDmjzyPZOGKCmiNae3yzISUTpy
         c/gIbpYoL88J8Lq29xcfI4c7Kl1gthB9Tx8daqgg6DKYUkwT76W8p4GVI5wiwKXN0b53
         N67Q==
X-Gm-Message-State: AJIora+qn/VIq6IuMS0Efr3kSQOmHUVNVAFPBxCenTv4hRD3YcbPTTR3
	W8FTzPy+KgOXaQ4cgFG84ktZcS2tc6GSWW+VOc4=
X-Google-Smtp-Source: AGRyM1vReoKWj7a7/tslQx3VnTeuxl59MJHG6jHeVjNgYy9WKSILutmLIGTT07Uc+vE/vpKVxqEUYXfq7AuWDxwygGc=
X-Received: by 2002:a17:906:7386:b0:715:7024:3df7 with SMTP id
 f6-20020a170906738600b0071570243df7mr6017328ejl.543.1655410649682; Thu, 16
 Jun 2022 13:17:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220616144915.3988071-1-windhl@126.com>
In-Reply-To: <20220616144915.3988071-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 16 Jun 2022 22:17:19 +0200
Message-ID: <CAFBinCB-WZmnMtvG1P=sWASQZCg9F9d-Hg0OzVNUsEutUFX0Cg@mail.gmail.com>
Subject: Re: [PATCH] soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, jbrunet@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_131731_991264_E04E63CB 
X-CRM114-Status: GOOD (  10.55  )
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

Hello,

On Thu, Jun 16, 2022 at 4:50 PM Liang He <windhl@126.com> wrote:
>
> In meson_secure_pwrc_probe(), there is a refcount leak in one fail
> path.
>
> Signed-off-by: Liang He <windhl@126.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
>         pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
> -       if (!pwrc)
> +       if (!pwrc) {
> +               of_node_put(sm_np);
>                 return -ENOMEM;
> +       }
Another approach would be to just move devm_kzalloc() a few lines
further up (above of_find_compatible_node()).
That would catch similar issues in future when someone wants to add
more code right after devm_kzalloc(). That said, I don't think that
this is a likely scenario so the patch is fine for me as-is.

Thanks a lot for submitting this!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
