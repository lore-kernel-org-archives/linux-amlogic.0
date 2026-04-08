Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24BCFD5F98
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNcqhCoI76wb7q2MQJlglrG4jS2QJCTC7Drtz47HCik=; b=UH3Qr7j9a7BvXt
	gJKtyGy/69tgnbnvFfoxl7L87vD9pYKzoYSFe1xCGWfmuqguuNpb55FYC2FMfKuHHyuVUuhJCHuQK
	2VM5oXj8t0eiOmgQVQSF68tNUJEpgaHyhQsiqTNsf3pYyFt6C7p0qSJDmbj3xaX6Ycw8nQ8ZBqJ0r
	zrtBHF0ma6j/UkCkHVCLqI/fxnisU8X6HqyRrfIOnMRMSH8ID3nLoj7NwVAZGXLwvvCbM7hoFVruJ
	06QGT2TRHvRXcjvFEqrfelGjg0eEDOC2aZZCOJnUZfagKIyLROap27hB+k2TQBDh9swjjSJJfS21T
	0V5gxQtfAhCoQ2vsZoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOw0-00000008Zng-0lPM;
	Wed, 08 Apr 2026 09:10:52 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOvx-00000008Zle-0NwF
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 09:10:51 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43cfb723793so3863678f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639447; x=1776244247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO8uch6J2EQbXvmvGcDK9cYBs1vvLxeqc/7RnVBrTR4=;
        b=rC46pfJPqHQk+agKDvQ0KqCilmw0FoQWAeiDhyy1jZOzfvQpt+5if94l8Ak0IDtmgq
         Y4/0bSaqspNipD4M1IhQT7F3wgqxlXOF5HkdHGpJf9wAh7bd8pzjpRE3QI5+0dAO/w8U
         PVIqr5MnkVEBrWJPtSPDCW3lRzYNfiJB4QGikwpgJmZxJ/QMcIbAiPQxu0KmwLLKfonS
         Rjwbqxmm/iN2NeLqLK7H9mXm7Fuggpwz9RVry3il7lCfRcXioUbVfBYLxC1AvMf/cITy
         xQY2dQPOGZmt/6ad2+iTmKqk2OR8MmQXM8eBlWF2KKGJl0ePAKa182Obgj3pxGXTcR1r
         gVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639447; x=1776244247;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KO8uch6J2EQbXvmvGcDK9cYBs1vvLxeqc/7RnVBrTR4=;
        b=kUTiMp7iEHJUBPwxqB+qTg8ykIyeddTdiOMtD5Z3mxd4Lw3RZKn6sDDYvdTxqIUzKO
         pCUbPlMICIK2KdbWRaR/HqCidEQHHZAX5/Y1QnbdyW8XowRGaPdV3Im5X3YcPYCcMT8c
         SEh8YyZTxdoWUe5XsFS5YXse/eSO5+EbAcAdg+tRXbd14ZGbIEtA6pusaeiEaSvdn9B8
         YibAwQ6V6mDyvV2KQS9ZBtIw5MeXGmkTJF21ew9GAqS3RGsYlzTtE6S6/iqt45a1SmtU
         YxshX/ksLpy1FYbAOc6hmeU4W46trHMd/oi6cZ2ziG3ILJOuf+wYUXpCjqjP/fO8/QBa
         bWjw==
X-Forwarded-Encrypted: i=1; AJvYcCXBfVud6IqwKGdII/6fzGVjQK4NXraSfV5aWnmeqFbjhasstjzYyos1XZgrNUHye00tR0mc17fzKkqmEGXI@lists.infradead.org
X-Gm-Message-State: AOJu0YxrHDWPw7rdK/tMkzbkNJjqzhip+idPhaQUVni67CkOddugAMK7
	jh1Mo5nbZ5JcBLzGh5oEvplAxAXU7otpmp/Z82T7Ng2f3dQYQT7dCfPRmpEJUj//dSc=
X-Gm-Gg: AeBDietSzztWZRrjm8isOnOVcABHMqhIqrc+ZR6wDXPybIGyWkkKbmEa1fi0/3BjOKV
	V5kzYkXkaWUUXxYx/fPqDaOxXlfe3ww1OsZ5RYlGzNRwZtvIkFWGrvbrYLqVGYG5NKezGRHBHSJ
	uKcs4EPFkHCcca85gtaH8afViBT8D+i7ZuxAKP3MkR4mG8DTX6Q8tZ7HCWip+IsKAUSODiWtcRN
	ROB1YEmFVOA0g8XQ50UWvseW4oJ8RtSc1UmV9P0LP0LjcRlL7qD5ppPWgGpCyM0Ymf5CV8OkUzk
	jwAvnKE2NKpCW7EojwBq4bPEpNJeE3Sxflzg6j8puutrJwCxRjbbunzsFOD7Z/KhfNlEf/WVWNb
	3+lYy9nRFSUPnXL8kOb0+wB+jLDPUMJhL014FSQD+mp0RRnUpM9Avu82gQzghk4uAXMMmdyvDeK
	hd144lXwNL4pldgIPm9jWlUJP0P1Od9f51OCkQpeq1hyy6
X-Received: by 2002:a5d:64e4:0:b0:43b:8fa4:194d with SMTP id ffacd0b85a97d-43d292855famr28409560f8f.6.1775639447019;
        Wed, 08 Apr 2026 02:10:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d289asm55901179f8f.19.2026.04.08.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:10:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
In-Reply-To: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
Subject: Re: (subset) [PATCH v5 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO
 support for Khadas VIM4 (Amlogic T7)
Message-Id: <177563944623.3409047.5512295931189701100.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:10:46 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021049_153084_A1E7CBF4 
X-CRM114-Status: GOOD (  15.34  )
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

On Thu, 26 Mar 2026 10:59:11 +0100, Ronald Claveau wrote:
> This patch series depends on Jian's SCMI clock patches yet to merge
> https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/
> 
> This series adds device tree support for the MMC, SD card and SDIO
> interfaces on the Amlogic T7 SoC and the Khadas VIM4 board.
> 
> The first patches add the necessary building blocks in the T7 SoC
> DTSI: pinctrl nodes for pin muxing, PWM controller nodes, and MMC
> controller nodes. The amlogic,t7-mmc and amlogic,t7-pwm compatible
> strings are introduced with fallbacks to existing drivers, avoiding
> the need for new driver code.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
      https://git.kernel.org/amlogic/c/759613b88fbf051c8a977a5e5b046b28a18ed5c7
[5/9] arm64: dts: amlogic: t7: Add PWM controller nodes
      https://git.kernel.org/amlogic/c/596e3c1bfa7869cf15079e5c6e586575013b2fc3
[7/9] arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
      https://git.kernel.org/amlogic/c/647228c014ddbd336a97e74bde81cbb2f7cbd927
[9/9] arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes
      https://git.kernel.org/amlogic/c/00cca65deacb29947ef32011827ff88fd59dab55

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
