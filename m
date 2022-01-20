Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC09C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 11:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKBprkKXxnKR0zWhh5Pd/rWGeCrdXysynwP+wtQEFyA=; b=jrzrU2YkGl7T7B
	ROxDiS84Te54PlYDzZDlwjbj2L+5F3MqQCuRC2mLCH6MWjN9Neq8v/PwkqMGpb7uEFeZeYWIPClPy
	WxCW3+XuiK7g94DLUm0QtMZdva1TM/tRJ0NfbroMLWKLCg0k/Nv0VcCkc3g5oNIdx+aDRKXojgGNo
	Y4CG5NGPe1S0QM3p3MJxqgO01rX6KMj1qLE6k5nnayt/kkzsY6oHTG2/IrX141EWdU9zwEMnGbpDP
	LRr3VyHEcMExDGu4di84jwzZu2E1ql2OECW1DH1Lxwt6OTxQlEe/lQRq3S7apfEGm1EMcolE3zMP9
	ZQ3jicHbFTjeBrNP+c3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAVEA-00Axpl-5p; Thu, 20 Jan 2022 11:03:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAVE8-00AxoZ-9u
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 11:03:37 +0000
Received: by mail-ed1-x52f.google.com with SMTP id m4so26901872edb.10
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 03:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n97jOmH1Hh/lQ5JREIu8WWpMZHA+pObxbgnKcQKqkdY=;
 b=OfgVg4++cjXVJlgE4V6UGTv+/DRslYaxUQwp42wmoRX703kLnHT6ZI42wX0OmSiDlZ
 SDwD6u+GkbkGAFUtJaJksGgW3PqmKgpnh610LHWTZa19Y68u4qy6t+4ixut+aX9mwwDf
 ovfVjhquX3wpszfrRqxTnakSBbHc8lkEazXCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n97jOmH1Hh/lQ5JREIu8WWpMZHA+pObxbgnKcQKqkdY=;
 b=fVehpM6rls85wPqi1rcohC3tMtG03teBpG7UjCTRp4SxVmbU6+9IDFjF6Urrtj85cj
 XAoOfcuhfleA0hj01CYp7ccTkI+QYGcOGf3M4DzSbpG4MvQSbtCC3VmKuj54Vl1WZ0gT
 slbfdf9YJoyJXaAAMZGblVaAraosmzAzvQnov3Z96/6PmU+QYuQxmd11M0K8aRUlETKe
 EWwQS8NoDg88Nv/x4InUsayukVNOJFyl0nCBzR854HMHFej/BSF8iaeLi+PLDHAGQ/4K
 Zh18sBdkNOnYkP8Mo0hJgEqCW2tulqODg1DFDBUsFFORiUMr+0w21SWPDyk3xn3bi/87
 nfJQ==
X-Gm-Message-State: AOAM532v0H/CIfyjy4wF1mEDUoWShpx7kIPUF04OikhCW0ODcsQr4Ymu
 ViluqGgBV2txBYIS/YTsgLgnKHFeaezjygoyTyPeapq+47E=
X-Google-Smtp-Source: ABdhPJzNGcaoNoLJ9DIV2wfpr4vlmfC3H1ldbuvo6eEiv6LUJOZKv5Nk9JAXwwWgrS0AxorLH7OJbyk5bNnDlGJejCI=
X-Received: by 2002:a17:906:2e81:: with SMTP id
 o1mr9130992eji.760.1642676613863; 
 Thu, 20 Jan 2022 03:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-7-narmstrong@baylibre.com>
 <CAMty3ZBEmafG8LS_yv4eektvUoHwYFoV=-8wohUXgsvpRbZqtA@mail.gmail.com>
 <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
In-Reply-To: <70d1af3f-bc00-4afd-1157-1cf70d3b2c88@baylibre.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 20 Jan 2022 16:33:22 +0530
Message-ID: <CAMty3ZC9Cp=8=iF=KYCWjwb-wk+VrPBzH+6L14H6iZcSm3CZjA@mail.gmail.com>
Subject: Re: [PATCH 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_030336_399500_21FE8DD2 
X-CRM114-Status: GOOD (  23.70  )
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

On Wed, Jan 12, 2022 at 1:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 12/01/2022 08:24, Jagan Teki wrote:
> > Hi Neil,
> >
> > On Mon, Sep 7, 2020 at 1:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
> >> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
> >> Amlogic SoCs.
> >>
> >> This adds support for the Glue managing the transceiver, mimicing the init flow provided
> >> by Amlogic to setup the ENCl encoder, the glue, the transceiver, the digital D-PHY and the
> >> Analog PHY in the proper way.
> >>
> >> The DW-MIPI-DSI transceiver + D-PHY are directly clocked by the VCLK2 clock, which pixel clock
> >> is derived and feeds the ENCL encoder and the VIU pixel reader.
> >>
> >> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
> >> DW-MIPI-DSI transceiver.
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >> ---
>
> [..]
>
> >> +
> >> +static const struct component_ops meson_dw_mipi_dsi_ops = {
> >> +       .bind   = meson_dw_mipi_dsi_bind,
> >> +       .unbind = meson_dw_mipi_dsi_unbind,
> >> +};
> >
> > Do you thought of non-component based meson DSI like STM DSI? It
> > require changes from meson drm but just to understand if you have any
> > such plan.
>
> I have no such plans for now, note this serie has been rewritten at [1] but still
> with based with components.
>
> If worth it, the plan is to get it with components and than yes if it's simpler
> drop components completely.

Dropping components make the pipeline well suited for bridges as we
are moving bridge-driven pipelines in other areas.

>
> I'll have a look at how ST does

ST has no components. As I said above, eventually there would be
common bridge driver for dw-mipi-dsi if meson and rockchip moving away
from components.

Thanks,
Jagan.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
