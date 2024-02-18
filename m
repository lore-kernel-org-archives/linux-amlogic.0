Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C90C54764
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Feb 2024 11:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJQZbT0gDCMoEyJzzcJMXWVAMooVwFFNpDlh4329hTg=; b=lYuewOFwtuIdh2
	kd/6kJ2fbKb9kkfy7kpMmZXS99IHpgaCHJ7XBVpFalBmovXSOzEtpuzypch3ii/xMQwgKua0hu2eA
	FR9ZXVJ91bJgDUJknAZvkp0pgHfmAn0zhircJQ2ed8JD0gQoBex7ANCskWIFEQaFU0jGC/4QnNb2t
	Aja42X6pvzr7F/EJPLKIvgWfjUTwK/hsPAgHDwdHiy9k99okfGMV7+c9q50zusnqIAcLW6JL6T1Rb
	cYZUMfB92gjoZXk+gk8Nt0frVI+URP2ew24+tqsHsPxrLS7WK8KcipozgU5N2gituXKImE6xtpKUE
	Rtz25+UCSaQbvul8BmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDa-00000007bEO-0ErO;
	Sun, 18 Feb 2024 11:20:22 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbfDV-00000007bBs-3NX7;
	Sun, 18 Feb 2024 11:20:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5643ae47cd3so803895a12.3;
        Sun, 18 Feb 2024 03:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708255213; x=1708860013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qArjC4Ky4exLBEcNK5vZ2gL5oSFxtsS+JdimaikhP4=;
        b=OI5DQT1HI2c9ucmhe/Cw1t84WL+7bgs2TXbHBD2WyFettAYYP/NB3ZWly0SSfJ5qoT
         xz3B2QRZzvrVUF4L3Pd/8LzMsHCDOKvN5DL0hbKjPJIDuV6NY5fc/AEJSjKknpb8TkXF
         XYLpUldrvPqWBFIMuYnUEkD8UiEApzVBfW0Qmr4Zjmwgd5ymWYoj9gFTgcUmIOuuwNUK
         sc5ypqcvL8mxlu6zaiYLAKBP7Zd4ZWFz/ddq14L58q0BnBH/yMURw+nU17zBHd77SOPE
         CJc+t5lTrOwuJulSmKY3NBhZLJc07Yfk2yCHSU99GQL+rQTCYMKnYfKxnfZdHW28GLq1
         5Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708255213; x=1708860013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qArjC4Ky4exLBEcNK5vZ2gL5oSFxtsS+JdimaikhP4=;
        b=KmnExTm/8Ry0zUXXpicYJ5DFfvBUFZW1+gKrI/gTCweoZUOUYc6+uwTqPltYQNoM0I
         y2UJ02EnOWOTXg8+HJvJVcdn7T3sYcULL9C/amXe7CmDHGPqukZllCN0+gRYC7EM9blo
         EvhVeMfSlfMOhvU24MMKDll9CFSTXDfWfY+TdHXdKfF3pjKVXIGK4eomiLg5PE9h3l+H
         54hUlCm+e8gPClasgWNwkfQpJ9DF9Q1rK2k2AfCqHeLhTNQpqHtD7HUx0kmKSmBWO5lQ
         lkKMQnjk26fd6r5Od60NAtPpTOCpFn0pLqTiO0ywLmAsb8v+jq6fvbsrNW1sRnfcr8XA
         Pg6A==
X-Forwarded-Encrypted: i=1; AJvYcCUAK+0FCcTTMhXG+BTbOSH+6WjlAo1VqLHOethDM7Ensc69zUZQyvtgfYV8FzQcXDWBGiTx/5UCupLRTGKaBbTynsuNrrG5xCHMjfMYbqVS86FSI0c=
X-Gm-Message-State: AOJu0YymWx38wQdFQ5CvUY8VICWCPLogglyGHhIDqQ2XlMvQSvbHc2UZ
	7ajlouIVPt6uXYcl96lt1CsoGz4FZ7rSksDxydbJE6RAHNR6hAGVxAxJs5dz
X-Google-Smtp-Source: AGHT+IHpZ2UWggBRaRs/E4ts3NOL50QSRYc5Yf0JtrkCA3HM3XaOSc+EzToK6ohI1W3o6UkrFQtntg==
X-Received: by 2002:aa7:d441:0:b0:564:50e6:93f8 with SMTP id q1-20020aa7d441000000b0056450e693f8mr826732edr.15.1708255212649;
        Sun, 18 Feb 2024 03:20:12 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-7b37-4900-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:7b37:4900::e63])
        by smtp.googlemail.com with ESMTPSA id di25-20020a056402319900b0056401eb3766sm1675190edb.29.2024.02.18.03.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:20:11 -0800 (PST)
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
Subject: [PATCH v1 2/3] ARM: dts: meson8: fix &hwrng node compatible string
Date: Sun, 18 Feb 2024 12:19:58 +0100
Message-ID: <20240218111959.1811676-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
References: <20240218111959.1811676-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_032017_893905_955792E9 
X-CRM114-Status: GOOD (  11.16  )
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

There's no documentation for a "amlogic,meson8-rng" compatible string.
Keep the default compatible string from meson.dtsi which is
"amlogic,meson-rng" (which is also documented).

This fixes a binding check error.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 59932fbfd5d5..f57be9ae150f 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -645,7 +645,6 @@ pwrc: power-controller {
 };
 
 &hwrng {
-	compatible = "amlogic,meson8-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
 	clock-names = "core";
 };
-- 
2.43.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
