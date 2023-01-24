Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08331C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juIU78aNdc6r9xf33+ZPLhhg6eIKJMeb7oj5ZsZBfBw=; b=XVllNsHB+BbBAa
	61/l1ZHzWq3RU98T9aAxUpDCLJg74t8dqU01mtfEtrvQroIPUOSMNRO1P3hYwXDdsvouHSVaBYBGI
	ySYwajsAB78Dmpn7+wUYAdsUvSmGsCnFK5dQN2uaLQrKjAcG84Pi+hbjMS9VALFg61G68p173V4/w
	71nKTyYZx9Op4LOh3hViwGt+bJQphwq0xAETdhf70NtPknu52RgshBYZBxtIrT1L8Fdej3jv7P8Db
	zIAXzt7/2+RrSuVZqQ81Ei2wmoNh2VwfrzLUpz/9LHWVM4bytrhCw+GXSoUT8QGFBbTOLqWbhIF5m
	xUsfkpa9Hwzl8Y3yBztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUK-004N2t-Qh; Tue, 24 Jan 2023 14:41:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUH-004N05-4B; Tue, 24 Jan 2023 14:41:26 +0000
Received: by mail-pj1-x1035.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so14249171pjl.0;
        Tue, 24 Jan 2023 06:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=BhAq8289U6wER4oxVUwDFI+iIP2XtZn5swOHIkiuj1jaCNmYY7M+IDySdLJwtR5rZK
         lYnKQeus4tOmSpiK5AWjiE3W4Ni28fF9Vjl3TcRkk5YuzfdRWyuoHSQ2PDDCwEp4aPys
         ebdXNVADra5P8pkTYdwwZDTgbyW36RMOyT8p1bLeCoJAT9LGDttVdNlqxzcyTAcLWR0y
         IOz0PA6aBO/F+Ltn5L+X2btYKDn4SzlvuDUoFEoa4lgUZnt1fXLhPsYvny1AihFSl+Do
         qIVNOAtm0XRff3HO/tZTy3bwcVobPwqNeEAe24pCTjTnRm/nTMluo4oIMbhntbqPegVm
         yCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33aN1+zq+dtGXTv8s+/MpRCqjJHz2bZNw6EwNpZ5/gs=;
        b=R1sYU7oEACZaM/0X3O5GER+e5ujkZkn0SXfI6ihbQfJa7aTuC4uoz42kpM0eDCG4nn
         QN0zhkZNE6HIC08T5FqYROeUYVtQd70cjuR2BjsApNncn1UOXKONncM5IuvnMIou6SCR
         8bf+x2SNhtaWTzgVXf8RWLTIsvJJ8E08oiJDhKIqmugZBr/dWQu6hYMpfYLjSInktkUN
         7ZMVVCUcrfkC0z+lGKIlceaBg2QZ8HtQReWyVxo72MsVVFIOtnNWqxlIxlvT6j7Qecps
         ICwFskhy+FQ0WY6BCZhWaIISPwdzhdqUq3Nf1fM4kDPkVOweCUPJlbmsnDZvAOwjYMgt
         rz0A==
X-Gm-Message-State: AFqh2kpzSLgAWGCU1Yr+yI9JZ6AAQbmlHQ2d3tZ2FTQQ0dPbpFQJKTqW
	A5h0+8KeXeegePG6O+0aQ+0=
X-Google-Smtp-Source: AMrXdXvR5KO0pDQjOoqXOD8PZrIKLdoBFPKCA5RuJmzdb0dvnYq7x2pEJXees0I00dMjkY0gJ7vWvA==
X-Received: by 2002:a17:902:ef45:b0:189:cc58:7784 with SMTP id e5-20020a170902ef4500b00189cc587784mr33380515plx.45.1674571281264;
        Tue, 24 Jan 2023 06:41:21 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019602dd914csm1747865plc.180.2023.01.24.06.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:20 -0800 (PST)
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
Subject: [PATCH linux-next v4 2/4] arm64: dts: amlogic: Drop superfluous dr_mode in usb node on odroid c2
Date: Tue, 24 Jan 2023 14:40:51 +0000
Message-Id: <20230124144054.13556-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124144054.13556-1-linux.amoon@gmail.com>
References: <20230124144054.13556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064125_185139_261C9011 
X-CRM114-Status: GOOD (  12.44  )
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

Drop superfluous dr_mode="host" as it is the default in meson-gxbb.dtsi

Fixes: f24859bbec8a ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 01356437a077..70b10934a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -399,7 +399,6 @@ &usb0 {
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
