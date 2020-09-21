Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01675C43465
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 15:06:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 922792075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 15:06:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="meWvLxOO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="i0b+v+Ue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 922792075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OtAGNRv/Co3XHhZL7dFO69CrdtYSsTyRWNHtZI4tFAA=; b=meWvLxOOnhXxLTudYELeffWPv
	HDkl15oekKeyRxZNqYZG4wVnaLoVCethOhg21grPhQjWGhFR4d68c6AW/GofN1Lv2aH3os5ekmwEL
	Psyp6wXSGYtGXt0OAOEK16Yad28jOdoKsYZhSbU79xlU64MhmvZitYE6GOvN0seE25MpaLToj/dd2
	m+AawoW64B7Ee/UoiW8ddq6D4MKu91+nH//LQP3DpwyufnfyTLsZ1fTA1AuIz9koy9Qm2hI9N18ss
	zPOK+R+8jY0HulAV4fxNJm+Z5Ozmb7INBFfXj3xdG9N1f267jmsh4IQhaYJq8YjjAaSHIso6p4ebY
	Yt1f4Z8gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKNOC-0004gb-W1; Mon, 21 Sep 2020 15:06:01 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKNNs-0004Z9-UB
 for linux-amlogic@lists.infradead.org; Mon, 21 Sep 2020 15:05:45 +0000
Received: by mail-pf1-x441.google.com with SMTP id d6so9481409pfn.9
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Sep 2020 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=E3HUZZxUSuYAIS6Josi6Etr5CwzXWiSM9WplOQE3+/4=;
 b=i0b+v+UewEFdrK1rfJXPeWfXfJmpwcAzHDpTF99JMyh8QjSsAasPCDvGEzq3W7WSrD
 Ak5HU0JiITR+UAVrXDSiFjakr2vejiRDov67kX6px9IK50hhdqix6gpZmV059no5xG/t
 PA4PgimoAfeZIs94fRHaDlASikrNScVk9Nnqa8q//9Yt2jBCJNbAgRsfiiFsoGvXOQFn
 5NYI955SXhslt17AEOq1Bfe7PDtBQ7fzEdZlEEasE0clpHKqFZKaFjsgNh+uZf+VHY3V
 ClSSS8mSUWxHFVh2B1xubgXCU2A+8S4l8hlof6A03lkItjgg6YuH5LEz4QLk5Jj7KMO6
 J1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=E3HUZZxUSuYAIS6Josi6Etr5CwzXWiSM9WplOQE3+/4=;
 b=YS5st6NlY+lbhKPPOuoQlFvGi/tCXaO802mYS6uHWld+wg420Nuy261ZawffT6QqcN
 mj24X/Az6qg7F/P0xG5VE6adASYyvsL3Qr8cytz0UXtPrBQDEb1roItKCpIyEUnXYegw
 pGB3GtK4lXeHBdoWhOPp8bgdT+Klei9q7tCMnq76pScYL8TZxUv9Kbujzw0NMF9Vs1fq
 +c6zcI2nX8xfAhiIyBQ+MVCSvRmhfZrtzWbmRqaHQ2uagBdXNNvxkUJzjh5OITvCdNZx
 3OYMA/9yGR44FQFPbN/cINGqBml2PulBUUCHiuCvHnEKS0vG7yqELa+0Pko7VnnChxAh
 s2GA==
X-Gm-Message-State: AOAM532vHh0eWEPEHyhVi3+wa+ebOXxqr+BcgRu7d13/seiV6tZPgkEJ
 MzC6xR4KAYN9MSn85x9GhwCUPg==
X-Google-Smtp-Source: ABdhPJwDNe6fpLdzsdgYvdrV+5QTOe6R7R2KkNUljRPnUIXsBAaabMQORhFBC7M+iAUC7lSP2h/v/Q==
X-Received: by 2002:a17:902:b7c4:b029:d2:173:34ba with SMTP id
 v4-20020a170902b7c4b02900d2017334bamr368738plz.57.1600700738361; 
 Mon, 21 Sep 2020 08:05:38 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 124sm12169946pfd.132.2020.09.21.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 08:05:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, lorenzo.pieralisi@arm.com,
 yue.wang@Amlogic.com, robh@kernel.org
Subject: Re: [PATCH] PCI: dwc/meson: do not fail on wait linkup timeout
In-Reply-To: <20200921074953.25289-1-narmstrong@baylibre.com>
References: <20200921074953.25289-1-narmstrong@baylibre.com>
Date: Mon, 21 Sep 2020 08:05:37 -0700
Message-ID: <7himc7cgqm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_110541_106718_EDEA7B75 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: linux-pci@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> When establish link timeouts, probe fails but the error is unrelated since
> the PCIe controller has been probed succesfully.
>
> Align with most of the other dw-pcie drivers and ignore return of
> dw_pcie_wait_for_link() in the host_init callback.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
