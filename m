Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0460AC04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 16:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82F02084E
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 16:30:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pMR+Aa68";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rcpIKEhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82F02084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4i2r0CFsBXJ4Kapex0VHf1+t4WUuRAojqBgwuA0UbEE=; b=pMR+Aa68yjc4/B
	9PUmA+TFgbd9f7M0mWR58UyNHYlpGAcCGn0QJVFRYF3EzqW2DoGXG78wRSEnxPueMT8SZDLgz8cZH
	LGT0YZlkrLdpNSy8FkTihJTcOCYYKb01b3Im9bHamUigXIzb4z6NimhqfOq0purrFJ0nto+tbNTae
	fdgHykOZSkufJ6R0yZkU2AG0pG4tjxsZM/Qhe0Lz7V52lQZ1O82bhHjiQ2uUjKekOrqjojjSc0MQc
	rxQp1APzCHa46CUzDjH8/9L9hbLijX533WGIpX7eYTN+U8XNYSTi/gTnweTqodiQhDMiaqZx+YYcw
	ISCmWepRsQ/0EfMAMm4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPUt9-0003Zm-6Q; Sat, 11 May 2019 16:30:19 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPUt6-0003Yx-4k
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 16:30:17 +0000
Received: by mail-ot1-x343.google.com with SMTP id a10so5947198otl.12
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yijEGAnLVzr4Lwt1Vrh28KdYgoNEEafxViUlvjT5JGo=;
 b=rcpIKEhZNdOQzU7Czvong9jUlaMpccz8Y8FA7g74NbJ4E3DL3/Eok7D+GPUNjDKrzw
 DNFhPckx9I2EBS/t4G/aL65d6TDuQuGr5cuBkpiCCJVTvrFeiKgHL7YBBJlKttb84QgV
 3XBDCzPfHy23MRgt1XNNYXxto8XemP8nZ6fvFrUpDWSw2Dg78eEfm3wjtoUmn70+wZcu
 cPEvgPdRK31bxUGooJRfRaXSGxKNRgg6DVpJ5ajonvPB//UcuXs8thQKYvu1B5MpQOfJ
 tQEoY83DYwN27MerKnJOVmawXSq5+awGKGx7/8ApmZTdYEAlqFYTIAVUqg7lsOcb8Dan
 ZNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yijEGAnLVzr4Lwt1Vrh28KdYgoNEEafxViUlvjT5JGo=;
 b=p86lHP6UrV9/2+s1JOxEvlkKv5X6+hlCdk8CIG6MOlqp1Z3cSxzrCAgfnggnbNSahc
 dNPfqKyq6njVVpahNVM2Z3Q1jcOzL5iSUz0chFNqcyS5NW2/1mk+SIB07ZVhSB62/o4m
 +tpkcBPmFRdjytOnEsuSiW2axGa1i9lYR79L4XvpVlEJ0w5iGGy3e6bQg2H5ccsFLGRs
 QrtRicrF02rlBwLQIo7jq15zH2qzBHGddfFsN/Vs1DZLqXztD4ETDDlUOOCMOGzny/h8
 bLPdWkhpeWDLaRExOJc9Wmv7sC4G83hGGdUI3pqqIIYAFPoaQhXkXBF62LWFRL74wyB3
 oYmQ==
X-Gm-Message-State: APjAAAUaa4HTHQnQWegnl9jp0h66+7ELAF5uYedK0QzwtnRuD1qEg3Jm
 e/BOoAlHyn8Ji9nf8IZfxRLCDjZdC36INaetE/Q=
X-Google-Smtp-Source: APXvYqxFpF2Vp0nTmlVZJemYyfFM6MjceS3IhH2OHGnJaC6ACavQCXa8yag/oqTVRe1PjzlLeyiOSEIbvfsU1UqGrCU=
X-Received: by 2002:a9d:76d5:: with SMTP id p21mr8248186otl.308.1557592211780; 
 Sat, 11 May 2019 09:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-7-glaroque@baylibre.com>
In-Reply-To: <20190510082324.21181-7-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 May 2019 18:30:01 +0200
Message-ID: <CAFBinCBeh6eUQFFJ_HTzEtnrsoyq35QKfG6NpZF51=euCBZ6sw@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] pinctrl: meson: g12a: add DS bank value
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_093016_244956_835BD591 
X-CRM114-Status: UNSURE (   5.68  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> add drive-strength bank regiter and bit value for G12A SoC
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
