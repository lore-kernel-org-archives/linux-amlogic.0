Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08363C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7qcjh64tB5STwU6Ug0Znu8jPas6v/e6TN37H/IM/cY=; b=3xTjFgN3DxSozt
	wvrSPstjZKmYTT/bSkqf60OwdyJ6gi0/FVmV/kF7bMWHjPUhSbJSPd6n8Y4W7TmlcclSZE/ni7+Hu
	w8SZMvWJurKKrnUfz4059Kcy/Zb+/R2qx4/9mX0ljqFcly08uWluZQDi5kKPjy+pxquCkVEDAHmWd
	VQK2rqS+B6Ksrk2nCwuYtcZ7d/Yj452yUKEWVojpUTnwzBynVFL1SSUWmQd11M6Iru89zauz+jUx3
	kyC/5rSNltmiaKnbI9/7u2pGf9XNPQBX03g0sILm4P2JiuEe6y2JMGSGSwQKQuIM7GAWPZr6viAXG
	EIofw/kUrDLARyrliipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKHl3-003WM5-0k; Tue, 24 Jan 2023 11:46:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKGdN-00397v-1h
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 10:34:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id r9so13403750wrw.4
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 02:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7aLtEs7xZLqbX/M3vqTpmpdXk5O/XmaNeEJy7udSj0=;
        b=iq3kiw3iUTYhik+54oPvKkwnT27ZQKiWduWQxEpVXfYIqkn5y+k9gLDEcIB2O38nV4
         kW8V0GWP5hSYgYTS6l0G8hx4YgIHV6R0ZpP9gUb2TYX+4qo+r4osdLlgWMFXOuTrsrVk
         zi3+8ydj5NJXHUIuk38VM5FfkFrU7BJFwqMffziH1mxd/HbwakdtlXUrG/7WVYhFA2Ez
         dnslDWy+JxtwOgICvVtG9FEZea2yQyvrmXfX4K/sHaIFp4TRf1tPNlQ+jPkvSJn3Eeej
         8TaY4grVevVvOs/PEKw2iAq2fqVeeWC5cNn19y8I6PNSgzyYRp59G45nABionvCwZxTP
         AdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7aLtEs7xZLqbX/M3vqTpmpdXk5O/XmaNeEJy7udSj0=;
        b=eZo+vKSVEmErpDYklRfzAbEBvVrPUCzVA0fbmBHYXNAq6vcUNmcw5qj3kP7RL8L2Q5
         McDX3HNxG7A5YIikGHrUusWCx3JIihS3IRpJylFy/AJls5e81Ku+DajaFA3rQG+/eLNt
         4ZqfpxxvY7Dj0D8ICPYPfwFR6EOJso/utRkgDylDs7Cm7oCXpFGWQsZR6Zeh/WKVOeXj
         Y6tmWUoEmobuOQ1xvstKZtdKu+GU9CHlksyMlY6I1/dsYIwSucpHVyF+J0CHKaapHnoo
         jeyQKG3xofNR4dmdPrM4V3fXeVr6H07ppBCSKJW+vMjXxQoz2G7+jbWQEilct4ummheB
         PyxQ==
X-Gm-Message-State: AO0yUKWPnERQkO5UfTT7so81G5zoKZcxE+uGifZXJEhOIQbuub3UTXMw
	HTeQH3TrindqF5LFeRHrovl4Zg==
X-Google-Smtp-Source: AK7set/Ria4Bu0yxIrT6TvAgn8xrHUeT8sLczswCH+ri6tLmAbtY5lhH7pBQnO7C4PCoTxwiWfm9yw==
X-Received: by 2002:a5d:6d03:0:b0:2bf:b3ee:4a19 with SMTP id e3-20020a5d6d03000000b002bfb3ee4a19mr400789wrq.9.1674556472485;
        Tue, 24 Jan 2023 02:34:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020adfcd86000000b002bded7da2b8sm1551889wrj.102.2023.01.24.02.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:34:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Jan 2023 11:34:30 +0100
Subject: [PATCH 09/14] arm64: dts: amlogic: meson-gxl: add missing unit
 address to eth-phy-mux node name
MIME-Version: 1.0
Message-Id: <20230124-b4-amlogic-bindings-fixups-v1-9-44351528957e@linaro.org>
References: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
In-Reply-To: <20230124-b4-amlogic-bindings-fixups-v1-0-44351528957e@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_023433_121576_0AB3D6C5 
X-CRM114-Status: GOOD (  10.67  )
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

Fixes:
bus@c8834000: eth-phy-mux: {...} should not be valid under {'type': 'object'}

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 04e9d0f1bde0..5905a6df09b0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -773,7 +773,7 @@ mux {
 		};
 	};
 
-	eth-phy-mux {
+	eth-phy-mux@55c {
 		compatible = "mdio-mux-mmioreg", "mdio-mux";
 		#address-cells = <1>;
 		#size-cells = <0>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
