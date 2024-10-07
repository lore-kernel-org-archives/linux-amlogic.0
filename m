Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D1CFB441
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QaC9q7CofDIqLZEj2zl78t1RRkmyCnOTLydNUMp+8fU=; b=2Zz5KWQM8Zc05w
	VAfnyCQmT6ICe4pKhnzi0TSnB8Vga4QV2xmfaW3LzdM3APclh00c+Pt9+Nd/KjrwY8pi/dWurPTwd
	YEj4cN9bbghbbgW1dfdgLFjC7KYvTR6ojZmDS6s6CrxiPw+4EAnuUvghY5UXPXi5X22hNJEjaA58Z
	Bqv73wemsLswvJWlM8hNW/f34iDBxWJ+KYZfS8BcUikXMr1FAKAyDyoYjWH6NXsLYBXROf1q/13Ha
	5lwEtIPIORHjOZHWfP3gejCHod+iG/SgwypEqBs8PUQs+FM3JXHOLalAffx8ogWyB+ZXjTVeNpIn4
	exZR2z89SommBQDESRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoh9-00000002iQT-47pq;
	Mon, 07 Oct 2024 14:26:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoXL-00000002ffm-2NYN
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:16:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42f56ad2afaso60418155e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310594; x=1728915394; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/TOM7EB64+eyeu1JpKwXmL1gp84yFTLvnsIJDegP4w=;
        b=lahDvJN8MLq//igPDEkXb9FHslZ/xqUY/Q7qRHS4yYYGQX/ELW+AEMt00UGg8gVsxw
         Q60LSojj4phLf3dp2jnZl8YcNrp/BxaH+oLVFcVCagEmJkP8G+G/8cembjIjtE3GREO4
         GEHmW3zyLYUJG5R5UtLELZSaukODN/Gy88bJFeb2QWHNNYvhujG2KKU1OWyPfcjv42c+
         K4ifq9QhI/6IJ2Odh3o5SR3zY/KpM1hPgqUqTl2qCXHXiEURtiu/v8gwlnrc7yHGcBLK
         RN36ina3HVb2F91EM5X8aTTU5uKd3Gyd9S7adIVeQDgLv8ggvtxmxl3TWvvKMiIaO9ry
         bfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310594; x=1728915394;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/TOM7EB64+eyeu1JpKwXmL1gp84yFTLvnsIJDegP4w=;
        b=w7xmuVp0aU8+fAhhUmOrhJa3IyNkW1pXEJm/zxj71VEkjHp5x6xVm5ztZkxJP9gx3X
         CZL1xxhw8UawRZKSQAAty9NKDfm4LeU0nFwDaXZa7vlNZjr8/9DyEu4WPrPb4OSsKsNk
         1+sSC0bvDB9yThIjfX/Bv1FfXVF9UDPdl6R/HqeAnO2HcxGoMMrj3BAOiz6ppNV93F8z
         n2KOV06ax4k0OEIcvUigjojO1y8fo9B1mfb7aTB7hBw742rj2QB89gck3xQhJv4sFa7Y
         V/HsNMT6YJ32+c0xcM6kkPY/by45oNFnlqq8ZmYjB19UW61wG71Sm11V4G6Bw79JuyeW
         1xMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOC1BmVnAamt8boUrBNpwTzPN1E+iNQgiYkePjQB9BhG/ttTuh/wOLy6ORTPLItyGEq7MkAzfj/yotzd5t@lists.infradead.org
X-Gm-Message-State: AOJu0Yydemt/XZoccPMImPAUAdUDhMz3DGDV9RyiFx1rybJc39XryF3W
	WLmy9bFyGDfoiGmLpqUY33syft8q/nQ5gHBU+JmivD+SoEDr6fj1iHr8f7sRN6U=
