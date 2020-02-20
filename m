Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C432C11D0C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 19:31:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42C64208C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 19:31:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1QW6qxQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OGlPGfGU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42C64208C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0bpMZwX4Xh5+e52aiBbIOyU7V+R6fxrt6nUYtCtccnM=; b=Y1QW6qxQrYUgDd
	TeXuOFDUiJl5S/hf+32YXB+NDWg8aYGVhP1c0pXPGjwWi+rv2CU+RLzPXozmPpYF5wkTd9pVjKcko
	MndWkTijAwRz4akGSYtgG0+WxzLfiT2ektJ/bExKpdS8qZi1nQdNzcZq5z1P5+fiFrtXIBO0Ic2/v
	fRKAFJsLBH7Dv4pTSnJufISG4TNA+/tJnVbv55LZlDALmmmV/jskTRtQrQbppnVf4YD8OescMvZkr
	PFOb3sxiDYFG7Hnn4cfnHO+dNblzOK2tUnfwyrxylH3sGoHlAoW4oiPcRsZV2zgWlo0XAHcyjJ0gy
	sZWdLar4VY6EDB/GUaHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4rXx-0007cb-RL; Thu, 20 Feb 2020 19:31:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4rXo-0007UD-Et
 for linux-amlogic@lists.infradead.org; Thu, 20 Feb 2020 19:31:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id c9so5907748wrw.8
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Feb 2020 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=DYNEng+7zD6OFMtDudcYE3wzE2+5a/X4a0VlHsXEIpM=;
 b=OGlPGfGUSkgbEdmuMrVZ8vkKL75x5aaCabHCqh9VsD/lXRWghC/0VsZQQ14UVDhb9b
 nhQd2LWug7n9sjnJYZNBIXWEareEVbQpp+SFlXuslZtAx/UyfCvhMaMySFquuxJJz78u
 08iQcycCqNbQ/mDE4bfjDst4GaK0gFNINjk9J3FAs2c8xbdIAM1HdFTzhiDAuVEaGArX
 2YOeZn69T2YPAFkvRjOEZf+wpto+6H2Gj19FMRRCBACSSHD7e2MlEB3aCVMqf2L7MUbo
 5RzsioMu/RWUL02KFTR6MhtC55FAwmQIS9LIXb586m5O79RXO6L4pvvL9Vbz1SN+YC9y
 hWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=DYNEng+7zD6OFMtDudcYE3wzE2+5a/X4a0VlHsXEIpM=;
 b=FIy+q0avuqNv7K1SHA2kbtXqgrF9QUHmic3mnw7vb+T3pwo8MoF+A/jh3B/Sh8C9ew
 m9rf9zJgQIvG9ue96EjMmp0gwNzYXiQcwy/fVUMJfSReLxgbUSlz4HFP0m9ZGDshfJ/S
 eTW6zzJs4uPqY1PFuRBl4fgUMIcbUcBBSMvf0XuY0xhMJVNRoqun/CL+PGkt1rJvfZT1
 ykrW9C0m6auaJYB/12ALeRa5KoUJVxwCsHH31OmXh9V2D+gw87H31Bpjd031ifnK4mto
 qJj/qtQaA6MExf8s1nEyR2+OrPdzggy9Y1Urku6OqFE9V5fglVvN53OYiWbEQFO2q9/h
 gxtg==
X-Gm-Message-State: APjAAAUWsS00RN2PYYXlZyXppYRNlrIdpm/f4IWSbRhAD/VCta1uhJPp
 KmejuI26bgxqCLffcqbDfPxMxg==
X-Google-Smtp-Source: APXvYqyfBUkzQRvzomJyxmKwUibj1mCUwFcnnPjIXyXQXzSw/m4kvvVCRcxQZCJQ6hJ/ya6U+cn+MQ==
X-Received: by 2002:a5d:4f8a:: with SMTP id d10mr17579533wru.143.1582227087004; 
 Thu, 20 Feb 2020 11:31:27 -0800 (PST)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:3115:825f:fd46:f0e9])
 by smtp.gmail.com with ESMTPSA id w8sm433876wmm.0.2020.02.20.11.31.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 11:31:26 -0800 (PST)
Subject: Re: [PATCH v2] arm64: dts: meson-gxbb-vega-s95: fix bluetooth node
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1582220642-14133-1-git-send-email-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <c9d7d7a0-4dc0-8698-ed82-6c0b10990374@baylibre.com>
Date: Thu, 20 Feb 2020 20:31:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1582220642-14133-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_113132_494474_41CCF350 
X-CRM114-Status: GOOD (  14.46  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 20/02/2020 =E0 18:44, Christian Hewitt a =E9crit :
> This was missed from the previous fix.
> =

> Fixes: b07a11dbdfeb ("arm64: dts: meson-gxbb-vega-s95: fix WiFi/BT module=
 support")
> =

> Suggested-by: Oleg Ivanov <balbes-150@yandex.ru>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/=
arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index 5eab3df..45cb836 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -245,6 +245,9 @@
>  	bluetooth {
>  		compatible =3D "brcm,bcm43438-bt";
>  		shutdown-gpios =3D <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
> +		max-speed =3D <2000000>;
> +		clocks =3D <&wifi32k>;
> +		clock-names =3D "lpo";
>  	};
>  };
>  =

> =


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
