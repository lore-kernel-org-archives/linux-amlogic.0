Return-Path: <SRS0=PYAY=4S=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619C0C3F2D7
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 04:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3089D21556
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Mar 2020 04:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGbG156B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGoTtOj/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3089D21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3ktS6DYNCe1Um0b0tgFL1U7T+1j9iBw0t68jTtLKj9k=; b=fGbG156B/g+bMtRMDTBSiikuYt
	l9VEPJmUMVvurK6gi67l6Taz2FhOCwjq/6bkCjM+CUAIjMOPKFZIY2yowxyngMr4XYUEWECW2m9oa
	qMlskdwdEqoDlPBQewPYP8+qOe0pXlckl3vUobJBynKxwOEXcDxF9mhvmqrJjWuflT7s7TEi1+Xv/
	z946H6qkIWWowYdm01QhPvvLbesqLLAV/q4z1pfaYbrsplPU/nSc9oM9Kpq92IXd7rKchfHHfoZAG
	jg4twzSc84zE47wgNdU5SndRvR/BiX0+F+JZO4ABHG8DPbyLGnyjzeknf/De4eXWvRw/kgRTZDNWp
	0ROO/apQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8G44-0000z0-4P; Sun, 01 Mar 2020 04:18:52 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8G3V-0000VA-OQ; Sun, 01 Mar 2020 04:18:19 +0000
Received: by mail-lf1-x12e.google.com with SMTP id w27so5261399lfc.1;
 Sat, 29 Feb 2020 20:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=NmeW9ngS8eifN3sjrGPI1hv1F6A8Nf5uvazYyp+BS9k=;
 b=IGoTtOj/+h+27xsprKEwSB2qcBhb683X9DwROzGYqXm+H59aKnzxoxyZsuIXX6gr9g
 Hqm193MELCrjP4bw/CDODOd4MTJaCCXhKqnG4U+qBviN78AtQRY+9XQgi6VjeKAl+tnB
 Q0NriuGon6BFujvANHfQPnoFpzY6wbonu7bed59nKtd7x6TvS7DCxw2tUIvtpucKTC0l
 H7Q8IvcFoUCwgxT4A7iApdTUZA/CfcLbo9NP7VeHFjy3XDInj+tLwzQFLbjVBnf1BSlW
 xq0KajxErNFSX7q3umxr5NoR+ncHuRO+3DOlQq6w0DcA5PIG7lb1AUCF3XuzZYksHBlB
 ciQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=NmeW9ngS8eifN3sjrGPI1hv1F6A8Nf5uvazYyp+BS9k=;
 b=NhYeKMIrWxJ+Q1lRKuHAVwJ7/XNlBQe8DNWkXPQvBU11YTuYSC2s9fIwqYb5PZSJXm
 P5ZPSgAe12J7EcXCgtin4Th6q+tO9M+eq2xeJeSWvZs++TvElcY7QuAXkQAQfd5Y6gBZ
 eFap+yG6gPx/4T8P7Cryzx8D0qBlU+LcsTbvP76wecqxOzDUMLNzJUFu9deyIn1L9g26
 fT8j0UkBI331WnxUDPQtmzfR9uQpNnFyXZvxlGxblgmmG3Q1wa4Jo4ecerhrAbkwSrQv
 o5D6ilsa00XgtaLG/Y4c8ib1jMSZ1lulSMV7JSmTmt+Wfu2vNW1NLXDptK/aZlPZiIUe
 9vMg==
X-Gm-Message-State: ANhLgQ05qPt/KwRbTDt+Z7ukjGkvVTGgCZsR2sP/OH+1i7iFX/Q7iU57
 Yjk1TjnlwLt1NkKpXYNMu40=
X-Google-Smtp-Source: ADFU+vvWv2MfdXTIoklhtFwuyU9dmZq6l6Sra2HjKG0MG58egW1bNdSDN0IeN0EFItKplxmO7nXfHg==
X-Received: by 2002:a19:c1cd:: with SMTP id r196mr6771461lff.22.1583036296016; 
 Sat, 29 Feb 2020 20:18:16 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y24sm9568864lfg.63.2020.02.29.20.18.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sat, 29 Feb 2020 20:18:15 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: add vendor prefix for SmartLabs LLC
Date: Sun,  1 Mar 2020 08:17:19 +0400
Message-Id: <1583036241-88937-2-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
References: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_201817_817843_CEA66C9E 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 =?UTF-8?q?Jer=C3=B4me=20Brunet?= <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SmartLabs LLC are a professional integrator of Interactive TV solutions
and IPTV/VOD devices [1].

[1] https://www.smartlabs.tv/en/about/

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944..a34ed82 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -901,6 +901,8 @@ patternProperties:
     description: Sitronix Technology Corporation
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartlabs,.*":
+    description: SmartLabs LLC
   "^smsc,.*":
     description: Standard Microsystems Corporation
   "^snps,.*":
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
