Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4A1C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 20:41:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBC2207E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 20:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sICVNn+d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBC2207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDHAJYmZT73S13n56lVcAB3fmg7g2bvpsPrXmVHxAXo=; b=sICVNn+dRIvreK
	MXCOzjO3x27kG0k0XZLK+kEg9XSs4k/iC+2UdCAGh4ilJoA5Nc1vIDPYCN6WJqf0P/1blmbdoSpsO
	4+jJA2tnsVPKecQX/FFs7B6fqlTdZ3QQgCfDZbASLnR10SdqeZKHvMlaqaSehJEvRQ/9nfARTD2cB
	Pz7X8S7zIFlG344/7mB4HDRGjVDVgYRxrocF8HBMvfumutxvS35uWAV/A+UqfHiWARvpPmo1/jry/
	dZ5/AhVhBuwvjkAtRXWKvlKq5im+c1wcwKMKK9obG/+6ftVXmQlqhn3moTKl9EJRd+FpyS0CnGvJ4
	60y5LQCoupjwxnrPdfrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5Fbv-0002BW-U7; Tue, 03 Sep 2019 20:41:07 +0000
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5Fbt-0002B5-Ay; Tue, 03 Sep 2019 20:41:06 +0000
Received: by mail-qk1-f194.google.com with SMTP id f13so17374988qkm.9;
 Tue, 03 Sep 2019 13:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cn9O+LtABBLqC07ohD1/n6zUnz4dOrwHZE911DJV90Y=;
 b=KKFt8YBhx2+UalR81SdzFSJCZzceglU6Y8B/vO6Sm79UVBb/Yzl0RKgcc+UZp28r4z
 7AKVpM3K+3QO+8CVRwJ8Z+JaHMD8oBXfX2wWjrtZP8J/gTq2MTpMOjTsMuQtbFACJusM
 ZGQSDnBrtWbbG7RUCiYWHctavQcZHPzzU6iA1JrM6ptZrKCanVQRClZFw5Gn5ufRZ0k/
 e8qUZAPByHaUhA3OMfw+qdEf6O4I+fEYT0QTTh1cmCobttTPNiuSUfwOmaUDWdhiWMSD
 R3MGeq3MAiPYdJRWKCQDm2FoOGSbAAnGuk8wEytQsMUjdosdQSC55qPlU7XFTZ3dnEYn
 CuyA==
X-Gm-Message-State: APjAAAVTlQX/7HkzJeVSRLDrMttp5PtwhZGeWfnrXlZbSC+XoMNOCi7w
 MdLZXXCpulL90etWw8eJYGnCK3AM/XJVK9L2/R0=
X-Google-Smtp-Source: APXvYqxMpSjxdJ471vzxNRPmUlj7RmGGdi8vidlnWVL7gwm6Ed9wfO1w2oRxdeVtJ6wApTQAl1fREzPr+mBZhLxlpVU=
X-Received: by 2002:a37:4fcf:: with SMTP id
 d198mr35814055qkb.394.1567543263655; 
 Tue, 03 Sep 2019 13:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <7ho907rfsf.fsf@baylibre.com> <7h5zmfo8au.fsf@baylibre.com>
In-Reply-To: <7h5zmfo8au.fsf@baylibre.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 Sep 2019 22:40:47 +0200
Message-ID: <CAK8P3a0_HEhvVk8Onk-9MBhnaBQT9B39+t6AGA3FRrH-_yMqVg@mail.gmail.com>
Subject: Re: [GIT PULL] soc: amlogic: updates for v5.4 (round 2)
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_134105_381631_A590EE41 
X-CRM114-Status: GOOD (  14.14  )
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
Cc: "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 1:34 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> OK, here's the respin (round 2.1)
>
> The previous version was missing the bindings for the new driver, which
> I had mistakenly put in the DT branch instead of here.  Without the
> bindings and associated headers, this branch did not build stanalone
> (found by kbuild robot.)
>
> All that is fixed by this branch.
>
> As a result, I also needed to respin the DT64 pull.  Since I moved the
> bindings/header patche here, the respin of the DT64 pull will now have a
> dependency merge of this branch.

I've pulled round 2.1 into arm/drivers, but it seems that the
patchwork integration
failed to deal with the way this was sent:

- https://patchwork.kernel.org/patch/11122205/ shows both the original
  pull request, and the updated one. It was meant to detect both pull
  requests as the same thing and mark the old one as superseded, but that
  did not happen.

- Using pwclient to get the pull request only shows the original one

- I actually tried pulling that after looking at it with pwclient instead of
  the email client. Thankfully, you had removed the original tag, so that
  failed and I took a closer look.

I suspect it would have worked the way it did for
https://patchwork.kernel.org/patch/11119171/ if you had specified
the subject as

[GIT PULL, v2] soc: amlogic: updates for v5.4 (round 2)

i.e. kept the subject the same but the version inside of the [].

         Arnd

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
