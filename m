Return-Path: <SRS0=nO5Q=6Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5534FC3A5A9
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 11:49:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2014621973
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 May 2020 11:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJT/S9iy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lntpnX2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2014621973
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REfgxwZDvPuYzTKaIqXoemUtmlQ4hvME2wZTvTTFeeo=; b=RJT/S9iysPLv/T
	WpfmHPmA3YeiRUaitinfzfoW5H17b1CvDw/zhWphS5quaL0ToESWmqOIgPRhnnXXXXg84vx2v4Q5v
	LkI2qdEkARkVAnCXwM0x8KNlXGcox47fKpo399TL6UK4vHvzM+2M1+4bOQb30rNY8fHfs4zFC3ZaI
	nE2fOnN33y6oUtG97mWzS7DTW6btIi5nOOLhWvTeuWHUdn9O0RTgKhHRqctqRKkB+IeNxhf/qzGb/
	beCIO/6BcFM7CkX8y4+I5Ep5Oig6sYodM2Pux/XkEpwohXgHdF5mbD1Y//6SLTkx0FdV2OvagH3Uc
	gRLJ+C3X5AOOPlpUVvPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUqdo-0008QH-P1; Sat, 02 May 2020 11:49:08 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUqdC-0007dE-TE; Sat, 02 May 2020 11:48:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id 188so2868692wmc.2;
 Sat, 02 May 2020 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wvA5b2DQSI44cr3o1jiTAHv9fqEf3DsLbZQwG9U+Tvs=;
 b=lntpnX2P7ussyaemFcrojFKaVk6tZ4Rm23GVBeAzymcvtkUz7pDRllMViOK+nQyzox
 0EADAUuTugXqZTw6fAyL4b78FjGgjbcIXb21oTM5py0vCqCPdvut8B6kASQwqbCI/v3C
 g+3lqgQFwNmVzxjDraHMhSNq+R8A4ZaLNVF+jRTO5U7IXJnY/Y4bTqRtUawsiRjoo2Aq
 mCwD6MKblcJMD6UzL8hwbNcmXpU3V13KuCN4sz5Rf6yjGU4xyVYEFPLetIUhHk9MkmE1
 2ieICDdazzU2Ut1G+GFXOIdjL2d9FaqYvn2gbCEU35E45500kZOP4svPYV0U0ptyPLlb
 bxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wvA5b2DQSI44cr3o1jiTAHv9fqEf3DsLbZQwG9U+Tvs=;
 b=pTDpseadMg3DGFb/QnMpN7l4b3RM1cJNfvgMO2WPBNjd/6uI1Jn+9NGUj0f2ppL68a
 CAINMRaROf8YON5yjo17ORswbNK6UECxPjcWm+V+PjZtB697ROXByup5fXQiOmKUqRkU
 ytyBcT3BBYpc7Rf4F/tfwvWrvNc0fxvj9zjX9cLNKo4omu29uAX5J9/BtXXGaW+Bi1b+
 EJ8gSls9O+XAX34CqvYs9JH+05PjNiZSHMEiG161jlgOoSY79ix7Usfg1Jetg96WKWE8
 9hrtQnxI/P+DTjlWDU3YmgYuvxHljRImmctuYYHA0Z68B7nfICvcrFHUNDlprmZotbnP
 gsrA==
X-Gm-Message-State: AGi0PuaNkyT9ab5BLJ6RLyyhaEV3nnMNaEaxOLuRbaB+jd178D7IYxpJ
 bA+cxPJkMwHPNiOzm5DdcO4=
X-Google-Smtp-Source: APiQypIFunrF283WMUXHWC0y7h03zmE1LjpFk7NL6YETkVqdiu1Zwem3gkqe4Qn156YjEsmL1+OsTA==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr4502594wmj.21.1588420109231; 
 Sat, 02 May 2020 04:48:29 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s17sm3801599wmc.48.2020.05.02.04.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:48:28 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH 2/6] dt-bindings: phy: meson8b-usb2: Add compatible string for
 Meson8m2
Date: Sat,  2 May 2020 13:47:48 +0200
Message-Id: <20200502114752.1048500-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
References: <20200502114752.1048500-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_044830_940945_2F37266B 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 hexdump0815@googlemail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The USB2 PHY on Meson8m2 is identical to the one on Meson8b but
different to the one on Meson8. The only known difference is that Meson8
does not set the ACA_ENABLE bit while Meson8b and Meson8m2 do.
Add an explicit compatible string for Meson8m2 so those differences can
be taken care of.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
index c2fe8c08d99e..1d402e055045 100644
--- a/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/amlogic,meson8b-usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
             - amlogic,meson8-usb2-phy
             - amlogic,meson8b-usb2-phy
+            - amlogic,meson8m2-usb2-phy
           - const: amlogic,meson-mx-usb2-phy
       - const: amlogic,meson-gxbb-usb2-phy
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
