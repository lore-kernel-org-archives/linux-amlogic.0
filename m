Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D33CF6491
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2024 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pz01WL7wxGlavmsP2z+CxiJfBFRCeqDwhHajCgsJtTs=; b=c5YgkDHzsuxgzU
	MtOKrmhjhot/PLPzeFBsF/vbpJZ5WzIcaL3rBflJfSayHrs/7x3Hw/BfUtA02jvQRIc8NdvpA0Qt6
	uEuwEWhOWUSDzOPRHHFQjQ0PEsoCnm0sbEES/59HYLvHhTGeMSEe1qMib/IZzHs9DFn3S9WGZggo7
	uyl8GUZ9EUThYzzNDxs29hFECCa3bcexB2DrZ7a+1K5bxpdd74cYLkr0u9apGxM34F/SKXsaM8MnU
	26hIXeIX7+PU0dXKLHBFpiOENROwr+nvPbO4DxORxZKW64RneGAm7ok/Yww+Q7aIyaMmZ8dCJVmST
	GpWOGb1iOrTz/DQ8dcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svAvT-0000000GBwn-2rvS;
	Mon, 30 Sep 2024 07:34:35 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svAuE-0000000GBdt-0tpa
	for linux-amlogic@lists.infradead.org;
	Mon, 30 Sep 2024 07:33:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37ccc600466so1699323f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681596; x=1728286396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMxWfNknfTUB6R3cj38FCN6jzzF7wQ0JDnIAXp4G6U4=;
        b=V1KkxPaO/KOnXgJXsGMG+be1ulgTwCGnVbCNhGSzaHdXspSq6idTU7zIs9RPkk+qTN
         raDTZrjlg79Io0+8PYfsQDt+0K2OIGKB4BCG0xTf6K6a0SGFhDBltSfKwr0KvcjRCDnb
         LYNvFUqBYvudWCN361waJkVolzAR4H1JqLb+ml+wwyuMtxs0P/hsYbjClJAbiGP51wZI
         dFSeiMZgnIAUXkakznmZxBMUQubxPiXo7bAt/OhU7MqQN37Csa/jM1gnFoP6la/yyuLx
         wwjJAqaw4PlbHHoAmauIbcgSCbFwP97M6ZwIQQZF7e+xVBvzHP6gha6yprK38EvJA8M1
         NHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681596; x=1728286396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMxWfNknfTUB6R3cj38FCN6jzzF7wQ0JDnIAXp4G6U4=;
        b=t0Z0tf/PpGm/y8uxKA8syqbj0ZsT8BUGV9jd4MFLbWNG7IBjVvdDJrvIOjqgbjOMZu
         f7hpSndwpCTR/QQ9sGy8YHGr8jTl0KhtprYv+3tbEu9+mH3x/NRpPBuTQhiBTRB6HL1Y
         zabYrq39v1h0rTfq/Eu50sbycsdvNcuWET26U9765cPy25l/60kAn93+SxqNuysBA6qj
         Sjcui+Fg8faks7gAsJPv+k/1pjEIr0SBSyqD4WJ8RKZDBCg58/bmV6K05cYU+69FaVXN
         /I2NmsTZnXTXKZhWQcxnz878BiCDM6h6JH/iCqSYNweJxgwPpxUO7jQujTIUCNXdKmk5
         t7YA==
X-Forwarded-Encrypted: i=1; AJvYcCXpV3s+/ABOBxdHNn2GTVx8vv6V9OSbKKdbCa1TNpQYwo+VFfinOyLE5qqUqOzd/mN4K3pEZ18lXOSmWys3@lists.infradead.org
X-Gm-Message-State: AOJu0YycLLPE/fG/RbDQFQzKRQ24i4jJYb2XfChnvlgQs77xiE3iOQl/
	tkOI/pXeV6dexUb+AME7qG5x7rRY47Wpd9P3DoeZLmwJYMjvhqMrJvlyLPZTec8=
X-Google-Smtp-Source: AGHT+IG08Xn41kdJXVDyOwG0Ubca/JKXkgQCPYQB7GsDOaOrUQRC0CxYE3vKmZJ4OmxV7/sBS0XcIA==
X-Received: by 2002:a5d:4d06:0:b0:37c:d0f2:baaf with SMTP id ffacd0b85a97d-37cd5a8075amr5976671f8f.13.1727681595329;
        Mon, 30 Sep 2024 00:33:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5730ecasm8312047f8f.81.2024.09.30.00.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:33:14 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
Subject: Re: [PATCH v2 00/11] ARM: dts: amlogic: first easy dtbs fixes
Message-Id: <172768159408.3724290.11483411183659525746.b4-ty@linaro.org>
Date: Mon, 30 Sep 2024 09:33:14 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_003318_293884_E4F5FCF6 
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

On Mon, 16 Sep 2024 10:08:29 +0200, Neil Armstrong wrote:
> This is the easy fixes to start and fully document the ARM Amlogic
> Device Trees, remaining work includes:
> - amlogic,meson-hhi-sysctrl:
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/1be8f8c67e5b83fa4069ccbcfa80d0614f668a65
> - pinctrl: Unevaluated properties are not allowed ('reg', 'reg' were unexpected)
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/8b408ad0781b4eb28a86aa04be136bc04ef73f0c
> https://git.codelinaro.org/neil.armstrong/linux/-/commit/b6e9df5a7a642ee757e3aa0c84236338151d9f6d
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.13/arm-dt)

[01/11] ARM: dts: amlogic: meson6: fix clk81 node name
        https://git.kernel.org/amlogic/c/78233621aca725ef851c6c2fdace1c169680f94d
[02/11] ARM: dts: amlogic: meson8: fix soc thermal-zone node name
        https://git.kernel.org/amlogic/c/285d2d647f4dedb15f015d9fa5430defb9a35897
[03/11] ARM: dts: amlogic: meson8: fix ao_arc_sram node name
        https://git.kernel.org/amlogic/c/e1d42e116770445e11a4062e28f23da70ea63d83
[04/11] ARM: dts: amlogic: meson6: remove support for ATV1200 board
        https://git.kernel.org/amlogic/c/e2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[05/11] ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
        https://git.kernel.org/amlogic/c/6c180982d08b79271271e138399b68d2456c65f2
[06/11] ARM: dts: amlogic: fix /memory node name
        https://git.kernel.org/amlogic/c/7947fd2d350e6057e7514459c7ee2db39d1096a2
[07/11] ARM: dts: amlogic: meson8: use correct pinctrl bank node name
        https://git.kernel.org/amlogic/c/c3806b25c0f3b95a7f6e6edc23f93ff293173bfa
[08/11] ARM: dts: amlogic: add missing phy-mode in ethmac node
        https://git.kernel.org/amlogic/c/e4940a57791d6accf95e822c10807af18e8e3c7d
[09/11] ARM: dts: amlogic: meson8-minix-neo-x8: fix invalid pnictrl-names
        https://git.kernel.org/amlogic/c/bf1f647c3af4b83683ba31b1ed359aa2cf5f6aed
[10/11] ARM: dts: amlogic: meson8b-ec100: add missing clocks property in sound card
        https://git.kernel.org/amlogic/c/ecb81fe2ffde2b925e46e4d02816a8292a7a3229
[11/11] ARM: dts: amlogic: meson8b-ec100: add missing gpio-line-names entry
        https://git.kernel.org/amlogic/c/9d8706ba5abe9cd2b7e326dc51bc2bbc7c0ab9fa

These changes has been applied on the intermediate git tree [1].

The v6.13/arm-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
