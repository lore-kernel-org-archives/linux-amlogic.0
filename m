Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6600DC71155
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Aug 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cP9FW1GgGbf707zmPcKmagqmtzF8MU2vxqT1AWCqfRc=; b=lJUZjTylJdSsLt
	jJR45ooNHvWRwKd8XVvuZkEkaLTaJ2I0VZNm67GJzQy+Sl6+M1s4gka0iLsJr9GDYP/qUSO8H3H8d
	Y0tQ5bK/ZFxtYZbdF9PCtBBlz7qWPtszGo0yJ1FpzSmGW9FBew2zcA56E+I2VEw1rChL5iC3ZFX4X
	KD8Yth4RADMLMirzwNoztHx5PYJRXk0YQ16J6Vp8ASvPxjYxAgifyOFG62A2GvUhEYQTFuQ9uFwAZ
	toJ1OWt4W6V8+angItIa1C7F3zT+TJAo28m9gIl/fljcuLuWJTd09D+/ZKi1eZapG8ngREpz3r99C
	h2EfoWmdeB1ko0oS78HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX18z-009Zbz-0L;
	Fri, 18 Aug 2023 15:12:09 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX18t-009ZZJ-0M
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Aug 2023 15:12:06 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31757edd9edso871182f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Aug 2023 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692371520; x=1692976320;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=X2s/xRCYyjUy1K7TVGsqRWzbJnVpBbeLnT8rWUMCP1Y=;
        b=RTjlX/QhEU0l78cIhdAKujxEQsa/D2b/4QpuOk2ya39dIHaBsy3EpnrHlMRBsHx8yd
         PMC951tWSNqCFTDFm8Ve/i5akuERONk/X1AXc0R2KwgM+hle8q0/n0Hy43iLWnGDESQ1
         sVrrOf/aw+IbMKp/SGtzhptwbfRdlsHVmau9wzBDHMHpRJvydIQSSOGOnNKD2xziw4VV
         fc+RnKOhzcdlX5dCD4w0Acuq9+z2NW89HNZkBfgbdn9+UYd2/HhRcG9aa/fBn2xMNE0s
         tGQgLJ9xbBKGDQbybzuMVjdkXPjLLQUBSSx4i7/TTcdCia7PgiOl2cYbkoVDk3crPbxf
         v4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692371520; x=1692976320;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2s/xRCYyjUy1K7TVGsqRWzbJnVpBbeLnT8rWUMCP1Y=;
        b=hPnsjvQFfVHxxxZ9F8WhIOlZSmijqzUyhbnufmTKvtHBJn/l17Qkpec3cxOJAL+wGU
         9vG00tHfQREvbdSztyHHPumuRMBkqPxMyKpFusdMuxB9+aFT0bDF6kPRFNlGaxb93PbX
         vK8QuPklP53wZr4Nrh+ZRXKBbZ7589OLQA+7TeLyjuBpQJmBnYpQsZb9OSSRchXUv/1Z
         /81Q8G6+CZPPTrKJonoS9S2/4QLlLPNnj1EDTKQJ1WLQM3fm76rEa6eP0fKljzyEkD6U
         rJx2apk3MEOFeb/4R7LcGU1laPWBt6YcnOIsAI5+y8unUpYOsoLt1UrvbTwbF8bKGCbS
         9RCQ==
X-Gm-Message-State: AOJu0YyaltkTbGs29dUnqsdNc+GOBEDQl5Bi2of+fW7m31baG06dL4ZL
	zCCwoV4q8tOEnouhv3FPZq31ow==
X-Google-Smtp-Source: AGHT+IE0APhUvzBrqk5iCJTooLr3caDZHn+yhEC6vK4NRlJTFzgJq1SLmCMrvpvvegTKy06BJfIVwA==
X-Received: by 2002:a5d:68c9:0:b0:317:df4f:4b97 with SMTP id p9-20020a5d68c9000000b00317df4f4b97mr2127661wrw.7.1692371519786;
        Fri, 18 Aug 2023 08:11:59 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:474a:b712:99f:cca1])
        by smtp.gmail.com with ESMTPSA id e1-20020adff341000000b003177f57e79esm3052642wrp.88.2023.08.18.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 08:11:59 -0700 (PDT)
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
 <7ha5uyes3f.fsf@baylibre.com>
 <3f437e5b-2bae-384a-0a08-216a4ec55bde@linaro.org>
 <7ho7j572ue.fsf@baylibre.com>
 <1d643d2a-2aa9-6b36-7f5e-bdd01fd2979f@linaro.org>
 <1jo7j4a69j.fsf@starbuckisacylon.baylibre.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
  Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Martin
  Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
Date: Fri, 18 Aug 2023 17:01:45 +0200
In-reply-to: <1jo7j4a69j.fsf@starbuckisacylon.baylibre.com>
Message-ID: <1jjzts9ygx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_081203_148069_EB641AA5 
X-CRM114-Status: GOOD (  11.67  )
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


>
>>> 
>>>> but even with the names for every regular case the order was
>>>> always strict. We always expect these to be ordered.
>>> 
>>> I'm not sure who the "we" is you're referring to, but this expectation
>>
>> DT maintainers. Previously only Rob, now "we".
>
> AFAIK, kernel maintainers enforces the rule of the linux kernel.
> These rules are part of the kernel itself, so they can be discussed and
> clarified if needed, like checkpatch.pl or the code of conduct.
>
> It does not seems to be the case here and, maybe, it is partly the problem.
>

I take that back, you have written the requirement and stated that
pattern name matching is discouraged in 2020.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73f76a41c4ed7def5dc2ec7c33c7e9f94e601a20

Though the reason why this became a requirement and why name matching is
discouraged is not entirely clear, nor that it is well known in the
community considering how heavily it is still used.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
