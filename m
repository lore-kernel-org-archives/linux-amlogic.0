Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C58606A31C
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2026 09:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkLMUSiK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fX7dszdI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hRSkD0Ul8g0wI+BziCPPnrxftXvrsMGT7yXJQP0uIk4=; b=KkLMUSiKtixYW6SyWcoRnI2SP3
	C1fp32XI9ZYYVETW6WvCpdeif3L/+Jv33onjm258kGjcAw2zeQQTlMx4iSBAe9lgrjuT9NYzYxapU
	q+uoZC6cE1dTla7FlNhOWUIxp+MeP7R77uOtPZBiMGmoj+4jfHfFBVWgq8lTwYWXuPhYWQzrBjQNB
	Sxcf+p1QYTPyJeu+r8f/HAXuv5edxhIvHRivD8zCR0Svtt6kiYVD+uub4R1F3DJnffn0vRcWWcOcL
	em1khi2YMrcV14lqtR9+YIuqqp1Wbebqfr8ioLiPwhGY/306LlBHjW8FwOjweAC6jFjQTM6z/PcG0
	nymNepSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFAr-00000000ec2-0qZ6;
	Sat, 28 Nov 2026 09:56:53 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFAn-00000000ebd-3PQ9
	for linux-amlogic@lists.infradead.org;
	Sat, 28 Nov 2026 09:56:51 +0000
Received: from [127.0.1.1] (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655966b2;
	Sat, 28 Nov 2026 17:56:41 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] pmdomain: amlogic: Tear down EE domains and their OF
 provider
In-Reply-To: <sashiko-outbox-237266@kernel.org>
References: <20261127113326.390398-1-202300460064@mail.sdu.edu.cn>
 <20261127113326.390398-2-202300460064@mail.sdu.edu.cn>
 <sashiko-outbox-237266@kernel.org>
Date: Sat, 28 Nov 2026 17:56:40 +0800
Message-ID: <179585980075.840297.8016707396281840480@mail.sdu.edu.cn>
X-HM-Tid: 0aa22195e3fa03a2kunme507d62a3c9357
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTBgfVkNKQk5DTE4aQ0NMT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktISk
	hNSlVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=fX7dszdIv9QxPfnpPGK1zGd5HbWsbil6DObSWcn7nqI0KbNbzXSIBniJBEGs3ydE9c7Jg8qrsa60XZIxhPbZiaKIS6BVgzkUIgVFsnY1saBdb3MipthEhwyV2W9ChGBghvw4F4swR/ieqARAYJdE1H9lta27W5RO2QOb91nXgKM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ZiWaDkpxdLe/Gp4v7YP0CnYgxICRo8a577hfB5pINcY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_015650_323074_8C741FBC 
X-CRM114-Status: UNSURE (   2.56  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

During probe, the driver takes clock references for a VPU that is
already powered on. Dropping the last reference can turn off its
clocks. Should the driver keep those clocks running if probe fails?

If we can release the references, I would do so if pm_genpd_init()
fails, or after pm_genpd_remove() succeeds for a registered domain.

Should the clocks stay on during normal unbind? Can the driver rely
on all consumers detaching before pm_genpd_remove() runs?

Thanks,
Tian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
