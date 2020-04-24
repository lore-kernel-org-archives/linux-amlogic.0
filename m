Return-Path: <SRS0=67Zv=6I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4027C54FCB
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D11F20728
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eeBXRZ5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Fqx8dSb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D11F20728
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr2VXBI7NU13iOOhcPYne22HZAAdm3ZDsHLtNCnoqzc=; b=eeBXRZ5MxHcg+L
	51bIFGGkFEZRdnambwfLmeY/74bIuOFoxmS8RUaJjAsDq3dZNS2ZuKbyhVA9/APjmumj4VKr0ebXO
	RCJrNnsYj2UaA48qAAgN3OaQpOzjG77jv5G7iSIYhm8Q4a7lhc1D98X+SD4Q0plN8zCL1ga+9QXed
	A4KxLzlHvHTGvBSqaHQ46B4UJybi9d5kxFgFXWLcdNBIjbmlxmpNtEvjQWCKNk+3R3XJvUqAEeynW
	x3Di/4sdwzHU9SfALEx2e58smIflsnexjzzdNB4a3m/9/50oboeFvXAgFHluMXQGH14+6SUXVG+xh
	qQGYrMVCCGo+i4p+34rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRxhF-000617-8n; Fri, 24 Apr 2020 12:44:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRxgl-0005V2-1e
 for linux-amlogic@lists.infradead.org; Fri, 24 Apr 2020 12:44:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id 188so10284019wmc.2
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2020 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xOdCgu/2Jy1tRi9zrYa6LH0k7m/VVjyha5EYFTG8NAo=;
 b=Fqx8dSb4SMac40DSvMTs7OdAWMYlayXuzLjkXiSvM/Hffc5WJknmgmnXLrrTHKpn2X
 0LkAKofMeSpQHMPvFNZSJ1Muv0cvJEXfsrkTjZ8le0kNVd10v/kh0p0mGsoPn/Sd01EK
 BE4vRSTePinMwUD/eZb/gMQ9AqXloYjTlbrsEFUpRzRz+z56zW9PSXgllsk4vUpjv9J0
 2PgpgaEiqX/z+UR0BmAH9WVGA5kwS3s3kxg1mBDXq6nkX+IFlROXk79HQnmAlz300v/j
 QxJCl5BQ9xbhC1Rh/MZKGylXN4Uj5ZrtMbxDzoDbay3FocxYJ1jarsL12w114sDejED0
 CeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xOdCgu/2Jy1tRi9zrYa6LH0k7m/VVjyha5EYFTG8NAo=;
 b=FhC2Tn7XtJOdeBz3s/uQrdCBqD0Uzfnu+yzCWp4JmBGnWiPBt4K3UtvC8SmaFfgVhi
 cpNhvPpt8SMDfF9Adw0itZCzrnI/zKByGZcudKiI9Z6smewJfXpjo8W0rpXnlD9FNXko
 Oa3EdAYMI40WkCWFrDSvTo2ukGKa9AzP9mP9TSQsMdKuocs0k3t5S7uf8gbkjNZ88oIM
 tLtQyuFIPeUS0A3HY4Ouy0jc19cDiwBkPTS6AxeTY+SeA63aR0sIWiGycviTyJVfdN5h
 lisR5Khh/TH26aYoD+6GJZu7Xsqome3bp1uuRwYfx+pO42c6nNrRZFxHJvVMaxHLILwO
 TOBQ==
X-Gm-Message-State: AGi0PuZZo71IEim1lj2oiCoy0AgBBHlJlOM7GMlF+/ymNCdSN+0Kkyfx
 l2RjQPUnrMamlNUD9dRLIhJbRYDdUXvtAQ==
X-Google-Smtp-Source: APiQypI4uWmGIsxURAuSlISBDYaM7+FkzOgegq+RzXjv0ah8X7qTCaEjsrJvykKg8cNJ2UGbrdaBFA==
X-Received: by 2002:a1c:44b:: with SMTP id 72mr9777439wme.58.1587732253434;
 Fri, 24 Apr 2020 05:44:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id
 q184sm2692689wma.25.2020.04.24.05.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 05:44:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add odroid-c4 bindings
Date: Fri, 24 Apr 2020 14:44:05 +0200
Message-Id: <20200424124406.13870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200424124406.13870-1-narmstrong@baylibre.com>
References: <20200424124406.13870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_054415_092977_0A14D52F 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the board bindings for the Hardkernel Odroid-C4 single board computer.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba48cec1..11908b151e0a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -159,6 +159,7 @@ properties:
           - enum:
               - seirobotics,sei610
               - khadas,vim3l
+              - hardkernel,odroid-c4
           - const: amlogic,sm1
 
       - description: Boards with the Amlogic Meson A1 A113L SoC
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
