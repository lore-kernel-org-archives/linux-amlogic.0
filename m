Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C14FC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbNQ1JI95/WGl3992Co4s3a+JIdEqoNNG2xbSyeoGeY=; b=KSCtQkDCyNKRfA
	6+68nlXPM0ciS6aTHNMkltkKCgJEcxcvNtkkXmuu6LfmZavru5n5glqpdscWJpZ2sbRQyX74agWEV
	ecxFiNKWr0AdVxIJeW+vwfmhtdscXkgnvg6xTP4yH52pb7fF6B+dwj2tnQmiOfNiKy7CxrJrFY8r6
	75U+V7tDGBB5Pzur0wdpg/rjtpXsgZBFLWpPiVJoV+R5A1ptmfMbawGQ0bzUCa3SI7CVYVj+JI8SR
	ko2HMRdFKnQyk5o19S8z8ILapRSwwC8mL6LO5kBM9S53/5wjRxfrS9cA4Hev5rs7Cu7fqhoOxwF9D
	Jj72Dt7LvniIdB8MT2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwIg-003isG-0I; Tue, 30 Nov 2021 06:07:34 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwGp-003hyZ-Rd; Tue, 30 Nov 2021 06:05:41 +0000
Received: by mail-ed1-x533.google.com with SMTP id w1so82244179edc.6;
 Mon, 29 Nov 2021 22:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=GhTDv3wvRjYkhYbESwOqZReRkMnLEhVyw3DHRR6Xuck=;
 b=KpbqwAn5Z0lawhOucXoKDZ/XCtv/rYicMvFaUJ2fXEXzwg0PfiBgJ0hLbVqZwFVbBI
 nAh7bOkSmpmNWo/L9f8RSYGHQV5aDEdhEcPBB43718yJM7wqsO0b2Ln2ec7fhgt0Zg8X
 nWD4oOCZFbPnL8+fl5zdVrzChUY4vpUVC/vqB88NLQwwKJgkZSmYPoBnIU1fsoPYLEjv
 MVPoX9ygkne013satmqo6CUSQx0yCm5N2hsFojQVszkKE3Sl7etixS8JW3BIIxuLfPnM
 FB7p8tyQRBjECA+eKs2a6MtmHTQd3A1fT3WqyvbqyZ4Icw4MIFZLjj8A+jp1LuWnM8KF
 tUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=GhTDv3wvRjYkhYbESwOqZReRkMnLEhVyw3DHRR6Xuck=;
 b=u5/j2Qf1op97uSQVR+h4wVGWqFAHgfs+xGgT6Mpri3483enS4XkX90fsW26X2rIddm
 h+Wp99Jq84nqtOIb27vpsManqIhP09/ung/k6VUuWr6bYQLqo66G8m0nJt5P+laE/41v
 yOPXcSseOqDRXm59jaY3cmfg3yN3Dh4yfhH7I63egbPCjoiagVvDFjQwAryP/HFGqd63
 MlFyxZQ1PyNwzWrekh+7XkKwjvofjjslJ4ByuWMyR97wr/enJpNzjbJdy/72MyYcGidY
 bEv7sWpBbfN51zz80e1qLFOjxO/LETs1yYJqn5SGiBnY04fpracIU02OYOtV3b3FVRrD
 qH2g==
X-Gm-Message-State: AOAM530+yVm4WA8V/x8zOWyRXuyDJuwkhf7BWOi37XYAnVbLshVy3UW2
 5ZHLhe86W5fqss5ZO7KsFYM=
X-Google-Smtp-Source: ABdhPJxOrRZu4k6fgFsml/oxxHiCjdC3djHe9nVzQD7uvyQTXlZw45wlEA/8GwV5iUYnF2yQXsKxIg==
X-Received: by 2002:a17:906:3408:: with SMTP id
 c8mr65133295ejb.41.1638252338107; 
 Mon, 29 Nov 2021 22:05:38 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id e1sm10542153edc.27.2021.11.29.22.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 22:05:37 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Benoit Masson <yahoo@perenite.com>
Subject: [RFC PATCH 5/9] dt-bindings: arm: amlogic: add A95XF3-AIR bindings
Date: Tue, 30 Nov 2021 06:05:19 +0000
Message-Id: <20211130060523.19161-6-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211130060523.19161-1-christianshewitt@gmail.com>
References: <20211130060523.19161-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_220539_913666_1659A79F 
X-CRM114-Status: GOOD (  11.05  )
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

Add board bindings for the CYX A95XF3-AIR set-top box which ships
with model variants distiguished by Ethernet configuration: models
using internal 10/100 PHY have a -100 suffix, while models using
external Gigabit PHY have a -1000 suffix.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index e9ab0ffe8be7..1dc793eb35f4 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -173,6 +173,8 @@ properties:
               - amediatech,x96-air-100
               - amediatech,x96-air-1000
               - bananapi,bpi-m5
+              - cyx,a95xf3-air-100
+              - cyx,a95xf3-air-1000
               - hardkernel,odroid-c4
               - hardkernel,odroid-hc4
               - khadas,vim3l
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
