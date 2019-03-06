Return-Path: <SRS0=k/HH=RJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88460C43381
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:01:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A8520684
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Mar 2019 21:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mF8csu+p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IjQr5S8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A8520684
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=enPzBmYoy/GK9d7lu+titCjKAT3KTibiYTHWvS3t2AM=; b=mF8csu+po9so1o
	eWrdgcqQ0MUVEazhYL6rlmWBkXqMtUt5W1tg3fu+8i1D2HXDWONLTjQ897pIVSR44MGQqJ91O6GOL
	z8JwE0pZQddG8l2a6xSMNLECjTAw2JK63MUH/vBvpDUVddsS6nWPydY3J/x9efwLQMoi5ja0mm7gi
	Og4S7X2TIX8VF4RR6DJBEma3GLYg42/dMVc0ZsiDWzE70eAlh1s559wiHhIc3c4DFcZ18yed8x02V
	unO6QygJeGsRiJPIULCv4yiVQkXjsjz/cAPXZlSBfNZkeOo628ca6UiXjb/ptLO+kiNoGwNdlVPM0
	0rlv31YUG5xt+lcZ+VVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1des-0006Xt-Jw; Wed, 06 Mar 2019 21:00:58 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1dem-0006W3-Bh; Wed, 06 Mar 2019 21:00:56 +0000
Received: by mail-oi1-x244.google.com with SMTP id q81so11065927oic.5;
 Wed, 06 Mar 2019 13:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WkZ4HEOJZFJ5tvEsQ4ywiwfaW/8mEqhWWpAAzk9aizg=;
 b=IjQr5S8gwfPe+w9yvuXdiT+V+jsiia4rARi/vB88Q5xKvTp8AIaK/D6CG3920dUhG2
 NSk3tujLvxjCe4D4ndxu6c+tg17hSyu5qwV3IXH53hEZm8Cfqa2/e8tp1aKkZir2bi4l
 kZT5jssK5fudG5pIakE4tXpKG0bU5Blw15M6yKCvIe092BBakxRgDgkcQ5vCxfenoHJ9
 BjCuTSBX1/Xjg4oQKdjekVqUV3pNnDm+d8Y3cRI2nulsOpW3lHVNYZgYlHRqrHJkszZP
 uv38j4CkNgqIOILJut9FV97s0yaVETJXSuNdp5W3k0GtHVPrJyit1XQqlcDbRrUpJKaL
 utbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WkZ4HEOJZFJ5tvEsQ4ywiwfaW/8mEqhWWpAAzk9aizg=;
 b=SLfjw0oYtFrToOHtv8BGxockvjWzIprPoUL024clybIE9F9Nei4qBeUNieOhIjaq9h
 GvvE5HY7MKNKgPCZihTIcJUj/V2+uGjXBPV0dLgM8/Oq/O+kjoY/DJcqjHMTTcS8f8S4
 /zAJToXgAYtX7LSd5kJGRDDycPFausnsjdUe90FdU/lVPiPy1MFxnV2Jh88/GpWj+qu9
 j2YjQo5IaFIplX7ocoi3MXkfOKyUB2z3z2+r1kmhspLz6yQ/hr9Nck3OzWcYWP4Reh1l
 DBDK1fQSmF/2nQ4xtfe0TxqGVqaNlWYqyDRNtsXaMxAyCO24LODb/uEGBl9ZuTv7ByL9
 RuCw==
X-Gm-Message-State: APjAAAW2cvn0MCaZPOp9Ip65TJLDIEXDKJvVcVcs5lH9Fh/yOHlHPysc
 CWMG0puewrZvlV4m23TNDNweN2bPhvoavnjccus=
X-Google-Smtp-Source: APXvYqzjgug8DoTlX4m1L/JICwfzoFheIp+0TFPFevCk+4vLgK+k7KoG9TZ6GSBWv2cc2lBWJcDy70x3XEVKsDwnyj0=
X-Received: by 2002:aca:aacb:: with SMTP id t194mr2996977oie.129.1551906050696; 
 Wed, 06 Mar 2019 13:00:50 -0800 (PST)
MIME-Version: 1.0
References: <20190304103846.2060-1-narmstrong@baylibre.com>
 <20190304103846.2060-6-narmstrong@baylibre.com>
In-Reply-To: <20190304103846.2060-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 6 Mar 2019 22:00:39 +0100
Message-ID: <CAFBinCAacdsjwtg_RK=e=Lnep7oLF+eTBmkb1FB4nFR129z1jA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] phy: amlogic: add Amlogic G12A USB2 PHY Driver
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190306_130052_422923_0F7DAA6A 
X-CRM114-Status: GOOD (  10.48  )
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

On Mon, Mar 4, 2019 at 11:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
there's a "regmap" include right above. this driver doesn't use syscon
so this include can be dropped

[...]
> +static int phy_meson_g12a_usb2_exit(struct phy *phy)
> +{
> +       struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
> +
> +       return reset_control_reset(priv->reset);
do you know whether we should reset_control_assert here instead of
reset_control_reset?
the probe function below already uses reset_control_deassert, so the
current implementation is inconsistent. in v1 you replied with "Maybe
it would be better, indeed." - if there's a reason why
reset_control_assert doesn't work here then I would like to have a
comment stating why

Apart from these two this is looking good!
Human readable BIT/GENMASK #defines for the register bits would be
nice, but I'm not sure if you have the details to add these.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
