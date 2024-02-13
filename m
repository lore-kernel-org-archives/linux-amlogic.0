Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E79C48260
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 17:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mu5ldgTMEJKLP60ndiERT0CnU+zyw1nlWxBjqaKB4Hw=; b=lxAWnNUpU7/nQl
	34p661Ro0DsU+j4KwGWsazI3k9sCd1RWqqteNV+QFeuHf+KwkHoei9pUUMbJ4jXS0E2KgFDyr6AUS
	POMKwQNdMT2ux/OSeg61W4A/ULnj46HWCODoCJiNKQU705O7lg5GmG00gBU8uzEjyAyQF31ZOCF1k
	Pp5R5wy2gQQDFGw4XWXxtxBUm32hRZGqZixMYk8GIOtVyFq5wyDLGpHk4n985iKKdrAlWfWIEsYvq
	n6Qsb7k2MJt4SzuKL/PBH/H22lX4UnfV95CowbsNLuLBGyy1AZVbRPRz8d4yUjFHw1oy3vlDZ36xw
	vBaFsSV/Hzyhcui2zd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOn-0000000A6oO-2Hcv;
	Tue, 13 Feb 2024 17:16:49 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZwOj-0000000A6mr-2H61
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 17:16:47 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d0c7e6b240so62956891fa.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 09:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707844603; x=1708449403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMBjFdFgnlJQ1ghf1GbZeCMaZ4/XGlHN4HMb4tAkLkM=;
        b=ZmejfD8fii4YltkKj7KIqaIDe659jk7kiYCxIDACsMu0afN48TmVF5My5+XGhkhJky
         cT/jyJqXblSF/4+n3ZKfrZUXe5VfGqrjI0aj38lCTUbqk9a+t5nMac2pdgwHydw0qqUU
         1Rmum9STnmdCecO8STD0rATyT7L2/etQ3KasIuWnQmBssFA8YUJS4JQATLwYI2Ntr3Vl
         mHLF8iKJzos7PURmfH1X30SwppIyAT8Kw2zb6e3gmrmJL45xSb3XlvwZbeXEBAApWb3e
         rkyb76xJyaMpg1TkfJjheBhgwTggkSYoymHYs0KUNoj7uAsE9jFXZah8vhxwwk1SXYwH
         /0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844603; x=1708449403;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WMBjFdFgnlJQ1ghf1GbZeCMaZ4/XGlHN4HMb4tAkLkM=;
        b=MQQGo1o/EsCsSfN02D/G285gPCr0m6lVxEt0XgiEGEMjlDaC7vDpBnKsyOcVPt0NQt
         mGPUBSnklAM8F1CPZ041hz4P5ys0RbDPhiH2XK/fp53a/ebc9brWMzyojJIFyVRRGh3e
         SAQnB6yu/VbqhyKnIEetBU3UZfU/FybNma6gf9LPODQDw1jI3+4Ch5iTdqarqeexERFP
         l24WswDi9G+AnAvUk7x+VSEaWqBfm82O1QruVDBTEPoCtNIcnpX4cX4pUUUpy3MiHY+5
         t9YAURVuuYHUNLDlofWIB8ZE6Me0qMzmv6/FCPkqXw8NgmmTubQmpKpT62cIH/RUElOM
         a4Tw==
X-Gm-Message-State: AOJu0YzWLWFhERbjxCXrdb+oNPCjy+pQuIHCePyaDDXgKHqZ7Y83mpgt
	8g2ilf6oTCkw73gZfnXgsZN9uOcU+TzLorZttMInV/0nMoF4JEQ2IPIoxc7pade+H4GXkfOH+aw
	aCUU=
X-Google-Smtp-Source: AGHT+IFwM02zgH2IUGGDJVPP7QzuLp4Eww8vgMjLE182RHBcOm+Ky+YUcKylOOMcSd3py0ir95OVpw==
X-Received: by 2002:a2e:7c06:0:b0:2d0:c101:7a71 with SMTP id x6-20020a2e7c06000000b002d0c1017a71mr184526ljc.35.1707844603254;
        Tue, 13 Feb 2024 09:16:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyoBr19YLQx3fOo8Z1w5RN4/HmWN4+sU4OAP9gwi9si0X6c05vqJC0dYGWTHTeflvMEoM+TXLBIR5hB1gXY++zW9VuVIilFW/QnDA7v5DNVHI/YNuc16axqcV0ooXm9yH7myLzjnRYGN+SdYuS8EEeEoOOqD0sUj1C362f17sd9ef4vjrKtBN9G3EFTQLo8mLbYHlb0fIkequ+hHLb/foMjONiDdURQCSjRKSXXbNSa3PAkWXkH3RqMJN56MbccVmc9HFHRTN4JexD83Fp5Ds9qVFmRhniB6XsClGpHShUe2+hFPsNe+vNI7ycV2e8hmOZSPX+RKSJ76CTOSg/HMHz/4uVaDTczq/mzBtnEXW70xg=
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b00410c2f39833sm7805785wmq.30.2024.02.13.09.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 09:16:42 -0800 (PST)
Message-ID: <07f7a695-18a0-4211-82e9-b1e2c7166969@freebox.fr>
Date: Tue, 13 Feb 2024 18:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v3 0/4] Add support for Freebox fbx8am boards
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_091645_679859_E227AD01 
X-CRM114-Status: UNSURE (   7.68  )
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

Add support for Freebox fbx8am boards

v3:
- order board binding alphabetically (Conor D)
- replace underscores with dashes in DT node names (Krzysztof K)
- Merge overlays in the build for coverage (Rob H)

Marc Gonzalez (2):
  dt-bindings: vendor-prefixes: add freebox
  dt-bindings: arm: amlogic: add fbx8am binding

Pierre-Hugues Husson (2):
  arm64: dts: amlogic: add fbx8am board
  arm64: dts: amlogic: add fbx8am DT overlays

 Documentation/devicetree/bindings/arm/amlogic.yaml         |   1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml     |   2 +
 arch/arm64/boot/dts/amlogic/Makefile                       |   6 +
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    |  35 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso |  25 ++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts          | 462 +++++++++++++++++++++++++++++++++
 6 files changed, 531 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
