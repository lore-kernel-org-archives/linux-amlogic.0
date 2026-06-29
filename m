Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCCDC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2026 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmsmwNhOVBQKfs1J930LMOQFzy+4qXYOykDTq6zIbNM=; b=x/OUZSNQEwRM+F
	SYe9Fp/o1EAmJMjXJwGGAjzt6vuSZZmrncMPPkPtYJB3PrzRxBpvJHwiCTRnxazlxjSBQ85ghBoib
	/T+blm7vi2b80n/gUaVIkyd3z3Qz4GYTUoLWGs0sSQMVXJL+c0GfppNQqi66Gq4lZU4k/t0RqytvN
	yrkOoD32n5zAz9RFRwPw+MX/fxaOiPPB8j23GliGj6bLxLt7oneVr09oNirSnQ8YR3kcMg179+OPt
	GNhnGUOpe9Jdmk4KF9TdBCMkkWT0Ubi1g1mybs+eRItWQ+0TRmNh6jl50HYokuIx+n5DOoA4esocV
	HYSy+N0ded/CSGlAJ91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDQN-0000000EykU-1MCG;
	Mon, 29 Jun 2026 14:57:27 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDQL-0000000Eyk2-38nt
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Jun 2026 14:57:26 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-489f3611e0cso2158694b6e.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745044; x=1783349844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrA9ccFaco9J2BZQ3eRpFjtGI3CKCK/xF2koXbFr26M=;
        b=axJ8jYWljKZtBNtljFZbmQrhzbLvtjS3adUtmX1pgA8t/1nhPwRJKguoNplwzZHKn5
         ZgIjg+Y3LJEvGewz8Pw5ZWDM66ZqdSVNrvJo2UmqE0TGq/tg7s3nYUsDvc1Jj9QKrKTX
         EQsvzUmsiK1/0wQ/bJfD5+dK8mS7Y0zAxssZ1W+nk8yHORNi7oAGZ5Y0wGZrCuzGjvTM
         KT+219Xx2h57/FQuaCyeok4THhyMD3599I/JdAZNd5t0X2synaX6Tob2ML3ebhqWKdOC
         J50Dh1m1ezWeSXnFdJ/7gPtZYVwfRiyBatMpy5rwWJh0BO+mMnDuFIXUiCVhgWBvnrzS
         rNQg==
X-Forwarded-Encrypted: i=1; AFNElJ930xYp3A08RLtjOniZDYU8KC34eOgXKipV71dJO0wLKpMSvgnlhwNXEpvlAc8h3U1dRg5MJE0lWLQi4zga@lists.infradead.org
X-Gm-Message-State: AOJu0Yync7rBCJLzehLRwxhE+CbQ9cUri9BU7TPMcJD7UF4ylad6Qb3d
	hWGt4TSpJhaDr7HdXcYvlRBZ7N4vCNp1mVSM9XIT2SWoPtIeR6pZh1+8BLjhGBXX
X-Gm-Gg: AfdE7clEE8rNFYtIQ9CUMwx+vPiyk+vIfX7O+qAJsGzu0aQMsLMAi+lUyFZwF3NSplI
	jxk5+vvOrLuiOmibXLGxlKovIvKK+b2U2OEGqgqy0STnY75neD8JSZp6U57/prxQs5H/K4J14W9
	4a4Ll0zAfzegQhR+xjAh5Sf9eVM3yyOeeoNje4RPznnq/cmMLGcNnQtlKlhUeNA6NZ5K25YTWiU
	9aNjGqsluCPEcAf6+H5EaZFWgoJTE8ycI2Lm2GYiinZaq5ky8AmqQDh3pHUGggg9SP3xBeUQNro
	rzUdi841uBf7dcEYnsjASchqJz40zP80IhnU2HOmI+ccTskWHT9/5ZQ+EjHMMuHIJ4Z4rlj03mZ
	Uv7JglwOH2Va2a6b4FpRqmhK1Glcxcgr9nzb5TSKKwbhFqQpYYo7qF3muqjkmaB72lvRUDVXF5P
	GYM1S/Rn+RLvKBQVmUrn9ylZllJhxXUGWaEXCaGPnWmA/ahmL3zg==
X-Received: by 2002:a05:6808:50a9:b0:495:dff1:4955 with SMTP id 5614622812f47-495dff16e97mr1345254b6e.26.1782745044413;
        Mon, 29 Jun 2026 07:57:24 -0700 (PDT)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4935596b734sm6999407b6e.17.2026.06.29.07.57.23
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:57:23 -0700 (PDT)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69dead44101so2956279eaf.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2026 07:57:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+VJXqA/QMCUfVruXKDvuAzXCoYKmYFKyJof0P982foeKoa8LyKBYfH2+ZwCe0Ec6SiVepCI+G0pFCvHRMD@lists.infradead.org
X-Received: by 2002:a05:6102:c86:b0:738:ecd7:198e with SMTP id
 ada2fe7eead31-738ecd71defmr1394925137.19.1782744721048; Mon, 29 Jun 2026
 07:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com> <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
In-Reply-To: <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2026 16:51:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
X-Gm-Features: AVVi8CdkJoaQviVQ7ltoNYHwA2g-kW32TDsBBJn2QkEKdC-zwJrV4O3to75iJ6g
Message-ID: <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075725_792532_3B4DC1A8 
X-CRM114-Status: GOOD (  28.48  )
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

Hi Bartosz,

On Mon, 29 Jun 2026 at 16:07, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Mon, 29 Jun 2026 15:51:31 +0200, Geert Uytterhoeven
> <geert@linux-m68k.org> said:
> > On Mon, 29 Jun 2026 at 13:29, Bartosz Golaszewski
> > <bartosz.golaszewski@oss.qualcomm.com> wrote:
> >> Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
> >> This is essentially the same hardware as sa8775p rev3 but the PHY is
> >> managed by firmware over SCMI.
> >
> > So why can't it be reuse the DT bindings, and be compatible with
> > qcom,sa8775p-dwmac-sgmii-phy?
> >
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
> >
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  power-domain-names:
> >> +    items:
> >> +      - const: serdes
> >
> >> +examples:
> >> +  - |
> >> +    phy@8901000 {
> >> +        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
> >> +        reg = <0x08901000 0xe10>;
> >> +        #phy-cells = <0>;
> >> +        power-domains = <&scmi7_dvfs 0>;
> >> +        power-domain-names = "serdes";
> >
> > Ah, this uses power-domains, while the existing bindings for
> > qcom,sa8775p-dwmac-sgmii-phy use a clock.
> > I guess the clock is the correct hardware description?
> >
> > Adding to my list of examples for backing a hardware-to-SCMI remapping
> > driver...
> >
>
> Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> driver instead of the MAC driver where it was previously. Instead of cramming
> both HLOS and firmware handling into the same driver, I figured it makes more
> sense to have a dedicated, cleaner driver as the two share very little code (if
> any).

I think you are mixing up DT bindings and driver implementation?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
