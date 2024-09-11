Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDAAEE498D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oocUzc2fw7GJXGHzkJ9L/QXt11R9EZsxzXmvYsbPl7o=; b=zfOQ5dLeshx/no
	d9kcytWgwBWOs4lu9Xl3+b9D7vRaLY0geeJPgVaqsPskz2aMUVgeFrHQqUX9BGydcFmPElxHbkL73
	nzNrCy2Od42OgaKj1XqFPsz2FMjfB3vnhQ9QUBFABSNCGv49EZ30CF3fhaoQCJ2VyWN7ey0qoiMiJ
	MD08PXtBXWX4BmS3bySx664L1MVayxLKmndgytkgpX58UjwQXyz6mEpr2vtFnYol2ReHifdO47w9r
	w/Y3NidxslHLvqVegKdqgZnj0I+7zYjedMz6HMxz9Dcen8S1RWMbZvoDsz82013pfG/RdCcGEWuDb
	s7X7iHtUt0yCHLt//LHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKT7-000000093fw-1GOd;
	Wed, 11 Sep 2024 10:21:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS0-000000093Hz-1c1G
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso33342465e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049990; x=1726654790; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=96yG8AVdNMxnIxnB94qu7RH+H08O/gbR0qIlFpmUYlA=;
        b=PuFrygqEHS9DPX9AGrjIzu3LZqh0m68xn5vXV4crZ4AT7JR9PWFN4v6Qk2bxD2PxuY
         vTDTWGjSbv4Sx+p08QQsEthjx3xa835BBxZ2TrbsbFarw4XDPdsLw5YRok0oLWPjnqzG
         DvZb3oBPqSZcCoT/Ol8Lf/W+CI0oSFdPr+EzTTXwkN39P1uwc/00BHw4xUgLK+o7Nkzt
         Fwr3T0kGYiekH5FDiFST+L2CSayhSUvTPkPByMY2duLh4KgPlByobRIUuU64A7gpJMe5
         0d0UV4TQ6kqJKbB4Bb/arcqeqKeHhO1deCB8OtMpElOIIEnxUgPEpmr338Dr4KRthJ7A
         W1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049990; x=1726654790;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=96yG8AVdNMxnIxnB94qu7RH+H08O/gbR0qIlFpmUYlA=;
        b=PZAohzpsYiyIloMoOPZeep8AgPv80HGCn0zmzc8D4KgZa/aYryPkF4ZS12FRIWDZMY
         uoOkYWoNtrPpXFfpoqJsp/juqZx5uh4QREugWQEQSgablFNPREHFDwOK5gssscis8zUP
         ZUL5ehdco6dejMZ11FM2d1Qs3iA8hHwOa5lJAvbcBt6opARxXN7zD+KpUexmnhIxyNF9
         EQxyXloF7f0GJ0YbPHm72QQmDcNQLXA2bJj9THwYmOna5tOstCvdBO+wWjrul0PzxEa5
         6XG8IuTJBW+s0Sbe4/1tK+MPNYcZM+ILTz8ACj/4bEncCFaqMNccl40neiPuKXy8TiN/
         w8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUX7uVQj5PLdftC6Ia/3pxNyNvyg8qkqxjuXMnsUQTUhoE/N9GFozIPOeNIiPmQyVJm0C7DNppGuR7+cWT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6D7ZXp717LOi1AMXx5Nan8Kuy8qzP8Wy2MtgfCpOWV2YfZTRr
	vae++LiuPlwtDjPpXAX2sVaLG8NImh+x7+15tJCzL0HXSw/bPe/tM/PEVGMMFlk=
X-Google-Smtp-Source: AGHT+IGUEoYNc2uH+Pzfak4B0Re3ZMX0OoC0u9RYXxjoFLGmJ+QwQ+RGYpN4oOCUwO+jHbqfz9ocEw==
X-Received: by 2002:a05:600c:1c8f:b0:42c:b55f:f7c with SMTP id 5b1f17b1804b1-42cb55f1796mr85979435e9.15.1726049989838;
        Wed, 11 Sep 2024 03:19:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/7] ARM: dts: amlogic: first easy dtbs fixes
