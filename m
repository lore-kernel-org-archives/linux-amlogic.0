Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC77C52D7C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2024 12:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+XsleldHfZbCE6pVBnlldBuAcXJi7Pswshp4Xg0PDc=; b=hQR+B+ZWjEsyAa
	xXFyEIPUJwUTXG2LP+tvg0dafr/wNAP6e6Slo+O8P2CJCH2GgUHXLI/eU9Y0foeD1tarEe+uxA06I
	XcAmxbtboiKgWpuuBL7zLUTBcRH5DAbuZh8544lxkGXwVy2h3w4Nd5ZbagL4cdEo3Dp0D4xuzxNcB
	Bqa1iMZIjcLZvgknLcl2jVlc6ExnXC/5HOn2sXLNCc2pWy4qOL6gi64Sg/+foZ+KARkpK3d0xPgl4
	slUQZM/0RWzcrYoY6S7cDsluYmTUvnLWjY+lLMKY8DT9KO5bpCVqHwxOFJJeAKgIyOH8bzBL3gQR5
	9k1ooMBbI+jysopsbpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr5J-00000003mrz-0EMk;
	Tue, 13 Aug 2024 12:57:09 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdr5G-00000003mqC-1UZz
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Aug 2024 12:57:07 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so59868391fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2024 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723553824; x=1724158624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hfkyu+ccADY0k0FfxuRa1b4o2Bw2fvhvcVBZ4pCO39I=;
        b=jjhOP1MEB3NRk+FEj0qieUcIODBO4uwYwQu+vM/DlgZrL256Es8n1YrzLr1FjSgyg1
         5kJHyB1hWcFZF6x4WzC5vbdDXFlJFb4HlJ6I4eFWeiTDpAE2sIg2MdD9zIRP0Ij6ZCzm
         ATlzukb5gLm6DfKLTWOkzR4vehyOwRwBk4ejg70bXDC09CDntNaloU2Snhhe9QkWrxDY
         xJQSlgL58XRdf0mu1tiFckMZbItiuKxr/RB55xaIK+ScqAnD2BMf/6X+U+f7AG9FB1yF
         zwPNDXMQcr/GVNhcc8GNPGdl/cSMfuZJDjPwDiAWQGTmG4Z7xC4BKPpsGi5Gc+yB1bMt
         hE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553824; x=1724158624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfkyu+ccADY0k0FfxuRa1b4o2Bw2fvhvcVBZ4pCO39I=;
        b=Xo02/wzfNK9zdLJCawqHEyzmMWOYJ21Zm8yMCJoJl8B5QZZ5W4JqSm5j9hEraLR/Hu
         6lu6mopvATxcnzk6xZr8r5PfKNHySq/HiJaaghOwLMGoR2c+kHaplf+jkwg0ZOwTG2ol
         PZt9daNn0aCbG5+/n+vOjCVvgPyNMKAk7AFSwuvhqB2QwGgaUHvoPAC80+ySyjr91pX0
         tJ36UTagtYanUOc2oq/osmfDF49hhGERP/w5TYMFxeeP7vYG+eBe9Bw8rvGbp3fXnWot
         sX1AG3Jbp6beokTiTBWR+Y7bbgRdP6oqTbdQTQ2uEWLpeyzVNAFIrj+mPpNkVMC7qi7x
         pdHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+MC6QVQpLVUngAf2CEordFu1TP29iYJH+Oa4Js2c0zNIzmcrBZRk6KZv0xj3dU+2d6GZfba4/sdJgpkaKMPZ/jDLuspVaQiAzhIqVYAJ6hdE=
X-Gm-Message-State: AOJu0YxCB/MSR3C2xqm0CBfJ3INrsuh8IuEgNTMMWDDgfBlqJulM5xAG
	DBkdD54OCX5Al865T1Kvgh40qn0b91HTJEG8nqfWLDR5hajIEZLJ0Q57PynLY5Y=
X-Google-Smtp-Source: AGHT+IF8eG+A/qDyy+QvlE7p4WfVNrboSKHMAxVYe01bthgvvA+JzP9CUdv9MtoWOah02cUOZUIUwQ==
X-Received: by 2002:a05:651c:b29:b0:2ef:2281:2158 with SMTP id 38308e7fff4ca-2f2b7132d7dmr27774751fa.1.1723553824007;
        Tue, 13 Aug 2024 05:57:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f47b26sm68417366b.41.2024.08.13.05.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:57:03 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:56:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/6] media: i2c: s5c73m3: Move clk_prepare to its own
 function
Message-ID: <5282172f-f8b4-4706-af30-f5bf9a2a3f8a@stanley.mountain>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240813-smatch-clock-v1-3-664c84295b1c@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_055706_416031_B039F613 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, Aug 13, 2024 at 12:13:50PM +0000, Ricardo Ribalda wrote:
> Smatch is very confused by a clk_prepare_enable() being called in an
> error-path. Fix this warning by moving the clk_prepare_enable() to its
> own function.
> 
> drivers/media/i2c/s5c73m3/s5c73m3-core.c:1425 __s5c73m3_power_off() warn: 'state->clock' from clk_prepare_enable() not released on lines: 1425.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

To be honest, maybe I should remove the clk_prepare_enable/disable() from the
check_unwind.c.  Or at least move them into their own check so that I can
tweak this kind of thing more easily.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
