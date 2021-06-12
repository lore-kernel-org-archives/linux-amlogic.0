Return-Path: <SRS0=bUyK=LG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE7EC48BCF
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5250461182
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Jun 2021 19:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5250461182
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AZwVDrH6Dl7JIJxvjazRv1IXj9IipCLoYijfUjUDVZk=; b=JCjvFQRkyMGnwH
	vM1o+soRe47orxC+DLNce/LqMa8nfMfLiO7tkTOeHBiiJ6jMv9huZ24o0VksctYfswAYNDD+mG7gt
	vbMsHeKYiRFzd7Ym5u99sdj0IDWPJp57bE0s+yPQftB8lEjM7Z9+0vDrNbvQywYiH/N8BDaK6AKMG
	gyw8XhOBt5Z/FTnm26bupOZWlHhxkK0wSAnP50IEzxaxfTjNhm6LlpcT+EDTq3iTahZLIgZiOpN8k
	D8xzWSRPRpB54y0TQEyFDSw1+U0wH3iSiWCE8qa7dbp2e2ajdljHMBHykhAD67iTuOTH2crQnHLP2
	R7T8k/2FiJseQ2qzE5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls9eN-0094K8-TQ; Sat, 12 Jun 2021 19:50:35 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls9eL-0094JO-Da; Sat, 12 Jun 2021 19:50:34 +0000
Received: by mail-ed1-f41.google.com with SMTP id w21so41081166edv.3;
 Sat, 12 Jun 2021 12:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HU4M/zWvYHA9MO16eRl8/ZC5Nof0nEpPAE4d0u2Lmi0=;
 b=S3fOucbKcUPLAyzZNWGGqoTZWAUZT6Y1AiMxQdbenxH1CfIxYInNRTTReDXRbZu15O
 nfFO3/JzwLC3Va/Wqiqvz1cD13tdlCIjIAfgMH8GADGHqYOmbBeEh7YnItuciQ5QP3s1
 eY92K/lGmJfnU8yPTj1MXzX7RaxeZi8hK2LqEHXKtJhe1ghLLv1t0S8OWbLC13ylQSDz
 oxJfrLW7RLv+d8u0GhhS8M2UbkUN9aEAeXOSAjWUrP7QRE2IfW9955WWTTy/YGKsEKF2
 9c6oQHD2QFtbhym+861xmLATL6A8P6d3ASuxm4T3mN4laVn86Vuu2zLMrk23zhYnWqpu
 nFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HU4M/zWvYHA9MO16eRl8/ZC5Nof0nEpPAE4d0u2Lmi0=;
 b=TqB4XYWoGZFt97xVCkt7ji2fU0ZUcdyhdpcZqehi8baITRnfBvszgamtGxiwaG2rne
 AZE9oeHoK1OjPCbv6VaCurUC/JUCBIxzvjwgf3j3H30aKM3CHUwdVOW91fOyq+moYrVM
 UPAidJoH0/+d1Ib9TrNxk3J4lae6+W2GJrGTafdkg15lH4YnFqnKEQir8wQKHdRTdon1
 tr+9JGYfpL6GpwbZrNognLOl45dOtUYmvohRJ45N9CLqoQ92kX133oMXlMwihfUytQwm
 1XOKXhm71uThu4C+0ht3nzDbKPeQftfwG4rs9nV8wgTtVpeN5zK488fw+XF/+GctqB/C
 8xsw==
X-Gm-Message-State: AOAM531QR8GvLTgAz4dt9WRFHCT3fVLzPW14knLBNuJA1IsItmzB1kJ6
 qcE/LgbI8LshBoSSRVJqEYnIQS7N0H96UpM2qks=
X-Google-Smtp-Source: ABdhPJzGK0E1ZeKp+M2Rz05vQ3XOOQKE082kbFcrBpoa0ot7pD501i2KToyWEaOQZ4TlsbDB3t0KUxPQPYpbYXAHfuA=
X-Received: by 2002:aa7:d755:: with SMTP id a21mr9953685eds.146.1623527372009; 
 Sat, 12 Jun 2021 12:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210607065435.577334-1-narmstrong@baylibre.com>
 <20210607065435.577334-4-narmstrong@baylibre.com>
In-Reply-To: <20210607065435.577334-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 12 Jun 2021 21:49:21 +0200
Message-ID: <CAFBinCDMGJRsCQde-MB-mbU2qdJ9qnOUXo0SqpsDkVx1CWoeVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: meson-sm1-odroid: add 5v regulator gpio
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_125033_485138_56A53EC5 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jun 7, 2021 at 8:54 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> As described in the Odroid-C4 & Odroid-HC4 schematics, the 5V regulator is controlled
> by GPIOH_8 and in Open Drain since this GPIO doesn't support Push-Pull.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
