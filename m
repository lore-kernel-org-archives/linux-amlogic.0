Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4287BE77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2024 19:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ess8qiGL2FaqkvmXGITFyVTNxqcfoa+I8zoKCrNVzqo=; b=0sK9KDCGUT4a+j
	Pd37unRpe62h3dwnJfglLqFdI7w/pAxTpdAEVkA3ROvf8sd+9PeQTyZCs4p6ufNwHdw1ic8BE551U
	rZ/JHmfHHb+1N/3UcVkMivi0lvKflDKpTuETXD1YPwRM55yW8Sx7Ue2FAFhTOiLTgzaXmWmQVeeqs
	mhPR1o4utKpXqF09AQiPG7xpg0OYiwRLj+K7ESjGuEEWX5HTmKw1Uw6YHF1JAx7IZPt//KEUgH0hn
	Bvx7oKzCvMJyUWW3ZdFPRM9dfMPJimD9HdsyJ75Q1yD01wA4S9r70bqKN+sBs94wRQyRvxmOmIA8C
	URS5tytrptNgdNvHaI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi9j-00000007fuG-0oXM;
	Tue, 31 Dec 2024 19:43:55 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSi8W-00000007fg3-0IFN;
	Tue, 31 Dec 2024 19:42:41 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so20370141a12.2;
        Tue, 31 Dec 2024 11:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735674158; x=1736278958; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJabEfN2+g9M0aZrQH6TKNJnrlyzf+4a+JPNv5Pd2e4=;
        b=Yt+dagGP3uW/2OwZGR6jYtAnHiTW3jdqICCIcSEmAuVdpgYH6BUbQVsvaJvQa8rDqU
         JCgR3CATcQW2vLiLOJuwCbgIxjj8LdfqSKBL2gwXO6e7rBVAcwJHRyBgWL8ACxcMdpcB
         nZ95Hs3hzCgidjYSYNIDotkFnDkQnBNw9Jn0i5tLJ5Xjfus9gaX2if22iNpMitBWJdsz
         x6qao4aEGZ+rEkkMCpvaHUfjVFqfcVS7dtvIs+jVmbqRvvZCzjUumY4s3mPpFsjoqcFg
         t71f4dbj4IKVuyPcDMzSCvLxXDaEjhFG3bUldS9oWfRs+K1tFI66cSxzsDkRMfi6d1Nd
         z3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735674158; x=1736278958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJabEfN2+g9M0aZrQH6TKNJnrlyzf+4a+JPNv5Pd2e4=;
        b=Dpj+RIL6jyWqliSz+NAI8KibPDE//iZ0rk5lSN0SO4vlPKiC5LEdPvPrLV0Wmd31FV
         9DZreIDe5zxUEED4U7mRwLn3hgKR5A6cLzngJe3Ppo22X3JU1E1hTdr+SAEGhEMRKtmi
         lc7mm3aVe7yceseHdndipsMpHoKqtyle10/0tfsPT6/g4gQqYx3OXOXUZ8HrAK9IURLP
         0pDT/F0rgUKEu4R/vDF8gUo3k5qqTSITAvwgCGwSmvcjc0p9q8c1wKmhirMsvtp8v5aY
         VwSCWra1IIfDRFtKtO+HkNub7JZdBKW9siZE1HfQU+GIS87f5Th5OUBkt7GWdfYRyySk
         jv0g==
X-Forwarded-Encrypted: i=1; AJvYcCWB+B5OyA+DW7g1/7ll4pCw1rpo3z+rRodgf5R0xE4EE3flpf8epd6kYCF1tShNKVex8aHqTLExCCIOm4sa6YYv@lists.infradead.org
X-Gm-Message-State: AOJu0YwuOYGfp7+Qnv754Z1trQZ8CD2Snj8kI9UGyoOtZLdUa8ynViPg
	HHU9RdVZz7F8qE0qXkaQ6ygVdNYQCmMJDgfRrudpjfsuNDwLaK3Qv2861g==
X-Gm-Gg: ASbGncu5rN4V1InSni2GQLwlyyvVTF3lp88bOCPiCcggtaJXGxdfRQ34iTdm3MdtEfb
	KfqWvVZF9cZkBglBJNvaPABekyr55fxaqUq1o2IniDxyYe45WIKde3Ei7dKJYqH1LUN63i90REw
	AT6gX9F5CV29LQ0tFImH9ydKzR/N4UoMKpbYPaQfRndx7Pk3JNnJ3EI+ogbjQdHDLP+1SrczSu0
	F6RLHRIV4eN82mt8CNIcY+D4DiGd2c7+fOMzTqdLrgwXO8vs4NyOKsDGA0lJabefS2PqGRCf8vl
	8fd7hLTw2hnDbV9Kd8D+xC8OlIOqgDYl02yAQ/3J1JPGMke6Ay6JQTagCi2raIAy1vmrl6TeTRH
	wxiygsqAmPBpiYWFzU6cvnCDs
X-Google-Smtp-Source: AGHT+IGLAO3oHae+wIlk3vvwlaXl9lbUWvi5ye/+DPKWzZhXsRBrXgPATNuW30UHumtg7UgSkV3uhQ==
X-Received: by 2002:a05:6402:4305:b0:5d0:e014:dee2 with SMTP id 4fb4d7f45d1cf-5d81de160f9mr40275201a12.27.1735674157641;
        Tue, 31 Dec 2024 11:42:37 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b300-ce00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b300:ce00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f9acsm16237820a12.31.2024.12.31.11.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 11:42:36 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [RFC PATCH v1 1/2] dt-bindings: iio: adc: amlogic,meson-saradc: Add GXLX SoC compatible
Date: Tue, 31 Dec 2024 20:42:06 +0100
Message-ID: <20241231194207.2772750-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
References: <20241231194207.2772750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_114240_276155_603DE8A9 
X-CRM114-Status: UNSURE (   9.55  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lars@metafoo.de, robh@kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, gnstark@salutedevices.com, krzk+dt@kernel.org, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add a compatible string for the GXLX SoC. It's very similar to GXL but
has three additional bits in MESON_SAR_ADC_REG12 for the three MPLL
clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index b0962a4583ac..bb9825e7346d 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -23,6 +23,7 @@ properties:
               - amlogic,meson8m2-saradc
               - amlogic,meson-gxbb-saradc
               - amlogic,meson-gxl-saradc
+              - amlogic,meson-gxlx-saradc
               - amlogic,meson-gxm-saradc
               - amlogic,meson-axg-saradc
               - amlogic,meson-g12a-saradc
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
