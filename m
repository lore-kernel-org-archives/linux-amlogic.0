Return-Path: <SRS0=tINo=PA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92829C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:25:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C24B61040
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Oct 2021 05:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C24B61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zpdR8sOl5j+ESwCmxd9dVzt1s7pNoFQxm25xdhRyli0=; b=WzG4gXWEZk+sVf
	MHDdvEyaSxxmZrypEin1k1ICLDC9mLfEsFmv2ClZvBVX1CmZLtRFLxRFKlpG6q68/EK2O2E4MwwvK
	s2Jf3F6yjiVH59lyLXCX6ANTQ8Uxm6N+f/x1XqsYJbIXo+Ei8o6FdJdfnBmgr2Gs1cAonNhlaLwJB
	oFwSHa4MfMgF9e1YKULyoKXM30rSoXJWq0/3tEeTYSm22DOysMbgSihTXzGuaKQh7e6EGW6WVVeIs
	IQdsVWn6SMYl/mkUi4/iH9C9eNREMEAMMAmpg+ofzfajcR8VdEkHCxH+CsyZoP5xxcaJc18iMl60c
	tN6JUF40YayOcH59RUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maAII-00Bbap-Ee; Tue, 12 Oct 2021 05:25:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maAI5-00BbXx-SA; Tue, 12 Oct 2021 05:25:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id r18so76407076edv.12;
 Mon, 11 Oct 2021 22:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=L/BFIYbO9ild+/sdclH6i6ugRyUNQfFYkI/wS0E/Cc8=;
 b=eNhG/gtA1Xt93PLKEuoCEoEapdjebKmcBXGittbAYBRYk8dSXlZ5i63mg3ARmf7n2Y
 QPo066ya69sy+WqSRcvxZXM4CX4JcrtKdcoaFb0syP52x3YdP9pPmxg3EZfKxTKz9rBm
 wI4qRZyKIHfunVwIvGQwtBY2PUfEKoSmex4q36JGBX7PfhKFNDO8PAWjCDoAzgDApV/+
 2b4prU8GCkpyDZ08j7srSIor2HhTMKZaSqWABPKxSY5HoMioFM/iQ+KKWWHTUagTv64K
 NdDB0rNc7o2BvGd/UdnQacWUKHwk4h7dPIHa3bBDsT7JEu8uTFS4PVgtJ/JSeie7mdwk
 r4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L/BFIYbO9ild+/sdclH6i6ugRyUNQfFYkI/wS0E/Cc8=;
 b=b3IH+fQDSl56U4GON4SMJYxU6Zfg9Z8acjzkh33yQtPLCZnA7ej8UGQlJavQIdW/jN
 keIwEE9STXD1j2WXVDyqR2UC7rqb8dlETzMW2iimBV21MFI+qjrTfHjH+n1L/9JjUCTL
 D8HIFTtQDn0TISbNandKXeho4p0Si6gpDQcho6ES1M4YO824TCTK0RZ8Om3L6/cNyQMn
 2fJ5P3SVnPbp7DJ78XG8xH1dNeV7VW/J0kmQpZYig5r4KQVkXm2XsjKhYRbvlAuPxpIr
 7Xa5W3AV98Uuh4yStWv1lLJ9h4cTaKnbz5cOflLaIEnnkNMqfB5EAReyDYMLRspZVoyD
 IPyQ==
X-Gm-Message-State: AOAM531wvstxDtxi3Fn8/ZlC+wxqsvf+5pkNog6oM4lACStqhnV2aG5Y
 Pku+VvkCCscUonYsSfxWtRdKshtpAehU1A==
X-Google-Smtp-Source: ABdhPJzlfMTUiBEp9/2mOFl3Z8dTSbytqPeF6uT4rKXSg8L80306OjM9HlPf+EYiNzNUmr+m9qYYaw==
X-Received: by 2002:a17:906:3192:: with SMTP id
 18mr31150770ejy.246.1634016326758; 
 Mon, 11 Oct 2021 22:25:26 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r22sm4323321ejd.109.2021.10.11.22.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 22:25:26 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 0/3] arm64: dts: meson: fixups for WeTek common dtsi
Date: Tue, 12 Oct 2021 05:25:19 +0000
Message-Id: <20211012052522.30873-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_222529_940229_983B294C 
X-CRM114-Status: GOOD (  10.28  )
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

Two fixes from work on u-boot support and following access to the original
vendor schematics, plus a minor change to use revised LED bindings.

- Mark VDDIO_AO18 always-on and link hdmi-supply to fix HDMI on boot
- Add missing GPIO binding
- Update LED bindings

Christian Hewitt (3):
  arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
  arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
  arm64: dts: meson-gxbb-wetek: use updated LED bindings

 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
