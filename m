Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA5A4C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 21:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A7092229C
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 21:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A7092229C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a97Y1l920KTNCRTwJ+Rc+Ixb4mbyq1ktd9kARBGTBc4=; b=aX4ZptN41tcbdgw91ibqt7Wuk
	87zduzdR3b+VPuw/Zg2+wcTvNrZxpQ+OCLZCqOlSTvY1/djWNkfTewii7IUURsaGC8gYn2Rs2JgPA
	h765Rl9W6PDZN90vhkccPQt5urOtO5IhQIHEOJWNC+eZYMj5sp4S+lflA0zFlhZ7DDKLa5xmkIEJu
	rWW/TJumYsmHdoMzQxX3kssWpACxxkh11HJmIvEZ8ywtNWCJ3rLmfbG6UZHyxsdm046eeVOFnn5wK
	BqFkyHN3/1Ypf+C8uyZcYcKfLUm7DhK9c0LIn7oDUDewr4Igs6niZaZKoqanOshgJWCVf/eSS68IL
	V4BdW6bOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktzjO-0003Jx-Ax; Mon, 28 Dec 2020 21:07:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktzjK-0003Iz-K3; Mon, 28 Dec 2020 21:07:04 +0000
Received: by mail-pj1-x102e.google.com with SMTP id v1so284140pjr.2;
 Mon, 28 Dec 2020 13:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nJ5sqR0HFrrpP8VODHPa/STLCx17P5kOSNJVjY/F3jY=;
 b=TFv8Q4oj0hrMK90UI1iMuYcnETqYM0PlOsZ2NxMBX5py+hJIR+N6BTtXlAvha5VBtZ
 tmoK6QOvCXfUr5JDtn4oToIrpPFtnVfRl2F8Z5c23c6aNxDC8n8RtPCOtWSJNEx4dfn6
 fW3lNg00KsK6OAUS77YsR78XZhLKKWzpMcNJSo7W0gVEncuJokwYIyo9gjuFwNyZ6FP4
 wPTN4AIESongPfmkyUm4vwzTS4uU4ksl5GN2dm3fqDysEoSDNM1RnF3bsWrF04YpdZNp
 LhTvD0D87HUgf9dcWeDg9dXGCKPj/2BAMm8Q+nVv2QaP6XupkMB6qNmNxBg4nQ3i9XIL
 V5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nJ5sqR0HFrrpP8VODHPa/STLCx17P5kOSNJVjY/F3jY=;
 b=cSYWRhKKb5+z7LgGKoIxx8oirRXh+eL348nKmIK5eOqI25ymhA8QE28HpiTaVXcwoP
 UAZ55SkKUOdR5CbcfJKLY4AlRUi6D9B6R08jZeqGkvvo85gIOdt8OZP8LSfky7K/b9kt
 t+yzQ5AD0TGfJVYqt0uu5c8dIeo05CbMAoUWmbWXjTWlPHTxy+hiqzQJr+HVExQRpjPq
 BXybZGXpMhwvwv+jFiflXGSpvbpDFbY7knrylEy7473Qf2eQy4x6zGSyH/LQC16yKfDb
 NI2S7iHhmGQtHJC1/FBz8nvO8DcT0uYQZ3HYcc3y7Ey6PvC0yXSXIs6SRBrTQIWXaduz
 IB7w==
X-Gm-Message-State: AOAM531NtpcyGsDgNmPx9fZNKnvp72aqeODMjoslBscUyuOA55u7oAUg
 vJjK6H4NAyL/5Y9+itko9FU=
X-Google-Smtp-Source: ABdhPJzGb5+rfvqdiTMT7ceeWIm7Jk6ra4y+shJ+cMwhcgMiGkADJf/6ute3mXb7Y0HzRaISyKOZEw==
X-Received: by 2002:a17:902:8a88:b029:dc:f3:6db2 with SMTP id
 p8-20020a1709028a88b02900dc00f36db2mr22385056plo.2.1609189618507; 
 Mon, 28 Dec 2020 13:06:58 -0800 (PST)
Received: from [10.230.29.27] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q15sm26820960pgk.11.2020.12.28.13.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Dec 2020 13:06:57 -0800 (PST)
Subject: Re: [PATCH v3 1/5] dt-bindings: net: dwmac-meson: use picoseconds for
 the RGMII RX delay
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
References: <20201223232905.2958651-1-martin.blumenstingl@googlemail.com>
 <20201223232905.2958651-2-martin.blumenstingl@googlemail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b6bfb849-3d68-59aa-1e75-201a978702f3@gmail.com>
Date: Mon, 28 Dec 2020 13:06:55 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223232905.2958651-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_160702_708398_C4ABAAC0 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: andrew@lunn.ch, jianxin.pan@amlogic.com, narmstrong@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 kuba@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 12/23/2020 3:29 PM, Martin Blumenstingl wrote:
> Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> delay register which allows picoseconds precision. Deprecate the old
> "amlogic,rx-delay-ns" in favour of the generic "rx-internal-delay-ps"
> property.
> 
> For older SoCs the only known supported values were 0ns and 2ns. The new
> SoCs have support for RGMII RX delays between 0ps and 3000ps in 200ps
> steps.
> 
> Don't carry over the description for the "rx-internal-delay-ps" property
> and inherit that from ethernet-controller.yaml instead.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
