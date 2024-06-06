Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19FFC27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pe1Vgbm2779Os9Xt86qt4/qagGbcMCQxA62WtAF8Gxo=; b=OKcOR7PjNmBeHK
	5rBjz8La0ST23k8ZdYtuUZCqpwOQEfbrBLb2rB39hjDQBbIXRXwJE/jYxOg67i6pNJjGV/UJlSZWy
	5o/FJm3DRZanbSlpwSWKqIEhbvGHSdkq/DuCbGN6iSqVJDvlpt/qkbiTXC/NoKpc6mljp5Tm4YBSE
	/gw9U3G9eUQJ1DTMgiZRCiOkv7HIUQTxAwTWVeVQlps9O/mu5qlAZGHUb03/PoxdTuTCTKKnAHu0r
	XDD4sUQkFImzEqvw3q4hlyGpspeE3LvMcYEJubQ42B9x7BevNzp1Jlz9ThzkkT7AUvNTTUyDe2Ssq
	Nc4NsA5Zbzhko+2k4iNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8oD-00000008v5D-1yoM;
	Thu, 06 Jun 2024 08:49:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nK-00000008uL3-25lx
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:36 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4215afa33b7so7710735e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663704; x=1718268504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=md2vfydVbKRQKv8woiaMeh18dxE+BvhZ3JaDmoNvYf0=;
        b=OkTm8CbEKDcdQYgkfB/6wUeAgrZrbbxnndsmiH49B7UpMttLTMAXAWOloytMpdL3NX
         jliNUQ6GlJu2/V/jmN4bcSJaRCTOM5ljb4C7w6KekFHIz+7Y5c1Pjemb2qE9q032pK0s
         +1BgM2LVVyv9RffmqPx7sHQ9uJ7RgqlcNhJZeM/yn5CeptsuoYfWcOSbk1gojUT3rguc
         a2XtzU4kXX2N9msErEk5zBO2GximoFcl6aAwId1BzjnbUpGY+13QcWF90176gr/IuMIc
         fvw/ZqzdgUJ/Nx9cF2Xo/JaojdrIpTZ0zetda673yuPkyjKjeIupdZj82r+Zv9LM8T8s
         9hIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663704; x=1718268504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=md2vfydVbKRQKv8woiaMeh18dxE+BvhZ3JaDmoNvYf0=;
        b=kfxSW0AnI5d1yiB/unLD67IyWPKjF4ZoQCu1Vo12KJyICZu4zjZ/5fM7/t4qW+ox7l
         gpOHzSnEuKjRr2JWjEeXVM88p0rDG0O+7R8XljjgU3ui73RFVP9Wjo5fQHensjc/2D46
         /N5UDKW/u5SqoWhIxYsAkvu7GEXSi6eLx4b+rl3lDuZujUQloCJQAieLIvy8teGf/RqQ
         FXRGnZHJwNI89fkuA0lHjlOjGzHXANFgvpCjTi2koTqn8yDZ+SqnhtA0K2NkxUNCPtsl
         B1yx0OYlhNNZTVkV1JuD3YupiLUhYE2JdOyTc1Pdvix2BbTnPMfHwAJzAA92BSYwg/6l
         7FRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQUQJ7gLV7oEJCo7nNVKzsbJtgDOEgu2sLlvxE0zUxiB6kkG21nZA5Mrf9pb0pOY7wWy9Ak6CQ0zeEhY716afWGPhVELtkrW5UW6f/tkONcRI=
X-Gm-Message-State: AOJu0Yz9vfkxrQVJNXcJArnhmMjEB7TYD1F12Nt7XmAs2/wX+VeE+17U
	H1b1PKd8eCnTXCITILCNOE7P4s4m+MGVVq10xarnJB4GwgssWVKSolg5OIdHU+o=
X-Google-Smtp-Source: AGHT+IHjqikyO2a2r3mJKCcsb9JEmLNmKaMvv1xJrL/lxQZAcEccnBqavzwKFkxKLV+bqKvAAFyDqQ==
X-Received: by 2002:a1c:4b15:0:b0:421:497c:b5d9 with SMTP id 5b1f17b1804b1-42156338836mr41812145e9.29.1717663704270;
        Thu, 06 Jun 2024 01:48:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:17 +0200
Subject: [PATCH 10/12] arm64: dts: amlogic: a1: use correct node name for
 mmc controller
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-10-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=kKhJhZf74EGQXvkurWzqim/0Eg8JJMF38UR74hRhQLQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfOYScb8JqlWb2OYfUPRFA3UVIVOPnwKpb63Oac
 RwvPvG2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zgAKCRB33NvayMhJ0aY8D/
 9QxzooU3G1/kRr1f9KNPw9mPI5WJXraQKb043yFOjGM3Z4LS/gHT/L3zcJalbJu9oAS2BEf0UDIyb4
 6Y+0Y9FL/A0mkYplSF2dpHe8b1zmvZSsDIPT0bsJ+LVbDoDR+Yl5pv/eCpzsc2qE/7bUuzSj0uGTk9
 R4N6Ury8OraFMCTBhuzTnki46GttXQRVDLgyHXoWdU2m73sbGRn/yFhVdpxZWwopZsH7OZK8k77La+
 v/1gx7quJa7fgzn5dN/Iw50wuWBzVAJi1Md5hDAAQvUs4Dgqn1VRC1XdkLlNGT+uli3T6sKhkvSmr8
 F2iAWcXRendQjCzuH+N47uRhDNq0b1DiWqyv21Zbefw3NlM/UzWRAbttgWsvLHzSTWBWbznhJrRDFZ
 vv/XObpgirGyW3mP8Obe0EW2RBPeftYB66gyAXZV9jHeNGGRAOAKwBDYzc4Q8ULp0qsOt6TvRlNNR4
 e2Co6NnuOLR14P7WBsr7nYmAAi0wSgIlKM0brve+E+nmDjhcMU9HyaiHR/EXoSbFAW1UB3GZjsfnK8
 6gKAy5JtpLE+ty6Ds8EqpAiXMAZqUeiSnfVzF4dwPFwdiuFAWHbO89ySf3xcmr7gngWzjgMuKqOj64
 KF8HJpbBx6x5fN894JLD+ydBScpR/+xpQsRCCCYkfr7jHkGL0dvbcG7LpiSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014826_924122_A165D224 
X-CRM114-Status: GOOD (  10.08  )
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

This fixes the following:
sd@10000: $nodename:0: 'sd@10000' does not match '^mmc(@.*)?$'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index c03e207ea6c5..4be801d12c4b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -419,7 +419,7 @@ clkc_pll: pll-clock-controller@7c80 {
 				clock-names = "fixpll_in", "hifipll_in";
 			};
 
-			sd_emmc: sd@10000 {
+			sd_emmc: mmc@10000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x10000 0x0 0x800>;
 				interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
