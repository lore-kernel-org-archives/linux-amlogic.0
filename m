Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5CEC282EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Mar 2025 07:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEJ9uOd7TfGMFOHCmXau4WYtdcUCDKMZhYu9mBPVCwg=; b=hGCyt+cWi+KdQU
	58yR3S8ourLDefce3sz3KEAuXl4s/p3ZL6dh9GPN81oDCc0Nefq8GX0cAX25liNGPLI4RRnAfllTJ
	AEoSCdgLjkyPnN2f/djm0J184nelz8DgPe0uW7WTSePuLmVyAMzy+KU/PSlZbcsh4EfDZxc12rMmd
	Gf1RDATl0ICpURaxpFldSMzh8LHAk8kIZtrUHDZDtS6uq1KbnNufL5MqCz6ZO/KJdcHfGlXixZ8O3
	ZcSCE22HPmE0f9BO+dEw8w98hVccDL0V4fwSZs7O7mYNxxAuyhYZ3Kw5Ou7uYZVu6kZ3YKw70Nk+X
	rJKQPwe7DlK0iYsyPOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5AX-00000001cza-19xZ;
	Mon, 17 Mar 2025 07:45:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu58n-00000001chH-1n2n
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Mar 2025 07:44:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so6375755e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Mar 2025 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742197444; x=1742802244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6W/dMc1fq8BYuaZ4P5+FGSA3GCwNFxk1dxYVKldZLQ=;
        b=N7co6gqTp2zDMa2R32AG4Vn9NbAfdO1KOOSUVEH/acdl2p8BmxBUJAz68F0pToptBz
         w59mZJmT2FCxLXMQxYH10efbqR/tBE/rucrQsKNYqIoFT3LXpMK7QRLaGcGFq5voJOa3
         FiF6xVEJu2B+ondjlgjoP3nEwVH6e38EbxctqhHw5H2Bj8pNf0IKqEWoy53AI/MSaCkJ
         RSAze/d62xGD6xzhHzGhvZ4KEG9xriNuXG3z8P/SmGAdWWumR1nsKU/FH6JuffawNcmo
         WU0NGcnSD/OvOu+XDwCZ+/lnZENVMF/0o82+NGC3fxMCgJ/yRDW4nx68atvqrhv7D2ud
         T2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742197444; x=1742802244;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6W/dMc1fq8BYuaZ4P5+FGSA3GCwNFxk1dxYVKldZLQ=;
        b=U9xmj0ALYccwt7xP61BWAUk/qakuH6KgZewaF76H7PZiHBMXBKWcq5iEyto93RE2c2
         Z6WDUnnJWmKzeGMGIvmFzBp9cvywh757eAx7TPOW6tP/pRyHgwWig4Kughvf/RsNIDnD
         MuFxxUDIq94mlxCDOol5+Boo1pBptIBCN/9YmpsENSgLRAC6YO0BPjSAS9eLv0w4h+pd
         4F8Mb4BXxsm6G7B8CAQWEvKT+kAI8rCth8v/C3TPCX1io7OrbKsNeF2L+Q4SVKEXdni9
         yTqAznR0E+oSI67yJiBqE1Tmko20ftDV/VlwmS7lf1xeuIuTjR6RBrUTUGqhMIqQ+2hx
         bMBA==
X-Forwarded-Encrypted: i=1; AJvYcCVUh1ku3ZAQ0OSRNAhrDuXRxkmdmEEWA37fEdOSukWkPvqGcujErwwLHx2GE8+rjC/M/2jbyAMaZu+ZYpQd@lists.infradead.org
X-Gm-Message-State: AOJu0YyOH+gowXj9iLR7NGI2k6Igw0//+FM/o88lBM/anlO1w3AfKEy4
	8Z/7TAuiwk3Uv2IK2ewv1b6ucWHS3xZNmRjaI70tbwBo8lctgaFpc/gvYClufbk=
X-Gm-Gg: ASbGncs/zxpGq6navafTpDYuOPnQi96O/hyvK1msBIyVCldAqZABK2BFLZIyd2gdDdE
	SJR+qy4rHkAuKV04/cNdrhxdtSzuOdVK2S9UGfinmBs8eMCpnF6SCbAimIRgFKSgVTVzmmOK53N
	INdDpG4PMtGBA4tMzFMeakXDxYHKim46G+5gKvvv5PiXPDBaYdwZw6OlBN4g9ZpX1wckG3jc+o2
	d5qckuosnfkxch7fHQwYUmWGZHc/A3H3lKepfyTPtgZtNcGfikDre0aCum1bSDVN52n80gEcY8m
	LUiZtBmAZwqGEaH+pzG4iK5Y6fWn+CrH7SgMJ6Gnw6SuXLyv7od7HoXCZ80fd2KaCQ==
X-Google-Smtp-Source: AGHT+IF8C1yneD+/k4sqE9utzyQLZCEG5Ohlgyj9HQOMGPJSnTFjDN3R9yA40oXN4+fpAPxC9TTs5Q==
X-Received: by 2002:a05:600c:214:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43d1f0a3aaemr102869895e9.6.1742197443707;
        Mon, 17 Mar 2025 00:44:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a32sm14376503f8f.33.2025.03.17.00.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:44:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
References: <20250311-irqchip-gpio-a4-a5-v5-0-ca4cc276c18c@amlogic.com>
Subject: Re: (subset) [PATCH v5 0/4] Add GPIO interrupt support for Amlogic
 A4 and A5 SoCs
Message-Id: <174219744301.3089961.6347213266646956468.b4-ty@linaro.org>
Date: Mon, 17 Mar 2025 08:44:03 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_004405_476110_7D95F708 
X-CRM114-Status: GOOD (  10.33  )
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

On Tue, 11 Mar 2025 11:08:26 +0800, Xianwei Zhao wrote:
> This patch adds GPIO interrupt support for Amlogic A4 and A5 SoCs
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.15/drivers)

[1/4] dt-bindings: interrupt-controller: Add support for Amlogic A4 and A5 SoCs
      https://git.kernel.org/amlogic/c/40f4152442f72748ce883ca53ca80961e433701c
[2/4] irqchip: Add support for Amlogic A4 and A5 SoCs
      https://git.kernel.org/amlogic/c/bbd6fcc76b39502767e213ad24a349205cf75e96

These changes has been applied on the intermediate git tree [1].

The v6.15/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
