Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC368CD1296
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfWSyL18mBTfaSCM/hlB03vnCDqSOtM9XCUiG7CeFTg=; b=aHtj29uxpKZFex
	zNsbYhnacQC5s8Hg3l539u9xcxbICdj3GDrW6r2KUjezabsrZXLSUGXgLmPKNVuFHGgP6mzYsYD/Z
	GtQjqgSMQ5zaHh+ll37BpYaRa6KyrmjH5BXSYtVXGppx5wRlkQ6QdEqhuZmnhWxbaY3OF1CzYi21W
	XEWI4smllpQQs0RXKxBE7ZOs02FEgm6u7NSKDz4C9xKK+5i+MajNFsIJJmSAztsxeAjgQC8QarDvC
	FWX1j8Dil11+RHORbMUAORMs6MNPrajdAKQSDk8OQO8HM1yxeD+OdepyCEzI1axCa7NOGhmBVmSBr
	tDur1oizEgKKbCGi2mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTjQ-00000006033-2Ct9;
	Wed, 10 Apr 2024 08:55:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTjK-00000005zz6-4177
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 08:54:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4173d3b4a3dso2013245e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712739292; x=1713344092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
        b=YIzW4aKm7y1/GHfBe2Fpr9gl2f9L4aCkJWuG4uNstaS3FsP04DoGzyYh0jvBDqym9s
         8jh891RTCkN9kZJKLcexsVm0+lW3HHbK3cXnyDK5EdtEKITHvmJjBxJpUh8uF+UtHy6U
         O33EoXdnA9aHzTbLUp+3AbtqZ5HEPvyD4R6zh2kYoL87vzSOI0RIQs5fBy6imQL1d2qs
         Z5HsxreSd0KnAdda2Ffy0ECiUbm0Q1R+gyY+pJ6QrvwgC5TE5pE58gtORBLaXspcZruh
         w+y/Fjzsl9toceXBc8FJzEybffKUr1Vh3vLH93UUCjiYFGh81Nr3Jkt+goToTpPmkKD5
         d5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712739292; x=1713344092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2AsZ1QIiCmfybXFGVW0zxiOuEp+rgs+ouNgKbZDKFg=;
        b=Eizf4RdckL+hciocc+BiYDaOejMKRNM+of1BNX0rNcJ0Af4Qd4oEYLAQ4URiA1/HdC
         K5a5WO3jhEjUpuAgFv9S3xgSIlkJYVC+aWKYeaYUGNUpabsWHo+YhEnHnkw3hquxkzKQ
         8xEi4KIY8vcwPNm6BkY3Fz3Br0xaNU97HyjM3zpJitbXFJfs/6AT7/wReLBo3WLPEYkU
         t63hKWvt3MsT4xfVZ7ZPoOEvJlqRhYc9/wQ4kCIiXIfpbozUsoVbICU4QTUgxmzsJ/Ec
         +rc00ZG0IEsJoZ/Unc3qVQRU/mhqdUckQO8B8RrkTL+mwSHi6qEK3S2e9Ewrn4i3xbUB
         ckHA==
X-Forwarded-Encrypted: i=1; AJvYcCX6aqfdnHOAKYxomapIrQ2705e7jb6ZLkvfJX0ZWpqrYeklvwIpL8+7dsNjgjKyU1DR2epkJy/GHlPEt8EJFxV8725wMWz75QAV2RynietNxpI=
X-Gm-Message-State: AOJu0YzLwYShMYcIMhvmobQ2slV1wHO2WPnPKIdDu9TVMFTmhk4A7vXK
	NY5MnFcyR0lQiuOvSHCrmu2uKu/8e9rWKtnI8zrk9PUJaufBerQNGjkl/ISuXhwi/wDmtslI9dm
	Wm6s=
X-Google-Smtp-Source: AGHT+IEJgQ9v9FGTkOkguC9zTMYpllaqcg3VK+wytjhD6ErKqeWqI+TOXQq+JItqSKG5kCWe34nSYg==
X-Received: by 2002:a05:600c:a4b:b0:414:726:87d9 with SMTP id c11-20020a05600c0a4b00b00414072687d9mr1961567wmq.12.1712739291342;
        Wed, 10 Apr 2024 01:54:51 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b00417be508e44sm408832wms.34.2024.04.10.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:54:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
References: <20240325-amlogic-v6-4-upstream-dsi-ccf-vim3-v11-0-04f55de44604@linaro.org>
Subject: Re: [PATCH v11 0/7] drm/meson: add support for MIPI DSI Display
Message-Id: <171273929022.3191460.6988833554592946386.b4-ty@linaro.org>
Date: Wed, 10 Apr 2024 10:54:50 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_015455_079417_35A94988 
X-CRM114-Status: GOOD (  12.90  )
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

On Mon, 25 Mar 2024 12:09:46 +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5  now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/7] dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      https://git.kernel.org/amlogic/c/ef5a84d716042871599ff7c8ff571a6390b99718
[2/7] clk: meson: add vclk driver
      (no commit info)
[3/7] clk: meson: g12a: make VCLK2 and ENCL clock path configurable by CCF
      (no commit info)
[4/7] drm/meson: gate px_clk when setting rate
      (no commit info)
[5/7] arm64: meson: g12-common: add the MIPI DSI nodes
      https://git.kernel.org/amlogic/c/6f1c2a12ed1138c3e680935718672d361afee372
[6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      https://git.kernel.org/amlogic/c/2a885bad5ba4d553758d3f1689000cee8e6dae87
[7/7] arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
      https://git.kernel.org/amlogic/c/fde2d69c1626bebb3a8851909c912e582db1ca95

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
