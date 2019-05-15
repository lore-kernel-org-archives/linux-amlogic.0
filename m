Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172ACC04AB4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB62D204EC
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 00:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QvfL0LCa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E69EF/g9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB62D204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4MhMyo2JLLNUCFVhDKjuhN/HOxaGz9c3Stc/INZJR3w=; b=QvfL0LCaLDwy1T
	lOj/gVuaQ4+PlDlVt8rDhTiIi27miTH+fTHDOVRcDkwOeDWnM449HozsJqEcRD2/tyRuMiZFpl8Z2
	f02OMjqmXEeI98DxJzfUgho0tbEtwZMI5YP8F2Y1H1Vc+mNVvEufgVLX7ZG2uftIcSjkdu/8EEetr
	Hg+Kmpo/04f73sxP7284UbCU0oA8OfLXWlHioATc/0VpyYtLCvWiR2JzQK4Mzt4jXjfLan9+mePlx
	OK4mp/x3JTUjEBMSUDt6ovQQrw8EAaJebH6SWWn5DmiU2Lnp6FSdqSnZigU8QDy87wnINeLjILw+x
	y7CQfzGE+PifFg3PbVSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQhVV-00065e-GW; Wed, 15 May 2019 00:10:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQhVS-000650-5D
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 00:10:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id g69so385079plb.7
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 17:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=4SoXHx5mpTgQd7eRTwT5Sm5OnDgP1mzN+IrEBUFaD40=;
 b=E69EF/g95+Q9j1KG6Xl2+AVFojp2ZvLQehQtGcHEDQI30LUzCeKkzUELWAP8Lygal5
 fCY5ft15dY/uMkUWpO16TnfAH0g47mFItMeB/3MbZAlAjsUhnD/Uzl+pzOSvltAjZ95s
 w1OjSeOjh1RH7vOEoZ/RgyWvki3YPCL1tHYWCT9Zht16sbiPXDR7lUbOZQ8TSQlo8y5d
 tzgtD3LEZNVbd/ODAmhp9vEvgVy9PKOK4JPIzfdBpjtRNzb04n/SIBGGhniOvI5Azefi
 N8qc4vkLObwZrdwB9N2Kp823NlOh1okPQfSK02sKK01s7OYwo/MAym27QWcHJ7VDv/AH
 oW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=4SoXHx5mpTgQd7eRTwT5Sm5OnDgP1mzN+IrEBUFaD40=;
 b=HXXSAeXIgwDofNsFZiJC2/C1HLs4hNxc15L4915ZLTgdPnubtODKl7i1+MUYBT7i73
 LLxUDaMOa9SghWGb3JPYVlexIGnuNiosQKFA5yoeA7cwy4TuQniDFr7y+4F6hYkPiHu4
 7FV2eadlcNSPSsp/0QZA+cMUFmBhEeOZhIJ6dz6NmSncLvx92ecc3GlOWduhPdQ3SA68
 4ffELrWTtVFjSDe/X7f5IYgvdlTsLQ7moZuaYKOnOTVZi1z99CI04ZqRvgGPnBfpEU6q
 u5141skQvU5ePWqezLsaeuEW2pve0ZVLUfKlIfIxUwuEE8IJysNO/lz4UbMP0v1EbxM2
 K+HA==
X-Gm-Message-State: APjAAAXxzltg+432N1iUxNJzvAjy0bgVkQ9fm7gdJLGsnO8wqh0Pd5rk
 sW4hbKuUcjzI9ZHV/ND4MaSuAA==
X-Google-Smtp-Source: APXvYqykgYRCTCRHHO487dD/RFNDIaE47TVbzBDS/rehZQT2tkG9YHa+22a4vtWuLib/YQQYxsq9rA==
X-Received: by 2002:a17:902:322:: with SMTP id
 31mr28155221pld.204.1557879049023; 
 Tue, 14 May 2019 17:10:49 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:fd66:a9bc:7c2c:636a])
 by smtp.googlemail.com with ESMTPSA id f17sm262534pgv.16.2019.05.14.17.10.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 17:10:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/5] arm64: dts: meson: g12a: add ethernet pinctrl
 definitions
In-Reply-To: <7244c6d3e81e7bbb84ac508399ab64e236051673.camel@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
 <20190510164940.13496-3-jbrunet@baylibre.com>
 <CAFBinCAmGRHDU5QX2VEsV8vLBXD6fJtcRHbjdW8=p9Yti0V4qA@mail.gmail.com>
 <7244c6d3e81e7bbb84ac508399ab64e236051673.camel@baylibre.com>
Date: Tue, 14 May 2019 17:10:47 -0700
Message-ID: <7hpnokd1bs.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_171050_202025_3F57939F 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sat, 2019-05-11 at 19:06 +0200, Martin Blumenstingl wrote:
>> Hi Jerome,
>> 
>> On Fri, May 10, 2019 at 6:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>> > Add the ethernet pinctrl settings for RMII, RGMII and internal phy leds
>> > 
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>> >  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 37 +++++++++++++++++++++
>> >  1 file changed, 37 insertions(+)
>> > 
>> > diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > index a32db09809f7..fe0f73730525 100644
>> > --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> > @@ -206,6 +206,43 @@
>> >                                                 };
>> >                                         };
>> > 
>> > +                                       eth_leds_pins: eth-leds {
>> > +                                               mux {
>> > +                                                       groups = "eth_link_led",
>> > +                                                                "eth_act_led";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> > +
>> > +                                       eth_rmii_pins: eth-rmii {
>> > +                                               mux {
>> > +                                                       groups = "eth_mdio",
>> > +                                                                "eth_mdc",
>> > +                                                                "eth_rgmii_rx_clk",
>> > +                                                                "eth_rx_dv",
>> > +                                                                "eth_rxd0",
>> > +                                                                "eth_rxd1",
>> > +                                                                "eth_txen",
>> > +                                                                "eth_txd0",
>> > +                                                                "eth_txd1";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> > +
>> > +                                       eth_rgmii_pins: eth-rgmii {
>> > +                                               mux {
>> > +                                                       groups = "eth_rxd2_rgmii",
>> > +                                                                "eth_rxd3_rgmii",
>> > +                                                                "eth_rgmii_tx_clk",
>> > +                                                                "eth_txd2_rgmii",
>> > +                                                                "eth_txd3_rgmii";
>> > +                                                       function = "eth";
>> > +                                                       bias-disable;
>> > +                                               };
>> > +                                       };
>> it seems that the group definition is incomplete (missing things like
>> eth_mdc, eth_rx_dv, ...)
>> 
>> we could also mix the eth_rmii_pins and eth_rgmii_pins in a board.dts
>> (maybe that was your idea in the first place?):
>
> yes that's the idea
>
>>   phy-mode = "rgmii";
>>   pinctrl-0 = <&eth_rmii_pins>, <&eth_rgmii_pins>;
>>   pinctrl-names = "default";
>> however, in this case I would prefer if "eth_rmii_pins" was named only
>> "eth_pins" (following mostly what Amlogic does with the pin group
>> naming: eth_* for pins that are valid in both, rmii and rgmii mode and
>> eth*rgmii* for pins that are only valid in rgmii mode)
>
> I can't say I share your preference. I let Kevin decide what he wants.
>
It seems we've gone the eth_pins route for meson-gxl.dtsi, so I'd prefer
to be consistent with that.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
