Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B32C5475B
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79Sac1pOY0wihFK7IMhx9djuep0W8mYD0AgZjTlbEa4=; b=qqEWI+U0kgPJOd
	9FUYeZFs0VVl8GKtW1Ih3ABP0813lkn5TFRgN5nBEgHUQsIkLzbL7Jv68d657eSpR9046+Egi8EEJ
	b1fCD8YHdX9SQei8dWwenfRUgeBTFciIogkI08cajor5Lh5VHzeNccQi4TuugkLhaQBX7GYiMK9Af
	jrMYDG5PbN4sWDl6Qz3xLQr1cDh2+L7491RSqqz57pcY4SwCW5PR8usd4f0hIvFozJMA110z6p09g
	yO7AL9esxuzWWLYnqTdeeAuUgKVy+nRhLmN8H4O6eUGXz210LQLc72oFfI0ixLmb2k+wPnYuZPhMi
	TWsz+tTtgwD7QIGTAtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDb-00000007bEv-0X1y;
	Sun, 18 Feb 2024 11:20:23 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDV-00000007bBj-3Oc1;
	Sun, 18 Feb 2024 11:20:20 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-512a9ae6c02so791013e87.2;
        Sun, 18 Feb 2024 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708255211; x=1708860011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc+9ufaRqp/U0tG3njMbdgBMjcqe6JIFtCG+eSPdHpA=;
        b=BV8lbNj0QwldvURKKfhZWmvszKECSAIyrOz88+aIiA4gsOdadhD++iZ9LGGCFVBTHD
         H/am5lwtztrv72amjPfG5KzwjE1ENQlyLjI5/6gQd4j3dQLSTCgvHqHKoVo5kzTbN84P
         yC2lha2FTtkgP/N7x/XnjoetQROh8sxed4vkMqwFAABWtGr1oy7d94/yGjRdjQCgdwoW
         sVWod65XOcUc/EEmNmHIpqLf5JDDtEDOuRQYRNRxofHXjgca7MDG6eEkOBe6uNo9hZ4J
         zVUdnBMgC4w1TrQ73GrjV4Dc2XIXIM2mx/CIIt8Vsk0LpR86TscamKlNMsoTi60tnKu4
         a0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708255211; x=1708860011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kc+9ufaRqp/U0tG3njMbdgBMjcqe6JIFtCG+eSPdHpA=;
        b=VsojjOMZkWcTX2L4FYlULcP76nUlQDX8AwprgaWflVDigrcz+FkSQt+hsHNXGbIwui
         nh13K/EhaK2mfND7WGNobmPwLEcRoNvFGmD4jEYCSs+RxBXOcAQ/eC1JVDleBa9P0NKm
         VzusABCNxaWFqfRgpow5nZQRZl8i9wJHo1WCyoOqs3uu2+UzuQEx5/DcN4MtD49MNe8p
         lejTRrmEgUMnVUzLGpGQdHdep9IUKXlD4x82Ga4zLJSCqXji2Sax4R2JdGqgwbGn4Q60
         gMqnFMJX33+XQwo2Ahegv3+ZmslM2rZp7nv2vXPkzBoBp/Z1pBBteg048oW4DBLrwb9D
         IArQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmkrFc/YlBrruUKcfssz8QDyaStsEN85KSYZVKKZ7H32DFojTqzZuTVkXuD+qy2Er3IBWN2mbpmjKMrmO2QHBi8gjEi12TjS9VzopPhA/Fe6q80Y=
X-Gm-Message-State: AOJu0Yzk5RMxUeh7Uwc6uGQ7+/P6Ihgs1jsvkxcPkAAKprqgL4+3IaY9
	yGV0lreADltw8ek9ES2tmYdLQ5y4H2n7GFcZYHPCMcteCyrDDTDJhtnv+OTa
X-Google-Smtp-Source: AGHT+IFuy/qa407pwFZKRQiucbHr+xagmur1IutAT5SBIpOLHQI1PyAMGH3dBUK4Gjlr6DUAZlU8IQ==
X-Received: by 2002:ac2:464f:0:b0:512:9f9b:ec50 with SMTP id s15-20020ac2464f000000b005129f9bec50mr2683699lfo.38.1708255211380;
        Sun, 18 Feb 2024 03:20:11 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id di25-20020a056402319900b0056401eb3766sm1675190edb.29.2024.02.18.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:20:10 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 1/3] ARM: dts: meson: fix bus node names
Date: Sun, 18 Feb 2024 12:19:57 +0100
Message-ID: <20240218111959.1811676-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
References: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_032017_894898_012AD889 
X-CRM114-Status: GOOD (  11.30  )
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

This fixes a few binding check errors as the node name of a bus should
be "bus".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson.dtsi b/arch/arm/boot/dts/amlogic/meson.dtsi
index 8e3860d5d916..8cb0fc78b2af 100644
--- a/arch/arm/boot/dts/amlogic/meson.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson.dtsi
@@ -23,7 +23,7 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
-		cbus: cbus@c1100000 {
+		cbus: bus@c1100000 {
 			compatible = "simple-bus";
 			reg = <0xc1100000 0x200000>;
 			#address-cells = <1>;
@@ -206,7 +206,7 @@ gic: interrupt-controller@1000 {
 			};
 		};
 
-		aobus: aobus@c8100000 {
+		aobus: bus@c8100000 {
 			compatible = "simple-bus";
 			reg = <0xc8100000 0x100000>;
 			#address-cells = <1>;
@@ -302,7 +302,7 @@ bootrom: bootrom@d9040000 {
 			reg = <0xd9040000 0x10000>;
 		};
 
-		secbus: secbus@da000000 {
+		secbus: bus@da000000 {
 			compatible = "simple-bus";
 			reg = <0xda000000 0x6000>;
 			#address-cells = <1>;
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
