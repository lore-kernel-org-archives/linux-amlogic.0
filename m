Return-Path: <SRS0=f3vK=C4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AE6C43464
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 10:01:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B2420795
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 10:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pesvo0Bn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rQ2pc1gi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B2420795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fPRSMlMU4yQx9fOx8Wu8Jf6uFNWBdggE5+0GbklQyNw=; b=Pesvo0BnmgirQ+f0PuKuw2AOF
	QupvJTk85O96ItDzIeaOe77GLGX8MNtnva/7zfNdSeENlITQCyyzozL6Qi05/MOfHl5GELI97yjAm
	6PSidmcdAJvKJwnj7mpE1FAkev6oZEXNIM1nINdkmAoqIebWoX+7brLfTz2yMoI0+XNfn3Il35eKS
	v7XMx0NeSPxrYpsHOxmm5ULEVkMW1rtoPSDbNBieIhKkhxJTwAmTp6uAHaa5rTPXYi18tg9nMiIrd
	Uq4EajFbRwZQcYRb5m3EChsvIQjAFSOh6XCt2Xfb4gPZQtIYR4ecpsvS3PNqvTruJKNM2HNnlq9fr
	Plo9yGlDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZg7-000689-98; Sat, 19 Sep 2020 10:01:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZg4-00067n-6F
 for linux-amlogic@lists.infradead.org; Sat, 19 Sep 2020 10:01:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id o8so11271957ejb.10
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Sep 2020 03:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=5ifeSL7VSSDnDPvWLqMMU6tz14+N9Kv8fIN4LgLtMKA=;
 b=rQ2pc1gihqmfnFDhml+MD/kgksUmPu7SK+8D9Cr7KDzunglyzeowl4qrjjOFiVa6pn
 OZeyM8dHfGLvs9+K4vqrm5QHW3eMX5EGhsddIjLmF891aI0BJ7aOpkuQQHmK8BPs+zV5
 gkmxBt/ePNv4PWbaFL39l89acDJe7CG1bSsl7eJc1vqz0UCpYRMp1Jz+CcvWiZvhZrQw
 zDmIso7c7PPizceTSysOMl6A9GjqGCRQQ3s/pehInqaqsNAyyhtvOvPB4gbGqrG+FptQ
 pVKWi+nYyhuHCTlJX38YkvRYT/PuryBfd6A/J/NEuGULSn+oy4gaxX19f1j+uvrqcRwm
 yCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=5ifeSL7VSSDnDPvWLqMMU6tz14+N9Kv8fIN4LgLtMKA=;
 b=AzdLGkMhxWj6Gmb/5NuB45uDvAfLKDocVjtyAeL3OZdHVym6aPqVdhXiQddmPoVIvc
 diJRw7q+F5n+VutZwqxl5pjcKMl7HKX8acrxLgmzP32Io6osrd3EElbcIqXYYuOkykn8
 znBdU4TW/vE0draMnnPQSv9nZT7cur9uryVYZ2j/gzrYvomNneXGTC4WA9wlJgK0Gpzn
 2mjwUCv9kfdqdzXIT2syghPZQDlLNK0vrrA2oyTVbQF1tsCaCe1sf476+YAnUYfSU5ck
 rJ+gRj9QWxtYxqQU+btOB3664GRAUuJLDSWAZNAN2pRHLjBrZYsOckhELagajhBPJ275
 xAdw==
X-Gm-Message-State: AOAM5336Or3VC0hvxXMSIgmFNGKi7aq9XTudsCVk9iDcuzjl3ufqf4xG
 BlQ+9DKNZ5mlZUeSHrW7+Ns=
X-Google-Smtp-Source: ABdhPJwG3nzZWliPJH/we+sP/UYgbwnNC33qnGDJbmldIOkOm46nuXwcFvUGa8d8AcuItsHhyw9nbQ==
X-Received: by 2002:a17:906:2985:: with SMTP id
 x5mr39598659eje.136.1600509666504; 
 Sat, 19 Sep 2020 03:01:06 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 o23sm4197183eju.17.2020.09.19.03.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 03:01:05 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kJZg0-0006gs-TX; Sat, 19 Sep 2020 12:01:04 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: s805x USB broken in 5.8?
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 <87tuvwpgjr.fsf@dell.be.48ers.dk>
 <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
 <875z8ap0xe.fsf@dell.be.48ers.dk>
 <CANAwSgR4Nq0rsg3yi-AF1HfAAvNquB2=EJj4n0_J2uHbSgVJCA@mail.gmail.com>
Date: Sat, 19 Sep 2020 12:01:04 +0200
In-Reply-To: <CANAwSgR4Nq0rsg3yi-AF1HfAAvNquB2=EJj4n0_J2uHbSgVJCA@mail.gmail.com>
 (Anand Moon's message of "Sat, 19 Sep 2020 15:17:19 +0530")
Message-ID: <871riyozkv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_060108_394844_31D069CA 
X-CRM114-Status: GOOD (  10.37  )
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

>>>>> "Anand" == Anand Moon <linux.amoon@gmail.com> writes:

 >> Sure. Have a look at the lafrite defconfig and readme we have:
 >> 
 >> https://git.buildroot.net/buildroot/tree/board/librecomputer/lafrite/readme.txt
 >> https://git.buildroot.net/buildroot/tree/configs/lafrite_defconfig
 >> 
 >> You may want to change to a prebuilt toolchain to speed up the build
 >> (make menuconfig -> toolchain -> toolchain type -> external toolchain).

 > Thanks for the quick response.
 > I will give this a try on my SBC.

Out of interest, what SBC are you using? A lafrite?

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
