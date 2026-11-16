Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25B4606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2026 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LsO7JbeM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZkBISZgo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=chzLwkOQffxDhZlwfoMdmuJCZCq3CmV5MUn49JtroVc=; b=LsO7JbeMZkpBw6K3PCZDelWkHq
	sAIY26jrgIyXCHQKzrJGwAoor3BIh+XzZJHV2eVewMgOzy2UaQPyU74W4sX9L4yfZj3Oun6y6HcUm
	OMjlBRzt5yvB7MEMAXlNNJloHX7RINzgMFM6SrSh79Og74vT2OeD/+jALXaKCDPh09vlKiTNJ09Kg
	OGh8H8sm+hqs0q+rbVaJkdb+ByDVhxc4ixZdQqrgVcgoUZSsqwDzO6+1MVJ/EiFzX7WOB17GYQfJV
	ZP3Iaxg5Rs7mJuf8vhxsUfBvZov3Bz8WZdKDMnvtffVRBU7ElzMtugNLSD9rnoGXYIOTxAR1u8njf
	pGBPE/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT57f-000000042x8-2Zrc;
	Mon, 16 Nov 2026 22:24:23 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT57c-000000042w2-1xOB
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Nov 2026 22:24:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb606491faso13718985e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2026 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794867859; x=1795472659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=ZkBISZgoMZ1xdbpw2IQa5GAwYHSo7s5Wf3uudXSSbcUkVDBG2U59RdcUq0M5PylNhU
         5z6MEiwzND5XLKCC+mVWk4DGtenRuwDs16+tw2LxSpNidzjZF+I6jurBdr0a1vRwD7YH
         NumWxNpOWQVYpqoNS7VZonVak+CfmbBO+fT6Z71/7JP/XKZw36xOQ2N8s07kHqenslD4
         ll9wuwlcGNwUPQUpaf3xdr+3gDIx/Si4ShJnpQRfqaImdEv7W6flJUfT+EVcvCbMbf0d
         zUem/gog9iP/+62yT1qUT42kWqkfUbdICJFulws9E7eJXKh46L1j2GHOHaz0ECY6nqYC
         I+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867859; x=1795472659;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ln1EVdAGOFluUL+4qX0wySLdavyI3EeHq5qaZG2vFtM=;
        b=PWWEmsnXIF5+kJ3ZJr9LcyIDCe3IA5gs0IphOM4wj0VVIP9ncuT6mis72r26aX8GDo
         T5/axniskpA3D0BrvYDF8RRD5uU/gQF3+uCwYJBAdkG6D7YSY4c2fBOPgUqdSHZzUlAx
         P8OCsyaFnhfkmWcHH4C0wkGJfUkgvUavVhwUqMC7DMShqhTJLtnMRJl1q77zSXjcDQQ/
         2Crt/sjr5pFrnzMjDukk7Q6sjq62by09+KEYK04s6zyCHVVNHMSQPD1KWzwD4CUzkxlk
         5gdpxziZ6ywn0aWnv0E6Ey1L+aUzOho8R/1lw39/YLwL6+XAWBojUFFt4PCp8s7FVRlY
         ar+A==
X-Forwarded-Encrypted: i=1; AL+hErFUZjxGfTh31c7cwFvMC6hCIYhGRWlzbPYkiOjTszjgE85p7+uJ20a1o6PNfdEfrQUebhr5ONJQvTffr6MZ@lists.infradead.org
X-Gm-Message-State: APuU4Z+o3l1H+aNORF8gbcA2L0/PM4ljBv0Ap3FfOhPaKAT4kDXhRbVb
	Cl9Eh2mgsxMCK3Hb9jtQ+Mfq581Lx1TOp1sYwrPX1UAQ01EFpZHaiqzKjXVPobtEJlM=
X-Gm-Gg: AYBFou2txyiUnXw90ikEmGqEysiXCOMxdOPMuijSMZWoyAuEtJshQr3ArHZm6DZhUzC
	qto7aLGm0m9hPWUhydpK/r7/ybPbfP2obki64jxR4zuTHYIk7/RkdSSO359Mx9rWm2HGmf/YvO7
	PiXHGvbzccCO4l8s58fLZ1M+9lova664eovLS6f1vu7lO+4CE54aVG9VqfVkOtGaF0BsFY5+gvc
	ejjtClNYqoLTFP/nuJgWPu0K3daVoTkxVOyUUjx+E1ow0Qsx3fcOXN0saFknCaUkY70K//vdeCP
	mApBs1nd4IVDwLjPMMB9IchC7zPf+lro6uJwPKzLmcYeW3X/A5yuv7ZU5yuKasOHrh/bJqPidMO
	BLKiemEZ+4z0dHxuQ5AALBWTSLKN/odvBPbu4SPQASe2fiK7Taf2h7BcxiglZSp9IJCcAQOgfnd
	sfOdqyNhmqN6Pb2LzmjPJRwUXXDvtgm83Jo0RV2WmAs0PKCLy4tvtlRkGIUvKkrr7K7XRJAjjN+
	bSIt95haWwhbA9tJU/faeDoBS1wCnLsNBr+VWwFb4PPfOvHAmo1KHDkgIJSTUqeGmyjJGBS3MUX
	bpfbw+d2WRRPZW9LzUm6+jZop/mI92xU2VjgqMNmo9wZkxk3zWW3GA==
