Return-Path: <SRS0=pSyH=7P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B651BC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2020 14:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1C320772
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2020 14:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8ivB0RC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfhiZjC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D1C320772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pqcF8qARto3FTV1/XWY5Jfy5lOwXcgWVJkMtGcAXLSg=; b=Q8i
	vB0RC8peLvydM+sENNx8XXo49INJj7Q4P914iFtmwrRSm6ctdPZF2d8ScUDJgL2f3Dn7izhZs6Tyh
	9zMCEZ+m8nTZ/8u1hiOECRGccnEgraYbvFjeksBy9qjoInslFfUhpU98prtfrK1n70Bp8tI/L00qS
	G+FRdFzEdqWprmjflorxgdl+pSjJQ5+fy4S8db5g5YeQTUjSBooluki8uLk1LNH27w2AigQwvwkTi
	SLFGn5ie6cSqQbJouv+8IkgN2YUenDwrT6Wt0G/rVGPhZrCSJyGXHK1wMGfZ5SMUdRNU4am0xEfSB
	j97j7GIzfHtH+exw/IZxqZVFGl7FTrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg7iB-0007w4-Ie; Tue, 02 Jun 2020 14:16:15 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg7i8-0007ug-Os
 for linux-amlogic@lists.infradead.org; Tue, 02 Jun 2020 14:16:13 +0000
Received: by mail-lf1-x141.google.com with SMTP id j12so3551516lfh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2020 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8PcADBFvy5he9cydf81ufZsM7MBdKZM+3KHL0X8agL0=;
 b=gfhiZjC5311V4qJZPiBxbc8Ud0omxMopdHiXjjhUxo/IlCNbAyPEfKwW3wgB4NSdV1
 B3SlzYrlYgzCXTnhczOeQI1QfZd6ThIffPrMCTgx/y3gI/oM4V44BOhPqROroRf0xvOG
 MnledKR4ghNVDRqbmtzbuaBvp4bH+ppWH5jWQMseE7BatYBitrTlTNZJZBo8ClAraU9J
 ZIhaLYbYk8htueizV/buRlNx6/ToIHJeVGTszk57PZyVeHWlqekC7Kc0lCkjH8Mz8SZr
 Qym5B7FLWcCkp/u0qrQzTPFNAVffFFEFu74Q2sN8V8rxs0I83xgQLObjD4C00AeUyJLf
 VlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8PcADBFvy5he9cydf81ufZsM7MBdKZM+3KHL0X8agL0=;
 b=lX9A/jFZNjmrY/9GRSP9pcce4/I9rbjCIgXJwNzKiTStGTkhLdpU56Ozo4snLvVKfa
 /TdjgP47IzzEDa7KbNa+asHROzT6WblcOjQEzuNBPUlpLrK7Y7V+vs5j42q4txMJ+vhB
 AyFXZjaNA9gcY2TNslVm/8vB6N52AHLZ4rOgwP6WMiVVrbVlUiWGaaJs4iBnJuxV0WOy
 3t0zoPxGK5lHOH6T2yY9DMI/m2N2B2LUU9xQW2CeC9Oul7dDekT+nJWy9hPPzLk8uQnc
 OV1RPnvYGoGlN7aTvMrjpGXMq/AXIoR/6lOUy4BaFvZoAqMBR86NZTyNq3HuXOFj8d6C
 Kg+Q==
X-Gm-Message-State: AOAM532Ww+FJoOyWhLMsQui2ULFlYZ0PgMBvbfc2gdS+PjMfN0sl32n9
 vDAYBNq/h7ibJ90S94CWjG5g8BOjlL3m07i3sN4r4Q==
X-Google-Smtp-Source: ABdhPJw1b/pX0dBAg8vrfBhL0lRP3lwrqTFPA2wgoXbhv/GngfrPGBhy9CbvnNPE+zZpr+//vA851UIMrBeifh7bejg=
X-Received: by 2002:a05:6512:10c3:: with SMTP id
 k3mr14217813lfg.33.1591107370025; 
 Tue, 02 Jun 2020 07:16:10 -0700 (PDT)
MIME-Version: 1.0
From: Jie Zhang <jzhang918@gmail.com>
Date: Tue, 2 Jun 2020 10:15:59 -0400
Message-ID: <CACYR8yO2nLV21F2zp7-Z=uAt1H=FEJsHipfUk_U1pBFAN8H2YA@mail.gmail.com>
Subject: PMU support for Amlogic S905D3 in Linux kernel 5.6
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_071612_810066_F2237D54 
X-CRM114-Status: UNSURE (   6.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

I'm using Khadas VIM3L, which has an Amlogic S905D3, with Linux kernel
4.9. This Linux kernel has support for PMU for S905D3. But for a test
case I'm using I saw strange L1D cache misses behavior. I want to redo
the testing on a more recent kernel version, like 5.6. But it seems
Linux 5.6 does not have the support for PMU in that processor. Is
anyone working on this? From Amlogic specific changes to 4.9 kernel,
it seems we need special handling for this processor. Is there a
document describing how PMU works in this processor?

Thanks,
Jie

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
