Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2C6C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGGaB5Frp/aj2aSoG6Bkgha0OLdpus6F/n+HwIVd2wA=; b=Icazjj3aeilJbrzjnDBEx6hK/I
	lnBEL9hCo7w/C0RDypeMyrRf9JmzZulFL8Bj6O0J2L4aWZ9dXPboh8rHYdB3UraeL97R9ico5IvP8
	ItF3eCeOjjnjcOSABEFQNaUf7TziwyGobxSWAhL3C00SPP4eFud2lPa5m81Dd2x3jw+lYsj1vLqvi
	hzvZlmBwfJEBMQHyvE8DGh0FTta0LBSdQxPan6RET3REWwrXUbt0vPhJoID8u6gT72U2lK/yaHNln
	47wYBlaN7cSNwBZs0cDvFERo4alfocVF2Ay8/GrJSQpDBr7LdihfV8uddztT+t7OQY/r5z1cDFcsR
	y6MnLukA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWJ-00000006XS1-2fWc;
	Mon, 12 Feb 2024 17:55:07 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWG-00000006XPQ-2QhQ
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:55:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-33b189ae5e8so1471825f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707760501; x=1708365301; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRsulA9wKxUZFMueNGpnJFLKm00NQFXP6LrhnaRanY4=;
        b=0QEWFDtRLaFts5/BPQZZ0pJOu5OSs2RguhplTRyUvK2Nis0Svhtwp6E/tLvSbNtvak
         53gchD7U9ykHkbfmwxzmIaYXt28yANJRNxwQkJDY3VWhObeilygVnKClGokPUEqs+xOK
         vuPnikzwsaYs10DnNtblOmzfk9bjORVJFx4qJJfERfTPaIeBde8GoGKFCoqy2a+K5lYk
         uK1EJY7hVT3+Vne/qhUmf/qCmpso+HtJB4xxXJsNhDaQN1qCK3KLVO2G4vSDObZBIRYF
         oL/SMdSjcpVbKqTlglR2vJfaWVhSelkTaCGSik0eeNWRjw7zxG0RRk9DX5GLQTo0yxXT
         DjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707760501; x=1708365301;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yRsulA9wKxUZFMueNGpnJFLKm00NQFXP6LrhnaRanY4=;
        b=arYQNOsb7XAHRh66OGLOO206Za5D/cOq/VTOO7k0hHCg33MW9EnTtK5Tv3O4eaE86j
         8QeHETZyHHR80NBqXRlumAEYxzlR8iihUPP+YuUDQet0fUmYKirMR+vlK0kkLhcBQr4v
         O0lD401ZErgxocCyVJsy8Ri5G3iVDzp3YUbYHwpBm0lG19moJG1VeDopBdIJtOYZWWdr
         Em93g7GMarjFFaRDSd0CBsI8udHdedw/qnu8uq+9PyP2LVn5xLP8C3A/ys9nl86Tur4j
         M+cTyeRsMlM5SWYR9SthMSaoESck2DGyYMmKKLsgguPPMe2a6h9XmxaXtr8k03FA9xv+
         MVDA==
X-Gm-Message-State: AOJu0YyIMQ1p9AhpkCHMXffGYWNuNEyN48wZO/QQu8hyDMJxbP0+1MqJ
	7mX1nIK2WOkt28vE2Ksi4P3Yl/bS6FeaZ/gtaYf70tv+KRO+XkVKfHTNbxfx2eqSgZue//TcI7j
	dgC0=
X-Google-Smtp-Source: AGHT+IG5madseBdrajPLDfi0JCmZAVRobzfk5jeLqyUONyOfoYpeCPi0a69zI4Bsl3Q/LkUSFq/W/Q==
X-Received: by 2002:adf:ee4a:0:b0:33b:74a3:dcfb with SMTP id w10-20020adfee4a000000b0033b74a3dcfbmr4566180wro.1.1707760501088;
        Mon, 12 Feb 2024 09:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWsN/zwLrqeA43ZV7v5OAsnu3UizrfqlhAFqAMmkLXkWNl5y+f5YWLR7VfGDVBy24P5uiVzvF5UJT/lCA0lKWH3iM27/yRddiuJSTBqYr9Ysv6TPobJvhtbwSlRamJFVfVzKsuwIBOxsARCHhMTx9jGKBgmwl5tzHgLiRFthQ1hFnC9nDpM05yxL/7lKLHx5nRncAbssSVF2Flr1uMlbGmSeJqdkIJzyMwqfciFtKQHbZdGp882oaUwHGFceZ/irRlSlGO3gqtDU/J/7pfcIDEJVRdeHrq9CX6fZDUHNIuKpssT3Hbm5w0yeVp3klJ48KZLiKoeGUb7lgIIMk8ukbizKYfNZNSdbNpl1p6SYGTPMQ0=
Received: from ?IPV6:2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9? ([2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9])
        by smtp.gmail.com with ESMTPSA id z7-20020adfe547000000b0033b55186901sm7380912wrm.94.2024.02.12.09.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:55:00 -0800 (PST)
Message-ID: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
Date: Mon, 12 Feb 2024 18:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2 0/4] Add support for Freebox fbx8am boards
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
X-CRM114-CacheID: sfid-20240212_095504_691370_09600E26 
X-CRM114-Status: UNSURE (   7.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for Freebox fbx8am boards

Marc Gonzalez (4):
   dt-bindings: vendor-prefixes: add freebox
   dt-bindings: arm: amlogic: add fbx8am binding
   arm64: dts: amlogic: add fbx8am board
   arm64: dts: amlogic: add fbx8am DT overlays

  Documentation/devicetree/bindings/arm/amlogic.yaml         |   1 +
  Documentation/devicetree/bindings/vendor-prefixes.yaml     |   2 +
  arch/arm64/boot/dts/amlogic/Makefile                       |   8 +
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso    |  35 +++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso |  25 ++
  arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts          | 462 +++++++++++++++++++++++++++++++++
  6 files changed, 533 insertions(+)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-brcm.dtso
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am-realtek.dtso
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts

-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
