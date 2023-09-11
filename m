Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DC5EEB58C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gc6AYfwOKUkIuZNjdKajgY84rYtUtmriftdLpa5EFmA=; b=LSiG2qw35cSv5C
	9nHF3JNHb8QNYpELh7zsrX6g1rcT35h5O3gunjTT7Zl1YLpkXDEYCQyqMICFCJT4RUwBifXDMcPC1
	agcrQcte8FacU4j2gdOvBM6X53xPlN0yOs3ish+t+L4N0uIg2IRWJwJ4WEwYtcF3QvMHwXhkFWWu6
	/F2D3VxI9tVixF/RtVVd/NT0jR5ahRjA1wWJ/ZtnNkzuOyZsdMWx69TxbL7UZce3bFhydOzNXotjI
	t7IwZ9tz4Ja87S15/JXPnNCDbnYR0Ejpvnxl4NJY20Qvnb0P3OoUE1rt8Kd8DaLQInxkUflX3GvA0
	mPLTCXqwKv+I7LQ2+wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdVF-0002v9-30;
	Mon, 11 Sep 2023 09:46:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfdV8-0002n3-1g
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 09:46:41 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-402d0eda361so49339765e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694425596; x=1695030396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu69MSnmFMeVmA/ywqNkVmNnVb7iUthstBma+X2X8nw=;
        b=v9gy9HFCKyK3TcUSf6pbD/2NSTa6UX9eqt/Mst2K1z6tbzM528wnKaFB8q91UTKOVO
         n8Cryp5wrwKqXMtdpLAzFuBs8O6QeOLCPeQjRxz1gnktVleGDha1G+WHB+XBeI+gEPcb
         XhsWIZ0FoHM2byZMVZTf2Y69fkBhoOZ/KgBaAlN4FlNKbY39WA9EjKCv2rObcTAeEviC
         4LIXQ5XOkGW9uJLv5WSsvsc4oU3d+Az+sm2yrk9qz331z5CCRO8c/0O2/5pIEiOutxDm
         QLKPKzfLNhoyna2AvFaLRmMOBJA26auSCVhiHoX5/Yey7Sh/J/BLRMU04q9N9r78caAq
         gcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425596; x=1695030396;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu69MSnmFMeVmA/ywqNkVmNnVb7iUthstBma+X2X8nw=;
        b=tv0Z0c8Suv8D4UlSJ9ibuF/ppeDruxytHoi4frQHrjfV1/K2qTS/6SkMHd/cus6RYT
         TJYIig4eVxcV5b48t+nDcMuaq6hVLmrQAfMHXrqy49NBo6x9d3tyWKCRFa6BlIiycNRK
         zKVyvbDhX6UgmtZMhnrCxNi2wyRjWhrQExlV+47Eb4O9zNOGx6c21p7zdPZ63LMXK5PD
         eZe+MHStWCNyeZG1Y29mJLkCNkcrbXPxcKwRnC55lDUg8DnLK5pprrfWtli1tpum4qBQ
         K3nXgne8IF3aSLGaVYSlzXnWBJfLSMGe7wx9wCuZPL5a61iOxfG6K/5SEB6F+XVJYVWn
         84/w==
X-Gm-Message-State: AOJu0Yynd3WwB3PKw3jSOjLiwNLwbQCM5Il8DOk9whPRer2ncHu4mFSB
	uBmGAbF7uDFtmVeaV9jmzdsFlg==
X-Google-Smtp-Source: AGHT+IEdAMsjg/8Nxa3KFLooWk85wnZwMH58KM+GWT3T2xUcp1qWIO6JZ3+20GfglYdb4VvXAog3zQ==
X-Received: by 2002:a5d:6504:0:b0:31a:d4a9:bdac with SMTP id x4-20020a5d6504000000b0031ad4a9bdacmr7348578wru.11.1694425595971;
        Mon, 11 Sep 2023 02:46:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d13-20020adff84d000000b00317909f9985sm9503496wrq.113.2023.09.11.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:46:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Alexander Stein <alexander.stein@mailbox.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
In-Reply-To: <20230808161755.31594-1-alexander.stein@mailbox.org>
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
Message-Id: <169442559509.3235506.11421514573376566938.b4-ty@linaro.org>
Date: Mon, 11 Sep 2023 11:46:35 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_024638_559328_FB0DE80B 
X-CRM114-Status: UNSURE (   9.42  )
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

On Tue, 08 Aug 2023 18:17:52 +0200, Alexander Stein wrote:
> Binding specify order of clocks as:
> 1. "sclk"
> 2. "lrclk"
> 3. "mclk"
> Adjust clocks accordingly. Fixes warnings:
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)

[1/2] arm64: dts: meson-g12: Fix clock order for amlogic,axg-tdm-iface devices
      https://git.kernel.org/amlogic/c/c92997482e70c67ce7b9b32344fe85c4b0cb701d
[2/2] arm64: dts: meson-g12: Fix compatible for amlogic,g12a-tdmin
      https://git.kernel.org/amlogic/c/a42b8f639298c57f119c6d5f55a0c0c87259096a

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
