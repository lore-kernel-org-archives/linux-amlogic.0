Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE2FC48286
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Feb 2024 19:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D9bYvVR8v42ZUJl/jzlUBulz+Fw2HVo9wgpJqabmaZc=; b=ZTlVQlEizAaQzP
	J4aoSzQlGajv0uNBKXxZaV8sgdotHthm20Mak30/m7BqZ4TRSquFfn/0ol+8YfIAeZRADiHixCONL
	ifMrzN/m7tHz4BB4HhX4+BWFqdVwPUBsQafBxHrzpbOdmF2vEATsxP/PBtnPKkcOelAVfW3Tsxc2Z
	hTOTztYkYblZsfHZsLh6cBxv7TjcaQUY92YfJXK8t2yv5b6dXtD4Fyxcg/TqZOuplITiLdM+No/gs
	0/jFQdHqUCyxUOK4slOzRoUPceOrPBQIPenVVhkvapBzPvsl1FXby/+CsTyox0KldXBfY3aJjqW5h
	2R6Dw+9xu3xPm6NBBzNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVd0c-00000009CUn-3j55;
	Thu, 01 Feb 2024 19:46:02 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVd0a-00000009CTP-11wY;
	Thu, 01 Feb 2024 19:46:01 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-51121637524so1846523e87.1;
        Thu, 01 Feb 2024 11:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706816757; x=1707421557; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Go0sAqla2a5Ya4OBAwwEZLy2UuNkDvjwTq09pNv5ZA=;
        b=VRLc7KoPUhikQlRgQbUrliBInqiwSTVhcYgmSJ1ww5ZgCLzqa9pprsBMpLW9t733sd
         sr/J/1s9Ef27WRB0BhZpBH9yVDDi39LFSIYvOqh8ELZFSH2a6362oemKz/lauzkmWOM2
         YYXQ0KNmdH/oty40E2jOiedzRwNtdlO29HVL71hiW5PU08NkdazVgs+LxWAfw+2j1PcQ
         9PI9BONlL3zNEygh1biaiuVgEHDqipMI9OQvlIruoIiNf8t7oytEWkwEuA/zCCGmtLzc
         gZorjGOnOdsRgPDm4Iwm0rgymjvAwr5k/qbT9w7Y5VsZ1ApuxVIiUz0s6F2rG4RlszgX
         gAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816757; x=1707421557;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Go0sAqla2a5Ya4OBAwwEZLy2UuNkDvjwTq09pNv5ZA=;
        b=mdwEPeG1mXc762AoVaX60RxQ2IOaV12M8reYD3jHhM5+1+l+uZdWg6qmpmJYySM1y+
         12/42mSWTiTrWQHB3H/Oz2NfO0cLpJw6UUDvVRPcH+vpmXZVZlemvosup4BjOObukRas
         eqComKW76IV29t4S2WV4wZprifHnx9lmwgWWcB9rhUFUpAyrrzeyYOxXGU30JswST1fh
         ZzWHaCcWTC5blTNNvx+ChZQqb5dPaqQEIwuwqgHESGU6w6tPfiMhoBLY3PimuV7oEByC
         v3PdRTjs8IYDMzX70ruB3l1xLzgAN1ntYO5bSXRljJ/nO1+FxwXUNMg0g9cSEI0IplVB
         uKug==
X-Gm-Message-State: AOJu0YzZpy8wwaZAdMBcVn2CqYQ6b2sA860GKxx72WCawQNPlKqDNQTw
	aEzrceYaOWAb5U1yf1+y6/0AM89o3TjxfaPNnqJjc1TfwGBu6Ztq
X-Google-Smtp-Source: AGHT+IGP7PhqkeeAE9/EIVIgwVwKXKZ/fh6YyFBEOJy+CDewmEHopQT2m7o2QqaEtuz6oXOM0H780Q==
X-Received: by 2002:a05:6512:2eb:b0:50e:8eff:3980 with SMTP id m11-20020a05651202eb00b0050e8eff3980mr2539919lfq.30.1706816756827;
        Thu, 01 Feb 2024 11:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUg5iYvwrRH+6thFcmdCETvJsvZzVhvtb+IKHt49BslMaFmAGWxQNUsHBNxAOitBxv0JY7t9do7aFcJGoBrRPbmHlk4u5UVVcVnuDMuOIYEYIIlpx+jYncuXW6926geF82ZhpOP8fFl96qiXFquaLdDWq+Os2imy3z3GW4XCmt2Z1YB5tBJe8d3Y5QAGqRB3cQVPrfTvqyEYEzhp18d344Qk99OI0jkgWV0GK1DC+7cqRuU1prSGxczUUHa+IemAbZDrl/emBD2Fckl23ZKmdZ6HNqh0jpzKNR0GMxWs8lK4E91Ih9mc+WU+cijgb2SM30AXIpdcE2W84bQghb7hDQvsQinCAdYHKgNub/1fTV9Qht1G5+vHKdGfJEhkg3SiUn4ukPhV8Y+1TXRlnuz4jwFoHD24hc3BbaWmebRNZVbpQ8pM3imEITEWB2psI79suur8JvT+1mGeeCX+/LEWTVtsuSJvDHcFSR8hp9ZuGdfZesBBY9//ByQWITDaCmBxe/axSTEq9cKkCZy7xwlr5zkBleRCfOo/W4mQDHyEGs3nI0OsgpArLAYkM4Xdxr2E/wsvLCzOMp3HFRtqDoom/KXBJL3fKzF6sD1
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id j27-20020a05600c1c1b00b0040ef622799fsm5373482wms.37.2024.02.01.11.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:45:56 -0800 (PST)
Date: Thu, 1 Feb 2024 20:45:54 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 03/20] drviers: crypto: meson: add platform data
Message-ID: <Zbv08i_Yn0wrjkwH@Red>
References: <20240123165831.970023-1-avromanov@salutedevices.com>
 <20240123165831.970023-4-avromanov@salutedevices.com>
 <ZbC8qLXogjxJD8LD@Red>
 <20240201171352.ut5xhw3u2b77v33d@cab-wsm-0029881>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240201171352.ut5xhw3u2b77v33d@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_114600_314876_469B1DA4 
