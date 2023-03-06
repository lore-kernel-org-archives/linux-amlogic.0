Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA05C678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0JjHM8ksR6ZjDbtQddLxDXB/3o9XNf8cvyIH8FMldM=; b=iiW9mG4EEHyvOW
	7CazujAtsKoHKePz7pcum8iRGGsCTCOJ0cywWYc4cJi7rJ2vtdcNEZvgMHUUsi0ORusuIQ8qHO+q2
	QY/DB7uKOpfWakJrBuyLcpy1IBBYVQTPCalEgZoKtPrb7fuuq87nuUmrJsSzubh+W9Hnr9vmu9P9F
	cSGHI8wBLSdqUqUybBwSuwkR2wGBHLJo53i2c5SQ6HPVe4C2P3M9iy/0zRrwCkGGmxSwftO8NCblL
	YUc46f9Wmu/p+R3zXmzIKb+2UYrFf/FLQt6JTN3gZCGZNxhZDP7TEAv/28kRmE7GwjbemJFbwtKd7
	sP4vvCtfCeAobda5Akew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Nb-00Bvnp-MT; Mon, 06 Mar 2023 08:39:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6NX-00BvlA-48
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 08:39:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j3so5097530wms.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678091969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=L/xCTT9oGeZPl+49XiWu7haaTjDD4Czfx7sdxvdImv6E0n4BYBAn3D4PuTH6iu1EfT
         Qc+MRFZRe1qydY49icg8KJFQ51W7cm3Rxef7sE2j1vhiQUa4J11pURkUFQGRsIpom2Ys
         Aa9qUv1vtAj+Mrxe/aA2EeDG+Uw8FMt2DE+kag/IMs6L4wFKz1Js3mmfscN1/k4JzxDD
         pnP/u0qTCwjArowyXg0pmVt94fig6sxuZYh8GMOu+48+IsQwkeUxUvKMeT/A+R1NjqUi
         umfU76E9s2VN2ERxo3ELDHjmiebm1GYGa+K4XsHT0v05y9chlfiMhOLeTgOM2hRtKM23
         4k1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678091969;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdXHSSzFb0wf4Z5ebFpbSvGWzd8D68jDgoc9WISe18M=;
        b=GfxzJT/HIy22KY83ngEVIyMH+o9ep/ZchAwOEXnRu7LaSU23v1QzkpKEmp5B5aRgtp
         GPx0v5CcLKUSS+TH9eyNaS3QJ7kol45iGzo1FkNgi4P/bQ58Cxr6oF2V6jcA+JZ+R4/G
         pWylSkyDFL5qMmDm4BShD9bRhtOrgnyVyUme9YNcXApaEyBY1MAqZttuJmmVR2KjPalv
         w0BGpn5Hqm31ToQ1v+BmRQRnpMSZwVJebktggTngGySJt6KSSjwLSfFGAIaxC/muSWLs
         Ls7RMaqaLzrQk683pSiQsgcYWH3vxiiL6qtqLioR03vicFCouVGo7BffQg7CHm4H9lRJ
         G52g==
X-Gm-Message-State: AO0yUKVpXHL0MWj7kmIo8/V1f4lRI1waWdjDUQJC8m2W9bhdsQnJYtZd
	mwXApBX/rm5dr8sVw3DnLNYmnA==
X-Google-Smtp-Source: AK7set+ZWZw+hQJ/2sk3ResOt44ySPYhF3lJa5MGYX4FLkyMzo9GSQeeqZSK5eB9zmeofrYdEnx6Gw==
X-Received: by 2002:a05:600c:350c:b0:3dc:40a0:3853 with SMTP id h12-20020a05600c350c00b003dc40a03853mr6535425wmq.11.1678091969437;
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm9190736wru.49.2023.03.06.00.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:39:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
Subject: Re: (subset) [PATCH 0/6] dt-bindings: second batch of dt-schema
 conversions for Amlogic Meson bindings
Message-Id: <167809196860.10551.9031776722379367022.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 09:39:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_003931_452774_B35A12F7 
X-CRM114-Status: GOOD (  11.37  )
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

On Thu, 09 Feb 2023 14:41:36 +0100, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - rtc-meson-vrtc.txt
> - amlogic,gxbb-clkc.txt
> - amlogic,gxbb-aoclkc.txt
> - clk-measure.txt
> 
> And in addition document the System Control registers top node.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/drivers)

[2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to dt-schema
      https://git.kernel.org/amlogic/c/2227e738b30bf20380a48391a73752c52f5f5c6a

These changes has been applied on the intermediate git tree [1].

The v6.4/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
