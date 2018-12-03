Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83C0C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 23:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA4482087F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 23:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="faN9u47D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA4482087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twj1c8pJddnuuMcC7zxhtfYHveMRFtualyyX2J9YM/8=; b=faN9u47DX+hNPe
	WXGX9svalM762I8gE2BRsSNzuL8v5LCT4obNBkZj64lJoow+nAm31m6weCOIPpO6WosVkuysu2vv6
	0O/4bz2XaeIiCujSU/DQJKv8J7gUUUjFzDAnH8uorcG6Q7b2N7qq7a1FlbV7WXF/GQxc1zcNF0Vai
	/MQuUsXcn1axWg+x5fPS0dI46DTlJWZzoz50QBhNsu8rRx7KA0i5WHRXDJiSKWUfCPYy0G3bMb4G1
	AZBVndJN8twtfuuPzrV1XbjXAWb+PC/+pYtHyRe67NOBZrh5LdtVjsTyhWEXfSIOYy4yOv4aFM3rN
	T4xLg10PsyUecKNknxSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTxIq-00009t-Dk; Mon, 03 Dec 2018 23:07:00 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTxIo-00005f-0c; Mon, 03 Dec 2018 23:06:59 +0000
Received: by mail-oi1-f196.google.com with SMTP id v6so12580550oif.2;
 Mon, 03 Dec 2018 15:06:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fykzt9+oasdrpA731GUHJsxFDYJLbtBr6RBAlsGsPoY=;
 b=aUCY3KsNOP8hQwj1ZTLaw9lnNmWL9xfvhipcPod0zCtXbV/azIvUAutUf8S8JWAAas
 qth9QOXFtKVBKn1wjleHC7flsAtyWyapNWs+9bVHL5RNT9khpIo0tq2V/27qdXU1F4J9
 P5VGahEz1glYRuPEu5BVdIcD8BkOC+XCfNFCt8ISCwKperhjufEdBy6h/Y4EJSSF49PS
 pOzdkAY1+Gmv91AJiU8ZSllGJbcfsYlQcvIwP4JXUYYOobOnPIoe/4MS2wsNGuVXhZFL
 aEzUhHVBISLW+r8NhVSftqB2TR+S9Qmnys+1DLXkWZo+SwmXc4bo297aruWqCrht4fyZ
 zRlw==
X-Gm-Message-State: AA+aEWavZ1fbkaYHq8Imz7I0zPgjXbwwuCuoAb9phm/Aur8yQNxjDyY0
 xCR/Go94Q72LqBFOU2rWZSEAT8E=
X-Google-Smtp-Source: AFSGD/Wa8PXjS5kg5/8uFA3PzaV0srzzLgfPcv/Y9iSFoT7SOgtkrEbBZAr+IyyudAvT3L+T2hr7Lg==
X-Received: by 2002:aca:3644:: with SMTP id d65mr11462277oia.336.1543878406800; 
 Mon, 03 Dec 2018 15:06:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u18sm5614304otk.1.2018.12.03.15.06.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 15:06:45 -0800 (PST)
Date: Mon, 3 Dec 2018 17:06:45 -0600
From: Rob Herring <robh@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: clk: meson-g12a: Add G12A EE Clock
 Bindings
Message-ID: <20181203230645.GA14522@bogus>
References: <1543498917-98605-1-git-send-email-jian.hu@amlogic.com>
 <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1543498917-98605-2-git-send-email-jian.hu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_150658_139522_5A3DED44 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Qiufang Dai <qiufang.dai@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 29, 2018 at 09:41:56PM +0800, Jian Hu wrote:
> Add new clock controller compatible and dt-bingdings headers
> for the Everything-Else domain of the g12a SoC
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,gxbb-clkc.txt           |  1 +
>  include/dt-bindings/clock/g12a-clkc.h              | 93 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
>  create mode 100644 include/dt-bindings/clock/g12a-clkc.h

Please add acks/reviewed-bys when posting new versions.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
