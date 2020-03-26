Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393DEC43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 16:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D79208E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 16:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Te1avQOC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gXvzLY6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06D79208E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/VR5JVIPfjJHfZ+2hXnzABqnDgh2HZUytZ7adXkmp1U=; b=Te1avQOCQoL/Lg
	Q+5d8zigtF8pdtopdO7Z/8jJutZlcYE/sps2f9+3q4Yzv3n2dITnTmhXo4gcnH7riaKQMp2vooQNe
	/1OmKbbJmm+yYMUnu1Q90ErmGTsbuDs0C4ODgfsS1K1LagNchfZKttk5dKUcXbNSbbt3ItaNKgS25
	cESwgXcYyxq3aIIEXa8RhPeLtxBgZVohlmk86/2EZiERCgH8udX97D1ftmOJZLoIfYdqU5mVHSsLR
	yisbJzX1v6S0I3wU/pyCceDsOghUlQyJwSZDQ7BhTo4hqt7Skop5e9sTdUqS13HJ3Bjzg+r6n0saL
	jytm68wRWabWg9WvzYNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHV6I-0000eG-75; Thu, 26 Mar 2020 16:11:22 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHV5o-0000Cz-5O
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 16:10:54 +0000
Received: by mail-wm1-x343.google.com with SMTP id m3so7667128wmi.0
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ef+2V/P1wVE9VpsnS3HxhmcxnSy4fChdW7K3iDl8o8=;
 b=gXvzLY6CeYfNADxB4JG7xpxE1ji6qxNQpWQTYlcZc2xV6aeQHWJx7+Ku4CkmmIsu/j
 5lgc2eF4IeXZDfNTc/6NawhJONqDcc/DonMZnbnHT0pkJe4Ep9i6OGj3M+DsdjC8PqJd
 iEBf/wVHXTc5e4Tqzqsm07uRysLqJhCt/Kv3LORjwjD/TPUF3QZ0D6hXGOrqkxoOtA4s
 bxNHXHXqOhXOVVTSJl4cg11QufqsP2o8bht5TXZuCL8edYupMSlZTqrGGypsOYoyGTql
 m4QhIuLQReAEik1QYMGEMfhZRtTJ8t+RfAQbQwcnrq3b/Crfd7YVI9IO74+xVSRjY5iU
 KQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ef+2V/P1wVE9VpsnS3HxhmcxnSy4fChdW7K3iDl8o8=;
 b=NvWl8Wjmapm9GzaQlFyn4rQJ64/+RmRnsMKytYR2rBszhXUTK3MpM60Rvyigp8cFpw
 6qHA0WpLYejdgYG4TmVeScUUsPR1u/+Yv2NYcfgfHyQhHjjuMth5qCGF3zgSEtrQOdxK
 DLd2qsn2VrcEWII+DTdjCBvwBU/zwiQ+G/hARK9A9r8OzoQb7MgUdoy6kp363whO8cYq
 e8Hhn8fjnZEYnAb5De8+mu0/q9enNW9vJsdScnQWgi87T9xIE1TBng8n0d83gy/m4BXt
 VUMx8HpXslt/+OkBlkBQRi2TjSeGpPGEGw+O81yQvfjlcO5MXT4GJuA065vJTXjVeLsC
 k/sw==
X-Gm-Message-State: ANhLgQ2hLtqEis3/VDLI+1uBDsFOfWnm+owP2znGrJXmzHdpoj1bfjk5
 C3vkEXo4Ps2H6P4rcvSdomdagQ==
X-Google-Smtp-Source: ADFU+vsfmcT+ctSJtMv05Y4tqAkQhOxGFaOI1CZwiZ+BkPxzrO7+Kc9u+EBInbsonLwD8A2tC7yMtA==
X-Received: by 2002:a1c:9c85:: with SMTP id f127mr661739wme.91.1585239050485; 
 Thu, 26 Mar 2020 09:10:50 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id v8sm4275098wrw.2.2020.03.26.09.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 09:10:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: dwc2: fix bindings for amlogic,
 meson-gxbb-usb
Date: Thu, 26 Mar 2020 17:10:46 +0100
Message-Id: <20200326161046.12111-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_091052_204439_60A53E8F 
X-CRM114-Status: UNSURE (   7.41  )
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
Cc: benjamin.gaignard@st.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The amlogic,meson-gxbb-usb compatible needs snps,dwc2 aswell like other
Amlogic SoC.

Fixes: f3ca745d8a0e ("dt-bindings: usb: Convert DWC2 bindings to json-schema")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 71cf7ba32237..b7b9ddcbc637 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -49,7 +49,9 @@ properties:
       - items:
           - const: amlogic,meson8b-usb
           - const: snps,dwc2
-      - const: amlogic,meson-gxbb-usb
+      - items:
+          - const: amlogic,meson-gxbb-usb
+          - const: snps,dwc2
       - items:
           - const: amlogic,meson-g12a-usb
           - const: snps,dwc2
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
