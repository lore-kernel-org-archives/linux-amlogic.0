Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21381C5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 22:59:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E551D21976
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 22:59:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jevFy10v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ZL/zgmk5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E551D21976
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RuwIhanJhsf7jJ09Dv3KzNSCyMSPRr+F5ZXfAF7YWs=; b=jevFy10viHIBUw
	tYq3+2v1hWfIvpFIMMnK76PaqQtEepHMNHvbpG6Y/kh40S5SwVp5OD8CtpS0aB4KIsq73hgHOod27
	GTWt0AUFbln9GbuaqKRz56V1vkhBxj78w5rJr/2ugZyQJ//Erb0Sl2MiQr6FUEWkwtV9LrXLIAFFL
	WCLnASrlCLIjEm2UyPQdmzOKS+QSJ24uEp3Gr1j3XaZ1pvsInouzIxDsSdZC5Mztg8xAPvdbFsRga
	pcBPpSjld6hMLB12TnzkNd/6uKLS0fw/KHQNsvW2pVMhEVi97+By+xjTyJnGfJ+RS6iDMlF3wx+ox
	GVVdnWs+GEGi8MePDNdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiRk7-0002c7-L6; Tue, 02 Jul 2019 22:59:19 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiRjs-0002RJ-LB; Tue, 02 Jul 2019 22:59:05 +0000
Received: by mail-ot1-x344.google.com with SMTP id j19so291910otq.2;
 Tue, 02 Jul 2019 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6HvJuM18alyeMHoRBjFAJz8IVxm/LOrt6nImzFK3lsE=;
 b=ZL/zgmk5C6P8mXBb7AQ7vp5C1Xz9VF3Onrg6rH+mPkYfq1bkn35Xn/20CUxdaHn/Ba
 As8W8rj8MO2TPxJbLYAsV8Zr1JcXNxcB7S3nTswhG/q8JMEduSCQJcmZLLQ9zOQSQfyk
 kx6R2lLIgaUoq7ViMRDuO36Wn2pKUGkrTuOcSp1cqtLZyOJUPgX447cc56NnfWuKJcvy
 dk+DNAVbg9S/dYMV8QLSIJUIMiqtDPDb9aFykMXk/YpOwSbjg03XRU3rPcXWYsTdoOjF
 TQXzWG83z4s362gpdu9ENdszdpz5ERCO3qPD4xQdAvzEluLxpKpd1AhOMkZ7qym/hOma
 +DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HvJuM18alyeMHoRBjFAJz8IVxm/LOrt6nImzFK3lsE=;
 b=ghfDzGdTHxlH5gl+n5ydN1gNWu7aypXYLjXRMPL8SNspazRKIuIVkjWlPY4AnbMb70
 V2qnpIB/Ot1H2PaBapeTvZlF7rB62MYG9Kr6nGLYja8u6y8EGpYIpQFL2oaNC4JiOIjh
 UP1bRYhlGEhZY66s7QvsGisVaZseV+950UQ4yTddW7wGFfVSmnzZ8Gpr2zjYyZfMuo76
 JQBC3RU2ZNTatZYpLs2xQMorDJhcg8rtl6F2/HDh8lpOxCawi78aQKZZ/ZfKCfelSqig
 V+he6pBdJXs3ONQpUs9PfkomQ+ohWty9cc6XiwdnauU5QzrBCVvr0DWMT0tTECroaLFR
 cXug==
X-Gm-Message-State: APjAAAX7TVcJS77kqiDcPfkDZDp8SQQkEaTl84Jco2OrUNKOXwY3QmeF
 xU0IIK7T+5fYGUxSv5K6W7XL+0fyAUCL4KB261w=
X-Google-Smtp-Source: APXvYqyZYeVdqlXDt36fdhfbAYHQ2O+BsFsPr+MyhLgpJe6VJlBkHeJ6Eta6tLBIetsFlmHLbT/xvN+x6/atColGNo0=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr26108783otb.98.1562108343442; 
 Tue, 02 Jul 2019 15:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-7-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-7-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 00:58:52 +0200
Message-ID: <CAFBinCBdB96e4PzxNMbOhuiRrxGz-4vRXu3dOs7n86qoA8MDeQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 06/14] soc: amlogic: meson-clk-measure: add G12B
 second cluster cpu clk
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_155904_724881_8D2A8F36 
X-CRM114-Status: UNSURE (   5.59  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the G12B second CPU cluster CPU and SYS_PLL measure IDs.
>
> These IDs returns 0Hz on G12A.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
