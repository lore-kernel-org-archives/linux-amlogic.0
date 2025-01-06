Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACD7E77198
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EITQxS7CaC1JaSj5iesAd5dpQzabAA80vFXRUHepgI=; b=f1rZKP5ZBKhaRh
	RKU5YoqiQK6pDMajTDqWHSgARmg7g/GFnUSumWsbrOi3wTUdAISxlgKFm7W4Wv3tjrrjpV/UlsC1U
	oBGcU+CVbHHR/f89Rd3ZPrWLr6iquRDbNVU/o/fv3h5+6fy0oLIi99ZW6fgQlDVVshI7SjKhBYwam
	Sl+Csr87NnsI6se1kPPKCbmZ+Dbu8qgYUteQ0RsCfffDGzeg7I65B7yeLeYcKAuVEk3PDwSSAIbKb
	Nx7vfMz+U/ualRJWmsmSqBfBhEQTrNtcwJ5rYFhk2sC4YUOSJPEqzuQOzWSspDzolFTW4FQsAf07D
	N9fl8bRR4Lc1VL6kfC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkc2-00000000uHc-47X0;
	Mon, 06 Jan 2025 10:45:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkbC-00000000u5V-17yO
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 10:44:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so16104235e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736160280; x=1736765080; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=URK3fgfuzCYj9ufRvcHXSc7DgTihX+ky3vmNQnZQfBc=;
        b=EG86uJj8QDgbHz3AIUn6bgtCBCMtRKLEPkw+0HRrifyFTsPbSP9EgbJPKv7e0yEUbe
         /XnCsg6AX3AIs+8MH8iYvSxPoqf1pUpqjXgqz+chzURCapiDN6Cj9p1uLivpgHreMz44
         NmX0wbLHofQcyc8ndD160qc8Zn/nkMKE7DoGi798MJZOWP/QGGx3hZ9IXB8Emo3nqYJv
         oUcJQ6ePNfcduoB7O9S9ZHOBGvmom+/g0dVN+Eh3GCD7IGTlJ2geTeQ6O8SQiedPfmot
         ICfkpbhWxcqTQryJjYCA6p9v7kwfgY6jFS71BS0r3y32iDUc19owBRhOoZS5MD8tyXFj
         1Vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736160280; x=1736765080;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URK3fgfuzCYj9ufRvcHXSc7DgTihX+ky3vmNQnZQfBc=;
        b=mYMuUNagripXBKrrzXCbLx+GuP0lKrPerSRXIBb3u7eX4D1/wGzcRSfJIUeG2T8m5k
         13+SP/kAsYkLNbPVTlrAcdKmWbtUV74A5birx+gHo7KHhpk6IDYp8VUmPZ65PYdorf9d
         QPMmiigs80Fx1NV541fadTx+KqZveBLpME6K9EWLNvhz3AWX9BV8K4rdeI6bVoWoyZuY
         7OC8FaOim64aGS5jQ+Dix9SUiwBlD6DQ+SSnbC3iUCWee5UBixyxMVKPOVOH+xn/Gmjv
         ePFocez6qUhDhw2ixq17KcEPwTuoNFL1REAL2XrGP6IAEuovZOrCb7nwRz7IVg98BHVK
         twWQ==
X-Gm-Message-State: AOJu0Ywd0lZoI6Po8Qdcr6s+OehNuUOEfuOWwkM3BpiJzzZJWLjEsrnk
	amGb7IT8bWwp/jDLHefmD+dPZoYclikoeiQVRdNP1lTmw+4I/GSuO3UMmpIz4Z0=
X-Gm-Gg: ASbGncsF0v3odNpeFw6Pvq3xGXqwDtKXpO4AMfFLTYGskZE8pq/M3g78eV97iRWApAm
	l1KHaGJX4qAzQNIpEHopCdz0om4yf9KeuBLzNiF2S3WllfXm4lkqL3vSN8dWNjEKksPLDX7lD6J
	Y1UrAMFc2GYu3hd0+OQ9KcAW3HzKng4Q7bubhh/+caH5nrXDlWiLjpfL8HX3ziueoR7R1Fj0EgA
	RApzG3rxw5hKQl4tUq0H7HyjPzYMUkgOnrYiXTbRWuoHak8pkXdYYiz
