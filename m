Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C298C0015E
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2l8ZxkkgBkNQ4/l3pyD5ZOPoiBVS5trZyRPM6x++Mcs=; b=asozh+qqVxYm+U
	Rx9t0mQkR64d/G1Yll465xTp1KVSWxjRXvYQs0Egcbn552pw3FgLjC4aZpqHz+YaWXuannbdjN+FG
	uA9DDUzGA9/A67CIRnKiRFXsTlHO7St4MPQUukY8hwAnSZemOo707MmFW7MH284JGk55oYW0EybXz
	EoKHjR4ku/LdnKy+n63TkAEQD+TWRnjLZETxPI06gBmPMBMVveeejSe4kb/QfgZ3Y9bOVOomcqIk3
	fRQXVlHKQ0V8DJOiaRelruqNOrSQ0JSJFpnQZvT8PgxCIi1Srk895dMtgSPTtdCDKHVsdV3TDmnjv
	hqL0NInFX5oyS6MuBGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7G-009yl2-2z;
	Mon, 03 Jul 2023 09:45:06 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGG7D-009yjw-34
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 09:45:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so39459695e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688377502; x=1690969502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=no5CNBoDiHbRpIdNDqGhGyPr6ei7bZTn4+f7d7VDLXc=;
        b=xkgubruoESKN/GtLWkW/pO8GAXTpNxtqdt3mkSG0Dm+hen+SCiJFXipuXZqfurrZpP
         YZiJo8Vef7ujaFBzVZhoyB/Hq5WI8+oFCV1DM5tPIps6dUHiOMdUrDXOYNYkBenWIbXI
         5TMMBjcZbTGCSBZjUvM75AMt+NeR3p/2aOQ4FEPiNX9a+mM+jv3PQECB3hQErv/FdvbY
         BG+TLP1myXUvwIybjz4AYhc4Agt7+2cUw5XskwP8e7s2MIUQhSa2ouU+d/d6R25H3rJX
         5z4OuZ4PLGOrb09Nw4nUQ0GgnbirV/oKer8bu0t80MGvPtfxMo9trPd6YPAwjC2uArlg
         JsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688377502; x=1690969502;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=no5CNBoDiHbRpIdNDqGhGyPr6ei7bZTn4+f7d7VDLXc=;
        b=ilCKxXmzfih14+e24FqMSg2TcSxjcIalQmTO9o2CzOzO03EF/pFkaJyhkJHhPtU9py
         nC0L6PY7m6AdJCele3hIiQKVIuShBrtDbGpVU7OZE29j1ma9cKGjIQAw0hwmW6i5aXCs
         IGck79mOobGIkLjWZkz7lmcUsS4pBLipAYaA/yk0l3PYky6oUaDHgb+IM36pQQsKHfXf
         Gc0un+TJxon860XieTy32P2bORYITrnddH9HH/UtpkHoTkAe8WhG8pjjW1wC2/6Si1nU
         NiNqrCKmyPQb4IAg5So63ID1n+0XO5tvRNUXlh+uWlBNLZ+eGKFAoWIqI2ARDlxaUtmF
         Nkxw==
X-Gm-Message-State: AC+VfDz5nNVpYMvRAJCdZBBqrU9qruy4Tk+PQWiVnGLMNBwyANjIKBa6
	0yFOVLW9tPJH828RNYUlIVd5OtpV+XgMCWdn/xHXuw==
X-Google-Smtp-Source: ACHHUZ4dcr3T2QoMLtrwInlyHyprQa/n0BPg7j2w2hcYPJlKf2GFgPLbqJanRTpxLpT/KBJmIgof2A==
X-Received: by 2002:a05:600c:252:b0:3fb:c462:1833 with SMTP id 18-20020a05600c025200b003fbc4621833mr8369946wmj.30.1688377502347;
        Mon, 03 Jul 2023 02:45:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbb346279dsm13805286wmd.38.2023.07.03.02.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 02:45:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702185327.44625-1-krzysztof.kozlowski@linaro.org>
References: <20230702185327.44625-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: minor whitespace cleanup around
 '='
Message-Id: <168837750146.1068586.11226295971012110711.b4-ty@linaro.org>
Date: Mon, 03 Jul 2023 11:45:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_024504_013244_6843F864 
X-CRM114-Status: UNSURE (   9.21  )
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

Hi,

On Sun, 02 Jul 2023 20:53:27 +0200, Krzysztof Kozlowski wrote:
> Use space after '=' sign to match DTS coding style.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/1] arm64: dts: amlogic: minor whitespace cleanup around '='
      https://git.kernel.org/amlogic/c/75831c457ea135e01259af8bfa3fcf40c244256c

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
