Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D241EC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:20:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B48233A0
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYnX/f80";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nOu1hJ2w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B48233A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0S2ySB7sA1pFIkbgrB9zsRpyMXE1NlKLrrPtNSc1CCc=; b=RYnX/f80X/1b4Z
	c9x3Jrz15okqSgws4RW2JohdSuhnGnrodB4mGsSC9IF+0S3NSkdt3G19dA9xy3akGQhPThFsBULmn
	jKZymq1uiGUltRZWQ9Kn5+TEpsTR/rhe9oU03G/eEmLklr5sGvW0Pzdm5k9bUCCbnipwt3Lw8utot
	CBxB9HOu7Y34OJVAG7qkkjXWEg3T0YEsuAB9UMOGIQfuZzbMR4NwHuj7aHYD6VE5ehoSY6nH0AIoT
	FDXPUo8p7Gfwun0ltBsdbovQlZTabGBQJjUk0lGtKq9lMZ1aR+QJaaSxl7WGgs9wJaCst7j3Kj+uG
	liD3/8c5JJSaDlAOa0Aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13s3-0004Ll-9g; Fri, 23 Aug 2019 07:20:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bB-00014N-6k
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id b16so7590210wrq.9
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z/b1mhikbg+EPmNH/s2Xt1LyR+vNVX1tk6yq7Qa4/MI=;
 b=nOu1hJ2wwRA59HSMRqpTfcIiHiskYmD68/3tC7t8v4OpPhcAvKvuh3bNdLHQK0POnp
 FhtFeuTMXCkb6SSnCYDrKkGQWN31zpRQAsntyWJmIRqsansJmJB8bL0MtDAVYFsYc7o1
 dvHMX9GWDaWycAn4GP5zXKfxylz7pfrp1pGOyGK8fEQaNUufNuiDe0nFGiKTV6dfIR/J
 hrJB3C4I5O8R5vc88faq+kMormgsNPzuYggeAGBmwqnFIADMqfAG0whVOW8P9WUP1FKO
 WhA/+NDagtIQ8/3s0OLrXUZLfMOR13KWND700Lgyev7nWSNwhB+v0ziUWpu1IkiqjYN/
 MWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/b1mhikbg+EPmNH/s2Xt1LyR+vNVX1tk6yq7Qa4/MI=;
 b=jMn213jN/ypPKJTwDHr/qocab9/mepCaSC0vIMVsP6E0lj2CNuJGAnQ1zoFmKUpX6l
 HgpiPHheU8u0APleO93ZUuIxxVea45M+Mh3WRgPGoX2KgUmG9HZ/y49L7hHJR4EjR42u
 k1F/e3pvd1URPtVT6zs5nzyonbRsfKVFgNomA0rs+q4VfrByrVnRg2WZRpjeqnXoFIfC
 rdcmhqs45tPAcCYSqOnLxkIREZU6CNhn0VMAxX6wbtoTp3+XMvIqi1nhVtDkfK2uoeNw
 6tFWzYP5m7XPKdKvfSg50Ndjc+KByKRIDH1gSm5bZJNKiPiRswrVXcZcNxLVWAApYczC
 3pIQ==
X-Gm-Message-State: APjAAAVUHxz0ZfROdgKXrXXXTl20dDKVNbnb+EgK/qTg8SOpD96eQX8y
 TinLjmSBbaWeKjp/iSGkd1Rk2w==
X-Google-Smtp-Source: APXvYqyuqMJL2L5NeOppIMame3Tj3HMfeW5/PBCBwC0GPH9k/60jj7yNgLoziG/B+Lt97Ilb64QaUg==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr3262263wrk.98.1566543776738;
 Fri, 23 Aug 2019 00:02:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:02:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 03/14] arm64: dts: meson-gx: fix reset controller
 compatible
Date: Fri, 23 Aug 2019 09:02:37 +0200
Message-Id: <20190823070248.25832-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_000302_207766_421645FD 
X-CRM114-Status: UNSURE (   9.46  )
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
meson-gxbb-nanopi-k2.dt.yaml: reset-controller@4404: compatible:0: 'amlogic,meson-gx-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 239ec08b3023..08c01e11ba1b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -220,7 +220,7 @@
 			};
 
 			reset: reset-controller@4404 {
-				compatible = "amlogic,meson-gx-reset", "amlogic,meson-gxbb-reset";
+				compatible = "amlogic,meson-gxbb-reset";
 				reg = <0x0 0x04404 0x0 0x9c>;
 				#reset-cells = <1>;
 			};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
