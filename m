Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC4B2C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0F32068E
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsaAbpv3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YRJMFTxb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0F32068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlDhRv4Wdz42cNFOn1kmkBtHa//xknq3zrxWxhjo2FQ=; b=nsaAbpv3lm0dPY
	AXCNhlYywG7e0ItWsTR9eA8VnaePVPJsFmN59QV1FJSQ0+I00jjYGHMf8RZqjZV9ccA6rnMDcFLY3
	O5/k7lgm8Ne9bcioKe0Vgu0CbWzv9f0COHGZa9H70ZRD/6b7hIIAzfDAMDXBZisYtxi7ovxbjkoaR
	Zn4Dbyfeg3BAXn16r+piRjCAjbn5SH8F9SXCrTTILQxGVOabJV1PumDZFCfouLgOk+sFKi4O+H42v
	BokOnVReCXQLW1KZh4jefJtFjKBG7TYYgCOHcLfODVSV4S590tJhf3ZiiEEPHwZ+3RBcpxPsnWR+S
	Z79cxqDwTxggSoVKGyFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrMJ-0004KZ-Lm; Wed, 29 Apr 2020 18:22:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrMF-0004Ei-2V
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 18:22:56 +0000
Received: by mail-wr1-x441.google.com with SMTP id s10so3765159wrr.0
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=B4AExkQ/skCkgH//SVAJ+HY/UbjZ3z29vi0E6Yau+cc=;
 b=YRJMFTxbM0bgeSz3RuGdHJxxLuwdgSWTgLgtoiXIweL8tIX9FGlQlYaJuSUPBBJz0K
 jPCUAaMxuGVVpRauDZzmKr/3YoCbJ8dGgBs4OfNCURbd46wqVR17diEUaD4lxblwDd9c
 rsKW63ZlF0YCMIMPUQT6JYhjBEUCvhRkmQ3tlpSdKpy79JwByxKi2bPbiCo5G2U3xqLz
 bjiHLqA6rzM3UqfIv4hcmbEeqCS7uT3R8NzQ6ydkUH7wkEtNdpeSvRd8rckqycaIWWkv
 L+l9Ip1j3qWw+VwY+VJRYHlAZ2TU9W196zkfI5yFx4ESXLU5l2gnaJVEfdhvY5u9L8F+
 ZjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=B4AExkQ/skCkgH//SVAJ+HY/UbjZ3z29vi0E6Yau+cc=;
 b=c3bX2NkzZrkqyoBR8N0BW2d/nBQ5zWyaMvlJoOWz2UZQUb4dN+yNSPiW7K5hgx7yKG
 TCCjGMxfwlFxdtB+yt9fwSTLQbjM1wQeF4ongA45YvsHAuZQmdUNnQqhAeLkBueD/7pl
 j3Mb80qu8FJbYhkLzHyQYaI+Tms9+7zhMQFAPNLIq6oUlhEMsBeoHMr3A4AzubWJQsFb
 dyuNruUKC0T3+Vb375cFmtBJHD/iIykX/bu6JTyYy2ksPXxzXOnmoIgqP2DywZnNcfRD
 JRRWP2mLFEDGdklabIjwRg2rjDO5csNwGrsQoLO0NN8OZJ5nYy/W4RXLD11iHIxA4x/w
 1dOA==
X-Gm-Message-State: AGi0PuahXoZVG2brCpK76H7he9x1WT29D4hCiPkrC6QS6nvELRchnoGI
 ip1XLF+859EDT5/jil3SD2S8Rg==
X-Google-Smtp-Source: APiQypIgFkCETUKcnEqx8tMuAByNY5IhjOfevdMmAgkZMz9mukDUiKUpnYW6PV1StwGdsiqRyq/pRw==
X-Received: by 2002:adf:8b1b:: with SMTP id n27mr38786679wra.385.1588184573262; 
 Wed, 29 Apr 2020 11:22:53 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e13sm117683wrp.15.2020.04.29.11.22.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 11:22:52 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson-g12: usb DT fixes
In-Reply-To: <CAFBinCCwvfycP9VZ35Jn=yNRbgbUYkRucLPpRGCJv2XCTR+o6Q@mail.gmail.com>
References: <20200326160857.11929-1-narmstrong@baylibre.com>
 <CAFBinCCwvfycP9VZ35Jn=yNRbgbUYkRucLPpRGCJv2XCTR+o6Q@mail.gmail.com>
Date: Wed, 29 Apr 2020 11:22:49 -0700
Message-ID: <7ho8rakv7q.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_112255_127216_2BA4E452 
X-CRM114-Status: UNSURE (   5.62  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Thu, Mar 26, 2020 at 5:09 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> Misc USB DT fixes for G12A.
>>
>> Neil Armstrong (2):
>>   arm64: dts: meson-g12b-ugoos-am6: fix usb vbus-supply
>>   arm64: dts: meson-g12-common: fix dwc2 clock names
> for both patches:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued as fixes for v5.7-rc,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
