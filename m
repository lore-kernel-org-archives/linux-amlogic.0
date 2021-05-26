Return-Path: <SRS0=o2l2=KV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A019C47082
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 19:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72196113D
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 19:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E72196113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3aGLwSNgOx9Z/k+FkUF6w3fQtZBUhEAmkoFoSGa5nZo=; b=kO5D+CyS1LZurW
	j6cVzR78LdICUvPoBX4orVPnkWVXOit5vnoOCZxMHn7wQm3eZX6mYMIVvu6tzlNnR1P/f//UvgzUe
	6haAYSUqMilB7kNedVe9H+5djDam9UzUqwytWDxY6JS7xXAyDnjDg49z1W5zOYTJNrrd0fImkUUgT
	GKwuT1ufNPqArL37L+YtG1vceCGjzipLauOMSkDXjWZf8dLMeFH2qOj3bNhMmcMvDGVq1YOLXYoVg
	LP547zEhASXyPKFUwORd/1jcL0PJI23dLOWTOXhndoLqqQ0S78/fCllgoVp5dpD4sHOXqLCASS6Px
	9TFKC86UHDMyGU5AZ+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llzBO-00Gx9s-Qy; Wed, 26 May 2021 19:27:10 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llyDt-00GVDz-Eh
 for linux-amlogic@lists.infradead.org; Wed, 26 May 2021 18:25:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id k14so3986607eji.2
 for <linux-amlogic@lists.infradead.org>; Wed, 26 May 2021 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=T9tReItFIBt0eoc2OmqR7SdiR6XOxfqXAwt4lcuATHU=;
 b=i9mYjz0fGabK02C2XcvOEArmyu6lVzGWLR+yTVV5vWh4qxXaGE+IUmDr0gIIhmKegF
 djK3fdciMkB531FPq0fPgjRW8XttdmeDy6u62WOfEgAGUiUPjo+TABmD2/fBmzv3fo5f
 NTwX/kAua8JOOwwzGxqTJ3AD7i4cZNfcS/rpLF85CF50FiKhUQh90OGlq4rU/JEVg/iP
 2db01fL1QvY5mE3/1Epmke7brJWPyGQ8BEpbihdgBidSAynHSZj4ME3QVSO7hqvUF1T5
 1Wtk8sZGqyODGogUVXBfe7IQUnBkwYH7HtD/DZQaP/7BN8uxKjM1SQQJzCw3/uiQ/NiZ
 ErNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=T9tReItFIBt0eoc2OmqR7SdiR6XOxfqXAwt4lcuATHU=;
 b=By/h/521s8uQiqkq7XLIOgT6HiQ91dctLyp1H/5YbR+/5zHRfpxLgRXm/1sKBJnAWZ
 D9/i150HyjhB5DvoJ7bluWeP5Uj18M2928RzOQ1kfn1p0vKUrLWdZsvwOhJibkL0v3MT
 pU+qwsoW7ujIuqtTSlvQVkngSFndVJbYkscGaDLc4jVBTiOXr1P2LDfUBRZoOT411yHu
 8w90DgEcpCsMg/OP3APX2X4lR40oEsHBpyowOzqy5gqEXBkKmzzzAu+bjBJiS2x36nea
 go/AkIVA2xXGaqT8Z3BIffUYl8RLYYDQndduOFRgVJ7WjO9dWdiwq1iYjCi5cdWwSCb8
 /kpg==
X-Gm-Message-State: AOAM530DPpbb2nuGgvHuB4v8jUEcW+6/ktGvSoyLy+wP2NSvaV+XiPrI
 8frPhns878M0Ttue+GRg/DwZX/ZxTSIV4A/37A/LVwHB9D8=
X-Google-Smtp-Source: ABdhPJxln+r8kgEsNWznmqLKWL5klBmn4PMoO3DFpOIwm9vWT6SPgtIP1eaBlkyf42FU4aQAwlREclAam+RbR4HPlD8=
X-Received: by 2002:a17:906:26ce:: with SMTP id
 u14mr34681873ejc.187.1622053538551; 
 Wed, 26 May 2021 11:25:38 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 26 May 2021 20:25:27 +0200
Message-ID: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
Subject: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
To: linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, 
 carlo@caione.org, Beniamino Galvani <b.galvani@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_112541_544343_3E72E5DF 
X-CRM114-Status: UNSURE (   7.36  )
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

Hello,

today the #linux-amlogic channel on Freenode was taken over by the
Freenode network administrators: [0]
I believe it is because the channel subject contained "Also on Libera.Chat".

Due to the recent events going on with Freenode other (large)
communities are also leaving Freenode, for example:
- Arch Linux: migrating to Libera.Chat
- OpenWrt: migrating to OFTC
- panfrost and lima drivers: migrating to OFTC
- (many more)

So I think we have two options:
1. Moving to Libera.Chat
2. Moving to OFTC
3. Trying to get back our "old" channel on Freenode

The steps (as far as I can tell) for switching to a new network are:
- creating #linux-amlogic on the new network (already done by Neil on
Libera.Chat and OFTC)
- inviting the whitequark IRC logger to the channel on the new network
- updating the topic of the new channel to inform users that all
messages are logged and the logs are available publicly
- updating our wiki with the new IRC network: [1]

I am not sure which steps need to be taken to get our "old" channel on
Freenode back.

What do you think?

Personally I vote for option #1 or #2.
I have no strong preference on which network to choose.


Best regards,
Martin


[0] https://freenode.irclog.whitequark.org/linux-amlogic/2021-05-26
[1] http://linux-meson.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
