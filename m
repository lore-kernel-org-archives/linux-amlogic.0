Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8021FC433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5VKjFI7LCxZDdyn0xykGWgDP9SqmkntSeUdGk+24XM4=; b=JVvDrpgErNwQmd
	NDoXdkUdBtBIRJ8BMrAQge/6+7PmTsC0S4jo4swXVoo0W9We135wgC+NKpOEfHTrlJrZZCqlt/fwH
	AASopYVbdm9vz0HTI70WjKm+Mz4unmQb8GRjXJsDEugQFGWBo3znxUIhixEMhbOWoXKYL+S/LXgyr
	0moa466GOq3jbSr6Yzees4CcHm1XG8JcNDVNo3XZ2/B1I6HGV2lZRTI2UZIhtyrLGXoE6GCs+Ksrb
	lSjzFKYxKA/JHXDtqeNYN1+RxdwfgEal6cOjlddEwz1mczXTs9SdVNb8KXO/RR0kgBa/LDTTyX/sY
	px/y7aoSAYQHG7QcBNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6WZ-00GCBl-AE; Thu, 27 Jan 2022 15:17:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WF-00GBxc-9E; Thu, 27 Jan 2022 15:17:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id b15so2769040plg.3;
 Thu, 27 Jan 2022 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=DPzP+F3Ei0x6K0HK9/HyrN2suQMOr5qmyB16ZKcnGJw=;
 b=fmjLdtf/+P26UY4yzEmlpn7olHNsBFrCHB9X8qka63dJtOJ/Ve6YeM+hUr53I0P/SQ
 CE7lbik0l4XUoT14EeOfmBmiPn0bWNjp9davLvvKELCywj1tKHdFpyxjU4mWVIFQwbHT
 Sum6Kl1B8jaXl3DTSqe5MJjo7Y5+A9jgpx0JLw+HQUrZ8Z8YDYlVJGZvilDSK7tnAQxB
 XYaX5cCGOAidym6Hfge+yEgow3SQNXK47T0p4S58NEjzdfg1RrIjRRDQHjORpAaoLoY8
 nq3I1RAg0E6pFO2eOG6XF1Hcn6HMsglkYRDf3HRqarZ+SeWnikYw4Nc10KzueJXiyyy+
 Sosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=DPzP+F3Ei0x6K0HK9/HyrN2suQMOr5qmyB16ZKcnGJw=;
 b=X0k/UiJkPnKbzsPIiQLjx3by6lzVuXOqo05xa1EXMIjzYOJg88Y7yUa3uxsnA17PVo
 TahxqPQiQA7czAWD00EhrJgBV29KPouCOL7+ABQtlRoNUzDCsF1olUXJMnWAomokBJvd
 dT6akaxHojpgzuddw4x0QwmMfK6Pa08DJ8y5rIYQ39lvZaBupHVtf1vhWXBJ/PiALVSg
 WCBQl2tDxuhRElctw2taLYtW08fkBT9MUd3wQss1PBl9NDwWkT7vJJXMfafA/VKcAlBG
 2W8JcRHy9Q6zqluMdmM4T4n1vu70zLwZKWoBNQGOtqQhrYeR8QMNR868vj3ECMquyF4P
 CqXQ==
X-Gm-Message-State: AOAM530wODDUrAd+3uomZOkQUjK3fEz4J7ONwZGakceHgdGxpTP9F/Qj
 xFZJmUXmToscEtH5i9sFKIYEfxE0he9UpA==
X-Google-Smtp-Source: ABdhPJx1Ly4sUBm1O5CZTucJua0zcVrn2ueUTb48E5G7QMQpB69ZYZpE8rfzj+fDnDK+m15GR2m+xg==
X-Received: by 2002:a17:90a:31c5:: with SMTP id
 j5mr4691533pjf.200.1643296621943; 
 Thu, 27 Jan 2022 07:17:01 -0800 (PST)
Received: from paju ([116.124.119.85])
 by smtp.gmail.com with ESMTPSA id v13sm5883597pfi.201.2022.01.27.07.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:17:01 -0800 (PST)
Date: Fri, 28 Jan 2022 00:16:56 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for
 GPIOE_2
Message-ID: <20220127151656.GA2419733@paju>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071703_366526_AFCE33AC 
X-CRM114-Status: UNSURE (   9.96  )
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

GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
TF_PWR_EN of 'FC8731' on BPI-M5

Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 212c6aa5a3b8..5751c48620ed 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
