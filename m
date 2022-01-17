Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3DpmjyPgnIgA8mF8w/WrR/K42e0aGDJ1kMxVavUL76M=; b=TNszTZoKqCxvyObWDtlTn6GCTi
	1QVzSYTul66HGgKyVHQF3OcJUxfqUcj1L3/LjJvn4glaKZpMEPqBOcPlc7x6gig8HGoOnH6zTskBW
	fnC0TBLDnRk2Hti9JGBTLTYr0r2wcWK798jkpx7Z6G9Vj0BrF26amux7ggCcMpYpeO4iKD5CHiaI+
	TlqJuoqCz1VnsGPTqWrxskd7Zn7I4OPDMPpoSEgaaweWz86r5OqUPjj5hsR3QxwgK7OOkDVPPLCAW
	SXDrbRNzfuuS27UXMEG+3S8x0bjAQBlAWSAhyna+PKSn/JXjt4xkfR3CoaHyCk/9NzFHZkSnY3D8M
	hSoV5c7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9T90-00FD25-97; Mon, 17 Jan 2022 14:38:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9T8x-00FD0X-Dm
 for linux-amlogic@lists.infradead.org; Mon, 17 Jan 2022 14:38:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so23191723wmf.3
 for <linux-amlogic@lists.infradead.org>; Mon, 17 Jan 2022 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4vQvlRkBG8jyAFRkdJw5QqA+mnvGAb10rlLjyuN04xs=;
 b=QjEdn1V494YIOgy22qdp6vDH5BZPbC+l+4DyMdnaxhOsSomlH3tJ3xiazui+zjN3Zi
 yfy8cV03n9ak5nStGvMoXx4ezcKXinKQUvu2ibsFQbmAEZvtUEJSL26lWX+1bBACIFzj
 Kw7kaqcJ32ykROt5YjJ+EQQ0u1jT8rnn2Shgbnw7/N30GpIWtYDOgbjV86asy9fBM0Al
 m4ujK2sK+a1huYIOlrurQJyS+zEF1el0VI4xrkqmCFNkCQ5IKROkvdfOiksT2rarMBKp
 QyA9qCMCZDLcaTaMIPu4hK1BpRWOonYu5NYf1eB58VXO0lQ6Yz7YCCCcijaMH3bSvF8x
 7iRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=4vQvlRkBG8jyAFRkdJw5QqA+mnvGAb10rlLjyuN04xs=;
 b=wndRe8vzxUT2bdPMnDvDOZmjoxiOEux4iOKA2drL2u978SWwhJWRo/7L+ZfsFntKZu
 +n8ncw0qKJ0qeXQI5PDChNXxqqyW5GMV6FRlUM2UC19b5EP5fBCMX3aece8+pPlUSacu
 WYA/k03Y23/Hc9YmBWP1PI2Wi8QhE4fJRVVIp/jguzSIKfnovN+JcYuB5DBFFCncnU3y
 a5LJU/+jU5JDzfkNM+AyKg76pm44/0A/YGokRXBb1LIuhRdp/kx+R4H7rXghMy4Eevif
 IUubn1kHxwB53RqdSS2iCKK7VCXsYSG0W4TS9A7zXOULOw9UarL77aaCTTDq7MQmr+R8
 kzXw==
X-Gm-Message-State: AOAM533U7hHp2t9e9O4YWUZxBTsZgRTqZ+iiPl1kiWTuOeKfG0atz/4v
 Qbf8BKI49pC8/eN3HD7+LXOBes2P6XPzZg==
X-Google-Smtp-Source: ABdhPJwqlv7WG3XoYbvtpmNzZ7lMwU5e5dYWkiNHREnVczkvwGQlzQCCr5goFgi16xexqDTyavAgjg==
X-Received: by 2002:adf:f2c5:: with SMTP id d5mr19119203wrp.90.1642430277417; 
 Mon, 17 Jan 2022 06:37:57 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:c004:9fe1:fbda:2d0c?
 ([2001:861:44c0:66c0:c004:9fe1:fbda:2d0c])
 by smtp.gmail.com with ESMTPSA id j9sm14444458wms.0.2022.01.17.06.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 06:37:56 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: meson: add audio playback to P212
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220113044546.16856-1-christianshewitt@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <aa02e3f7-3f77-4b9c-74a0-987045de0352@baylibre.com>
Date: Mon, 17 Jan 2022 15:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220113044546.16856-1-christianshewitt@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_063759_511157_1B6EC8F8 
X-CRM114-Status: GOOD (  18.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 13/01/2022 05:45, Christian Hewitt wrote:
> Add initial audio support limited to HDMI i2s.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> The P212 dts is widely used with Android box devices that follow the
> reference design. The real P212 development board probably has many
> more audio capabilities, but as a minimum we can enable HDMI output
> and help box users too.
> 
>  .../boot/dts/amlogic/meson-gxl-s905x-p212.dts | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> index 2602940c2077..a39830379c74 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> @@ -7,6 +7,7 @@
>  /dts-v1/;
>  
>  #include "meson-gxl-s905x-p212.dtsi"
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	compatible = "amlogic,p212", "amlogic,s905x", "amlogic,meson-gxl";
> @@ -32,6 +33,45 @@
>  			};
>  		};
>  	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "S905X-P212";
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";
> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&aiu {
> +	status = "okay";
>  };
>  
>  &cec_AO {
> 

The P212 ref board has an analog audio output with a DIO2133CT14 amplifier unmuted by default with the active high GPIOH_5 to mute.

It's very probable all the STB boxes uses the same scheme, so it'll be safe to add the analog audio output here exactly like libretech-cc.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
