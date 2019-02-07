Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A96AC169C4
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:38:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12706218D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 03:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLvRA3Nd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wN//uXQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12706218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXSphINZi1BjyGm6fUZLh4dVMIjVmkAi8/pWnafyqwI=; b=GLvRA3NdVxketa
	Z72xUNYBTxzVDsoCYTK/YQBKntAIM8QMcne3JhXX7O+YHdpRRM1r/ESZ9ZrM2xvCgg+OhUdFXcfMm
	YwotgBE5yAfknxvthByN2N72aJE/GWwKjKpfPELEbv1U2Vk65PHU/O+ZzQZxQxrFYwMdUZfj7yS6h
	X5DBg7HYQrUYMhKiew/yicMGeV/C407dJTwRMyaIFgXiOyB0vYuJ/2ZoICg+HocSmlP6n/CFcwk/A
	b9VVwYa1KjNIAIAN9JSg0Ghs74c5cYE63OvkGXYrerRn8Ro8AFA9iNXjV1yIuxW/ETlxeJPk5hgKP
	Pk/fvkuNNj3VeaczOwPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1graW7-0004QU-24; Thu, 07 Feb 2019 03:38:23 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1graW3-0004Pi-Gg
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 03:38:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id u6so4136198pfh.11
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Feb 2019 19:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qPVKwWkdOw0HxFt1OwWeIr19YD5fAZm5d0n8VM5F+Dk=;
 b=wN//uXQIeaEsHN34Xq9mNNp/7Ul0iKABTqR8T4i4TmbMmatGEcUFCXLFySjNdx0KOl
 DT+7EnBQUKKJGApyFzUHyW2VGC2k2vSabJVuWu/Gxh6RQgURFrdHpDMUjk+5HFJwQKUs
 DsjV21C3gvwimHLGo960FTBCivJSg2KY/1mNB5oGV61cQYtHc4DvFxLn0+CBIyxpK1qR
 L55BEc05HJzciJsRtvmpNpDu6dvuVhCOgJznnYyxk728G4Ve/f8YKJKbXIs27oKPwvzf
 bzWE9QZZGou1h1z4ZeyJdbrFxsFUpNUPo3UUDlvGRnYJSc7OBkq3MKL4zUjnszd398ns
 smJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qPVKwWkdOw0HxFt1OwWeIr19YD5fAZm5d0n8VM5F+Dk=;
 b=tuxPjvSXJKFFY5lwSo2VjgsF3qF+eg1n2/mCi6M5VJi1pwTcb1uvCTlvy2c3VMPqR3
 //3vcgatIJVE75I0YTYZctqv1T1jKRRS8Er95YWo+QEFa4JHZY72eOBTjKtKUJq1rbBj
 Zpq4psRpwuQHzAnVQwdSEBfIrHVZEp8tTSy0+ppjqQM6GTnOW61s+8DsoerObhfHggPX
 9FL/EoKqnJAZxhpC2GUVVXD3t+2SUCyKBRMcAMgKAizHgGTkLmlt8Ro71lhlBEWTSGzE
 nT9CrOXj3NwF8VT+A3PxQiV0l1ujcne/IC3IUvvDwK1ojvsMhMFndGH/wsADujd93PRO
 8EfA==
X-Gm-Message-State: AHQUAuYkq4BrU77Y1l6LS6hSIq0NI4HTx28w7iocqCZYVZaGam3glEke
 KmREXHvcEUDj0buBvZUDD/2imw==
X-Google-Smtp-Source: AHgI3IacPVyoRuCAlG/RwTPE7m8lC1cz6Z0gXM2lt1Rjbk2NueGs9h6T7DtKd9LLZ4mhjn9S4lBtnw==
X-Received: by 2002:a63:b24a:: with SMTP id t10mr12440029pgo.223.1549510698447; 
 Wed, 06 Feb 2019 19:38:18 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id
 h185sm19574767pfg.143.2019.02.06.19.38.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 06 Feb 2019 19:38:17 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/4] soc: amlogic: clk-measure: add axg and g12a support
In-Reply-To: <bc1aa147-e08a-5bb2-9a3b-cf3dad3c0235@baylibre.com>
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <bc1aa147-e08a-5bb2-9a3b-cf3dad3c0235@baylibre.com>
Date: Wed, 06 Feb 2019 19:38:16 -0800
Message-ID: <7hwomcgtef.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_193819_558619_3C2EE8C7 
X-CRM114-Status: UNSURE (   8.55  )
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
Cc: linux-amlogic@lists.infradead.org, patchwork-bot+notify@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 18/01/2019 11:34, Jerome Brunet wrote:
>> This patchset adds support for the axg and g12a SoC family in amlogic's
>> clock measure driver and enable it on the related devices
>> 
>> Changes since v1 [0]:
>> * re-order node in the g12a.dtsi
>> * change node name
>> 
>> [0]: https://lkml.kernel.org/r/20190117164838.8008-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (4):
>>   dt-bindings: amlogic: add new compatible devices to clk_measure
>>   soc: amlogic: clk-measure: add axg and g12a support
>>   arm64: dts: meson: axg: add clk measure support
>>   arm64: dts: meson: g12a: add clk measure support
>> 
>>  .../bindings/soc/amlogic/clk-measure.txt      |   2 +
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +
>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   5 +
>>  drivers/soc/amlogic/meson-clk-measure.c       | 194 ++++++++++++++++++
>>  4 files changed, 206 insertions(+)
>> 
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.1 (branch v5.1/dt64)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
