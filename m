Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8308EC4360C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 17:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AE8217D7
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 17:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K13TC3EL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="aOE+CNh2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56AE8217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSMiNGypKykLQdGWayGi9G08yC/x1TPXqhgQo8WlELw=; b=K13TC3ELmLgev4
	GC7CWiyccrMKCApcubXwST9H6HIbNTepalBJN5Ig1V31k953ZmBKfNUL8vBqsIGr3zf1r6jDnI2dc
	1jjudi6jWHjki3ZbAtZmTA3OsPAbJW8Oc4S3tK/AcJrcRVMm5Co0iPvbr0szKzDj1RLWEM9z4nnXs
	MMItiV5DbOI+b6uEVsE7itLIulaQx9GbITplcw9MoDwXkMknKfu+/wExogAqs3KY3Rcy29O/kgsKJ
	+MFWv0FgVdN5pQvda85IlN2IpfWb6NE1AvAcyYQ++JXyo5a9C85UFbfDRBC9Tw6DDA1vZJPfvE9bG
	nVKG7R7rZpjBz+6XVCyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHtG8-0007Ca-Li; Tue, 08 Oct 2019 17:26:53 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHtFg-0006ha-IO
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 17:26:28 +0000
Received: by mail-ot1-x342.google.com with SMTP id m19so14761847otp.1
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2019 10:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWlFWfEEIBJfNZ841YwcrdAqOVe0CiHiInFUIG9B4Qw=;
 b=aOE+CNh2qifRSPLfIuAnALwZxnfda8FMGFhdWf3UFkufAvfgoG1yKbiGnmX1s+QS0n
 UZuu7u2/EYBruTaRNuDCz/2/hP6iBKsDsWTENDI8CPYj5CEjRWYMaUmXVvDn/57VyUbB
 ThedEYacYIFqp6qOFKAE8RyNgDm2IXSMJmUg8zThnoyyygKcRfsVdswxGCY3moQCNq6d
 2uOj0WTvWzUv+SWsgHYyVejl9s3NWrc90N7S0QMSPMMnyKLhCRIO7M0I/mCp+FxULqeq
 UINYqNodY4bRaMU4Fm2qeYvqKmN+/44eDk6IIAmkgCpZ4/V5C15R+E1igzE4yZXxmrxj
 HnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWlFWfEEIBJfNZ841YwcrdAqOVe0CiHiInFUIG9B4Qw=;
 b=eII8rmRO8I3uFdSAACi6cVUqoYq7cW6VUHYeaZ4/EbafGEIRAE7Qqt7ip2J0OVtJ8A
 dD3WtjogCRqWDnQEo7pTd81QLOvjlOgtlLalxNPJXvopj4Q4A5W/jWCjrCtag0Fc7WTn
 SGtis+o02iydQlLpy9MJjqV+Tz9B3HekJGD7EqmEJ/vf3J20D1jhi4U1KpnphBLBZyse
 TRDQEwCFjg+TBGpd4nxDqot+VBbhFM9o2v4sUSAUjlSbTYVXk48sqcLoMhyqH3T21X3J
 Nia1QfPhsylPEL/FwlkbJpnqFOgJBP8zUQ/prRlML2BBINS/aGoVMi41hPdGHLzTNPPr
 cboA==
X-Gm-Message-State: APjAAAUG8JyLXsprM2DCh91Kpi7Eb4OXUKWG6p1xd2ZgnTL/qVDVCh6P
 wWoTV6YsI7zFPLQNzTBqkKs3aecUUFoZN4S/gb0=
X-Google-Smtp-Source: APXvYqz0ncW/prUb4fzZ3I5ndhJuG+peoZtfT+6PAYknNsnliFrZL9TNAXY3a7Ev8rp+QUWOxRS0U+24LvuAixXxGpM=
X-Received: by 2002:a9d:6084:: with SMTP id m4mr22017574otj.6.1570555579438;
 Tue, 08 Oct 2019 10:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191008123341.1551-1-ben.dooks@codethink.co.uk>
 <20191008123341.1551-4-ben.dooks@codethink.co.uk>
In-Reply-To: <20191008123341.1551-4-ben.dooks@codethink.co.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Oct 2019 19:26:08 +0200
Message-ID: <CAFBinCBfbUer64RQLQN8EHvLoEC1XvD92jq1QwjWTFw=sPFPtg@mail.gmail.com>
Subject: Re: [PATCH 04/11] ARM: meson: use NULL instead of 0 for pointer
To: Ben Dooks <ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_102624_642857_25328412 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: linux-arm-kernel@lists.infraread.org, linux-kernel@lists.codethink.co.uk,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ben,

thank you for this fix!

On Tue, Oct 8, 2019 at 2:33 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Fix the second argument of of_get_cpu_node which is a pointer
> being passed a plain 0 by using NULL instead. Fixes the following
> warning:
>
> arch/arm/mach-meson/platsmp.c:40:55: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
