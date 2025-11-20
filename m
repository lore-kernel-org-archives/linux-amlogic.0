Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2607BCF8860
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Nov 2025 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05rIyIq3v22qQZVelK4s3mc/Nc4x0QNkVWnF29PtLQQ=; b=DuZzBvgm9BqC8K
	qexfewMe3xHMYBtgGy8CTzK4dN+UJvaUClp/DsQvlrwNg60xmWSwk34DRNiG5w/DttlFc17CCCx2t
	57jfRphmDCrTx1ne3FbJu5+syeY93gOW+jMDX//Xcs4pAA4pLTSDNzMDlfALKniv79HqgG4mGv29C
	+BUztOVh2t33bbvcJcTBLrHAcCf+2phXKipA33NvtAW7b12sCLayOVy12A7xAt6ufIMUGhfSp+e+N
	kDQgIXZWMw4ZQZuo3OLeYthEwrZBMDV/Bh6dHWqfZLdgiA27TdilTP32A7IRDg1Ra1VmJE/2w3FyA
	eYk7TwwApOo7lWMglOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5YG-00000006pnb-3fQG;
	Thu, 20 Nov 2025 14:22:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM5YD-00000006pma-1dAm
	for linux-amlogic@lists.infradead.org;
	Thu, 20 Nov 2025 14:22:22 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b379cd896so550060f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 20 Nov 2025 06:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763648539; x=1764253339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImsNgbxyduoUICuKtNWRzS77ROdXymoggItSs8rqsZ4=;
        b=yd0iKTKQyZMMsCVv9j8Gflwc5A4yJbQlNQ31tbXfzCHIZ4CMmZE0RLLt0uRRZyHCNN
         roX5v1x9aG9Ygar63D3coVa5wEVZlTbfU92OKv4MjgLF59G3RO0fXvh5rOmAeNZ8oQFL
         N03yg4pEuz9cTZzeHn2U6bIRWNpQCu2J36j2hwQLGMCi8zZMsSe9jD1aKgKxvxAKW2LT
         0zI2chuPmV6FPHThzPrmx09jrzh9oo3lwIHKzGihEtiwROoBFfDWNtaZA/GDGgQ1BUwV
         M4IUJPADfA9xJIsIuBHAZaRcIrHiYfM2IHMvWWSA9fuXjVFWq90PFCJ9604+5BpIV+js
         d9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763648539; x=1764253339;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ImsNgbxyduoUICuKtNWRzS77ROdXymoggItSs8rqsZ4=;
        b=V998CJVqujPl88XPuOE9Go1ugQItjFzUfIZNwEtqGJqKGDBQh+J4OwWVXtT6YnjHEq
         Uc/HdPdi07roEValChcteX29naCdDSukLWkUjWq+4WHOGi8UbdzYUNS9FLM+kEfhyjh/
         U0SJqRFScn2OOrjD7zqlRDOak0r0sfUGyOY93aA8tAGjucVeBnTjsE7dfcBClXVxQX8Y
         /gOV1SsxjdKux42uQeyO6V2vPCkMYckqtI3IxRbkYUDGVWaoRy2r6WFoiBcg3yTuU9yP
         pFBDuO2q1dZgGc+ueM2Ch5bPDiFMtc3SP0yjsD0fK22GnFdipDrAMTG2MhFB07qiGoqW
         bgZg==
X-Forwarded-Encrypted: i=1; AJvYcCXK8l4RCGaEAcV1f9ILYL3Wd3Zl+kvEXgdqS9X9R8h80Ez2SyhWozjWh3WNPjHq60biIYlLjgRtOg2psw6e@lists.infradead.org
X-Gm-Message-State: AOJu0YxwoAiWV+/01Iy5bT6Qi/xC4e9/e3+8OOus+0jEHckbaGdoHvlN
	7jK57PaJZ6NG/aA7a3nsC5NO19wqP5WNgB/9z5AO7hvX7tR3knoiUBeiXBO8nRswhMM=
X-Gm-Gg: ASbGncvKZjv/vOMGnj6laC4L5NcuXnsg65pfElRK/HNI3KfC4d3xgXVn805F8Z0f6zn
	hnZaU87JM8EvANf9D2d7urg+xy0FRtEMbeqbJIvaRqBZGowOTDF6fq7uMRX4LdBmo9ZkMJ/qJv4
	AEPMN8TV2HmucXxu+NEmipN6Yxe+Xbjs3oGwQAT+bMgANU/51nIjRB6eO0Ox51uUorhJvObuKX2
	vFaGMwdQwyr6o6zE+lIAEigRYTNlDpvxcu8kamuobqfEFizQHj7Z9oh6S4k3CowTh93gQeMMQ8j
	fMz8qanB2xpNA00LqS4RBEtBl4+AyuRrToVXe6XZfWl7r2f0hHLVOHLNvrOM9brEBox9PB1gcLF
	GUGXOCCVHn/BwPuQgenHgp69pCKHoPGYTQW/X7ELhqGG2SB3Ea0z/TpQdur+pfVhQliLoGLWtJ5
	M1uWCrlIBeUsZOTAlcRxTrHRhkqsDGgPY=
X-Google-Smtp-Source: AGHT+IEGseLKbFavKV9xaiJK1w+nleecfiJIQQYI2QNSmK0kaikQ4QsqFmQRSpA3dOYxpV3ByNTjGQ==
X-Received: by 2002:a5d:5f48:0:b0:42b:3ad7:fdb3 with SMTP id ffacd0b85a97d-42cb9a1177fmr3052135f8f.4.1763648539064;
        Thu, 20 Nov 2025 06:22:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa41d2sm5565338f8f.22.2025.11.20.06.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:22:18 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
References: <20251105-irqchip-gpio-s6-s7-s7d-v1-0-b4d1fe4781c1@amlogic.com>
Subject: Re: (subset) [PATCH 0/5] Add GPIO interrupt support for Amlogic S6
 S7 and S7D
Message-Id: <176364853839.2628478.10260053331001764353.b4-ty@linaro.org>
Date: Thu, 20 Nov 2025 15:22:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_062221_443499_3EF40699 
X-CRM114-Status: GOOD (  11.07  )
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

On Wed, 05 Nov 2025 17:45:31 +0800, Xianwei Zhao wrote:
> This patch adds GPIO interrupt support for Amlogic S6 S7 and S7D SoCs.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.19/arm64-dt)

[3/5] arm64: dts: Add gpio_intc node for Amlogic S6 SoCs
      https://git.kernel.org/amlogic/c/96ce4313d6f9d5131937b449f9a2484277658c13
[4/5] arm64: dts: Add gpio_intc node for Amlogic S7 SoCs
      https://git.kernel.org/amlogic/c/8e8059d1747da43b0d8dafff216cbf32b647a7ca
[5/5] arm64: dts: Add gpio_intc node for Amlogic S7D SoCs
      https://git.kernel.org/amlogic/c/691db5908724f2f63b3a2fbe8394f2cc35b02c31

These changes has been applied on the intermediate git tree [1].

The v6.19/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
