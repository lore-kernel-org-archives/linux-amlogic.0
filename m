Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87187EB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldi2MQ1qa9gU/a4982HbHTDSrgXontpeXX6JLTedPGo=; b=Gwdo/7N5bz/OiK
	526VDaQScZJcyFI9TDeLKg1pKup3KLL7iXah9elLfPBnyrHy04s41HlvRCYyK/Njfd/B4gAU9J5BP
	aEZzAOZkodd+H0+jTh+By53v2xGo5MloI4eEq77oEOocA6JJQ+HuIZ2SZgtUITBPilX2h+DNVOKAH
	+eD/oubEPpss5z2YTwhwFPolC4R+9LOUPlF+EbfARKo9LSLR40qhDvrcvGWujUNskic+AKDMxRRX9
	/c3hgrrxPO3wAm3gSpfyY+rkj4W5uqRq0xxGL/6KUGWmaT3eE8v4m/sPlAPZFLFI97SdBDrSqweXM
	15PCVwPhLfvgGdMVrsEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHghz-003yFS-1f;
	Fri, 07 Jul 2023 08:20:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHghv-003yCc-2n
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jul 2023 08:20:53 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3143493728dso1617007f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jul 2023 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688718048; x=1691310048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P7nX8phUtgvJlXBdE7HbRkDLu02J23oMaWSNoummNpM=;
        b=ZvRIDUsv9vIYR3vOfIKZHZ/QP+RFnql63YTQ2nv/Djpc5JuPK9rESNbVRWm4JJB6Hw
         kcxszPOe05wTw7dGH+e55op5+Lr9kOqpXCsbic8MTApQWi5qmCy5fQDI/Xo2MRKTRByh
         FOhDdF54NLDI8XZDEM0Co03nzublpIdqEbZhkFNvP9vIkM4dPSASny6nALE5HEU6jsLm
         ksl64aDAdJG5c3N9TsdmZqKF5riLzoXId8iPug1/hJaIJdM9upbbnKUZiNfOK63FHvz7
         /KH6Ss2y7OAGJ17mySEv4H1UoCYj9Wdgdq8ouvYEXgh7vdJ+dIxAsZYU/TDqUXryYE4U
         u4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718048; x=1691310048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7nX8phUtgvJlXBdE7HbRkDLu02J23oMaWSNoummNpM=;
        b=iBjTWO0eQD7O/WIKlBn6K5gJ4dJ6wb7SNREN4l7zkl7FqbbfNuihuFN8ZjNRMWk5vH
         gVIvUrow3O5qW+Atv17+sw3rtykno4vcS0qS+WWHfmBfJ7GvcS8sjFCbx16Q4vivKhSO
         jYZtX50p5/StRVX444w2N7wB7/vQKiD+iBfu0AQxlaMbGww6i4kUUoXY8r6RpsSxd4h3
         wjOMpzN/TJU53ixwfwRKx60Z4vJRyPSRJetaFIRfingdcALrMgyymnIAM4vzH1SvdeQK
         bterOZLEZooWa1i9THYQLssVIjQ+FM4yA8bzHVR79BYAzPbn0OXE89C3/yhkBNFAp9/k
         pVIw==
X-Gm-Message-State: ABy/qLYg+64fIu6CzbZ4e4gsjGgvOtPpFLomOlZjgbPbhlLITRfe9ryA
	5pBMN3/z9/wgszmzUQkAOivUWw==
X-Google-Smtp-Source: APBJJlHuX5vVM/UKRZ/aziETXd4ETuHeeEBeYfXppfJI2XzCYX/DyG4sM35yPGMIok5s9ak2Lm7IHQ==
X-Received: by 2002:adf:f711:0:b0:30e:3da5:46e5 with SMTP id r17-20020adff711000000b0030e3da546e5mr3619353wrp.59.1688718048582;
        Fri, 07 Jul 2023 01:20:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b00313e4d02be8sm3824395wrr.55.2023.07.07.01.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 01:20:48 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] dt-bindings: pinctrl: amlogic,meson-pinctrl-common:
 add missing properties
