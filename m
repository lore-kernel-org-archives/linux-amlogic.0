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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06C2C2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6166922209
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ntFbCR3C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXHHU4XZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6166922209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SjtfY2tbxrMljbbV/G0XtvnB9k8KnbQao6ZSYbE9TGs=; b=ntFbCR3COZ3hvRvPSkVhjQVNYF
	s86g5l8xaB0RYSl/oINf+EZAoFVDDTaZVt2SwprZTPfDEm9tc2RCPLKkBM3gA0KMto46JtNSUvl7Y
	N+vBLwnYcaqMFUNOlKGYffWWbCesH0L+XESaviaNAaW1bdOBvfExcZaFAOxSCoKtefd7OxtN3G5RK
	46/+ktW2V8+6L9ZIqa+psXugEbnHZ7sDBMR5BKJrHk64c9p52vVbTXEZMsTa9tbb5zCRxzdMaqv3h
	ocfPOPf/Q7CStgJvqxwkHc9HQwUb9Cs4R9lWlvpCmwG7EAbZXz3NCR5LJq1WVfLGqfuVVlKjsTHB5
	eWcCOXUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2u1-00015F-Mr; Sun, 19 Apr 2020 05:54:01 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2tW-0000aU-Lz; Sun, 19 Apr 2020 05:53:31 +0000
Received: by mail-lf1-x142.google.com with SMTP id r17so5222377lff.2;
 Sat, 18 Apr 2020 22:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Cp+YcW+uZwweqktYq1kPw5M/xoHZD09hBXWzWgZpn8o=;
 b=mXHHU4XZ0bVgIZ8xBu5v+wSWHF77YPQuCaV2Ohf5J7nhQ+9RRUnj64tgiGpMfkHtQo
 VSRKBf0X7fYqORWd+DiN7jwSHdexbNeClY7LsNIBBQGfFqKWNiGa0XFES5JuUdUykXzU
 VSFBsFPFDSMKAZwOI4PujeDFObKpDL0kQdJpVcs+PVwtT4dIkl7oE0AdQJm90oiNDEai
 7WoK51OpKMyZeYwFEAYddCaQgWRNJDTCJ3dCAd/qMhuPPr3mSG8pZzFjm/TdwlgL/hlj
 4P42cFOcxrgL2xbgPGdYh+ZYlBDP5cO3DP9VcYlG1l+9/hMmpZojE5MfJ/C3H/mFxUx0
 mTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Cp+YcW+uZwweqktYq1kPw5M/xoHZD09hBXWzWgZpn8o=;
 b=U5VDKqaHw04OqHK6HSOYXFLvAUb+AVkM+hgIp3VfGHBbCaaFjRJC/UMXnHgut4hysc
 Kp8avysfo82aaE2VSyVZLq5UC8RJ4sl3ekfY1hkqbszCUxvHXLTeRRNlCwlr8hooyki8
 A/84IOzgJylTpU8gXwVRleIM4BKgC6JfYuqb9ktaU4YqeHogNN65q5MIHi2ZO/zuaBqj
 UiD+wQYsKkJIBdiiUA3wE7268OCnemXnf3dFxQvu/5u3wQQ3b5CGVpyO05yoJoJXoL6y
 eXqmIHz3AMX01S5hHNIeJ1eD0fo1UNmxlq+XzBzj6qXdH9Iy+9e1+a8WFmQuWC14Bmtt
 W52g==
X-Gm-Message-State: AGi0PuaEbiCVGu8KNA/L454wy0l/EjfZF/CuJ3HMXIlSas64CBP/3hSo
 VHa1QFC4R5v0i7/Aq6/w9eA=
X-Google-Smtp-Source: APiQypJoxv0TyES2AdqlW9umna3BrKG7kN4I69FJTVPxKmNrdHFQYkkPxXYmypsFbZTO7en3OnIJPg==
X-Received: by 2002:a19:4841:: with SMTP id v62mr6609541lfa.66.1587275609345; 
 Sat, 18 Apr 2020 22:53:29 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id h7sm3366247ljg.37.2020.04.18.22.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:53:28 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King
Date: Sun, 19 Apr 2020 05:53:19 +0000
Message-Id: <20200419055322.16138-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419055322.16138-1-christianshewitt@gmail.com>
References: <20200419055322.16138-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_225330_717578_CEA1C410 
X-CRM114-Status: GOOD (  10.16  )
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

The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
board with an S922X chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index f74aba48cec1..6bf9bbcf4968 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -148,6 +148,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B S922X SoC
         items:
           - enum:
+              - azw,gtking
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
