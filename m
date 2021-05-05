Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2027BC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:34:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90806611EE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90806611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fvkNbyT4Ur65SrRVzuv8jtHnBbW652A7T/cWCMECqUg=; b=FSGdT64tEk3DdgPqFymmQvpAd
	X63r6QW1GzAo5fNZwqZohoQJLIj2TjeVaxhPp8FWwQ1usscFxiKrxtiZSWVcsVYVS25+91/0dRBsB
	+1JGxRfTW0A4JNkqu7QKkI5qn/GXHjQYhQ9Mvu5ABJVt2uw0pc++kgtBUKE9AiXC88TsNkHJNEOBT
	3Mhkc5ExkusQqUqHLvXJayKjDbngkSWfEXwT8DbAk8XLHfRhPzAPjEDKRQ/RtOCDoMoJxDfV9HEiE
	4OFzFKQH8X9HfGk4t/b2DIzp05XGjulSed4GkrGIrmMXKmnxCeCMOGt39lrz1hMwiZsmZ28ojdDbz
	STLo8hjoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leC2v-000Uo8-Sz; Wed, 05 May 2021 07:34:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1i-000UHq-Os
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=; b=NxfJD0F+1jrGEpMxCoaxBXf8Vf
 DAXE0kVZ7ZLaXgo4lhMtqNcyZFgtAqsFbXXrMGfBd054kgAn8xl5OF3ZSOB796W/F/cqlT6xsI5b3
 JVn99E+KPeqxVB8ZBFwdFdpyV/8aVPGnTBBb80+aSFJmz+ySs/bS6rL/LioYyc0sHzvYgnreLOgxu
 DrDGK2bZTMeNWLyD/ESJ7gmD52SCqNLTc8Kdq74T88r0iDloQ8YU/ogKdkie3f2khVPbSwC1GRdR5
 w9Sm++iKjLdRfICzSMkapgc1GdzBHLcz38n8gka8IzINYyVZTcFsS8W+Pbo24uDekmI7bYzJQFx2r
 4TpoCIag==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1e-004XDB-MJ
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:32:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t18so677518wry.1
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=;
 b=dFZLSL9G842H3ZEdEwu6yZvm3a/ow1ERyjz4m0bkqhXaPGYAVPJvWzf6TW6mO8tt6v
 mwy3/5i8bv8aRWXVcf+UmaqTeI0MhKHLyZJtJ7T1+MDc2l879NS6PlkurO2orL1NIC7S
 d21eZ15Az0MUEbiGTZskcRwMPMVx6UeEwZ5Rc52oQ1uCc1lrQO4OniMaU9Lttl10VBXu
 Rcrb4ohqsFElnCe9oGJXujlsF/QoxIrpTphbdQJe8YPncCSRsmS3M8/01ySZfNzBPlpZ
 kEyaowUemrOT9Dm28fRPoguDGHWt0rj/Dpn8h7AzuYHAfXLcQQsnmN5K2dT/5idENLgt
 bpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PjPVZHKFcw/0Kjl3neOnoz2ErhwMmf8NtZZOxTpdu8s=;
 b=KyraPTMNe1p+B45+Xwsao8MCU9JzelcwnHPOfiQen3ZL8kqz3/sKvGjXjESqKXjdhW
 4lGeMd7U23GMkwl8mRpxvqT9IHsUobA24i2fIWgUGA1OwEApuH7IaSxvGMYyIpv+BoeV
 tururg5bZW3Q/mUBSbnZ/07694ccdu6pRv9x+hCqSLE6hk4Ei0adbQfgMRpX3WtQQjBE
 bNxFvtH5LzYT0TVQN3BrT2nXQ77UJyoQ0cD26vo5En8Aeverm/0kubRtvwEwTSdInRzD
 0ClcWSpox8/azDmf7w3FqJFedMwRKRfFNVPXbbumMWu/wlJbfFgGhcpNbZlhRPbiq3Om
 Rg6A==
X-Gm-Message-State: AOAM530Lb/yo03I90AMf8sFzsYsaukeQR9S0iGCKocbzOkoKSKKM7uRi
 OCV1b30DJBuDlXVvBSW60+Tc+Q==
X-Google-Smtp-Source: ABdhPJzPrdLSH9rlXg/aGBRF/v87OS8+jTKOJeqvQkjf0HBAu7BtwK3sgPI8Ob/3fYBpicEu7wgJaA==
X-Received: by 2002:adf:f891:: with SMTP id u17mr17163914wrp.352.1620199973128; 
 Wed, 05 May 2021 00:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 v20sm4965663wmj.15.2021.05.05.00.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:32:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
Date: Wed,  5 May 2021 09:32:47 +0200
Message-Id: <20210505073248.3816183-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505073248.3816183-1-narmstrong@baylibre.com>
References: <20210505073248.3816183-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_003254_750000_F8F26403 
X-CRM114-Status: UNSURE (   8.36  )
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
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 5f6769bf45bd..d81a20f66415 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -164,6 +164,7 @@ properties:
       - description: Boards with the Amlogic Meson SM1 S905X3/D3/Y3 SoC
         items:
           - enum:
+              - bananapi,bpi-m5
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
