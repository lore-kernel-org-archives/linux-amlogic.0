Return-Path: <SRS0=t54K=26=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C47C33CA3
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 10:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 661A12073A
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jan 2020 10:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSlSPBEO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h0ow4VeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 661A12073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rud/CrotW4srpg1c6Rk05FGBYjb464U3OcQ9nhC07Ak=; b=dSlSPBEOwgl4+G
	Rob036uHzSVMpr2s4TmDi1JOuGjxyAB5ciVmvB2GkRuCXbg9dlG6c6XkRyQkWdnufuhcb6TMcWgXE
	tslXhXBeG/c64s9LUlJ1PYh9faSX9h5WEj0/vez5ZIyA1TtiKB3y1M8Atefq3oL35YcxTU4+W2AUQ
	8ZDNo4Cl9qM3MESzocoJKpIrKdjFuFxnSO3knwsEVnP4J6rblR2i9usqcWVXeADjn6kJJ7MJ1M2fd
	vJwwfsP4xoW2KV7EfCiCY/LY3GReeQuvC0xAok0KvrQQVH9sYHUtNJmyUAQ2rTtfFcyBdTcMWWOCU
	zYGfd/TtmLsJXHuvG8pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipUrs-0001Nm-Ko; Thu, 09 Jan 2020 10:16:44 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipUqq-0000VZ-SV
 for linux-amlogic@lists.infradead.org; Thu, 09 Jan 2020 10:15:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so6739916wrn.7
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2020 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
 b=h0ow4VeStV9ER/XHasMs74E0+JCwgBvbicr55G654K+QgM0E3o7aCk/LftohaQ/mam
 K/oPl1DN9ogDVNFnXQbG619dEI3IiXEBVkaAAHXUe7T8aypF4zBkArvDclU6nylS3EZM
 RsYFqnDW/LsLHvnfFU1VGIYFweyPCIYpDVrRkeaGDhB5ogdRzQQHJFTmBSANZKatHOHJ
 l7suu9Wc/eeOJCwarOUn3veAcF3NA986bAtFIgIh/Xi8GhKX1w68ZtCg88Sk7IclgS5v
 FaOPmjwSuVB0QSRe/FpXDssCBKIP/At2DrBAd2pK7bu89NvewLGccxwZioH4NbNJ8yvW
 2kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cskzhIjwtS0ZVRi8zMZa+kHk4M1kBjG50N69LQL60P8=;
 b=UB4sEh/s8mkzxDYCOGfUHzm8DClbvWoNEqccHUHTwxqTK2ZUmVQpiXeaWQV3Lpf6US
 JJPKAhsVHZJC8BijP/dBiw8JRE6eAXebVizncK8wGnVWlF1KJq371qpZLdcHA5LOOuSZ
 NEBmZMJrWDY6llYRgvko98i5/mxDsIMDESwFTGOHVchAijO09pZ6Vnvm5n9Ja1CfoglC
 To5SzwLzQsHumH2ZDhwG1mZSkCt6LuxYnZ6t8BGPWVTPv5pFfkCx9qPdlTwFA57AoiT9
 Oz2+LBu58sydFBSB0gAPI3YvsTpM7XyDTAobLUDfpi0mnECEuR6JCYQ4PETpQk5lu66M
 lrXQ==
X-Gm-Message-State: APjAAAWtZP/BnC67i2BhWE3CTdJfIyUwJz8a+lBiSqP81TYFdyHcXFMf
 EnKwx9Ed/O6LFKz/g6onr916TQ==
X-Google-Smtp-Source: APXvYqwBJeqcb+JtzqfcXa3IBx+RAeZpEMUk+jeaEw1/iu/wKVv0xRKabBxEgIHfrQJo/hYAfvxhCQ==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr9833559wrx.102.1578564939054; 
 Thu, 09 Jan 2020 02:15:39 -0800 (PST)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q19sm2250460wmc.12.2020.01.09.02.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 02:15:38 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
Date: Thu,  9 Jan 2020 11:15:33 +0100
Message-Id: <20200109101535.26812-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200109101535.26812-1-narmstrong@baylibre.com>
References: <20200109101535.26812-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_021541_014086_5F4B7420 
X-CRM114-Status: UNSURE (   8.20  )
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
