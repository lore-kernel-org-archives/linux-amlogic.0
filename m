Return-Path: <SRS0=3eID=6G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6C0C54FCB
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 13:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D4702076C
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Apr 2020 13:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/xA/YXL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mwkDvg8V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D4702076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAupOg8pqE0dIL7OylkdUFIzCJOaFO9TfpAJtGEVaNE=; b=c/xA/YXLNHSgBP
	kpT4RHy4zT5vP3MON+gVL3ntLG2QRlHlGmHkAWfCBwFTaA0WwA4R3ygxzKYoSD451kvOpACQ4ETMJ
	iDyhpjZtJe9iqYHKfWNh6jAo4ivtFbVKWNCUmdQkWDIMOUJGYhffZAfei4eFXwQ06MmhOR2COJu/i
	opbToGslCY++Bim4lqgNeNUYOY2eK3jBfLWgetP5oj5KLMA1KtpQhmkvaufqqI7QTfJVYZWpou477
	lB8ZusTpMod8iNpcRd0rH/c780meThcTvnSzjGZGPFmcni9jspqTRpXMCogPZwPFkNej+L34UnJL1
	N7g23yIvQntFWVfd8kHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRFBC-0005mO-TN; Wed, 22 Apr 2020 13:12:42 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRFB9-0005lI-I0
 for linux-amlogic@lists.infradead.org; Wed, 22 Apr 2020 13:12:41 +0000
Received: by mail-wr1-x444.google.com with SMTP id k13so2329291wrw.7
 for <linux-amlogic@lists.infradead.org>; Wed, 22 Apr 2020 06:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xXdwzm7fEPEAygXGOPm+jMFJ08BbsKOoo/tX0PFO0rU=;
 b=mwkDvg8V2GpYUtBo67XuG0BCb4mQRBuw8bOMXIFsfOuRwbMNJ38e8i/bIQOVQ6k+Jk
 xZwSwV8uVIRocZlKrRrWnGgv4GBlZrnn2EZmrtePVExNXZnS/BXe47ZMQ7gGPdmPkNAP
 eWR5o3wiTNxXh033V3wLMs/grGqvX3VR5cPNhlEGT1k6g05OIFTHC8+Onti1+aWp7fZy
 V+W2MpKBAn+qcof/P2sGn+YGP4eZlQ4mbnYgdefcRmWatQ7XBmSEPl3N4LUQ6aaY/Zzo
 Ca7lO1r8kYWMf9PblkISc5CzsK242XcIW438Zy2U5AUHyWg+sDwAkAVvmYyyApLVcL2y
 QyWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xXdwzm7fEPEAygXGOPm+jMFJ08BbsKOoo/tX0PFO0rU=;
 b=Tsnub8mK8F6r0UrFIhEh/GlLi1ZOfrnVFggIANT8Pwfua4ssjA3zsgmt1jb3bnB/pT
 1D9dFjCIFSpY1Jvxs0ZeZpQklig4m/opXP0AV93t6AWNQ3PwKUUZ/mPPjDd0k8xXOsrD
 QNffS7OW56wX8Nyv9TawV0+//CYObKy8Jkz7oZkfumSYRYTaubtJXp8LBApWL15wFdjX
 YxgO+DLu2fcjk1BgP2kCB2rvNFx/mehSP8dEZ9yqk+2MUMb+M9mBXOFOoX7IPxeAZs1e
 mHFCB01fdzJIkx4ofqydwF1w8/uuy7kAz/q5LxXiaKOMTWEZpvLvRnMiUjmXxxfOiwSv
 A2Zw==
X-Gm-Message-State: AGi0PubgmbPNh7OOESK78uzVUwOFCDEw/S0HvVs4IN37qwlRFgx9O3P4
 2Afatgy4MH6FOp7vx8KjOK1Ej2cJ858=
X-Google-Smtp-Source: APiQypLBQw6LI2fK5+PNkK6VKpczBcHJ5Mdm9raxuXDcR8HB/AWrKhJ2ToBDYyzOiPB9p8wwTeNFSw==
X-Received: by 2002:a5d:6b12:: with SMTP id v18mr32548041wrw.340.1587561156341; 
 Wed, 22 Apr 2020 06:12:36 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id e21sm8405318wrc.1.2020.04.22.06.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 06:12:35 -0700 (PDT)
