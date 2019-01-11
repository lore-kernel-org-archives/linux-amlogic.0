Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF72C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:56:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3D1214C6
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T5N+KzZN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SXXtYcHC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3D1214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPt+gHwRGlRr1fU9Ew3J0Hp/vCdB2FjHCHrNszVeDPs=; b=T5N+KzZNLMTrq9
	EvyHSEH/cawpIN+Unq1B4I9MvoawQ5zXd6CntvKHy1pkXkubOHrlycL+6nudL5obdQC9kfUTmc83X
	C71Lt7veZ3JR+3cGxwORFNuTtqROPzoU38DWYY7YOO/BjkNg2R9yYXbdHSNH2vYMV7hZ62dKmVgaT
	ehMhkhBaVLHXRCkb9bM36usu6AyHeMN00x2joOKsDR/Y6K42Wtj1mkU86LiIDqHybk7Ja7WmRIfKb
	mRn7NqudsnTMOy4Wb5ENpaGhjb8paUj/E19An7xsHqcBS874w+RoHVQMADzRY08lEoPP+QUmkgzZM
	CkaJ1/p/ktpQyEpSYksQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghl7P-0005oW-RX; Fri, 11 Jan 2019 00:56:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghl7M-0005oA-Rn
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:56:14 +0000
Received: by mail-pf1-x444.google.com with SMTP id u6so6089360pfh.11
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=fdX+hHe5p7Ut/PjFgtiopHtFN+o3AGHOlKbAZ9XEL0g=;
 b=SXXtYcHCNJFH0P7ohGyYnxYTxVd6AIXhN/J856UeqYDdIXz4/VnKlEg7F29+EygMlg
 X5NX2ER+7SkrNoGIRKSjTdQ1PeWzeKR10/QY8rG84ndrFQxySwH5Sb7VsOWPv2VTiQ6w
 7nnf997Qcp+UxzyySAghRu2767LDt0xz+LESFW9MgCX6IIWumi2A62C3brXyp5kXx01v
 b6YaLSFuH9Xg7QDJwElcM6MXoaoweJgx3Oaivz7WvRK7mBMZzHf0WtI7il1gWoHOy+jt
 3lwZ5vagjWA9FWcS/hxzg3gcAGFvIM9M/5mkbqflsYsMoDefXXxJKlN9NJ78oxs8L7/m
 EoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fdX+hHe5p7Ut/PjFgtiopHtFN+o3AGHOlKbAZ9XEL0g=;
 b=J5uvdG1nS24qRhWUM3Hy435hxe6/yPZyXFIC40UKICd7pxe5x/g3SJHsKN6zRtK9H8
 KOR3znjNbL0moBRfpCCmln+JifAMh8VRg76exyzrBYW0Bi5B7FgtT8D62MnsnUIrIHXs
 9KhEBlXlyyqK0mvnZwIr/pm9Zd+97RQFAwIzlm2ReceBCrDhhf6cdfrHKIqX7+WgGY7b
 ejLWi3lnT4fzChhZ5/YVroke9F/vM526VAf9NmMci1U/MAdbo5jSxoU7sd/GJ/YrnXvA
 UqtDTMtM8jwPCndbnTpbVU2OBqxCutrcykBm+mpzQNJrYlN6kTejLUfnkhJ1K+zszsnj
 fjLA==
X-Gm-Message-State: AJcUukcw5qifHfR8gB/+RwdwPRjfUaajwt5f06A1pJdqWgz3+0XOQJ8J
 woSg9exK+s9U/qH2ErEVH/MRmA==
X-Google-Smtp-Source: ALg8bN5s4UZ9QMHro68cxqbqtnohjyfJw7c9JdXE32j3RbaEOjUWYy7WL1FEUryZGsu2OGr/VKw6rg==
X-Received: by 2002:a62:c683:: with SMTP id x3mr12172204pfk.10.1547168172099; 
 Thu, 10 Jan 2019 16:56:12 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 c67sm102544055pfg.170.2019.01.10.16.56.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:56:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] driver core: silence device link messages unless debugging
In-Reply-To: <20181221162341.9847-1-jbrunet@baylibre.com>
References: <20181221162341.9847-1-jbrunet@baylibre.com>
Date: Thu, 10 Jan 2019 16:56:10 -0800
Message-ID: <7h36q0qafp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_165612_902002_716393B2 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: linux-amlogic@lists.infradead.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On platforms making a fair use of regulators, the dev_info() messages
> coming from the device link function are a bit too verbose. The amount
> of message will increase further with the clock framework joining the
> device link party.
>
> These messages looks valuable for people debugging device link related
> issues, so dev_dbg() looks more appropriate than dev_info().
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/base/core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 04bbcd779e11..8d330f921ad7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -301,7 +301,7 @@ struct device_link *device_link_add(struct device *consumer,
>  	list_add_tail_rcu(&link->s_node, &supplier->links.consumers);
>  	list_add_tail_rcu(&link->c_node, &consumer->links.suppliers);
>  
> -	dev_info(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
> +	dev_dbg(consumer, "Linked as a consumer to %s\n", dev_name(supplier));
>  
>   out:
>  	device_pm_unlock();
> @@ -327,8 +327,8 @@ static void __device_link_del(struct kref *kref)
>  {
>  	struct device_link *link = container_of(kref, struct device_link, kref);
>  
> -	dev_info(link->consumer, "Dropping the link to %s\n",
> -		 dev_name(link->supplier));
> +	dev_dbg(link->consumer, "Dropping the link to %s\n",
> +		dev_name(link->supplier));
>  
>  	if (link->flags & DL_FLAG_PM_RUNTIME)
>  		pm_runtime_drop_link(link->consumer);
> -- 
> 2.19.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
