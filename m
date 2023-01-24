Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFF8C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQJEPihkmfj8CIRkX68h047DOSN7JRAEExzrfrFG79Y=; b=ABrfqPYwcJDqaO
	TsvFJemlZRT89XKrxoYX+mM5cqk2WdoBZ4WL4X1wMhmwbqEHAqBmx8BL8/0VgYoDDzcyAKmf1p9O2
	9jozc1/KDh3MS20kNkX/2zZnfg/JW7eVzRmn7sCUroJz3ThYZwjJ57e0vFcaI+O4s8RP1c21EljcP
	vm3jj2YVm9n+dE3jO0+J1gLWAE3kKb378DpEoQEXIvqD4i6F8bWnGnWMu+Q626GiZbypQZSk54Tsd
	JWOWDNUcdhUEt2A4Eiih5L7rDJeA66rHJBtkbFViy/qvGbJfI/HdWlYlOb/ozdl/y6UoTI/nAWOG8
	rfHjeIrOhl/Y2+duX81A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHk1-003VkU-29; Tue, 24 Jan 2023 11:45:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdG-00396s-UD
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:28 +0000
Received: by mail-wm1-x32b.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so10573610wms.2
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WXUqNr0omZn2Rzya6oTYL0L5UK3JiJ1gNmHJWL868Q=;
        b=oEeufaD9IG4HKtBmw9IUpi7PNPFYjWXdfDfZrr79xlRobJLxQonSZJJETp1V09wz2p
         IT7MDFtZ1yu4Fm/Lwr/wTj8apiwgf+Hr952dBVdSjxF5tZUinBPRGJfVFBl+ZrhopX3J
         4DGwIV95rLDAKOx5lVSs69ONN8tNIExvuIPcDBYVZjI8Uytlnfks2h+/NBBjfVr1WwsZ
         WUu/PPtMWJ0XZ/OW3bJr+iyz1Tcez4yV2Uz3W4ZFRbSqsF4iWllxVwK19rHznse1WRWF
         jmSC5kpvv5+sfC6z6ZGHUs1FRpAyqS0GmuBbMzJdVqvUMqQByDjpYhS4v25G9D/m2aJ4
         gRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WXUqNr0omZn2Rzya6oTYL0L5UK3JiJ1gNmHJWL868Q=;
        b=pD3KjgTNjBbKChqEluQTgpar/BCsG8u8bzYr8smzTXrni+hsSarJxNtb93YmXphOV+
         W96+kpNWGJf2vV1zyg7kK4KqvWE9/1QhS4oSI6P27ruZrWLLG8KmFVXah+Syq1VpDBZE
         X1XkoBWoSc8pKzFaoQCkUi5nCIyyBGNX4ccf8+t7WEABvUXBIoQ/DnGvBBPoL8SeskkA
         Sb7hjxtEh5rTRAXm5i7kJxnsoYjKiRZlQ805lheI80guhG5vKUBj3ihOn5gLiGO69XMP
         mh6nNhnyIDqqEZgHoRYpongPv25cWRJ9kLmmMZxoMKmOQRIUNawc8n3o6hl4KNWbQuk8
         OhYQ==
X-Gm-Message-State: AFqh2koAEIQAImGp5eMv24L51by4zBYIfdwewWu4YMUE3NkK58Hyuql1
	sJ9EGTHLVJQkScEbIF8H0MUePQ==
X-Google-Smtp-Source: AMrXdXtDpVKI1j8CS7Z1C7IKcQ4hhQiMgTqbZ6FKv/cX+i+pUeg8ggGJYcqvVFicN+gNwKHwuS0qpg==
X-Received: by 2002:a05:600c:1c02:b0:3d2:3b8d:21e5 with SMTP id j2-20020a05600c1c0200b003d23b8d21e5mr27485228wms.14.1674556464749;
        Tue, 24 Jan 2023 02:34:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:24 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/14] arm64: meson: bunch of DT fixes
Date: Tue, 24 Jan 2023 11:34:21 +0100
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC20z2MC/x2N0QqDMAxFf0XyvIC2omy/MvbQ1lgDXZQGZSD++
 4KP53A59wSlyqTwak6odLDyKgbdo4G0BMmEPBmDa51vO9dj7DF8y5o5YWSZWLLizL99U/QpeD8
 //UjDCBaIQQljDZIWS8heismtks3vx/fnuv4dYe77gQAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023427_016608_6C317BC5 
X-CRM114-Status: UNSURE (   8.80  )
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

This is a bunch of fixes against the current applied and reviewed bindings.

It takes in account the following bindings conversions:
[1] https://lore.kernel.org/r/20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org
[2] https://lore.kernel.org/r/20230124091602.44027-1-krzysztof.kozlowski@linaro.org

Remaining fixes will require a complete TXT to dt-schema transition.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (14):
      arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
      arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
      arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
      arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix supply name of USB controller node
      arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop invalid clock-names property
      arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
      arm64: dts: amlogic: meson-gxl-s905w-jethome-jethub-j80: fix invalid rtc node name
      arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix invalid rtc node name
      arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
      arm64: dts: amlogic: meson-gx-libretech-pc: fix update button name
      arm64: dts: amlogic: meson-sm1-bananapi-m5: fix adc keys node names
      arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
      arm64: dts: amlogic: meson-gxbb-kii-pro: fix led node name
      arm64: dts: amlogic: meson-g12b-odroid-go-ultra: fix rk818 pmic properties

 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi     | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                         | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi             | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                          | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                 | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-phicomm-n1.dts         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts          | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                         | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts              | 4 ++--
 11 files changed, 14 insertions(+), 15 deletions(-)
---
base-commit: d72a45a4d6ec431c761231e3d8846550a6fc8303
change-id: 20230124-b4-amlogic-bindings-fixups-3ca33f937e67

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