X-Received: by 2002:a05:600c:4e43:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb559f24ffmr251632055e9.1.1794867858617;
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm18143055e9.11.2026.11.16.14.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:24:18 -0800 (PST)
Message-ID: <71ede0e6-7f8f-4594-ae56-5be10f9159a3@baylibre.com>
Date: Mon, 16 Nov 2026 23:24:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: add amlogic,gxbb-audin
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261018-audin-v5-0-4b8cc13a1b22@baylibre.com>
 <20261018-audin-v5-1-4b8cc13a1b22@baylibre.com>
 <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCC+-N8LvoXZwMhoxjOzXgoYUfDKCcvmD7Uuph5=hTSg7g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_142420_535335_FC511D0F 
X-CRM114-Status: GOOD (  28.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Martin

 >> +properties:
 >> +  compatible:
 >> +    oneOf:
 >> +      - const: amlogic,gxbb-audin
 >> +      - items:
 >> +          - const: amlogic,gxl-audin
 >> +          - const: amlogic,gxbb-audin
 >  From what I can tell it's even amlogic,meson8-audin compatible.
 > Although I didn't have the time to test in on hardware yet.
 >

Thanks for catching it!
Any testing is more than welcome. I don't have that board at home and, 
based on my quick search, it seems not super easy to find one these days.

 > [...]
 >> +    audio-controller@a000 {
 >> +      compatible = "amlogic,gxbb-audin";
 >> +      reg = <0xa000 0x148>;
 > I believe the audin registers are 0x300 wide.
 > Both, GXL datasheet [0] page 43 and GXM datasheet [1] page 48 claim
 > that the register area is 0x100 wide.
 > The last documented register with AUDIN_ prefix is AUDIN_FIFO2_PIO_RDH
 > = 0xb8. The datasheet [0] (page 395) lists register numbers divided by
 > 4, so to get the actual address in the memory map we need to multiply
 > it by 4, which gives 0x2e0.
 > The 32-bit SoC vendor kernel [2] has a header that states: #define
 > AUDIN_ADDR_END 0x28bf (same as in datasheet, we need to multiply this
 > by 4).

I know that the register layout in these SoC is a bit messy, so let me 
explain how I got to the 0x148 that I wrote above.

When working at this driver I used the S095 and S905X manuals that I 
found online, but based on the link you shared for the S912, I would say 
it's the same when it comes to AUDIN.

Using [0] as reference, the highest register being mentioned in the 
AUDIN chapter is AUD_RESAMPLE_STATUS whose offset is 0x304 (i.e. 0xc1 * 
4). However I noticed that before that there are a lot of registers 
whose name doesn't start with AUDIN_, but rather with AUDOUT_, PCMOUT_, 
PCMIN_.
The first contiguous block of AUDIN_ stops at AUDIN_FIFO_INT which is 
0x148 (= 0x52 * 4). The other AUDIN_ block you mentioned is between 
AUDIN_FIFO0_PIO_STS (at 0x2c0) and AUDIN_FIFO2_PIO_RDH (at 0x2e0).

 > I'm bringing this up because dt-bindings are supposed to be complete.
 > So even if the driver doesn't use a resource yet we're supposed to
 > still describe it.

I perfectly agree with this, but at the same time I thought that 
including registers which potentially do not belong to AUDIN was 
dangerous in the other direction, i.e. we cover a too large area that 
will be hard to use in the future if/when we want to use it and we 
realize it's really not part of AUDIN.

 > I don't see any additional resources that we'd need to describe and
 > #sound-dai-cells allows adding the additional SPDIF input later.

That's exactly why I cut the range at 0x148: that seems to be enough to 
implement what we need for I2S/SPDIF audio input.

Honestly I don't understand what the second range 0x2c0-0x2e0 stands for 
as it's not described in the manual. For sake of curiosity I just tried 
looking into the Hardkernel kernel for Odroid C2 [0] but I didn't find 
any usage of AUDIN_FIFO0_PIO_xxx registers.
So my question is: are we sure we really need them?

[0] https://github.com/hardkernel/linux.git - branch 'odroidc2-3.14.y'

 >  From what I saw in the registers there's also the possibility to send
 > the input signal to AUDIN but I couldn't find any additional resources
 > we'd need to describe in the dt-bindings for this.
 >
 >
 >
 > [0] 
https://dl.khadas.com/products/vim1/datasheet/s905x-datasheet-v0.3.pdf
 > [1] https://dl.khadas.com/products/vim2/datasheet/s912-datasheet.pdf
 > [2] 
https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/arch/arm/mach-meson8/include/mach/register.h#L2274

Best regards,

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