Subject: Re: [PATCH 2/6] arm64: dts: meson-gx: add aiu support
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
References: <20200421163935.775935-1-jbrunet@baylibre.com>
 <20200421163935.775935-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwU0EVid/pAEQAND7AFhr
 5faf/EhDP9FSgYd/zgmb7JOpFPje3uw7jz9wFb28Cf0Y3CcncdElYoBNbRlesKvjQRL8mozV
 9RN+IUMHdUx1akR/A4BPXNdL7StfzKWOCxZHVS+rIQ/fE3Qz/jRmT6t2ZkpplLxVBpdu95qJ
 YwSZjuwFXdC+A7MHtQXYi3UfCgKiflj4+/ITcKC6EF32KrmIRqamQwiRsDcUUKlAUjkCLcHL
 CQvNsDdm2cxdHxC32AVm3Je8VCsH7/qEPMQ+cEZk47HOR3+Ihfn1LEG5LfwsyWE8/JxsU2a1
 q44LQM2lcK/0AKAL20XDd7ERH/FCBKkNVzi+svYJpyvCZCnWT0TRb72mT+XxLWNwfHTeGALE
 +1As4jIS72IglvbtONxc2OIid3tR5rX3k2V0iud0P7Hnz/JTdfvSpVj55ZurOl2XAXUpGbq5
 XRk5CESFuLQV8oqCxgWAEgFyEapI4GwJsvfl/2Er8kLoucYO1Id4mz6N33+omPhaoXfHyLSy
 dxD+CzNJqN2GdavGtobdvv/2V0wukqj86iKF8toLG2/Fia3DxMaGUxqI7GMOuiGZjXPt/et/
 qeOySghdQ7Sdpu6fWc8CJXV2mOV6DrSzc6ZVB4SmvdoruBHWWOR6YnMz01ShFE49pPucyU1h
 Av4jC62El3pdCrDOnWNFMYbbon3vABEBAAHCwn4EGAECAAkFAlYnf6QCGwICKQkQFpq3saTP
 +K7BXSAEGQECAAYFAlYnf6QACgkQd9zb2sjISdGToxAAkOjSfGxp0ulgHboUAtmxaU3viucV
 e2Hl1BVDtKSKmbIVZmEUvx9D06IijFaEzqtKD34LXD6fjl4HIyDZvwfeaZCbJbO10j3k7FJE
 QrBtpdVqkJxme/nYlGOVzcOiKIepNkwvnHVnuVDVPcXyj2wqtsU7VZDDX41z3X4xTQwY3SO1
 9nRO+f+i4RmtJcITgregMa2PcB0LvrjJlWroI+KAKCzoTHzSTpCXMJ1U/dEqyc87bFBdc+DI
 k8mWkPxsccdbs4t+hH0NoE3Kal9xtAl56RCtO/KgBLAQ5M8oToJVatxAjO1SnRYVN1EaAwrR
 xkHdd97qw6nbg9BMcAoa2NMc0/9MeiaQfbgW6b0reIz/haHhXZ6oYSCl15Knkr4t1o3I2Bqr
 Mw623gdiTzotgtId8VfLB2Vsatj35OqIn5lVbi2ua6I0gkI6S7xJhqeyrfhDNgzTHdQVHB9/
 7jnM0ERXNy1Ket6aDWZWCvM59dTyu37g3VvYzGis8XzrX1oLBU/tTXqo1IFqqIAmvh7lI0Se
 gCrXz7UanxCwUbQBFjzGn6pooEHJYRLuVGLdBuoApl/I4dLqCZij2AGa4CFzrn9W0cwm3HCO
 lR43gFyz0dSkMwNUd195FrvfAz7Bjmmi19DnORKnQmlvGe/9xEEfr5zjey1N9+mt3//geDP6
 clwKBkq0JggA+RTEAELzkgPYKJ3NutoStUAKZGiLOFMpHY6KpItbbHjF2ZKIU1whaRYkHpB2
 uLQXOzZ0d7x60PUdhqG3VmFnzXSztA4vsnDKk7x2xw0pMSTKhMafpxaPQJf494/jGnwBHyi3
 h3QGG1RjfhQ/OMTX/HKtAUB2ct3Q8/jBfF0hS5GzT6dYtj0Ci7+8LUsB2VoayhNXMnaBfh+Q
 pAhaFfRZWTjUFIV4MpDdFDame7PB50s73gF/pfQbjw5Wxtes/0FnqydfId95s+eej+17ldGp
 lMv1ok7K0H/WJSdr7UwDAHEYU++p4RRTJP6DHWXcByVlpNQ4SSAiivmWiwOt490+Ac7ATQRN
 WQbPAQgAvIoM384ZRFocFXPCOBir5m2J+96R2tI2XxMgMfyDXGJwFilBNs+fpttJlt2995A8
 0JwPj8SFdm6FBcxygmxBBCc7i/BVQuY8aC0Z/w9Vzt3Eo561r6pSHr5JGHe8hwBQUcNPd/9l
 2ynP57YTSE9XaGJK8gIuTXWo7pzIkTXfN40Wh5jeCCspj4jNsWiYhljjIbrEj300g8RUT2U0
 FcEoiV7AjJWWQ5pi8lZJX6nmB0lc69Jw03V6mblgeZ/1oTZmOepkagwy2zLDXxihf0GowUif
 GphBDeP8elWBNK+ajl5rmpAMNRoKxpN/xR4NzBg62AjyIvigdywa1RehSTfccQARAQABwsBf
 BBgBAgAJBQJNWQbPAhsMAAoJEBaat7Gkz/iuteIH+wZuRDqK0ysAh+czshtG6JJlLW6eXJJR
 Vi7dIPpgFic2LcbkSlvB8E25Pcfz/+tW+04Urg4PxxFiTFdFCZO+prfd4Mge7/OvUcwoSub7
 ZIPo8726ZF5/xXzajahoIu9/hZ4iywWPAHRvprXaim5E/vKjcTeBMJIqZtS4u/UK3EpAX59R
 XVxVpM8zJPbk535ELUr6I5HQXnihQm8l6rt9TNuf8p2WEDxc8bPAZHLjNyw9a/CdeB97m2Tr
 zR8QplXA5kogS4kLe/7/JmlDMO8Zgm9vKLHSUeesLOrjdZ59EcjldNNBszRZQgEhwaarfz46
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <63b05930-4814-f8f9-d1eb-2bd487ed3406@baylibre.com>
Date: Wed, 22 Apr 2020 15:12:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200421163935.775935-3-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_061239_650714_254C4521 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/04/2020 18:39, Jerome Brunet wrote:
> Add the AIU audio device to the Amlogic GX SoC family DT.
> ATM, this device provides the i2s and spdif output stages and also
> the hdmi and internal codec glues.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 13 ++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 23 +++++++++++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 23 +++++++++++++++++++++
>  3 files changed, 59 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 03f79fe045b7..a8dc8f810253 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -278,6 +278,17 @@ reset: reset-controller@4404 {
>  				#reset-cells = <1>;
>  			};
>  
> +			aiu: audio-controller@5400 {
> +				compatible = "amlogic,aiu";
> +				#sound-dai-cells = <2>;
> +				sound-name-prefix = "AIU";
> +				reg = <0x0 0x5400 0x0 0x2ac>;
> +				interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
> +					     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "i2s", "spdif";
> +				status = "disabled";
> +			};
> +
>  			uart_A: serial@84c0 {
>  				compatible = "amlogic,meson-gx-uart";
>  				reg = <0x0 0x84c0 0x0 0x18>;
> @@ -626,6 +637,8 @@ hdmi_tx: hdmi-tx@c883a000 {
>  			interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +			#sound-dai-cells = <0>;
> +			sound-name-prefix = "HDMITX";

sound-name-prefix is not a valid property in Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml

It should be added.

AFAIK sound-name-prefix is not present on g12-common, is it missing ?

Neil

>  			status = "disabled";
>  
>  			/* VPU VENC Input */
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 0cb40326b0d3..234490d3ee68 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -60,6 +60,29 @@ usb1: usb@c9100000 {
>  	};
>  };
>  
> +&aiu {
> +	compatible = "amlogic,aiu-gxbb", "amlogic,aiu";
> +	clocks = <&clkc CLKID_AIU_GLUE>,
> +		 <&clkc CLKID_I2S_OUT>,
> +		 <&clkc CLKID_AOCLK_GATE>,
> +		 <&clkc CLKID_CTS_AMCLK>,
> +		 <&clkc CLKID_MIXER_IFACE>,
> +		 <&clkc CLKID_IEC958>,
> +		 <&clkc CLKID_IEC958_GATE>,
> +		 <&clkc CLKID_CTS_MCLK_I958>,
> +		 <&clkc CLKID_CTS_I958>;
> +	clock-names = "pclk",
> +		      "i2s_pclk",
> +		      "i2s_aoclk",
> +		      "i2s_mclk",
> +		      "i2s_mixer",
> +		      "spdif_pclk",
> +		      "spdif_aoclk",
> +		      "spdif_mclk",
> +		      "spdif_mclk_sel";
> +	resets = <&reset RESET_AIU>;
> +};
> +
>  &aobus {
>  	pinctrl_aobus: pinctrl@14 {
>  		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index 259d86399390..d9f00c5a9a5c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -49,6 +49,29 @@ crypto: crypto@c883e000 {
>  	};
>  };
>  
> +&aiu {
> +	compatible = "amlogic,aiu-gxl", "amlogic,aiu";
> +	clocks = <&clkc CLKID_AIU_GLUE>,
> +		 <&clkc CLKID_I2S_OUT>,
> +		 <&clkc CLKID_AOCLK_GATE>,
> +		 <&clkc CLKID_CTS_AMCLK>,
> +		 <&clkc CLKID_MIXER_IFACE>,
> +		 <&clkc CLKID_IEC958>,
> +		 <&clkc CLKID_IEC958_GATE>,
> +		 <&clkc CLKID_CTS_MCLK_I958>,
> +		 <&clkc CLKID_CTS_I958>;
> +	clock-names = "pclk",
> +		      "i2s_pclk",
> +		      "i2s_aoclk",
> +		      "i2s_mclk",
> +		      "i2s_mixer",
> +		      "spdif_pclk",
> +		      "spdif_aoclk",
> +		      "spdif_mclk",
> +		      "spdif_mclk_sel";
> +	resets = <&reset RESET_AIU>;
> +};
> +
>  &apb {
>  	usb2_phy0: phy@78000 {
>  		compatible = "amlogic,meson-gxl-usb2-phy";
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
