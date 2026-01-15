Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAAED41167
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 10:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s3yAG7soBZfNO2G0Vmp780A+F/AHa9m75pO+x64TdoE=; b=PUNKryBT/ihZkH
	u2gJeeSZkLEGoOza/ol8XDXS6/4m8IsTQ8jkwnDksYd7L7uRqOIDXfLR844aUHhGiE2jcoi4/KOu7
	WBl2SaxHz8DLJFQswEU27inJJDV45F2ogrx/XvKs4WyGmq52GLw4po9huoUuOmuB9YLgSPlXxbNG3
	py9JfLg7YUs/TK5E78y07MpLbNt4vXZKgPxGxF8+/7+If9O/D6SMAcX0YMr5mENOMzJkFQb0dHIxs
	xjSxpMBSuylgtq1OfVPG3VQ8tEJFlUXYiHqbfvQFC9OJHnLHX+QnKlbx8YdVGOntMZCovAanftyLY
	qsLPQz5v+TH9HDggq+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKit-0000000CAEe-4A6f;
	Thu, 15 Jan 2026 10:37:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgKir-0000000CADy-1tSL
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Jan 2026 10:37:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id ffacd0b85a97d-431048c4068so394665f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Jan 2026 02:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768473419; x=1769078219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJqo6LxSFvjymO08OBbA4HDFLrBYb+JurpJL/gCPr80=;
        b=LaVcw42IK81JNjnxhnuyx0cEVB3rR/hbFS9h++NaLHWpt+GPrJ3Z/jfwho4r/swHur
         iClkfVVvclper2YiPuoLYDh56VzC0RYcAgPjtc4zS/HKRI8ELKChsjrTQZbq2Vy55UPL
         I44C6tXuqGf+takcNDgMMn/Yb+P3xlYq0O5oLTnTSBHkv/VsHUQQPBl83QNEqHZXBNmJ
         D00+gw1iYtHihtgMyO5U9Qqb80zS34RVdl+E0PaLCD5Bnj5mSLuALz89Nw56ClneOief
         gGbPxKS0TkJIop9jVFpXh+FdHRGRzFTo0UYFXigYY5n44OorMkts6/PDtcSSCDTVQgNC
         J+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473419; x=1769078219;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HJqo6LxSFvjymO08OBbA4HDFLrBYb+JurpJL/gCPr80=;
        b=tc5q7ihXbC+ua/ZI6KxT52rby5dhc1ovreJBlKJE9UU9tCUNePdKhc/aZMan1XFO2c
         hEb1tBewoJTaEJ8m1r4nDA+fXLNKS7bSlAm/RMY5TXKzTPVrz7ZGtgof0YkFtbrpYYPR
         PnhteQdcPGVBw04uzXt4JEXwQhC+t1Duhbj72vKIXxjDIfzdPsPNAgRBjzweNMDccevV
         jf+b3Hzfdfml0SR5On9zbreXNHWu8B6Ji61rzgUZT1CLfk2yYCjMHMXbT8CsHPrsrSWf
         Irhby/vUKFnfHVkgGZbcEW017Sp8qrrtD0EpBnC7OaOBYeREHlR8U5eW2eenYEsAwiM0
         Bs0A==
X-Forwarded-Encrypted: i=1; AJvYcCV2Ptn0laINYmsCK18KW65lEXUTzNRZiMcbE8oKmYbQ5JMZf52/4F13N7vye3k2dFOQGOKvtNnktK0nz+h9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+FJuNgnIDOP1HgaPzwT1hcWhv587vcoqIMHklmIn6rbjc8YFb
	EvVw7h/58ikOXvfRK9h+siEQvKHNhod4/QXohVmGwt6mBqWmRIZhaBftVhN6KXfg8H8=
X-Gm-Gg: AY/fxX7IZucvl92vu7bmGbvBGEYBkUe12WUnvLeERGC82vh/JDcEPcgqh60n+ik8vJf
	p2LJOC8mUQ4vTVBRIN5PyfpWm8/C+rQ2LjYxthXg6FqniLhbLfxSOevpHpPUvhoKL+1G6cfWprX
	VUTvH3sQ4QOTyJsvHhoyH/3Ul43TIGmbLarkQwNWJ6F3cKSut0CztOQpmKhpvyCEVZM6D4gc7lm
	KSIHK85PYAK2MADf/E72ANLtU1E2dsNZtktRm020k2bt5/k1qdNIljGosWJUIsbXEtLjE3Ha+6l
	1sBP0uEcEOtZeC4lNOSPGPzAq1+/vu2DJPPuWfSFCgkehYLGQyAZFyGpjk3psQqvHXkFAZlBrQF
	Pb7gWA9nKg2wbjzaIKYM5+NTtPDxeRbZO1qgwaJ1sD0u0HQmtcCcvshb2td5oHufoFVBKRgBgnX
	HkAYxWi/QsgoUSUU0WKMYqaN/ZRhwqNcg=
X-Received: by 2002:a05:6000:4027:b0:429:d3c9:b8af with SMTP id ffacd0b85a97d-434d75b7003mr2802540f8f.25.1768473419171;
        Thu, 15 Jan 2026 02:36:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af64a65bsm5120132f8f.7.2026.01.15.02.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:36:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Nick Xie <nick@khadas.com>
In-Reply-To: <20260115030015.1334517-1-nick@khadas.com>
References: <20260115030015.1334517-1-nick@khadas.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: meson-s4: add support for Khadas
 VIM1S
Message-Id: <176847341849.1377446.5257760418462522600.b4-ty@linaro.org>
Date: Thu, 15 Jan 2026 11:36:58 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_023701_517669_F1679593 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@xieqinick.com, krzk+dt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 15 Jan 2026 11:00:12 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM1S single board computer.
> 
> The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
> It features:
>  - 2GB LPDDR4 RAM
>  - 16GB eMMC 5.1 storage
>  - 32MB SPI flash
>  - 100M Ethernet
>  - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
>  - HDMI 2.1 video
>  - 2x USB 2.0 ports
>  - 1x USB-C (power) with USB 2.0 OTG
>  - 2x LED's (1x red, 1x white)
>  - 3x buttons (power, function, reset)
>  - IR receiver
>  - 40pin GPIO Header
>  - 1x micro SD card slot
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/3] dt-bindings: arm: amlogic: introduce specific compatibles for S4 family
      https://git.kernel.org/amlogic/c/fee65328ab35d5491ac5c9c697c52da3fd068268
[2/3] arm64: dts: meson-s4-aq222: update compatible string with s805x2
      https://git.kernel.org/amlogic/c/9ba73c18b14ac297b9fae92b684ca4dafa5e0361
[3/3] arm64: dts: meson-s4-s905y4-khadas-vim1s: add initial device tree
      https://git.kernel.org/amlogic/c/6186af6bd9b1e778e295a176c9281dba970da7eb

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
