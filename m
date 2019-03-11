Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134F1C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D388E2087C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 21:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRn8Su1E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OiFh82tS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D388E2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=isRTlnUb8ccaBCotPsPwR9+ZqYbzMfh4Cy7RdbjNO9s=; b=CRn8Su1Ep3YSe0
	Ls98qt49k2UJGm1OjLKQ2Khs8M64J4GrMtYEm2zkm3J5tLKjIONVpNHFHuOpfzmTxLCWbsF/GOqNw
	3bBUXL37hAFsCZC9UbgrO8JFatTyLctEl/dAglM3/T5CQGqkWhA5tmyCfIFAbY98IJJvg7PZMyAmj
	v/yNsssNGmGFIipc6fLUosZrrv50I5Kp/lEgpE8oFidHdy+X/1Bz/ST0U02ZILUsFZRo8XLDW7Of8
	thaUOVzk+xkUcIhqGyjszGkc+qS+HXD4XgtxdR2TrrLEzns7MzobgAlJg410nnDWoaXgJDUiLIJFb
	wNJK53H3tudHSNtXPNkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3SFv-000836-82; Mon, 11 Mar 2019 21:14:43 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3SFs-00082c-Ca; Mon, 11 Mar 2019 21:14:41 +0000
Received: by mail-oi1-x241.google.com with SMTP id g16so344647oib.1;
 Mon, 11 Mar 2019 14:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1LJx1bgWhwnOV4g1ZsjM8oUCFlzqPuh14sDBiNuc0LY=;
 b=OiFh82tSJQO6TUDjtZPGtofwnpkR+QgQ+ogne/DPoigWMpsw6jLxgm+DO68u/Ag+Mr
 IYYU49B7qQja0gAsj7LLb3JaQ93yrocjAoGM7dHGhU3y4pPfe4z3lO/1zBdWg+X+bDSU
 ygbQyMXa1RGAdjww4QjTjY4m64HdWDs9xIyokzqAnea7yZKprOxn4jH33LqB4tOpXrC8
 Q0bTDsIL92qXLppjD6l7HQzyrH/t4VRV45i9Hh2vAbyJ/z+J29h5x1eo8pbSrb/rb8LZ
 3G53t0LMYavwv16okJc71nw7a8sTBFb3I+ck5vzv7olreYHwJj5h9OsyHApKmnxCf8lR
 UY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1LJx1bgWhwnOV4g1ZsjM8oUCFlzqPuh14sDBiNuc0LY=;
 b=jQs3kH8ERPSDNOe2wEQbHbvuLl2/5nxMHLiqAPne973xxwCoXuxOWYqiNa+0lTxmyd
 bv42nZig4VT3Qzh576qhz2jvI6GnecaelR6hcZM2qHjnW9dkctO4V7CkrghZ0Gp/kEyJ
 CEUlPUE5ZPZ8KmhlloNcFGbg/SUTHTxa0RoFe08RugTGgQenN24nHXtjzT5rJjLxWjCe
 UQDT3t8gt6dl8jBQmNedZ33RNfYcppUpYwEQSpUdNTowopelVm5EWLHGX5xx9/lVizQF
 I2HJ2Lj0fiyhCVmPpaOnDsUxMs/jv9mEFnUF7AZh0cdjwgGnqCcuW9J5k1Dz98Sz9/7P
 vWzA==
X-Gm-Message-State: APjAAAUifGH2UomwZMA+qUJmlXX2qaw7d2orazVcZh6ZAnuUpq8SnlSD
 hbOJ3vnYyN0sxuwEnIjB2KcasjUFTv0NZxwPd6k=
X-Google-Smtp-Source: APXvYqwDLrnWKQj+zP1QIGzKJcs55swgmqdCBxD51MwA5D7MjVGxmNy2NoSVkkQzAqGnmi/ijoLBzp5+BJvAX13/LZE=
X-Received: by 2002:aca:4205:: with SMTP id p5mr171502oia.15.1552338878194;
 Mon, 11 Mar 2019 14:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-7-narmstrong@baylibre.com>
 <CAFBinCBnDPcHpOQ1vW1gL6FxgLSxMv-f-qMm_TTCvXfDaFr3zA@mail.gmail.com>
 <6e8b1935-ba91-d06e-be63-cb2632a19654@baylibre.com>
In-Reply-To: <6e8b1935-ba91-d06e-be63-cb2632a19654@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 11 Mar 2019 22:14:27 +0100
Message-ID: <CAFBinCCHZULDQjVeifiag-rzaPopVY7ir42RCGm9Wn6i9-=Qaw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo
 PHY Driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_141440_448167_35B84848 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, Mar 7, 2019 at 9:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 06/03/2019 22:04, Martin Blumenstingl wrote:
> > Hi Neil,
> >
> > On Mon, Mar 4, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> > [...]
> >> +static int phy_g12a_usb3_init(struct phy *phy)
> >> +{
> >> +       struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> >> +       int data, ret;
> >> +
> >> +       /* Switch PHY to USB3 */
> >> +       regmap_update_bits(priv->regmap, PHY_R0,
> >> +                          PHY_R0_PCIE_USB3_SWITCH,
> >> +                          PHY_R0_PCIE_USB3_SWITCH);
> > does this automatically clear PHY_R0_PCIE_POWER_STATE (in case the
> > bootloader incorrectly set that)?
>
> Don't forget it's a static configuration, on the board, only USB3 XOR PCIE
> will be available, if the bootloader sets this and the kernel uses USB3,
> or the reverse, one of them is wrong.
I'm specifically asking is because we've seen various GXL/GXM boards
with a bootloader which is configured for the wrong PHY interface
(RGMII != RMII)

> >
> > [...]
> >> +static int phy_g12a_usb3_pcie_init(struct phy *phy)
> >> +{
> >> +       struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
> >> +       int ret;
> >> +
> >> +       ret = reset_control_reset(priv->reset);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       if (priv->mode == PHY_TYPE_USB3)
> >> +               return phy_g12a_usb3_init(phy);
> >> +
> >> +       /* Power UP PCIE */
> >> +       regmap_update_bits(priv->regmap, PHY_R0,
> >> +                          PHY_R0_PCIE_POWER_STATE,
> >> +                          FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1c));
> > similar to my question above: does this automatically clear
> > PHY_R0_PCIE_USB3_SWITCH (in case the bootloader incorrectly set that)?
>
> Same answer, but I'll investigate to have more details on this register.
>
> It's more an implementation issue, we can change it when PCIe is enabled
> on this platform.
I'm fine with postponing this until we bring up PCIe support on this
platform if you add a comment (preferably marked with "TODO") in the
driver. that makes it obvious to everyone who comes across this in the
PHY driver

with a TODO-comment you can add my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
