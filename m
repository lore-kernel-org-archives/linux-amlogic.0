Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B07EC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Feb 2022 11:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc1e6XOvqARSqcd13SywTIiEcoDiHCywm5NpqPhZLBY=; b=mRxaq6ryZoGQhx
	fWhm8B+ZP3Jv2VLN9Yx/Py2B63HHvu261ZSWLgaId1vVzqDWIdqj3xLYK6rdrW4m58xX2pyAMhj97
	/OUiriECKH8cjxy92ylxgGm0Xfabm8ZyES40ksM74O/pJg+/+6E03358M2ZRxxvx7/Z3E8bZwMsQz
	0nTK1OPbEqm2jBedn4LVXzUY0rnAHBSIOJSGQZ6MRYRfpE8aKhsTm7xDw/mmrnGqw7jRXnWV/QGnW
	ZyQbegxgyEluVjihF6SH5Ue0tKjL/HVKakQfoE/YXMXB9efGzk+AD9tdmaRx3jTKqoU9f2KWclunO
	OlEjZYBOJX+X3KOpCcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nITg3-006m7I-Um; Fri, 11 Feb 2022 11:01:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nITYG-006iDM-Gr; Fri, 11 Feb 2022 10:53:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id d27so14523518wrc.6;
 Fri, 11 Feb 2022 02:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BjDFuVI1diXeHGjfeYh1Ru7NnwWu54G5DixYVQkN3LQ=;
 b=IPUH1MM4F2bcCEyH9Dk48Ibm3Ays+j2Rb9w/3XdESqiobx05n0iuIVd/fq9xu6q9Uv
 Ka7b8rG90UVojUOr5HzN6mw6hCXnq3VMD/1VBTw/edAjzy1wCeEwYZ67nZhFSAAUNute
 Zo845Ka+/CfLdBsTaC+l1qKvKBoHquJ53WRaFE0AsU6Gkm3Mlh8lGtnnr+Gq/fyxcZc/
 N2om/1XVYvH6CdqhKMHQ/JuE72JD31MXkdOwp2TdkUyNHhnG9tcoY+SIxrU7A7W/6EF3
 oJ/HmVmOntbB3MtRhaAZq29ZVGb5CL6hqbJmnAdeNUN7VH//vKPN9/XkGuvRimtpeXRg
 zw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BjDFuVI1diXeHGjfeYh1Ru7NnwWu54G5DixYVQkN3LQ=;
 b=Ew16ZzGV6HwPgUTH8SKDuU9PEL4hEE3N/lP6k2he79RguyvKJD555rKBiQ+CjYaoDw
 NrMPolmJ09HEr42r1pWGpkDEZhGpDMmKrpXEFlCnJDbJ7GaSou/RHWPQx5R798QSi5Pb
 9WEnhMxAFNmCy58PuKSCMC9gKCQjqI2thz9QUhJSdTd6zgShmffqDt47vpNUnYiGTP38
 8YDbjiKWssz4MLJ6a/3b9hUp+4pv/X4okCfz8yr6cR9+WvOo9YUajCyPuAKrZfBmQ+0s
 T4eefyZBP3YDHPPR8pZfoYSB5n8hMBwYd8B7TcRB2L9OhYJGQdTVAf6B/CylCT9+RqN5
 SCXQ==
X-Gm-Message-State: AOAM532tRohdot9X6qLrdpKY8xfqOZa1+7MXzVVuFpZu//QJZNEcseYg
 PxPy0LlyoDYJhdczUxFx4/0=
X-Google-Smtp-Source: ABdhPJwxqr3gewkoJ0yU25BYbz0IFxPTaIIJdfOtrWTNsHnhSnNj02uxBL4KfOIDDfZscEFSz+BgMw==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr878215wrq.283.1644576798930;
 Fri, 11 Feb 2022 02:53:18 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id b4sm13382374wrw.100.2022.02.11.02.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 02:53:18 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Sam Nazarko <email@samnazarko.co.uk>, Chad Wagner <wagnerch42@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add osmc prefix
Date: Fri, 11 Feb 2022 10:53:09 +0000
Message-Id: <20220211105311.30320-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211105311.30320-1-christianshewitt@gmail.com>
References: <20220211105311.30320-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_025320_621892_49349924 
X-CRM114-Status: GOOD (  10.04  )
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

Open Source Media Centre (Sam Nazarko Trading Ltd.) are a manufacturer
of Linux Set-Top Box devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 52ff63248892..b97fd8dfe601 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -882,6 +882,8 @@ patternProperties:
     description: Ortus Technology Co., Ltd.
   "^osddisplays,.*":
     description: OSD Displays
+  "^osmc,.*":
+    description: Sam Nazarko Trading Ltd. (Open Source Media Centre)
   "^ouya,.*":
     description: Ouya Inc.
   "^overkiz,.*":
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
