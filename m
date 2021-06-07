Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4CBC47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D81F610E7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 07:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D81F610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3YEhTEUxId3ukF45li6e/wbDkbawiS3uXcSaNt2UGb4=; b=HGvW4h4EQ6IETSuOSpjno4pBLi
	KwucZw7/jxvp0+/pT+kZA/ieNJFylFTMAWRelIiBPQIP/EPc4LA14fPCED9duW0/yXi/lVpzUyqY1
	R0Ci6j2hDS+rJTsBk/JAxeI9fykLYdNX0mh9y+FYUfYpYDzUrU8FmxzbrMF1y+5LCWXcg2fgUQUDK
	EVkKkBFtpKE+kWp0lNsO8OjrpGDJ4ZcozlNMI5Kd3e0x/mZ3cyze5WQQdKqEn33j4sR2E/+JE7Uit
	w5jX08JqtdvGaRP3KwSq6C0YgwiLjHlFWT4BDTGfGSmDPPXEUIbbSiKXq9EtSmCcLrI/33mmqMRuu
	LUn+h+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9Li-001uFB-Ig; Mon, 07 Jun 2021 07:07:02 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9Jf-001tQ0-4G
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 07:05:00 +0000
Received: by mail-wr1-f49.google.com with SMTP id l2so16305863wrw.6
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jun 2021 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N5+FdmS1ov7QWRtUf1NBqQlwi8g+qrI20OYrFvNTgFI=;
 b=KT5HTMznlO7nCDmmnVydpypxznSTPApslma2/j6CA6xuNHzsrxjfiQy3V2HXJ304up
 xD/6WBcpG3YqNjv2Lhu1uBtWv5WjCWdVVYEYEsrmrxkGr7JC4D6XvpB/81qIjn1NohUF
 eX1ISndmML1V/4ZCoC0RATX405XFT5eopPcmso/Q4YPB/RMyLpLjONWOuVUVgXE4e1VB
 WpOrkqVHvNC62+L4Fd8xNtGWHnOyBPOT5gxMM8Mdxhra27w3SBL0yYaasx0R9UTZzdm1
 fqEcXoRItX1w7JHuzSbzs8ZlBlssLw5D4kIDQRm6bIRPWXMHjo1IWYrtfEHgUNqKT5vI
 sLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=N5+FdmS1ov7QWRtUf1NBqQlwi8g+qrI20OYrFvNTgFI=;
 b=bRVdWPB5eycm2OnQ5ZN02PvSZ9bv5yv1Ow+XH0c09MVvqhPyo+Y7DlsQ0s/NHyZ3qz
 PVW4skzCn/QoY4Hv8HhzJJ3HxpRBUjQaxjBpYFId/X2fuP+LUtn3gKxNCQ4fXl6lkitP
 cHgusWaTM9i7cByOHgNUri49wq8EGLeOTGLhDBqEQFjIADpog76y5nhGD+qOrrnOhspE
 A4IKGwyd7sLoXJQHXnowLX2IL31JNsahr2xCbGCC3DCgVz6B5wedaE/wkqNkZqZsoGKP
 fUlL/XNc/KxYOOJRFo0bHkS07dtLUjh063KQACOahs5NsDiY/6BRjlqTu9IE3NqDOoI5
 NIMQ==
X-Gm-Message-State: AOAM533IoxHZO2EBiw3IeyFRg5JcOJVmbAFcF/XxKRLUoFs3Nz6sBOyp
 Dw8pZleSA2Y23ugB0egdloVbTw==
X-Google-Smtp-Source: ABdhPJzfDmgztfmf3PgpSCVnOGSZxZos4pCR5Pf9xgp5G5FiGHkBf+howGpsMWbnEBRsMjrZnFApCA==
X-Received: by 2002:adf:e944:: with SMTP id m4mr15308238wrn.244.1623049431529; 
 Mon, 07 Jun 2021 00:03:51 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:7c1f:1c9f:555e:7398?
 ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id b26sm16223506wmj.25.2021.06.07.00.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 00:03:50 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson: vim3l: add NNA node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 xieqinick@gmail.com
Cc: robh+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 nick@khadas.com, artem@khadas.com
References: <20210605030915.411391-1-xieqinick@gmail.com>
 <CAFBinCA+Rm3X43fT4oePS0vXphPPEZMweoM_7c0MR1ZwSbsoaQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f42f343d-0d32-bbd8-9066-17b72b69f99a@baylibre.com>
Date: Mon, 7 Jun 2021 09:03:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCA+Rm3X43fT4oePS0vXphPPEZMweoM_7c0MR1ZwSbsoaQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_000455_206300_D657D9E2 
X-CRM114-Status: GOOD (  17.03  )
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

Hi,

On 05/06/2021 11:49, Martin Blumenstingl wrote:
> Hi Nick,
> 
> On Sat, Jun 5, 2021 at 5:09 AM <xieqinick@gmail.com> wrote:
>>
>> From: Nick Xie <nick@khadas.com>
>>
>> Add Neural Network Accelerator device tree node
>> for Khadas VIM3L.
> we neither have a driver for this upstream nor any binding
> documentation in Documentation/devicetree/bindings/
> are you planning to add this?
> 
> Especially the missing binding documentation is problematic as it
> causes some warnings when validating the .dts files against the
> bindings from Documentation/devicetree/bindings/

Actually the NNA core is a verisilicon VIVANTE core, but I have no idea what is the difference
with the VIVANTE GPU cores ?

the userspace libraries & SDK shipped by Amlogic exposes OpenCL and (AFAIK) NNA over OpenCL, so I think
the HW description should be similar to the current Etnaviv bindings.

Neil

> 
> 
> Best regards,
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
