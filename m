Return-Path: <SRS0=Q/al=QR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A91C282C2
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:57:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F57820863
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Feb 2019 10:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BGHj3DpP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="U8m/duy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F57820863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	MIME-Version:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GUEyxMHI+VQ1LByXBgpRMBzggk5gfzcH8maFEcKw36Y=; b=BGHj3DpP/CaWoz
	Z68OXChv7qM0mK8cFN8sTtgvZPZiFq2yGLKQsmTpZDPuUS3p+IZNkV8Lxo6tPkPVFBAWHkqP9M+0U
	1waxs+/L9FpH/ypHgGmHcBpkBmVbGis8xTC8zC8qRF+E5KN2/o5JIvi09mFbWPVr52c8ysAzi53BZ
	+faoM70kvvpTgje4hPCCt4JPDaR7DXJ8fcynKedZqN+PRDM9GrT2cPjpZHbtJqVjjQvcHwe/UoXDv
	/bIkBk0zG4go1C6MGDJLSvL/VA7BC6x0JRVhX15kxcD+ZbXeLujqwnd/rv9NgoZofY7W1brdx2sTQ
	ymQt1XARxs5kDFWuBaug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsmnw-0000Bf-66; Sun, 10 Feb 2019 10:57:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsmnt-0000B2-Sw
 for linux-amlogic@lists.infradead.org; Sun, 10 Feb 2019 10:57:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id x10so6058614wmg.2
 for <linux-amlogic@lists.infradead.org>; Sun, 10 Feb 2019 02:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:from:user-agent:mime-version:to:cc:subject
 :references:in-reply-to:content-transfer-encoding;
 bh=bL53ccFYg2o18JIG+H4Z3TItp8QKfCnm04mqw0DTumM=;
 b=U8m/duy06hjnME/XCippTTlf0nljfERLpKebyze+sgKrwWJ4oGJ59C8lDG+3HtERH+
 ko3NVWHS1HUsRkeak3Wwk+WpysX4ITHIVPkqvg/DAC4iiKTYV+26br9lRVj9/F1rJ+3W
 lEe9fcPcige3WU+bd2aHlpcbSTtnZJ3jxy5fvWn1zRZeE9NjPlA2lSmGWUPD2xLBpV4K
 KtbfRwWJBoBYcNNEAYxO9vnzUY03FvgwlNKgHREq/qrtgrx931MSEOYuU0qzEhbbFW5L
 s6gS1R8NjDlE7S8vjwf9/Nr1Kh1FlPW+nMXxk6g379HqYWvkqoF2y9czcpKkaQuTkcwN
 O7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
 :cc:subject:references:in-reply-to:content-transfer-encoding;
 bh=bL53ccFYg2o18JIG+H4Z3TItp8QKfCnm04mqw0DTumM=;
 b=hDVp+/+ecNhmy2yho3BD5QXGdNOYnm7Kzi9ppUWgQKtSlZc5APZuXKHdkINsH9RliW
 Ua4CDdkTRPSq4M+UkNFXP1ZR44mHaKt5l4bHiq8VKxft+2I2LNWEaoEIw+qVuWsXkr1w
 G0cSN6xJgUD2aEEcK/BwN18lPAgM0/lvmWUY2FqkPT7alB/jItv/qse0yAJzmNn8H2Wm
 /tSzhXfTT57N94qjGb6hp17aM5BGUAwB7fcg1WNPT/x9NgiWt5x1UHaIAPbMNtwgffn5
 tUiF4xi0PoV+Hh1exRplAeECCd+mJPCHqDRMzDz6IkVyLGP3ngryzT9emzHiaCuBdX+Z
 CPCA==
X-Gm-Message-State: AHQUAuYAW8QiiuvmCAxGJ1QmYZUVk0z7zBp8Ln0VMcjEvcRCXVdpJCEM
 Nq/Vd+Pc0pzR//62wmemqOFBrA==
X-Google-Smtp-Source: AHgI3IZxTUlkCnrreqKuPXdGZy7tBs/HyH/At9cCxqjpL3Oe2U+QuKdJTj/yyjEdl+FIfA6vF2M8Bg==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr1384922wrx.243.1549796260348; 
 Sun, 10 Feb 2019 02:57:40 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id s3sm7595606wmj.23.2019.02.10.02.57.39
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 10 Feb 2019 02:57:39 -0800 (PST)
Message-ID: <5C6003A2.1000301@baylibre.com>
Date: Sun, 10 Feb 2019 11:57:38 +0100
From: Neil Armstrong <narmstrong@baylibre.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13;
 rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Wen Yang <yellowriver2010@hotmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/4] media: platform: meson-ao-cec: fix possible object
 reference leak
References: <HK0PR02MB3634925866F426F86DD213BDB26A0@HK0PR02MB3634.apcprd02.prod.outlook.com>
In-Reply-To: <HK0PR02MB3634925866F426F86DD213BDB26A0@HK0PR02MB3634.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190210_025741_948758_B351ABC0 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-media@lists.freedesktop.org" <linux-media@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 09/02/2019 03:52, Wen Yang a =E9crit :
> The call to of_parse_phandle() returns a node pointer with refcount
> incremented thus it must be explicitly decremented here after the last
> usage.
> The of_find_device_by_node() takes a reference to the underlying device
> structure, we also should release that reference.
> This patch fixes those two issues.
> =

> Fixes: 7ec2c0f72cb1 ("media: platform: Add Amlogic Meson AO CEC Controlle=
r driver")
> Signed-off-by: Wen Yang <yellowriver2010@hotmail.com>
> ---
>  drivers/media/platform/meson/ao-cec.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/media/platform/meson/ao-cec.c b/drivers/media/platfo=
rm/meson/ao-cec.c
> index cd4be38..8ba8b46 100644
> --- a/drivers/media/platform/meson/ao-cec.c
> +++ b/drivers/media/platform/meson/ao-cec.c
> @@ -613,18 +613,25 @@ static int meson_ao_cec_probe(struct platform_devic=
e *pdev)
>  	}
>  =

>  	hdmi_dev =3D of_find_device_by_node(np);
> -	if (hdmi_dev =3D=3D NULL)
> +	if (hdmi_dev =3D=3D NULL) {
> +		of_node_put(np);
>  		return -EPROBE_DEFER;
> +	}
>  =

> +	of_node_put(np);
>  	ao_cec =3D devm_kzalloc(&pdev->dev, sizeof(*ao_cec), GFP_KERNEL);
> -	if (!ao_cec)
> +	if (!ao_cec) {
> +		put_device(&hdmi_dev->dev);
>  		return -ENOMEM;
> +	}
>  =

>  	spin_lock_init(&ao_cec->cec_reg_lock);
>  =

>  	ao_cec->notify =3D cec_notifier_get(&hdmi_dev->dev);
> -	if (!ao_cec->notify)
> +	if (!ao_cec->notify) {
> +		put_device(&hdmi_dev->dev);
>  		return -ENOMEM;
> +	}
>  =

>  	ao_cec->adap =3D cec_allocate_adapter(&meson_ao_cec_ops, ao_cec,
>  					    "meson_ao_cec",
> =


Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for the fix !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
