Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6AFC3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Amw+DOM6RypWlEH7Q6KwUsSx12VGi0t0Jm7p7maNkl4=; b=koK+kTSyB0j98T
	08PX9NGOsRL5txBHZ4/g0YYrDBb4vD+f7cC9AhB3XrKVu9LNDif1FcZaTyt4b9kevTVCsSMVb60ZT
	xQR2d0dKf6OAzjtDMRj6ZmY8oPICbY5pudpmVfhKbtVc8HpOaw36XJ/4MTLx4KRDqG6fvPS5gaTIA
	9c8sGU/FEz3t8+F0eLVZEKqTzHosbiLRiPE0uBFolZR9zzS7ZfgKh6fZse1E1qMMerzpbDp69eaei
	cTtcYhiP2g5GspcjGz+QO6cK3a43woLpuQ5Bo6a2eWOyfByI0+A4TvKeS/5+ZkXTchZJtQ31fcjU4
	XL7TB3WRVUWQ8z6R+bww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6vT-00000003PDT-0S4y;
	Mon, 16 Sep 2024 08:17:39 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mx-00000003NG6-2FOA
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so33862935e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474130; x=1727078930; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1eJN9EUrF+mtCv7v8IjDGJqaK6GCUYx9tVtkrONiwQQ=;
        b=eH/m7QbEO1BzizU1snLZ2DLLnS6Tgz8KW7U2Ccme9MZESy4C0UC2leINzu1jajg75q
         FcMQFiBQ7g8MSiRYjLyVTt4rSdZSlaHbNmpccPUIKKB5aufK4xvQJ32SzrYj54h9YpCG
         oYGDW/upQlIsckOv/aplmBr8/92yKo3N7JiEuL7z0XMzUJLpUYCke17NAiYhzd/C9CJx
         c4Qhv9tTkuW5Z1xD/XqrbY6xOY4N1+jgm0neYVeliHWD+Kbg8d0wNa35XHtYIoqjVMzD
         eydaFEGRbwdNtFI39BuXvS1IQg6NJS2a1io7Rqzfz+oBWgRuIKpBD8clUNP/7FhEhanc
         GwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474130; x=1727078930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eJN9EUrF+mtCv7v8IjDGJqaK6GCUYx9tVtkrONiwQQ=;
        b=T452Txq2xTy4mRkSAhhqRGjT7dWgFWm91kJ1UUjtNWQp6f4iLgfXW/PRdHsA3ODnK5
         rR75kUEF1cxt9TBttzKPJNpr+PcDo4CR2dqj+oHMUrQu1ub8XrbZO/ydFesztf1UaFli
         Xab9/qXQL3rG2SjgIUD0XJvQ4mG3UI6csfx3+5p7v2Axi68b/digzt/DVvst6vN7QhWo
         SkBFYkgqZJ5iTh7hGfHe7yHpLB5Dr4nuHZjt1RoDzQJObUbsT0E5IYu3kLl6R/mmbQSk
         QapAy8SamUH+66nI09UGyj0jvveKaHO7910uQ/h20OwqVaiO63vj6MXP8TqHlh2tTUb3
         pM1w==
X-Forwarded-Encrypted: i=1; AJvYcCX/IyfkwcRbB/5U9U2bvTnZvRbm1kKDquWsZaodl3z6i8ppjHygMIpN6oMibxos06N10yYZliLpuAHjMsvS@lists.infradead.org
X-Gm-Message-State: AOJu0YxFG3uoozGRrJ4ZWCFywWH/+lBjFiEwfXWqM10hF0pzEnIbC+ei
	OgXhNAdnOSuNHjm02oJU4WJOJAcBxtK7mZmiRZl+BAOqoX8Mht/igG2Vh8ZT2Zc=
X-Google-Smtp-Source: AGHT+IHaWC/S2zT9Ky6i8PYfd4kfDoDe/O0upMkirvhwlpdd7sdpz6GyZCzCtOIrMuHidaEXyAE82Q==
X-Received: by 2002:a05:600c:5127:b0:426:67ad:38e3 with SMTP id 5b1f17b1804b1-42cdb531b27mr109286915e9.3.1726474129956;
        Mon, 16 Sep 2024 01:08:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:37 +0200
Subject: [PATCH v2 08/11] ARM: dts: amlogic: add missing phy-mode in ethmac
 node
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-8-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=IX5ZFj1FormQAKEsvBJqiSBB66gwgLEwGfZq8lM9Ze0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eHVkKY7/Vx/PCvPzzh7kK6uwCnnzl0I1D1erOw
 05LTHmWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhwAKCRB33NvayMhJ0fInD/
 44HA5EkFvbgK/7tZuYQ1YAtRcf3PK4XYwVM+yehtOQje3opK28vke4HlDVblw9oID/e2M8JSYC6fh9
 Nvb6/5cFOBXZ9/COSnPvZMpE7JyA/lK6uFCrXVXVRduR9AFHHwUsUfJYA+uMlmIAX4BS306MX0ee9E
 FgS3A1g1r7KAs1FVBembtxDh7d/3QN2/vZfy8HJKipZvYSVZMMUzckT20BSIj3fFoGzW+vrwfpWPj0
 9sMZMjxyhWs9AXKBbLH1E1SvSKNL/EE1ZKsxA1xfIKv8Cu1IVzBQe2+vBUmkLoyeRYZm6ulQCPaV6S
 ETTrozeX2afgB0n5EfPrwjUdf2hKSCUuryD5AZQydPSkIo0Fj9hi6Y4zQWJ0ZWgStyds5bbslH5RlD
 t9UGfLzEAhKp0fRjD9fitERbOllN8wdcP4rFdHDY2Sx85mha3pbHLP6gexgkQFhQ+VvR+yG3TAzfNM
 KpUnNJKa/H01qo9Ya4cMNJ+zvg+Df8vkoUsayZA831m22oxCQcgtvDVoyzB4JNLIdWtlXtBS4Tnb3+
 1YTmZU7jSwH5dix4djUPrezKm0553u80qmxJ5AdwQ0kyLdObwCe5izDgsvBlwZiFwCt4M+Q6WHw6L4
 bKp3dKVdvj6br6WbSuZXv2n/VWFUdwF4e4Q07GdQFN1QhsS3dKDfuuK914QQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010851_713608_60783743 
X-CRM114-Status: UNSURE (   8.87  )
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

The phy-node property is required, add it and fix:
ethernet@c9410000: 'phy-mode' is a required property
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
index b97531000d55..f42f97f2c7e7 100644
--- a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
@@ -94,4 +94,5 @@ &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_pins>;
 	pnictrl-names = "default";
+	phy-mode = "rmii";
 };

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
