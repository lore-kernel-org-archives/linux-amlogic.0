Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49BBC2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 868C8206B7
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iReyMskH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="H2b2ofvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 868C8206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=im+GPOfCRLcxpJUOlKHsEOjoxIBv5eyGNg/q8/UeFZE=; b=iReyMskHwklMZA
	qO+9GPJEOpw82u6TBBCcTtNaW9TfsifqWnWkD0+TpC7MgMf5GVLS8YZGS3jj0Cx7Yv+lgTrbL1+kg
	JlHuKFs1VWTEQ9sGoa7EezHHK0jBJMO9/u3mrR4/eKLiXDCHnqD4ChTtYsPMnZLgisMIOUgZEo5C3
	3sJY+qZcZ03PH7V3Zhd4N17NQc01uzApkPUuSCuunmZ7MxYRSoEkk3yUmRt1Ks/hsQj4Ra3JYxcsR
	pTQmbzfmRwH+SSxwm+g5JMPFeZcATv1eNwRrJ35BL8IFWYvR1yiVjGH8k4Tk4ht5d1E1DeLNfJIp2
	MquXpc8OYRdiweK4jNJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijiGf-0008W1-Ey; Tue, 24 Dec 2019 11:22:25 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijiGc-0008VN-Ju; Tue, 24 Dec 2019 11:22:23 +0000
Received: by mail-ed1-x542.google.com with SMTP id f8so17729450edv.2;
 Tue, 24 Dec 2019 03:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N+JpIu3vYJU8a5Gq7Z5l9BFQkWLO3Nuw3pvsMvETS7c=;
 b=H2b2ofvx22QIFqPfWb/57Cgo4+6EYRM3UmWRLglTZC78WjixSKQRStrNRVkP41+J3i
 D9rt2R9ktslIGTdHcHmxVtFRgeRAodsryfwssz/uNBn9qP1aW+pFoeFzxj8r4J954YCj
 /9Bxje/ma4Hcq9VmUqFpcK3BtabstmdU11pb09O9By5MFwQUYXWRZ4hArq/sDJuE7e6d
 jdrO8GqEyfSdl6I/YpBFOU6Cr1beioNmDtweTzR+t8T59BJIq3R5aSjs+xiMhsdZpTOe
 vCcr70c7mVfdLY84kTlBITIgkg00wbxKAHZz9Ua63zF5lxS/qM7GVJYyklqRrp8PV5Bw
 RJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N+JpIu3vYJU8a5Gq7Z5l9BFQkWLO3Nuw3pvsMvETS7c=;
 b=EHGlbj0F+3dl9QDBfthGUEoygjKA1jyZrovHjzWTaYGdWwZmeXtxBL6UGfkK1S1ObX
 B6VA7q7m0w68ij8QdPjynbmsOenCiOq71LpfpH9ammsfr5CuDoTPyZ0c9Np1UNz+UoYw
 R2CUyyvizNjcZj3kOZgEPqhRm1Y8K8nPX2XN3eOZapOWDGYvVnKwZSKxa2Vm7Ii2cflD
 yx7edm2qImkVmPj0t05tZl65BfCcroF2L5jje3/CV23+Ki9sMnoMGP00rS/svZO3EOkS
 5NMO5/TXqFiFzAPcL6FSoy3Ua1lgQdBNffIssBeCqSn0jEo5yz6u91kuQmf/2ZeIM11l
 Tg/A==
X-Gm-Message-State: APjAAAUXjUVcAngICncqYakN8Fe3Tw7odH5DG6gNlt07pwwZTrNgnwh0
 FKCbTmQByttX10AbR0GXS0tk7KmSz8XZK7PSzy4=
X-Google-Smtp-Source: APXvYqwpjloweDhJk9K1WbRoanlfiA93jPFsGS8Fs+PosuYx6ygOY/COI9WSyi+Vw5n5/quxpcoKFqWqpEy093u1djo=
X-Received: by 2002:aa7:d6d1:: with SMTP id x17mr1784678edr.57.1577186540180; 
 Tue, 24 Dec 2019 03:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
In-Reply-To: <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:22:09 +0100
Message-ID: <CAFBinCD+k8O90ePuwSEnW1+oh-xJ9oUC5P2WrHgLLBb0RHj+=Q@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Qiang Yu <yuq825@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_032222_678700_9F4F3ABF 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, lima@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 3:51 AM Qiang Yu <yuq825@gmail.com> wrote:
[...]
> For the code, I think you may need some lock to protect the time records as
> there are two kernel threads gp/pp will try to mark GPU busy and several
> interrupts try to mark GPU idle.
good catch, thank you for this!
I assume the reason is that the panfrost GPUs are using a "unified"
architecture, while the ones supported by lima don't

I'll add locking so I don't run into trouble.


Thank you!
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
