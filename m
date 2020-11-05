Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14523C00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 08:31:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87EEC20729
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 08:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENL6wMUc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fullbizgoal.com header.i=@fullbizgoal.com header.b="eHuS5hbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87EEC20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=fullbizgoal.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=auTN1z7hkOhr5hmB1ufNLvH5xN/pH4AYGBHlD8Duwjo=; b=ENL6wMUcdY9MJ3ICuDMAYHETJi
	pKjuL3JZdKkvDuE6h2NholsyVtYP+TdmuRHxcAjKCBoHqPfJp/SCAx+TSULm8s6ZozEOvzsdDwVYt
	FCyDMGSLrXKoQ669ZM+I6Fib820N0J0F5zZChcvLPgWWNgRbmhhyIAIG+pn9h8IOOIOmS7FAGkus6
	aEzTsW9kFje6PAMgTLypJLThKiZyt6ar0QJoNe1LBUW7t00Naxfmbbc1y3QXZ/0Rk9tlqft0qutBT
	mWvIJGfg9l0TacyUSvjZjUXn7BacxUFf//n1UU6c22l6EXJJLAP0hqdqc/jX+zWMZ+MHnO8wEOibe
	6MV5ulEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaafe-0003FJ-V6; Thu, 05 Nov 2020 08:31:03 +0000
Received: from mail.fullbizgoal.com ([80.211.27.207]
 helo=server1.mail.fullbizgoal.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaafd-0003Ep-Ai
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 08:31:02 +0000
Received: by server1.mail.fullbizgoal.com (Postfix, from userid 1001)
 id F3299A52FD; Thu,  5 Nov 2020 08:30:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fullbizgoal.com;
 s=mail; t=1604565059;
 bh=1A+RQztZunBjkjQlXgr2uQY18vlGaIq8j7jGOmWqiI0=;
 h=Date:From:To:Subject:From;
 b=eHuS5hbhJ6wKaYygn7Iizco0uXvrB0DElCvE+zdfsc1sOvksrQ3yryxUj5xXNhc+J
 yqIqluw8Aj6/lzI3870+w/mB4PhRmpw56FHy7D/NyH4Wv+hcfvBp+1bjKP2Yr0Pw7H
 sVQeE9hmhZyUjKWIaW1GQW+O3w5RJAA2S3biKb6A93ciYU4Q0E8zKItVVP7vNd+3VF
 CH5w7PPsXR3gri7o7PO9GTdWu+rnP0AgGbjYyoEpC9jzMeCqNdprtQbktIy40C+Mbc
 Jl9NviqTadQ7fJzsoMuitt2sdU8suTJzWL1MSzoHlvYwJnniYkbCpEXpxeri86Xb6z
 CidgpkCf3+yqw==
Received: by mail.fullbizgoal.com for <linux-amlogic@lists.infradead.org>;
 Thu,  5 Nov 2020 08:30:14 GMT
Message-ID: <20201105074501-0.1.2o.ez97.0.im1i59e1o3@fullbizgoal.com>
Date: Thu,  5 Nov 2020 08:30:14 GMT
From: "Ethan Smith" <ethan.smith@fullbizgoal.com>
To: <linux-amlogic@lists.infradead.org>
Subject: Disinfectant
X-Mailer: mail.fullbizgoal.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_033101_569940_73424C55 
X-CRM114-Status: UNSURE (   0.93  )
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

Good morning,

looking for companies interested in raising additional capital by diversifying their offer in soaps, liquids and gels for hand disinfection and cosmetics for body and hair care.

The distribution of innovative products corresponding to the current preferences of customers in the field of hygiene and preventive healthcare allows our partners to gain new markets and achieve better economic results.

In addition to products with bactericidal action, our range includes shower gels, shampoos and hair conditioners, as well as efficient, concentrated detergents.

The versatility (suitable for all skin types) combined with an affordable price means that customers make an informed choice of a product among others available on the market.

Are you interested in cooperation?

Ethan Smith

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
