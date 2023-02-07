Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB3FC636CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bUdANAjPyVPLwoImv2QyrN6gsdH+6SMK9M0bdfnr0A4=; b=O21g9el+8KJgkb
	5/9lqA2SDRA/bP//8dsrMCpFOPRIXWCsM3ZmtZxwvVs7hm92BfaR3ZvxxEGyY1hMHeaDqdZko0Wog
	QmLdtMm4r6XawPjOe0sqlUz3sKW+4U/+p/MndBBIDRM89bpfQKlK8aXrQeuWEgXnQpK7nvUDH+ygy
	++nqsmWqdcn/asN7bfkxsxrwIA2T7NOB3qCWIYZXQ8urGKdvnIvWl3O5eaiDsPYkd/hMRWLw0HLhi
	MCm9FN9MZpCs56JoowBA8ss+QFkCY4CPhsUYKJe/KR+dKM7pXEi/0VXOXx70mAZ43Ko5EOaQDqfUb
	0fQ02MR1bRSl5l1JB3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa8-00Ccl8-PE; Tue, 07 Feb 2023 15:08:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPZw-00CccQ-4j
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id n13so11245327wmr.4
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6bqU33+r5wg1bDOt4lLxEqszJx6rRIP0ZQ1eAnNbQo=;
        b=m35BdNTGXigoajEBD4KJHI3ZEp90EO9d0j0ocCwv19eGa/XTHcYQyN/5+CNj2emnhL
         sI2OIeoZpdI+wX41Xwvp0oK/FGmmI107ZvjfdTaPPP30WmcauzYHq9IyCbIZ4/IFQ6zy
         eFPcG1Sto0/Q0qRHwO6kzlXfMTbNXLvxklBJpnirj6CgJtSNrWOF/yYfkPc3zQBP9p//
         xULyrGepehlpl8KZeYwwXB6RQGqy01SHjS9liraKG8DDLRCZARtXyzF+tAXBn1mX2LNO
         qwanuolppBC9OrtvOuhMj2K2Qgs/2enH+rMw0+Al5iPg54IU0wXgU+qxjg/XOeWelIeF
         px6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6bqU33+r5wg1bDOt4lLxEqszJx6rRIP0ZQ1eAnNbQo=;
        b=Iatn55lp/MZ5AXM4whU/G5tLBeVF5BU5fOsyt5f42I+1RdPkJXg/8L+itUcJFxpBcx
         +5fTHg1PrmzGSICwqgxkwTsRD1b4Mz50kE9ljgJAbLWZIYrM9519MAVYOFvRpeIxUfgs
         encGI33Ilga8GvX/RFDW0QLu9+TkWXKH8l6kK+jBqXbbsdfzye/lIyykFeETGEGPrzqH
         l6DB/9tSiVhbVytASkT8S7WRovJ+mWFA78U0SRCa3mLK9DZvXGsUCUzliKawgR5eI0Rc
         1T+vomEaHe42oWCxQBr5OcJiiH4kCOwkMhyuLfmQ1w9tx9jN1aJQgPfccqaAaEGGX+VW
         GLfw==
X-Gm-Message-State: AO0yUKWh3CWRy1E7RkppOXzEEGGC4S5x15kCR91rdlA1llwMGts1dWGz
	dhadvXkVMGek46M8pYa1zAcWL9OtWXMcvk62E3s=
X-Google-Smtp-Source: AK7set9cN2FNtyGytBUIe0vfKArVWGZFJQYjLm4mHZWHSROjj5/FxQ8+f62tJN76nC2GkphRpP6W1w==
X-Received: by 2002:a05:600c:3197:b0:3dc:5240:53b6 with SMTP id s23-20020a05600c319700b003dc524053b6mr3522038wmp.6.1675782493999;
        Tue, 07 Feb 2023 07:08:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/8] arm64: meson: bunch of DT fixes, take 2
Date: Tue, 07 Feb 2023 16:07:53 +0100
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAElp4mMC/x2NSwrDMAwFrxK0rsCV2wZ6ldKFP4ojcJVgk1AIu
 XtFlzPw5h3QuQl3eA4HNN6ly6IG18sAaQ5aGCUbAznyjtyI8YbhU5ciCaNoFi0dJ/lua8edkCf
 ymUZ6JH8Ha8TQGWMLmmar6FarybWxLf6nr/d5/gC1bdjNhAAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070816_192043_CF38DB7D 
X-CRM114-Status: UNSURE (   8.27  )
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

More DT fixes will be needed when full dt-schema conversion is done.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (8):
      arm64: dts: amlogic: meson-sm1-bananapi: correct usb-hub hog node name
      arm64: dts: amlogic: meson-gxm-s912-libretech-pc: add simple connector node in fusb302 node
      arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: remove invalid #gpio-cells in onewire node
      arm64: dts: amlogic: meson-g12b-radxa-zero2: fix pwm clock names
      arm64: dts: amlogic: meson-g12b-odroid-go-ultra: rename keypad-gpio pinctrl node
      arm64: dts: amlogic: meson-s4: fix apb4 bus node name
      arm64: dts: amlogic: meson-sm1: use correct enable-gpios
      arm64: dts: amlogic: meson-gxm-s912-libretech-pc: remove unused pinctrl-names from phy node

 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi  | 1 -
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts      | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts          | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts | 1 -
 arch/arm64/boot/dts/amlogic/meson-gxm-s912-libretech-pc.dts     | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                       | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi             | 4 ++--
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi               | 2 +-
 8 files changed, 12 insertions(+), 10 deletions(-)
---
base-commit: 49a8133221c71b935f36a7c340c0271c2a9ee2db
change-id: 20230207-b4-amlogic-bindings-fixups-v2-ef23d2726c35

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
