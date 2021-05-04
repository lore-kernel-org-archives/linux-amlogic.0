Return-Path: <SRS0=bYYt=J7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE66EC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52E8F610E6
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 May 2021 00:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52E8F610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rrf01Z6JehoT/CftlRjL/LN0BcwuqslkPC1xZ/7F1tI=; b=R75Vcmwi1bH6dUaHel45VBvPS
	VrCN1uENgiwLk+ZYeaydM0yhhd/Qr9fMOl1XuCRSyQSDI+LeJlR0KCtVIwpSAE1HON6Ge80xVJAIf
	Lr+Wxu5fZ3swuQFLGVAVKrRLDkLxYdv+/v+PY3UPaxHjLuK13nTqa6okrSKHkriao75bMFSFecsYN
	G8w9GLP8ahYVEWvt8QpoUahCeSPApIii0ByLyYlKp8g4luBqgv+ik6fXmH2d5rW1MQ0WjqJwUbgyy
	RDvCwf8CANSAbxovUUKyWED7jlh19lygX9Mw3LUXU8XM/RVFhFKd+mhWntdyKVdn60uj+F2zhwshk
	jaxI4Fr2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldiZu-00F5SZ-Uc; Tue, 04 May 2021 00:06:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZe-00F5QW-Vv
 for linux-amlogic@desiato.infradead.org; Tue, 04 May 2021 00:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jlwag/uSXI11ILOIN89++20RL6/tXX3LDSgQBRBdBOU=; b=LY8cNvVhZzPr22BC4Ak+3GVqI9
 gVvamBZG6FvxJH2YMEqu0Y3N060UYY8KZKX2o2xoeXnquPkGSvViMHSqheuW3lmh4xkCR88LdoSQc
 RuyKr28ot11DGxjtnxXQo4LwnHHxZaFwqao1qdXYWPVoFKQt5IpnKa12jkaSLtmnoxjTqKXTmIQ56
 he0ojideM6TI9Y7Ld2zFmS8poFQV1aSJlqWSq1tkHJ+qamrSyZ+7P+AaeY7wsPbq4mm6Mk9IMtQWg
 h1W6moQF7E9F8tHLgOR9S3NRV7IBzFUmFMI3UxXsKzDeeKjujx2BhZlwO9/2ngvVZIRoYej8MANTs
 H84P5HtA==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiZb-003ZE6-0Y
 for linux-amlogic@lists.infradead.org; Tue, 04 May 2021 00:06:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id p4so5659509pfo.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 May 2021 17:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlwag/uSXI11ILOIN89++20RL6/tXX3LDSgQBRBdBOU=;
 b=ZQm8gFiW96TZMryAmLMnN0xnS/oS/3U8vLNnaJWFPJmfVBsGpLfYb8L0+IUNhSNr3+
 ADT08NYza76P++MU6x3/ETruXrriu4w82WIVNRjqN0KqB+aLcRoFwcmdV5Luvxnpf0sq
 bAT97oaVJ+cig/8tht9DwnLaDN+R8NGSEAcajrTBzwwNGB3v5mExK/xtHKPyED4S+/qf
 GLqufTBW8lMhq2xNoFvK4gaM0nf1Y3m/9jawWdlrxvLAl2zN2BBTl6JpBmwJb8g0xLyk
 wkQKh7RPkmiQ126PUUn55ZAmG0o6pje7F2BwAwTj6eNfipHUUomPiCmgZu2BG5bPGTdz
 oDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlwag/uSXI11ILOIN89++20RL6/tXX3LDSgQBRBdBOU=;
 b=ON7Khtm7+AoGtlCYDi964N3vrjBaL8C/LBp6dYEVN0pQBaWFtuN3Qur7Gzxts/RupI
 bjfNPfs/WGH50lOw/afgg9NsQNLMP2DzCdAM+Gbs5bO1FBca1Y8WWJVTqjdLqov0qeTh
 zijOzffbc06nmHR1Qdr24vPY5FP8FRST/4XPM17MZeMR+4mHY52fdiBeQxXcZWsV1Inz
 X08Vys3kyk+gdxRSCf6oVjpG2B1tNaoxTjpw/5cr+Ti2UY3eFUyky1WJ/HXVrL37S4YH
 5mv+RUxyfrzEUaXMfMhywnkvDCHeje/wQQlzH4cJGEvyMLSYQARJDGxMZubFhuX2q0+j
 izCA==
X-Gm-Message-State: AOAM5339LHjx/Y1a8tnlq3IfxMxHlTpgUR4FaJ2EOWhpg6M5mpv4qmWx
 3qh7e+dpA9VgXjKSbYZnsKLuLg==
X-Google-Smtp-Source: ABdhPJwZ+dFy8uvseVcLfYrjvph2vOhgI+bPnckBb9XnFgLOdOCwxUBjA0t+PHSHMR6Hn+tVwrQhPA==
X-Received: by 2002:a63:4648:: with SMTP id v8mr12263361pgk.34.1620086758143; 
 Mon, 03 May 2021 17:05:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f201sm10222879pfa.133.2021.05.03.17.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 17:05:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Qiheng Lin <linqiheng@huawei.com>
Cc: Hulk Robot <hulkci@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] soc: amlogic: meson-clk-measure: remove redundant
 dev_err call in meson_msr_probe()
Date: Mon,  3 May 2021 17:05:54 -0700
Message-Id: <162008674673.40672.9817801757275466869.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210409110243.41-1-linqiheng@huawei.com>
References: <20210409110243.41-1-linqiheng@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_170559_067429_29527A8F 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Fri, 9 Apr 2021 19:02:43 +0800, Qiheng Lin wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Applied, thanks!

[1/1] soc: amlogic: meson-clk-measure: remove redundant dev_err call in meson_msr_probe()
      commit: 4f2f0162a389196fb4092aee93ef4a89f96390be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
