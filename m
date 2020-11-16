Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADD5C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 09:31:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F0C2224F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 09:31:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jsmK5L9w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O0HVs2oJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F0C2224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=97oDy/Gjey1mCMhWSqVJ2C4CBgRiXYAvjSro5Ume0aU=; b=jsmK5L9wtsEB5iHCr27OkOrsj
	Ze/zTJsMCcj+2pAG5y6GpQ+TIoZHgsyV3X8wEi2w8bXfxaoDDzKs3UcVTFFHWvMTzCIY8sUrAX0zq
	hUI04RcmLpbU10VD2ZyeJZGwoLXc9YPHPxW97QfwmkIIo6Ra5mDSkEu3g2hG0s5tv5+rKOMDJTNqV
	syreaP0XaDixX8JkjZ/ONvLCo9fRTy3Hk5rRhHddS/NXXo/HG/QVMn1vtxDnjwKQKcjePWFUjQkYy
	P0/WPEw2I76bbcoNxpqGkOU8OFtOU9S9huBZxaJ/NlxjX4cU2JaQYKbwaYGEFo4HTtuWxCNg6KYK8
	oJSU14opA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kearG-0003ZE-OB; Mon, 16 Nov 2020 09:31:34 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kearD-0003YL-G1
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 09:31:33 +0000
Received: by mail-wm1-x343.google.com with SMTP id m125so11683173wmm.3
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ABaEAifreU6ill0fVccYX03AsnzCT9hxJKGOUgbxzeI=;
 b=O0HVs2oJrzXTuE+InncgRAz8NbTDSF93Z6fGiS1sdH40DH8UVT4PEO0VMjPyn8TyLL
 UBvaNYAHYCeLgNKMHyeRodwvoWfOd55GQy4CI6C8eqC1hlT2oGWO0+OrDzhUpf2niu0b
 YRAIFFlMURyfAEHxQCBuquvF/chjrafyXF5y1XwueRqRLnvF/Fm7vIMirZnX2DJPL0fH
 o9uRE4f9h1EGB+2kf1u+06YHktolk9icXdArkTlzdkf8AaLRJ92godCc/3eoBvfpuvPv
 AFwaI3jAGpnp0PsPxKmykJHmRrfMlrk1k9YT+4vheJUbn1pPd9oTcX10/mkEmc9sUt6q
 2PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ABaEAifreU6ill0fVccYX03AsnzCT9hxJKGOUgbxzeI=;
 b=DDHKi+Zw9ffam9x24PSec8kJxHhBYGwDac09JD3v8XTcVMqum3W0N6Ab5RQXjsof0g
 2j7e1Wv6gtMQBfknq8bd5yW8rRoY7qT9i/wxlgHtqlAAo9tR7FuTxIkkZt3WPKlVdCe+
 CeqbMABTNL6uWqt0bBklBSaf5J3ISoFz29ddWxqW4VijNifai5BksFIZGMX3HkTnYmKC
 DYjMTK2Ok9lEVO0Vov3F61IMZljUD5jHMJI6Abx9ZYtYzs2emJZxCrUJ/2GXdAjn74yN
 aVwsAw1qjXBoUDSApwyjiXTQApByb79zKnl3B7Y19ljcBakJ7FyumBiybaOZE6Y5/zQc
 jE9w==
X-Gm-Message-State: AOAM533QLQZGxjKRE9GLKyPVX5vHNIgaxPud7clwva397jGNSwFLBHhc
 IFx9rVcxJ+kmvr2lbiuhKD54aQ==
X-Google-Smtp-Source: ABdhPJzwtiIYgFBNDHFnCilZC4CXmtssbJmayAX7j9tzX01VWZGCfdMNSZPcGwl2jImRa7SkJ+w0xA==
X-Received: by 2002:a7b:cbd7:: with SMTP id n23mr14822474wmi.142.1605519089444; 
 Mon, 16 Nov 2020 01:31:29 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:eda6:9373:9374:7214?
 ([2a01:e34:ed2f:f020:eda6:9373:9374:7214])
 by smtp.googlemail.com with ESMTPSA id n15sm22013041wrq.48.2020.11.16.01.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 01:31:28 -0800 (PST)
Subject: Re: [PATCH] thermal: amlogic: Add hwmon support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 glaroque@baylibre.com, linux-pm@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20201115190658.631578-1-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <229d2ac2-cad7-ecea-71ec-ea2f9ff5e4c9@linaro.org>
Date: Mon, 16 Nov 2020 10:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201115190658.631578-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_043131_833501_C5DE2B1E 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: rui.zhang@intel.com, amitk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTUvMTEvMjAyMCAyMDowNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBNYW55IG1v
bml0b3JpbmcgdG9vbHMgcmVhZCB0aGUgQ1BVIHRlbXBlcmF0dXJlIHVzaW5nIHRoZSBod21vbgo+
IGludGVyZmFjZS4gRXhwb3NlIHRoZSB0aGVybWFsIHNlbnNvcnMgb24gQW1sb2dpYyBib2FyZHMg
YXMgaHdtb24KPiBkZXZpY2VzLgo+IAo+IFdpdGhvdXQgdGhpcyBsbV9zZW5zb3JzJyAic2Vuc29y
cyIgdG9vbCBkb2VzIG5vdCBmaW5kIGFueSB0ZW1wZXJhdHVyZQo+IHNlbnNvcnMuIE5vdyBpdCBw
cmludHM6Cj4gICBjcHVfdGhlcm1hbC12aXJ0dWFsLTAKPiAgIEFkYXB0ZXI6IFZpcnR1YWwgZGV2
aWNlCj4gICB0ZW1wMTogICAgICAgICs0NC43IEMgIChjcml0ID0gKzExMC4wIEMpCj4gCj4gICBk
ZHJfdGhlcm1hbC12aXJ0dWFsLTAKPiAgIEFkYXB0ZXI6IFZpcnR1YWwgZGV2aWNlCj4gICB0ZW1w
MTogICAgICAgICs0NS45IEMgIChjcml0ID0gKzExMC4wIEMpCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4K
PiAtLS0KCkFwcGxpZWQsIHRoYW5rcwoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGlu
YXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGlu
YXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8
aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3Lmxp
bmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
