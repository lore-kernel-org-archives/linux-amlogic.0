Return-Path: <SRS0=f3vK=C4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219DFC43463
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:32:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516F621582
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Sep 2020 09:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w+zlBfwj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3mbD1WW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516F621582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wXYtO1PH1uCSCssJBps8ErsPzB2HGtVGGCxiBv6VcPo=; b=w+zlBfwjTALYqK4lRL7YpAYZt
	W9CHU8J6n1/QmiYsN6dy/WBQrPjHynd0Z5jHoZKxuO6B+59w2xVfOjzTlCPAYVFkr0OdC8QfQr/38
	6iYGA1QDF8BHTiKYAqsrNWcyQn3GXNmx3gZJi+q3F3FeNQchVwZ/rwF+Z2fl9diWK3P6F6kK38deb
	+pSsREAwcTa70MjrRFG+OUPikjN20RkiTx3+TSUp05XCcrHdhC+fiA/aHL4j/+htoLJQJDz6E12x1
	U2iKlL3DxHpktOgtaBoFhUnwVMC+StyUiP7R9VbLSBkO4F6rqgA2dF8Fdc1LSp/9+v9KZEP938sgK
	yf0fp0yjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJZDw-0002aL-Ls; Sat, 19 Sep 2020 09:32:04 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJZDt-0002Zs-SQ
 for linux-amlogic@lists.infradead.org; Sat, 19 Sep 2020 09:32:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id z23so11165575ejr.13
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Sep 2020 02:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=3n0pI6TLxLYOzkIECSpnyjR+wfvzMgv6tnrneiDHdTw=;
 b=b3mbD1WW4gJe2wmy2g38/tpHoHWpx+yQ8NfRhrxv/A2ZDK7WZHwBPoXMwsh0X6/o7y
 sHFwarkTjxXS+NYL1UGBaaqdT2mY2yW5vkbxt+kj7oo8DShLJ5Xwv0qAtvbe46yXhmzJ
 /6t1lv6+snV27d1xCIJdV3PY3I4HVysbP9JSWaZoM0v1UCydsKJtd80Sb1bFu9iD2mmY
 htwqWRHiFl3HH4nHhwl9VDqz7AYAC7mktBZNA7+Jj0qfHLrtY5zzipS/hU26YcX4XizM
 9qd3U6Noq+MoaiOWUM+GKq3G/C6j/4Nz63xfk41+Fbp0wDJMwXQGDpAsG3nYS2bShHna
 uQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=3n0pI6TLxLYOzkIECSpnyjR+wfvzMgv6tnrneiDHdTw=;
 b=dUE08Y3/JnJxcHa8pilImm4RpAllMGknXeJckI+z5HSPJUvWj/nVeumzlMra5bzLBz
 n91nKzE4l4t3wvQ9p4vEhmWaPg1Y6Uh20ETVveL33sWNn9kZSLEiays+xtO0GyDxbAOp
 0v/uMFbDvPbeHUfulQHhWposOiVa0RZzBn7kLY7+v5qwkqoNyI2IX5MMUCA7DbmMBoqP
 /N0PPaDi/8TueLkU/uzAXVomP1+hFFSHfVh/12yJXLL8rmhgUgPMNBqXJ6JTpeH7W9oV
 MYpZZPPfPPxxRM8C19IKRoBIJ7YWka+jhdBc6Ghz417fTw9CfNTbu8xde/3TmaFLzMI8
 DCVg==
X-Gm-Message-State: AOAM531UmgvWfLeOVBXjr16kp4r6M5eAmFrrF+IFAGz++8UiLtlIxCYf
 dOxr8Po31ISzWCtbS3jrnJQ=
X-Google-Smtp-Source: ABdhPJz31wVdqZoZOQQqRmPD/+WJAXXgNkkWQslE08DVc1ZH3U2iTKq8UjolEp48q3+fzxfffwY1rQ==
X-Received: by 2002:a17:906:24d2:: with SMTP id
 f18mr39590307ejb.510.1600507919503; 
 Sat, 19 Sep 2020 02:31:59 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b5sm4097502edq.69.2020.09.19.02.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 02:31:58 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kJZDp-0006WS-NW; Sat, 19 Sep 2020 11:31:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Anand Moon <linux.amoon@gmail.com>
Subject: Re: s805x USB broken in 5.8?
References: <87y2l8plev.fsf@dell.be.48ers.dk>
 <CANAwSgTx9FHnueO0-K5M6kFhhWLJ0MEdcDKDnxbrwDnkM+AK3Q@mail.gmail.com>
 <87tuvwpgjr.fsf@dell.be.48ers.dk>
 <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
Date: Sat, 19 Sep 2020 11:31:57 +0200
In-Reply-To: <CANAwSgQnnkVdYNWTdTez8wdDHMW50vk+1Vcb7mBFkObnS1tAnw@mail.gmail.com>
 (Anand Moon's message of "Sat, 19 Sep 2020 14:43:32 +0530")
Message-ID: <875z8ap0xe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_053201_949789_BDB36677 
X-CRM114-Status: GOOD (  10.96  )
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

Hi,

 > Can you share the instructions on how to build an image using buildroot?.
 > I need to do some testing of some features in the future.

Sure. Have a look at the lafrite defconfig and readme we have:

https://git.buildroot.net/buildroot/tree/board/librecomputer/lafrite/readme.txt
https://git.buildroot.net/buildroot/tree/configs/lafrite_defconfig

You may want to change to a prebuilt toolchain to speed up the build
(make menuconfig -> toolchain -> toolchain type -> external toolchain).

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
