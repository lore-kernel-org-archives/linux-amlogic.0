Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D27D38FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvJ3CwB2AK3AVISgWJC5BZowEeTl8XvVkw37Aso7BtI=; b=qsJPKC0FCWe7Ek
	0W/S70KWd4eAMiiUEGA+FrCzXO4AOc0dJuoWxMbAT4/H0sHd89lNYr1SdeF1R3nbpbBUnIvOuZPdZ
	4cRnPyG+Bfh26ST4KxVryoOiyO9LNUgIK5l20ERW1yJynOZ1B0hjKxLjAXmZvPHxUcM+/nWzfN68K
	q1SzPH1J6JBpP1R+p1UZ9AaKjvNX9YK6C7jT5d/2jGO+VaR5HeETG3C01pmM/a2WoKKgkT/BMS/FZ
	HQJ3o+AuaDKwWoMwZakRsZaBOQG4yFk3zudqoY47da1/ysIkKXpqG8TP+qdb5ddJw2jXEFBc2FwQX
	pEysH49N2HqGRblzvM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NM-0000000A3gO-21HY;
	Wed, 14 Jan 2026 17:09:44 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N9-0000000A3Tb-1YfN
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-432d2c96215so49112f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 09:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410570; x=1769015370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kTWfAnL5z5OhS7oeDB0hU1ojFDJcKULyH2iq6TuTBE=;
        b=Vn161/zTmyfGNr4S7akriyZN5xa0NGMaKYIlmK9KtvtLspuZ2HrYd88m1Ug+hvqq+A
         qXkDJhWZgGgDbih7VwSHiWyDyPq1DxchL7pR1S0o3jybotDVTrgMB2cEqpL3wrZnMJLm
         yNA8HDpRhFcQ2JESj/QW2z8VdMEbhfA+mG1XCGWKznuxwK2S9erEHAwbWlMY/0eDSrNn
         7VkwpkxXduCXNzRXcmIcY7snAdSnXS/glRXd59Kpg56z9h4jaobTowxzVGsMuOssyt/T
         zGavAG+x8zsDua8y1o2xhsdwO0MxwLjZ9zKnu6z4NZjeslY2dFlZ1CzgZBKqZ2vYVYFh
         Yg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410570; x=1769015370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kTWfAnL5z5OhS7oeDB0hU1ojFDJcKULyH2iq6TuTBE=;
        b=kPRZsvcizve9XyVTihqycfLGzxYiTKTwFoxBBo4agaNOv3DBScJ32F9GfBn4z6JgX3
         WgapKyqjvnjs54AUDeUWECQ/CVRjDsBth6sz8Kc0qVxGAfXxzHRVXUda7M7A1TAR9dfm
         TKd4GK3QbCeLfiiu9y+ejl8lIZUiSzgIOgIgbO110/OL/Zxq+u+9MYQhGqPKGqdwWa0/
         DbNELtaCcAwRdQejkSODDSBi3bhxIvNjYIVqW7sEl+7I0Z4z6w0aOEHJFKfHACn/6aUo
         y+Ubyws2b4ECmiB/XyJRqolTFlt+bgzhaTDzrUXlIyMpJ+bunHBEGCB5G8Tasindv4Fs
         1MMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXQGqE6BIKmGLFdGufeewGj+xQGL2c0TGMn1b+ANkv/yGLMNqCP3nVYBKFC+pfMGrD71u3wCOt69hXjbao@lists.infradead.org
X-Gm-Message-State: AOJu0YyU0nUt628HktplKWALIqjruihqWk2eZI5yt0EC8bDYjSFpkg7F
	TfC5yocL3D+i3biOBQxHftf9iZkDHsvoHBql3Au2V1sT/2jbKQCeBdrXvZc8yCx65Po=
X-Gm-Gg: AY/fxX5MVPt+5MIR3lWXmopIRV6LynY4oFLbkMXPHjCaRWkYiw+xGtBA0hTeun9f3w6
	gPet1FfJ939iWh18uONKRNFCkQ86lUbJQWoY17XKmINK5KUJaDIaLzIqh+VheZLeCX2peCd3uJ0
	xMD86suX5njSr38k6HgLhyzcJVsRGfMVZxRlM/t3MQLSJGz1TfEIvgrGCrfbUT0cFuavo4x8gJv
	TiYzUlhbF/uR2FVzC2l2GseiCzktm+d4/jo3HEohA+gilkkvkGMsL/s4ov61taZZCRYI3tFRm/h
	yxsKDkvfcTmh+dbiMsPokpTv/fldbRRm3mBMT+1Q3yMzz+kGAUee6gQNI9SO8iZL5MkP+u6qdve
	5RJjG+Av3ZJ+8PuH3jVIYChMvcADW5zLY4UPCnK1gXaXiDt9x7LyI7dQ9ddY/WRFzluJl/vYeyD
	hDistxzEfwbJQEptm9Z3t+
X-Received: by 2002:a05:6000:2004:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-4342d5c39e8mr3948863f8f.39.1768410569619;
        Wed, 14 Jan 2026 09:09:29 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af653787sm392682f8f.18.2026.01.14.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:53 +0100
Subject: [PATCH 6/6] arm64: dts: amlogic: g12: assign the MMC A signal
 clock
MIME-Version: 1.0
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-6-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=/PhsslUI7oDbVoSzVh6hBjUgLUvCgo1Un4J0+MmBYI0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ827+hqCodT7BhBobrsVc6GPpXPR/mUIltr/w
 NN3POGH7ZaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNuwAKCRDm/A8cN/La
 hUrJD/9Bux8MYYOOciJCbRbpEyXFtkOTIkP9eOvzltnWiMuDOzmypyQb2uSeeRu4fp3hDClDAEC
 pkkAvkKuQa3RO3tXR79OgfOquhS0n/eU36O9kEFv/n88itYp4AbolA6087pzCHIvpglgUSQrvhU
 n66bZQuoGeCzS7Je9nHsYxS/HmlQmOFeSwOBGSjnySXlSDY+qzKWAgU9s41Wp6q6s3g0qU8NjG2
 3fITWHfwU6y4TBdaR8l+HwGuy8OGzyJh8AuvWlitQgmVDzFZ++QSMF/9+BvGHBmfPTUlhwX/QYg
 38doGi7Kp3IcnFk6GLxA55YxzWx/VAYxeEQ7neZiA7OCLnxshUe1iacqobSY8CtlMnOR1Nao+4l
 AN1s8G8nue/0KwBb/uT3RiWmt1+4x7nVgTdx/n/ShozmBfIQ8s5lFc/7x26llkdAaa41R3NHJol
 +H4fW8Cqx2rI+fSYH/PxMWd80LP2dJxWSLpQPYbQqJHCilm72rLwU29+6O97C7xFrRia2kpO0RX
 eetrGkaYojiH8o4AVxkhkPQShe+fsDtCJADp3kkcoyQY5ZQCKb/1zcfGP3si3NAGgEdHD16SRjt
 twB3A2ntaaC6Cjivt4LHjRpxO6xnTbfISqXGe2FolhnBMYZHEb5cJXD5vB//Uv0XV0MPueHNv3+
 TtizwRaL48HGHdg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090931_484098_73B10222 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clock to make sure it is properly configured

Fixes: 8a6b3ca2d361 ("arm64: dts: meson: g12a: add SDIO controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 0085612cf735..00609d2da674 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2431,6 +2431,9 @@ sd_emmc_a: mmc@ffe03000 {
 				 <&clkc CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
+
+			assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd_emmc_b: mmc@ffe05000 {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
