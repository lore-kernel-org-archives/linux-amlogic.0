Return-Path: <SRS0=XO7w=55=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9221BC2BA2B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2020 21:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5474020644
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2020 21:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pV6UNZLA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YiSTF1it"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5474020644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WcTsh2RFEcRFU6nVSqVdeUNJgSlIkd9Uw+HvkfU+N8=; b=pV6UNZLAhPyy7c
	xQR2oJJ7eaPANxoL2+ugGWKhLJ/SuySJawS8Yn8txj+RSMlK1KpvGj3PynOwPj7s7UvMae94NPELa
	t5Ul/LbRBvOVa7Dj+2n3LtUgcuxMLapLRpY6Ncvukt2jGK+yH2p9HGgcR5RMDPwi7jI77/oEkQVBE
	hIxdnNS9SEslQi2z+n/GShJ75STlvojyGx7mdACcE77Dh/2KfMgrmFKL78SHRUPi1x6/hLdozzYvC
	AEqmwBNb3ZhRnZUfVdK3+6UdafEPs7c5uA+lzDdnw9WmSKt3ogJG51utgfpzmNx9b7gbOINWnPNK6
	yxMgFGRrLnf6/RX/4K9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jO70h-0007kk-2Z; Mon, 13 Apr 2020 21:52:55 +0000
Received: from us-smtp-2.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jO70X-0007cx-AD
 for linux-amlogic@lists.infradead.org; Mon, 13 Apr 2020 21:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586814763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxqewLP4iDn0WQn56N4JoZnVO/VnkSCHun6WFS8TA58=;
 b=YiSTF1itxBYaI5wO7TETGkIrXeUy0/LoIQiEcy0yHumBGtM7y7vGK0BTK2iA+/5YtSFH3M
 Avs7PzTwX2BPPsVBWyUAm82FkGAXby4fAu8PPiA0mSHIhVnopp13nPjzlntDXtjpLzyiiF
 du4UJa47mfgu+2257AjBKlpKj4wgUCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-R_QYnAHVPD67nMQL-Amo0w-1; Mon, 13 Apr 2020 17:52:38 -0400
X-MC-Unique: R_QYnAHVPD67nMQL-Amo0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1B928018AA;
 Mon, 13 Apr 2020 21:52:32 +0000 (UTC)
Received: from llong.remote.csb (ovpn-115-28.rdu2.redhat.com [10.10.115.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB5E15C1B2;
 Mon, 13 Apr 2020 21:52:24 +0000 (UTC)
Subject: Re: [PATCH 2/2] crypto: Remove unnecessary memzero_explicit()
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, 
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413211550.8307-3-longman@redhat.com>
 <efd6ceb1f182aa7364e9706422768a1c1335aee4.camel@perches.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <7e13a94b-2e92-850f-33f7-0f42cfcd9009@redhat.com>
Date: Mon, 13 Apr 2020 17:52:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <efd6ceb1f182aa7364e9706422768a1c1335aee4.camel@perches.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_145245_431928_6911CC05 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/13/20 5:31 PM, Joe Perches wrote:
> On Mon, 2020-04-13 at 17:15 -0400, Waiman Long wrote:
>> Since kfree_sensitive() will do an implicit memzero_explicit(), there
>> is no need to call memzero_explicit() before it. Eliminate those
>> memzero_explicit() and simplify the call sites.
> 2 bits of trivia:
>
>> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> []
>> @@ -391,10 +388,7 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>>  		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
>>  		return -EINVAL;
>>  	}
>> -	if (op->key) {
>> -		memzero_explicit(op->key, op->keylen);
>> -		kfree(op->key);
>> -	}
>> +	kfree_sensitive(op->key);
>>  	op->keylen = keylen;
>>  	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>>  	if (!op->key)
> It might be a defect to set op->keylen before the kmemdup succeeds.
It could be. I can move it down after the op->key check.
>> @@ -416,10 +410,7 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>>  	if (err)
>>  		return err;
>>  
>> -	if (op->key) {
>> -		memzero_explicit(op->key, op->keylen);
>> -		kfree(op->key);
>> -	}
>> +	free_sensitive(op->key, op->keylen);
> Why not kfree_sensitive(op->key) ?

Oh, it is a bug. I will send out v2 to fix that.

Thanks for spotting it.

Cheers,
Longman


>
>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
