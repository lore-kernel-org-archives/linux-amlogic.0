Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA61C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SG/keU4jCai4Bm3Fz9XBnxEeE9q4JxyDLZxankd9ltQ=; b=bZYfUiSvMcOC3Vt9AVdV0zDs6m
	brqX9p/D/5Og4XqRDxFoGNvJdM5EXo+gZkGzERIsG/Ugfv5Eu5+tNTQ/yKwUx6KZqwc4XKBeUYDeG
	zsxvlrzjdrval3Tjuayx15uOS2g7KJe0qDDHAx9KTlutkeGTRiTR+YHl8h8E5vUVI+kO5on91u/jz
	50RWShNwhlDOlhioksCdj67xSMm2m+AUIBQGsoHwXMwl0f3VkcjEaYKVd/hhfCvMhs2eZ9fxUxmQ5
	fU9mKKq2Llo0uNewE1Y1Y+/bh+th96a4mCSHGaJo5zmyO1D8a3jYJNK5tEOF3HtY4rZx7CqFicAsi
	2gY23m1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82Ou-006RP3-2A; Thu, 13 Jan 2022 15:52:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82Oo-006ROU-5o
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 15:52:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 s6-20020a7bc386000000b0034a89445406so1790675wmj.2
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jan 2022 07:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SgcOpXh1pxlgSzIp3XmGJm83Ks9LbrZSIgOjQSvINJQ=;
 b=Fp9xvKquNaJTX3rici5+6iSTVYL3Hs7wNSK2RAegVEBpZybov9/HTaRj0/uOLSRF5j
 m4sV9lRXCRXNQtVXf5pcgA2dBgVTXKRBfsu7plcUMDq2APkoJ54otJ5ukd2c0SpbDoZq
 R4NGRcwXnZyeKyo1lNEhfoQcE+56Z49XUy/GuwZTBQQophNDaESUQdXhhxS8BtlPzAZ0
 Ugp0sBcdCQs/ragzy9tPmE4gzgjPaEWcOnJ+L/fEIeYeFhblhR4UcWVy/A8no4V1oz39
 YoHLTK/xwBi4mg+opWnyifzxAUxmmasDx1vWf2kvuMTKrudBoTtxntb7QxQYYMAPsh11
 XchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SgcOpXh1pxlgSzIp3XmGJm83Ks9LbrZSIgOjQSvINJQ=;
 b=fS1PLcueKY5aXGLpUERnzm/DPA58ZdvV0mmSoItRGethC6Xm6Ew48QF2Scf5AFc7/V
 Tr7MCZQ2iJE1wjGaFFaFIXwc87CHEK3mn9VfDOXisOegSPQknH/AFbqBL/d/dRh1pxA1
 2c2ogXWu1/dfN0BB1pglG4bYiNalPx1t+mVAjU3wORQ+Ish9zXSRkFrft8/sIV4GdLkt
 EB+iYDRLl4ovvBiuv47vV3ikd5dDggCY1GGQukbAbCJLqA37AlYZrlve34A4XC+JeI/Q
 +Ucb/Va/bEDA8gBxehaBNxJRKHqi8BUuD20P2MBCHXH1ngPN5U55RqQ6Q1/i61/PiaX4
 8DIg==
X-Gm-Message-State: AOAM532leJ9JLNdjqpJ2SIwNJ+UYcovL9w7f/4faOl8TmpgKtvK3g4BX
 WufMmO0hROYFeRruxWSES1rlCVdPEKDgaQ==
X-Google-Smtp-Source: ABdhPJxIJlhMMRkRBs4lCyJQrSjKQdyEa7ANS0wTvwh090E2AO2Wghq3FXxFQlLu93nX5hYpEhEeSQ==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr11687718wmj.169.1642089143464; 
 Thu, 13 Jan 2022 07:52:23 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195?
 ([2001:861:44c0:66c0:bece:ab45:7469:4195])
 by smtp.gmail.com with ESMTPSA id j11sm4009125wmq.23.2022.01.13.07.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:52:22 -0800 (PST)
Subject: Re: HDMI CEC on ODROID-N2+
To: Stefan Agner <stefan@agner.ch>, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a072cbe4-f922-a98f-14d9-270fc4c72d8e@baylibre.com>
Date: Thu, 13 Jan 2022 16:52:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_075228_651291_F0062E80 
X-CRM114-Status: GOOD (  16.26  )
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


On 13/01/2022 15:36, Stefan Agner wrote:
> Hi Neil,
> 
> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
> I was unsuccessful: As far as I can tell cec-client uses the right
> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
> sub-driver"). But communication won't work, and dmesg prints timeout
> messages:
> 
> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
> 
> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
> CEC seems to work there. So it does not seem to be my hardware setup.
> 
> A quick test with the latest Linux 5.16 shows the same errors.
> 
> Do you happen to have an idea? Do you know if HDMI CEC using upstream
> kernels worked at one point on that particular platform?

I was reported it works on Yukawa 5.10 kernel, I'll have a check it still works.

Neil

> 
> --
> Stefan
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
