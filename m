Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80580C678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 13:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRX/AdAHBRR/gmCpJ7MpmjSsd3rgRyxTmjy7nrFhXr4=; b=lnBMU1SNw6I815
	P4TW76kb6JbjDM6Lq/3zHSG0WpT1aDqJ1+f+zoIIHIpClRvobfwV74lWZq8okVHVZQffYiRmz6OsV
	yHOxmeshIGypaGRB3vcH6MbfWI8J6HzvnuqAjafvsWx5epJVt9eJ2Ax9ceJhL3vPOHICsEYKGmaEl
	g9UzYG9GN3lXR9Mj80Ap19TLhcWZDnJhE2gtzHS7oP+JPIX5P2PZCaMWon9zn4y4yD8LVaN/ygSt8
	DdIq5K9ZnOQNd/pkXWjPAU4WLUOaYxGL2/XHVmdhUHRcTW/UlMhodMbY06fm8o5fyiPb5y8LN+/we
	7ONY8HcfccZDP1jxZ4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBGP-00D00A-IL; Mon, 06 Mar 2023 13:52:29 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBGL-00CzvG-8q
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 13:52:26 +0000
Received: by mail-yb1-xb34.google.com with SMTP id i6so8135397ybu.8
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 05:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BPh6DRJ9CcazPLZjLGRmwkvYgFkVSdBurUSE2ObxVJ4=;
        b=qUgJtmNLgHGE4Bp38Mh2sm9vgRq0M8Fva0CT7yqcP+/NVMxBa9kdV7dNoOFdsNgLLJ
         4/ETkDNKpO6RHGFEj5tPPJVpv4CXd60RgXSW3jmQj6XT6dyZdHHoexc/DhRZ+JM32WBF
         ab+yE3lrDMwq3b8G2fsQXDSMFtOrv/tcgrEsxI4Rcu+YFqxI5F7ngH5+43cvBoE3AlIW
         3T7xEDG+clPW0xlirojmcqJ3JM3WYJIVTf9iU9RAcw6UQJXk4R/zeSPKOFvYA+PdMF2c
         asZ8gOz7L46HA4IfVdtp0midDQL6kiV2ykwA/RDJPQqYweg0CsvIXfW+I9/oNIzWsbxb
         LuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPh6DRJ9CcazPLZjLGRmwkvYgFkVSdBurUSE2ObxVJ4=;
        b=WTtwGFs4GVDfSJz/IEmSYdOAmUAFblxcGcCEvqtcExb0CDtZY8UN6T35P7vxm8RjEo
         Am1YjTUQntc7c9rrg9+qPGkq7p12NYCFa98jrCqgO1xSAHnSPxyru/Q1ZE1q1kuJLV3D
         RawJgik4oJh+KAOOAwfmI57NrxsDqEHv59MlkgJ408A95218xkYUQWpRawxEF/TmfNhN
         46yhrvcybGmAUYmDjWREUC0kNfeOkBucPx8DrpCyoYiYTuS/BidwRKVanbna6/iBMBG/
         Cggv76xLfmwqJwXQ3KWNoXJB/FS/mkt8+VUY+gHY/49kffVi6izI6jwCLnx93EzWfx+6
         e/ig==
X-Gm-Message-State: AO0yUKWdLEeGD2wUXtDm3k1CKetJSLaxibopzH2vM0iuHo+FjBViiUHE
	V/NcR0gw1p7x35zRhl7X4an+pCC0YAqNmIjdAdyd7A==
X-Google-Smtp-Source: AK7set96XVuLEwBCuezT4MzqONLfE0LMULjfJzchaO7bM4o8d+8Bu9LL/jc3Nw8LQAc2/AdguTvz8jvtK130zakvUqI=
X-Received: by 2002:a05:6902:c3:b0:9f1:6c48:f95f with SMTP id
 i3-20020a05690200c300b009f16c48f95fmr5065214ybs.5.1678110736893; Mon, 06 Mar
 2023 05:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <20230222115020.55867-2-avromanov@sberdevices.ru> <CACRpkdbWubk3A3qYuYqDc4OBGP6T7TaKwFeW17CwAzPvttk=WQ@mail.gmail.com>
 <2d9e01df-0047-98bc-f1e7-fa860d92c254@linaro.org>
In-Reply-To: <2d9e01df-0047-98bc-f1e7-fa860d92c254@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:52:05 +0100
Message-ID: <CACRpkdbDXnzKcrYnjHA3z5tiD9_FHgk5O8PO1esXNNDBVvtT+Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] meson: pinctrl: use CONFIG_PINCTRL_A1 with CONFIG_ARM
To: neil.armstrong@linaro.org
Cc: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel@sberdevices.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_055225_786103_89147746 
X-CRM114-Status: GOOD (  11.19  )
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

On Mon, Mar 6, 2023 at 2:49 PM <neil.armstrong@linaro.org> wrote:
> On 06/03/2023 14:45, Linus Walleij wrote:
> > On Wed, Feb 22, 2023 at 12:50 PM Alexey Romanov
> > <avromanov@sberdevices.ru> wrote:
> >
> >> Tested A1 pinctrl support for ARM and it works.
> >>
> >> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> >
> > This patch applied to the pinctrl tree for v6.4.
>
> Erf, this serie is something we would avoid, so no need to apply it for v6.4

OK I take that as "Neil says NACK" and backed out the patch.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
