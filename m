Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D17C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 18:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhysUBlxp6nAtOzgBVuu5BHprJo8/fIeYIIDmT4jm5E=; b=YEHMeHEZlHeuKV
	Zk4rrO3sAnt1yLaKr3fRTMDJ43zTlMJTexen2op4flvf1CPGlFDxSa7IherlHw/2azypDxopwgWlg
	JsCaAm+K2A7PyuNCel4ZT3JeywMBVIUf2QCgIwnxAKKEJVmthDWxdHV5Pvh4g+PKYoo3ZD4EtaVE+
	DbEhP7uA+kfP2Cy0VQEsu0ZhznfQGvLp+YWu4tgD+/PztnG/b7/pCTOrusMQxkBR/KH6owOuJ83JO
	QXhiSkIwKzr5OhGhTs4M9VWa8Ug/y68DFf/qaY6CrYPly9tHFEqrnYGzatSJu6y6WfPzU3Wmq0E0l
	e7HO1edH3HyvYqki0ejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1uSZ-00HEpA-U9; Mon, 27 Dec 2021 18:10:59 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1uSW-00HEoV-7v; Mon, 27 Dec 2021 18:10:58 +0000
Received: by mail-ed1-x534.google.com with SMTP id o20so64499871eds.10;
 Mon, 27 Dec 2021 10:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bZfv4l30H99dim1rIkVyLOCmppXl3dBKONr9XpRFCFo=;
 b=g7U9MrCrWSr012g4arHmdhf79XLSEcekZhy8re1OrG7IkWyJOHNreqfQPtWXJp4z3X
 Dp9qu+mrltQabq6X5NtbdjVbrBUEldDfNgGgTmw1fLDuYpq8MP7TE023bj1Y2dazXuna
 BNtuuLCHV2sC8Yp4ZRYEevyWAvQWRezwxWWyIKJ16EH5xyExZCcOBKiHJcP6zkfFhXGi
 evmH1BhCGrK+exdG3UQECj22/KNUqJGbYtZ5llNwWLH4km3qY5h6w2WvKYkWUQALVCCz
 rt6NbdEu5tGgFfuZ0Py5CwLJ7gdaORWAeU8mMupAS81WrVWfd0A532xFXTBs/5axCS2X
 5l0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bZfv4l30H99dim1rIkVyLOCmppXl3dBKONr9XpRFCFo=;
 b=z14drAyPDQDAyXfhSQswZ3eK3w2+3XZS4cR3RkK9xVYM29j3H6byqh/jd5zKpHjOWf
 arWnz0GkH9FmD+SP3B0+Ad5VzFRq7D/8Il2b6EivT6emwsFGEMMM5VKL+5dP2EjripAX
 fBcmJdwAWPbkg0tEVOiHZqajPIlbm8yNPD55YXW86wMCa48e2M0OoPY05/09SrhfTqkH
 jiNKz0yJAardd++ndFruznNfPJc6cJrN0voutYvnT38X4rqA/2dl1vT0DBG24yvKf195
 c0j+WH8f6J3WxniHuS4EvjnNJnYME71oHVOWRfxpX2IA6MY596lIFPSSStTAohlmVFxo
 Vewg==
X-Gm-Message-State: AOAM532+EW7FlKl634/qn2qWplzZYz8ijucipTStGYO8aqJndnZdzu4M
 vM6LHqP84177n/kQ/zk4lWkucV4gMRcz9QS+z6DGdS4ieB8=
X-Google-Smtp-Source: ABdhPJx5xiU6DZrcXlQ71TpUeO1xkZfpvgTcNZ43G3beRQGQeeZ3itkoGEPXg1kLa4rLJNi6P2eDkZq5uCXoZgd8tOA=
X-Received: by 2002:a17:906:341a:: with SMTP id
 c26mr14863800ejb.302.1640628654866; 
 Mon, 27 Dec 2021 10:10:54 -0800 (PST)
MIME-Version: 1.0
References: <20211227090139.2001-1-zelong.dong@amlogic.com>
In-Reply-To: <20211227090139.2001-1-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Dec 2021 19:10:39 +0100
Message-ID: <CAFBinCDDxCuwC-zNurWW44v3tJnmeK5xkJajx4RDe+1uDtecuA@mail.gmail.com>
Subject: Re: [PATCH] reset: reset-meson: add support for the Meson-S4 SoC
 Reset Controller
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: p.zabel@pengutronix.de, khilman@baylibre.com, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_101056_314411_98812DCB 
X-CRM114-Status: GOOD (  10.88  )
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

thank you for this patch!

On Mon, Dec 27, 2021 at 10:01 AM Zelong Dong <zelong.dong@amlogic.com> wrote:
>
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Most maintainers don't take patches without a proper description.
./scripts/checkpatch.pl this.patch states:
WARNING: Missing commit description - Add an appropriate one

I suggest something like:
"Compared to the A1 SoCs the number of RESET registers is different
and the offset for the level registers is the same. Add a new
compatible string and struct meson_reset_param to add support for the
reset controller on the S4 SoC."

[...]
> +        { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
checkpatch reports here:
WARNING: DT compatible string "amlogic,meson-s4-reset" appears
un-documented -- check ./Documentation/devicetree/bindings/

My suggestion is to take your previous dt-bindings patch for the reset
controller and to extend it with one entry in
Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml just
like it was done for the A1 SoC: [0]
Then take both patches (dt-binding and driver) and send them as one
series, so it's clear to the reset-maintainers and reviewers that
these patches belong together.


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d9730b9eb05a349c278a9f6f058ebefa9063def

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
