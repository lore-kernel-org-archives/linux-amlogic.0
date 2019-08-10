Return-Path: <SRS0=P2sN=WG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98293C433FF
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Aug 2019 00:12:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EEB20C01
	for <linux-amlogic@archiver.kernel.org>; Sat, 10 Aug 2019 00:12:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ndTyJFF/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KECCdmkn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EEB20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlfOLAcXd1yng2WA1z3hC2xFkVepzf4iRk59V5zu5t0=; b=ndTyJFF/e0G7Qp
	A7X36+cCf43/cU9iNh7Y6rc1dx3Auq0jhX9kbAOs1i+AR6FkzlXdsz6X/6q60pfYaMy2UP+v8h5NW
	7w0lBa8zc9ZgxMvN4q+Iox7T5o+eK1V/ZUe2FAMCRMVmPE+Lh0KeuN05YSzDhRy8zL9r0m/UZ0sWx
	Gay5t+ZrXd+U0HicFnnX9a1DCdiXib+q0+db7A0NaK6MyEoRJC4ZYUKqR0gBUfJdqTERjhxJmbCqb
	hvY+Vq+gwf1k5cnbO4JauZPvwigNO1bqBAIG8sfJgi//xOGt2nI1jKWdmVnjZz5e7XQ3+0DTB5R/l
	3cipL/1YMmvpT7IqZByg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwEzA-0007qo-N9; Sat, 10 Aug 2019 00:11:52 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwEyz-0007jO-8i
 for linux-amlogic@lists.infradead.org; Sat, 10 Aug 2019 00:11:43 +0000
Received: by mail-pf1-x441.google.com with SMTP id p184so46861670pfp.7
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Aug 2019 17:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=EuQ/R3CppOBh2T1D6FSE6/gAUMLd+emlPXZ8P0KlK4E=;
 b=KECCdmknzaH0Ve1akzRhLGqPfYzLSqiQZzqIGqUTh+SAcO6Q19ScBeUTVGmT9Kn2fi
 wuc/H+9Zvt1RiYlS2YMjELwda9ElQG3tetwgpwSLKyc3GMze7p3oJ/iAFf+mlr04fS3p
 4SoG8g9Vg49LMc+XN9CN2yjxwMYkHbcBup94eMKinNVLCmVJIOstAPR1bTlg+BvjkpIY
 cd36ZXrgFEWiqQp6BRzMLy0rpNVl0ji479pxHPF2OWsm4aIthkJshQrCEUBBzGGR6KqN
 xCB5+OxoXjeEhzq/eUA6LgN2F98/tP71hoMrI7Rz306vlRZd504t0Hj1N10xjJOIG5GQ
 EZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=EuQ/R3CppOBh2T1D6FSE6/gAUMLd+emlPXZ8P0KlK4E=;
 b=qwEzVyC8j1iZHPZ4mk+X9g8f5dwYjZPUqXb/qJ2tq1K6HlYU4mFWS6S/eX3fyQsJkk
 miXE8My91HUw/Dk5WUMSF5N2McH0RaX64aSQPSKENx6qw0hKtTGBGX7U0Gdxci25kAL0
 twtQVCvEnoOnRGCeDD+IiVThY6RH2G8Tk2aJru0Vyhr8X3G78Q37FJhmNtZ5RVcwQb/o
 D1uMRuxRZ80cHRb/w1Vdt8oX8DOYrhyDExtKkhaXfEZGDCyimwe2E/U1etg+tPZXuGrN
 1vSrg8JIsp0UGA0uSdz0riWBvsGj5sh/Fk3/aybarK0PWRYW2/SpiYWYZTLj1hSXXHgA
 FpBw==
X-Gm-Message-State: APjAAAU9tHg8Z7ppPzqtzpf1dagxSZYKF+Mg5g5vXoCTpCVOmUB2/y26
 ZmTn7Uq0qSP2bWeQNCZxLXH+EA==
X-Google-Smtp-Source: APXvYqwfo3bJUKvTH7g4ZfJhFp6Q9sQXhh6NsNs21MEaB/aVJYLW2l4lX40Zlrs3JJt56T2EbsbNBA==
X-Received: by 2002:a62:82c1:: with SMTP id w184mr24770723pfd.8.1565395899475; 
 Fri, 09 Aug 2019 17:11:39 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b873:707a:e893:cdb3])
 by smtp.gmail.com with ESMTPSA id k14sm25201452pgb.78.2019.08.09.17.11.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Aug 2019 17:11:38 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
In-Reply-To: <20190806130506.8753-1-glaroque@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
Date: Fri, 09 Aug 2019 17:11:37 -0700
Message-ID: <7hd0hd3mme.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_171141_449983_A4355511 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume La Roque <glaroque@baylibre.com> writes:

> This patchs series add support of New Amlogic temperature sensor and minimal
> thermal zone for SEI510 and ODROID-N2 boards.
>
> First implementation was doing on IIO[1] but after comments i move on thermal framework.
> Formulas and calibration values come from amlogic.
>
> Changes since v2:
>   - fix yaml documention 
>   - remove unneeded status variable for temperature-sensor node
>   - rework driver after Martin review
>   - add some information in commit message
>
> Changes since v1:
>   - fix enum vs const in documentation
>   - fix error with thermal-sensor-cells value set to 1 instead of 0
>   - add some dependencies needed to add cooling-maps
>
> Dependencies :
> - patch 3,4 & 5: depends on Neil's patch and series :
>               - missing dwc2 phy-names[2]
>               - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]
>
> [1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
> [2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
> [3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
> [4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
> [5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/

Thank you for the detailed list of dependencies!  Much appreciated.

With all the deps, I tested this on sei510 and odroid-n2, and basic
functionality seems to work.

As discussed off-list: it would be nice to have an example of how
cpufreq could be used as a cooling device for hot temperatures.  The
vendor kernel has some trip points that could be included as examples,
or even included as extra patches.

Also the driver patch is missing the two main thermal maintainers, so
please resend at least the driver and bindings including them.


Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
