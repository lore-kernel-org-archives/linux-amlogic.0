Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDFCE784A5
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Oct 2023 07:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V50kYdY8a+7IjNDZmBoJnvPfOElMiRkwUjemvsvcvK0=; b=yhYgew/KwV7W9M
	5pciMQmRMLko4toZ6sfUqwJUMr+PrsVTUjjfZVtfylH4avZqV++8f1L8Vpup62BKFI9SjW5yP7z5q
	VPZTxebMEHLYuaMqHzBstgww5M6EbGd2eLBsH1G42o0sGcVh0S+tRjx/UdxjHxPX5Xu3QF49qpBd6
	iO0G+rrk1HwZ/VlB0cxEz82XpoaxeOvsAjcmnylKk+XizWsZ3ULe9d0D0OZJi+dwSOSBtHVKrcZt6
	TQOI68AqQYl2h8SyVyxyJ2Xlrj9eqiTs+4uATHWoGqBpO8ZeLtvCUUUK+RgwqzdYIlg6hlJEPfbql
	UReRmCLKIjE1xiEGXPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvX-00C3Ve-0x;
	Mon, 02 Oct 2023 07:01:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnCvS-00C3Ru-0W
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Oct 2023 07:01:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-323168869daso13374455f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Oct 2023 00:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696230064; x=1696834864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G79IkftTdFffJ/4k2e/DJu7Tk+lTg55yvXL6JLueHng=;
        b=qJ1gpwQv7mtviA+QVBUURgLE0BGexXAoGKKhmW4dHCqfojZZF4e2FJA6x5Cvv5evm5
         Z+dSW0GR1jYVUx3gMhkpZgnOXANHrZKpXTH4z4vw72vtaiGasTYhr1qj4ogVIhMhRdkH
         nzjXiJZSxIfbC6dLXTf6t0XY3VGilcF0DLadmmfoAC/SLerR/fVgF8mSTbfAnxnYhh/4
         5ZJw3rD8QDWa1d/CgBScXZz6flvis3E4XUbl2SpmRP8qomGpHO6ZmONhhMZD+jpqP1oF
         qdtvbg7/kuhVtQYZ1I+5ChocKXf0zy4yjcdkKRhMbOdOyEpNgEnC0OInoy6/nFFIn7NV
         51pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696230064; x=1696834864;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G79IkftTdFffJ/4k2e/DJu7Tk+lTg55yvXL6JLueHng=;
        b=TB0CxF0biQPTF/kHg8C3b37Uj/4hn6uzjcs4GNKZ6gjBtRIv+ue9z42lEiHulYfmGW
         UC4s+F+203zQLd4cQKv2qouA+euJFFUoWFKpHa2rLeiVFEg/U04lZvWMxciUCBmxKCce
         RRXWAZR6wSEHOIglMcNFCJH84aVSLl29jhkl3GSPZraO1X9Vkyv2UJCsftZ+6j64l2bj
         fu52fC1K1jR1QlldVVRHdibG6tFUL86oSThILfxnmWQOEnsmcBjFZPRQkytvwyRZp9Fw
         2mFzp1EkX6KIEg85olFIsUQqUROxOWQfO0IexzPZnXnaUmbuZq8J0yMSZz0BmlGIUYDU
         If1w==
X-Gm-Message-State: AOJu0Yy6foP9/8cCO8ZEXAC1X+viCL8E4hi/ernZTRHtbbkEvGEYXhVa
	wups17EGlghQxNJhAnT11g5VcQL01I+mHh1cpvEm7U/f
X-Google-Smtp-Source: AGHT+IHdV5fE+2gVQbFFIb4wBTGhXybfEbxm/P57E9Y8VuZzaOjCBDQt8iWWiqEYIjJoW67GLsAOKA==
X-Received: by 2002:a05:6000:1a46:b0:323:269d:5a7a with SMTP id t6-20020a0560001a4600b00323269d5a7amr8659126wry.5.1696230063722;
        Mon, 02 Oct 2023 00:01:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id r17-20020adfda51000000b00327c79ca7c6sm2440715wrl.80.2023.10.02.00.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 00:01:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: olivia@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, conor@kernel.org, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, f.fainelli@gmail.com, 
 hkallweit1@gmail.com, lists@kaiser.cx, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Romanov <avromanov@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-crypto@vger.kernel.org, kernel@sberdevices.ru
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
Subject: Re: (subset) [PATCH v5 0/3] Meson S4 HW RNG Support
Message-Id: <169623006266.3465675.18104807906024050196.b4-ty@linaro.org>
Date: Mon, 02 Oct 2023 09:01:02 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_000106_197574_33AAB5B8 
X-CRM114-Status: GOOD (  10.66  )
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

On Fri, 29 Sep 2023 13:29:35 +0300, Alexey Romanov wrote:
> This patch series adds hwrng support for Amlogic S4-series.
> Now, S4 uses a new random number generation algorithm.
> This changes implemnents new algo and also adds description
> to meson-s4.dtsi.
> 
> V2:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[3/3] arch/arm64: dts: meson-s4: add hwrng node
      https://git.kernel.org/amlogic/c/1e3dbe8006247386592a2fdce3a52cca15625997

These changes has been applied on the intermediate git tree [1].

The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
