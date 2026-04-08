Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D6DFD5F99
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Apr 2026 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AI/cGrFUyqr+DozzMuH7r94PBu47C9j5LET0cFcuBRk=; b=qGjheBE0hurlyK
	mWS7SDUzuHPZoioU5EkDkCsT9N2d32z7ZDxtCpnjQ/Gr9P4elOleo5CfMMR2uqlSg4zgAGGHYpbNG
	W7TPzyLgaoXp+PIw/J6YSOunYFOz9PFTQBg2hFWqgPwMm6L/Rcu/6jl1ixd2ZMtyMdwda+J5RPG6F
	vJdXM4HtYwfUbBhvZxGqytLXqStRihFbQeGdh1pU4t6c7ysc5SISdSMkfHrq89AJkTAOIUmtRY8Ye
	cxUwv1UpbyT4XjgdImVk6TYRnH3eHP2D7AOGXGgo93C9JJaZkp640xH/XiJOpxBOv7/5ETU4aFPfB
	LdrOwVhrP4ZPpIhrut9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOv9-00000008ZY7-12AE;
	Wed, 08 Apr 2026 09:09:59 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOv6-00000008ZX9-2o9u
	for linux-amlogic@lists.infradead.org;
	Wed, 08 Apr 2026 09:09:58 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-43cf906b007so3152205f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Apr 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639393; x=1776244193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=jj6PWvrSmhq/xvDcMX/fNnjtPb6JGcTDSed/VJXvflWcTBWbS0IGQa9pHmq0tmriQc
         5a1EIA0P/RNaynBWG96oAAsdpJwO4RNC4ZNOEokBQdPHZOBnuiQ9hjAoVICOY2tMg6GL
         FlWWOfEECLO7Ypc9jRpr+dhxz6Q1k+w/nERw2Lm1ZBDwsRgv2qwhPz64M1CdCw7f3k1E
         Yjkkfz52NpipkQkl8Rk2ArE59MOvDek3XeuhD0kvySJXvFv/6I044bd6p0Y/oGSQIVtf
         w1GvlmumOL5BpGoep0fxkPefHrtzW1HdaR9j+P5r7uuwzXdWc4ry10f3STXCyhOrvAAQ
         80nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639393; x=1776244193;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=WHPz3MEUiTh4OkkD5j8owN10jbleyFG24bwv+BI95/5dJDQaayWeM7taVABNnX/9IK
         70l3E1mVuzjXMaG5JXMYy8gqnDO5vrdY8oFhjddgO+XqENIQJGd8eBNZyo/PQlXfjjiE
         kJSheJbVl+JM8Hefx/BTTYRnvbxUsdgN1TMPIrl1C1vFlHC4CWqeKxBnRgWA3CsFbwwP
         j7sPhQzRJ2Luf+HXvi4kVM/1kgBcGQC/zDG2s9HlVhSY2KjaH/hD+58jkdhv15BfT7n+
         D6r881/FC5nv1Sf6XumQn+lp8LS1PrzWqO613xqA7GhIBgDfiU9FzXrRmm2MIb8YfJaY
         DOvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3MUOYHSgJbw1M3aOhvldhy2DtKvCSw/rQLlbtxH1saRHCvLZXvOe5RAeDFfGqz8fPvXUcDQ48PDw2RkB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9dVyAocU00NLix8eZv5GUECegvIQlw6KbTyFJ2gYfuNnFnmCz
	aLFyczt17NF4ad5mKgn+ahThx6SJhLRVWy/HoLk60p0XddPy9B0i3aT3RH8BvTWg36k=
X-Gm-Gg: AeBDiesEaq4oYLT4IFoqXVA05wDHVM4SvMUxeu4kH1NFgPtQO6aZAwK0dapTTA8bMds
	8RB7P9/+SmEfZ8+q5CqKOBsemaosD2SHk9Z/fJQq0jUv5cco3KlFHYdyxCShJtQg9qa049Owofm
	ciqnMmrjCNAKoI/yMfJEKi6zlCCvXi9i+Szb+SLuPnO2iIG8m8MAE2z4VX/4Wrh78S87whSVVQy
	IihEl3/tM6DW5CdiNCE0lbSQ7LoQFYjEB/p5rRQksdmSkypapUwhdg8/sV/BEq25pl/GvptJZwS
	V8vjte8AgzEIwzS7AnxQwXLO9kpsXlKVUZsQDbbaUQ+YSnb7pLL3GRaiJV1kTe1NybPTTy0TXpX
	ZEmUHjvheJZ3FiWBAZXP3vhruJ9onNxLRdhtqvoK75vgZ+ytYoTIb27mbd5XL/O2PVz+5/wA/Gq
	o2FuWBz5ZWAOlkvmKduyp3PBX6C0DWjPXZkXiwC6Fm0EdZ
X-Received: by 2002:a05:6000:1a8d:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43d292e4215mr28461338f8f.38.1775639393127;
        Wed, 08 Apr 2026 02:09:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e1c27sm54424005f8f.26.2026.04.08.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563939235.3407812.2098744320811836636.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:09:52 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020956_729663_D6EEA6D3 
X-CRM114-Status: GOOD (  11.59  )
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

On Thu, 26 Mar 2026 17:26:42 +0800, Jian Hu wrote:
> This series adds the missing mpll3 parent clock and completes the
> Amlogic T7 SoC clock controller DT support.
> 
> - Fix redundant hyphen in for gp1 pll
> - Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
> - Add Amlogic T7 SoC clock controller nodes
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/3] arm64: dts: amlogic: t7: Add clock controller nodes
      https://git.kernel.org/amlogic/c/5f727a999f80a72dae7326577e0d832799ddeaa3

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
