Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E03FF4958
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dw1DNoGuDJ5fawEsbTEAvlcec+sS3r1eOgRNr6Tml4s=; b=qKx1pm0NGFs88W
	vv0stz1hN2BZySbwUDiut4i99JDc5dyq7IV6o/tsb1S/B9FKA6BSPmohv6S9HIk5KAlGydQWSu3Rp
	0MT4k4X+Ixllju6cSd4oNGc4NZ+fmP3zVc4mHsIgEvV7tgGKC992AesN98JLKOckqR11Dc+0JD0Xh
	eJ23s+nT594HGi6pWHqVWjNvDk4+laEdpuJj9WAe5BaU7iB8ydf4Jf3SWKd3y0vEQE6NsVx//5wH3
	veyrDZE/+wCS/hvDS8KM656FxnJk61IRdZUSZrixAv0GDIz0F/EpXd8EI+RYMdkaO6rQ9PmFxszb0
	w6ht3QNxwuo6DGpi0o5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Qc-0000000AnEZ-0Dg0;
	Mon, 30 Mar 2026 07:52:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77Qa-0000000AnDr-2QFF
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Mar 2026 07:52:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso49505465e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Mar 2026 00:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774857171; x=1775461971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=XCd6AiYUEaupwsHh9IlPMpQpGSQYWavJ69gadbRhFWIY7/vb0MPBif65aFMCnMVV7N
         eshvvWZMVD9OlkhU7bb5X6eyxtVK2kPfXBm5nTz0WMd0xK+MvvLpTjs//fFUGZdxkzsg
         VhzYHy8kTxYianNs6W8vVz5X6zXF/qzoJe1ZyA0l9rMxf0coX4e41+AAMBLOOYzSWcax
         bLGhSYktK6L2StglFUC+Ab9zBpeCB5htjZoDoDm/8FW1D124pFX8nlzwrynfZt/p0MfR
         ZPpleIKRj1BdT3BKkfkTg00j5nINEKH5WGcwcQf19DWU0t2OwzfXt4BrO7fjrl1cYkpE
         rZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857171; x=1775461971;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uh6jX3rHtT5u2c4N5fbPSMcMHgGUvuAHAXYaitg0z7k=;
        b=g1WoghSJ4PimbvTzqR04349CrO/068EWRCohIghdD2BeFpd36Opuirt3ZXR1Iaq919
         pRJ+cS7f44l3QJioX9WqPOG3Y1XYgzBgPBw5vqv8SnuUQnKoLArDwWviy8uCGbzcrkkc
         xtxsuCzVuU6t5nIyNIiMtetL4EBMMn/tklyA6Vcf/vDcf8SLrcc2Ey1ckFInwNvhNKyU
         p/RWZBCOKZcGDUG37zd5RkwmJntHcbtKIzsdl0RPPRGYVS88NXRniC8ie3lIBS+q0EmB
         VUE819rNCd8C/joU/LgDnpHusllU2uX03XQFA61TPAGV+zy8MXQ24vCDsDZLRD03/0Rs
         YoBw==
X-Forwarded-Encrypted: i=1; AJvYcCXswxKbsGPckhIQPNhOOFsnwqAeo/B2voL3ChRUjZy7lgwqN2RTujaFxe7o8FGSPVpXVW2zTs9i5/vnryA7@lists.infradead.org
X-Gm-Message-State: AOJu0YwM9m1BOY397XNtHcDqSB/L50T31ICX9eH3qDUYzxADrB2Ebe++
	aNGvTQ1IZDE5GBqIQLVYbXYsv1Mch3guZXSYoY+Mn+sH9UbsW3H7XMytbXLXTz5suB4=
X-Gm-Gg: ATEYQzxetD6joFdF+BY6CNSDfcFTqVPScayMHjNpL+jSTNg28GZadZLQQeW2b6IhvlT
	L00RSMUb7inP3BXjTwYE92GaegY0C02OwruuQkEsmgBDKNcKKJcO4mg1Yjxe+YdSthvccAwhORE
	nfVf1dfk+6ENfjGYwBGxfvn7NHayS9BIqK2TVKYtI9QVK/mYTlV44nBaYgp/Igq5Jy7yZHG8cim
	eePPUX4IwprPHhmO7taXyVSJBhqqHNmT6mWOOYcGdMYldgOeTyz/I6CcI90Kjn0soJshyZVo064
	V29Eu29hATITIXzuhhOShif74VWwLE2WH7mz2xv8BNzz6d5ah2Vr8k7kBCvJPMBSoVvLPRIO9a3
	NFgznCsiogrr+lB5/B3KxhLxvc+/gq36L/U8CIk2q+o1Sm/FB4Np5+YxlxGV3w6xwmngpqSkv2a
	EsXqPkayaFNDY8kWDPjXdtB60rQJhzin/OPld07JwMK9DI
X-Received: by 2002:a05:600c:6487:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-48727d679e5mr181633115e9.7.1774857170616;
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725ec20edsm74580455e9.9.2026.03.30.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:52:50 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com, 
 jbrunet@baylibre.com, Nick Xie <nick@khadas.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260327093016.722095-1-nick@khadas.com>
References: <20260327093016.722095-1-nick@khadas.com>
Subject: Re: [PATCH v1 0/3] arm64: dts: amlogic: meson-s4: enable RTC and
 IR for Khadas VIM1S
Message-Id: <177485716915.875961.15585645607067956492.b4-ty@linaro.org>
Date: Mon, 30 Mar 2026 09:52:49 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_005252_623382_9F4FD632 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, 27 Mar 2026 17:30:13 +0800, Nick Xie wrote:
> This series adds support for the Real Time Clock (RTC) on the Amlogic
> Meson S4 (S905Y4) SoC and enables the hardware RTC and IR receiver on
> the Khadas VIM1S board.
> 
> - Patch 1 adds the internal Virtual RTC (VRTC) controller node to the
>   Meson S4 SoC dtsi.
> - Patch 2 enables the I2C-attached Haoyu Micro HYM8563 RTC on the
>   Khadas VIM1S board. It also sets up aliases to ensure the hardware
>   RTC is prioritized as rtc0 over the VRTC.
> - Patch 3 configures the default keymap to "rc-khadas" to support the
>   official Khadas IR remote control.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[1/3] arm64: dts: amlogic: meson-s4: add VRTC node
      https://git.kernel.org/amlogic/c/af0f8f769f89715692ba7abc4716ecb7aa9af028
[2/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
      https://git.kernel.org/amlogic/c/3da3598f65d00f72a17a16c171ba52897d8e96a6
[3/3] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas keymap
      https://git.kernel.org/amlogic/c/c15edbda012eff7cca4c6c6bfedc04bde5e8adf6

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
