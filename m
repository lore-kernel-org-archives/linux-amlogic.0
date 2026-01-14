Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B798D31A26
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VdJUC/m3aAo/+67epapDFK8YIe66laHhQ1SZ9yBQOFk=; b=Xf0otGeH0s7LS+
	BQ2LGaAbb257vQhZWFh7seLN/qkgsVdxLJ75nCSWpq4FZxiIxhgzApg2e9C/Mv0icEIIbi4a8bsEl
	zUwk7N57BCjZC2t4IbpIQm2JmLQ1pawmlKJkrcrsEtcQyMcDXwVfBBmOMlZFSHxoCGWwFrbxU1NhY
	/fuE/JIwdGfJ+e1/XggQKBxBdXVMpvQXCMZgjq6HPbOh9ONJBmtyAuvcCmFEJC2kr/TpNJmryebPN
	7kG2FmXQz96QplanfR4IPjtTNN2HloRDQZzzTpWXsE4XEBuF5l4v6+Tqocrw/okO8+iG/Y1AH+Z3m
	BgsmGsh964msR7+bgA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgx-00000008Qa8-365C;
	Wed, 14 Jan 2026 08:57:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfwgt-00000008QXc-3hxN
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 08:57:26 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-432d2c96215so4901116f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 00:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768381042; x=1768985842; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dp7x1TdxmlhWgtnOwQPYR6NPaurAoP493Ro32X3eg=;
        b=PcIhVUpCkcv8RZStqlyz+lApQ+/acsbRVDu45jXAUdGcypEC7cEXPaucFjNIn02XJg
         jq5PoUHmvjC9CLzhRJVhRVHCSTVa+uSGdGWjiEZEFoLun9fPOLXnEa+iQI65890YbEDO
         DWela8kaxUyZbOWK9tjUc2TNem0BmfGlkIfSa/5YSdmDMCF0NVKnwBBq9UbA427Gr93E
         EBT6z1Q7tRMUedINxMSh4ut1y0tUzXX6NZKcnM8BzokyRUMeCZDIRbPyJ2ql2L3723Tv
         viZTux+vlvEFuIkaUBJoBVDgKA+1c6dvJf43l2s+zOscqIjsZH3J77xAFzKRyz+c6e87
         FyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381042; x=1768985842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1dp7x1TdxmlhWgtnOwQPYR6NPaurAoP493Ro32X3eg=;
        b=Anw86ZMpwb3dhUWl33KcyKo4c+fwS6bspG9jSr4S8IW9DpRRDTMTtkUeq9OLnRAQms
         WIV9WiHP3ezn+eVSjJjFtxrx1Dj1yQPpfJ3NVDE/Qs29nQAErPBTw5mpVdALukDQKcH5
         KsgIltOqP7wc15IR3GXCadeer1GeS/ADr0qyT3VwYbKI72hLTWkv+J9K7YBE4lD27J90
         BSMtkjwYhl7HkPDf9z2jwZD7gv+ieyhgG2LkipI6pBwoyXLqAN5V8zFb+tkFPAX+ZgA6
         hed+B0fE/mymYkKEDW/TCbKP95FCw1Si5w+ip8fszV3IM0dtMO+QaVaMoj5Mm5OkDtMl
         RRvg==
X-Forwarded-Encrypted: i=1; AJvYcCVJAIRpP/G8tOoyfWdeG6jBHgsEsXEmThZpXqHbWKaXUDGklQISizaN5W6OvVwaEXNzpHUVIwlbf+PRi+ks@lists.infradead.org
X-Gm-Message-State: AOJu0YyvizGwiuQViKWmbdhJuDCiQwL2ekQ0PqKauH2GYsg1MsHjkIzX
	VBBAEDozBETAYMMUWdZbG492AgJAshLNzG4Jxbv1E2890HWyf2nJGFFx8jLSJ6oghjg=
X-Gm-Gg: AY/fxX5w3DgEbFDoQ2iSPy8/aeQTmkhlDwyPRsfcoTR3TJt/cIqxNLpgpYhs8XhK3Ql
	WEE7MK88FYCqJ9ilWWGQ6nnKOVT8MW027eADQ9wxbfGvQRDbszB5q4N5wvEQq6QEuO4x8JI05Ma
	w4yyGZ2lcM94nNUEv5qq+hoKyo6tR/xVM174BbSll+xwdrnB2KbXFb5NPsie4yikrjR2JM4f4D7
	rDrwxUV4T0e+jESQ5ct2DFFoYsXQUf0CXOKhKuU8BjfR2xNgSP0rlcrZCeiIuX4+31Yh4xP7+Dx
	rt7U62Ws1iwfU9gjLOu9wIH94ZrSeL14zerlSdrHU05pBIifiJPS5dQgud9cc1QUwY6RSw85vU7
	nCyKtowAd8VTD2mldf6KItQpWh07Hl72Emp+J28LA7JcHBy/cGLZnlUDTm9UUG2B3vxEKKvZ989
	LLznpwnYcRgA==
