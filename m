Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6E7C7618B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 13:25:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFAA82190F
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 13:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8TZwPN1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D5N9xFES"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFAA82190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbh+TWAJY6WAwtop/KlZ8e48+9bu/qvor8wvd7Vtr7s=; b=J8TZwPN10kQFZW
	zefVJuOY11z21LUSzb7WhYVKFDgIYnpJCC1YFYeG44jdinztz4DopihEtW+shLOeZmYWugWCGTcXj
	Ax2xzgFRMW6h8VHeEXkN7TIpj1piyA1SvjThPcJ6yRhc69hEwQUfJfYVh8X2sDpmAjmRxvzGwXDuO
	KtRCIcjfn13ky4JaBMeLXJkjEzjZt48tIDuyEEGmqK1IqRXOo7qDRq5/m+BUDBmjQtTblhpR8UC8f
	JwvZiIryFBh3w4uSrjd3ADNRoiHdgr2W6d5+6PPgbaAxTbAvq1szCG4XKB/EKhRBmStqyYbm3gAMK
	z7T10fjVUf67/YquzbPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqdkD-0002Xu-1g; Thu, 25 Jul 2019 13:25:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqdk9-0002X8-W6
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 13:25:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id s3so44990350wms.2
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6aDJ94uyyhxgWSyExse9QYlquEyyOJ9JE7SxUePnMhA=;
 b=D5N9xFESPh6uCOxGlZuTzAA4mb7oWHRhDyTjlYtFlwi6bJdhcbNT5E59VtjKhctWnn
 WdkJDf7qZM6dH8RhDOONw43oJBVvhk44/kZjXkF71AncceV6SsngmzIu48GsS/b2XqQo
 l6JJY+duWSKVwsmsptTyrXnzjpENPoQ2DL8Q3TcuNpihHyUaeSlxw+onu3zGEpFbnT91
 hHoJO8pSkk7svMhzZo2foJg5rEyD2QvGIQJTsJJXuAkUenK4O9J3vG1S7kxcH7aX10j8
 FPkQCcXcehBkj79s3Upnry4gyUmatXOHp1WPmbIHRGmmXDWYeBwwQWKnqvK30Z9kbiR3
 eQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6aDJ94uyyhxgWSyExse9QYlquEyyOJ9JE7SxUePnMhA=;
 b=aEl3YaK+LaUAnYApeiNN+TpAOaPzjByjTRxqYXdeoT3gpdyGdF1MKFLBRiAeMHFTlr
 VucVM5Eh8KYglaOQFQsVsCyhuqUhTtvLep6Pmy/cQ0tIVCLj9dOL8zVIrGomr8NWwM0A
 wL6W3dZpeld1S91AogdUk9cKQedJj6xy/7dmydvP3gjcsICSJpOxRU2X9geJiYXR12Hk
 tcKD0aAJmagbQ0gSx3OMKe1Rras2/MIKIxPt6/VG3ktvr5teG+4CcWiebATO39wq9JH1
 uCIFeMbSGHwwwn4qW06XClVuL9i+WFb0fX0UttxjRE1dBCeEmHWHYaZqdzKXE4PBwDEb
 09SA==
X-Gm-Message-State: APjAAAV081qoq7FATk9EyNqPB9lJ9Dhq5T0n3uDGHuCBkCJkDHyhIKLj
 9OKLirAbJQ/mSKEaVL9HcgNhTA==
X-Google-Smtp-Source: APXvYqzkB7UJ5b3t6lNCXexFXjlZMe0BgyF3qfh59IwBeXFA97QLF/U3xl/ncqsPvbVWUg8lQVWfpA==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr15113128wml.124.1564061111601; 
 Thu, 25 Jul 2019 06:25:11 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h1sm35852177wrt.20.2019.07.25.06.25.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 06:25:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/6] ASoC: codec2codec: deal with params when necessary
In-Reply-To: <20190725125534.GB4213@sirena.org.uk>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
 <20190724162405.6574-4-jbrunet@baylibre.com>
 <20190725125534.GB4213@sirena.org.uk>
Date: Thu, 25 Jul 2019 15:25:10 +0200
Message-ID: <1jimrqxn49.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_062514_036693_2861B166 
X-CRM114-Status: UNSURE (   7.01  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 25 Jul 2019 at 13:55, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Jul 24, 2019 at 06:24:02PM +0200, Jerome Brunet wrote:
>
>> Also, params does not need to be dynamically allocated as it does not
>> need to survive the event.
>
> It's dynamically allocated because it's a pretty large structure and so
> the limited stack sizes the kernel has make it a bit uncomfortable to
> put it on the stack.

Ok, I'll revert this in v2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
