Return-Path: <SRS0=f3vK=C4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD01C43464
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:14:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1A821582
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WrdNGGYt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIJ0BUrb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1A821582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M8GC3tRI0vsdnVyQWe/4AWeqEUyM3UyztM8GdnqJ7g0=; b=WrdNGGYtPpKpO/YeMYYrLWmSQ
	859lbBAo7gdr9VI3Baf6R+e9WG/RKCmzt97zsq7ty1p0vCcdoyBHQm7i8Pr6D8Mu7Q5DVTrJBNjE7
	1laPOl3cmcUL9rcC4S7EqYCqMXLLJTGs6DyHsoPm6rlCGgCL76um90ncAoddRi9bLRulgb4b/mE3P
	17kE6g/oLJ7Ke+sThr8gGYtEGKDSGDuHYdpsuYjCSpwQPxaiOwT8CX593rSVF4HkjScQSf9EXFkef
	JwsFOzjGd1Ax4AK7/QxR+vbKni15zdqYlRu5ve0Jauftx1Jnt9MLg/+bghuJnkabrlpu+miGAzUYZ
	D4xW3Vp1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJYwH-00024S-Hj; Sat, 19 Sep 2020 09:13:49 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJYwE-00023k-7r
 for linux-amlogic@lists.infradead.org; Sat, 19 Sep 2020 09:13:47 +0000
Received: by mail-io1-xd2f.google.com with SMTP id z13so9679419iom.8
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Sep 2020 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0P04Qw9rKR4mtx7SYI9Mn4LaBJAt2XoIJqzz/AJCYbE=;
 b=MIJ0BUrbO2FzCtkIUbdMZ4aQfYt/Bo1KW/j4jwNARYHW/n6vPee8P//qHIb/uYeS3O
 0KgAoMgyHL7at8QOCApmaJnzCb3f7whIhdddrIihPjWj5fn92wOn/laJwQKVicXZeei+
 V8vWkZ9ARN1soJkqRbmQCxbugOn9ffIQ2B3ZunDymSyqU+A87VgN2PaKl5QdCn2Q5164
 rQ9lqrkwkpkBv6XEbW/Mui2pFllgD5pt+0NxK7JmTmgyjFoK6KsCkRErxz8+tKnwfVvg
 dNQGiZRQgLJv42Ioxui++mwQlVPUxtCeosLmxTyw9S0h5Je7nZLU4b8Q9MJwItJ9Dtzc
 L9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0P04Qw9rKR4mtx7SYI9Mn4LaBJAt2XoIJqzz/AJCYbE=;
 b=o/i2TZejx+rO81oVaqsibjXoYc/pcsZysJHX6wpokX+gqOXruN9NjYaYF+zrQQ+PRx
 L/v/mK1QfpSlXCqj0JEeB67/T9SpX+bKUL8XCkMM4hFP+MFZe6LRL7cuovEL+CnsshLb
 qI2HCuTYBmUzIzt8I0FFDiUs+SWABK4yOYXSSbwIKb4CzWaOa8YXcKOfvJJlqO0rTzg5
 OJ8oVAoENSbynd3CcTQZde3s3RitNpC9+yQSo/U24Z7Vhb8YVsCiSDj6AfGIQneodlcT
 wcwKBFEHAZ17C5ZMJCP+/PlNBmNt9jfxwwiszkT7ee19bvYF+SD82Icq9/lnIn4rvyVH
 fN1g==
X-Gm-Message-State: AOAM530QtWpslvnl9bAYXmwPz+0ye9NBP8J7dyxsCpxRRAZTw6GuDPgD
 CaXX3dGC+2L8YswlC4tNqiAPePeqO+NseWjSlLI=
X-Google-Smtp-Source: ABdhPJzEMKHK1Hgm2qGqTXPE7JSuLZ27nF09j2m7x2VgC1/vkWpYQpWjIZX7J/YF3QlbrohvDwtFFK9IrODzs+2CrWo=
X-Received: by 2002:a02:ca12:: with SMTP id i18mr32833309jak.30.1600506822477; 
 Sat, 19 Sep 2020 02:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 <87tuvwpgjr.fsf@dell.be.48ers.dk>
In-Reply-To: <87tuvwpgjr.fsf@dell.be.48ers.dk>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 19 Sep 2020 14:43:32 +0530
Message-ID: <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
Subject: Re: s805x USB broken in 5.8?
To: Peter Korsgaard <peter@korsgaard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_051346_303176_D93F9E33 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Peter,

On Thu, 17 Sep 2020 at 21:00, Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Anand" == Anand Moon <linux.amoon@gmail.com> writes:
>
>  > Hi Peter,
>
>  >> Before I dig deeper, am I missing something? Is this a known issue?
>
>  > Yes, please try this patch.
>
>  > https://patchwork.kernel.org/patch/11740801/
>
> Ahh, thanks - And I see that this is now in 5.8.10, good.
>
> --
> Bye, Peter Korsgaard

Can you share the instructions on how to build an image using buildroot?.
I need to do some testing of some features in the future.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