X-Received: by 2002:a05:6000:2907:b0:431:771:a51f with SMTP id ffacd0b85a97d-4342d5cecc0mr1509239f8f.49.1768381042003;
        Wed, 14 Jan 2026 00:57:22 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:db84:c9f1:21bc:dca1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432dfa6dc4esm26892352f8f.23.2026.01.14.00.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:57:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/2] arm64: dts: amlogic: s4: mmc clock fixups
Date: Wed, 14 Jan 2026 09:56:52 +0100
Message-Id: <20260114-amlogic-s4-mmc-fixup-v2-0-7e9ab5f12286@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFRaZ2kC/4WNQQ6CMBBFr0Jm7Zi2GhVX3sOw6JQpTEIpaZVIC
 He3cgGX7//891fInIQz3KsVEs+SJY4FzKEC19uxY5S2MBhlLkrrE9owxE4c5jOG4NDL5z1hbWx
 7o1rRlRjKdEpcil37bAr3kl8xLfvLrH/pH+GsUaG2pL2zypPxD7LLIJT46GKAZtu2L5dF8ty7A
 AAA
X-Change-ID: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=F8VqL2mrsfl/1p9zR/dSxMnGMq0rUfHJkw5M2BNwhJw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ1pmEX0dBKj+m2U9h/ETeSvjMWpinjG1JERXz
 WiLvhC/IEmJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdaZgAKCRDm/A8cN/La
 hc0NEACGH2Oq4613xYHjGjiC/GeGt4ZdZIP8dBjR2lHAQvsuH7HUjJg3g93u09Ivod/i1UIoatA
 3Vyl19e9Ar8oBbCGmDvSL3R8K3aEeKO4mIyd8KAHjsF39T/WqUdMQWBnXkmK2UiywJtWaXSenXs
 yHtn1Ih8mskutxU76gqDqCOgLMhq/q2XSzu73qstZKAr2sGKbvJdELSypSGvU5ysTcE1jkebb3T
 EeYahLaWlwDCI1H2jM0FB3XMnp/QuztGkjrUOWQ8CR6CU3iV6kUPdFAcufE/n58nevJuVhnaUQo
 Fgdd/Tz5Gw3iJcUqvZSLgUrZbb1Cw545R3eYNMO3+Z/z5yDiQ5WgrWQkDzp7Iovu+4Bv4fwcDLJ
 a7oC1c3vHo7/YWYkhni1YBvwixoG+RSere788SxBfRqyOM9QV28QIBw8bSVonHehe+GiqoGWGu4
 EdXsEfZ1z01QRqDe6SaGtJQXzAGYko1MyTxh1450T4+q2az4WjnfAGhRjCh6Gwn1AFI0vBylZ6W
 2mPGdcKfvm13Xh4yVijhT0aF9637jTJZEcYkXYF0tSs2G1PV3PPNpAnIlHnSep1h3u0X2ws1qgx
 bIG1BY0R0z1PEbTGISPK6trLpFeVpfsvPrY/RkWcXai8EfhiqC6qExWmvUZR9qyHRJRoWj+SIuS
 yvZjavYxn5UQtvw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_005724_190932_0435CB50 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patchset aims to address the issue raised here [1] for MMC B.

While checking this issue, I've found that MMC A and C also appear to be
improperly described in this platform's DT. The 2nd change fixes that.

To be on the safe side, the MMC clock should also be assigned on the other
SoCs. More changes will follow once things are sorted out for s4.

[1]: https://lore.kernel.org/linux-amlogic/20260113011931.40424-1-nick@khadas.com/

Changes in v2:
- Collect Tested-by from Nick
- Fix some typos in the commit description
- Link to v1: https://lore.kernel.org/r/20260113-amlogic-s4-mmc-fixup-v1-0-1ab1fca0fb2f@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      arm64: dts: amlogic: s4: assign mmc b clock to 24MHz
      arm64: dts: amlogic: s4: fix mmc clock assignment

 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260113-amlogic-s4-mmc-fixup-92ad8b90b7be

Best regards,
-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
