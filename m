Return-Path: <SRS0=biGq=EH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BCC2D0A3
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 14:11:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60BA2158C
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Nov 2020 14:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smnVMzQQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TQa1fZaR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60BA2158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uN8jLh86RlsElmNBqhEqjvd6s090vByI+boS0IvgsKs=; b=smnVMzQQZffIQa/4aMuZ9Fyy62
	WkQ9eauV47Ck+dFifLuhySXjn4XeOi5rlX5n5wwkPmxeUmhIhagxXAC4kzywuF1fc/ZWLwx/posBS
	O8I9Exm4rbw5X4OlvgAllq2tLqaoPqkkvXwaRkjGuMxUMDpluDbVqlDW/lPBpAujOe2BK2VJfbRhC
	ZNFkUZXbXsKnZcWLZmyaheh+/867YrZZxJUjeVcSTpCjrnsqlI15x3wPgwhtu3lUl6D1UUZ4aVFqx
	9t8fDBbRGFqQUrCmDnw5aVPZ4K+zJzTghZjnQAp1MJBgID1omo4gg/43P3W1xHUnuAi8XONi8dnJx
	WI7/Zu7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZE4j-000724-M4; Sun, 01 Nov 2020 14:11:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZE4g-00071G-T3
 for linux-amlogic@lists.infradead.org; Sun, 01 Nov 2020 14:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604239872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=EQ7i+/lF3EujJ95sQqC9i7wHrofb94VFCyP+azCPi/I=;
 b=TQa1fZaRZiroak9Khg1UtXMhI28iDRp4MQDSs/4YNdJFLyPJ7reUz2+n93PJHvtAbMlj+g
 Rgr/f1slkaFFcGc2Kr38gUWeVcZYPN03ssMkQkNNbuYeVwh/hBTQOZvGsnMAC+yE3THQU5
 TLktjADnNxvFZ0le2QxzVs1Z2EymjXE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-B7SHj8QlOmCrZf9paQFHLg-1; Sun, 01 Nov 2020 09:07:39 -0500
X-MC-Unique: B7SHj8QlOmCrZf9paQFHLg-1
Received: by mail-ot1-f72.google.com with SMTP id b22so5110762otp.12
 for <linux-amlogic@lists.infradead.org>; Sun, 01 Nov 2020 06:07:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EQ7i+/lF3EujJ95sQqC9i7wHrofb94VFCyP+azCPi/I=;
 b=G7wa6ogNLWd4dhB1PsKC+HDn3q4cVRbFKTgnQXQFc43r4zLck8xL7PQnPSnD9rF997
 dG0MLaYZLwuOM5fm0fBAZIwrllbw6Fc6N0es1sepLJwjMbexAQilUfz/+jlARSLLadL2
 nWnoOb7BJREXWdG1dWaY5yT0GAjTQbiUVzJxUv37iG1KqWdn+9SdvpgckNxNi66Zw/92
 j9WebShIAfgSb5Yleqaf95GOn7fde9UdnLSi5Ddq/M23CIcgzfNawowPjZz6CqlC5EEP
 F/QgQBqN7yDC0/pYT1GNY8rxySMxOB/gZv2q9pdZqjdApXV/LTI5rPNEi95qzzgW878r
 ThtA==
X-Gm-Message-State: AOAM530RyRr+7jJViY8J2bf4q0R/mVZrLVYL4M7OZTGSCqZXtLBNXwJv
 55bWzxrCPhli3Kq9alAgR5pyQuSW4XEAAs2Essc+a1S7J8yzzmKLOCPFhU5LvXtsOfs6/STi92i
 Wr4T1M2wjeeyHNDTwPfdsuMZ7Epwni04=
X-Received: by 2002:aca:e0c3:: with SMTP id x186mr6987553oig.140.1604239658403; 
 Sun, 01 Nov 2020 06:07:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcu+/hiKh26DPEvMTbBAZGfTPVYBsLJwAAjV5P0Oa0ZdQWckM+cGghBgyRCnt32yB+IjjJCQ==
X-Received: by 2002:aca:e0c3:: with SMTP id x186mr6987526oig.140.1604239658186; 
 Sun, 01 Nov 2020 06:07:38 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i18sm2881929oik.7.2020.11.01.06.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 06:07:37 -0800 (PST)
From: trix@redhat.com
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: [PATCH] net: stmmac: dwmac-meson8b: remove unneeded semicolon
Date: Sun,  1 Nov 2020 06:07:20 -0800
Message-Id: <20201101140720.2280013-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_091114_980439_CA4EE01D 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 5afcf05bbf9c..dc0b8b6d180d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -299,7 +299,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
 			phy_modes(dwmac->phy_mode));
 		return -EINVAL;
-	};
+	}
 
 	if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
 		if (!dwmac->timing_adj_clk) {
-- 
2.18.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
