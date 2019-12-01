Return-Path: <SRS0=sbcK=ZX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEDEC432C0
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Dec 2019 22:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D7320833
	for <linux-amlogic@archiver.kernel.org>; Sun,  1 Dec 2019 22:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7RYxA/B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="M6mSsQgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D7320833
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gM4DRE7QZpVAoqBTOZyMauugXUIG2HZcftaexhjA/LM=; b=f7RYxA/BsWelQt
	AyBT/+uGLOMvbSNYYzb7D2RmbC/Rf5C9uZZ851hcQtcvemU3z0HmnUj06JcmgCK3P4ZqWzHyB2Q2u
	SY8eO+wktifKYzrT2UPj6VqIfr2yULPh+tpFRrvAgBXAAaxG7SqmDND1NqVYCC0nlmgjxjGV4YTm4
	8vPq+RwOq0okp1fA+18tQxS+CbtNfQ9WvzK2FwYTrbwm/w0YpMitSLfL3vK1EOMAONjad8xOxpPj5
	1vXG+S6tzBmMwSgH6W8C69tN0qlQIESQ215T28fKY7J2VYY36s4+QDKYy6CSTMl8ul5yIXUSEutTL
	ITtUlC9ScGLCJ+AQsYxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibXZr-0002Uo-RX; Sun, 01 Dec 2019 22:20:27 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibXZp-0002TO-HQ
 for linux-amlogic@lists.infradead.org; Sun, 01 Dec 2019 22:20:26 +0000
Received: by mail-ot1-x342.google.com with SMTP id 77so8181028oty.6
 for <linux-amlogic@lists.infradead.org>; Sun, 01 Dec 2019 14:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKEklKYTxc74yeDIIDJ461WwDRlTuHaPEY6AUOAVqFo=;
 b=M6mSsQgJBmEfwwP+As7c0R5OhdjZuCgvUyD1CNLB1aBrxyiad8XFHPavJJufmLcToB
 zgDaRn9buJ79JIwJOC+lIwto8K/nOimCOLwb4IkZDQDK8wo+C7kJkNchSFNV8A4GBYyK
 AWfQ/JiqVN0qRupA1S5hwxBzyB4zlNKivSk4VFqDNXSJ9/CgVQdYS7pLhlC6hS5Ao8SX
 lYSt5JL8PMZi5UFLcHmyfhlQFOWPLCE4ZOfAhSnBW+mGVrtPxisS2D0qcWBT16iLuQYY
 mq4lEqsLZSYTQwNfxfOhQv6i4mOzkYb5f8CzQLgDkcmrTOVxF60VmoGmaXcwJEoOkFgL
 woYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKEklKYTxc74yeDIIDJ461WwDRlTuHaPEY6AUOAVqFo=;
 b=TxgvsK+vpH+MZQScO013Z/6qnPMN3DlFevOo+k+bHeTanpmsU7rL1KXxh+iuduzB0x
 GWeksG47ea5Tg1BMfVqbxiMC9m2Mk5kyaJXdAHaO2naUu7hI6PsSNahBi4d+q8Y62ooN
 Xuzs+ERnpS1ZwYgtSPDz0BWrdkkwR5bUYcRFFBLpV6LNoyTjph5xuNnRZ+qjC936CMOk
 UV2hk6O3XOkfuAoWlv1t9NTaSA92fT3pUSogagOlHel06IOeW8Q3FZ22agHvk9zvA876
 4B1JeTnr/x55UC4CMN3zo5MGTsbo1WOuWX/5pNZyYccan6g9G+C7G6eAk/AcjO63cFiH
 PzjQ==
X-Gm-Message-State: APjAAAXb95PV6zwyVFQu5d6FrJbmwvzHDytw7sS56sSFU5qxN5XxH+j+
 UGC6wc9uoltKxxXvfSEZvG2LE/BDbgWuYctIomA=
X-Google-Smtp-Source: APXvYqyfdpkFF4YhIZQRSz5QfKb+7xwwpWjgMUwb72eA2kC/+/yx1PlnF+tDpLJneT1VNUkYtsoIolusAGGeAm5vPAw=
X-Received: by 2002:a9d:5e0f:: with SMTP id d15mr18031458oti.96.1575238819567; 
 Sun, 01 Dec 2019 14:20:19 -0800 (PST)
MIME-Version: 1.0
References: <20191130195335.17740-1-mohammad.rasim96@gmail.com>
 <20191130195335.17740-3-mohammad.rasim96@gmail.com>
In-Reply-To: <20191130195335.17740-3-mohammad.rasim96@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 1 Dec 2019 23:20:08 +0100
Message-ID: <CAFBinCD=Q+z3A4wJVumKs0-hzCvSqDuT0V3tpRPL08bQaLMBCQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: amlogic: add Videostrong KII Pro
 bindings
To: Mohammad Rasim <mohammad.rasim96@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_142025_605631_A5BF0B57 
X-CRM114-Status: UNSURE (   5.90  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Nov 30, 2019 at 8:53 PM Mohammad Rasim
<mohammad.rasim96@gmail.com> wrote:
>
> Add the compatible for the Amlogic gxbb(s905) based kii pro
>
> Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
