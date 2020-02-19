Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DCEC34047
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:18:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336522176D
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHw+/lxx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OY4L7JXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336522176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rud/CrotW4srpg1c6Rk05FGBYjb464U3OcQ9nhC07Ak=; b=iHw+/lxxcNZlpc
	THYRyRxM9RSSnuyEG6zGcCVIXtKSME424u7AmoiBRzB8Fu4jCk6RN3T6T1Y3zh/nIFyogj39UF8My
	dvjS8JH1QvmPWLjKy/XIwd/6AOJS2W5Rf2RNtQG8fKc8PzxGwDGiCJLT2W/PH8Nf9ntwj/WbSQvBS
	SAXNtnCRQfOMA3qMUDQpt4udgj3B5r5X/p9km0+5BAA/G1BYtWyton3qDkRDaLif+9YKkX/hbXpZT
	D653fkFyHKGH657J+OO9BONkFuE9RdK1/c27UJRU8yE5NklD91+4qUsFY7BLb/6XQoTosDaWv+QbZ
	TlujUpic0PdR1s6ApsIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4QBa-0002AW-ED; Wed, 19 Feb 2020 14:18:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4QBD-0001og-7c
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 14:18:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id c84so830810wme.4
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 06:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
 b=OY4L7JXID100VO7sMstNm3Vg7a0+wT+lVdg8MEtqryyI+TYXZGlIErbrrbqxqK3yPs
 wdvk41G17tIZ1Ri3e1jZu3lvbkz+5WxSsokZK4IB2ZF58bVnRIxqOra/hIWPqh0WiXTf
 3BciMV40Ew2d3lcXTn5sJCCJq40CQBm5euELUb6bmhenK2YYJ9K6Yqgz/s4ZxQh0/uMc
 OaH+ZvfL6aVJKEfZMgW3jmEQ1bcHAKMrYn7T+qV/V5xvTiPqsJjuprnJjJT//dt9wJOa
 nna9/GHGDLoUjKC4FlAkG4+HUnxCFQu7hzgb5WtMEJ4d8GmOtobA60I+8L48wt4aoh0b
 ZUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
 b=WfnM7I9Nsa/uOADejTfSxe8eptaWR2MyGq//E8+Sfs2D4YBtqT1of6+VxgkvxWR5YZ
 nWx8w3sX6Ao9hmP8FDqUql5Lm03aSKfBp210PH0B7qkqIkvPqPvH1hIsbzAo839TxwSm
 JwCdt7IS9IAyGsipXvP7H3Y8tkbXollSTKj8vMbjEgW2+FbR9wiPxvpfCzLuk0kRAXAa
 MH1Y80PaJlPOIKiaJ8ISjBzYavR7X7R5eEaBQTP2HrQ8wYErBtEMlI69J0utp0PVktjR
 H2WOmvUpJtgL+xyWpTdYPgfMy5GfDyyTrhPAvlQ1sKTtTuiljqAgKXjSAsLdMErQd52s
 ixiQ==
X-Gm-Message-State: APjAAAWgiQzsIVke6rdI+Ak6ktycO+xLwfTfsiKUBzplSnA6zz86P+Ht
 f2ntKqg33HQ3FS0EnVPfyps75w==
X-Google-Smtp-Source: APXvYqxbFf7wsrLC1kZpSw63DDiVHiO6jf7+hpSQDkUZ5FYc6y6crGhDW4wdqY4nIxMLAhwojCjI4Q==
X-Received: by 2002:a1c:6389:: with SMTP id
 x131mr10179005wmb.174.1582121901731; 
 Wed, 19 Feb 2020 06:18:21 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:510e:e29a:93ab:74c3])
 by smtp.gmail.com with ESMTPSA id b11sm3337772wrx.89.2020.02.19.06.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:18:21 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
Date: Wed, 19 Feb 2020 15:18:15 +0100
Message-Id: <20200219141817.24521-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219141817.24521-1-narmstrong@baylibre.com>
References: <20200219141817.24521-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061823_271644_20DA3983 
X-CRM114-Status: UNSURE (   9.06  )
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
Cc: Rob Herring <robh@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Jun Li <lijun.kernel@gmail.com>, Dongjin Kim <tobetter@gmail.com>,
 linux-amlogic@lists.infradead.org, Thinh Nguyen <thinhn@synopsys.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch updates the documentation with the information related
to the quirks that needs to be added for disabling all SuperSpeed XHCI
instances in park mode.

Cc: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..c977a3ba2f35 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -75,6 +75,8 @@ Optional properties:
 			from P0 to P1/P2/P3 without delay.
  - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
 			during HS transmit.
+ - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
+			park mode are disabled.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
