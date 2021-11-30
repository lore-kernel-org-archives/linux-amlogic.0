Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A16C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sunKwSa2I4z7KPbNDwvDobp7E28unBZnuKTwYJdIhDw=; b=vpcu5Tvkon1jMI
	09sJJDO9AcKwOmM7EffDAK0R097CDWa7EHhDjSd40EGLpPBLvBG/JridCEJxHtzoNwpCag3uIyB85
	gYp4NTin49ohoAACz5NluJ6sAXQW1bxyldrZwGQw5gcA90c2BuL0yW0qCRj5FIvybLTfelkZXae3D
	9y5Yjo0ZVK1Cz3EnMx6C5pM2wvezHLueYtUZ2hioDK9sHg/ql4zQWmrdXgTuBu/T1HDZTEk/1HHPH
	ri8O8ivIIxXP9hVeEKnEU3xwpG04Z1fdQZTm3L+UESZfIkgnizFN0LsbLx7na11DRQW3s4NshZynE
	2XTJqN7ToKKxdXUZF+xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwJo-003jVs-43; Tue, 30 Nov 2021 06:08:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGu-003hzW-7D; Tue, 30 Nov 2021 06:05:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id l25so81794520eda.11;
 Mon, 29 Nov 2021 22:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=R+RpsJmrcu4k38lhTMdsmpexqsCYuM9wUkKjY5gg6Jo=;
 b=qiD1IpHxP7Mf33mI31MjOUEvk7ABc1x+tL8Sm0VQsNxWlCoJbMZxwgmcDPEFG93gS9
 ejLO482jkZJ2QLWYeVa5ZrMRxs91jOVjJSucipuGI4zG8Z/4O1TfQjZJ9sqHClvQL8Wt
 Rjl9AYGmhl+ZBr9/7fjU4tR0ukoPHczFajmwGp9Re3hHdUse4H3h8vzUCN7qKPFxHU61
 yg5Eg07G/rSWk8P9pPIH7pE56R1BSHUWAa6Y4fKg08zI6tJBmJAbIUBzTLM5sg0Hqq/i
 OfflVcMdW0TGiyG1hyyY/aOzHBoOOmAEPx84a/EB/X2Z8MsGwRDnjNA7Ja20dW/difmy
 /i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=R+RpsJmrcu4k38lhTMdsmpexqsCYuM9wUkKjY5gg6Jo=;
 b=idAqaj2ioUkAyuGVdyglrdvf4F9UWzXKAWDcUbvBanXDIcfX8qnkPjj2W+uOnPRd4J
 o3XDgypS8Dt1S2KM+jyWuHPGU+VmehTki6fGSsyYhmzVQFMWiGW51NxKwFn7cf8m/79M
 E5eZfL97OKoQwpjiThS2E3ggLEb7LQVMZNM6xbSxWs3wUMCGxmnofVIiGHTytIMZRrK0
 WyqFXlaa8LJ3Vs86RAPFgAWnKRwbVbRKB8zC+PIgkPi+JX90eUN+d+B7lZKYOuIXGEPk
 gQsDAi0Hi5kNT28DNx3/MpYpHQH9K0BI7AWVFjGWwILCEqVVzU4T9T5X5pMVaRZyzkFo
 eHSA==
X-Gm-Message-State: AOAM530OOrwRHH7Yh3dYjcd3tbmRSvBEyWh0Sudtv6ttiIgMQFTWKJHe
 GletouFZ/XdmWGCL/6NXrw8=
X-Google-Smtp-Source: ABdhPJzLCr2WLssFjy8Or/nBn8XHkX05bq96dIJOPfy2DQ45lLge6tR0YnY/NPdpu81rX3BIyHYsww==
X-Received: by 2002:a17:907:7664:: with SMTP id
 kk4mr63889993ejc.319.1638252342490; 
 Mon, 29 Nov 2021 22:05:42 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:42 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 7/9] dt-bindings: vendor-prefixes: add haochuangyi prefix
Date: Tue, 30 Nov 2021 06:05:21 +0000
Message-Id: <20211130060523.19161-8-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220544_296267_AFDA600D 
X-CRM114-Status: GOOD (  10.22  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shenzhen Haochuangyi Technology Co.,Ltd are a manufcaturer of Android
Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f1b4afb2876a..52ff63248892 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -483,6 +483,8 @@ patternProperties:
     deprecated: true
   "^hannstar,.*":
     description: HannStar Display Corporation
+  "^haochuangyi,.*":
+    description: Shenzhen Haochuangyi Technology Co.,Ltd
   "^haoyu,.*":
     description: Haoyu Microelectronic Co. Ltd.
   "^hardkernel,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
