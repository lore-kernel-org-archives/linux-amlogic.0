Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123B1C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54A0205C9
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lADSemrb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sQMq7KvH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54A0205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beXhlpzTR2fWRR4UeUtTX01U+ndlSE9+LsTLQQP5/QI=; b=lADSemrblfskao
	AGzp2Tn7K7u9C1tuvADZh/yFVS0KZqFx70CNKTVx/B/5y3fPjM75ENiEPxb8hvD6eSW54ImmebAlg
	VKMM0OLbZ2j9IghJnjf7kvF2JavSJ9ZEnYMfG/6tQgXc90paqYssyyZJRlwvSOwTGI+QsUJ9QIeFS
	NU+9QDR3qJLUoxqWeUwMxqurYQRhBHFnG+LTK2VVg/FvwC9Rx0gcfxH8rD5AlrAAZz9UvH9kec/Hh
	PaBHBQgfWusMAoUrlQ4K6Xm66ebzMKWj2OOuCHaadJr5LhZfE3pSPfZrk91OMQDbY1QEc+buNjK6t
	mZhozoNE9s6lppELbDgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8TVX-0006qR-A4; Mon, 25 Mar 2019 17:35:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8TV8-0006HS-AQ
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 17:35:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id z6so500245wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 10:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=sQMq7KvHn3sMMcaQxOtmi2qTduUxd1RA57Va8ms9P59Ij4z2j7vv9tojf5j5J7fwq5
 MWeR9J/qyEsPkHOC2+Z585l5+F0Zh4fnjif2CkIHbojMWXQqNzPEabUXw5+MAMTmZ4lo
 PphuzAZFa1rj5FmA61v0O1zDJksjcDbYmzGIuzFA/F0Yqbls7t8GIQpGs9BdlgJc5oLU
 nNPo4FK7+aUEmKw0HcSTcB7CnE96kLiRMa4LpcfIihVO90vMbURwXCxnlSv4JLXw2t+2
 b1CP4WjVH0z7g3uG7gXzlG/FrPKwSZZTM43OYREd7tpx2RbNW/6dRmPknA6K1UI8MjMM
 7tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=i3iPoBNq2ll+vvat+geJsaXx/UzF9jcDnpL8gSAKaS8VY667MVT0LXBCTLvKeWY/sv
 a+zoDEEEXD5WJS8nf4RvqK9Pb13J9ML/uLrVHQGG2g6c6/5SF+UW9rigmD6ntCays00m
 z89D7InEy7gL4f7sL9qtG5QXs6h5guG7wz0dEf8239dKYiNY8rxK4UrJV2o4YmOSy7hX
 /Kct99+IKPGpOPg9KEzuAt/s2D9VR9BX/DTLIAvd5dIj2Xjv3BK8LYBFToZPxEq4UwFY
 rQNrbmPFK7HYxWvfiJabfVW6/Thw+Mx5oDv6pJm+9bt0LuKFJqR+GUlsArB1UELCzD7K
 cTMA==
X-Gm-Message-State: APjAAAW2U/SWd7pmC00X2VdWaFJ5FviQ/T3L5xCQ4VULV27kFK65mw4y
 HEsAEnrBG5qxNyvYH0J7txmw4BOKuEwxtfbX
X-Google-Smtp-Source: APXvYqydrU9CNZBNoLuQ6RGOoM2DitzwKBc12fZmJ92ZUTM0/6LOx3lDvo2mrQWVye2ijcj3pbT5Nw==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr6169561wmc.146.1553535308427; 
 Mon, 25 Mar 2019 10:35:08 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o15sm16003227wrj.59.2019.03.25.10.35.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 10:35:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH 3/3] MAINTAINERS: Update AO CEC with ao-cec-g12a driver
Date: Mon, 25 Mar 2019 18:35:01 +0100
Message-Id: <20190325173501.22863-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325173501.22863-1-narmstrong@baylibre.com>
References: <20190325173501.22863-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_103510_439356_54EC3A2A 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the MAINTAINERS entry with the new AO-CEC driver for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..bbad8f3ee3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10046,6 +10046,7 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/platform/meson/ao-cec-g12a.c
 F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
 T:	git git://linuxtv.org/media_tree.git
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