X-Google-Smtp-Source: AGHT+IG04331dVtmaVR4lXQicn5AzQqZD0RSic7wGjyhOhclkIxnftFNWZzaSmZpQMgfr7SYxPHz0A==
X-Received: by 2002:a05:600c:4686:b0:42a:a6b8:f09f with SMTP id 5b1f17b1804b1-42f85ae942cmr116660645e9.23.1728310593652;
        Mon, 07 Oct 2024 07:16:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a20537sm94197965e9.15.2024.10.07.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:16:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] dt-bindings: pinctrl:
 amlogic,meson8-pinctrl-cbus/aobus: add reg for cbus/aobus pinctrl nodes
Date: Mon, 07 Oct 2024 16:16:24 +0200
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-v1-0-d3d838540033@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADntA2cC/x2NywrCMBBFf6XM2oE0Spr6K9JFTMc40DzIRBFK/
 93o6nDgcO8OQpVJ4DrsUOnNwjl1GU8D+KdLgZDX7qCVvoxKTdhyYY8ubjn8WONZ46tIq+Qi3jm
 tnILggz8kGElyslg4+VY39M7qyRhn59lAPyiV/l3fvy3H8QUYcO5RjAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3elurgGVViKCPdpbSagNfEraZxYhYLBwgqU9yeOTtu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+0/oMpaDd6H3HnheIXgpFZlSsGTrWXBj4P4znTb
 y1PAbreJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPtPwAKCRB33NvayMhJ0V6wD/
 0Qf9gVnJ5jjPEOqXfPvBa5NRnfVCbnAR+WdosYfIDfzPALKTNcTYEVtTUkCzFckK6VpNo4C8zPtwM7
 PZxufPchtnPKPsfkMC6QChjBYNHIfeiIVFK9/137/JvZUp+VyMLtf2Qb45D1syrtC2+uVJFeYTXmpt
 FZ7PtCFAo0MWv+qwnQDZ1e/foenAMxi98iFjlu5FhB/pcOdXxjQD4Hfkn1WO9Mo6cRlq/PTWpHbHxk
 t53eW7CObQtkS6T/CfLSKAe5UPGKKojGolTT6zLennMLv370jDFvr74TCygjcmkSCuAiLy6eVwPTXS
 y4hDd4UoCklL6BXpQbE0DRFSfpQph7gtHCqp2gz71exdkJY+xo5pEnyXXqOMpIC29PQ/jwkS6euAgd
 vQaeJEfo7HG2uxXmkauB+vw9F2aDU/h28MhFz/8vVFGRdhIRwOr5nEeF9cz6Jb+m4tZy4WxxWEUwfD
 6EZxVKO0OMbvoyGqkGtpmt/N9aUSsMQNA7GU6SNMSJ+2cg3iDFXOnEfLR2KplAEitHZZ2cciP8/iRq
 t9FAHZN+1ZLyerb7O/H1B1oLicmiTrfvZ0ru2AK93Erp3+o0U1+ZVeysRClj95h4W8EUGebik780NG
 DENgpQ73SssgIpvlfDgdiK9Rd4RXnz3s/gw2uJ+KgIN4NUY6TXtWGgMudcSg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_071635_625789_07FD501A 
X-CRM114-Status: UNSURE (   6.34  )
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

While converting the Amlogic Meson pinctrl binding to dt-schema, the mandatory
reg property for Meson8/b cbus/aobus pinctrl node was ommited, fix this to finally
pass all bindings checks.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: pinctrl: amlogic,meson8-pinctrl-aobus: add reg for aobus pinctrl nodes
      dt-bindings: pinctrl: amlogic,meson8-pinctrl-cbus: add reg for cbus pinctrl nodes

 .../pinctrl/amlogic,meson8-pinctrl-aobus.yaml      | 22 +++++++++++++++++++---
 .../pinctrl/amlogic,meson8-pinctrl-cbus.yaml       | 22 +++++++++++++++++++---
 2 files changed, 38 insertions(+), 6 deletions(-)
---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241007-topic-amlogic-arm32-upstream-bindings-fixes-meson8-pinctrl-ca82766a8996

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
