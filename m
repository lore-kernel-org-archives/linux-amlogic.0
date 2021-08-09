Return-Path: <SRS0=MsbO=NA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6119EC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2678C6108C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Aug 2021 10:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2678C6108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GbBSKZniKnsj9jpZDVPuACydUmuwL2lL04JIf0mkd78=; b=gZCvf6AURJoDwH
	9hQEucd2797VwzpA+e2LrAM1JYp2iBTNAFQgGPcDwEHW8M7DqlI5keFyqz5rKsqFZJb4ql/TU0szb
	EeIsuEqmgbJ5RVyYPxh8T2FKu1KPFBU1ciwfGv0epIwcBSJyhejZloMmWqnzYJLmKSXdzPi5keWMW
	Ryb1q5X4VNS7iNaN67WJ93xLSzka/8QUd42PZjeilRHVI+xT57M5N6xIjAtH66l845pfOlOZfesoV
	6+1drxoeJ9Er/fCwZYjprYL8sQIzUBy0dfwyJXUFqI9Gn6NC/35ATBpMIFpigrmmwemb90+HCRc8l
	crdYQFSBvNLSW8uAtqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD2DR-0009HE-IE; Mon, 09 Aug 2021 10:09:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD2DO-0009Fn-8Q; Mon, 09 Aug 2021 10:09:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBB0C6105A;
 Mon,  9 Aug 2021 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628503741;
 bh=wv1MWCXTrK7pk7o2V9bRdLkYI25FXVkGxQlI+D91hqk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=N7tqlTZHn4YyGXcvylRGw60hwRVWiDqC2ImoFmztIHnsw4A85RwAywGKLZjs0roPd
 W2a3TDy7pUaQnmqIxskCk4QXbhmxvc9Vlpm70EyCGUtDgr3YFvDNVCw9/qyS3VVRiG
 0EvUe59nzf2EEUxa0NRhKVDXcr7Xw6tdpJWVjLYIxt+pNMFBu6iFHolQTWX6hSXnlS
 nM8gvuyzxZuImKvkMHPDC6m3ICx/e71kNuQ3e68nESggURPmnCfZ1KXlLBRmu7zLtf
 ScCgBWvrv8YhaEiILOU6iaelRRc+rsLYhYvflb6rJcnMr/tCZOfiE/wYTWk5kfAKjJ
 Bv+3GH37Ufarw==
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
 <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From: Felipe Balbi <balbi@kernel.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/9] usb: dwc3: meson-g12a: add IRQ check
Date: Mon, 09 Aug 2021 13:08:43 +0300
In-reply-to: <f8eae1ec-91c7-e26e-665d-777930b001a9@omp.ru>
Message-ID: <87zgtrj5fq.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_030902_363586_3FA6C1E0 
X-CRM114-Status: UNSURE (   6.54  )
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


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to devm_request_threaded_irq()
> (which takes *unsigned* IRQ #), causing it to fail with -EINVAL, overriding
> an original error code. Stop calling devm_request_threaded_irq() with the
> invalid IRQ #s.
>
> Fixes: f90db10779ad ("usb: dwc3: meson-g12a: Add support for IRQ based OTG switching")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>


-- 
balbi

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
