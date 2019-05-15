Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D42C04E53
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 18:33:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D257B20843
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 18:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aFrBQnUT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1qr5UW1h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D257B20843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VYGz2B3R4jGG3CGq7xnF1Wz3wOm3hLQr9R4iKeohDk=; b=aFrBQnUT9Iib1j
	15s6kN03Etlzlh0f14GqfdgtrN5I7epxutIfv9xP9KoquNgotge/edLv/Op43mPjnJZc8wwVhYmEX
	zk6W0+nSr8o7T7nYMs3JG0fEP7z7eB9gYOuDHQipwUXF9wOHKp3gI+amZOhzVLsldPTJueKK9EsNU
	tM9uGdplwcZpOIWP8aFzT6Q58FlaxcQpNtSgATtsaHzDfgIC17h9V1Zqx0HMY6cPxLBMKN8GIFqCq
	uTnL36a+yuGj0cckLRCOHG4i+ne02jGdM0vNJu83sS6UYN0N0gCrHoLNXFC3bOoY0opXnivRHkHvW
	PlozS2Qme1HOzdRDHm6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQyiR-0006OV-0v; Wed, 15 May 2019 18:33:23 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQyiO-0006O9-Au
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 18:33:22 +0000
Received: by mail-pf1-x444.google.com with SMTP id y11so386949pfm.13
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KTn4Z+mP+RK9qfYjM/8C+gF7DHUoeVhnhade+GuKjk4=;
 b=1qr5UW1hGKCD1t9Lva/WBysBSCPPi07jakQMbn5YKqeIpXFI1j60Sqn0793aukY46q
 CmQAicqUN2t3dlERSLLqZnF3xzjDMU3ojhnsIXn0feXMYgbxasdk8E2h9K+Xtsjx3Kfs
 PCeZmfQTaJA7sH1py4q+nuMh5ZytiTYn54FamSdbLq1Elg+rNRdGVrFpaG6KI8HrqW2S
 yyEwTA4pSWJbiaTFJwRZtRPCAZia3yJHaabp+Q353LeX/l/tN807VLhvt+pB1+2utqfM
 1ECCPRDY+VwvfzTY8VDQExnN8849lbIAEzZjNKP0AZY3X4Zxahe7+M92uJAOozk8ecL8
 jNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KTn4Z+mP+RK9qfYjM/8C+gF7DHUoeVhnhade+GuKjk4=;
 b=V0HOKU36Ot2SvGlj5ZhddyW2/Mjq4ExqFQWgbCYqB4iM9LUrtULDvsICHYRPm1GhPZ
 Um+WH2m8T500UbVf9jVaqHGhdIG3QEpAg8Z1p5Z+ZGIR4FCtTAT36OBArOPktkjsSIfO
 MxXFzbnBtl2iafqNy2AkPFbG2w9hLoNck8Ltf8eo7vaREnhGvVri+nnKpKbzaX24CFHe
 FABnP1WC/mrkrNwFZy8kF860PSV9tW834UbCmAykk7G8yJ7YkhZXhEd6Q7Kf7fw/KT4g
 6MifMGHCHkR8Ai4KPY1/YQU9fX77kcbSIOqwakOEGCZ+RD8S48AURwC23pfZkwuXCcNy
 89uQ==
X-Gm-Message-State: APjAAAVb99GPzMBmTIVX2Q8mCqfT2VSRvdQcm13I5QiGJoJkyF36Rxgp
 4Pr6eghpH9lRo4ex41T8Kyvh6A==
X-Google-Smtp-Source: APXvYqy/xNuRdj0vQvs/4sL1fODiYHQj+T+AwczqxGkZPytjid2N4wSlezxn8X+oTdH3vdNaXnYwow==
X-Received: by 2002:a65:480c:: with SMTP id h12mr44587808pgs.266.1557945199335; 
 Wed, 15 May 2019 11:33:19 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:20fc:89b:acbc:4e17])
 by smtp.googlemail.com with ESMTPSA id
 q128sm3528980pfb.164.2019.05.15.11.33.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 11:33:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: meson: add hdmitx glue support
In-Reply-To: <20190515131858.32130-1-jbrunet@baylibre.com>
References: <20190515131858.32130-1-jbrunet@baylibre.com>
Date: Wed, 15 May 2019 11:33:17 -0700
Message-ID: <7h7eard0uq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_113320_422366_52F02CB3 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On the Amlogic SoC, there is a glue between the SoC audio outputs and the
> input of the embedded Synopsys HDMI controller.
>
> On the g12a, this glue is mostly a couple of muxes to select the i2s and
> spdif inputs of the hdmi controller. Each of these inputs may have
> different hw_params and fmt which makes our life a little bit more
> interesting, especially when switching between to active inputs.
>
> This glue is modeled as codec driver and uses codec-to-codec links to
> connect to the Synopsys controller. This allows to use the regular
> hdmi-codec driver (used by dw-hdmi i2s).
>
> To avoid glitches while switching input, the trick is to temporarily
> force a disconnection of the mux output, which shutdowns the output dai
> link. This also ensure that the stream parameters and fmt are updated
> when the output is connected back.

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
