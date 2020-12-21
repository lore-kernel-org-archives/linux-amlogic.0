Return-Path: <SRS0=3nIP=FZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0225C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E73022D08
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Dec 2020 18:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E73022D08
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xw2SQdyIPrS723X8e0qQaxCx+Dx/YFWSHUpBEMxSuGU=; b=pkMfIHK9GaRVMw2EAG6UlZ/t4G
	pOveThiUrrFotcooXQUkUtW9+hWOkI1g6dohnQbY6kuH7ecEWORs/PmErqpPEdfTlOoZd7QDXIA/j
	NR6wVH2VzzX6suX837wDv5qIyFB+aeZGLVQb2stJfGnqEKp0yndRSxioSh0ugxc81bgOeiHLLBzvo
	NbkmszfEFOCOzTL6myZjaIKRdW1UDI3HdnzFPd7hRl+Q6sDRHtxnztZyEIgycnuxD/EiRLykQajwI
	zxnvnAzlI1nuUwhVK+QmHY+6xPM0HPs1Wtsf7qzkPt/rWkEseOzCCgFCjOvJbvopkcXe5GKzQ65IO
	W9tleHgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPgl-0001sy-BM; Mon, 21 Dec 2020 18:13:43 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPgj-0001rb-5V; Mon, 21 Dec 2020 18:13:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 190so10731060wmz.0;
 Mon, 21 Dec 2020 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQbcSVOsPCGaFVLHXPexgbeoL6ycThesvgfDmyuAMdM=;
 b=TjtUeUUL8XFB8w6WM2SKsvg2aJrSoj73Ps+COjP65bpxXKmf+Iux57nUTE5ck/el4E
 DVge4nfCSgjZxjUaztJ0Ly+friOlMb3hp8+9F5BK7Kee6kWndbcgvy4f6mtWVNdYZdw9
 k9kzHYOUDppHyaJeUpmxnqDbYbmixx9+pqkq5fVjzIaHAa5zbG0cnHrkKUZH+j/1ydUt
 j4VeC8GKqaG3uwyWxW6I03yqLRSsbBJn5qyVE1KogmAme0rDftJpZJK5X542UCE7/Vlp
 hcgXskk9u0+Awtr7QAkIMsOWZpx28nTHsWDEgbMeQ+pXx82T8VDw4ndM0/nGnt4+SaB7
 oD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GQbcSVOsPCGaFVLHXPexgbeoL6ycThesvgfDmyuAMdM=;
 b=BBLacCtbq/X8brzged2rm7MhUI/cNrucQihBcg06PynNJtXQww1zJ2RRXCw/k7hg8p
 lQ2UQzj3bPkjrFH69Gk1gkV7epWOTG0UcLo7q2nnqEly7lLTV1xulGmsfnjyf887OCwd
 8iEsHKwPtTyJ6N2s2wtO5IOnHY1pcEZpSq2yigRHOw1LouQW69JIRZTt7nawyhoJ8Cof
 hp38G7eQltLgZMOcJWxX7VwD12GZPr2uGUl2BilS4pf1WN+mSn+WuR2ETxot/c6IxA82
 o13g6gM64fWZjZuEzv4SWKHjJkIyj0EHQJpkQe4bKKAehU1Sf5lNWS9FLgCy140WiC7h
 8YQw==
X-Gm-Message-State: AOAM533JE03UVCj1KniH0kdxJYKeq8D7POmGbMVlxvWBx5LBxcxVYi9J
 GcgWvnvyrZL9L3GNwDfZuxqmdliiNG0=
X-Google-Smtp-Source: ABdhPJyeOiJprk7Loi5JMfeVJeXoygn8F3xrMlXyoZ+NdnXtYx5wV+SeSXTz82byTmiVlk7T1BLSYQ==
X-Received: by 2002:a1c:7d88:: with SMTP id
 y130mr17483165wmc.158.1608574417702; 
 Mon, 21 Dec 2020 10:13:37 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137019000428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3701:9000:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id m11sm23434936wmi.16.2020.12.21.10.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 10:13:37 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/5] Thermal zone configuration for Meson8/Meson8b/Meson8m2
Date: Mon, 21 Dec 2020 19:13:01 +0100
Message-Id: <20201221181306.904272-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_131341_331417_9F7D0BD6 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the thermal zone configuration on Meson8/Meson8b/Meson8m2
SoCs. The thermal sensor reading is taken from SAR ADC. With
"generic-adc-thermal" it is then used to configure the thermal zone.

CPU and GPU frequencies can both be managed. The vendor kernel also
manages the number of active GPU pixel processor cores. This is not
supported yet so we skip it.


Martin Blumenstingl (5):
  ARM: dts: meson: move iio-hwmon for the SoC temperature to meson.dtsi
  ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
  ARM: dts: meson8: add the thermal-zones with cooling configuration
  ARM: dts: meson8b: add the thermal-zones with cooling configuration
  ARM: multi_v7_defconfig: Enable support for the ADC thermal sensor

 arch/arm/boot/dts/meson.dtsi              | 12 +++++
 arch/arm/boot/dts/meson8.dtsi             | 54 +++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts       |  5 ---
 arch/arm/boot/dts/meson8b-mxq.dts         |  5 ---
 arch/arm/boot/dts/meson8b-odroidc1.dts    |  5 ---
 arch/arm/boot/dts/meson8b.dtsi            | 54 +++++++++++++++++++++++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts |  5 ---
 arch/arm/configs/multi_v7_defconfig       |  1 +
 8 files changed, 121 insertions(+), 20 deletions(-)

-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
