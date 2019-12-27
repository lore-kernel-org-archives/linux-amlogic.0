Return-Path: <SRS0=RZf2=2R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE83C2D0C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3B9F20882
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Dec 2019 16:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AyDpMK8Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Yf6Cu8DG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3B9F20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dy6Zw73W8vORe94AC8waddlvFDxdUt2GxhZd71mJzac=; b=AyDpMK8ZmaoNB3
	4n1Zl3OU+BDNxBH5YVxDU69xR9BoKx2FpsFJlYi+eyqHNhje76cCW36WHK7f2o1Nq1EBdQBttFCd2
	ov5cA04VDuONv6LX0vqYLRbUi0y2mRBoSPGrpiX8rl5qZ6/YjnFpL+uFNQarOipy7wCewK58dyEni
	ZOY1yttBJxU0SCngqz9xrmdxcqN73XyvvXI01S/uWYlJ1zFQv/agGLImuS5Eag/0nBmFvzQ/8xfdZ
	OAiZjqGkLwUw5zgMkWsaOmlw4d1s31dnuHTE5ViOFNoc2Y1mfey/0+N2JE3S7kXLBFaCWPutvUT+K
	aO4PF76qQ3woSPPJLhhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iksfP-0004Xa-Gg; Fri, 27 Dec 2019 16:40:47 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iksfM-0004X1-Ui; Fri, 27 Dec 2019 16:40:46 +0000
Received: by mail-ed1-x544.google.com with SMTP id c26so25707909eds.8;
 Fri, 27 Dec 2019 08:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xgrOcm9k9IAQcFI+FWINNDCQ0Z4VaYkcjqiXu7nzoSs=;
 b=Yf6Cu8DGYWlCJdHGMC0bCW0kyLJBuSPvgcu9lEwGombWcvTkBDMvNqz5BXObWo3yok
 p5el38LSnq5WwV5xPaxH2kD1uC1zQLDc90NKaHzo5pMnK5IM3t5+g7M6Dy89kSbkesBD
 PKuPfIb9Ne2DPhT2T1AyR9N4f1vZHB8G2afcutDR21ntb4f5EV1WNUttItuiRsGW8lO3
 oagm92RwvJIfhFK20d9NRpGz+rCQDCS24AeDaFlUwM9TI5mAPRcuwVkhqJOw521B+iVu
 Fw2LLTkI4p8vCWe4nn2jFEx3hCfknLrdce2dS+tW5Z5HpnuhBts1ssj/AkZzzy4Yc5KX
 T1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xgrOcm9k9IAQcFI+FWINNDCQ0Z4VaYkcjqiXu7nzoSs=;
 b=K6IOJI3NDBJNZ3P5Dh8q8pS+Fpkvk1GGVqLTISv8ibXSDTrWd8XqCm6SorEcgD+NtP
 kjRZ7Yd9RrAJgS2WEEv1Dxd3uW9X4b4lu78eN85wo+e+7E/Xsh370alAfPyppt422n38
 nmKTlxRbLO13GxwkvGgSRYZJJ3jdFycaMw5UBw6u1ne7ZpMrEZC4sLGB8Esh29op0Rqs
 EKJCOvbw40Nzv77ginCNOXhoYJETqgw3FJUc059B2xsmcDTdSPJCRDeINO6lkviLLdgS
 SrFEWkGOYvy+U5eGbFVv71z+GVia5f5gFC9QTfs1G5IQmx999aarzi7T1B/uiD+AqsyG
 9zbA==
X-Gm-Message-State: APjAAAU7k7QVE2Ubgh+/4Rqo3/HE6lHg+b0sDw22eAA9CiUXSLZi9U+j
 3/RqciKOdQRUahlJvj7KsnbQuFzKMK2wrE7EIBw=
X-Google-Smtp-Source: APXvYqxkHYAyndioq3rkIDvgR0cbdviWKBnIZcDlDoZQCfu0BNG7PYKVTKcaxVPiAWtYOYRzgvoWo7ltBXVq83a0o5o=
X-Received: by 2002:a50:bae1:: with SMTP id x88mr38955946ede.10.1577464842282; 
 Fri, 27 Dec 2019 08:40:42 -0800 (PST)
MIME-Version: 1.0
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 27 Dec 2019 17:40:31 +0100
Message-ID: <CAFBinCCEz-xezKatuHDPRURRWa3YNmgMObbr85GSvaT_bLFcNQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_084045_072651_16781EE7 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hanjie,

overall this looks good to me and I have one question

On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> +       if (priv->soc_id == MESON_SOC_A1)
> +               value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
...here we have some CLK_SEL bit

[...]
> -       priv->clk = devm_clk_get(dev, "xtal");
> -       if (IS_ERR(priv->clk))
> -               return PTR_ERR(priv->clk);
> +       if (priv->soc_id == MESON_SOC_G12A) {
> +               priv->clk = devm_clk_get(dev, "xtal");
> +               if (IS_ERR(priv->clk))
> +                       return PTR_ERR(priv->clk);
> +       }
but here we don't need any parent/input clock?
does this mean that the USB2 PHY on the A1 SoC doesn't have any clock
inputs? how does it generate the correct clock for itself then?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
