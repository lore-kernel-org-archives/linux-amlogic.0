Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4AEE7FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxLbCMd54ODtgHgKFeafCuD5oOXBcth02WmmkeJ3GrM=; b=HsaDpuG2muGvHJ
	Dy51tMVNO9Mkt2p8+MMEir4AsVng76sDNMZd7kkI9X8rR/4/2AzqHi2VmAYRde6FaXxijNurqhG7e
	l3cp7OCqhXTgWOeegmmNzB594mJvT7bF73NK7btFvXSkvC/S/zyCcAcDTLsTCwBKQS7onMTSeNRdT
	OjifPNFWL4YAFjfLCmevCi4WfaVayOOwWtX23klpfihnjvtLv6iagzaVPnLRAeKiF/yGbKf+GEnYs
	d1xUBddiR3GQ//S3kuaiLmllsWgqp+t5lCGd6Bu81+cQvrgiQyy8TGN1fw1jPjIi0W5LJpR3AnZhs
	Vdm+15ipolw5EGeVzYIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6t-000vfo-35;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6p-000vd8-0n
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-403004a96eeso25256455e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447153; x=1695051953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtIhAxbGVK+7yj4SNMHYOQFab9XtJv/AFRYvoUE3Ztg=;
        b=3c9RB3QLWNPYF9S6pYHTIOM/+ePnMeVUUq8B1cqXd5LBgJu5Rc39HN/SKfk/nwawEW
         IR6wkxptHnRY/vf4GWRfqIhKQRomKrP8+94qSIKziqbGUgr6DG+8ryb2jgXJMlKWgTT4
         H9Gikig67G9QOcbGvaL1b9EyTIf6QO7R476XbMGyUZaUeBKvV/jDbnkFW6fXTqGwXxIi
         5kTr/1pQNl5ptq31ZGFWs3KuHKz/TV8RMJ54TytCnVA6NdHQuLFroJTVRoeFWhXmUZqu
         NwI4ZYXIXGZQvvdYKA9xYDt/31ZwiUH0lfcROgvJXFfICtp1ihkRwSoijwG/sUSzLseI
         tozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447153; x=1695051953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtIhAxbGVK+7yj4SNMHYOQFab9XtJv/AFRYvoUE3Ztg=;
        b=SjEBiKtqDbTR1uA0NoKupneLPK6AdHmZoi0tbilRXDLt/e/FZsl6ekp8FONAhoGPqC
         mV47Fk57+iuE2mTpSsxjWiZuoEQMwO+6dZNM9ArQ/d7WbZf+fK5LKTQ6QxkWZQb5sPqI
         mJP6CCZPT6YWC3afacRVzPJEWJ6Mkt1kaytlL42wVlpmMIBy5YrA3j80vbbRG6Z4Nmor
         7uj+59wqrg8D8TgYnBG4wfteSLYGCadiaVs36WKquU5a/tfax73mk9ko2ISFKNg4IJci
         jcIYyIZLvJit49ncokjk9pSkwq3Sc9CGmu/t2PUyoPhBSDSI7RxTxwKlu04rBv16IZVq
         rFJQ==
X-Gm-Message-State: AOJu0YyuF6T+5pEwgoJOpAQ9wYgyDm/M6YW0lCjBsEH6+eFP+man9q2d
	oaZEhSEyZBYvDiRT6kTCqZpHHg==
X-Google-Smtp-Source: AGHT+IFlHuDGD4y/pkzGSIaXA5xLAwU8gajS0add0DHyT1XivNj62MdgH/kpwUyCyIHaYB4pZmxRlw==
X-Received: by 2002:a05:600c:b4e:b0:3f8:fac0:ad40 with SMTP id k14-20020a05600c0b4e00b003f8fac0ad40mr9105096wmr.29.1694447153244;
        Mon, 11 Sep 2023 08:45:53 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/5] arm64: dts: meson: u200: fix spdif output pin
Date: Mon, 11 Sep 2023 17:45:37 +0200
Message-Id: <20230911154541.471484-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084555_476629_66B84207 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

u200 outputs spdif on GPIOAO_10, not GPIOH_4 which is used for the LCD
panel.

Fixes: cfae4eadb7cd ("arm64: dts: meson: add audio playback to u200")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 2878e3ad7de2..8fa17a62534c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -396,7 +396,7 @@ &sd_emmc_c {
 };
 
 &spdifout {
-	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-0 = <&spdif_ao_out_pins>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
