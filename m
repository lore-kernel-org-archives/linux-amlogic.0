Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF033C04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:28:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2C7C2173B
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 17:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lBJBRbM6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1mDD1bzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2C7C2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jX2NkM1i7nmhYwWQnrgnEluzzTzm16CH9YeUbEyZH/Q=; b=lBJBRbM6FIetlB
	XtbEHBhYGMOFAbm/2rnX/tJGNDYHD8GkzU5Lfih9bZREZLtBO/16ZAIkR6VKviuru8sd/sXEvrXzk
	efciukK9x/cy6nfiQFso1OUtOlAU+BCxuOeraIsUrHucbjV+YQQySgZe5xbgFnGrjgg6H9EXe9J0P
	eSaPyb1bVOXhqIwoyh2mJo397/lbBbMMQm+JTW93M5/wC3wGSDC1bw/Qd7+sgtrOI8gnj+god7SR8
	LjTDQPnzCfuMDABn4ncaOGTNXB7LItbC4kShiLUStXgaXhS59A6TKpOLeCqHMCiIl4rRSKPA/jeVv
	aiCJ64PcDDWSCdB0cRgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPVmu-0002z6-Nc; Sat, 11 May 2019 17:27:56 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPVmr-0002yl-AQ
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 17:27:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id y3so829884wmm.2
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 10:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ugYp5dhniPXHr02G59QHXf3+78cHsNWpN1Q+YKzxEj4=;
 b=1mDD1bzrGGV6SNyFAqYnkyZPqZA/z1+1EBO918vqkFMiIE8ORcFDL7UFwnOxAFMZx3
 ROipS+ZEyLlkoizefpbo5eZBXFHpWuZ/Z5/gkvy9IBnxUmVtm0hvIlyFFVIRUA6UMDty
 6gZV0qvYPxgM79T3cu3VQjJus6Up9+6raiJWPV0/LRIawGGUjTfp1oDa06Yktu4OVkAQ
 R04g4VPnE5KhQSY9m6VDXxiZyb4MkYK/k3kTtUjfFyQbhbtVFBYFIDUGPSWA/bfm0kYU
 Fcyyj58q1ZFJlp3Lfk7OhSofGmbLcihznfCjYusINULg2zsNVKJ+iAsD55JHB//J/zHp
 k4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ugYp5dhniPXHr02G59QHXf3+78cHsNWpN1Q+YKzxEj4=;
 b=a86Y3MlMYWh3RXoTyGTEI2BcREBrwh+U+i4Tb9W4sfKy9Vw8cOgov+qDNiUZcL2Pwy
 AdIdC/KDCGt7240XrF5pQueT2n6U/oZbABajXW+NiDZWba2uBOc0o9jTfd7EcBTF793u
 g9G1T1BbyReNRLtxoYESC0sLDx8vKd3AAcFWQTsIbS0PHeIoBA9h9Y9Hbplo9ULT7pD0
 Tz3d9sjFHmZ8cSNYYYYDmpPiDOR0lAaLo+i66TsHGp+ARjfyHdll2+RUUrEWztamGGRG
 ykdECQSF2P547s2xjsSlcbvxE32b7v+pmVQggolLCK0zGBIkZ2mpqPEg73JmEVJuYFlm
 7uRA==
X-Gm-Message-State: APjAAAXxZIKmWVO2UesAXSTa1SPAsI2QvsL/R1tU9cZGJkyDblGVPNWQ
 tsLGvDYWh3ghVSbolz6roo8Fyg==
X-Google-Smtp-Source: APXvYqy9MKkZc7Ku2c7o8LbKyEi1zO+hTm+WXU4uGdfyOBQIVnCrnBZXdmHpFVoCOxWLpqyI9FTugw==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr10510136wma.120.1557595671603; 
 Sat, 11 May 2019 10:27:51 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id l21sm7128970wmh.35.2019.05.11.10.27.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 11 May 2019 10:27:50 -0700 (PDT)
Message-ID: <7244c6d3e81e7bbb84ac508399ab64e236051673.camel@baylibre.com>
Subject: Re: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl
 definitions
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 May 2019 19:27:49 +0200
In-Reply-To: <CAFBinCAmGRHDU5QX2VEsV8vLBXD6fJtcRHbjdW8=p9Yti0V4qA@mail.gmail.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
 <20190510164940.13496-3-jbrunet@baylibre.com>
 <CAFBinCAmGRHDU5QX2VEsV8vLBXD6fJtcRHbjdW8=p9Yti0V4qA@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_102753_363129_038C09AD 
X-CRM114-Status: GOOD (  15.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2019-05-11 at 19:06 +0200, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Fri, May 10, 2019 at 6:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> > index a32db09809f7..fe0f73730525 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> > @@ -206,6 +206,43 @@
> >                                                 };
> >                                         };
> > 
> > +                                       eth_leds_pins: eth-leds {
> > +                                               mux {
> > +                                                       groups = "eth_link_led",
> > +                                                                "eth_act_led";
> > +                                                       function = "eth";
> > +                                                       bias-disable;
> > +                                               };
> > +                                       };
> > +
> > +                                       eth_rmii_pins: eth-rmii {
> > +                                               mux {
> > +                                                       groups = "eth_mdio",
> > +                                                                "eth_mdc",
> > +                                                                "eth_rgmii_rx_clk",
> > +                                                                "eth_rx_dv",
> > +                                                                "eth_rxd0",
> > +                                                                "eth_rxd1",
> > +                                                                "eth_txen",
> > +                                                                "eth_txd0",
> > +                                                                "eth_txd1";
> > +                                                       function = "eth";
> > +                                                       bias-disable;
> > +                                               };
> > +                                       };
> > +
> > +                                       eth_rgmii_pins: eth-rgmii {
> > +                                               mux {
> > +                                                       groups = "eth_rxd2_rgmii",
> > +                                                                "eth_rxd3_rgmii",
> > +                                                                "eth_rgmii_tx_clk",
> > +                                                                "eth_txd2_rgmii",
> > +                                                                "eth_txd3_rgmii";
> > +                                                       function = "eth";
> > +                                                       bias-disable;
> > +                                               };
> > +                                       };
> it seems that the group definition is incomplete (missing things like
> eth_mdc, eth_rx_dv, ...)
> 
> we could also mix the eth_rmii_pins and eth_rgmii_pins in a board.dts
> (maybe that was your idea in the first place?):

yes that's the idea

>   phy-mode = "rgmii";
>   pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
>   pinctrl-names = "default";
> however, in this case I would prefer if "eth_rmii_pins" was named only
> "eth_pins" (following mostly what Amlogic does with the pin group
> naming: eth_* for pins that are valid in both, rmii and rgmii mode and
> eth*rgmii* for pins that are only valid in rgmii mode)

I can't say I share your preference. I let Kevin decide what he wants.

> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
