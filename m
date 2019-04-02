Return-Path: <SRS0=VV3g=SE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2396EC43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 04:43:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E714020663
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2019 04:43:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NzzLJkc/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ixlTkYu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E714020663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHE30aXiTxFh8UqIMXQzPzPmeZr6ycez0fZBBRbeojs=; b=NzzLJkc/RByuP0
	VWAWRBgRKBG0EFC5VBmCWCAfZd/aE2XZQ9t3z82I2QZ3UfUOI/qPjRps+KV8y7YGa4GcPP/UUkzc8
	AbG7k0R/SOzqNVMH7/S3JJOq1/DfJtFfGVrmsnQajdPUin1vPyrt9go+0j9d1LnmAF5ADuV6zUsru
	RwOkXBgGVw+gGiTCTqsLAUm3dCSQTBkAoThwC/vvIxKmq8FG6zbtCwU724GjqlCfmFkibljeqrH5w
	cgbQoMoaxSqeZVzkjusBMEIOPf6/NP5KV9zHBu8wG0pc7QptFAuEpdM0PVd2QEScB7WY+pknmdVSK
	iML8LAXpw19ofWBFhXLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBBG8-00072a-UG; Tue, 02 Apr 2019 04:42:52 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBBFz-0006ua-WB
 for linux-amlogic@lists.infradead.org; Tue, 02 Apr 2019 04:42:46 +0000
Received: by mail-pf1-x443.google.com with SMTP id 188so5693608pfd.8
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 21:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vNybugLJ1syLLEj5KhGmwpf3GcnIHGr8LT9ikdK8UC0=;
 b=ixlTkYu54L05CWEPJNPWVwpVfX7wS1IYidw9SqN5NQccYgrrO4r98yG1D14bN5q4cX
 z+t6da4DXEG/V2wR/kSTdz4va6MuvJ+vd5E1DJN8VQqY8iDxIOwUhZir5kwCB91Xzbch
 KgyMQz2+w6FXNS32pCoefOgh81g1ZpBtmMBpXkqJOEPxbURAsFnROGuAXLdjbvxpsPpY
 rLQjPnjL40UZ22c7QgAha37L4dB6DY5CtL4hSmleQgmI0Gj+SG49GZDb6xteh8HzFd39
 V1/RrYN1555u72yFOtEALYfeHsjfAnq5a/Do7gtFWulQbPlQw9cqXutVYRQwYqOACu4y
 h/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vNybugLJ1syLLEj5KhGmwpf3GcnIHGr8LT9ikdK8UC0=;
 b=QBzYZK/PYx1bRRJ+3O9MZCzgr5nBF+IVKn6+vHnxXvgbNn+xFy5SO4/+MshMiD/JPv
 qSoSO0LlaJDYlrfReXV25/zz0vTZOq05w45Xm1l25mIcaw7lA5+13qjDGIdq31m2tMsC
 Dl75OpGDwRCsNy3C1Q4yU8JqkalkGRxaI4mcovaMY1QBOWLe7XKE/RJoPWBckjqj9sYK
 HObLTZKa3Jd0bcr2KtrSDTkkVFeMKXvP8yJ+0ONb34U9mFLGbUZdO+RDaCKGPkF2mict
 5iABEB/V/4FZZMqkYnJRzAhl5AQUqB2dKF4pCpgJvwknTZc/9i99JcfKEB/+5hRRPBbC
 EcHQ==
X-Gm-Message-State: APjAAAUZlMJV3qg1CQSKyahKE17bNwGIv9ttUX72olqbW//fcm3ojFvp
 NCzMqhY4Khow8DWxyt13MsVFgg==
X-Google-Smtp-Source: APXvYqxVGbCb4xTICQnSMT55PM/u1hnp31xgbW5A6zIe070KJMy64ELVGGQ5yJOeYz+xw0rDsRH/QA==
X-Received: by 2002:aa7:8019:: with SMTP id j25mr67250575pfi.77.1554180161589; 
 Mon, 01 Apr 2019 21:42:41 -0700 (PDT)
Received: from localhost (c-67-161-37-193.hsd1.ca.comcast.net. [67.161.37.193])
 by smtp.googlemail.com with ESMTPSA id
 u62sm21665696pfa.124.2019.04.01.21.42.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 01 Apr 2019 21:42:40 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] arm64: meson-gxm: Add support for the Mali T820 GPU
In-Reply-To: <ed3ca736-0d2d-0a69-2e14-a9ed29f0cd13@baylibre.com>
References: <20190315135655.28359-1-narmstrong@baylibre.com>
 <ed3ca736-0d2d-0a69-2e14-a9ed29f0cd13@baylibre.com>
Date: Mon, 01 Apr 2019 21:42:40 -0700
Message-ID: <7hbm1puif3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_214244_252010_4211603F 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 15/03/2019 14:56, Neil Armstrong wrote:
>> This patchset adds :
>> - Optional reset properties in the midgard bindings
>> - Mali T820 Node in Amlogic Meson GXM DTSI
>> 
>> Changes since v1:
>> - Updated midgard DT wording following the recently submitted 
>>   bifrost bindings
>> 
>> Christian Hewitt (1):
>>   arm64: dts: meson-gxm: Add Mali-T820 node
>> 
>> Neil Armstrong (1):
>>   dt-bindings: gpu: mali-midgard: Add resets property
>> 
>>  .../bindings/gpu/arm,mali-midgard.txt         | 14 ++++++++++
>>  arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    | 27 +++++++++++++++++++
>>  2 files changed, 41 insertions(+)
>> 
>
> Kevin, can you take both in your tree now the bindings are reviewed ?

Yes.

Queud for v5.2 (branch: v5.2/dt64)

Thanks,

Kevin




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
