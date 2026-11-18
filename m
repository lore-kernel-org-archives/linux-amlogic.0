Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BCD606A889
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JuIiJoJI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WSuYzESf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MMxRdQJAE/n3Uj6N78RDmWLOrCxdX1T4bb+vhyWQ0go=; b=JuIiJoJIOhFBBurJi6r7jczoB6
	dZkISNzmsNnW0HhkoiJ6f4gyzeC3NIiRWZM9iBu9ouL3m2MopiSE0fujaaob6tUD80RG8Y9/DrvlP
	55xyw8YzqmRU0qcBu3QCQjJRJU8cUWBQ39oDOT/JvRm2yjGMYm9+nld454sA1pqC+QQRCeRovXyYe
	E5B5NLvIZqROA0DSZGcYR+/LhMcJXrPhNiRTn/dIylAoDuDtZf5TOk+OjmGqF3bQhuOYi0AzA6ZYx
	U6dCY8MfW+GWvhW9+qiD8jK+l2hY1K6EurmRBiDIwh9ISzht67Mo3KZxNvaG+1BWP4LR4WwzJIQt5
	5a1xZw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTj-00000008Tvr-30WZ;
	Wed, 18 Nov 2026 10:01:23 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTh-00000008Ttx-164m
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 10:01:22 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so539027f8f.1
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 02:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996079; x=1795600879; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=WSuYzESfL0bL6EK4SFY1ksePktZXKLEn5yY+V6BLhmh0YoaC3xXjqzPxGbM3WpQybz
         fal8wuFe4C3Txq0YGDtgRJTKJBkJzOgTJDuKqxWNxG6tphs9MEpKogInM9Ufr2Ddz7YD
         u59GsFotPCrspJsWiK8WbSrs3TE5/8LYMmza2sfeiycLCyrbeSXkD3oaQCZMMDjN9XUY
         uduJuo+PxRmrOq+w/FHhj5lJcfHNKAapstzLWyd419VtG31kF+kaaKrrVEcQ0SVe2AG0
         rOEPhBuVRVCWNno09z2h0zqqwPrbD78wIa1X1s+khkXnkv6CVwQ3JhsPf2x/gSp0mOA1
         zBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996079; x=1795600879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wn4TlR8eLWxM319hKeH/ywNfQ03IMDmVqaFVXSQhsp4=;
        b=dTOcInB6LUxO7ihAzXam9+Ex8nDcGoboZyw5Mp1+x/voK0nC5zGzSY+tqdTRzAmugc
         0cEysBh0EobhhxgpsZYafvtNXJC6BE4DssPbAojfdtgpj+MYk9KqgVR5dXReg9xE0Trj
         lJVs1IY66h0gJVeKLk6kO1lUN0Nvf7nFvImrQ+ka7plNqnCD86qvy9KRg9vwOj3rxx3o
         2w92y2coqWwIu/n6FrIE/w3FVVkqcINh9q0lDY6vPf9vWra9D1H8YPWkSfuR8Lfce3Sr
         ecqDZaTTurBoFVThFvbujaMmLch0XPu/M5gLyZ+1T6WdhuFkYl1yS56ERP44et7D6S/I
         h4Fw==
X-Forwarded-Encrypted: i=1; AL+hErEO96TpbHTQjFrdvyIs0X4RslMZ67hXUrLOlk86i19oDYGcR0TKv04gfyyFx01tEl5IA8My64x9gY31I4tH@lists.infradead.org
X-Gm-Message-State: APuU4Z/rrjznK1Erp4e5/oZk7G+XQEWNP7r8ZJ7TrGCBA15RoEGOJTHr
	/vlcq8zvP1kThXYF6fpJQP/9zsLc2WBomCPbEQR7i5LCDWks2cAw0S6kzmvsaMFp6O8=
X-Gm-Gg: AZFdTZcfREdjcqeZq+R+9aQAEC87x9awmKAAoPuW43Oa57vz0FTLOuPKfgLgxd5fwn0
	WHaUvM5JGDMEzrESrHQsvOevy0YWE6LUDHXc7KUW2+t2fH/h7rn+ORMYnbaJEbHA3oICrVmmUqP
	HzHffC4MqjNJ7R2MkNzbSQpNpHCTt/Tv1wXe6J38BKlpCl1jVZnjQicPtG3GsOK4864v9e14NXe
	iwvcWIZzCQ8JsytcUnYccCFhV9z1VJ+MmTzjJQVZcA/1wswiqrmm9n6O8mGO4hH/GplYeaqPYPJ
	c8P3H9WQBXudhLP82Oo2WDulgU1S1LtZPZ91dZKXJLvhf4OQ/fKXXhvhKKHed3gt7bfvRL1b58q
	0Vdi3gXcUGGss7HKVahLJx8gC8qTfMynk9yWV8aQjYumAoxZKLcm4WbahmEc49oQR0iAXLOf3r+
	P80XQdh/kXcJ7Q931cuNBkszw9DWh0oP705cPYhe5inQ9HiY5VAYtApzTwGKP9dHMGqsOalTHwM
	Bz8m2wYNSYQhVGGbXIwVnwi8p9o7PNpx6QcbaiyV6yOQISTUkCPeEPTlfo2FSfDKQPS+l5BhQLu
	j5/6h2cNIOdBFnzu5F3PFVhuMwRZD3tXJnX0KUydkaaEnokh
X-Received: by 2002:a05:6000:4812:b0:491:ef0a:1f5d with SMTP id ffacd0b85a97d-4a63c0938c4mr4292105f8f.39.1794996078453;
        Wed, 18 Nov 2026 02:01:18 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100c6bfsm3712254f8f.2.2026.11.18.02.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] clk: meson: pll: Support PLLs without a
 pre-divider
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.2562080050432015678.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=5EHyC5MxoGvHsCcV/VC2od4aT2B3tCgL0d4UTk1LaZY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3OMtyjNXN+x6DPTga27pnxbX7qy1DfK8qqpoZ13x
 EfpYP64jlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAExkRivDP5ujDMWqq/wiOi8w
 7dgxUSuhNjf2xpWV3VtVUp2rknN+XWdkeCgxYdb+ymrWX4mWglrTe08XrHBQCr18n71wQbN1tIY
 PKwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020121_327463_4540C040 
X-CRM114-Status: GOOD (  11.49  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The common PLL code assumes that every PLL has a pre-divider. This
> does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
> meant to run with theirs set to 1.
> 
> Make the pre-divider optional so these PLLs can use the common
> implementation.
>

This change looks like the intermediate step Jian needed for its rework.
It leaves some problems open, like a PLL without a predivider could still
pass a prediv in its table which would lead to inconsistencies.

If I take it for the S7, I still expect Jian's to rework to be finalized
for the other SoCs. Note that I will not accept more SoC drivers using this
intermediate step until the rework is complete.

Regarding sashiko pre-existing issues, You are free to ignore those in the
context of this series but you are welcome to have a look at them, if you
want to.

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
