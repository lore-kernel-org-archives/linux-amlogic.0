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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9194AC4346E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4517A2176B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PSbKrENT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWcxDydN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4517A2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wC7knpiqGZbSv1QYsHYaUtFzidxMxw0t+ePKkf3XKsI=; b=PSbKrENTJOWenRfFvKPvfL3EB
	A/G8H7Qfcl1aPmOiqETDJtqhi5nxkDKniKI0wzNp+1OPbdo3NIQX54WPaj03nUSKilfiLpRu0W/4p
	om1U9mZ5mtZP9zyEvmivM9fORn07QfKGfJTCQUrdrQrF0SHZCePHc0uHklZWPkv7icuHH90QMSkEq
	gE5YEqUJ+/ssCJsA+hdnUZhL/6pUbdj3UQ3yJbspp4F0ZJIl/ka+K4ffDTVl4dexqSHA2T/752HXr
	3pWuCekEnKdrngFxOlW2j15GmeI6m1/a9DkfNMTI9Mn2njb7xu33UI8skI5KCdvDV7yBq9CWHrMoi
	19Oqcijpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeSp-0000i5-0g; Fri, 25 Sep 2020 03:32:03 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeSD-0000QK-D2; Fri, 25 Sep 2020 03:31:26 +0000
Received: by mail-pg1-x541.google.com with SMTP id 7so1347334pgm.11;
 Thu, 24 Sep 2020 20:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9gQAgZSv973+dBTaKrbsbpx8GcPHmOUBh5NqZ+BH3Qk=;
 b=mWcxDydNQITjPvSieO4SexuAQDqzL7t81vPCPsb5gooiW54IzjTtux1sNdnw+xW6ax
 pIS1+NHZ+LNV6vbgaK4d5xQxwzzglfDdV+G68wt8b7ou8obRBFoDXYPaNBlqLYKekP0L
 ywEx4GG1t23FpXlrvdDJnd7eX5vuql96YlHXD2Dl+omlOsI7Awx8HDCjUgI/x24aN+TG
 w8Eb2KuA97v93Y7xb7wfxpMZ93ZNsUR0eIbGKyUFFfwF5bxp+s4kTS11RaKrFLMGSkW6
 0ST0+KlCG3+1OFEXvQnKym3hU7NI/WcrxG2leuAFJIQa9wdPUXr9R/yrJ5Bjsnu9w2GH
 rvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9gQAgZSv973+dBTaKrbsbpx8GcPHmOUBh5NqZ+BH3Qk=;
 b=V70G7QE1bSoDMgOQdCcAMSdGMulqSbbaE4jw/mGfBqf/glbMRz711dX8NcHR6pSVYa
 2XaiBM3C2fyBzEUXgMXHx+HvvuL3O67ET2Mfg3QuNV+hZhUKo93gp5WlxvHNP1QpdUFA
 mzM8ovyoWWdCG8KK8BYsCYf2sZxfoHb9Gm50gTMhjGAj6idQJeTJ+KNnrBb1iR6FxMXy
 22BRfmE9nyWppXFTTYZGhPHFI9+QEHqnBH70aYXM+k8NyDt1NQjt2Wie5smMN+N7xeve
 0ECjR5lE+aIqa7vFszftpMnWoSR7AtwtELbRyb5OiSliv0sbPOMGyahadvq4uKdqjkEg
 SSGg==
X-Gm-Message-State: AOAM530oQ9Zn76dWTH1xK8vgH3njC5mxwJSjkU175IBPzayzS/7qZ+sR
 ovtEX/4hyXIcyAVLdoh3h0o=
X-Google-Smtp-Source: ABdhPJyiPbeyfrGRU+MOW9srDk2nrCkL4TU43GjHC42bEyn4TN0OW4QMS/IRcVdPZz+I5/ZWuftPGg==
X-Received: by 2002:a17:902:7c0c:b029:d1:f38b:713b with SMTP id
 x12-20020a1709027c0cb02900d1f38b713bmr2343352pll.44.1601004683316; 
 Thu, 24 Sep 2020 20:31:23 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:22 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 7/8] arm64: dts: meson: enable RTC for VIM1
 meson-gxl-s905x-khadas-vim
Date: Fri, 25 Sep 2020 11:30:16 +0800
Message-Id: <20200925033017.1790973-8-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233125_491092_F52E140D 
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

enable RTC for VIM1 meson-gxl-s905x-khadas-vim

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 8bcdffdf55d..354f21d4171 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -98,7 +98,7 @@ &i2c_B {
 
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
