Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28307C3A59D
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 08:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9FAF233FF
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 08:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rfb1UNDT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fTc2Ztuv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9FAF233FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9dxyfyS7a03XWkviUzdizZSXjQsxQctJUSSnBkLZaUg=; b=Rfb1UNDT4KpiFY1O1uX6iob8m
	i+WBWi2aS9IkG+s3xJRonYO7be7JwmztzP8ILoS2/0ulh+8lv+r0rqemypTD9fYwS9OrUNtkA/z2w
	gdDZYPxc3kLbpRJ/hPlYMAYA5PckYUZFHZcMMiMF+uILiWaz2EDZOYQW6UGyNwTyVFoW4/iMxV5x0
	8h9rCh7NhiVAWFqrsYwszQ1dF1xZq6uuhLSYyVNa6pWDxHvELRySCwYmN0Nh4qI0vyYv9JYq0yZCb
	bbJrYSyGGLdjQSOKtQj5Sn7H+nkMSWl8Ziw8a/q6jF7D8Ou8Mabu6kFUcpZdNcuuy2wTQgZdVTAKh
	OHt61HaHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0iaY-00047G-OD; Thu, 22 Aug 2019 08:36:59 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0iaD-0003uh-3I
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 08:36:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id k1so4762957wmi.1
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hJPd4fuf0Q0sMRr9w0mel/Ifz7rq6P5j4CBybKzJMwE=;
 b=fTc2ZtuvP7loRUxCeHOgPc6dsw9cJe/gUATYN2BeKfWNZrsYWcd2marjjQdo7Lhqrx
 uLx1AGKf26OHMHtA5xWY3Rg6lgbYTKIL/O5bzItNqUt6HSSN3kKbS+U2utTdXj5gSNya
 L1KuOhXSniwIAEcJ9mY9B5gyHSRy+IbrzJtvOxGPofL6UU4bkSwFvGjfc7VdWBVSbSA1
 emEuDtg2xZZkrdV0Xqj5E0AQreiSXrMoaiUWwrU+t3iCkSZBq2GnSLMpx/JJPXuK1e+M
 2v72qAFJfFW0CyvlVoULupG3ZkhvrmIUF7SwS5HsVUoDhEefcLTyy3UJ4IXjZPjvl1+i
 wOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hJPd4fuf0Q0sMRr9w0mel/Ifz7rq6P5j4CBybKzJMwE=;
 b=dwr6AOBbqcE5Cu2F1lFq1iCUTpdu3RvkINI5ujeclE/s6q5Xf2w20Stv7+lYy73Aei
 Zjt3FsPhzCFUuNx8C3rMJcOg99u4bfoIcYSv7aMbDvFWLQyo/zkbGcqG7hVJBkFmPyQc
 W4y37wvosGFyLMTFTFcVw5oXRQy0DqVGTWKSqkW44glIwTgYK6ab2pONJlrm6uldishu
 yHbZHCmkw+u2l0DcgZCLJe8fSvr7Wbp+dz8R5sgiP2I5qrYjS6SO731q+mYpfbYRJOK+
 TBBd+Jl2SO9sH/nF3jhvVcndTB3x66EW7NiBmrWwf/O6213OYP/HPB7mdXNuEWpzoq4+
 EF3g==
X-Gm-Message-State: APjAAAVcnZyjAViJcA+SlZtabBnX6q+cBTgobFiJ2djYMEpGH0Ku5FH1
 COba1N80gJSk3dGfVntqVJz94A==
X-Google-Smtp-Source: APXvYqyEQYSwVXVVVF28yf/oOta4hazAt8LCB7iogxVzmdxVgpsq3i8NkGlKkfsdl/9+U3jsQN5rDg==
X-Received: by 2002:a1c:eb06:: with SMTP id j6mr5126462wmh.76.1566462995337;
 Thu, 22 Aug 2019 01:36:35 -0700 (PDT)
Received: from ?IPv6:2a00:23c4:f78c:d00:1570:f96d:dab8:76ae?
 ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
 by smtp.gmail.com with ESMTPSA id o17sm21342345wrx.60.2019.08.22.01.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 01:36:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] nvmem: meson-efuse: bindings: Add secure-monitor
 phandle
To: Rob Herring <robh@kernel.org>
References: <20190731082339.20163-1-ccaione@baylibre.com>
 <20190731082339.20163-3-ccaione@baylibre.com> <20190821181458.GA2886@bogus>
From: Carlo Caione <ccaione@baylibre.com>
Message-ID: <7c5307fe-2762-eefd-5c65-4ff7c4bd2f5d@baylibre.com>
Date: Thu, 22 Aug 2019 09:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821181458.GA2886@bogus>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_013637_137610_05E21A8B 
X-CRM114-Status: GOOD (  11.54  )
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
 srinivas.kandagatla@linaro.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/08/2019 19:14, Rob Herring wrote:
> On Wed, Jul 31, 2019 at 09:23:37AM +0100, Carlo Caione wrote:

> There's no need for 'secure-monitor' anyways. Just do
> 'of_find_compatible_node(NULL, NULL, "amlogic,meson-gxbb-sm")' or search
> for the driver directly. It's not like there's more than one secure
> monitor...

How is hardcoding the secure-monitor directly into the efuse driver 
better than having it referenced in the DT?

Yes, there is one single secure monitor but (even if this is not 
currently the case) several drivers can use it making the secure-monitor 
a resource to be potentially used by several devices.

--
Carlo Caione

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