X-CRM114-Status: GOOD (  30.15  )
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

Le Thu, Feb 01, 2024 at 05:13:56PM +0000, Alexey Romanov a =E9crit :
> Hello,
> =

> On Wed, Jan 24, 2024 at 08:30:48AM +0100, Corentin Labbe wrote:
> > Le Tue, Jan 23, 2024 at 07:58:14PM +0300, Alexey Romanov a 'ecrit :
> > > To support other Amlogic SoC's we have to
> > > use platform data: descriptors and status registers
> > > offsets are individual for each SoC series.
> > > =

> > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > ---
> > >  drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
> > >  drivers/crypto/amlogic/amlogic-gxl-core.c   | 31 +++++++++++++++----=
--
> > >  drivers/crypto/amlogic/amlogic-gxl.h        | 11 ++++++++
> > >  3 files changed, 35 insertions(+), 9 deletions(-)
> > > =

> > > diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/cr=
ypto/amlogic/amlogic-gxl-cipher.c
> > > index b19032f92415..7eff3ae7356f 100644
> > > --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> > > +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> > > @@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *=
areq)
> > >  =

> > >  	reinit_completion(&mc->chanlist[flow].complete);
> > >  	mc->chanlist[flow].status =3D 0;
> > > -	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
> > > +	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_=
reg + flow) << 2));
> > >  	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].compl=
ete,
> > >  						  msecs_to_jiffies(500));
> > >  	if (mc->chanlist[flow].status =3D=3D 0) {
> > > diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/cryp=
to/amlogic/amlogic-gxl-core.c
> > > index a58644be76e9..2be381e157c4 100644
> > > --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> > > +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > > +#include <linux/of_device.h>
> > >  #include <linux/platform_device.h>
> > >  =

> > >  #include "amlogic-gxl.h"
> > > @@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void=
 *data)
> > >  =

> > >  	for (flow =3D 0; flow < mc->flow_cnt; flow++) {
> > >  		if (mc->chanlist[flow].irq =3D=3D irq) {
> > > -			p =3D readl(mc->base + ((0x04 + flow) << 2));
> > > +			p =3D readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
> > >  			if (p) {
> > > -				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
> > > +				writel_relaxed(0xF, mc->base +
> > > +					      ((mc->pdata->status_reg + flow) << 2));
> > >  				mc->chanlist[flow].status =3D 1;
> > >  				complete(&mc->chanlist[flow].complete);
> > >  				return IRQ_HANDLED;
> > > @@ -245,15 +247,34 @@ static void meson_unregister_algs(struct meson_=
dev *mc)
> > >  	}
> > >  }
> > >  =

> > > +static const struct meson_pdata meson_gxl_pdata =3D {
> > > +	.descs_reg =3D 0x0,
> > > +	.status_reg =3D 0x4,
> > > +};
> > > +
> > > +static const struct of_device_id meson_crypto_of_match_table[] =3D {
> > > +	{
> > > +		.compatible =3D "amlogic,gxl-crypto",
> > > +		.data =3D &meson_gxl_pdata,
> > > +	},
> > > +	{},
> > > +};
> > > +
> > >  static int meson_crypto_probe(struct platform_device *pdev)
> > >  {
> > > +	const struct of_device_id *match;
> > >  	struct meson_dev *mc;
> > >  	int err;
> > >  =

> > > +	match =3D of_match_device(meson_crypto_of_match_table, &pdev->dev);
> > > +	if (!match)
> > > +		return -EINVAL;
> > > +
> > >  	mc =3D devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
> > >  	if (!mc)
> > >  		return -ENOMEM;
> > >  =

> > > +	mc->pdata =3D match->data;
> > >  	mc->dev =3D &pdev->dev;
> > >  	platform_set_drvdata(pdev, mc);
> > >  =

> > > @@ -312,12 +333,6 @@ static void meson_crypto_remove(struct platform_=
device *pdev)
> > >  	clk_disable_unprepare(mc->busclk);
> > >  }
> > >  =

> > > -static const struct of_device_id meson_crypto_of_match_table[] =3D {
> > > -	{ .compatible =3D "amlogic,gxl-crypto", },
> > > -	{}
> > > -};
> > > -MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
> > =

> > Hello
> > =

> > This patch breaks bisection, since it removes MODULE_DEVICE_TABLE.
> > After applying patchs 1,2,3 the driver does not load anymore on lepotat=
o board.
> =

> Please, give more information. =

> =

> I applied the first 3 patches and the driver probes correctly.
> =


Did you tried to set the driver as module ?
The breakage is when the driver is set as module.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
