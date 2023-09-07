Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A2C83F17
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Sep 2023 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBVF1m37q4HdacDEIdkt3itfMYr+Svi9OnoU5heYhTg=; b=rXxO8knMAXLtLd
	NT9svdSwCSzm5I4A8HNPEEPX8BBUd2YuaBRj7EAWPeNFE3b41OOgVNlC37roh5OV/dvnellevdlVd
	FNseWuKXXxLx7mFh8xxtDo9bJpypceHI4vYjelEHwp/yeHvQ1+9n2Ol2v+qe5egCDEqXH9Sbecro8
	eze8tKDdzFVrSr7BizcWUp1tpa8NIJCnYCsY6lP8Z85XOAneeRuEV3SyUdz4LJd3v3pU0+z+PWVTH
	jTwifAtCvZZBX2U+VSJHS0BT9qdH2aekw4ivSYYC0XIIkyVMlG+5DAWBwd1y4TZpi4cR2xEg5ip0P
	mThfJroY7pLYJIJRij5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCX7-00Bp9X-0U;
	Thu, 07 Sep 2023 10:46:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeCX4-00Bp6Q-2d;
	Thu, 07 Sep 2023 10:46:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 143D166072F8;
	Thu,  7 Sep 2023 11:46:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694083601;
	bh=2hPXnQEkAUOISA9uLrJm8cZfdkF/pQpShzz3sVJQr08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XDbzvsjyiXngBH29KcKNLuh/kqUeM1vbRDtSOTKSb8Ajfk+NEDnHE2FEdK+RpCqkz
	 zaaduzHlimmMz43g+AaZoJQrIvNr/marM4fQwLjCUNahOIrEZVt5rb372yO2//kPnE
	 P85dh+CkEgQFsE+h8Ao8gq5s+Fg0gzV6P2ss6wOEFpuTVidEcXz6KAhuUkBhD9S438
	 AyMxKvltsDGxrz9zHhg3MAWJaISGh+0U7NrqkDH5Qr4f21Oyd13CW8/vS8GLomA86/
	 yAZq7D5ZPLyDvYSywyyUnGXga0Tv381OyDxBRiZt1iv4d5losFQBa+vpmPnJ0JYDar
	 i1DnriQCy/jpA==
Message-ID: <6da8136b-be1f-6867-b2af-c636877ef189@collabora.com>
Date: Thu, 7 Sep 2023 12:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/6] drm: ci: Enable configs to fix mt8173 boot hang issue
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 gustavo.padovan@collabora.com, robdclark@google.com, anholt@google.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, corbet@lwn.net,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, heiko@sntech.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-5-vignesh.raman@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230825122435.316272-5-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_034642_986542_ECE6A744 
X-CRM114-Status: GOOD (  12.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Il 25/08/23 14:24, Vignesh Raman ha scritto:
> Enable regulator
> Enable MT6397 RTC driver
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>   drivers/gpu/drm/ci/arm64.config | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
> index 817e18ddfd4f..ea7a6cceff40 100644
> --- a/drivers/gpu/drm/ci/arm64.config
> +++ b/drivers/gpu/drm/ci/arm64.config
> @@ -184,6 +184,8 @@ CONFIG_HW_RANDOM_MTK=y
>   CONFIG_MTK_DEVAPC=y
>   CONFIG_PWM_MTK_DISP=y
>   CONFIG_MTK_CMDQ=y
> +CONFIG_REGULATOR_DA9211=y
> +CONFIG_RTC_DRV_MT6397=y

I wonder if it'd be a better idea to simply add those to the defconfig instead as

CONFIG_REGULATOR_DA9211=m
CONFIG_RTC_DRV_MT6397=m

Any opinion on this? Matthias? Anyone else?

Cheers,
Angelo

>   
>   # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
>   CONFIG_ARCH_TEGRA=y



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