Date: Fri, 07 Jul 2023 10:20:43 +0200
Message-Id: <20230707-topic-amlogic-upstream-pinctrl-fix-bindings-v2-0-2160060446d7@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANvKp2QC/52NQQ6DIBREr2JY9zeIVtqueo/GBSLiTxTIh5o2h
 ruXeoSuJm8mmbezaAhNZPdqZ2Q2jOhdAXGqmJ6VswZwLMwEFw2XvIPkA2pQ6+JtyVeIiYxaIaD
 TiRaY8A0DuhGdjaDFIFvdNfIqBSuPgUzZD9uzLzxjTJ4+h3yrf+1/nq0GDpNqWzFelDK3+rGgU
 +TPnizrc85fDZYshucAAAA=
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=FyjsoTudixydC0nNMdjfVMOeLJOWeJk3gdhNn8W9tE4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkp8revvGyh8h+u4H2kef4fC9pa+RedPwKKGzXjMPa
 X3zF+TSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZKfK3gAKCRB33NvayMhJ0SUdD/
 9MuupduiPkUIemehndLwaP/EAV+x1a1xZQnKh3dtyAmELloWg7peQif3zlirC5c1BdctZJNfUF7lWe
 cSk3/9cFZdd+0FJ/ANgi2kadN+qJ6utMiOO9Na6SzHGnc/JHf68s9963iqzJ7wICkhMK88pz47r/ys
 tMKZWoqiv/Fr47twhZH0fLTf7OMslDxgDrWqtCcX5o4aWE+sYwTzmQkhJbsEx03LzlVvgX6isPa1Zq
 4kA1WIRF1IqvMXZo/PSDWaADi3njfrRPUuEFU1a0cIYMell5xK46CGFrLaN82s9o9Gd8IwBaeK2kNt
 xEHi4UwBMGP8IwuVca0nQG8UmWa4qbS+kQ9pDMI9nt0dlDslO840gQrh5MAmm/2udaBCsG+JdyUzLY
 M/52rnAqJMrOPRj/xQkbeIyWOSn5BMpKFnErnU8cTXYWDbQ7bJrOqYrz+SgDIcsjfKk8iM94s3lA3E
 N8SSJxhx63/GdkI7ztBpkmdPI0F0ouBjPJxf8C11QqDZIE/4Z+HyWdfOVxXn2D2FhU2Rf+QBaFrSOa
 dUOB9VDTVVeyOamlUfOwIe66aErXGXFvLgsgVmM1cNmtTRMLVlGZQJPB3NICdlq56bRqk67syeG0OU
 uLi17EtIDg+GERRxYKzcIuEJ77PFMa6hdwUzZDVTvK6IPkVBz21+lNeqIPRQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_012051_900031_30C58FD9 
X-CRM114-Status: UNSURE (   7.09  )
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

The amlogic DT uses gpio-line-names and gpio-hog, add those
to the yaml converted pinctrl bindings.

This will fix the following dtschema check errors:
arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dtb: pinctrl@40: bank@40: Unevaluated properties are not allowed ('gpio-line-names', 'usb-hub-hog' were unexpected)
arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dtb: pinctrl@4b0: bank@4b0: Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
..

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Added review tags
- Moved line-names out of common and added min/max items for each bindings
- Link to v1: https://lore.kernel.org/r/20230706-topic-amlogic-upstream-pinctrl-fix-bindings-v1-0-fa442d5aae91@linaro.org

---
Neil Armstrong (2):
      dt-bindings: pinctrl: amlogic,meson-pinctrl: allow gpio-line-names
      dt-bindings: pinctrl: amlogic,meson-pinctrl-common: allow gpio hogs

 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml      | 4 ++++
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml  | 7 +++++++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml         | 3 +++
 .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml       | 3 +++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml  | 4 ++++
 .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml   | 4 ++++
 6 files changed, 25 insertions(+)
---
base-commit: e1f6a8eaf1c271a0158114a03e3605f4fba059ad
change-id: 20230706-topic-amlogic-upstream-pinctrl-fix-bindings-c2b74c637872

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
