Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88469C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528EE20729
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fbkSfDtl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="R46YDFvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528EE20729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2501+/3ZTtpznO+YIYAb/12X16VpCwyoDGvGtRRLpc=; b=fbkSfDtlJWFtAIGybqvpA+zrOf
	jc+6Cfbx+suCvi5lGtdH+KdfBVSw4z9Xi4uYDB0NXiALm4DcB/HEPj63fVDyUG03N8xyESYST8PiM
	6VfGWmcJCYJh1XCpQctzmkoLuifTaXGrKxx51b7KnuWVAib4Kw37clkSIPAHLBfcwDUIvBigzoIht
	09jcY7odqqkn8maxuk5Kgc0o++lF9W086aPRCf2w8iMdMiSjXmymppf9rZSaaVC6jBdt16Unv4261
	Fox9rpoO6zGZufZdrTqd9l+qiwyx4lXr/4E9xd+xQ1OSDb5qyb3VcXwX488qSoA8YKTdvakNiAdVL
	GFcSnNGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzba-0002ZX-Ii; Tue, 21 Jul 2020 21:15:18 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzbE-0002Rg-2d
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:14:57 +0000
Received: by mail-pj1-x1044.google.com with SMTP id f16so46889pjt.0
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Jul 2020 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8Wwp/nTJzsUvhisUQ9+vaJpMJ0iH/g8jv6QNXb3X5ww=;
 b=R46YDFvsp892X1mA7UDmA3obkdoXFygn2SPRBg1p9ocvU8u0SvQaYmqpvYBXPRYiKU
 5+oz5AUctzTlpODshc8BvvGMEMSDeK5pEj6ZMB1D9fMQJEyMYhAR+DsyA1aNCtvRSIw6
 erNog0J6vUpi1vJN+bhGmlH+vJVn55lRxbVhxQmQN7jOF29tA9EEuYrg0UOnTWGqBH2H
 2HiBKtQiYtZI+SqoH7ikzMGaSA0XyGDFrBqO6LAeqme2Yn1INMnwWEhCzqfcl2u6iWiu
 CTd6FICWjWbzpHAlp3gBKmAYl6XAaNA6wAllYMnHTZSWElLDFQAVYOfO7XPPq8D4brqb
 BiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8Wwp/nTJzsUvhisUQ9+vaJpMJ0iH/g8jv6QNXb3X5ww=;
 b=eb1vUjrui23pub/gHo5jXywcU/iACoHxVQYQ5PWkZINATrbAjfnXNK106xSb5W2CQs
 ggAnfBPSEGNywx5MU8PC2B7PPLnMUx6lPh7Z6F635WxkmH8twr1zQxrLlieLS1Iy/ZNU
 FDFhj4mcvo0eW9gFwaaUhxr36WsYF69Oxdo3D5C/fV1Pw4VZKxqzQ+NMM75Hc6yAUsUe
 SEgZGLrFxhYwJ3zwA1mIAbL/QVDeyl365YWdJtnPNviHvq9ckNyJ7ExtdVs20xz3xN+z
 2HzjZqQcOl1monbkNAei9RiVu4UyBId6uCoHgvtqJMRA/fWxHwgBOO3rWhhKXWbOxlWr
 RBCA==
X-Gm-Message-State: AOAM531l3rzFD1v97s/y4EDFxFIFTKPL2CYxqf4G6297705BWkQofkYB
 UJSzq1rOmduhv7y3TIuWKWaSSZmgN6FlOA==
X-Google-Smtp-Source: ABdhPJzyJvqDGRK1A9FroF7bWZIj9yO99S+GpeI/v/ztl4Hj14ZjS1n14DHIrndS7G5OAKQTZkXClw==
X-Received: by 2002:a17:902:bd8a:: with SMTP id
 q10mr24858111pls.236.1595366090725; 
 Tue, 21 Jul 2020 14:14:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i196sm18903141pgc.55.2020.07.21.14.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 14:14:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Hewitt <christianshewitt@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] arm64: dts: meson: add support for WeTek Core 2
Date: Tue, 21 Jul 2020 14:14:45 -0700
Message-Id: <159536607960.30777.1598266947126340920.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200719021421.7959-1-christianshewitt@gmail.com>
References: <20200719021421.7959-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_171456_189669_E71FF1A3 
X-CRM114-Status: UNSURE (   9.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 19 Jul 2020 02:14:19 +0000, Christian Hewitt wrote:
> This series adds support for the WeTek Core 2 which is a commercial box
> device based on the Amlogic Q200 reference design.
> 
> v3 changes - fix BT node (enable-gpios > shutdown-gpios)
> v2 changes - simplify ethernet disable
> 
> Christian Hewitt (2):
>   dt-bindings: arm: amlogic: add support for the WeTek Core 2
>   arm64: dts: meson: add support for the WeTek Core 2
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: amlogic: add support for the WeTek Core 2
      commit: 8b6f53d7b94b8d23860ae44a56b0af404a6c7e4c
[2/2] arm64: dts: meson: add support for the WeTek Core 2
      commit: ea232b9ccccf2f55fe231441f3908c31c7136c4f

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
