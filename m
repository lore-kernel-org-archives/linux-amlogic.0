Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3023AC433E4
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:48:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F00C42177B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYFIs6x2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BhMPO6/9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F00C42177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DC41s1LGKT78tZ9OI9uEHl0dqg1w/rX/wagOAxqDvx4=; b=qYFIs6x2ds5VdyNeZmIkqGEUeT
	VQyhzqm9fLofQd/y78jNjNMDLpjCFcW6rYpYKAdtH3pTP6W2tcOVZuPWKPK/ns1i8THLbROUjMi+l
	dou+D/W0UxeL/wDXnt2jZGTfgBfgfqo+xxrA22sdSQVrWKu12UdPY0N8cOBebEy1h7qnqiun0Stfi
	lcHDOPZQy3rNj7+UgN9WFQmX71+efrAjiKjOj39EwxaEpcP3W8gwd1dHbnHHH14phUv9Q0uXYDaM0
	0SdYwE6F2o08dob17dXKhJO8LNtEiNOjDdrjndHjmRI+qRxR+DuPn7o9wWHDmKDEM8TaNs9N72PRh
	fXDjFMrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwiWO-0005H2-F2; Sat, 18 Jul 2020 08:48:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwiWL-0005FU-2V
 for linux-amlogic@lists.infradead.org; Sat, 18 Jul 2020 08:48:37 +0000
Received: by mail-wr1-x442.google.com with SMTP id f7so13407056wrw.1
 for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2020 01:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding;
 bh=BjhOckuzjQ8qA75c221JxO7XJtdarvNGL84ItYCWCv0=;
 b=BhMPO6/9G8wcxqz03YbmYYe/ndNtetAFO8a9Nx1XnyNOd0DDSBgR4SPJ3F2BqOgEOH
 r6i64c8vNlLEwNuvtbj6qKL0rV4hr5KXaEi40lJ45Nq05z0OaG2oVroJQv5fCJUCR5U+
 +PfGmmAXnm03NUWLQx1tJFLDhd70zUzHJJkacc9c1FL1+Hc5NiQO40kjt7uUqNTE65eN
 gjuEDgOsI/Kjd8PWXxtqdySW8DgcHg2agIHhxrVHX/XhGK7Oa8DbQ0GUQGOBYGUP1njC
 4tGWi49W4Oqnale+QiNfsCM0qi+oJF6bcV/gIUMHXJB2SEzCfFSZ4mq8rkUfFrntdKG3
 79Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=BjhOckuzjQ8qA75c221JxO7XJtdarvNGL84ItYCWCv0=;
 b=VUPqxEoUJoYD7GJszL6e4x5Eg03lV1Xkmy87svcGCQLXROHYK2PqKYbD20UTL/Eoc1
 VPdgLzCwhm6I8gaTpHmurkzHJEKbmBthjoRUoe/TuooMiY73K4Kh9OwmIThfOVeAZHvB
 1hhJjBa4JA3WxR5cvDk0178c4oJY4gr4zPR0m1Dtu6jt7EJ3bcjXvYg7f8o4mS0t/uia
 /WscM5Gjgj+D1bXt34FgETfgdPj5PrOrp4QnN+LjFo6iKBBAsWGaGUdo5URByzg0M8uE
 UfFi82CXA2JrblUd5HoZh4MmrFN9NKQpZ1TleiPFp2uluGsepDfya0jbL9FvNCtQjaZR
 EF7Q==
X-Gm-Message-State: AOAM530LPmw+vDq6DkoIWQRTGO5/nakCW8yCnvIGPkF+hv38D7TbrcKy
 N4aXE6g/b48V1WzkmsAHPxy2kg==
X-Google-Smtp-Source: ABdhPJx/Kazr2a2GBlOYCPRTxUJoU9hxnfl4aBe6j1HembJqBpTiqWfE52+z9kxOmbbOyQYIVrVhMQ==
X-Received: by 2002:adf:a4c8:: with SMTP id h8mr118367wrb.262.1595062115944;
 Sat, 18 Jul 2020 01:48:35 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:9d0:bf63:799d:4aa1])
 by smtp.gmail.com with ESMTPSA id k131sm19391018wmb.36.2020.07.18.01.48.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jul 2020 01:48:35 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: update spifc node name on Khadas
 VIM3/VIM3L
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20200718054505.4165-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <a3b745d9-c73e-b56e-5b94-6c79f2197bc4@baylibre.com>
Date: Sat, 18 Jul 2020 10:48:35 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200718054505.4165-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_044837_142493_0DD90D7A 
X-CRM114-Status: GOOD (  16.67  )
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Le 18/07/2020 =E0 07:45, Christian Hewitt a =E9crit :
> The VIM3/VIM3L Boards use w25q128 not w25q32 - this is a cosmetic change
> only - the device probes fine with the current device-tree.
> =

> Fixes: 0e1610e726d3 ("arm64: dts: khadas-vim3: add SPIFC controller node")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/ar=
m64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 27408c10a811..6b75157265e1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -360,7 +360,7 @@
>  	pinctrl-0 =3D <&nor_pins>;
>  	pinctrl-names =3D "default";
>  =

> -	w25q32: spi-flash@0 {
> +	w25q128: spi-flash@0 {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <1>;
>  		compatible =3D "winbond,w25q128fw", "jedec,spi-nor";
> =


Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
