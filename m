Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE771C27C76
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 07:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuZxNQ51zLf6PS6W/8gIzfehNYNo7RB4B0VVioXal9o=; b=1dCXo1eh2DTmvT
	e3zvvUHCQyGNPDfqn1hi9CHsZ13KRa/IEOuq5zn2M7MlAg/buB8jxDV6iKrscx8BHEgT8Er+hf+d2
	aN2AQE/hqcAnZNQFgt6X/TukKqBh8H+EltlMkMNPK1aJmkowbPAcyQHTENpk+Xf8xAwhS1amFkmDr
	cwh3kXS8jdV6RZ5gSAtv9p7Vz6hlG2Cnnro6/HHW97UhTOPwIZsLOcVwzm3qbKMY0HGCHX2ruvr7+
	xQSa9Wqam/dAjUUXw8xE8ngVlOY/PirdHGN5mDcg1+dNV5eCxqO+bRdPVxrOm+53hGvo4uob+CvCw
	TGeBVCZ4t5AOcsFkGqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaAy-006EKO-3z; Wed, 25 Jan 2023 07:26:32 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKaAu-006EIr-OF; Wed, 25 Jan 2023 07:26:29 +0000
Received: by mail-pj1-x102a.google.com with SMTP id nn18-20020a17090b38d200b0022bfb584987so1148119pjb.2;
        Tue, 24 Jan 2023 23:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=ocZ/KjqngVGxbaFaf8AN+goK1ALPcix9vF6lbKS6xA/YoMyIq0zw++PbElTo5vOQWG
         NtZYwHOmKLoZ/tHdJgLknvRXiZL7mAmW4yteSJVX7BoQ/AVrZvUjJb4HEdHvz09acMFy
         bOiaoaZtqTtHcf2qA2vEC+sNaKyZQPMJO0zhQ3Gr8hGeF0FIHVcS8UugCumfHz7td1FE
         5mq85VcQN74YVMaEl8kxQLntGcMYspXZbYW04tEFA5PixehE+adArvshnY2mjV42LeoR
         vZ1KB5fcy+6vx2BJ6Yh/Y8Pdxhle3PwO0JIisr5IUvdpTwMhWrYlFkOlJUABtgYgcNkk
         UL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=toVONj9fvIoxyOQyIh93RxdpvJwQ8KSzrhYMBmHGCzCsJ0sdJF1hCKlHmS3wU57oho
         xkTbPREdoDCTRaotlGZ2WaCcgAXIbFdTWNTRJ92YjhhA6lpMCAdSCMQgG56MW8zkoFe6
         Ow2VV7udtzFznvRiP2Er7gMTQIb6R97sqDDqiAvoAgUhoeIceiIpg4Nv3ofBrk+ZGiiQ
         9YE+StmIEIuR8QqHf3enqUugudxanJULRz9mTQ79AK12Z+HEOhbrxVJ6QkNVA4zWB9q6
         bmKJ/y7CCvz0TtLxUYCvJHefb6gqQYokcPBbfTVGaXoU7T+NPYf3DoVsmtCrNVA9jC5Z
         4p+w==
X-Gm-Message-State: AO0yUKVgQmxFUgOxnK6AKBDz9DEVpvqr22GmvLz0IuQhhSBECZmWELhR
	jxJYMJ6fiwC0P2p8Lk82ggA=
X-Google-Smtp-Source: AK7set+32z0yoQc/52Fw/h6yeVulJGKjyhJwUOJPsX1NqHN7mNu/ZvGuX04IBHFjnqplABvjQhJ+/A==
X-Received: by 2002:a17:903:41c5:b0:196:2347:ede2 with SMTP id u5-20020a17090341c500b001962347ede2mr3342915ple.5.1674631585779;
        Tue, 24 Jan 2023 23:26:25 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001769e6d4fafsm2902500plf.57.2023.01.24.23.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 23:26:25 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND linux-next v4 1/4] ARM: dts: amlogic: Drop superfluous dr_mode in usb node on odroid C1
Date: Wed, 25 Jan 2023 07:26:01 +0000
Message-Id: <20230125072605.1121-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125072605.1121-1-linux.amoon@gmail.com>
References: <20230125072605.1121-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_232628_798917_3BE895AA 
X-CRM114-Status: GOOD (  12.84  )
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

Drop superfluous dr_mode="host" as it is the default in meson.dtsi

Fixes: 3325f3e4534c ("ARM: dts: amlogic: Used onboard usb hub reset to enable usb hub")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 941682844faf..1097b35b7a49 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -368,7 +368,6 @@ &usb1_phy {
 };
 
 &usb1 {
-	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
