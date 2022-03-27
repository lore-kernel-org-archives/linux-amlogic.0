Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7C2C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Mar 2022 13:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU4+DVxm3juZgR1znmVCX0Tli8oVi8rmRjJAdltPv1o=; b=qXUdSV4ZWbZzJZ
	qdWFDnLrRQFM+utwyudXwXffVM+0foQ7DDnocPrHC5X4Jxo9RVdJcrITmL5f0rlhcLDjY8swhxwHV
	1gPfqnii0Z/4DblXOHdEcBvnTGFmyK7Wn29sVoIKP5id+Z4bmNFa13tNAGhEyeNCpFJEmrTXTcDLT
	YnR3cxrwJOcnLOjzBwa7PapziBAV6B8Bat07wYXuievZpRxyhfY7ACU0OjSXJVX67i/mMVVd9gmPi
	UJSOFJ7IX2CHVQqzh5XNVtguICPdLUX6dUy9roAYbj3L5KPeNJxSDWzPKxYpBDKwP4mWTyBaX3Le1
	ZXpwJ2Fmqsd0TPvnUUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYSdS-005ZLs-7V; Sun, 27 Mar 2022 13:08:46 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYSdO-005ZL1-K6; Sun, 27 Mar 2022 13:08:44 +0000
Received: by mail-pl1-x643.google.com with SMTP id f10so2213958plr.6;
 Sun, 27 Mar 2022 06:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ev+jFF4MWyLXe4KFMG0ej9Khdftaw0LvpKgprsKOSno=;
 b=Ufg/OZ4tD+eXPEBdYrrwtmVFy3ZFS2zmA6LG4zlQnU4T+aLWPJWTyNP+eU9Mkif4il
 3kcXtY86W/fklnC9uI+MDlhKhDSSCJRXW8UAkht7kEZuqTzgG2MqU9HtM+WbuAWY+37l
 L7WaNxT+GdFefNK1qfyTyj3L0t7yOm+zeUy3+GOq5K6t3mMnmLpQK0yIkpr1sK9I1PgM
 YvRcFnmZDV0+/98BQzyAqVeeeMbvKMGlfF9xh+YMNkuDbcZjVaL411XXZ60EufOXfqaA
 K3jb4fB11w9UL5qB73hoFsqsROPfeVQYcFFqBjmAQNoOBzKM/HkoGqm4rJ7OvxNp2Jxu
 pdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ev+jFF4MWyLXe4KFMG0ej9Khdftaw0LvpKgprsKOSno=;
 b=LwV+qULZaIe4EwRzB5DwBHGbb5cLqx2Wxt/QGMruzWmSjdJJbUZ7tWFbIrqC9hVYJ/
 Rtx4sMJoWoBIEsusTdQC+LFTp8eJSejezlBtPsJEOBZeAV9Li7WWmAgkjZcpBkGva8zu
 H764KPXLSePZdG7GGyEJk64lgaIo/Wm0uxRcMzj5fK1AUsV0qDbJk+Ggjqmb3IeDSkyo
 h7lFpHrIxz4Y0Q9gODdfMegZqGlOAef3UpSGTdssIA5OUfkREp1LxJNueCZB/VOV4dxC
 z39P3D0evwLmmsuB3PJYcvhXu2xmV7eNN83+yRK/Lq5jcUXQmnaIokx/eQYhQ+uLSDTv
 3OlQ==
X-Gm-Message-State: AOAM531QA0hhIfnbZThve4KcDn2LGhD+yNT20VKQpw/e+6AQrkpSh+IV
 RRthSB3SSJmaMbSTcQIsVuz2wMcwhCE=
X-Google-Smtp-Source: ABdhPJyXtZD88gtYEGL6/ADVEXlDLeumzqSwdYxQT/171flyk3eAaXRePwNbyBz93CC4f454cba7VQ==
X-Received: by 2002:a17:90b:4c49:b0:1c7:d6c1:bb0f with SMTP id
 np9-20020a17090b4c4900b001c7d6c1bb0fmr17541719pjb.230.1648386516119; 
 Sun, 27 Mar 2022 06:08:36 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm10967761pjv.57.2022.03.27.06.08.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 06:08:35 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jbrunet@baylibre.com
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, khilman@baylibre.com,
 lgirdwood@gmail.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
 perex@perex.cz, stable@vger.kernel.org, tiwai@suse.com,
 xiam0nd.tong@gmail.com
Subject: Re: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 21:08:01 +0800
Message-Id: <20220327130801.15631-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
References: <1jk0cf6480.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_060842_696870_9F42F7B9 
X-CRM114-Status: GOOD (  17.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 27 Mar 2022 13:03:14 +0200, Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun 27 Mar 2022 at 16:18, Xiaomeng Tong <xiam0nd.tong@gmail.com> wrote:
> 
> > The bug is here:
> > 	*dai_name = dai->driver->name;
> >
> > For for_each_component_dais(), just like list_for_each_entry,
> > the list iterator 'runtime' will point to a bogus position
> > containing HEAD if the list is empty or no element is found.
> > This case must be checked before any use of the iterator,
> > otherwise it will lead to a invalid memory access.
> >
> > To fix the bug, just move the assignment into loop and return
> > 0 when element is found, otherwise return -EINVAL;
> 
> Except we already checked that the id is valid and know an element will
> be be found once we enter the loop. No bug here and this patch does not
> seem necessary to me.

Yea, you should be right, it is not a bug here. id already be checked before
enter the loop:

if (id < 0 || id >= component->num_dai)
                return -EINVAL;

but if component->num_dai is not correct due to miscaculation or others reason
and the door is reopened, this patch can avoid a invalid memory access. Anyway,
it is a good choice to use the list iterator only inside the loop, as linus
suggested[1]. and we are on the way to change all these use-after-iter cases.

[1]https://lore.kernel.org/lkml/20220217184829.1991035-1-jakobkoschel@gmail.com/

--
Xiaomeng Tong

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
