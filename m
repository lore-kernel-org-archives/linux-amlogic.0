Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07753106F307
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SiEuKRmqAVQ7VmyJeWQU8ote28nS55Z2xBWMw69uxVs=; b=xoOTLFRhhEBAuc
	IcmMv2CPrG6uDvJvaJ+c58JXDWO/xK76D7zwRmsEw2urNkRd5lQLRzefb+1ab0ZBAEO4BlwmJ447y
	qELygS1Ylw19qLNOd0pgbADfDns9ddiKy2Cl+X0rGkJdbdxAZCwWIl/tbcfowKgILOX7wOb0O/ToU
	t4/KedLSaOeWk77xKpwNAhtqzMM8S92MpBf9v3848f6e0ZOR9US7+w/cJjoqmJuCIL6WYqpQs5UD6
	jOUYjgXfl1tLZDfBU9HIqYKH60LJftnpGogjktCCnPn/h6GQfwxcUEmpej0IUv5DpHs6UJcBLCKY7
	maIP2ULBpzeVWFwdXNRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXv-000000055KE-1RRx;
	Thu, 26 Mar 2026 08:58:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXu-000000055JL-0naL
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=; b=YlerApCrhe2F2BD9dWg+7Njek+
	i8XmcRbz/178lqb7iCPB09xLQig2cN9U++Y7/4gKv7XGe9+kAvNPDzvHQ9k4WiAu6i/CoziuoCGxB
	TGvlLZXNfy8T+kmPGsDu53CixUc+SeMPbp+p6j40XLxHnpSJHC5NENwuJt5cnIXnm+jFIN1Zraw53
	P8/ba3v6h92oXiO5l1ET6zpQ6/6Z1EmaVoy7/y1IN3/a22a4dHVYCXCmRKQDoOKOWk5qrRivYeIGt
	Wr6gtdt841fBAhH6HnBXMj9nQwo1K548TEGVuJeGlX9QQyK5RjAkhIm3OygcwKFJwHO/6/gggTT1s
	U9kRVk4g==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gXq-00000007odi-3QLV
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Mar 2026 08:58:28 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-439b9b190easo445701f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2026 01:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515505; x=1775120305; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=tcvA8e7T15OV18a6oFKEKdnUUPOxkW+qXav4ycXoNLoFSqJZ7ccINtFaR5qZcUwA51
         XP7EPDM1Cd9aBzZIHiJLrp3ta+MyajF3309IEH7aYpena5342TYBvW+zvg4nGUiZ1rKK
         e4VV9K64Xhl1t/Z3pDRCT2UN5OInuOZIiT3RoaK8M8cH/94wFFuPXpf+94ZZKpnpJLr5
         gvoQmkRn5PenultPHpLC7wVmg/h3mr67mwZX5btnxDdxX9f0tHbW0422ROoHxVOo/3Yg
         K/wuJSMccroeJS0BwYrnjZWR02MGa022EaSUXnuaRKmidH4UW+54MXnl3ahDoL/z5h2x
         KejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515505; x=1775120305;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=etMGE1i0Tg9J0A4Z+04e2ur9eBZGqwTEkckx6bkXCYM=;
        b=kB53KljVIUAC4z5wmYzf+psUGgb6bAvebqSQW2bOFANldXFqgmwWsb8BdMMCYeq6l8
         cKcMDUclE+eUrbsmzfO+NBw+gtVZDueNOisObYJIy10+B3nKRSh/hns5nv6XZvArimpe
         JEMxNN3OPZeblMuNGdSyCoXsFt4+ykLtjYB8za2S5CTZx9L8/KuEbhu+YAjsYAbsDDyB
         bC77FmQFP3Gv+Vnn4Qc0rWKeDcHRChNEM1pTdqGbUHlX4RcR6xjzgYAM5yQN90fjQgos
         ZwKD7nGqC1IoJ1Z8uO50IQo9x3tqOqsFThwsFhWBt+eKr4jDf0526SWKCXHjzzZ6ISZL
         j/hA==
X-Forwarded-Encrypted: i=1; AJvYcCXV+J4IIb8o1xTo57wx/HWf6aLba9nIAtlnea3zouy3d5kLXf+6Zb0wj++pwYj/aW+FR4gawMNXNbqsQrrZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwfjDASCd1Uo2zTIBsjKwWANDVkKJPKin6diuxQPQrcy8LpCh3c
	9VOLblZfN4pX5IC5zY2JHg42DgwkF6VaPR0XjAUvbKlAkeAjCOxzjX5TERGKB/o3Y/Q=
X-Gm-Gg: ATEYQzyzK/NICJass00bcGL9d0K+oGF9DgKJlAbx9yf0WyYDox8ZrOzQNCHIKRfhUN3
	zjpwtLbKh83m4e1K4470OPOAg/AyWQdp+Zmq5TCFHBuXx7XGrZgk13DkxI13NwIIRMoLNFwfPNe
	YjgWceg5IQTFlmPLCbQwd1Dz1HwPTb5EjW3X925Yn1yWLotXKG0n8SvwV2l897wKnt25bzIzk5P
	lkPM6e6Y9fHEGfdAJwIhfKzl8FTUz0rUW0QBKPwiCnwLTCQ6A9vE+7vJ/ISbPWJjgqjF0NqRBNd
	kz70Lon+5rOKDeCudDXKGSPR9hOrN7gTsiPTk3n2zW3yFA8xUtVFF2HJA/jKtXE2wRaS/50ARR/
	RH/0IeA3xzL2sp3WUAkSnL5XSC350D6tsYHryblPE8N2UFp2eQyRcXrznBjzx5bpg0QkRd3YN10
	HjHFL9Yqii9D7SZVeOLMKW5nkeqE8RR8+UiliwZIG9Ip1O
X-Received: by 2002:a05:6000:2885:b0:43b:4881:cee with SMTP id ffacd0b85a97d-43b8899d440mr10250351f8f.1.1774515504858;
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e708asm5849382f8f.36.2026.03.26.01.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:58:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
 Marc Zyngier <maz@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
References: <cover.1772643434.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI
 interrupts
Message-Id: <177451550396.95191.10019790997295547194.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 09:58:23 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_085826_984201_5B1FE4FE 
X-CRM114-Status: GOOD (  12.48  )
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

On Wed, 04 Mar 2026 18:10:57 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.
> 
> This has been compile-tested only.  But note that all such masks were
> removed before from Renesas SoCs in commit 8b6a006c914aac17 ("arm64:
> dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3
> systems")).
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
      https://git.kernel.org/amlogic/c/ff6c02a40dc8706c0b13b3b12cfe228c38bb7857

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