X-Google-Smtp-Source: AGHT+IHoY2q0XdnrpBdI9reTe90onfZ6dA7Pk+FthfP9lXA7CWjLaTCoOtDhHYEthX6HJnO2DBTxqw==
X-Received: by 2002:a05:600c:154b:b0:432:d797:404a with SMTP id 5b1f17b1804b1-43668b49976mr470611445e9.22.1736160280576;
        Mon, 06 Jan 2025 02:44:40 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219578sm569128335e9.20.2025.01.06.02.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:44:40 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dmitry.baryshkov@linaro.org
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
In-Reply-To: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
	(Martin Blumenstingl's message of "Tue, 31 Dec 2024 19:44:20 +0100")
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 11:44:38 +0100
Message-ID: <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_024442_370774_D35B17FD 
X-CRM114-Status: GOOD (  25.68  )
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

On Tue 31 Dec 2024 at 19:44, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> I am still working on a HDMI controller driver for Meson8/8b/8m2.
> HDMI output would be incomplete without audio.
> There's a great series from Dmitry [0] which simplifies the HDMI
> controller driver implementation by moving all the hdmi-codec related
> management to a generic framework.
>
> I tried integrating Dmitry's work [0] into my HDMI controller driver.
> While testing I found that hdmi-codec's .prepare() callback is not
> called at all and asked Dmitry for help [1]. All other callbacks
> (.hw_params, .startup, .shutdown, ...) however are called.
> On his board (Qualcomm SDM845, sdm845-db845c.dts) hdmi_codec_prepare()
> is called by snd_soc_pcm_dai_prepare() (core sound framework, not
> platform specific).
> However, on my Odroid-C1 this is not happening.
>
> Looking further snd_soc_pcm_dai_prepare() I can see that
> for_each_rtd_dais() has three entries:
>   snd_soc_pcm_dai_prepare(), dai name=I2S Encoder, id=2
>   snd_soc_pcm_dai_prepare(), dai name=CODEC CTRL HDMI I2S IN, id=0
>   snd_soc_pcm_dai_prepare(), dai name=I2S FIFO, id=0
> What I'm missing here is a dai name "i2s-hifi" (from
> sound/soc/codecs/hdmi-codec.c, see hdmi_i2s_dai)
>
> My hdmi_tx node looks like this (abbreviated):
>   hdmi_tx: hdmi-tx@42000 {
>       compatible = "amlogic,meson8b-hdmi-tx";
>       reg = <0x42000 0xc>;
>       #sound-dai-cells = <1>;
>        ...
>   };
>
> Then I have a "amlogic,gx-sound-card" instance with the following dai-links:
>   dai-link-0 {
>       sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
>   };
>   dai-link-1 {
>       sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
>       dai-format = "i2s";
>       mclk-fs = <256>;
>
>       codec-0 {
>           sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
>     };
>   };
>   dai-link-2 {
>       sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
>
>       codec-0 {
>           sound-dai = <&hdmi_tx 0>;
>       };
>   };
> So apart from the additional cell in the sound-dai towards hdmi_tx
> (Meson8/8b/8m2's HDMI controller has two inputs: I2C and SPDIF. I2C is
> the first one, hence &hdmi_tx 0) this is identical to
> arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts.
>
> I have further verified that the gx-card parsing does find the HDMi
> controller and links it correctly.
> To me it's odd that only the .prepare() callback is not called, all
> others (as mentioned above: .hw_params, .startup, ...) are working
> fine.

I think the problem you are seeing comes from the quirk of
codec-to-codec links. The hdmi codec link is such a link on Amlogic
because further digital routing is required after the backend.

Those type of links are not used much beside some
CPU offloading on Samsung and Amlogic, as far as I know.
It is possible, even likely, that things are still missing there.

So those C2C links are operated by the DAPM events, not the regualar
ASoC code. You can start here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/soc/soc-dapm.c#n3995

You'll see that .prepare() is not called, same as .trigger()
That should propably be fixed :/

Side Note:
While this type of link is not used much, I think that - fully
implemented - it could hold the key to proper DAI chaining ... possibly
allowing to get rid of DPCM.

>
> I'm not familiar with the sound stack and I'm hoping that you have
> some ideas on how to either debug or fix it.
>
>
> Thanks in advance and best regards,
> Martin
>
>
> [0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
> [1] https://lore.kernel.org/dri-devel/20241231004311.2574720-1-martin.blumenstingl@googlemail.com/
> [2] https://lore.kernel.org/dri-devel/l3u3wtnxyhrwjynevkwfjwarisc4yt4xy2rbzf5kb7k5l5dw3n@lxqtimymyjg6/
>
> [2. text/x-patch; sound-soc-soc-dai-snd_soc_pcm_dai_prepare-info.diff]...

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
