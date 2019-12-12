Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18781C00454
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E277B2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bO6ZYKvQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dZcgLnNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E277B2054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j7WZz104s4adR/z+zKANK3J9c2gFJXiF/AD3PUBCBRU=; b=bO6ZYKvQ6GzxgdsuZTXRzy2sAA
	oPyJ5WIlj8noNIw8PXFfvxQWZVyL/Iv4puWOibjrEfPIJHOWH4VlTHrr3SZBt1pOUVKL3OwJ0sjtr
	vPGALxNjn7XpLUOhohJCo3GZsG7kpj6+2nLoPhfPtPzyV2MR4uuhaoVW3sWmGO4lekEEsSmlOTkVR
	/futMUsd3W+XQMTIQNenECjLu1g+Pdpht0yPo3IUSyPGpSxWFxMerhhdBxVhtpFFx443RWnq0EAF1
	K2hMsRTllMUPo6t7LkIdmmiUa9sXDsUFGeG7SSvTCkLdlW3kTqexGoY91f/Jo5xe2CSw6yz24TlkD
	u3bgx22w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPwQ-0006Lm-4P; Thu, 12 Dec 2019 14:59:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPwA-000655-Ab
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 14:59:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id f129so2861618wmf.2
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 06:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
 b=dZcgLnNG3uYFgy6p80XmLl3qh+7E3BAQitI3+SR9eKqYAPkjfo95LtHK3USmkYHo50
 AawUALYM+B6a9KUj32JVT/yMJJ98eOmyat2sNM3CxhF3gRX0hCs19y26yN9JNaChJ2Vy
 OdEn0/d/YyS0kFNWPO84pRTr8S1Hv1ZWy8Vgp+rL+eGdCIcWQq7VVHgwCSCjPall2Bse
 iwsiZ73eWKDn80coakwDxHbqO1FafBda38kYY80Ubz6OHu/6C/InoLkI7jQxe5llbW99
 ISY3T0HiO/Lszoq4IsEkE9ZqlFlHMWJ1oAABHkopJKE8D6ZD9OdMw4lff6laB8O/lUD7
 vwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ac9PpPgQ/84i6pezXabxCQJUJWE1oGmfoqB8QI/gWCA=;
 b=M3EYAIpgYnhVyUY5+xIgTBY/fYcvHkhhMCEZOKs3zDd1I49XX6KTi0WdEzfIFYfKpR
 +brf23PpqZmrvdcXXf7xHK6b8EDumTqGdqK8m/QeJ02Pyh9sq11KZLdUyBQcRqB3Irkm
 reg9g5s/St/VET7yxa+TrlwE1Q0icLIWU4hwwnzqz6FqHRmlIV+SO9viVOX3Xcw6eoCI
 tdqlAKeyWHlnwkyiB0whuTkgWI/qD0kAlPNrhdZ8BwcuBv3VNl+qDQWk/RopPpUK+yvp
 EoXh/W56OQILKrMh1zTkDMM3QWTjUJP3Wh9W58ZU0YW41B0mRMTRG3fimy+Fx+UUKzbc
 0Skw==
X-Gm-Message-State: APjAAAVbOjK1l+u8q1NUFbdtnFZ2Rkp/e4yAsPIa1fRzdSRKPpU8kPtJ
 /5LqEaVQfLrLfcatQGjIoHcjEw==
X-Google-Smtp-Source: APXvYqz2EGJjniScqk1Lxu2Wl0Wslazw8x8Ill6fOn6GyF/VZNUHKYjPi5ScqDMGw6WkrreVEEsg3A==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr6903909wma.138.1576162768162; 
 Thu, 12 Dec 2019 06:59:28 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:59:27 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH 1/3] media: dt-bindings: media: meson-ao-cec: Add support of
 ao-sysctrl syscon
Date: Thu, 12 Dec 2019 15:59:23 +0100
Message-Id: <20191212145925.32123-2-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_065930_367614_5AC04753 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

ao-sysctrl syscon phandle property is needed for CEC wakeup support.
This property is optional.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
index 41197578f19a..1f721498d249 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -32,6 +32,10 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
 
+  amlogic,ao-sysctrl:
+    description: phandle to the ao-sysctrl syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
 allOf:
   - if:
       properties:
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
