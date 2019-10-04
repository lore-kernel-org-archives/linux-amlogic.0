Return-Path: <SRS0=++Ji=X5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388D7C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 14:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA6620659
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Oct 2019 14:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nenetjRi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E58EWgdv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA6620659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYDojBCGvIz4i3kfPOFJvHXk8N2ANAw0DDO80TzQiYA=; b=nenetjRig7Xwym
	T62Ut+Ss8Hjn/LnDQDtiTq98vMiH8kMiK0iF/uu0NEv02KhlyqNE19EPWp1Yly7Z4sGVfZgm6/9Yj
	4P8BQhAnRxwNazAvz1K9lkjhXx48x6VsM4msQldILmiVNgzXMmykI5zDO0oJcOKP5+dM/GVrlyYjC
	KVWdB2mkiPzSJ1qt4+gdk5IRi+VvyuU3hN3B5DXMHyUHO1yFiqqu4fsevUfaIZTTMht7G7w0fpjMP
	47DoHehDEqbMPYJcppXRLbVJG2T9+6ixYa70QdNqmUZZJX/KY2VBJp7IO1I9jZqroHlURagO6jzxt
	jTgqCCKwZKiWjCNIjx9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGOr7-0002Zj-Gx; Fri, 04 Oct 2019 14:46:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGOr3-0002Yf-J1
 for linux-amlogic@lists.infradead.org; Fri, 04 Oct 2019 14:46:51 +0000
Received: by mail-pg1-x542.google.com with SMTP id q1so3912670pgb.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Oct 2019 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vrpAOV+426YcY2dvYTmCxBoSkb9QFrfgtxFZXoZ1T88=;
 b=E58EWgdvs+fgVnvg68jCcK9hRiNmsBZbNXQogt2zXknBgToFwfqE6QOOuIFjqqHiax
 S8ZOe8VERGUSJ9gIbHp5qxn/GdXNf9FhWJEpC8litDvzuoUo8e2lSNjDdPmcFbrqBjau
 BmoWDjGYpXlEO+iu7lNKfeAu/ekV5SLtUGlrBj6KKzwFMS3l6BhQ5kILJTf5/CAZx+HR
 EChLHgj7yy/w6tFLYDkPTk9kJihy3j/McdB1+dqHozQsYFHeMqMqfDhRNyNUE+oEZ4tL
 qPEqEF/YZ+4o4SD+navIpoAXd2lVnDGbh03yyds24AUDBUJc10AckJtvWagyhV32YrRw
 dyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vrpAOV+426YcY2dvYTmCxBoSkb9QFrfgtxFZXoZ1T88=;
 b=iTNiOl/bXTAezBYraOenlD76xz6KHPfU0/T4fjKelO4lNCf7/uWZpprRSPNNp31Qxs
 w4bGOlyMTFpaccqtA2ucgUn6cxXAi7ehp13iCzaWKMolEepxVy/erpYRw5HaNYOJBpC2
 PxWk30lmYSQ3HMHagF9rF8E23Si3ICMDP572z2lzxaKBiFGEQvlR8/v0VRc8PMnzJcLs
 4EeoFGfMAXWuNk0mHL+CovbIFV6IFtwrtR3X7hSZFGXmSYpKx7j08s88L2CeWIHQaxN/
 VHChfeRh9lLnKcxIT/w78n2xxXgxswzuLfOZvr8cpehxLWbdhLVkhIjyPttgQKtV1zcu
 JPCw==
X-Gm-Message-State: APjAAAWByPJi8jc2LxJgXNYmavtTJdRn/FC/CMlgcKDB1ElkrmGxLeyu
 fpVemzdBiXu6MgJ3Ol5Jt5hamw==
X-Google-Smtp-Source: APXvYqzOUPGXab6AXJASP225dZhPjVnVqdYiSvOwfHQmdwXVgOva+jxCkR0avI35E8JbEplmXeZ7fQ==
X-Received: by 2002:a17:90a:cb07:: with SMTP id
 z7mr17162183pjt.67.1570200408918; 
 Fri, 04 Oct 2019 07:46:48 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6c63:e3e5:f440:92c9])
 by smtp.gmail.com with ESMTPSA id w10sm3834115pjq.3.2019.10.04.07.46.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 04 Oct 2019 07:46:48 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Philipp Zabel <pza@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/2] reset: meson-audio-arb: add sm1 support
In-Reply-To: <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
References: <20190905135040.6635-1-jbrunet@baylibre.com>
 <1567693618.3958.4.camel@pengutronix.de>
 <1jk19oregr.fsf@starbuckisacylon.baylibre.com>
 <20191003180311.hlv7s32twzcaxj3x@pengutronix.de>
Date: Fri, 04 Oct 2019 07:46:47 -0700
Message-ID: <7hpnjch8ko.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_074649_671816_1466B9C6 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Philipp Zabel <pza@pengutronix.de> writes:

> Hi Jerome,
>
> On Tue, Oct 01, 2019 at 11:40:20AM +0200, Jerome Brunet wrote:
> [...]
>> Looks like this patchset missed v5.4-rc1.
>> Could you provide a tag with the bindings to Kevin so we can use the IDs
>> in DT until the next merge window ?
>
> Does
>
>   git://git.pengutronix.de/git/pza/linux.git reset/meson-sm1-bindings
>
> work for you?

I'd prefer a tag as that's more of an indicator that it will be static,
but if you're sure that's going to be static, and is the same branch/tag
you'll be sending upstream, that will work.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
