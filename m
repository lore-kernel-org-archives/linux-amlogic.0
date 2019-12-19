Return-Path: <SRS0=7hc/=2J=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E63C43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 23:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD4DC21655
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Dec 2019 23:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nH7tkIuL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD4DC21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/vvnk12HbYQc+4wm/SgoO3SV3t/hirlkc//VXWMkdz8=; b=nH7tkIuLI52Jm8
	mFtMPhd17hxAjg5Tc0rcbIvOGo+zjAgeZ11obw26Z0znk/OL2VYJBxdxjc67vd+m9rXf9n0fr3yAZ
	mt1lEdskPVgEsQTeoHTqFRSXlQ/tUuul9N1HNMnCKOsXvnnuYR30uvFUXxWuOU9FWKey51ztQf0v9
	n7hKyAv5hEnuqyAoEUXifJ4xC1rtIxuo7KCxlDeGh/Ib3Hp3j9WMXnXjaM3pbT/N0l7c71cTF/0kH
	ZcFJmrsiQWaHkduZeNZ/DnvV6x6NVXZhhyBgwhfFSfTi2wJORHJ7tKAMW4z70GfGO9a3nStPwoBwy
	UuKkkhQW0+nMnAQMNT+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii5Nu-0007J2-3d; Thu, 19 Dec 2019 23:39:10 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii5Ns-0007Id-1Z; Thu, 19 Dec 2019 23:39:09 +0000
Received: by mail-ot1-f65.google.com with SMTP id 66so9324586otd.9;
 Thu, 19 Dec 2019 15:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=49NkEdPVUTrClJQG9wypO7j+KSvP2cMEHBxilTCm4Oo=;
 b=oosigDM8y9MgJRg/KnzmZWM1Fb14pl0gIuhhGgJ9xRPRi0dJI7CpzVPzgfxR73pCvp
 pY4IjSm8BgjocgcaMfe0QiLOLnexqIZo+Q0rKR8HCEzxwSSEmUry5PFFn9iI/JfP3/R9
 4aSxsV2RCAa8IB6GzcHbHeQgY5we1m8j3N6ST5rOPPd1FW8/9LTS37hS1PMdjbTjscoz
 EoxLDV6dOZYPPnyTbHynRa/KCIOq8g57pF8R0b61fW9mP6IsyQuKBhuLBpiiLHiVNTcE
 WeoA12bcBDQg2HzMCSptMydom8TcFLyA4578g8IGogQpY6rgLx0VGjKYSnBqhm4pwvEd
 EFAA==
X-Gm-Message-State: APjAAAXfXXmxwC9gUAIZldNLvZQRMnOWAiyJhCjqmPtIoN6E+F7uKlfr
 U3eq1FS+LDUE0Dd7mV560w==
X-Google-Smtp-Source: APXvYqxzLHH4qXGeUb8cHj1eoRujkYAF2qvTXqb8zLYaI8LIyC64mQDJGqWuHCRdXoGlm/z+AQnO2w==
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr9303245otf.107.1576798747100; 
 Thu, 19 Dec 2019 15:39:07 -0800 (PST)
Received: from localhost (ip-184-205-174-147.ftwttx.spcsdns.net.
 [184.205.174.147])
 by smtp.gmail.com with ESMTPSA id w192sm842206oiw.8.2019.12.19.15.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 15:39:06 -0800 (PST)
Date: Thu, 19 Dec 2019 17:39:04 -0600
From: Rob Herring <robh@kernel.org>
To: Guillaume La Roque <glaroque@baylibre.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: meson-ao-cec: Add
 support of ao-sysctrl syscon
Message-ID: <20191219233904.GA18354@bogus>
References: <20191213132956.11074-1-glaroque@baylibre.com>
 <20191213132956.11074-2-glaroque@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213132956.11074-2-glaroque@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_153908_085916_9D6D0A70 
X-CRM114-Status: UNSURE (   8.46  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, hverkuil-cisco@xs4all.nl,
 linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 13 Dec 2019 14:29:54 +0100, Guillaume La Roque wrote:
> ao-sysctrl syscon phandle property is needed for CEC wakeup support.
> This property is optional.
> 
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  .../devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
