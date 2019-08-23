Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8FDC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DAE422CF7
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDcIO8E+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KqpNcM5A";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LRxuLnOg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DAE422CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tGQILxAw3bSpXAnQnuddZtPR0zGvC414cHc0gvfB2I=; b=kDcIO8E+ucFdEj
	daACNfEYTd213MF9FECQiHL0Bo2bPDDmCQGBrPy5/20I/4HZB5imaVdeuOdc5OMknvyDo1aBqL14i
	Ou+04DWZ/KPpO8lW5jJGcQvmg7T0rMtpD7pWN7x6w8iOkbKkmiHwmYZhdH0iKxNH8f/kuN7dfDaoY
	BJ4Fr2hjFhqcd5vakip4z8AfmyGdDfb8AnmyN3UxkVyTGBwXy4If8mfhs+DmgHYSuhEYAvqFY4igM
	Qm1Eqekqv0gXK7RJKBW2bfq1Exbc/kczADxE/2yqfawYI1pXjOhyfUFj4Q40uIapTnxsHjEZEpbxw
	0marTNrWBQ1mIMFOH2WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13t2-0005Ag-4s; Fri, 23 Aug 2019 07:21:28 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bK-0001Af-Cb
 for linux-amlogic@bombadil.infradead.org; Fri, 23 Aug 2019 07:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uI8qQhPoSb2o78mSYJur6fMHkdVTqendruK+vUMA+EI=; b=KqpNcM5AHe5GTM8TdWnQk4noqB
 OIZvH/pjQsfzfFq1BZaJellyqMTnR0d99tSuNWjEST7Ss3mRjeBb56fk40mdW5vQzMbCQdORlLg6N
 BPZlzOfrZQ7EUCE7SoE5h+rPahCdcce369C52nnc+pAgewJyBxX6UpJkl+iVGI0NVAazhBeoHLVfB
 DegpfTXam91IKbOmCqgpk7mWPwxciD6nPeDVh65fyOY0K+EbKYYAYrm+Ym0cj9QtwjRN777bBACuX
 Ef4fYPdlIJzl13M4Vrvs9iPKmQ2KwHnhs3+5touTh/eJ7+jHOcERKzSKzPCIL7EamzvFM7qlj/nzq
 SMdbr3Bg==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bb-0001gP-3m
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:28 +0000
Received: by mail-wr1-x442.google.com with SMTP id p17so7588770wrf.11
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uI8qQhPoSb2o78mSYJur6fMHkdVTqendruK+vUMA+EI=;
 b=LRxuLnOgnkev29O5lb2dlPiBfPa1sUXeWz/jSvH/c6uTLmk9wmTZ+lv1qzIcNpT8x9
 jGq7Zs6Iv3r3izu/Eaq0Ej/39vRhNMYaO8vqse6XVCA4nLV4tGfzmDhu1Q/3yXJ73uvf
 LDFzEC5eadqmsQpAUKSMwUzmM20p9FQEDc0zFoXdOD/c8ufVi5RExUfpJ6l/PmaTQwgX
 mX7OFYVSszT4/R7dzAy2fTBcM3kemZTVLhBpg5th3IblC77zRJnLEOC4tZnsDJ0mt4b6
 ySZJW5y8+2KqFkEe3mLTqQX2YdgHIaS1fKrbrzNFpi5/33EZ/ufy3pfi2a5WMFzMr852
 8UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uI8qQhPoSb2o78mSYJur6fMHkdVTqendruK+vUMA+EI=;
 b=YEb7qnUkJFHgfH5nkf9UexgzW2RklrB5JnZ5wi9jI8hfpTIanPEkv2jUV6PxaIMRlu
 LRqXUvdc1NxmQKGaVcz8/Gfv+JriMYugsL21NctI/8JDOFIZTNMjclzcCM+uukdeYtSf
 S6sEt5PlxctPOAewiDzXkUeV9OmzZGxl/ouAEndSvJnlv+pAKtNym5Ae+BP/cC54bpV+
 helwKQwHmu4VuPbLsYTDJ/J7vV0lMXkh3H6HQmhOVQuuJ9XA0FmznDCr3Arj1LtfxlVN
 8AV3SD7JX75l+EzibyvTNvrOeDbNYsHIHquhb1diFH8xAcJwdOx4wIcvf5U9RJuKsQAw
 SMqw==
X-Gm-Message-State: APjAAAWghaJJAEDBsFObsN43izEy7LQ6oi0/0NFALBDl7iAM3+YqrCvn
 c5UYjGYPEm3kU57E9wdfPHo5oA==
X-Google-Smtp-Source: APXvYqx5BXWNMME8DGfmLerCyIhSAAFxC3+YjVaDJOMVLxMm/VisM7XkyefM1tsKyH3BQ6Dfmiwqyw==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr3013137wrv.73.1566543785617;
 Fri, 23 Aug 2019 00:03:05 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:03:04 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 12/14] arm64: dts: meson-gxbb-nanopi-k2: add missing
 model
Date: Fri, 23 Aug 2019 09:02:46 +0200
Message-Id: <20190823070248.25832-13-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_080327_179761_CEAA19FC 
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-nanopi-k2.dt.yaml: /: 'model' is a required property

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index c34c1c90ccb6..233eb1cd7967 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -10,6 +10,7 @@
 
 / {
 	compatible = "friendlyarm,nanopi-k2", "amlogic,meson-gxbb";
+	model = "FriendlyARM NanoPi K2";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
