Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F58C04AB6
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 17:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 375FA20879
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 17:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XaZBaVb3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bgZgUlNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 375FA20879
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuffRFR4mbbhDvcyNLpUdrKNQ6s8muzZ5Pa3GvvnZF0=; b=XaZBaVb3b6Tpfo
	Yq4XmFnWxR5ZZ8PQXdZKstxv2UytqIPnatjXqjZLX0Tv03gRiaYaS2wtiwrX4f0NMK9MUArTpt+dp
	YuwPqUCdufJT11DkCm8a7gkWAKRPVrReFoN2EYHgsS6FAf7oy+9MP5zwWYljhzUXLYlLpWPq/Odx7
	CgdUxX4Oagwim/XXXlDpgd+T3P1ZSXke94dHxR4odRs4EVNrdpTFmzRj2uxPhbsYpgbje0TE47KMB
	OuuubTjSX8b36mbdO5kRsHvtgYloTyGyKLN1LJQaWJsDmcB8FTKWxIY5qziWhdYH9HBAfhnRySFUl
	24UgEppSrAQ3okRpT4Lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQbaH-0007Hp-OW; Tue, 14 May 2019 17:51:25 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQbaE-0007Ga-Ig; Tue, 14 May 2019 17:51:23 +0000
Received: by mail-ot1-x341.google.com with SMTP id u11so5658165otq.7;
 Tue, 14 May 2019 10:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oeIjbYQKQe1rgNNMG4zx8eoPc0eGIBAjjn8fpznrZGo=;
 b=bgZgUlNo3WNdcwpSQgNVohMeqfQGBnkBXDE5vnfOEbUakRgnqM/6uyp9+25kbl0yd4
 cRP51o344MRMmBi+HfIuQjUM/UI8lnEw0g4AJXeb0ZGDkuFqqwUvu5FhXRNja+UbJ4P+
 85eHR4PGQGnof9AIMN8mW4qGZJfELFoYXVY8qpxEQUDy8uSJo5c6AXqqHd0EerDNiCYf
 VHkr0qcQ1A/NbBy3GU8Up2hs9RmYTvVD2chrNX44FPDNBWp19yvofELh+c4FN1XFrXd2
 PsNSHJOJ5ezS/NKeRlluLRbBLNEHnnfAm+MV+TeOm5FDNyUpkKNvUJaahy1ETDHhUJI5
 MRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oeIjbYQKQe1rgNNMG4zx8eoPc0eGIBAjjn8fpznrZGo=;
 b=F8Ftuks/OGMAKE5FDzOpL612+5O0maCK5Mz/r+K7vCwXs8AMthtIeG0OHiqDP6nuC4
 iZbgNNVfliYf/BA+jVnJTBa1l7CAgZbMqBVByQ6zY1rTqd3oHX/NY/n8DTD0ddJIsr+y
 YsKK/jRzL4XzzrH83csoCHpCZ6WGHBLAq6WsRobFgWhg6R/dxamPuuEJCmaI9WsXPvQ4
 j0nW34hpg6mxMjRLXnhrORKvi702m02NA4Mx5IiBcwD7FrKcOdLgGbgMmju9r9+Sx97y
 BVGF0XGhorcWVs4p7kcSzSijL+K3mGfuuV1OLF1bSQS/8ga/UCdV6EfQ3mDGWnYq5bbR
 2HBQ==
X-Gm-Message-State: APjAAAW0rvUGjs92eAepvYA0XtheuIe1e4wivbi+u9vKYenwd1u2vbQl
 QOQ4KXt5sAx957O1QNQarg+nWfMTaONFW0D8hcU=
X-Google-Smtp-Source: APXvYqy+LHfc5aRuY5FakA4b+0V7yv1+nWIt3h3VKxRRI2OrJlfvSL5wBlgz3UhXafyHTlSVj4LTjzRgEbrJdxMFVpo=
X-Received: by 2002:a9d:4586:: with SMTP id x6mr17937986ote.38.1557856281480; 
 Tue, 14 May 2019 10:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-4-narmstrong@baylibre.com>
In-Reply-To: <20190513091548.16674-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 14 May 2019 19:51:10 +0200
Message-ID: <CAFBinCC5NADRuZkBiD8Zs9efNKp2fhZVqQ8aRnQ1gs+GbQCKdg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12a: add ddr-access-quirk property
 to SDIO controller
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_105122_609921_52B28BD6 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: ulf.hansson@linaro.org, baylibre-upstreaming@groups.io,
 khilman@baylibre.com, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 13, 2019 at 11:17 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A SDIO Controller has a bug preventing direct DDR access,
> mark this specific controller with the amlogic,ddr-access-quirk property.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
