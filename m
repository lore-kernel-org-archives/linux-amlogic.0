Return-Path: <SRS0=khgl=75=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A2C433E1
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2020 15:06:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AEB32080D
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jun 2020 15:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o/92nYjP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GGqVzPSX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AEB32080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Phpsl5A2ZAB7d7hh/T4wxEmYiQ8TZhvRmW3OHa01XwM=; b=o/92nYjPbHYY+k2lMmUqEEfQu
	PRIFk3A7X9Y7vFtTvh/OzGmBSgGl6prIo8Dopu3LVrR5+rTfwLwLqBX74qg6ILthXZ5bExNE5FIME
	xCWZxWHAlg2nSjU230kMTtlPOWxdAqM3TN4uTd8vcperlnUQE4Dc4hE5FdnTnA7zMXXlxH5iAlqWe
	GHnz9aOP58PjHL3BDfYzDieL/8Q2rV74J9IYu8VxVZrYcnRwslM8wuWi75MqlwEUl7g5Y0uU32kTV
	GwImcRio74jlBm6ACYJB3MFJWnLqsrw4WzhVeYIkqnocYAwijkYwP1dkaf5gPJn5s45wAEd68ypEq
	4r5rSD8/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlDAK-0001RA-9Y; Tue, 16 Jun 2020 15:06:20 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlDAH-0001P3-Q2
 for linux-amlogic@lists.infradead.org; Tue, 16 Jun 2020 15:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592319976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMJwLzxJj7q5lIXa5apx7u6nKtBFyLcKdF8jh3rUT7U=;
 b=GGqVzPSXrUFyy1cmwGjVyPsA4PT6Q8j6QvkLWvU7xsriVXHuy0g9f7wub6gedGmL2OL9Na
 zANZV/JADlTpPkcCD6QYsB6FsXahq0h4xu9+mq4aEqPRn5JJojppQZx5xkA/b+anPtZ+3L
 cDumYwiMCEcmWjWw5Ta5gQkAu+24qgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-zoZVocg1PeKVqdkZgJCjfg-1; Tue, 16 Jun 2020 11:06:11 -0400
X-MC-Unique: zoZVocg1PeKVqdkZgJCjfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECA125AED8;
 Tue, 16 Jun 2020 15:06:06 +0000 (UTC)
Received: from llong.remote.csb (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41DFF5C1D4;
 Tue, 16 Jun 2020 15:06:00 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] mm, treewide: Rename kzfree() to kfree_sensitive()
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200616015718.7812-1-longman@redhat.com>
 <20200616015718.7812-3-longman@redhat.com> <20200616142624.GO4282@kadam>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <72aa954d-4933-333c-b784-f8df14e407e6@redhat.com>
Date: Tue, 16 Jun 2020 11:05:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200616142624.GO4282@kadam>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_080617_914858_D95EDEE3 
X-CRM114-Status: GOOD (  11.72  )
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 linux-btrfs@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-stm32@st-md-mailman.stormreply.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-scsi@vger.kernel.org, James Morris <jmorris@namei.org>,
 Matthew Wilcox <willy@infradead.org>, linux-wpan@vger.kernel.org,
 David Rientjes <rientjes@google.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-integrity@vger.kernel.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Joe Perches <joe@perches.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 6/16/20 10:26 AM, Dan Carpenter wrote:
> Last time you sent this we couldn't decide which tree it should go
> through.  Either the crypto tree or through Andrew seems like the right
> thing to me.
>
> Also the other issue is that it risks breaking things if people add
> new kzfree() instances while we are doing the transition.  Could you
> just add a "#define kzfree kfree_sensitive" so that things continue to
> compile and we can remove it in the next kernel release?
>
> regards,
> dan carpenter
>
Yes, that make sure sense. Will send out v5 later today.

Cheers,
Longman


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
