Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A96EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:24:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F1460EBA
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 12:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11F1460EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tIIe7bcCv69g1Y5KzkSKuCVPEDpTuAC/QKmhneOP/b8=; b=OUg8ypWmKMn7DxkBUBFvfJkEbZ
	Au6TVlbQ8qjf1ixc8TIToKX2RkJ+XYuR1Lv8RLe7jRzDRzDHN1oJNf/TwfODV5E9Zy8L5qUS3CCFd
	Cv5xtwVTkc+oO643zL4BPRveSRK4ZSC5IJRhHiNqKJ89WePEDZ9D4KrcdIgJXX8VDGgxRRKAUFr3Y
	EPY0CyKnYixQm2AYB6DTrgnDJTIYjM4jwog/mu1GQZFUWj+s1SfrrMN6z1f6uRzhqer85L0luw9ox
	dbSo4yT7HWmCRAkSFA7Vv9wRPcv13NY3Z3ndzzugRfT9j5xZmN7RuEpP11ynuRi62n7q0ITI3Cr1b
	kcrCzu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNDff-000lbY-Jh; Mon, 06 Sep 2021 12:24:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNDfT-000lYX-9C
 for linux-amlogic@lists.infradead.org; Mon, 06 Sep 2021 12:24:09 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b6so9600429wrh.10
 for <linux-amlogic@lists.infradead.org>; Mon, 06 Sep 2021 05:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BB59IKAfrwSwSdWxafFGFhSlkLl8VbEjXjV3EpRJFr0=;
 b=WH0mSvnCL+acOmSHB5tbkeUzV72W8TU05gNSd2bsemQomgCcv1JOEOmTc0IpPWxpLR
 K5LISkLF3ij5Uxxyl4X/Yxx5j3OIQo6yYALIxkavaNoaNJhkbnzAB9vM418nrlD+lmuB
 haNq7/JnF7dRztxGthevIIMCcCddo2KPq3bPB+QWG65HIVO/+lk/bZTwE6MWtmAV4yc1
 Py3PWZrzuWQvJU12bG1mwlT5aD/Qvm+wMo6eYnxve1kMV6481OquymQAsNi8awdzNWZj
 U3+8Bgk5pCkhf6r4k9Y1ri+JjfXa5YnBY+XxEF0DDO8myxLSwTF4mgKF9TZKqefbPSwp
 GUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BB59IKAfrwSwSdWxafFGFhSlkLl8VbEjXjV3EpRJFr0=;
 b=AeCB9ikqmyLXVi9GQ9xpp3sEEAT0wVnrL4cEvMfxT1Af76m+6mjg88gZGnbASnTK+I
 uDgcY0PK8gdGU8X0pPRoArznVMfMvB3RF/4EozvqBA4rkhC/1QLqRbZse5i00uHENtL1
 iVK5Og78kjPLZs9Opo0xKt1IJhMsDFeW7ML+0iYoMisMcIPmeZ80UICQ/lVKMt8ty4r2
 J/QBwXTYGzgyq9bph63YqGCpbpFyCDWsm5O+j39SMSM82Vpwq70qKMeJutV9jfilIZpo
 CFVppgk3jLSWetkKs9ukNkj1cWMA8RnWjHK8onHu/pXoDTGgvGbWM7L3+nuZFCXOU9wX
 w8GA==
X-Gm-Message-State: AOAM532TiVNmdAKwYEdRfBYIe5CyllC6s7FnvGDItP3KG8UDgI+2xAEk
 f5SiM1+R96OBwbFdIXxmghXqiw==
X-Google-Smtp-Source: ABdhPJwU9sW7OD+Tf4zkvp4IV8JncMXHvha1k67ulucGwUQzXRfB/DmhfbDq7VAPkIanJB/wNKHnrw==
X-Received: by 2002:adf:fd51:: with SMTP id h17mr13261148wrs.178.1630931044475; 
 Mon, 06 Sep 2021 05:24:04 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:9afb:57ba:5ea:2010?
 ([2001:861:44c0:66c0:9afb:57ba:5ea:2010])
 by smtp.gmail.com with ESMTPSA id c9sm7748121wrf.77.2021.09.06.05.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:24:04 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: amlogic: add bindings for Jethub
 D1/H1
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
References: <20210904142745.183875-1-adeep@lexina.in>
 <20210904142745.183875-2-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <8541f649-0885-bc15-0bb0-ac54110ac47c@baylibre.com>
Date: Mon, 6 Sep 2021 14:24:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904142745.183875-2-adeep@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_052407_424332_7E5A47FF 
X-CRM114-Status: GOOD (  15.12  )
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

On 04/09/2021 16:27, Vyacheslav Bocharov wrote:
> JetHome is a series of home automation controllers:
> - Jethub D1 based on Amlogic A113X
> - Jethub H1 based on AmLogic S905W
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 6423377710ee..b223d7829c3d 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -86,6 +86,7 @@ properties:
>            - enum:
>                - amlogic,p281
>                - oranth,tx3-mini
> +              - jethome,jethub-j80
>            - const: amlogic,s905w
>            - const: amlogic,meson-gxl
>  
> @@ -133,6 +134,7 @@ properties:
>          items:
>            - enum:
>                - amlogic,s400
> +              - jethome,jethub-j100
>            - const: amlogic,a113d
>            - const: amlogic,meson-axg
>  
> 

Please keep review tags across patchset versions.

Acked-by: Rob Herring <robh@kernel.org>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
