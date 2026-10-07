Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CACA5FFF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2026 08:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i16IjQk+kO2JQjvgnFkRr8ZxF9DNLmRi4yrs/MFBe3U=; b=rfOj0Ht1qaxsm2
	/XdTc550UdXI4E0kQyf2Qqt0mYm1TuZJGCh35egUToF4snIKkslZUOcoZcX0256gkuougUXZ1Du1d
	bZJBFmr56Chf/+ZvkwGeUqQ2ZvXX2gp8TVOJUz56Puhs9CP4fMjT+QBlW1CSwXYSaufsUT8QDHk1S
	ZrTMulkxgi36PGIBgGx2kL0u3zAhydZmjoa2S3clU3iXIfHzGaVcl4Fl3INhR0lAweP1Nq2u1Y9Cv
	gYM/02IOvI65MavF7H1ZVOVt8074bMcicIxRDKF4FJuqweDBrRWi4FBPmfE9TcaKF5ioJouN8ER0D
	ZSI023H+1ojCmpzqKJAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENQ9-000000020DV-2QDV;
	Wed, 07 Oct 2026 08:54:41 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENQ7-000000020Ck-1Q3V
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Oct 2026 08:54:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so23634565e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791363277; x=1791968077; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=pntPCEfNK4GaVYuspLRt5yI75lQN0NkHicC2ZVoL/q3JEzZ11stICqYdvz7zyF8EFm
         TvptHE746gaSTP5NPgADnqiDD2qBtKGMGIm1sbO8MoEb4RvdaS4B/smgdfj/5cb6Gv6Q
         LD9F8wWOgPaaeJ65u4jrxQJPUv/Ck3dukO8XA3Myz8ZbInT3W7fuR8wHzdcsTc4aP/eC
         uIad8SvqbWfDFc9tkM1hPYDT4Vme+g08sF5QcRqXt+ZDKFk0CkVqWsFPyIFDhrGsIB6t
         qwVrSntW3i7iR+rzHc0W4LI/vMiRxZE9x0kkybAQLkUsVvetUBIei8TFxrVS9tFJudqf
         63Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363277; x=1791968077;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hBz2qXMgWojuZvA+gqIdsYCtSC6xw/yhzsi3Z9qc1oU=;
        b=ViGzmKVekfeLZAYWxw4LzzFfbS4JslJkhlDs+6WEJTOTFn2Oa94VjfB+WQ+rcSwZzx
         pzaTPoWrFEynXBx//KzODuw5yeC+ftzt3eD7kc5pgfSN9l8bojexlAjAMdiElaEyeDJ2
         zUc5W9crXePHZwKbd3OD184GHDY9Xc56Vy3QIckTMLIMC1pzTAJt+eNFdhdRQTUksBUl
         hHXwKk9NUgCkQr7tKdhr1hi3ciN1Zt9BPx9WKSGtMAiEY/XX3FNXyOj30j6OnxdMSx6J
         kQ8JTY40OuMNfqCGHgsTk5mcf6e3Op/x2JO+aXNkmPZKPk76qhmBailY7mkK9gMQFknB
         4COQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1bnzO5wmPsWfWdPitKkaItd3qUjOq8Misc7rmoxPRb/rTpJ7/C0A9pQ/2sab8HdDSfVcowrWlnIsEq9CA@lists.infradead.org
X-Gm-Message-State: AFuF++lNloFn9WRATk7WZfsvtqAD9+/SOfjBeUqGummrlOi6AJA7Jdgr
	ADF72+GymzmDkgpZKnwMhZpcCtOrRC3No0Dh61DQi2Z6XkkHackt92Qe5HvaHA9XXxI=
X-Gm-Gg: AYBFou3seKokNjxk8ITuf3rbt5TOwgQQIIOdZyMensqHW/fYGiYnndcNUVJ6qsYYV9w
	NUGJ5NDJ49C3wzTrzvqr6vEs+pw3h/h70PhHMcBrO2m3Fyh3XZzuB5irCmIiQfXb6rDMfCftfnh
	8vAwFqNmHieawfjHo7QdXcKz2RkC0z4iJ6eLe8vyR5IQ/83OOpgHsttO34adUAd6RjQqvy8uEpz
	c4dHdo7WHTYj1bTlFkXqKg71rUgjsCzaj4543l0/tHfnMcKO5Bu4Kz5H+vAsPV7NjpjdJO9c5Jf
	yo2iA9FE8nxgx43cNb8ph/UA9NlvdUDsJFmohCPRfX99YpWbNTgwhT1TGi/3JKE/EVua0CeQy//
	wMNQ7beIV6OSQcMKkISkbuDgP20K33neKuYmSpKOUjeW7ZZqRjCqFxkla+WLs0DbU/6pFlLCHHV
	1cvLwR6IHrMyY15Pd2mW7XY6hNtrgfEu5+9oBhXH1ig8USzVlrIU3j4rFHurHU/LUwSd4JDXuSR
	a28CNDyw41GJOI=
X-Received: by 2002:a05:600c:1551:b0:4a0:263c:704f with SMTP id 5b1f17b1804b1-4a1804436c7mr20240445e9.16.1791363277470;
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5df75sm119201005e9.15.2026.10.07.01.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:54:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: amlogic: gx: add AUDIN node
In-Reply-To: <20261001-audin-v4-7-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-7-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:54:35 +0200
Message-ID: <1jwlrtyjp0.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015439_386188_EEEDF031 
X-CRM114-Status: GOOD (  10.35  )
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

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> AUDIN provides audio input support to Amlogic GXBB/GXL SoCs.
>
> What's missing after this to get capture support working is to connect a
> capture capable codec to the SoC. For example to test these changes an
> NXP SGTL5000 chip has been connected to an OdroidC2 (GXBB) board using a
> custom hat board.
>
> The following additions/overlay are required on top of
> 'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:
>
>     &sound {
>             audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";
>
>             dai-link-1 {
>                     codec-1 {
>                             sound-dai = <&sgtl5000>;
>                     };
>             };
>
>             dai-link-3 {
>                     sound-dai = <&audin 0>;
>             };
>     };
>
>     &audin {
>             status = "okay";
>     };
>
> Then, from userspace:
>
>     $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
>     $ arecord -l  # find the "FIFO Capture" device
>     $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
