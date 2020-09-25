Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44492C4346E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0F121D20
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqZP0+0Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iB17I5ML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0F121D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0lTVUN3QffTX5P7/erz9clJbOcRR+YDQjqEXIUTL7Os=; b=eqZP0+0ZyM/8wUgAfQa1jfBQr
	BkVgmogfurvQuQN3VuaroevfGYw7kZkFpxpDjhE3QqgwcgHV0y5WWi4VAEvhGZXa/F8GEAye5shoh
	izUs/EKJs/ZcKEAkGdcRM72kYG4uRmza+JgYfg8clXbd4GwOqgbbnPzg0esQFl/qSd2oARErOak67
	IogbwlMEVtD6mg+3AmBQnRLbOO5yLWr8W8Kvt3/fIjamTCK0ftEk0DLMuz3bNp2IJcapzN211UZTR
	CimQ0Z0dGiEGBWifSg4lBEmxo22J0ZtP14/R8wa3L2xnMdKIin7rd+o4Zk0fj1f//tlqSzptQgGDw
	yDz90sxIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeSx-0000mf-2g; Fri, 25 Sep 2020 03:32:11 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeSJ-0000Sy-3R; Fri, 25 Sep 2020 03:31:32 +0000
Received: by mail-pf1-x443.google.com with SMTP id x22so1824920pfo.12;
 Thu, 24 Sep 2020 20:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jglU+SiV8elxQvgoZoXUgpLHzHrCYPUEqbgg3flvfsY=;
 b=iB17I5MLcDdqsBDIVXoalHHZmf4s0hqBLYOFb7z1/JXB0cC4/koovTv+KXIJyw5HrJ
 yXOlwstUH5EmOJbjHqiLmOaK8K+MdHOvjR1v89oW0vW/ysbBzm3kXXXaRsirh6Hn15CF
 DEa9DOj+awrpPEaAE4aM2cpvJn0Wz/UYVW3kN3UHOQd1/UIV4iqeJOmjxiTpWec7pgFr
 dMe06kD+DzUdYV9hrs7XbLVLccAm7fTrkZlYeMjeQrW30dNv0aRg83LTnZiX5sc52sa0
 NVQD9wPYdp5mL3bM+vF6pdQg4DIp2PCTdJziOF7XOXFob18qpvpRZ7yX4pMP+C+ACOQO
 LH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jglU+SiV8elxQvgoZoXUgpLHzHrCYPUEqbgg3flvfsY=;
 b=lVCj5cSXMt11pz4FccgngtOuKa83vj1qXxJVZ1wHmNvc+Dzqm+5oIZeqppTRsNik1d
 bciXtLDrTcriQk3Eic/gNBpf0DfI2wrAedavk/rElPFyREhBYOrm6hf3ROqRCZVHzOIS
 j3YuFq3jV034NF2RWU2vJMB6/XMYitzK0E3+noLpv9RghlOrOiJQpFFM0dRqRrYvA4xG
 xNNtypWjpuiFv4UACtm21Vvx3RBHcqpaBsKPXjaGdFFKbC8t7D4rWA2MyhF2CyDTMv1E
 vdVy4Zdc1BNQCd/15jIzqKvNIQu8YQmJtIarsW7sQAOG0N9UTTSJDw2tzTZWPHgQvyon
 X6Vw==
X-Gm-Message-State: AOAM533UvccCpfWwIRd8X6u2nO8ClB5m65KAeoKwaoNmYNOGfn7ElSFv
 9+E2PXajB5PRusIdPFXlNSU=
X-Google-Smtp-Source: ABdhPJzcxkQg6DufM5JjGTDliP//FibPsdxMSHlOb2Es9/WTh6ggpKHnmtyKdCkSIrRX13SgvRlvsQ==
X-Received: by 2002:a17:902:b686:b029:d1:e5e7:bdd6 with SMTP id
 c6-20020a170902b686b02900d1e5e7bdd6mr2206488pls.54.1601004689057; 
 Thu, 24 Sep 2020 20:31:29 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:28 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 8/8] arm64: dts: meson: enable RTC for VIM2
 meson-gxm-khadas-vim2
Date: Fri, 25 Sep 2020 11:30:17 +0800
Message-Id: <20200925033017.1790973-9-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233131_208281_CA2EC0B5 
X-CRM114-Status: GOOD (  13.00  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

enable RTC for VIM2 meson-gxm-khadas-vim2

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 70343da2811..76b7e34a9a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -229,7 +229,7 @@ &i2c_B {
 
 	rtc: rtc@51 {
 		/* has to be enabled manually when a battery is connected: */
-		status = "disabled";
+		status = "okay";
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
