Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7A6C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:45:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEF82076A
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 05:45:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wbb/SFPV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl90+3Ww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEF82076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34o8yf4TYbA7BsoPC2Ed10AbtncsuLKPKTd4To/bpdw=; b=wbb/SFPVvxkG21PDliZMQEd2YU
	QvWDGple4oFHJQJn4aikKi2SfVFZmoTwgVe9lFILL8s5VvvLIVLPkAisNTo0HINCEl+9uSQCl25gq
	6LkxD1o8n9cdiswaDvisN0OM7Gl7GdKmqfKuni7b1BVvtSsi3IZKsNpeyfCxvqVlpsCBUOEBIR2fX
	QIcMcDNnT2tFsk0Jp+fmThl5pSewu6Gqxts5a2HzBegFIl4S6lYQtPqPhAJr03KxZnCmpfbWnJO7n
	WezmclRkvuk0qGEg0Egy8PVWDkZCaNPCuoMF7AbeIEZXuDo+slGzkexEkE1gB0+q3i2sjFX//XkeB
	DgHbWjag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfer-0004Kg-KO; Sat, 18 Jul 2020 05:45:13 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfeo-0004Js-IS; Sat, 18 Jul 2020 05:45:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id z2so13198948wrp.2;
 Fri, 17 Jul 2020 22:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3oYWHEmLW5s7KbA+l575vtPAkEWPi2PPTZYrMFMNqDQ=;
 b=rl90+3WwRZrv/R9/B5pJfTLLA76r1jpsCq5y/2hvR3rfIgQQtX72aqr4C6jru4K2U2
 z9i9D6dmVSJkFJJRGe2PW1BrfewDTXF4ST7Z16K6Lqw3HU3Aafq5U2UxBTNfNzAybxs4
 vkT8nXzXkd7PBTrmPIH0rAcBRkduxh3z7Md9yaf4MAMd+g2656B7Sb66MVPSULdp8s5v
 mZPGOm89Fis2QPrOhskoZYeo3ZT9Qd+0nYQQXu+nyVSVvVJhkbXYso7gv+AJ2wzKkBMr
 oyAsR70Htl9MiM66aqQnoLlF9LJ8QBgxjmdh4rbWkoQwarn9lsfyeywWx1vUNQhZ1tWs
 BWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3oYWHEmLW5s7KbA+l575vtPAkEWPi2PPTZYrMFMNqDQ=;
 b=OvvY+qzMOR/VX8zopnsLHiVmn1LsR1BR0QYGM58Qz9/yr4xcCxrhPzK8hB0pyK75l2
 ZVAA/GJMdCZUOYLvZfAcoP7Tya+0VW0cbSuR+8JbyppeGLiFQK9xIxQkvhGBwHQ7AgvW
 3ltLAnRJWmiVScQZ9RC1vQ4o3pTDpHVD221DyQg/2C2f5PPPxiSALeN3N/php/U/+WCQ
 +DXqXDxzzYrdWegW1mh76zMK3/7y8qMW8jL2d6U1+/KvPb5QlQpuEkCdXUAfkADD8Ia8
 UZQO0vVKWIP1P5fhPqisYp04OY9muTw/y5KuGJ0snM0t4jPkGWQ55yCH7+Cu6z+URVbd
 KyGA==
X-Gm-Message-State: AOAM530FSi1/trJEI4G32dJ/8u/VMkcf+tA5ppVzGL7hmdNTht5BJwGZ
 7PrYvA2snLngOUaEnfO6Zv4=
X-Google-Smtp-Source: ABdhPJyaiTeH7lXyaFaxsJ1ijc2hXhd94evVQetqFIWG5Q8KwT+medqxNHw8dGjRnsXqi+3Q5EOgQg==
X-Received: by 2002:a5d:6a90:: with SMTP id s16mr13075188wru.8.1595051109672; 
 Fri, 17 Jul 2020 22:45:09 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id d13sm18735481wrn.61.2020.07.17.22.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:45:09 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: update spifc node name on Khadas VIM3/VIM3L
Date: Sat, 18 Jul 2020 05:45:05 +0000
Message-Id: <20200718054505.4165-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_014510_712464_1462BED2 
X-CRM114-Status: GOOD (  11.57  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VIM3/VIM3L Boards use w25q128 not w25q32 - this is a cosmetic change
only - the device probes fine with the current device-tree.

Fixes: 0e1610e726d3 ("arm64: dts: khadas-vim3: add SPIFC controller node")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 27408c10a811..6b75157265e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -360,7 +360,7 @@
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	w25q32: spi-flash@0 {
+	w25q128: spi-flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "winbond,w25q128fw", "jedec,spi-nor";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
