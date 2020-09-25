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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E85DC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B0921D20
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 03:31:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qF61h4r8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/22bnES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B0921D20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S3fl0Y5sZ41nAfITtmA+LqH8fc2yK5mnU5mxC54BnF4=; b=qF61h4r8IbEYv4xOgnkmIExXA
	aogVaJs912DAiRqRly1cP6jsFVerPyyxJW0QH8zHiKbmOmwOsTKmxkvITX4It7HFYNFaZM42Yla+E
	ij1BwXPyakiMENr+JT9W25PFO1lJiYWImjFNf9VQc0uiEc7atY+RX0lOvJYATEHq9xUnHXZcRatBI
	II1VXqNxsjESDdP6k212sbRkj/TahkGXfxDgGzUp/+mWsLbnRiTFpOAoznGmj1SvIl33ahdHL4Naa
	UDdT4xnC/L9GVFsaFfXHIz/uUu3cbOYYdGHtdyWuBvtxC6KtrzOYZP4tFE0SVhoa+urSpoY7RGSAm
	AJP9Bseeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLeSB-0000Q7-SR; Fri, 25 Sep 2020 03:31:23 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLeRw-0000JY-At; Fri, 25 Sep 2020 03:31:10 +0000
Received: by mail-pj1-x1041.google.com with SMTP id md22so736021pjb.0;
 Thu, 24 Sep 2020 20:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XPwFVdpf+MdTNEthESQ/J9yBHAB6tEJrYpBaLIPPi+Q=;
 b=H/22bnESxomM76v2BwCXz7N+da/sTud1kn+GW1pPFf2/J5258QaSJf+7vsLyU0xiUc
 re4fQomy0KZfz/+oWy3ZJurJ1IoHFxbDffGBoxf+MsR3D+POC64LCPfSMVm0pcvN6dNU
 2yZ5Lu3LmvYCSXvyC665PhHHfzwtjNNMQ/45cmKTRr8HhsiV2ofe1IUlYJRN09cG5V/V
 9k1syL1VxuBHtDEifSN+0NTHWXmEFXd1W/JdP+5r6ESLmZ0UP1/z3OUA72waXP/I8dzB
 b0qKzf8KxOfKZ/wuCdQVw5YN8MCyg2Vo7DsubJFipqhe6H3hX/Kparv9Olz1Y4l6Sw10
 vzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XPwFVdpf+MdTNEthESQ/J9yBHAB6tEJrYpBaLIPPi+Q=;
 b=JfZx2ZdaOfdcHJl12CSlAFUkwTvrqipPF/8swwStS+jF9wVI7KRvkjQgJKAFmGX+JS
 FYPreVoQgAJG2gfvtzZAp1H8QCi516ZWR+N6lWdAPk5zjO/gO1CeYpo7+PX/RbBHlgtb
 Y61kNfXwioui4lUtgcg94aMX3E8pdppZagRhJK9/yrANs4FAzfBQA5eKwU8wanRXc72c
 OhoN7cq4mjnJH3GyvP1GoMU5OFKv5QaOxYA6iNDr6C/pUb/b3UFVwy3EHAHwapAQ5o3c
 xfOSqwW8llyBlB/Kte0taCaNLGR/7WxMEbnjyelCFhzAKO9lR2+MX0ic0aW/PiJQWC4R
 PAmw==
X-Gm-Message-State: AOAM530DfQVz6YCA9ErTgWdkjjny7RFW2j6GqSvfMX3CNatlsQSS9kgW
 inwqKH3UQNY0Sv6iomS2AZAEnyFE9op/JcUx
X-Google-Smtp-Source: ABdhPJxtPRDPvaV3cgsV2pw22ZeYgKOcVkejOQJf9j0SAVHWLndno+CFpuzU/bu7wTZKoeh3u228Yw==
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr686001pju.149.1601004666336; 
 Thu, 24 Sep 2020 20:31:06 -0700 (PDT)
Received: from universe.lan (80.251.221.29.16clouds.com. [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id o5sm571670pjs.13.2020.09.24.20.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 20:31:05 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH 4/8] arm64: dts: meson: remove fixed memory size for Khadas
 VIM3/VIM3L meson-khadas-vim3
Date: Fri, 25 Sep 2020 11:30:13 +0800
Message-Id: <20200925033017.1790973-5-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925033017.1790973-1-art@khadas.com>
References: <20200925033017.1790973-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_233109_037425_640697C9 
X-CRM114-Status: GOOD (  10.41  )
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

no need force setup memory size!
VIM3 boards have 2Gb and 4Gb variants
memory size will be automatically defined

mainline uboot works properly in any case
but old vendor uboot works not properly for 4Gb variants

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 7e137399257..3111bf35c0f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -20,10 +20,15 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+/*      no need force setup memory size!
+        VIM3 boards have 2Gb and 4Gb variants
+        memory size will be automatically defined
+
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
+*/
 
 	adc-keys {
 		compatible = "adc-keys";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