Date: Wed, 11 Sep 2024 12:19:39 +0200
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALxu4WYC/x2MywrCMBAAf6Xs2YUmlmL9FfGQxxoXzIPdVoTSf
 zd6GoaB2UFJmBSuww5Cb1aupYs5DRCeriRCjt3BjnYaF2NwrY0Duvyq6UfJZ4tb01XIZfRcIpe
 k+OAPKc5LnO3kLz6ECP3YhP6hD2/34/gCyjNpf30AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OqK+HbSsS8hmYcqIM5kaII8QKWBrnywz714GdwwsvWU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7BMOfnppkPWxzVr27CrXWQZxnOP+Gnl9e2a2gq
 erHIAO6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwQAKCRB33NvayMhJ0b7YEA
 CmT8GPtKRzmiHJ1fU/1R3hZUPqGIpQSy6HU06jGirrI0Y3DpvU0KS/PTbHbykDNOprNvyVCtmF6BXq
 oHrNWPqHX7nStU+dSnSCiY8q5xdJrSL/rMVkDcqdvuJDG94LNZ+oQ0Wkj6IE9aaZN3LeOUVnE0FZwY
 1363K/V23g75Ee6HwfAXvNC6n55+7+sv1e8jyfMFt5mMcor1PpHZ1TkAcY+h2vyiPFXfjr+GAIrSTF
 OyUlB3Ob3At1KGT0Cx5eiDq3mh7hbaDL/SBiaZ6JYkH7xfMpf/GCmbCZsgUGBmb9llAc/dRSpbMk9K
 vsDJYNhnMNNK4bUkZq67pFBKEL2vlZzVXQcxwpM16pJcUQTy3bE1tgcTO0H/Di0xfscOruH8ixwtk7
 IfDbd/ExooDiYK5qDRpBfomlskDOBQUrtdcdzv7o4pvGhWBjUchBWY4fyhediQgBuC4kdROfOrJZZG
 z67lWbr53AElnYf1Q2wWkIkqv9ykyObzFcNGjDY+Z9J723lA45jt9HKZkT5UUjSKbTr7asP4K496hB
 A5N+To5KmsrDZEuP3MaFpTh2Zzm14PpROzLT+dp+9pDzBJnAXET4YCYSvomURzl8wesDl8Yj7Wcl0A
 ndi80bkrl1/xQTyXMCcbvh5gTprfSAdVcNO4gsAYE/qkxHJrSKDBZrYQ8BZA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031952_615491_BAC705A5 
X-CRM114-Status: UNSURE (   7.73  )
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

This is the easy fixes to start and fully document the ARM Amlogic
Device Trees, remaining work includes:
- ethmac with required phy-mode/clocks/clock-names
- amlogic,meson-hhi-sysctrl
- amlogic,meson8-clkc
- pinctrl: Unevaluated properties are not allowed ('reg', 'reg' were unexpected)
- bank@80b0:gpio-line-names is too short
- realtek,rt5640

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (7):
      ARM: dts: amlogic: meson6: fix clk81 node name
      ARM: dts: amlogic: meson8: fix soc thermal-zone node name
      ARM: dts: amlogic: meson8: fix ao_arc_sram node name
      ARM: dts: amlogic: meson6: delete undocumented nodes
      ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
      ARM: dts: amlogic: fix /memory node name
      ARM: dts: amlogic: meson8: use correct pinctrl bank node name

 arch/arm/boot/dts/amlogic/meson6-atv1200.dts      |  2 +-
 arch/arm/boot/dts/amlogic/meson6.dtsi             | 18 +++++++++++++++++-
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts |  2 +-
 arch/arm/boot/dts/amlogic/meson8.dtsi             |  8 ++++----
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts       |  2 +-
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts         |  2 +-
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    |  4 ++--
 arch/arm/boot/dts/amlogic/meson8b.dtsi            |  8 ++++----
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts |  2 +-
 9 files changed, 32 insertions(+), 16 deletions(-)
---
base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-69d624b8bccd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
