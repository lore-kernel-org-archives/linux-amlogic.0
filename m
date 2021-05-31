Return-Path: <SRS0=NF66=K2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28076C47080
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 19:19:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BE761186
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 May 2021 19:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BE761186
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HaciT8UpS59+eHn78OCc1OW97JXotIUMZ2MCVY280gY=; b=P0wtkK1uFc78qB
	gFWtrm1XsarFJeWIw1W3eN8u3/BUDoaBV+ciQJP3/3tkOidhRvDgZtsZbTHnQbjJwAg3+5spaB67y
	EnZHqCl/HKa6H4lEAKAr5IQVeU8MNTLAseo453Uqljvc7mMs9ETt02CBXZYUl9nycedhSJh8/Je8N
	6k/CECkHMoDPm9jBcyECwr1dzVbSi3TJmGs7QN+T8mlhW6Si+bZz/tQBw63oL1j4xcJZOzAj+e8z7
	nedwUkPJHe/jByxZiY1OdKpU1EeRSLP3OJSJeoR1MsDmznZUWje6BUiZtoTVtH8zgMkoZaFVrCXM3
	75STCpWkd0zbDocU1tJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnnR4-00DET8-UL; Mon, 31 May 2021 19:18:50 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnnR3-00DESo-0I
 for linux-amlogic@lists.infradead.org; Mon, 31 May 2021 19:18:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id b11so7742950edy.4
 for <linux-amlogic@lists.infradead.org>; Mon, 31 May 2021 12:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7MlRZFULg6TaiKI56KQT4gwNq7JAVuH7fSlLYXsRWrQ=;
 b=gY3f2SHGJ/fPHyHenktzMjpq3du8P8CtUOT1H+YjIff1+fVvFk6wzwOgvEbRqUeh4v
 UFoy+2QR7eSD0/2J4giGL6Gqz0qw981Pg4NqEkhb2BnZn8to25yqduSoIJDvfJwR9Mg2
 3wjB8ZAKpMBVnybbJ1Hq3utLtFGT2zYBtylUD+d8TPN2C9l+lloU48XpVqArINmWnZ+G
 elNodrLD0MkA2xRo/fo7dVaCxrRfF+0++t2BfNpJ4xYm2M6QNpc7olXF2phd3xEzQwlp
 XZ1eB9CRYQc17njK9s+Oc3IlLrtxu3D8CR7W8PpQcuTxR/T3AUeZGw7n/MxNoVMACg6g
 fruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7MlRZFULg6TaiKI56KQT4gwNq7JAVuH7fSlLYXsRWrQ=;
 b=VJ7xkPiykWJKl2dfXvFZO77NlugODyMrosl3gD/7oN9D2WXLdJeO+vcnSgKRxV8PMI
 kGbJGTHWt75FS3YQaHkNPqoc49VbhjNDr/Tc0UfkkaPmpxWydZgpImBhFe1KQwI3LdTO
 QT1qPBY59sz1x/EwDBD33MrAXQHWdYzq3tE24yR0a1wmq6OOwXYqGVSzoTj+rTJUzQj5
 HNCuUkXgi7fiWA921HEDgp6o1SJd6nVeEuLW0ftY3BjuWBl+Af3R9Dj0DPZip9ahSSk/
 bY1l6bWWw7DojWYwWz26WBIeYAJGY/8C5xuCkaCB7ApIQ1+pfHnjX1rf9oeRHNVr2Ucr
 BYcA==
X-Gm-Message-State: AOAM530Px/5Ki2xhTPCSESdAvdQrwZ7fzb9IQffltnqki16+ZPd49v2r
 pBX1TTFZdkT98xbKd5CiV1fNEc9ScyFm0godNaM=
X-Google-Smtp-Source: ABdhPJwZh4D3XMFVXoa+L7htlt2XQga6sd1s9ibwiZklZyG4hC2/SM82sy/ZgOJJln2+btBibnwsPIoWBkWTu/uvmlc=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr26963033edu.52.1622488726441; 
 Mon, 31 May 2021 12:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
 <97572f8e-b5c8-4bc4-8348-a3c284bd9aa9@baylibre.com>
 <10e38e44-1634-e92c-8aa0-b515f9c149b3@baylibre.com>
In-Reply-To: <10e38e44-1634-e92c-8aa0-b515f9c149b3@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 31 May 2021 21:18:35 +0200
Message-ID: <CAFBinCA+nk3ARBST=OPquVantdKv2gJumi9QG8CpO6jBSBD4wA@mail.gmail.com>
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, 
 khilman@baylibre.com, carlo@caione.org, 
 Beniamino Galvani <b.galvani@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_121849_088160_3F5CB45D 
X-CRM114-Status: GOOD (  11.13  )
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

Hi Neil,

On Mon, May 31, 2021 at 9:20 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> >> Personally I vote for option #1 or #2.
> >> I have no strong preference on which network to choose.
> >
> > Neither but it seems the most users have migrated to the Libera.Chat channel, so I'll be
> > in favor to switch to libera.
> >
> > Let us a few days to decide again and do the switch early next week.
>
> I'm still in favor to switch to Libera.Chat,
7 users found the channel on OFTC
28 users found the channel on Libera.Chat

so in my opinion the community has decided
That's why I am also for using #linux-amlogic on Libera.Chat as our
main IRC channel


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
