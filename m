Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CA1C369D7
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Apr 2025 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wTPvs/LtnN2nQ74eChqUxgWRED9ANcshr+2AAujn7bc=; b=wM+quiO9bkto/1
	GIKvt7j6YfRCN/HoZPwAa3fuMf4BlS11etJe5weIap/XH2mDbUocxR4bnMtuSAzQZdiridRZCzLNR
	gS/NhUw+j8orIY2OnfLanqMqIalPWyay9Vr8SuxBZrI9HodKbpzMlKirNdHnHNm9oTnifeF74OMyl
	+LATAwL0WTvxoAU2p2XUSsY3ENSIz0I/IU+kjspzIQOrBMF/2/kXK+CJc7YHwJ9wsqStBShyu6jP9
	Kduelo9hcg67ncon5NI/Uko0CfED5VD2jxyd7KtZTjXu8QEA7iVhMWwXqS6ac6qmyfPB8YQNhRfQ2
	PffuruxN5QHyzfxpvjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7suS-0000000DVRM-1LLu;
	Thu, 24 Apr 2025 09:30:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sEy-0000000DOjX-3BDF
	for linux-amlogic@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=; b=jrLg0wAkA8RIi2bLt4o3mGzQbA
	BaAhkfEnXXtqDja1k/e3deFROLILvLw125qbiAygxTAo5SMyHKdKThQBHILNDchWDHRzUmELPwbxK
	Jhpyam0w++jN/LIEH+O3AK7nEXJKRApTSbUpcS9KCyYcFdsu7S+fN+/vpaJfx4BCosvl+jCaMRfwK
	t4GZeP9fQ5qdnJGqzNUo7Vw8nH1iWepL+NaSuE2qDqG31YymUVA7ZFyePSNq6KgCd7LdrkN/A2cQ8
	WUWp88VVbuVTXgrKQTp+7WiEUoD1leAM25PWg+MEBtYC1gW0ZWJGxO/ij+QpqpcKwSSTF5RRlXomM
	m9AKiBHA==;
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sEv-0000000BdqF-46aQ
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Apr 2025 08:47:27 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ab7098af6fdso12799366b.2
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Apr 2025 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484444; x=1746089244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=EsM9UYJcb3v2lsEbv7bq1y5rAcESNpvZoWNkd5zdwas41gPSZIL52SpCJ1nT7hmEIi
         4jBqiPb5FNxQv/v9H/Gu0kcchq18yaeOaQ4xt4MwIBzT8myRsYV1RcyK9zHEASpAfNaN
         FRKq9LPv2iwUifMwuaz5+YeUmTwlYx9nrWXssTefQ2Kkhd3JJtzrjdL3b7GLDeAnLe1J
         EgP9uVPxuULv9hmD9cJF2lh098tJvtRmMN5j7PWfji78FLKe0Cbs0ImjApSjaUw2K/X/
         2YZwFXrD0G8QGbRt84/TdUYQubGzgS+RtZJprg5FAORDwJOGMHZLBNv11hZtxRmV/vMy
         tecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484444; x=1746089244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=WVQZjwKUJpVIGDAl/iTMHiCrNwpZpnj76ZNhUZ3uR5EIWdimD8jRYc0F080M1em4n5
         lywsafey4sxR84GHmk2FB/GE+2BrCOANHQiuHuf8BJA7iGBGEUnLS7FpAUW3SuNdKgdF
         bSV41YJvC0IGWEslOABypuYGNkYeYf10I0vcVFc3F+O5cPrYndcP1tVruNp54XFwcVYt
         8IbCAcrPrnKvCx1u0dNHzfcc47PcPLVMODFt5w8wIREgiWQFhDGgxxYuqzDHLx+5KeBP
         8lmdEeT+kWNtdVSOjkU0jPfSm8cKyJ+A18yYb9CZLIy2gs+cvf7j4xgtxPXJsI1sb+El
         PzuA==
X-Forwarded-Encrypted: i=1; AJvYcCXwz7tFJGtvVhBiIHZpYEL3GvrfWSFAAke6nqDSxO4W7ybklU23J5ZVqj2l6fDMxlg3dw4vol81MSxnjtdz@lists.infradead.org
X-Gm-Message-State: AOJu0YwmpExf4tUS6vuJsSOIHtPkLVr+WCQDB4zA5ptq8hMhyj95WK9Q
	sLCnB943JPJc+KQ9qitLEk+BxADn5zYiF1Nm5rkC9QQZiuYSO/6GW18o7iUTxK4=
X-Gm-Gg: ASbGncuTxYejAA2x/MhoqLsa6tBTa3nyG9GUz40W5pZx3CP/c2MVynTp0SLTDVS9Rwc
	Q9tRNPdRY/nxnYhW2CKDzVaWc+oIPiUPG/CPQgBgjnTCIiBv3Ayn4wP2NVAMnQjRQRCbJOagvd2
	NP8lt2roE9t/BxDsHl9oIgQNFrzS0l4t/AxlaJltKeIMaMc8oQV10niZPAjRtEeiyce9Xnfl04h
	RveZ6Hwk93fImt83fbL/8fUYdIl95RgxOVH00YRSnYa2wVEUaQooCSrqcckPwVdj1oR0OAZl5m3
	uE5Hd4OEYCSF2WcArllIa5xTlE0O2qJ5J0MbqZk4EPdeKUnBIA==
X-Google-Smtp-Source: AGHT+IGFDaepY4la+CBTucmeGZBrlMkFUgpMj6E1x8ks6fo/36DTs1K5XFkEMFO750OFGsNEb8G5FQ==
X-Received: by 2002:a17:907:c13:b0:aca:9de1:f88c with SMTP id a640c23a62f3a-ace573b33d6mr52851166b.10.1745484443690;
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c25de8sm70417666b.135.2025.04.24.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:21 +0200
Message-ID: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094726_147803_7E61A550 
X-CRM114-Status: UNSURE (   9.12  )
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

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23dd..9d5a481b309f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -217,7 +217,7 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: brcmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
