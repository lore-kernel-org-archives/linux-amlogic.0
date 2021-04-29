Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A011AC433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E45F9613ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 17:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E45F9613ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oY83GkHAOv8yCak9fAGkMcgGEkOJHv8sL9+TAzzm9MY=; b=kMZxrfloecgbWV634YxDRhaFH
	54dmqm3/kE1zEEuckcSkV9N5L9cqxrdkBiHQcmXc+8+Yi7CkOdpHwLE0ppnv3P2kHvox4q7nQuvta
	vY3HFi/fpfkJyDB1q+lJb3iUA4dYOA5ZzKygaOfntlTCEgKBIDb3LSZFdayG8Z4624sXwRmmRodRy
	+sM9/nwuxjLVzH0yRxggc90Sagbz5bjtH9dN4NCb0+BsPee1cr7Xx8oaWtpjsYwB/By85dZ3nF2+z
	UQkSSO6PNc32qqE7Rc80GmX+MkUTgJV4/OfhD5miub9bBR7SKqQkhGkkiOxI03cRkTp4pgoE+nhtA
	1OT1U5+VQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcA5n-0065vJ-U3; Thu, 29 Apr 2021 17:04:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5H-0065pO-1a
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 17:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tHdvLci4AjeWueXRfl+ywrg6Pi3jWbPlIYdsAlZWirA=; b=uiXw2FDVNA1vVkMFedUo6YB5Hc
 DNJHsqC3eskRqz7Jmt0vo6LAjd5Mr3WNVY1Fstxg3mJrn6upxCsSmNOhsG7GmuKYLM2G+2ucwK/Cy
 VgkNf2dToiIJmFcpf265Gpx++AyDtKaSxUUhb/jmn2+3eD4al2ODa+g30AaN4ITeNBHoCkVYCauY1
 XS2Iv1EIJ6uv87fLEN1OW6yb9omuPXz6Ipk8L6G80iQ5Ek/JsG8E9JCBle7xdFwjQH4cYwqBS9W/C
 QFcrKLQT3mqgTGrUgXT2TSTJvseJbI4Q7D8ptLStamBDwGKtfBJn3cNAr5D+oAlYUCuXbKl/v9SJ7
 rKqP9TVQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcA5E-000nKy-Jh
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 17:04:13 +0000
Received: by mail-wm1-x32e.google.com with SMTP id s82so1237686wmf.3
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 10:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHdvLci4AjeWueXRfl+ywrg6Pi3jWbPlIYdsAlZWirA=;
 b=Go+ktUieE1y5w7VouhAHT1nD6iJ2PflfhXDn4lVlwCWRDuTPfj1Pj7Gb2Vj5UJlqgr
 exf6TD4FxTUx/CO9TbYzJZytkkEXFL5szCsoKMi5FzFPq7wljOwqnZskqgr22eehdTDZ
 ONxHAa4hJeQWhzu05HfPFy55aL1RwnWuIynQ2Cjh2Gjfi89Q26ty1+TSDrRa6QQcGWnn
 aF0qD9ggCwsyo20pV1n7hm+iVS0up6RiApRND31g9B3Fv0sAjxD2xc24Oy7a/vfU1/C1
 oQYwFQGFjXx+d/vtFbOKUmeAn30SLRhfmvrSyNW4uQ4Kt/IvW+azzydwks5k0r6sAvqo
 hRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHdvLci4AjeWueXRfl+ywrg6Pi3jWbPlIYdsAlZWirA=;
 b=nd9n/mGmF3Qw5rDSc9+19O/OXNI8HfU0L153mwK/Z2IOQpP/R9xTeBj5wCVbJdJW16
 V+SmEOoD2ejOP0BSDodiTC7gySZq7/7KOR3mYngZZmvVWyeM/SoJsSlvRwHNUsC/M4yO
 mv0UysnYRsiHMdrpBobACMBAWXJvYVUvoivsGeT07vkzbqny/NkgDQVL4Tj9/MrqcshI
 d/aeqfZjFDNX3/gPuaqwRd1TBaI0jQXdFVXq6qplB0nyw01EBgjFW2BmHcYJYLgrzBve
 xsRKQLMTCYSAGntIL3fOkVNiWVezoZMETswwyI2BGQLciJf6u6WlKgZMXb38EsxCbN0f
 kcPA==
X-Gm-Message-State: AOAM5306Co9WYDGB0z370Hz/UyQFw/hXA6acKvbPC/Kipv9ocsOD/4wI
 CzLEYMnrmQzQ7hDEe39tLDpfJg==
X-Google-Smtp-Source: ABdhPJyHu2ZQXATO3CS2wDNOUAsdz6c46NgNdi4tAh5px8nKSJfYM5xbkZOG7QhbTBvsfFdUviDJtA==
X-Received: by 2002:a1c:3505:: with SMTP id c5mr11492526wma.169.1619715849941; 
 Thu, 29 Apr 2021 10:04:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:c304:4b2b:4a79:1da9])
 by smtp.gmail.com with ESMTPSA id
 18sm11041275wmo.47.2021.04.29.10.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 10:04:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
Date: Thu, 29 Apr 2021 19:04:03 +0200
Message-Id: <20210429170404.3616111-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429170404.3616111-1-narmstrong@baylibre.com>
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_100412_664617_3BE8652D 
X-CRM114-Status: UNSURE (   8.41  )
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

Add bindings for the Banana PI M5 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5f6769bf45bd..4eaf400c3522 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+	      - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
