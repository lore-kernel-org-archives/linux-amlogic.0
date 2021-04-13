Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A63C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 07:01:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3FA60241
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 07:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3FA60241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nycsS28lLgw/BQXdb6NCCMwSW7Pc+l56jnsHrxrA8FQ=; b=UXV0bN2Bz2fidPN/zaGkgzFjR
	dKEQ4K8D0E4wTG2TWfbPraNagmpB7bMQ1w/dKpbLDQmpLiR5yrvqmycUOyMlxW8EhQ6GS3Qiplk9z
	QssQH1ITHu1VmGzZoxw4mWRte8CgE8+YzyaCwoNBIKaKqjALLhfCo8rEvtxZDQ3Yh2JkNlZDs5ywY
	TI7uyHdkO/zuNnegqxssGdmyEVEfiXiJ8gKErbCFI+ET3YNqpmiEAqA7dsgrKSlCqykgWBKh4gxRJ
	74ZCiaTQ4X6PDWcmAwqEh+KrJE0PGTPT5n5ozPKnOOg0nVrZp9bOj/n0irNog1TEfY+CabJBt0uUE
	VgahSe3GQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWD1e-008RzZ-3p; Tue, 13 Apr 2021 06:59:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWD0V-008Rvq-87
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 06:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ld3Rrx69EYEd+IeesGBo75c6vVeoqLzhK9UzSaKYuGI=; b=GGt0StlPIRmBU52fKQHHeWG31I
 3aFGQzMms21GXtUN11u4K1spWE6Vnfex3zwXEjpXXz1v28zFiVxxsBw+oV9/AlLPLR1L8wRoeNrqh
 1VZfmHMgTMztdWxm7Cfk4cLZjbMkTIPsTUVrJ00ii7vHVM2Ql+ta/yTxu5fwG33IVc9QSUdWgvG/I
 SzUSbiNRlHBUYAnwr4z6OA4xg0GtoUTppjagvp88EvLfODzElfp3ZfeNnSmSQWeNYNeAdo8q3Wh3U
 ieajD8MaZu1onv5t8jiXWovGQB5kqQrYXUTv8yDGUEqudxCwKIqLDv0p2zd8p9kKGNRz/HQ4IqFE8
 D9PWj4pQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWD0S-006mnX-JN
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 06:58:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D644460FDB;
 Tue, 13 Apr 2021 06:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618297119;
 bh=At7tv/t6+u+Xed4C9ESv3PLB9A4rw88+He4xQJrhC8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uF0mHX87ApqlGgu9151snbVoO5F+wIjbsZdjqFB9dP9GZ73EsdAzJT8LUtHy9rZGC
 mdP+VB6xzHjCu9fB8SnJxOKn3Ey9Kp51nH4h/3wgBcZEFU2Anizjcg7a7etG7FkOM+
 IEdEN9aXBt4mdjF3YIzY2C1Kchu3H2E6+SfitlK4=
Date: Tue, 13 Apr 2021 08:58:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mitali Borkar <mitaliborkar810@gmail.com>
Cc: narmstrong@baylibre.com, mchehab@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHVBGhoZXnVYfeKE@kroah.com>
References: <YHU56OM+C2zY34VP@kali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHU56OM+C2zY34VP@kali>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_235840_710068_5EDDDBE6 
X-CRM114-Status: UNSURE (   5.05  )
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

On Tue, Apr 13, 2021 at 11:57:52AM +0530, Mitali Borkar wrote:
> Declared 32 bit unsigned int as static constant inside a function
> appropriately.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>

Why does your Subject: line have "Subject:" twice?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
