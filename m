Return-Path: <SRS0=MCOz=W4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4817C3A5A4
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 863A222CE9
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Sep 2019 11:29:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALthQ8pp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bkdN6BO8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 863A222CE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X94ggRcZSnQh2p3hXZ0VWku9hTIXddOC5m2wUdzeq50=; b=ALthQ8ppY30hHw
	T20GioM2cjuH9a1KE9egCODMLJm9ZPwxzO96g3w/ipW0y3cFcqaZzvlQpQ4OY2wWAxBPxz7yXZBfy
	QhBqiRjEsP8Wow6qJt8/XOdar2MrsFme//950Ls5DQPFdLRO8DYoKyxB3cHljt3D+DbDu2+RdgK7w
	RhJw2R6Aj6y+1DhQScejUoSo1alutmhg1H7JSE/XwqFDEUu7DJwh9PRuscjs8BB93tRWlpz5TgUKD
	tZhg7h+rSQs+KcxLpz+ZPmngDN+ZtxCEQuf+IIEo6+9DX/B9iiZH1tlVNAd02vsA1tOv1DZAnd7Md
	YyD4QSmqaaL4pu0a7tiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4O31-000145-KE; Sun, 01 Sep 2019 11:29:31 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4O2n-0000sx-0d; Sun, 01 Sep 2019 11:29:18 +0000
Received: by mail-oi1-x242.google.com with SMTP id 7so394839oip.5;
 Sun, 01 Sep 2019 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DjNYoP0TZjOYpbU4nYIgEpFHwbIKmPPLiFzVEjdvaZg=;
 b=bkdN6BO8eAl30cWYew33QHGFT9cJopCCWlD/vsFFjQaGz3Fc9EjQZ4W/ukbLppZV2P
 Zg9MvFarnFdjh9jp06N9mwJjvs7IKsXhhc7JTFb9AenAojzTgNiTBRGE0v7hXusB0Qg7
 b17iL8zwOQ2XgKagS1q4RHVeuaNhOjSajZH8WKsArRWkywx+0A69Fui74XQtKwzyvJpS
 uRM1U8i23COUJLo7/cQeuM3vRiEQrU3JytSkE/CjSid0Ol1HkKoH/pytDodkRbgFFBls
 qFgih7cva/RE8Tq6BCxXLe8jJjnrokgKTZk/Rh8NqVS8drzarN/QKLjHSPZzufu6rv1N
 RJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DjNYoP0TZjOYpbU4nYIgEpFHwbIKmPPLiFzVEjdvaZg=;
 b=J+se01alk5nTQS73e3y68KAlWgGOSrP5Z0CxKCCAJE0MM2nZ0Oe7DWmyleDA7BSZhH
 oaQgSNKMeRfsnfCo8B0Xw+aBUkGeFVv5GLOoaqIgmbY1bPWu9cpM9uYRZmgFLO9PkAxW
 I1ezN5X/FW4d3D0pU+McybHWeOXWEALCk6RPgmGD+AEbjOpOReYF4R+ZQcASE5IW/BY+
 5Z3dNgXlQjGbXzKh2cMHANdCAtHUoNWFHa5PTocQXO1/J+poO+21zyULVl7s+RjdeYZf
 BBNfVLhLuNeyO3Llh6mOP94A9hdCITac9u6TdMoxswhtZS6Fk8NKNjuElfdb6HhCSgM+
 DeUQ==
X-Gm-Message-State: APjAAAXLdvSVX/+BTZObvwiTUeOemJsMBE/QGPxmYAJRAAa2rSjBcDuu
 /bYvblX9RIjyR/zkk+IkH4ThUVeTYp3ab6JgGcs=
X-Google-Smtp-Source: APXvYqxxXKXRUZLMHQgk0XoewqNh98k6Y0rpItgSJzPuoeBuz1EBdkqcp55bFlX0B41vfDbAAe9Icj/tVYTN6vp7Ft8=
X-Received: by 2002:a05:6808:b14:: with SMTP id
 s20mr15778496oij.15.1567337355596; 
 Sun, 01 Sep 2019 04:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190901105410.23567-1-repk@triplefau.lt>
In-Reply-To: <20190901105410.23567-1-repk@triplefau.lt>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Sep 2019 13:29:04 +0200
Message-ID: <CAFBinCD96nJBPnyNgWA6CgwE2kZrkXB3-cgbV9aQLB=JtbrN2w@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson_saradc: Fix memory allocation order
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_042917_084800_E9A977D6 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Elie Roudninski <xademax@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-amlogic@lists.infradead.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Sep 1, 2019 at 12:45 PM Remi Pommarel <repk@triplefau.lt> wrote:
>
> meson_saradc's irq handler uses priv->regmap so make sure that it is
> allocated before the irq get enabled.
>
> This also fixes crash when CONFIG_DEBUG_SHIRQ is enabled, as device
> managed resources are freed in the inverted order they had been
> allocated, priv->regmap was freed before the spurious fake irq that
> CONFIG_DEBUG_SHIRQ adds called the handler.
>

Fixes: 3af109131b7eb8 ("iio: adc: meson-saradc: switch from polling to
interrupt mode")
> Reported-by: Elie Roudninski <xademax@gmail.com>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for fixing this!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
