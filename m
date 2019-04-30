Return-Path: <SRS0=l/Xo=TA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF44C43219
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0594120652
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2019 20:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u/fDZBmH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0594120652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iB8LTK2l5V0ST2ItLP/zTxx4HX8V3wdyi8iXGPb2fa4=; b=u/fDZBmHrVHJFC
	QvnNPbQJhaHaD13+JyleTSMy65izz5m8EtRg/Y85bT/TnS9SoQiHcYJfEI9fQZw7Dcf7iyG3S0nNX
	vXB+NgdgIkHGIeyZSSs2YRs7QOuLmo41yu7Mz0WbeY/JCe8sJdVZ1OJqYOpCbcezky22P0RgBPQq0
	VMfwQ8A5qPOcEC4QO+YyUpLO3BJ6XqznItXHzHq5QI79VHQ5LKX3G0cG4j7fwQ4ohERc7cecOiBtG
	ce+jE+5AqRESJtYEbb4wxm1fsBVhCGJbZnRb6D+LZ7rmzrI+BKicYQsNBuKUShIXMHjEMzEd+0KkG
	70ZmTs/OwRbnVXZ7eygA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLZkR-000377-51; Tue, 30 Apr 2019 20:53:07 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLZkO-000341-Em
 for linux-amlogic@lists.infradead.org; Tue, 30 Apr 2019 20:53:05 +0000
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id 6A35D4668DD;
 Tue, 30 Apr 2019 21:53:00 +0100 (BST)
Subject: Re: [PATCH 41/41] drivers: tty: serial: lpc32xx_hs: fill mapsize and
 use it
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-42-git-send-email-info@metux.net>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <3cfc4396-b152-e9a6-bf29-a4c901ac90e6@mleia.com>
Date: Tue, 30 Apr 2019 23:52:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1556369542-13247-42-git-send-email-info@metux.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20190430_215300_466850_76BEA83B 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access
 'reaver_cache/texts/20190430_215300_466850_76BEA83B': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_215300_466850_76BEA83B 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: sudeep.holla@arm.com, linux-ia64@vger.kernel.org,
 linux-serial@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 slemieux.tyco@gmail.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux@prisktech.co.nz, sparclinux@vger.kernel.org, lorenzo.pieralisi@arm.com,
 macro@linux-mips.org, khilman@baylibre.com, matthias.bgg@gmail.com,
 jacmet@sunsite.dk, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Enrico,

On 04/27/2019 03:52 PM, Enrico Weigelt, metux IT consult wrote:
> Fill the struct uart_port->mapsize field and use it, insteaf of

typo, s/insteaf/instead/

> hardcoded values in many places. This makes the code layout a bit
> more consistent and easily allows using generic helpers for the
> io memory handling.
> 
> Candidates for such helpers could be eg. the request+ioremap and
> iounmap+release combinations.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
