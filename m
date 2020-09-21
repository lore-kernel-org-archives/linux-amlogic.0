Return-Path: <SRS0=01f4=C6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE40FC43469
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 15:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411452075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Sep 2020 15:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B90oGg4K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="agqNsv69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411452075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eZFJnwXLAUq7A80cIBQ9Yy4QDxUX4+H8LHPvxe9Nxts=; b=B90oGg4KYQsSGXPjXBcTh2a75
	qLZAbDhQXe+6TXP5YnkMPu5vxhCAdRaoOFvYVvqJ79TI6mO7XsFhn2ZJawOw9kG3ODFSxsP9SsAcZ
	94J6aBeDugNQkcoh9JUnpxUdQlwPHnDFEi+LGNzryZ4DSkYAraYKZ6t0NBVxAdMlRFCgcWVqXQMP6
	2IEXxCSqZr6M63jw71tMVdz+eZNnty2HS81Ln6z4Jft9jD0R9f6YtOKKIoADJyBw0+xgkpjrEuIgX
	hmFHt545filq0BY+G1ERL37tOFgAfGS9wO0BAp5W/EYWnhTavXxrfdDP6vRD7g/yRA+BuTczRGWmN
	B+1nWOdHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKNN2-0004NS-Av; Mon, 21 Sep 2020 15:04:48 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKNMz-0004Ly-Js
 for linux-amlogic@lists.infradead.org; Mon, 21 Sep 2020 15:04:46 +0000
Received: by mail-pg1-x52c.google.com with SMTP id l71so9286095pge.4
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Sep 2020 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=C4nRQfx2qYF9dFDBskG/JyOe47RPw5Dquf61du0N5A8=;
 b=agqNsv691BnrvFzNyxBbpHelbarCY+MdPY8sJNs3xWPg3dBXcHJCqrpBcnoFBvpaGk
 t+9hnp0oga7Wt9JC4R8VokWxnTtBZ7rxUTcW1vxWQ2xq/psilOat09agPwjgo0Lr6+ZI
 4SVo3SG9LZh0N2NX/uidZ4EL+OXZk/u7wzcCZ0l4k2zeGZcQMD5+q+0Vhglq3vylEqcY
 QGXsdSA2MH/dV+po0pRrWoL4fD74CLimUWB6pCORYvAJdgyWUP1lb559v6F5zVdrOSAb
 +Ei/3OtGyCRkERSwUKJhD5qD2qG7ZNTDJhAAv13/+0tGGSKMGP35nqWi/SK37mPSq5QY
 FPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=C4nRQfx2qYF9dFDBskG/JyOe47RPw5Dquf61du0N5A8=;
 b=DoYBIyCI12VL3AGUYnENJ+d77cw+ZBaKqKuaz1SqBZRNxm7ED7B64QmDTT4jD7KkKg
 tSx8K6W13eVdmcRqNx6gSPdfWoUjMwibAyP77bI7R8rrChJszIOvME/Dqge/2mDy8Y9a
 qiQd/0Khr6EIaJBncwjlAiGNotYYrI7WST+2w61Hd+v9u9LLVFE06AW3A7+RRGIwsRJw
 SQ9tt+HgaujZmfHSoYw7V5n04Wa8RxAZVM5ulasI+0ZRCWFUK2hlOeqhn/5MT1BJfRMG
 w+SrHlCtKRqCqJxlRh+cnyv3KA3k2CxFqMiTCPL8TCMPtnhMi1dYUpiZQ+R1N/pLys5y
 pu5A==
X-Gm-Message-State: AOAM532+68+pIs77fCRe5zVey398lTxE29jSBXvDOXVtNJW7O3CevWcp
 Ku+akHb+XkrsAYUxrrxqGphUAQ==
X-Google-Smtp-Source: ABdhPJw871DXIKluSOo8DCgvKaAuFfj3403gaNC33ggwTlepiDipW1oSGIgho1PTVmka+2IO3LMruA==
X-Received: by 2002:a17:902:7c0c:b029:d1:f38b:713b with SMTP id
 x12-20020a1709027c0cb02900d1f38b713bmr337499pll.44.1600700681460; 
 Mon, 21 Sep 2020 08:04:41 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id k6sm12230168pfh.92.2020.09.21.08.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 08:04:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Liu Shixin <liushixin2@huawei.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH -next] rtc: meson: simplify the return expression of
 meson_vrtc_probe
In-Reply-To: <20200919100856.1639319-1-liushixin2@huawei.com>
References: <20200919100856.1639319-1-liushixin2@huawei.com>
Date: Mon, 21 Sep 2020 08:04:40 -0700
Message-ID: <7hlfh3cgs7.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_110445_703571_967E7CB4 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: linux-rtc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Liu Shixin <liushixin2@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Liu Shixin <liushixin2@huawei.com> writes:

> Simplify the return expression.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
