Return-Path: <SRS0=LN9z=TN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FACDC04AB1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:16:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51CE920989
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2019 09:16:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XsD8KSJt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PrHEdLQW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51CE920989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22kjhEhDgf7USpmaXQFtwhO1wiMs6XVd14gqwXnHexc=; b=XsD8KSJtPHDsGN
	9my46nuDAOJBt2+hKXNplc+mTp2crGMlbvYULLuT6NjvRvh+McWXy2+6hM094C9rU2a409ZeGCqGr
	gb8nWoIHzCUjw01N3TucZsWyKihLTGj1TdH3/zoevR0Y4oMvDECOfCeY0L/nUVrP0vgUnkNBmUVna
	XOX/rHj8EkQg1DTaFB9ltuYqTO4quXg8SpihTRlqU9oHGrykkjFRBcXyTQ/bH+1MKZCIEIPKqL85X
	drM7D7/SH50+l/20MfcuyCuHrvfIlN+LTunGaTaMTTQH0HcyOj4gPFCP+5/6YqfHtUqyp5uh1M353
	YHffVHGJZMETIzPlrXwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ748-0005Og-8P; Mon, 13 May 2019 09:16:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ73x-0005Ar-Gr
 for linux-amlogic@lists.infradead.org; Mon, 13 May 2019 09:16:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id f204so7525924wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2019 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uv+6NV0EmUQP0o5PRDrka5VQ1Yz7shhQm+scRcHDJZs=;
 b=PrHEdLQWGkg3wCKaKVYVhqAgvxPN8AddD8F95eEsou9MkjYYCZfe8HTRgUxYpGYN2b
 dr6F8D0T0TVej18Ri4Aks12ZaF8HmNTi7cThd35lyB2PszuStakgUBYBcK9h8s31i4xv
 mqqnjpunSO9yctBrY5DWzTRaQigPMcCpEO0FkZ8Wb09WV31zf3E43Mi/N31I8XGJZsX1
 //dhG1QQ4C42WTEthDahd1KJkSixjCpmq0cBCYZQs/sufY6iHsiQNYHCsXha//f4zguq
 L420INpGoj9ekK6sGWNwonoow3OXe00RfTqx9KMS7TJVnYhYwMlm8OXI1Al61wWvXvlw
 dQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uv+6NV0EmUQP0o5PRDrka5VQ1Yz7shhQm+scRcHDJZs=;
 b=paoIDFvqKHnn9/3QGOncpsNAgqzTWtHS1QGm+LkpSlMLjPLIkctloMukfSSlhhDIH0
 Z6+yEa8kHMSM3TnvQbFKhIHp5oKm5aE1TJtxjHwFzHSczAoie8Ae6GcRV1LbMpsH0Ari
 tR8wR3jqAJWoWfY1U3kxHps8eFk9fjrkDpdupu7Ydt2NjzqpVS+wqowcMAh1SGMP6M4z
 phIanQ69kl/w9iLQp8CTkfStmgx389B+w1EH/6SSWZp0PReuRnFQaLGQPPN15TDzhOJ0
 Jr3bQb/Bol9rBj5T7OtnjL8V65TDswgGCqMPUpZ9YZffLR0RA3aTpQhLJantTPFq1VSx
 k6oQ==
X-Gm-Message-State: APjAAAWsvFjvR+8Tk3U8DeDSHuXmWGPgWN+avczxzbKSDa5+0FP0j2Hc
 AAcGURoGr5wrZWRbynJepnubuZUJ1QnBlg==
X-Google-Smtp-Source: APXvYqwuNjtpZ5nXSONgqhfVluLzVKMVlAKJH+3lkBCN5WTnF8r/Y/p4FvW752dLN2C/gZJVrKB3uw==
X-Received: by 2002:a1c:d181:: with SMTP id i123mr15521449wmg.33.1557738959761; 
 Mon, 13 May 2019 02:15:59 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g10sm10795091wrq.2.2019.05.13.02.15.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 13 May 2019 02:15:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: mmc: meson-gx: add ddr-access-quirk property
Date: Mon, 13 May 2019 11:15:46 +0200
Message-Id: <20190513091548.16674-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190513091548.16674-1-narmstrong@baylibre.com>
References: <20190513091548.16674-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_021601_556937_CC608012 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic G12A SoC family, (only) the SDIO controller has a bug which
makes any DDR access from the MMC controller fail.

Add the amlogic,ddr-access-quirk property so signal this particular
controller has this bug and needs a quirk to work properly.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
index 13e70409e8ac..f8914dab06c6 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
@@ -22,6 +22,10 @@ Required properties:
   clock rate requested by the MMC core.
 - resets     : phandle of the internal reset line
 
+Optional properties:
+- amlogic,ddr-access-quirk: set when HW cannot access the DDR memory, like on
+  the G12A SDIO controller.
+
 Example:
 
 	sd_emmc_a: mmc@70000 {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
