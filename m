Return-Path: <SRS0=4PA2=DP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C036C433E7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 01:54:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4663E207C3
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Oct 2020 01:54:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RFbwMm4e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="reB3SrSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4663E207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=esSjoPxbH9ENele4C7abHX4EpNUHfKoJpKT0qchgAJ8=; b=RFbwMm4eYyyxF8fcPGtQZVf5q
	PXSYItiWlwggxyFKmsvHPfTui1dKyPFPCK8zYywgv3Tdq2fmjIxL/FqgnX0ovpd4JnR0lmaLXDc55
	F16upwjGHUyPCYXUnOGfjlmVkk6XlDc1A+q3dkWm7OruJJef7znSysjlv5xi5RbsfiP4aV+wqbozn
	yWNTmYtDXt7ftqdDRCitn3Jf/fKrRdNqXWSSrefZWuz6JBG9gpz5i4jASgZWgUEbps5Fnm9jaRN8a
	fkbrRJqqlL+Abu4KmeJwlLXIPLxawW48RSVi+f0++XP87/O/z5K2KcGMj4TzEeVtIvhIEXzyzgtzj
	1LsHy7MXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQL8H-0005pI-HS; Thu, 08 Oct 2020 01:54:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQL8E-0005oi-F6; Thu, 08 Oct 2020 01:54:11 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 48551207C3;
 Thu,  8 Oct 2020 01:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602122047;
 bh=lV3i+9ypzLKkJz3H47NnyJWPoQ8C3bvpjkcCNkKvoKY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=reB3SrSx28A7TStUli82aUX7kqaxX8dn4Tyzi2zMW4h5WyU5q8Sb5G3rVUlrulvej
 5xtI72kTaGPUPpqEVuyn7CTxcceuA4nthzbJ93gBCeu1A/MQtr9t3s1JEPDQuWuWpY
 8HSCRDDRMib1C0z9vqfefCQkh0IBxsBo/y2OCPKE=
MIME-Version: 1.0
In-Reply-To: <1j1rimjkr7.fsf@starbuckisacylon.baylibre.com>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
 <1j1rimjkr7.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 10/18] clk: meson: use semicolons rather than commas to
 separate statements
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Julia Lawall <Julia.Lawall@inria.fr>,
 Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 07 Oct 2020 18:54:05 -0700
Message-ID: <160212204583.310579.15787381299278211019@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_215410_577878_046FEB05 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: Valdis =?utf-8?q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-09-28 02:47:24)
> 
> On Sun 27 Sep 2020 at 21:12, Julia Lawall <Julia.Lawall@inria.fr> wrote:
> 
> Hi Stephen,
> 
> Do you want to take all the clock related patches directly ?
> 
> 

Sure that's fine.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
