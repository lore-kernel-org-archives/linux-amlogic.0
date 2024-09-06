Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1258CE7B10
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2k4u5IXZmkut1lazLdLquzC3lWpNU2sXa3JEL0JAIE=; b=hKrIcanfjej7HH
	y7W1rv+hD7npKv4L8p3yUQ+qq7LmJdo0xq4/U4flvhK4rz7RDlvD34GFepUZnV+jIOMyH/uuSGqtv
	V2y6LmP5oq7u+lUsV+SC1M90JoBRJSvxMRB33RqI//WKcQFXaZCXA1j8K8NTtI9hv89TP6ovw+NiR
	kmD0i+m9WTZNr6W/+EQg8uM1w5jivngEpa0UMCAdfVOCV5wQnWa/M9YuwjtCHRA9gGY7OfWhaw+ei
	dUXax0IIAT+e/itaEU5/7nL3J5xL45v7GEeblUXTwxDPaJYCSZQW9Ov/Xu0I7YRUX8aylll8lJqjq
	x7WunSJZeK4fKZRRZ4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZC4-0000000CNJt-09iV;
	Fri, 06 Sep 2024 13:40:08 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7U-0000000CMAX-0u0h
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374ca7a10d4so1300567f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629722; x=1726234522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdCiYPdjlPcL03UXJdJSn9R8TB2L5xNznH8+xFLLXME=;
        b=qEmog9pmXK1clKYr0aTVCCpDq1mE3Uihbr7BzuArW+/w6ZPvRVIDSL5JL2dNr4X5Kh
         XKLKtjtd72Tc9lUtbpXxdpHMdrYBDXcmsWsh11K73MiFXpGPFiao0fl9Bllx433RDLrm
         fKdcZx9MBeHp1B8gnm8qGhRDVlT6q1OxVrQ0um3asGpzmH0aDUTtH+zAq7euX0Lnsj7h
         0xdrUUi0c9I5IlGNXQWFXTAh1k6nWviJvpV2kzQmFRlF2slidMOTSRc/a7GkZsx24GJ6
         qUUicgyWy+QFZbPKWcGykmUTZqnOCDi9ZgxHO5C42OX0HurBcwHmIHyaUmen5f/oaRaX
         xgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629722; x=1726234522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdCiYPdjlPcL03UXJdJSn9R8TB2L5xNznH8+xFLLXME=;
        b=Ypp2mqVD3nRqeEgLWBenNDmH0+AFKYLd0lXGMRwh/8iXTqR0mmlbpmaDt6fOryFG8y
         qSgCOVzbNBPd8yBBCYA1drAdi/iZFUelRllSAh/rqwN1gVBPVpwx2lPKhflGu6MuHt4n
         z0nbNjKfH7TiUStPNheLrtoFZ1BkJLJJrPHell5g1lC4uRB7O0Av8Sg85AscbtDsP28n
         T656QXhHJFJsWU4E2iiqyhuqoe7703M4Ghc7sdkEOoD1I2Yt3DqPJBMQm9P4wedfLnFh
         Z9cfL7FIHq7cXuZen/7sGTnXFczZNyDgV5yjq7wRn8mNRvkJy/1OAMN0HZ503qS0m0/o
         Qejg==
X-Forwarded-Encrypted: i=1; AJvYcCX0CkH29LfCGf+x+uvlNHChDCpwIKuQOGdZfpwPLcZuVVfbXFvqtwZNy4pO/nlWJawOz7JSW9ZcTnKhzvtt@lists.infradead.org
X-Gm-Message-State: AOJu0YxSJdS47XOW6AcdTCkHY5WTzNO8qOOw8die095LX1T9o02MHmns
	GsXHzTSahdsPkwWOZb0yOUEWE+4ZxA6p4tjYoz8FYQxJleu4NoKEyeifIoUpnvs=
X-Google-Smtp-Source: AGHT+IEwO1wdUIgNHfUjloM9p7/zFIXeW9bGZBl/gFhtcN9dlE9gFZ3qMxWb8RFlBR6gNKwxbZsDRw==
X-Received: by 2002:a5d:6489:0:b0:378:8dea:4bee with SMTP id ffacd0b85a97d-3788dea4cbdmr1782508f8f.33.1725629721865;
        Fri, 06 Sep 2024 06:35:21 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:21 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:48 +0200
Subject: [PATCH v4 3/9] reset: amlogic: make parameters unsigned
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-3-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I6joFYKtEZpmpOu7whQFwYwYWPHiUyzVlrs8QkUbiqU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUQZPuqhHgOSA7hBjezMd0lE2tAgtqtIzJ/g
 bQLwVOijb+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFEAAKCRDm/A8cN/La
 ha10EACEv7fsnJOpH21ZFCiItZ/Yqvl+n8x74Q1Gz3GCAc/jBem4TBUzXI6KtVmikN4Hp1xbDLD
 emfslboEq3eLb+CV1Cd3+f1tVDWTrHPl9v5lzr52rrecxAc1byBWQnfX8GQIIG+G5BLVN0NT1B9
 ekvTWohL/zIEsekBTTjWQW1s+n0TSsXO2wBYWKK316irfGP1q91T60SmnxoPoHeeMh+JsNClAD5
 oATwmBoEfx0Im6PXo7Og2aZsdxYUTkHJYIYgEYzhG99Y7ly06aVRo65pDtIn7JSKX95B2t/PUz1
 Flo8XVHGvqdiXTRfdAi4GRXHZuYB7cFafY/P/e1M8jFEkhaSUWzPAMZi1qrWfxjYTW4IYTdS8ul
 Y+Idcl5yZfRSnlr+pbsXfM7FXmPJEYXna6QY7FCwXn6Elf+FLRRB7ghZCygO+fl+bzpxBmgJugC
 k3QttDeP9hdF8b00E4I9OlXhUgDrkzKM375fYNv2GtTGSZRu0YQODBASHGHKS8wuQGvlpND7IaH
 WBAG/6x33vTHlrCl54/7IF64OMCwBSlRfHnRwQuOp3DmSlFPJlRYdrzT/6sHQIq1KxB3heHGO6a
 xWEfwzA9MZUSmlv62mF2hhCIt2bt8gEQHy9/IvanxrnOJ7Bc9tURlajy/rPBw7wRuVAAwF1o1tm
 bSnaYfrHA1sD4pQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063524_263725_C38986A3 
X-CRM114-Status: GOOD (  10.14  )
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

register count and offset cannot be negative. Use unsigned integer
for this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 848c2d88503e..50bd2241ef2f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -17,8 +17,8 @@
 #include <linux/types.h>
 
 struct meson_reset_param {
-	int reg_count;
-	int level_offset;
+	unsigned int reg_count;
+	unsigned int level_offset;
 };
 
 struct meson_reset {

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
