Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F7C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU5S4cOV6kgUjPnkmruN1my67p6GwKDQaTxf+z3fO0Q=; b=FHOktbOYTdAyRb
	i5hzad0iRS4ngoBMf1UY/+jLlqQHzyXY4g1CIj5KL/p19p5LG4ozWit1mstZUvut1bL+/TrqK4JQX
	DpB/EZd0ofVpXpq79bLvsJshhab6ULVDdbjo0AXtj5Ym1KwIdmKYYjG3Sy+iDkj4QlHgmAWI4A4BG
	GGJewH3aP1X0llsxtQDuGNqZ2AN0stQvGsKIEO5xG3rnzfkQxGoCehXscE5zSbR+EkbSShe7vtcom
	GAyhdiyfgKCitrozYPT18tvm7CqZnpXiZx1EIexl2mUTBGQpMA8ZxOnRvLt9evutglzQdfzDiQ739
	19KEStg2y/nOdAlHVz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKh3O-007erg-Fd; Wed, 25 Jan 2023 14:47:10 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKh3K-007ent-Ce
	for linux-amlogic@lists.infradead.org; Wed, 25 Jan 2023 14:47:07 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 12so9292620vkj.12
        for <linux-amlogic@lists.infradead.org>; Wed, 25 Jan 2023 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SJooqgxSsZgC3XUslijIHcCwxWDte083ufs5vHUGgz4=;
        b=KyxSYbf+HfrfiYFqWEd6splGqDSdgrWJOx6IVIO0c2KJd+309XXa9CCrZttHdJKPI/
         sAQsQU+AktI8v0tBF5pRByP9qOVh5C/4OvDNPrBG5hb1IsxMlnrTa4lV1Pg/rIRrgUYl
         ysZ1FQOK4g992XZJFSnpTNTXkP53dm4kFJidlJ6U8bjcqNh5vg19cMbX1lPfSW3OJISI
         8f924tEFu3inq/Ok/wHm9jj8s/ehc8YatJ6nEtfjfnAIJTOivARvSBFwiBzOrYrGXuNd
         uDzfOy77//akZFYO2Ecn+RnehlTU0p/c1FxoTleWcX/VWY8zE71AfYGwT7fBXh3jPDm4
         ZPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJooqgxSsZgC3XUslijIHcCwxWDte083ufs5vHUGgz4=;
        b=amzRH+6+yKRa4fQFHjODiU/ZwUwIxmRj+xZk5u+AznhIHuFl/byb66IcWretZwwfgt
         uHHNOOmpu8EespBpOBTgottBBv9habvwkxmokDov5p7+/ohbyeXBN/9E/G5A//nnUpce
         vn737zV5lfTQnY9LxMCNm6QbWKcALiWPFyEcGT49em6HMe+NR4j+zsSvplBCGPAqHe2E
         R4m5nWPW4ed6QlD93dyIF+u2RG2YV9r06nKhAPNGZfj9EUulp37kP/OGKO8oUF5ZXxyj
         dQnIP9qwM2ZTiX1nSK0hpIWFTDdTo1lj2t4kIbSgc573B6JmLRpy4ocfQd2UxwTVMH6l
         IA3w==
X-Gm-Message-State: AFqh2kqwcWvkaecd2kL2gjbmeZyqYqN12qXswI+WXr/2Q5jZr4Fq9N6l
	TmpsAtpkj7De8jDpXL8uI/AtaS4qbrjbj//3T4Y=
X-Google-Smtp-Source: AMrXdXuA5KqYnW7gfvXR0AxbJCK7l1f842CqSJpL8IZO8rdEyhtEVw0WMH0hCxgMajYQdGu+sv8uqEUQtFqoypcBqFc=
X-Received: by 2002:a1f:90cd:0:b0:3c5:db35:9288 with SMTP id
 s196-20020a1f90cd000000b003c5db359288mr4223765vkd.32.1674658018663; Wed, 25
 Jan 2023 06:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20230125143404.1424-1-linux.amoon@gmail.com> <Y9E/uOK6AtFYGmar@kroah.com>
In-Reply-To: <Y9E/uOK6AtFYGmar@kroah.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 25 Jan 2023 20:16:41 +0530
Message-ID: <CANAwSgQM32bojzksGRqB9zwgh-pwOc_wAfMW31T0LonVc2HRrg@mail.gmail.com>
Subject: Re: [PATCH RESEND linux-next v4.1 0/4] Used onboard HUB to reset and
 add power to hub
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_064706_479412_F6D268B5 
X-CRM114-Status: GOOD (  13.91  )
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

Hi Greg

On Wed, 25 Jan 2023 at 20:12, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jan 25, 2023 at 02:33:59PM +0000, Anand Moon wrote:
> > Amlogic board use gpio-hog to reset the USB hub.
> > so using onboard hub we could reset the USB hub and
> > also enable power to the USB hub.
> >
> > v4: rebased on linux-next
> >     Fixed some small changes like the subject.
> >     Dropped the merge patches.
>
> What is "4.1" for a patch version?  That's not how we number things...
>
> confused,
Sorry once again. I just have one line of change
>
> greg k-h

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
