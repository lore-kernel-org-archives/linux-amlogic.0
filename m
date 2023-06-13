Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE5D7C7EE29
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jun 2023 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:MIME-Version:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JgLFUwl4oitmg5FHjTlwAGLwdY5bGmA6yNR+HRAK08Q=; b=LR3d+5XnuO6rtR
	Ai54ONTQEP7jPrD/huCP76AMPxVKrguytqqYXvwppWHAH/FrhI+srleuYDZ2o4Gb77DGJ2Gjo8d3B
	1VfsGsHqySL4mdf2wlrncyAfFcDVzqkWag6XDmJZ5EAzJ/+6t0zRShJLYEVHxTbkl8RjidiKTjamY
	x7vYLztPLCDuvRV2KgqxYhyFGL0Fhp8+c2dNgaqf5xGQ9Z5T6qkak4RGkQXuKUrBa4ggttL+DRZ5j
	nR55YeOfEWIQeP/6ltRcwUqGpgXkr5HTbbMbmU1WvU82y2QEbzCHczOZJva0C4ly/VlJKQ+lhe0Ex
	nbCqCdWMiLyg/N+ZUTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q90r1-007b22-1g;
	Tue, 13 Jun 2023 10:02:23 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q90qy-007b16-0t
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jun 2023 10:02:21 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6b2d9ea4901so2446396a34.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 03:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650533; x=1689242533;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m/mXT15Fe1AIU0+uXKYw7zf/7HWfP4H4sB3qFqkq/+U=;
        b=HRS2UKLebMq3smNo0AFs8uK0UHplWZZE+nkTcqAaGypebYlptpfzOIBJudT/qOpMdr
         GzISV7w+07TE6PQfqTWoEswJBRC+0jfBAFOmVGhuSc6UiJ6QooRdNwPIlMj5JPJJ24nr
         KAWgO3dosDffAqgIPBrBeS+wXr8Y5H4nDJVFphqrn8TVqMl71XQN0/3Sn82qn2wquSVX
         WuwC5fFBu2/JYObuQWzvaEQWAhdZUDnld0vvqDtCZJHmuqSKOdA5I6y32QS6lcjUC/vM
         sS1nd1Pk2NAHsPDJVQrJQ97BovdGIfITkYh71GewefShCIZ4PNLAXnqzvH9Vy8ZiejIr
         cA3Q==
X-Gm-Message-State: AC+VfDzGrmKPRrhtCl7AAs1gb9sGa769Z3N/AAu9qWBaYerD3YCtocNp
	dCU07Zf6hPC+nXc21JtXnwiP7RKObaXsnw==
X-Google-Smtp-Source: ACHHUZ5rx0yQfT9bq9toyzB7XYpBZdHqu/t57dSXVlv6Bqv0IHTQKIVNbFIQl8QIG199wQpqNDJPpw==
X-Received: by 2002:a05:6830:1482:b0:6b2:b8a3:70de with SMTP id s2-20020a056830148200b006b2b8a370demr8936172otq.35.1686650533123;
        Tue, 13 Jun 2023 03:02:13 -0700 (PDT)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com. [209.85.167.173])
        by smtp.gmail.com with ESMTPSA id n12-20020a9d6f0c000000b006b29947160csm4672922otq.30.2023.06.13.03.02.12
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 03:02:12 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-39c7f7a151fso2917801b6e.0
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jun 2023 03:02:12 -0700 (PDT)
X-Received: by 2002:aca:2219:0:b0:38d:f794:26c with SMTP id
 b25-20020aca2219000000b0038df794026cmr6283583oic.56.1686650532522; Tue, 13
 Jun 2023 03:02:12 -0700 (PDT)
MIME-Version: 1.0
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 13 Jun 2023 11:02:01 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+0Ei+6gueLBxnRsaqS8HeFPJC2UU1+k7rxd68Tdq1NyJg@mail.gmail.com>
Message-ID: <CAJX_Q+0Ei+6gueLBxnRsaqS8HeFPJC2UU1+k7rxd68Tdq1NyJg@mail.gmail.com>
Subject: Better way to upstream a single-board computer?
To: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_030220_319864_76DF4FCA 
X-CRM114-Status: GOOD (  20.56  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

I have been trying to port Vim4 to Mainline for the past few weeks.
Downstream branch:
  https://github.com/khadas/linux/tree/khadas-vims-5.4.y

- First approach: The compatible string way
In that 5.4 branches, clean the device tree to the bare minimum to
have a serial console, sd-card mount and ethernet, and reduce the
kernel config to only build the necessary modules.
With those 2 in hand (minimum dts and config), I could port the
necessary drivers for which the dts have compatible strings. I did
manage to boot once a v6.3 kernel with that dts and config.
But it would hang a few seconds after booting the kernel. And after a
few days of trying to debug the problem without success, I decided to
move to another approach.

- Second approach: The fat patch
I compared a clean 5.4 branch and khadas 5.4 branch and generated a
big fat patch with around 2.5 million lines, where when applied to
clean 5.4, it would boot and work.
I started to chop the fat patch to remove stuff that did not need to
get vim4 working with only serial, ethernet and sd-card.
I managed to reduce to 1.3 million lines the fat patch, but after
that, things started to hang and crash, so I was unable to move on.
At this point, I realized that 5.4 khadas was actually an
Android12-5.4 branch with amlogic and khadas stuff.

- Thrid approch: The android fat patch
I am doing the same thing as the second approach but using an
android12-5.4-lts branch as the start, where the comparison shows me
only the amlogic and khadas changes made.
I am still going through this method, but it is promising. Right now,
I have the fat patch with 0.9 million lines.
My idea here is that when that fat patch becomes small enough, I can
apply it to a clean 5.4 (no Android) to work it out more. And when
that patch becomes something tinny, I could apply it on mainline,
adjusting for the kernel version jump.

- Fourth approach: The rebase way (On hold)
I could compare the android12-5.4-lts git log with the khandas-5.4 log
and start to cherry-pick patches to a clean 5.4 (no Android), but from
experience, I think that's going to take forever, and it would be very
hard to apply patches as they refer to an Android branch, not
mainline.

The intermediate goal is to have a patch on top of the mainline that
boots vim4, no matter how ugly. With that in hand, I can start
re-structuring and getting ready for upstream.

Now my question for the community:
Is there a better way to port a board to the mainline when you only
have an old kernel that boots?

Thanks
Lucas Tanure

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
