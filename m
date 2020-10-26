Return-Path: <SRS0=Jp6n=EB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E110BC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:12:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 893A924641
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2020 16:12:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LrnNzPGL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aelHvFZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 893A924641
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y+V/ejyacw1c1apInuG91bXlFxZCp2WiW1ajAbtLHgQ=; b=LrnNzPGL0UgWhXThLyG8qPSAX
	O58NZXJ6uUveiE7Io0erx1VoVnE+jUxJUAaa0tslllVLRTVLJdzcMJ+09sBwz9UXlaONKMdsShkNG
	5va6jLR/cCKtCEPi2NV/SYb2KFIudboozjQsB8ZHPeKrV+cOwHJ5TP5h6iTxEruSRMOKdHtndyol+
	zlr2Y8hbFaIoxN4yA72Gq64m2qRCP1QEUQH7b08fC5LoCjRSrUdY6tlKIiz8382wLbZBqPBcPismz
	91clTPnAy5rZY3n89Ocz+jsA2LAZQgo/uERtPVxUH5wi0mAbq2ZmqweueIIO3QIPA59vdjwpG1psY
	mvwPx/G4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX567-0004uv-KQ; Mon, 26 Oct 2020 16:11:52 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX564-0004u1-Ui
 for linux-amlogic@lists.infradead.org; Mon, 26 Oct 2020 16:11:50 +0000
Received: by mail-wm1-x343.google.com with SMTP id d78so12239343wmd.3
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2020 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=MrGekxdAPW7pCql7h2Tv9omsiLJVrXPqKjbDYUjsVnA=;
 b=aelHvFZ7VVoaw66b/eTLcw4NHujLV695zzPkcCEpslJ4CI5ITS6vQRjIAN4sm5h9LB
 d10q/bjwym5UJov3m8CGeWzzCl8f4Didlm5LECv+ucmsz85lSdD3UC5JJVUWBphTWCYe
 vI2SbXAmqTzZF4t4nxS5uWOMlhpZIpP1EZScernN5WsxN4J4MLnzITdjcHPKyGmhopq0
 XjGEpfU6kegq+H8XTOhN9UVU1DUfoa1DWrpZ7GTbPMp8iD6s8OSLDoTqtrkKxuy6WCiA
 woL6ZF4W8K7yV//EyLospwQj9LwbTSynxgbXd6MjAOst7ImQwE8e4C+NjdfY7buKJBUm
 991Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=MrGekxdAPW7pCql7h2Tv9omsiLJVrXPqKjbDYUjsVnA=;
 b=dxJNQVeaKuHp/L0p7AKq/nEFDmfkuPrOz/w0V5lSRvrz1U/rdnJv3DjVwaIDsxBqHm
 /ifVMf+IU9cBEA230h4c1KAtoA8Oq6U9gpJ7Bwha3Nr2Lj5xbzaUtonnyIL3hgvqPOk8
 EgpKkRt8kjzoM+v1xPX5WsyySoUffoTMgHuTwsMiaxHyHeUex3rzFbYMmzQ4s4fe5hCp
 rCD+GXQN/Q5Nf3XynF7migNEtoFrk71PDV57P7lNx46PtQziT7iaeom5A9mBsJjxuoPO
 C3704L8H/r9ysuvoCsVMlMzZVsCQikz7PccztywzWNinwR+Ko6W39i8JtjLMl90Td70C
 dr0Q==
X-Gm-Message-State: AOAM530mP0bsBK6hSHL8oJlrEIV+vRKf3a+QVC2nnGFxWX7lYjTDFpyA
 S59yUGsKt+MABFmTi2Al+ZkLzw==
X-Google-Smtp-Source: ABdhPJzXeKf52x+EglQ1SghEou/lfwa539rkLDDRWOkVklRdCre8gRDAcrgh2xpkYdkN5qhbfxywHQ==
X-Received: by 2002:a05:600c:2297:: with SMTP id
 23mr12411658wmf.104.1603728706221; 
 Mon, 26 Oct 2020 09:11:46 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r128sm22825689wma.20.2020.10.26.09.11.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 09:11:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 0/3] clk: add api to get clk consumer from clk_hw
In-Reply-To: <20201021162147.563655-1-jbrunet@baylibre.com>
References: <20201021162147.563655-1-jbrunet@baylibre.com>
Date: Mon, 26 Oct 2020 09:11:42 -0700
Message-ID: <7hk0vdhsqp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_121149_129964_FECC713A 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset a call in CCF to get "struct clk*" from "struct clk_hw*"
>
> Changes since v1: [0]
> * Add a con_id string to help keep track of the consumer
> * Add devm variant:
>  - Following our discussion on V1, I choose to have the dev as
>    argument as most devm function do. However, as Stephen pointed out
>    we don't expect this to differ from the one linked to clk_hw. In
>    this case a warning is thrown.
> * Add a first usage of this in the amlogic clock driver.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested this on a couple g12a based platforms.  This series also allows
me to build the g12 clock drivers as modules.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
