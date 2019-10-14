Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AA8C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0E8206A3
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1OW0dgB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebDLvX1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0E8206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g85tYab66amtV18j2BGuAXwB48hrik2jDlcdcuj1ZBQ=; b=G1OW0dgBcKBNuc
	HFwZC/wux1NuOo9oc4ndwwXuegMbOUNaIO1avXMq333yWUV84C2A2OgJAFzckmtcsUo5iT+d+nT/H
	mu0bQmOL0ZWlPE/TSWg9LPnjiw26SlnlGRxNPdFyevzfVaxlXozhpZ0Z2Mz+IFR9R7OLims2t0q3u
	OBEDUkZKC23vByg9PHaYSlowBuBh2uS6XtESvFM89/QhRKwsOgXTtl9ycisf1DnIhKwAgKuLSOHjs
	R+hnCb2tm6mXLkODk7RERUaq9MTdUoa5M1zie+lPQ4nE30XH7fflT4BBnqQFbcsR7u768HxhgVeqW
	LpH7GiAQ/NO4BL0AX4iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJsq2-0001XU-2N; Mon, 14 Oct 2019 05:24:10 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJspy-0001X2-UT; Mon, 14 Oct 2019 05:24:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id b9so18049604wrs.0;
 Sun, 13 Oct 2019 22:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xve2QTvqqiIPdY2swYgSXv/9sUgWk5VFoJkt1OR92XM=;
 b=ebDLvX1bdKNXz7niKOTITJlttM2yqn+U5mSeSdx27Nw37ZJBHchbVsxjnm9S+9kdFS
 ZUPGWBIqR9kAzDAWdVzk1t8JqcBFqs1q0++geYj+3QVKD7PtyvGb+YiEXMx4GzEUR7AH
 xApeg3UjxYXIBBcsg4SBLCS7X7p+s0j7/CQ0vEFQB+YAEvTfLT+tExNJpWrVnUCzrpDj
 1zw7IjL4AuuM7xemnvCOXOIAWfTbvKQF4kApFHr1wdiYHROp2NXzb9HMtlBJMuaoc+M8
 Z4m2nm1Tu8246UrIeeP3hv7/bawLQ2ImT+Y7C0UJnCWONfVGDZ+Qi484My6zd3b43CeG
 yfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xve2QTvqqiIPdY2swYgSXv/9sUgWk5VFoJkt1OR92XM=;
 b=PdM1PNRUtBH9uakR0BgXlIuAXsgZwaSit4xeLVzesLlp+ABZejyJhd9eFeDi5vps9B
 b1lpOUV+S2K02PCPFD53uwB5kT3DSFEghPTn0vSKhK0oKgKJ7hlW2UNFNVBWkNTw0a0L
 rpA9z9vUudaFu8EZS032tq972awlI1OHGAS61xC50/qCjlb0B+FOvnnOKC1HTBH0Xx2+
 Tlt0oFMo0/ldIWC6QNGAP+4FNVNcfzNaBx8XMt++xffC0Ke/JaxIgwkw+XElHPDVJW9G
 XPBdwQyeBXUYq+SXfCkZN0WkVFQt4UukaiUlmq53CT2jah4ydzqDdKAZfhyQyU3TC9My
 8n0w==
X-Gm-Message-State: APjAAAUfKfG2yeYRqFSft7Rahe9daOSsikcga5B6O07Em1xOJZmEd9G3
 eBWPedv692hF2PZwnvxgj18=
X-Google-Smtp-Source: APXvYqzKonVFcIAEMzbOIakcFdq1lvZBSxABTbSM+x411K7O0LoCDjIwqijCbmQF+KV9mHQY1ymlRA==
X-Received: by 2002:adf:9ec7:: with SMTP id b7mr1185229wrf.221.1571030645335; 
 Sun, 13 Oct 2019 22:24:05 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id n17sm16898743wrp.37.2019.10.13.22.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 22:24:04 -0700 (PDT)
Date: Mon, 14 Oct 2019 07:24:02 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v2 0/4] crypto: add amlogic crypto offloader driver
Message-ID: <20191014052402.GA30688@Red>
References: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_222407_007278_9F1C1791 
X-CRM114-Status: UNSURE (   8.41  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Oct 14, 2019 at 07:18:35AM +0200, Corentin Labbe wrote:
> Hello
> 
> This serie adds support for the crypto offloader present on amlogic GXL
> SoCs.
> 
> Tested on meson-gxl-s905x-khadas-vim and meson-gxl-s905x-libretech-cc
> 
> Regards
> 

Oups sorry please ignore this patchset, I forgot to send from my work address.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
