Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B316C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuZxNQ51zLf6PS6W/8gIzfehNYNo7RB4B0VVioXal9o=; b=3nim7guisSuFQQ
	8qB0tUsGqOsriELXa4RFAvCpZTij3K8hx3dN1XnTMy0H5euNI8TtuYU231+R9pwudmgt8I2rV8bqJ
	abHhb4Tf6aRjdkcY5Q4mptQcZeBI4O+TcCZ+EDZo6s1ZPPg3YWuxtWDXjXFDAZ5GcAWYY9eZzyHnZ
	S3s0owN0xsc+lzTIfABHTHatKh+AaokjRCAy7U53usrWMrWAPysd9JIOfuf4h5REd62d2RcuOwo7G
	B8RSmEq6acjV55loWk6qg5JXeWTf3Ajbktw02lH7cMcHQlr1QUsUsROB6J7rGS37Uzg2CkTgGRIOD
	qYenddQOE3ikjKjrkpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgr7-007Z4H-BZ; Wed, 25 Jan 2023 14:34:29 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgr4-007Z30-NO; Wed, 25 Jan 2023 14:34:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g23so18010051plq.12;
        Wed, 25 Jan 2023 06:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=T3Vcjhc65PvnwPdOvVMdP537WTnKC/4/Zs+KRAqYUpgxDnrvLOs8lvAhhPJearG22I
         Jp5oCQxq+caTVBiORxqcsP1xMq3odkKCA8EYX/yT1Uu4nrQqVoHOaws2XtSGMbfMZkf3
         Y18io59HCN1/z6/e9b/Xe7evfAb8CXZGVf0HNU/irgQE4CJiuoJpwNu8ZabPVw+T0kdq
         7trhJAQpB7QBQqT99nLZxQ8e8+Ue33ccaBDnXNUtbjMDhloH7nF3H0sro3fzAlsmMyMM
         Z1GN5Z1HvJkaghjuY8me96YaWhGHKe0o6OzMBfsdOFNK1Ex5eQbX+f07LSXP2O43oxNC
         IPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=Uuh1DYVqahiqWdGmXF5C9Ru08pDOaSSyUZGplKUX93zyomKJ9TB1v7wa1bIayMm7j+
         6zAb6gelrMDMJapdXu2zwKhvdR+c8D3pVcnTaLgvwI9UpU7R+vXlGr+4ywyApXvEFhf7
         ZOUSg0U71imlIgRaOabNMUOPZWALkemPUhtWoFJzk+9611nw1fjRBQqcYjYBbqCkZKwx
         K1d42A5L0MpjGXOcs2c0YNy/g2UPZ8lreJfAhHti4EkSVMMbJkPZelCiQdACcl2qfzO1
         adT9IjV01uq3LF7lmaUkF2t9uuxvPiYsvvXBhlbtjPiTqVxUJDmC1gYAp4kAoaHDQLco
         z+1w==
X-Gm-Message-State: AFqh2krFxVy8WtLOprJWA4VMM4vvRDhTzpo8DNzsKbXIWHv7b1OlJbau
	o3T6SuEZ29WQ5fvGfF5jXSI=
X-Google-Smtp-Source: AMrXdXtmZGqoIl3PwSb1E7JjrUVeQ6HTRjR4Et4uIXnw29k7/PuDIMpEl6hK1SmZaC6aNADlfw4Rmw==
X-Received: by 2002:a17:90b:2347:b0:226:d727:4045 with SMTP id ms7-20020a17090b234700b00226d7274045mr34087769pjb.24.1674657265929;
        Wed, 25 Jan 2023 06:34:25 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090a1d0200b0022c033f501asm1671465pjd.41.2023.01.25.06.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:34:25 -0800 (PST)
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
Subject: [PATCH RESEND linux-next v4.1 1/4] ARM: dts: amlogic: Drop superfluous dr_mode in usb node on odroid C1
Date: Wed, 25 Jan 2023 14:34:00 +0000
Message-Id: <20230125143404.1424-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230125143404.1424-1-linux.amoon@gmail.com>
References: <20230125143404.1424-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063426_776860_11945C86 
X-CRM114-Status: GOOD (  12.43  )
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
