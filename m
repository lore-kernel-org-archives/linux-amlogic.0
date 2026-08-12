Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011D7C5B56A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSXPrV3eFSDWfkyUz9K6iQGQB3o1Fl+JeCIISPA+xtk=; b=EYX4/fkU2njnZ4
	zaew0bQR75XZdTHMmem1xvp/dZJZ/Fern2YPmeUC2jj1kab0+slkH1nDtvYmQgwts0pVerP/h3Ly5
	12p1atOrHMx0IaQIIjFOAH1c5mtcmqyeSOmGa70Ym4/gcLtrLpLA3Nh/x/AL9fEQRaM7MiknOYta4
	eKq+Cg/CzELe7AiK30jZSZOBzpDmwFz4ipNBkDXjcYI1HvwjCj5PZQtbXsujXZG5/EH8EcqVOwc3p
	X929Q1zeWEiBLlTManl6nUNf/uNBGXjullm8MuBPOMzbknkecVHvP8RfB01wFuHTu6PLR7zHQ2IMq
	KO4Jg3exN0TQXIsBbhYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7d1-0000000G93R-2lzR;
	Wed, 12 Aug 2026 12:00:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu7d0-0000000G93J-0bXw
	for linux-amlogic@lists.infradead.org;
	Wed, 12 Aug 2026 12:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 656D560A92;
	Wed, 12 Aug 2026 12:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D301F00A3A;
	Wed, 12 Aug 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786536012;
	bh=MHNBwGGnswWSzAP7z65dBZa8AALtkmk2EGpH/Ujybd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ic/w6eGgJIqhYWfLKdXfmz98qSzg6rfB+ir7Atcv+jNiJY7/P3MdEASn2QvwjA1Xv
	 vKVSxqD2rofrap+9PVJs3t6FawtfXhajZu18cktJ+eZTRkEUvrgxPwPfXewolHSu29
	 ABfJrEv73jwoTYX2qs64v2L9KQYbFGv2ZP7z9Zk5cVUR9HpYfT0/I0iRwvGNMTpe/M
	 N//WCw/7H/yv0R0W6ZPIOMZXp8zgeGl42b4vpD9RgRI+YiyHym4yxzIHEdiPiyJwm2
	 z/SyrZlj9BtRrrqx1k06RxOVOt3y7sYa/Z4Cu/wjKJIqM8z5D3O1ToBZce0y9lDuyd
	 fLarLCf72R20g==
Date: Wed, 12 Aug 2026 13:00:07 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, neil.armstrong@linaro.org,
	linux-amlogic@lists.infradead.org, mfd@lists.linux.dev,
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
Message-ID: <20260812120007.GO1072730@google.com>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
 <20260805081913.272991F00A3A@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260805081913.272991F00A3A@smtp.kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 05 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The driver unconditionally fails to probe on generic Khadas MCU =
boards (VIM1/VIM2/VIM3) due to a NULL pointer check on valid match data.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> =

> --- Patch [3]: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU v=
ariant ---
> commit eab418dac1b5e94bd297b0a14e92e87b2063dc9b
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> =

> mfd: khadas-mcu: Add support for VIM4 MCU variant
> =

> This patch refactors the probe function to use per-variant values instead=
 of
> hardcoded globals. It adds dedicated regmap configuration, fan control re=
gister,
> and duty-cycle levels for the VIM4 MCU variant. A new compatible string
> "khadas,vim4-mcu" is introduced for this new device.
> =

> > diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> > index 0e74efe14f367..4cb305ac915e1 100644
> > --- a/drivers/mfd/khadas-mcu.c
> > +++ b/drivers/mfd/khadas-mcu.c
> [ ... ]
> > @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regma=
p_config =3D {
> [ ... ]
> >  static int khadas_mcu_probe(struct i2c_client *client)
> >  {
> > +	const struct mfd_cell *cells, *fan_cells;
> > +	const struct regmap_config *regmap_cfg;
> >  	struct device *dev =3D &client->dev;
> > +	int ncells, nfan_cells, ret;
> >  	struct khadas_mcu *ddata;
> > -	int ret;
> > +	const void *match;
> >  =

> >  	ddata =3D devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> >  	if (!ddata)
> >  		return -ENOMEM;
> >  =

> > +	match =3D i2c_get_match_data(client);
> > +	if (!match)
> > +		return -ENODEV;
> =

> [Severity: High]
> Does this code inadvertently break the probe for generic Khadas MCU boards
> (VIM1/VIM2/VIM3)?
> =

> Because KHADAS_MCU_GENERIC evaluates to 0 in its enum, i2c_get_match_data=
() will
> return a NULL pointer when matching "khadas,mcu" in khadas_mcu_probe() in
> drivers/mfd/khadas-mcu.c. This will cause the check here to evaluate to t=
rue and
> unconditionally abort the probe with -ENODEV.
> =

> [ ... ]
> > @@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *clie=
nt)
> >  =

> >  #ifdef CONFIG_OF
> >  static const struct of_device_id khadas_mcu_of_match[] =3D {
> > -	{ .compatible =3D "khadas,mcu", },
> > +	{ .compatible =3D "khadas,mcu", .data =3D (void *)KHADAS_MCU_GENERIC =
},
> > +	{ .compatible =3D "khadas,vim4-mcu", .data =3D (void *)KHADAS_MCU_VIM=
4 },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
> =

> -- =

> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260805-add-mcu-fan=
-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3D3

-- =

Lee Jones

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
