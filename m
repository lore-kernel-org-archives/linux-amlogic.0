Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51B5C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jun 2022 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=u/8UeRSINEH9/+qkmowzdhseSEqB107ClpzIhgJUKrc=; b=gjT
	WvdeE8JUcXJA3c5CDx1XozgyKovgRdbW2gp4kjM6mKMkwgiG+nVTrUxGWCfC5q5DfvYzp8Bi74L7G
	6uBl08vRWJeQJMGDI0d1bYdL/65yRiOPKoT5Hjcvx3j0kr9Ps79CeGsbguALJczRwbRRIrMSa5uDj
	qRyVIqJ5zh1Chvn0oQPYRndy3PeICgpfkU7SUn6fE2jjgFpb+JD1gDbAd90DVVYuBCOVkDSqm9dIm
	Teosx6O7fhTWRlK/GpGFcrv4ATmy2PtqW+MaHX0ghTXypA8O76a/zqZow0MRKyYRnw/Lkqfv19IXD
	x8CkGMDmp2D5jaVbMeYZVcAA8U3ofPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oA4-000zPY-L7; Mon, 27 Jun 2022 12:48:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oA1-000zOg-Ps
	for linux-amlogic@lists.infradead.org; Mon, 27 Jun 2022 12:48:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id m14so8086730plg.5
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Jun 2022 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=W2VaEm1JyZBTv38sZ4nuthm6ls28ynsBez7UvjAUzwc=;
        b=HUb8yG4Exe1eQ3fytm74IGZMGnCUNV2wDmOwbq8VHdeqWEhrsj9f3GFguPWHWSb/ap
         Ib7PyjAIoAu6qK8yYCgZfaTZAWNB32ZYh4Jph7VqwW8zpFdE/XIi0YId+fkiErSaArAi
         ExhUWXDP1NvCfDnRXsd4Iz7GKeLJo8leGktQFX4smE9PiDTQVD3hZvFD4zdVDj+77OkD
         bmRxrKiTDfj/hzFf7n8ygnYDzeoHJwoMUfsKY8nBq6kcqOZeh80ipZZfQU2vXwb+oxzt
         2bMSpzTEFuQqom00TcGdMDB26cnifS/iTwkaFh0wEKSIwZ94rLlOaDwFtYMWpgrzQxGv
         oD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=W2VaEm1JyZBTv38sZ4nuthm6ls28ynsBez7UvjAUzwc=;
        b=7K8i/lhAfjA19CymjGZU0cGfV6tmq3gwRIAuh+UcjnW94sG5dIOh0yEL3nWLQGAfbE
         DTIG1S94zFK3YlcAcIWtmAR1BOqH8I4RDA/aWE9mffE8ny+L4i4EafTDvT733zkOYzVF
         z1akO4dj0k8gpdGnRDoYPl8lUahVU6XP/sSV9Al/NAki+Kx95cMQYqdlrLxmqKW6Yx+x
         xzxp/z8drR4TCFCwd0rveLgdwrgwC46KgVKWjtI/wFye3nY/8T2pwyoy4JjwOKHtj33F
         PdAj3QLq37e9kfdIcOJLdyAp+FpQLyDjbc5RW7HvoWR8xnlZqxILeJGm0BoeAeCNZoog
         vSpw==
X-Gm-Message-State: AJIora/aQ1Q2Lmr6eYqAjk+gaeqMJfjm71Hs+hA8X/uvbUi5mHP4rDUk
	1uXwKFnThls26FxPzB9ibnX2yrIVyQgFOZ+v7gfsic4zBHw=
X-Google-Smtp-Source: AGRyM1sdTSkD90XZ6Va1jyfldBBTNRj4ZecRWf/qPP92f/m9ANFUpkSWNmv5o2kcAz0lEI2o1vbiAuo5o6nByflnuYw=
X-Received: by 2002:a17:903:2584:b0:169:a2b9:b428 with SMTP id
 jb4-20020a170903258400b00169a2b9b428mr14185359plb.170.1656334091874; Mon, 27
 Jun 2022 05:48:11 -0700 (PDT)
MIME-Version: 1.0
From: Lorenzo Benevento <beneventolorenzo@gmail.com>
Date: Mon, 27 Jun 2022 14:48:00 +0200
Message-ID: <CAE+2D-1SXXPhx=5DDmJyDoYZPWO=DgA_2jTAKxvvbhEqQ6OdJw@mail.gmail.com>
Subject: xHCI host not responding on touchscreen plug in (kernel drivers missing?)
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_054813_876594_580CDDFC 
X-CRM114-Status: UNSURE (   4.16  )
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

I have never written to a mailing list before so hopefully I'm not
doing anything stupid.

As soon as I plug in this touchscreen every USB on my Khadas VIM3L
stops working.
I have tried with different prebuilt images, I have tried building
4.9, 5.10, 5.15 with the same result.
These are some informations about the touchscreen I got from dmesg:
- Product: MTouch
- Manufacturer: TSTP
- SerialNumber: CMTP_1.0
- idVendor: 0416, idProduct: c168

On x86 this touchscreen works just fine and uses usbhid drivers.

Here you can find dmesg logs from both my x86 working machine and khadas:
https://unix.stackexchange.com/questions/707024/linux-kernel-for-khadas-not-supporting-touchscreen-missing-drivers

Thank you for your time.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
