Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150F7C07542
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E19C121479
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 18:08:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iHX52p/z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="gIoH6vOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E19C121479
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpCqEzmreOMnxJ9SkM+Ij9NegSYTxqBHJ7FSKOdwN60=; b=iHX52p/z2fr92h
	FRkO1k0BDxZvBxhSJK9aN8WfrkKbWh9zKldj0I7yPa2ABGnd6+v4G8bJwl5/JePct2JUQCHRh3hpr
	v6xVCUlDPxy1SPd0utBqQuEl5kXkOZhVkLvGaQJIGTYXA/0gOXyMrTeGHDXo6wZlcIahplFwAoYcq
	FRVPNZ3SC8gono0rWY+zBvgMaSt1vVTdvVtxjMvwKVrMY/sQDW7QfD1EOTzDt3wb6fKaN4JRp9cCB
	N4j3eW2glrQa/fwQk2+gJxMH6Gk375oq+ZdfS5wFYJs97HANVooLK+1nqhsQPnK0bD9yPayFrrjN5
	Yrs22l92w7co1Db50ZQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVK2P-0005L7-Ri; Mon, 27 May 2019 18:07:57 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVK2H-00055R-Bw; Mon, 27 May 2019 18:07:51 +0000
Received: by mail-oi1-x242.google.com with SMTP id q186so12448245oia.0;
 Mon, 27 May 2019 11:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kcaNvQthNDxKMvADNpdrHbGy7J+JNlWa1s2SqBcaEbk=;
 b=gIoH6vOWf1CUM7ihI4sZTjpRSzfhaHBkPyAifCAnj2KxZUk0kXB8nO9b9zBjtdIt82
 FJcq+ZakIQnwNnpacSYY8Q9XZ3kACUtY36oD5HL1S3gSqZ5vbCeTUuOwZksxbVTsQSm4
 alcasRAamdvLQYfcwt0PAKg1PMsEMaFSR8c2KJJ7H9g6GRtCYe84O3SbIcFrD/IgmdV5
 8e8aFqQ59bLfBtQ2mGJnmcoeHbKaNxkaB39HeAujNjA4qO0ZKPz32/PgFt1tq2ZGtFqD
 xkXhwYlpGhGgJa/+4y95Yt3riqa9me5+sGtg3lEwM84SJ840aVDldMz+OEol6TjSrWyy
 AuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kcaNvQthNDxKMvADNpdrHbGy7J+JNlWa1s2SqBcaEbk=;
 b=Zx7Hi5af0UKsEtOxOq4oXfYDguJuLyRReHahZ9nsueN3qvJRK5Knx2RNepkoT4cTGi
 siscCqabTtlLSc2TxVq611rRnbz4m5qE4rPH8TR6/kb+kXqrCzcfq6YC8nNCNM8B0V+R
 lj7ibL/dAICuSFf7wiDzR2FCHF+GR4DzUypXRDW+Op4UgBwiP0Hwr+n31W26B5itbB6l
 kv5aKbu+ALI15Aew4K3QX3ErPMBDncofbWktgeOns7Y2MUKw44r2+FVUc+6Hn3q/HDv7
 OiV2git3RTKBrlXFBcM7cbXWAxJKTt8ueY7ZGpqLmWW5l/HAMPbxro9/aCOJu+KL+1Ag
 xmCw==
X-Gm-Message-State: APjAAAUAGn++whHGEt7OxysSLFgoJ89NQGa2JtAHyMKZzJzOw84aCm3z
 onxyapnHZrNIm4t1+kKrjCt3NevdBsst481EmCJ/G7Z8910=
X-Google-Smtp-Source: APXvYqyKJgVpri79hGrpfwOvc1XUZLuwonSoBLbzelPi358W+vr2nCgaFj9A+/DdmdxrgBHpTBcRgN+TmPll0F1fK9s=
X-Received: by 2002:aca:3545:: with SMTP id c66mr135571oia.129.1558980468560; 
 Mon, 27 May 2019 11:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190527133857.30108-1-narmstrong@baylibre.com>
 <20190527133857.30108-9-narmstrong@baylibre.com>
In-Reply-To: <20190527133857.30108-9-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 20:07:37 +0200
Message-ID: <CAFBinCBPH6pwxOEVJaJxpEqnbi1775a15Ec8Ac53nVpa6+8-Dw@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] ARM: dts: meson8b: update with SPDX Licence
 identifier
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_110749_476123_69D4753C 
X-CRM114-Status: UNSURE (   8.26  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 3:41 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> While the text specifies "of the GPL or the X11 license" the actual
> license text matches the MIT license as specified at [0]
>
> [0] https://spdx.org/licenses/MIT.html
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
