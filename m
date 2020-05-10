Return-Path: <SRS0=YblX=6Y=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D02C38A2A
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30FE82080C
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 May 2020 12:42:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QO3ZkPAy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdonWKi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30FE82080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fqs75wLMqg4qsYljWbBwfSXXy1M1bkopdYvm5gJ/C8k=; b=QO3ZkPAyAbIldwuCSfIakr+qQ/
	V5XDev3+HjTTv+/cpEoJnEMuqe411ETkmcROlJRKm415it+agO/UwJMMDMEvT9LeLCpqaD2ouR9hD
	BMyJ4wFS72V0+M300k4RFM3ddJiCi1Wp6177ucA04aX2jgYswfDYDmT11CJ2i7YPgo65v2Y9o8lDx
	TINLEgM/ZMwvp0I3gUHM5vLRtcABAbu7632gA9SWIYwT4cIbj1PXPeTnjHZqK9Vll/v1PSFgRcJc7
	UcYID+UY+435pn2DOOwABfh1Sod3Fw3TQF2WbaXTWXv7Mv43eD4AsZ2SBenXqVzkxAVp4R3htRJ9F
	0iIgUbkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXlHQ-0003lW-Iz; Sun, 10 May 2020 12:42:04 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXlH1-0003Lx-E6; Sun, 10 May 2020 12:41:40 +0000
Received: by mail-lj1-x22d.google.com with SMTP id g4so6475942ljl.2;
 Sun, 10 May 2020 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OmLblKHrv112GKxqHbeDQgwgFy094x2GnPIPyu9TDGA=;
 b=gdonWKi/jxShiuLpIiWTUwbr629M/CFCwxIQ7nNWuKyfEA8mlJlqTMG8yjMaOZhV43
 eeKxkFNhTVwDx+LePw0IrZhIHu5mOH4Andud4qWQRpFzFTlacP+xLPbtnwCq0wkFKFcO
 WPw1ieg2/56U/swtCAM+5erpW2l2+X2KlI2ItRr1QLmHq7RqJqQaJ08FbUjvq+uvwRMQ
 Jb+ZhZWqU7YjrtyVWNXamniUfNATihiDjXDgom8q8mXcvM0ZKlJ+ELhK8XXVW9hUitRg
 rShCLVIAg4tWQijE0w2QvRMJywUU5EYhhd2RwaA8Tv315xESz+mhd868911ZokUGfE73
 FMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OmLblKHrv112GKxqHbeDQgwgFy094x2GnPIPyu9TDGA=;
 b=URQnfTnAjICHz4MQudC9x+JcXeuIsN6jy7b3Wh1ecXUMg9yG77BO0pNDrA3jVf6sQs
 R830So5+vfjWy1jR6uZJD19Wuf0obUTN5H0SPs+VtPfNthWWBseYuqDOEPoUaSXscA3m
 R8v3sGO4VeaJ9HC/Kjb4qBnGXXWC3hjU+CCJt4EwCR21Xp/2BjeuSobB+sfnwGgstoNX
 aJyLbT1EI4hiMw8+vj04SW+LKzgCNlrJf00psKp54ns9Y2e4I8woEiQSkJ6ZwhRGrz2y
 TaO83ZS/mPmcmd3Wl4WFADlb7SYPvxYLKXr98ghgfelVF4tyNagNycyXnQvDr1pmSW/y
 qE4Q==
X-Gm-Message-State: AOAM533magEkbfoS6LZerF6DL178NAG/8WV1j9RLfYy24dO13BsSulu8
 qFrN4oWjJvJkWsnHnpnbDe0=
X-Google-Smtp-Source: ABdhPJyM3eroHRn/+jtPGXG+Q+2R58RdtBc0ba7D/6DPJwlIhQ6INwvSdqjUNip+ikryoul/4ns20w==
X-Received: by 2002:a2e:8603:: with SMTP id a3mr7343916lji.153.1589114497541; 
 Sun, 10 May 2020 05:41:37 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m11sm7136611lfo.55.2020.05.10.05.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 05:41:37 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/3] dt-bindings: add vendor prefix for Smartlabs LLC
Date: Sun, 10 May 2020 12:41:27 +0000
Message-Id: <20200510124129.31575-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
References: <20200510124129.31575-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_054139_469024_13442E58 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Smartlabs LLC are a professional integrator of Interactive TV solutions
and IPTV/VOD devices [1].

[1] https://www.smartlabs.tv/en/about/

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..a0adda624fc4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -936,6 +936,8 @@ patternProperties:
     description: Sitronix Technology Corporation
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartlabs,.*":
+    description: SmartLabs LLC
   "^smsc,.*":
     description: Standard Microsystems Corporation
   "^snps,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
