Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1922C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 17:20:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98BCA60F4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 17:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98BCA60F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K1MotsdIKyMtbjM+gE15h4CGtj27DejqJBLVIApzAWY=; b=mAazGL9s4lp2XU
	0rZwTkwR8YQQv+i0XBsK3UgMBZ1nY+w7GrkdNq4KiV0Cw5JwjYh8TDvv1ajEeP7faXS8FlfwAIbwX
	2qCIwps40HH5Nkb96P8EfY1qCD5SX103fgidxcv6Vdt67WLZLgZJO7i4DkoZzXZQEJ+lO+zn5vjLs
	+8LSXty41DrvgLb2iBZMJqzHJjx/t26uWIWKi7TaRIbQ7ZpEG75Sexbll5fJDMEkLT7P4k3l1p1+V
	+z3NlvVIWILoN6E9pmvEdyLWD3RqzI3qMe7KcM0XEMKHcocwRu07eKELxaY0+uQWK2vL2ADLhZTIT
	d8qxscvVKuZImApUtHQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WB4-009f8N-J4; Fri, 30 Jul 2021 17:20:06 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8xZn-0033Qt-TZ
 for linux-amlogic@lists.infradead.org; Thu, 29 Jul 2021 04:23:21 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so4523798oth.7
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Jul 2021 21:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=/dwNrkHZ4rr0gZlimBCr94oa9eOYTGcZxKlxstoy7k4=;
 b=NvjfpVJrS258iJ9Tgp4/MObm1FyPdOsXiCitqwdkRjBgq3LiZwuOBUaITYA2+5LHAP
 5GucGA24gt+qgHmHd1VbMX2hUaVCGVeFmXKD4dWd79Pm44FeoI2bOdra/458AHMFpi6j
 y6tPyPeRHLUjvl/0ugBYRWVNOnlMIAlL7VFQXaZQIFhjMYzEV7j1xROWFwjdITrVih8l
 sP+TrEU6ajDBl94hfA8nvpOrilDVAGxZEamjI4SGOALyi72gDAhOQzM0XJ5PwHK2wlFx
 LthtWsW084j5ohFX7NGZOzkDcP3mCMQR9MK+b1JTeRyK7gwd6xb4tMx74aSJmjpXjmyU
 bOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/dwNrkHZ4rr0gZlimBCr94oa9eOYTGcZxKlxstoy7k4=;
 b=XnFNrJ+jKKlGdZB3ijyUYdvNySaQ6gElPFbLrxJQzCWrYklikS/bdamMtOaQj+a27y
 T18k3BoPWKS+E2kxsU+4c1XCwCdL1nyUIeFiKtcbodpI6Dmvzw847YRXx7hKRB4p1DHR
 ju/ytUqR3G4OtMipov0y6qUa1wlTgZMjyUL3+8MHeXO3PyPtCiSRabSXcroCow1brShN
 hyBQbz7lKNZ7IKQzBX4HhYjPDKiq572slUnNF+H9Fa/HqPn5jXHZz6lCZkHSr9E9lPiO
 QgT3d9zl5OMkBQjBQAGt42J3kehn5S25gwHK/hpeXawQiUV53XopTMv/1lCyqnuOtP2F
 K+uw==
X-Gm-Message-State: AOAM532APu5qdWwKPxVBuEvtxwMY9yGC/ZwgFVtxfOyH2lHVGQFKIsL5
 iyYBstrT8umH4lRdc++Acu+PwzGTHN5UFPfNJDA=
X-Google-Smtp-Source: ABdhPJxf/CZnQ9SwM7zDgbR/FmohKUcJ9RMwgdK1cEsBHLnAXMa5BOfq2I0DzWFWCXanlb5F9D2D8FAGSZFFwfiRPpk=
X-Received: by 2002:a05:6830:19cd:: with SMTP id
 p13mr2249363otp.362.1627532598347; 
 Wed, 28 Jul 2021 21:23:18 -0700 (PDT)
MIME-Version: 1.0
From: Philip Milev <milev.philip@gmail.com>
Date: Thu, 29 Jul 2021 07:21:51 +0300
Message-ID: <CAOKfEHBx_fboUqkENEMd-OC-NSrf46nto+vDLgvgttzPe99kXg@mail.gmail.com>
Subject: Re: drm/meson: fix green/pink color distortion from HDR set during
 vendor Uboot
To: mathias.steiger@googlemail.com
Cc: linux-amlogic@lists.infradead.org
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_212319_993105_EB8FAA7A 
X-CRM114-Status: UNSURE (   2.71  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 30 Jul 2021 10:20:05 -0700
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

Tested-by: Philip Milev <milev.philip@gmail.com>

Fixes wrong colors on ugoos am6, kernel 5.14 rc3, hdmi fb only.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
