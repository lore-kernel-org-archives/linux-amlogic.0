Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 731AEC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 10:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvekOvJza3yhy9oJHsL3EunhFuGlrN2NMyvh0Ml3898=; b=LuQxq5yafoMdlJ
	27AL7cxcrW9+hJwDMFPA5X7pwTsIW3VHjGHajAkMbURQieV3l+HyOWZlWRodasnO4fqfUkU2nearL
	bo7TLHbL+Ir5Wxxvj8TkJ4tK07TYdgSJQo/41twmKKCu/hzCwiOtguG4exjKdVPZO2WAgTZ6yaML/
	uHxHD0hl8jdeggWuL2zHEaT/40Q/WnNW4JIfyR7KFyJQdkCHwuGfaOmSVi8Q1VpucZk+mzW3hgjC9
	CisqCI1lLGZ/vyblNRh8QFGN+pgrURoO5/t38lxcEHEMFgHXVxABkz+KJKfUnFFTTRFgGNuGdFIpo
	OVR+l9DLHHDRmNbUJIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevqa-00FfSF-2Q;
	Wed, 22 Mar 2023 10:37:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pevqW-00FfQb-39
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 10:37:34 +0000
Received: by mail-wm1-x32d.google.com with SMTP id p16so11178632wmq.5
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679481449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKYLrq+5xwL1z16Mh5XU//Z6+05o9hLc+yFcwb23nzw=;
        b=nIplk97TeH7s+5D3Rmts/MtAbjzzuACevDUBrI+1Pdu1oDIiCu1a8mnlmYZNS2VOQc
         Abcg1Pvjf6oLCbxA138GEtQnf7olIWuJWd8gnlK0+E7WWMMZ0a1TPuEEIOvfnG86dEwI
         dL/W/TJqhn9qlVbYV6hX2Q57FnhlurwWngY2qBZuHYu/kvRmm6TVGqIK2MqGDar1aIRa
         NSN2bLSz6R/K/3MfDVlnu5q/4RKAOLll1S3+7XFJ6NATqdkY3HnRwCoY6Y6EaMkXWbDr
         geRakNa2tT0nP1slz+QHeuWYHboy6dznMuBOKrgbUIZDROsJoFCId8wtmRhpzh0oGTI/
         2xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679481449;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKYLrq+5xwL1z16Mh5XU//Z6+05o9hLc+yFcwb23nzw=;
        b=X5XcwiiecXCy3B9plpe/ncIAbTxHrCpEVQixuPH1GSUe9UTYvVi6mOiQveHMENs6Od
         8elCASXK2mEadJj30Ygzu/HjfpLDmlvqA6mXQAW4ah6DjRCHwcI5usc0F86r8reseXtc
         1k8lc8At8ufgSogKQXWBZxtYCSfbXZiGMOQkO8c13d7HOMB/Vj6/92Sg4M0ylbHu+COQ
         qcmvTlEuxvKszJrW+ta8p8eNEzqnKGzJBud6Z/opuYHBNmL5M8PfqvVTDlnqCs1efKew
         1KqdBJpvOEWcJj9STxoXri7sGXxrKrFi8AxXWMm+DuGp9qkgmXLKn9/ZinEcWvmj9ehM
         lL5g==
X-Gm-Message-State: AO0yUKWgm0Gi1cZqqD4O41B1phzYDZ/3HqWNMagpwNcHB/r9K1/cHDPf
	NdRU6mw5sZQfum09zcFMWspQZA==
X-Google-Smtp-Source: AK7set80COadYMouirUYRTlnim/M4RpQYkRgCOJPyehYwC9cBwlz7KywIEwJcQneN0x0XeiFZfMJnQ==
X-Received: by 2002:a7b:c845:0:b0:3ed:df74:bac7 with SMTP id c5-20020a7bc845000000b003eddf74bac7mr4640727wml.21.1679481448726;
        Wed, 22 Mar 2023 03:37:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id z23-20020a7bc7d7000000b003ee1b2ab9a0sm6116422wmk.11.2023.03.22.03.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:37:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
References: <20230321171213.2808460-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1 0/3] ARM: dts: Enable WiFi and Bluetooth support on
 MXIII-Plus
Message-Id: <167948144797.3811038.2142379553878713661.b4-ty@linaro.org>
Date: Wed, 22 Mar 2023 11:37:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_033733_023282_96FE26DC 
X-CRM114-Status: GOOD (  14.06  )
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

On Tue, 21 Mar 2023 18:12:10 +0100, Martin Blumenstingl wrote:
> MXIII-Plus comes with a Ampak AP6330 Bluetooth and WiFi combo chip.
> The 32kHz clock is provided by the SoC and is enabled by simply using
> the correct pin mux.
> Also this is the first board which uses the SDXC_A for connecting to
> the SDIO chip.
> 
> Other than the two new pin muxes this is just a matter of describing
> the hardware in meson8m2-mxiii-plus.dts.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm-dt)

[1/3] ARM: dts: meson8: add the xtal_32k_out pin
      https://git.kernel.org/amlogic/c/4ca4a633205fb372882de3e6e93a0a3584298249
[2/3] ARM: dts: meson8: add the SDXC_A pins
      https://git.kernel.org/amlogic/c/ef8474d50a37ab5f2f2f60e179d749b4273470de
[3/3] ARM: dts: meson8m2: mxiii-plus: Enable Bluetooth and WiFi support
      https://git.kernel.org/amlogic/c/8446b84c894f7441f8bf4410f9638e38dcb29c49

These changes has been applied on the intermediate git tree [1].

The v6.4/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
