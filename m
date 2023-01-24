Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEF3C25B4E
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuZxNQ51zLf6PS6W/8gIzfehNYNo7RB4B0VVioXal9o=; b=IM8Xd5oFhPwvtU
	/z8HKPajxV4gBkOz6Qx4mpsqKKHWNTcv6m6vMzsm3bdtEt0Rg7pwyjSxPsPp3oVksYlKrN2FNdX/J
	GZX25gtvu2On9zqO7wDu2T3CA+Mn/rjWOxuXyEtMicRWaoV/w36ZPJ/AuZ3O7h6QEkZlL0JgxJeNN
	BcYqYqUpoHs5j+54mYe2t3ZmFxVNzNgrQjS/0ssBv8cYXCDJ6d7lJZn4VWIuW4k5dG7Z6Dcrx/5FK
	dSZu/e8QZ9F3eDgVgKoWo9+U9tx7EGYW6GewouJZCOi0Ux6EpPh4kBhBXipMOOGT0MH1fsOK64CVa
	ZnaMv4xD/aeSrW3TcQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKUB-004Mz4-QX; Tue, 24 Jan 2023 14:41:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKKU8-004MxS-Ub; Tue, 24 Jan 2023 14:41:18 +0000
Received: by mail-pl1-x62c.google.com with SMTP id v23so14942415plo.1;
        Tue, 24 Jan 2023 06:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=Jcw9U+MUVYMBEoxsVTJb6IHvY9DP019FBU3Ii42YSO8iatKG3FGVgrx9HW6fsHXCoA
         xlYrO+9iWI3zmJhRn85o0pRwutY2q5fXBTrgASKQZLG9e72araf0krQpgOOdZ+hXXUa9
         7Z7cCXugkTfhz4IrRjqZd2hY6drtj9iwdR3sQ9a7KM86CWy0mrqltCv3IcFlzIPsaBv1
         LujcLihXqLwqzazjRS0RkdaSBk/qXFHYc0iWxAHcWVkbbIrVgaVILv113smNtYdbiuai
         O4WTX1oIIcUPRzsTcmHWIr1sG2UeAfAPVwVWMySSBE2B1jbTUOylJDRkgKdvQnVRaoZD
         F8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrcqHhD2+Ap5Bl+Zx7RGd/oyh/FJKuuqv3NrFr1ehPI=;
        b=3RT9az5ogvMLCxo8FbdoWBPZ7vs+lBm3CVG3ZHOIYsG8btkegxWyfCMWfQxpApYZHa
         j+wtJfcYFKXyNfZ0FgfLCQwY39lVnu1drVk4yuM8bHes0Yormh+M7ODqf6qGqOncrkZk
         9rfTCTVPOeUQSyQAX2i/glio8jN7HxxnEzuKB4y95ph3MBRqYXeOLDxtiy6Mq7EPtW5o
         559KHBQ+lwTFDQNe9oHrxCnAPjXnu1EknaxMt91CuqZ0ZxLbnVQas92W4poi9hwl/pID
         0isUlZW/01w4DzyVaJbrxgUzdmTfXNXhXn3cOryC2c/SXx7JrnTfPm/8qVpfYLnWUvZl
         GTJA==
X-Gm-Message-State: AFqh2kos6r03uuwNG3PIEgJmijNkBHLAH4LlZZUZi4yTyz1IMSRKuEHx
	jhRjQipMBFtrbh7yjc2BmBs=
X-Google-Smtp-Source: AMrXdXsiw1AMsYD9M8CrlBgvq6vr3XCMdd9u9THS17CmyWpWSZmHup2EEr1eoEo0RdZgIfwBG/nQFQ==
X-Received: by 2002:a17:903:244f:b0:194:6286:73ba with SMTP id l15-20020a170903244f00b00194628673bamr38337324pls.13.1674571274974;
        Tue, 24 Jan 2023 06:41:14 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b0019602dd914csm1747865plc.180.2023.01.24.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 06:41:14 -0800 (PST)
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
Subject: [PATCH linux-next v4 1/4] ARM: dts: amlogic: Drop superfluous dr_mode in usb node on odroid C1
Date: Tue, 24 Jan 2023 14:40:50 +0000
Message-Id: <20230124144054.13556-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230124144054.13556-1-linux.amoon@gmail.com>
References: <20230124144054.13556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_064117_001074_8E9152B8 
X-CRM114-Status: GOOD (  12.60  )
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
