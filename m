Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C3BC2BB1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A254206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 19:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIUQdwZ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A254206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD6U2QAn7wzH7GSniO6fqfO2/YifHQrPbl1WAAv4j9w=; b=NIUQdwZ6tiDaoy
	fwByr+ROGWQmF8eRQguVqvoJmSBCBO7r3V6yGa/o0jddRoMuhqrza+kgzQJVYaV/0UHE4+qY/NLqZ
	ondKmAyFp/Wz2CPWQIMW34Lv7EPpCq+oxAj4oC/9noSkh++PWwQoTwRRT0JSoMiIQg2zB/u2pxV9b
	u1RyBQ/CMpxVS8u+sRsKY6Cgmy+sk/Yw8IFbBOuDyAK5pPVm2/YuTZTcmhfNp+Kyfr42sOCilYOGl
	etSdJNNxVWI2aJytgEaCJ8pfUP5dtKjEKc1aMKOBfnf9C4yfaNvYJqbN8I3j4pstaY4fPLXpF9PaK
	0lFLNIarriGJ1UVV+Nzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORWb-0003Gh-Tk; Tue, 14 Apr 2020 19:47:13 +0000
Received: from smtprelay0189.hostedemail.com ([216.40.44.189]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORWY-0003FT-Km; Tue, 14 Apr 2020 19:47:11 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 9E3611802B57F;
 Tue, 14 Apr 2020 19:47:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: coal59_5a1e7cc02a463
X-Filterd-Recvd-Size: 2796
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Tue, 14 Apr 2020 19:46:59 +0000 (UTC)
Message-ID: <2a58f592879cf67b4c6b8e859ce87e1f9652902a.camel@perches.com>
Subject: Re: [PATCH v2 2/2] crypto: Remove unnecessary memzero_explicit()
From: Joe Perches <joe@perches.com>
To: Waiman Long <longman@redhat.com>, Michal =?ISO-8859-1?Q?Such=E1nek?=
 <msuchanek@suse.de>
Date: Tue, 14 Apr 2020 12:44:49 -0700
In-Reply-To: <578fe9b6-1ccd-2698-60aa-96c3f2dd2c31@redhat.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413222846.24240-1-longman@redhat.com>
 <eca85e0b-0af3-c43a-31e4-bd5c3f519798@c-s.fr>
 <e194a51f-a5e5-a557-c008-b08cac558572@redhat.com>
 <20200414191601.GZ25468@kitsune.suse.cz>
 <578fe9b6-1ccd-2698-60aa-96c3f2dd2c31@redhat.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_124710_739707_D24F4316 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 virtualization@lists.linux-foundation.org, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 kasan-dev@googlegroups.com, samba-technical@lists.samba.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-integrity@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, linux-cifs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, target-devel@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-14 at 15:37 -0400, Waiman Long wrote:
> OK, I can change it to clear the key length when the allocation failed
> which isn't likely.


Perhaps:

	kfree_sensitive(op->key);
	op->key = NULL;
	op->keylen = 0;

but I don't know that it impacts any possible state.



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
