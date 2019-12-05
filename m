Return-Path: <SRS0=R0qk=Z3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDF1C43603
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 02:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69F4214B2
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Dec 2019 02:39:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DuW4vT0I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2AEXe14i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69F4214B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8m1OaxuKChh4agZ53PvApIm3FXGNpKhLrFcYCQIYgw=; b=DuW4vT0IJGN+G/
	08gE+/K7ucgTfafDoKryns02XOzeQ+y9wgyAbis8piyUGdCDwQpKqaSJ2ymSkRmq3Ku7WLsF1O90v
	MQnQKj3U5GJZQ4agaMHpW7OytXHeukewT4AiFoxTBZ7K3yxxipiWMzfJdLWf/dakveecg508cuORL
	bsSefEoSw//1L9UyJ9Vhpgb/VeAtRV9rRh0xpmT2StERdQZbKojfrX0RmyLjspiDUrAagxxrdqBNP
	eWKujD+yBnjzZF8OLcQq2XKTZrptyxoPRrVgYMTm78QBbrg3p7EbYnPdlI95JAhfiFH2uKb32BQOp
	Yowr0EG9OXLuay72smxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ich2t-00007c-JJ; Thu, 05 Dec 2019 02:39:11 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ich2r-00006e-1L
 for linux-amlogic@lists.infradead.org; Thu, 05 Dec 2019 02:39:10 +0000
Received: by mail-pg1-x544.google.com with SMTP id r11so853165pgf.1
 for <linux-amlogic@lists.infradead.org>; Wed, 04 Dec 2019 18:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=27jaH0vN7Z1055mM7vLy7qQTaIl7MlRb9ifdmBrbZDM=;
 b=2AEXe14iZdFWfADVPMho1nGLswqsSNlAEnAUgFieMyEajydA5UtIA2BcOw3cvQHdZO
 +7SSE0yQn7fq3n4nHsbvSjKepiS29Gm5WR9rq8NTOvdFdi1YqxhsWZNbYk8a14XIStKF
 hb74QE/F9ENthSZE3yzn0ZQDkHdLNmssNPXh/EW0qy0yWmB7IFhwbQ7Hy2WVvJXW05oI
 H1C0sUhnHCdN0aF6ajXMtxjjgQBm0bYucIo02eLqXp6IojHQsBo24gGBGz9ZhVJZDdLp
 4LhMKEeYfNiw1x190FxFAVW9rFhpjJNh7tIG1Cx/l25+RJ0xiWa5+IVfaItxv51z2fvq
 fu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=27jaH0vN7Z1055mM7vLy7qQTaIl7MlRb9ifdmBrbZDM=;
 b=rUc6ADYdoJ6qwTx/PVN56AlbGHEGI3wX1r10EHlhhWLsvpbnYpl2pC9UmNePkfOP3c
 I4kPufieNbFQLngxEXIViqQO2E63ZrnckRk5oL6Si3naia9KXu5/2l9nwwOpMmj6igN0
 jFtPHfRGr673O1XJSGnILy14A4QitkJThLulz4+0Eh51imkFSa8LyhFeKC9/th4koAcO
 zADH71DQ9B1jOtjHwZOPIPy+qQIFk/2ZrmyUX7B5ZXVZAX2C/oYILvkaf9DV9XVsKhYX
 XCj3k94vAGacDtU4jPcWof1vEmtDDAxtdklAJCcTR7eQ/i/o7Oeso6sb/Dy0AI7XGObg
 oqrg==
X-Gm-Message-State: APjAAAVd0aKKRszVuztUtJvmWjKJIulp+yykjoqPWoE+U/IOhN3/8kxS
 ZZRViZd3Lhj576/lfIvklkXnfg==
X-Google-Smtp-Source: APXvYqyArhAsoFW/09BUx58Mqa57A85qEfp9wqhmY84drnrMDAvAJYGziHESSDaQZke2fKs6Z2jx+w==
X-Received: by 2002:a62:6884:: with SMTP id d126mr6446169pfc.109.1575513548166; 
 Wed, 04 Dec 2019 18:39:08 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:18db:9496:e12f:2012])
 by smtp.gmail.com with ESMTPSA id k21sm8765676pgt.22.2019.12.04.18.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 18:39:07 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Colin King <colin.king@canonical.com>,
 Maxime Jourdan <mjourdan@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devel@driverdev.osuosl.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] media: meson: add missing allocation failure check on
 new_buf
In-Reply-To: <20191204141159.1432387-1-colin.king@canonical.com>
References: <20191204141159.1432387-1-colin.king@canonical.com>
Date: Wed, 04 Dec 2019 18:39:06 -0800
Message-ID: <m2a7877ayd.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_183909_224033_93603CC2 
X-CRM114-Status: UNSURE (   7.02  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> Currently if the allocation of new_buf fails then a null pointer
> dereference occurs when assiging new_buf->vb. Avoid this by returning
> early on a memory allocation failure as there is not much more can
> be done at this point.
>
> Addresses-Coverity: ("Dereference null return")
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
