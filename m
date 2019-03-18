Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E168EC10F00
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B12FA20828
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 19:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gyg6lpJT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kdspBq6L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B12FA20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQhOGVg0uqVKRkzTmYtUlkDw9b5mJEEjjrafxOs7Eos=; b=gyg6lpJTFAudpO
	u55idC9Jm11Jldcfo78qR7TxRwaLW1DwHasgPy5dq/c8DzP454k0fkygDxTbbrz4t4uNw9l0yonIp
	JTecWF9jnpU+OzsnUP8VUTCXOwC+oToPFVhIFy2ETrNJfgtlDG4/JDGZQudPkThPz1p29dOSGhKyX
	wrPY2byxWPcD8JdMDA5ljZhVitYI1z2FUsBuQTRS6Lu/68zwNqt1Fw8y4SdB9YMF8DswjHc4xz9jC
	q+NWdT0FWktQmiTCvf+1uczXHKSMgmZR0tbS0LdMWArPGml6wM8ynXS+oTaL1WLAucv2aD/TC+VIF
	1CzGPvxShnyfTmT6+Xcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5y5p-0003EZ-9T; Mon, 18 Mar 2019 19:38:41 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5y5m-0003EA-MD; Mon, 18 Mar 2019 19:38:39 +0000
Received: by mail-ot1-x343.google.com with SMTP id c18so15487401otl.13;
 Mon, 18 Mar 2019 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hpPMovfbLs9/tBz0zB96XqyHPfbK74z+0dXPs8hdsmI=;
 b=kdspBq6L2UtgufwmsQbYUokgX25Rr/pC55XqnBbc1LxBNyKZ1AVdQmzvNkVOSP5D6v
 E6iVofIlgSrRCKH51DioH6Ssb4/0woqAok7RqQkZkneeD2GDGJP9vFwVjOq5vtK/gnkS
 9V+ppR5XagtoOZQ2DnnpX+IndCnrC8uptTyIfzUaqeHHiGFC60hmu1MKJ5FJkUkIGLsJ
 OIsLGKHyTsxidmEgBd06YNn2/9WXE8rDfHV/9m2EkFeKPXSdIerCFZcrnNbHfsL35gpD
 tIOzcCS2VoBymMnbTkl4c5g/trzh3yGO3HsC4t2EBupTKr6bd89vu/EO+2yAQDvaSM+8
 kg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hpPMovfbLs9/tBz0zB96XqyHPfbK74z+0dXPs8hdsmI=;
 b=joca8YWREe6uNg3+FMACt1W+FELhRSlY5/syZaKEwdeDV1tI0YkvvOdCR9Fi2zkv4t
 bHfPP+xlaZYX7ejTEIuCxRmaos3L3YJUy9FyZ9e+WG829fmfBFkCLlBcwGjD4pauqro4
 pkAhEgqgWdZDwb76zv3Vjoyg50scVvCbpCiG8WIfTJ2ddE1usacHak9/xNoQ3vKXw9jy
 PZ1P2Qb8sZWYGo0uLSEpQmrNijekMQRrn4kY0d4UFVFGge0l5ATkn3qKtEhGnNI4gMSw
 ikKFMGtV/GBFb0QZrJnFqt28gwA48k0/ixf80lmqWnjVAqlpFd8rT8SNRbVWCpbT54NA
 t2MQ==
X-Gm-Message-State: APjAAAWfhLw5LUmU4bI4T3GpePp8aEGVg7DqoK/rLVP3GHfyYo6lXKgB
 mXdd5vj41wFMfdYDm3ueqcdpkBq3o6x7ikuibfFuqWjl
X-Google-Smtp-Source: APXvYqw/5WJXX8RisMxRxRIC5eSSJ9m3tBc6GyhLi26aoXIhtKiu024QjOSIqkGcrswZErmlFCTfMgyqUgJjar+ELAE=
X-Received: by 2002:a9d:6306:: with SMTP id q6mr11239674otk.86.1552937916954; 
 Mon, 18 Mar 2019 12:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190318095851.4062-1-narmstrong@baylibre.com>
 <20190318095851.4062-4-narmstrong@baylibre.com>
In-Reply-To: <20190318095851.4062-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 18 Mar 2019 20:38:26 +0100
Message-ID: <CAFBinCCjfGJzkLd3C-R4VM9fwKfrA6gT511CFkERcAyyvApXzA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] arm64: dts: meson: g12a: add uart_ao_a pinctrl
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_123838_751549_3DFF20AC 
X-CRM114-Status: UNSURE (   7.35  )
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
Cc: khilman@baylibre.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 18, 2019 at 10:59 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Jerome Brunet <jbrunet@baylibre.com>
>
> Add the always on UART pinctrl setting to the g12a soc DT.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
