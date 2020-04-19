Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95A4C2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 560A2206B8
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfXi7yAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNgqJVtz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 560A2206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kId71rpZ3Z+eCd3Yn/CJ7x+73QvWSSOOiuenSzeDw2g=; b=pfXi7yAV33y26Ls2TGDM/T06Ls
	dOHdIOfYIfH8UJ6QhXvI25CnaiLIKlRNU1pYGLrWCx3FanRSPwF8QQWwg5iv0khad79cU500mqy8P
	9tByOul62av6c/ShRCc9EQFnx4zWo1Rb2hdvojKH0IFiH4i7fpTFgQSoVhWOIbL+JGt3ml72MNlrg
	XlrzPcWs1wsbvkrJbgVwfp9aE6MR3YpimqN2ZHDVfNHv5bO5VAlWzP/v4NO44OzB1L6VXemwqdO0U
	vF7pBfKiyDgqTenp4WS3mJHxFIWmDnm/9kOssNoJvH9K8GAZ3+e2Rj7GcDnbr3f5wKQzEj4kAEx78
	qfM45udA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2uY-0001gj-TA; Sun, 19 Apr 2020 05:54:34 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2tb-0000ee-T7; Sun, 19 Apr 2020 05:53:37 +0000
Received: by mail-lf1-x144.google.com with SMTP id m2so5193972lfo.6;
 Sat, 18 Apr 2020 22:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xFwe9ZwouejBf4AlmJwEBZFdUiqcwR+jV5dE/3vh35w=;
 b=ZNgqJVtzaRN5PPPIigiNaHTejpdnCylOekthURv06SYaJv3P7pn/ERtFEaXtNJhkJS
 BQjAXPCkZdLwMIvT0vKyzuNgftX/NAvH3gQTIM0jxHTob9YST/hWFKXZVr5BwS/mJ3Pa
 +y+FtnEmGgut4ZZBZbMno8QNHja+PqECz4wEdekBD+JYoTX2kKElnvyO+9KxnWLO2qPE
 dqJIkQuFrfmwXcm6G5xjtNk1iZuGTtgzeOtGZAsXr4wS7Vxq1kMJlMkQJukjtVRclJv/
 SjFnfiLpVVhk4WV+MjcWrVg6BVjNdRinozLlSnHnGEOdlfqA0Jajz5CPV8zZE5tT1SUB
 U49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xFwe9ZwouejBf4AlmJwEBZFdUiqcwR+jV5dE/3vh35w=;
 b=hKtfEGTym08XV/ytI29HHalOfQDCdR3GFuqpedryb9EQciO3tPClCbHP21Ni+Y37/o
 bRMqtFWtfy961lisnt3or2hOiGUoDe9ncdEHtVnR+/aXkPjqRweWvIs1MEwuvLFMKDuf
 E1Y0PPddhJM4jc2bzHGj/zLAOgkGDqDZ2Rjp33pmJom3iueX9TgI3PQB+O86g3vPHqKC
 6WI8WocwJN0uHssVKxVcFlkhqC6/6w9JuiOK5wa+xLs39S60QW1xU37RIkbbl5DjBiOh
 ks3M7xthWOn4+OgEnNZpMvMJiWyVn7ZxIXLf4DDVX3MiE44ou2HiWdlbjT0i5P31zU5/
 pqXg==
X-Gm-Message-State: AGi0PuZ5Qr6dWHhXUhpbAIHMpf8DS7b8mFbJp0WhTIsjlTIltIRU4hs6
 u5xmfDfnwuW2AzpUwEQf4qI=
X-Google-Smtp-Source: APiQypIioYm05i3CpljKQVso1nnH5eeIqBtCIE/EOLm5YSWkwdB6a0iJBxTTdBbfUBFxtdOhly4jTA==
X-Received: by 2002:ac2:4187:: with SMTP id z7mr6678820lfh.113.1587275614312; 
 Sat, 18 Apr 2020 22:53:34 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h7sm3366247ljg.37.2020.04.18.22.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:53:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King Pro
Date: Sun, 19 Apr 2020 05:53:21 +0000
Message-Id: <20200419055322.16138-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419055322.16138-1-christianshewitt@gmail.com>
References: <20200419055322.16138-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_225336_252851_5B49283C 
X-CRM114-Status: GOOD (  10.18  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
board with an S922X chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6bf9bbcf4968..215e0668663a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -149,6 +149,7 @@ properties:
         items:
           - enum:
               - azw,gtking
+              - azw,gtking-pro
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
