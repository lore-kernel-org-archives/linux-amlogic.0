Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9769CCCA479
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Jul 2022 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYWzMNKpZhzrezLMoY5unpPW54f5eM2rH3IlaxrpKD0=; b=V3ADFsPIv/7Hw8
	qMJqrvTrlPxHhYXFjS8nnSGEGOfmag56Oipdd92Tf8nrPSCcBLCHk0EDDrqU0bk/i3k0DHMGYaMNC
	19WtNjSqrRQxaRlFdd/recs493Jiry+lEN2KVME5GnRsQ0CfOctM4PKE11bDeneIqfJ9Zn+RUjCNV
	K+rB7+wGutPkl6pzuTZ+EntPWrYn0ujr5TEfA9MYkm9yPZ2rZfXrBL8io0FtxfRzvb1V/MIa091Kb
	wYNlpVpGe2kvfLBg1H1h/7oeIxEljeFwQMPQy5DUx90WVFOabvzOPorvFZIw66n4olInII7I4oSHF
	dE32t/AkOHN3Xjjg6XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KGx-007kho-W3; Mon, 04 Jul 2022 11:29:48 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Jkc-007Jrc-Qi; Mon, 04 Jul 2022 10:56:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id r18so11184530edb.9;
        Mon, 04 Jul 2022 03:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yLNLTQJBz4K88aihRO/hyNY3I/0qFhkE7Lhod8FKE3c=;
        b=XX9JttmfJ0/zIulSmshOxmiYWgz963+s6cj2I3vDXDUT9CcC2gZu5LK2P8F/KpTJMm
         cIrCdbEKy+nFds6CN2c0mIGN7IKuZZEyVIPI2T8V8L+U3DLixL6l5zIKtIylXc9A2yVI
         IEabH0KVA3GsVUNWzqex0dFzvpN1Spt3IISxDa482tRRd/NC1PFpvE2k+OF7zq5kkiMK
         wbvFD4ZvpFY+4B+Sw73vGfy9Bls5+2QwkEWJRI79jl606fCfU1BgRaVEXZ973Ncy8MN4
         lUjv4onkb0iGKNmyTduzvLTQesZXhvlFBgs2zA3tV1+hgKZ+qHujlcnzmsaNuBWWC54G
         xgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yLNLTQJBz4K88aihRO/hyNY3I/0qFhkE7Lhod8FKE3c=;
        b=Hv7jsWtt+Dig83nhWHTKtQnG1wx3oUVB0SzisqR+Xr+UbJF5hTESPCfVl6a5x6nk0E
         58rASCFPSEEfSQfiPjs3cPv2JcTUkfL4WSgFbzL9o3tQGtaO/0At28+QaXVLp5qRFtxI
         vpPuylThO/toEgv7YVpmcyU2T1UBofhF/8djKQIOuQyLBcW/yMAbMybj4Dnq1906MpiG
         zNvYz4DI73Hbnh4uj4dihBZPsFcmhQj0a+JSoNvOi3fn4d/02AI0t1SnvYqpE2AalQvG
         NZu5zQx+Lh00pes9ybSHKpLHeh91T4eQ689tY2Siszz1vy0KnKsTA75QzMCUYdlB9Ru3
         s8IQ==
X-Gm-Message-State: AJIora+IOjNWU3qnuK2ovglxhIgs7GIYgtVoI77ltqqZ9ZW+h7GjogAq
	1tDauU52fGuvUTe7Y/xaGuN5GPdyYUPzMshkFmvDAJyYHz4=
X-Google-Smtp-Source: AGRyM1vLTWZbM65JclBW/D3ypExCkNB9vaIsK0IRrxdPcg72SmG7E09xNtFjfQQZKcQd68bq/rpP1K/5NiOlUjezuik=
X-Received: by 2002:aa7:d685:0:b0:435:7910:f110 with SMTP id
 d5-20020aa7d685000000b004357910f110mr37267629edr.247.1656932179663; Mon, 04
 Jul 2022 03:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220704105307.552247-1-colin.i.king@gmail.com>
In-Reply-To: <20220704105307.552247-1-colin.i.king@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Jul 2022 12:56:08 +0200
Message-ID: <CAFBinCB-dTQRMOQm1mac7gOaxj97FK-fAa-Lgz4i+erW0-PEtg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Fix spelling mistakes in documentation yaml
 files "is is" -> "is"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lee Jones <lee.jones@linaro.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_035622_953844_998594E4 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, Jul 4, 2022 at 12:53 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There are several occurrances of duplicated words "is" on the documentation
I think there's a typo in "occurrences".

> yaml files. Fix these.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,vexpress-juno.yaml   | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87524-q1.yaml       | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87561-q1.yaml       | 2 +-
>  Documentation/devicetree/bindings/mfd/ti,lp87565-q1.yaml       | 2 +-
>  Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml | 2 +-
For amlogic,meson-dwmac.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
