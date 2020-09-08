Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E908FC2BBD0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 975F420C09
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BPESFhrW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yj9Ik1nd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 975F420C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y/MyG6jPg5F3RG0bgIdp0dnWjpm1zI9P3Z0Xsf/5p9I=; b=BPESFhrWt57mFvecfGCTyZbaf
	6OdEpVA/amoVRHd2qHHsxLdnfSUkfyK/vxjojpv2HC61vMgHEyENgua1ZfEeAyLLbv0c6VdF5MSJH
	tT2rHr2TM9t9s47JZ+mqZAexGqVP3gGRbtbxJCGwrMZLwmFIC7AQgdnuTBfp5Hy2e6nbYRwoNXesz
	kMNkuc8Tysxi7le1OJiDlK2QzsMjaMGubijJzK8Dj/Z0O13pc5Ap9oUfNO/qk4Gm4bd+/44IS/rim
	uVkibaymOIVAmj1H+Z79lH+cKybjSvpNO6v9YxxjZZfd4mTkxUH2zdE8ZpWXMQe5+9Qip5BuQDzPX
	2Ne3BWvcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFYSX-0007MB-3M; Tue, 08 Sep 2020 07:54:33 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYST-0007KY-Hd
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 07:54:31 +0000
Received: by mail-wm1-x343.google.com with SMTP id l9so16152335wme.3
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 00:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=yj9Ik1ndq3jW04GwKrFOI8D/lPSZVkGcU3uzyMVspnynRbQKdFBJN4BFNiIapGRwnR
 vZYjfZ0jXsdmJWS2xNWLvFAWOvA/GkMFUOAaaTEjv4YuNA7igfTuaSL5w/Sx2MUcPs1w
 9pykHkjdFNrAQGds+Fr60lNduf7ESa5KsiloGG7zLHXEXWpDE2FP7wi44xCKbV+GuJhI
 Haax/tWmOAxnKiL294A24g/1CrLCj+/h9S9lPochIfNWS6onPfaA+hmH/Ua5nIQz7BG3
 mCQZSq/T9x96bj+Wrq7sDzE8UmwxlOhooZ9aKAii8BJ36d4YcmdyiDE/E869lL1S5Vt7
 txiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AaJv1mu5ukB/CIcMyJjiUkroua19/SVkAvuVAHfagew=;
 b=pAwHUCNc1OdnYxfKpwlYURZRYkLgWUpNqSrvJfNFZfTJN4PyxTiKDrWglm038PwOfv
 TPjtOR7gHMsO81ITGCxAoIK+I+eN266oeTpaD0EWzo/3henQmvKCpLnoLuUwXOpMLeVp
 pNFRtGqg46ZlczZ3Am8WUDZboojGXeptTNXy7hQ+iQjF9Gg1+AjLbac0GtsIuAnKvcKl
 gebPPmvdwo6dB+fLyEEoA7PAJrrOJhMvTCnzkyoelMfKAsFcAljymnc5JpHtrqNa5wBP
 rKPlSMRXRMSwL/qTkKSIWQW1WsdwRcA+V9jfFB4ab96AOQQwxfpLYYsY9qy0pg/X5h1n
 8ndw==
X-Gm-Message-State: AOAM5337iGNiw6OlhafGH21NPCpRto7Z7f+9eaR/743cf1oyQlRI8sX2
 uQABqqPWgZXKaRAyFZDsbhyv5Q==
X-Google-Smtp-Source: ABdhPJzELndZXOBjcc+iB86Na+d7gpW0eUl7Xb0Mcmpwvh1mxirZqv7irrBgH24N13Nm09Gk9voTNQ==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr3241141wmc.154.1599551668340; 
 Tue, 08 Sep 2020 00:54:28 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Tue,  8 Sep 2020 09:54:18 +0200
Message-Id: <20200908075421.17344-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_035429_627774_EFF09A6A 
X-CRM114-Status: GOOD (  10.24  )
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
from Shanghai.
Web site of the company: http://www.shtdo.com/

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1e4356cf522..4e9dfb352c68 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1078,6 +1078,8 @@ patternProperties:
     description: TPK U.S.A. LLC
   "^tplink,.*":
     description: TP-LINK Technologies Co., Ltd.
+  "^tdo,.*":
+    description: Shangai Top Display Optoelectronics Co., Ltd
   "^tpo,.*":
     description: TPO
   "^tq,.*":
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
